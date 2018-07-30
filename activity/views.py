# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
import json
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from registration.models import *
from registration.utility.response_utils import ok_response
from registration.core.login import login_core
from registration.utility.response_utils import error_response, ok_response
from registration.utility.utility_functions import checkToken
from django.contrib.auth.models import User, Group
from django.db.models import Q

from rest_framework.authtoken.models import Token


@api_view(['POST'])
def AddJobs(request):
    if request.method == 'POST':
        request_data = json.loads(request.body)

        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")

        group_name = Group.objects.filter(user=user_id)

        if str(group_name[0]) not in ['rct']:
            return error_response(code=406, message="access denied")
        if 'body' in request_data:
            body_data = request_data['body']
            req_skill_set = body_data['req_skill_set']
            jobtitle = body_data['jobtitle']
            job_description = body_data['job_description']
            req_exp = body_data['req_exp']
            company_name = body_data['company_name']
            default = dict(jobtitle=jobtitle,
                           job_description=job_description,
                           req_exp=req_exp,
                           company_name=company_name)
            obj, created = Jobs.objects.update_or_create(recruiter_id_id=user_id,
                                                         req_skill_set=req_skill_set,
                                                         is_active=True,
                                                         defaults=default)
            if created:
                return ok_response(message="job add succesfully")
            if obj and not created:
                return ok_response(message="job add alreday")
            else:
                return error_response(code=406, message="please try again")
        else:
            return error_response(code=401, message="json key error")


@api_view(['POST'])
def ViewJobs(request):
    if request.method == 'POST':
        request_data = json.loads(request.body)

        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")

        if 'body' in request_data:
            body_data = request_data['body']
            req_skill_set = body_data['req_skill_set']
            jobtitle = body_data['jobtitle']
            jobs = Jobs.objects.filter(Q(jobtitle=jobtitle) or
                                       Q(req_skill_set=req_skill_set),
                                       is_active=True).values("jobtitle",
                                                              "req_skill_set",
                                                              "job_id",
                                                              "job_description",
                                                              "req_exp",
                                                              "is_active",
                                                              "company_name",
                                                              "recruiter_id")
            if jobs:
                return ok_response(data=jobs)
            else:
                return error_response(code=406, message="no jobs")
        else:
            return error_response(code=401, message="json key error")


@api_view(['POST'])
def ApplyJobs(request):
    if request.method == 'POST':
        request_data = json.loads(request.body)

        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")
        group_name = Group.objects.filter(user=user_id)
        if str(group_name[0]) not in ['js']:
            return error_response(code=406, message="access denied")
        if 'body' in request_data:
            body_data = request_data['body']
            job_id = body_data['job_id']
            job = Jobs.objects.filter(job_id=job_id).first()
            if job:
                obj, created = Job_Applications.objects.get_or_create(job_id_id=job.job_id, jobSeeker_id=user_id)
                if created:
                    return ok_response(message="apply successfully")
                elif obj and not created:
                    return error_response(code=406, message="already apply")
            else:
                return error_response(message="invalid job")
        else:
            return error_response(code=401, message="json key error")


@api_view(['GET'])
def ViewAppln(request):
    if request.method == 'GET':
        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")
        group_name = Group.objects.filter(user=user_id)
        if str(group_name[0]) not in ['rct']:
            return error_response(code=406, message="access denied")
        jobs = Jobs.objects.filter(recruiter_id_id=user_id)
        main_list = []
        for job in jobs:
            applications = Job_Applications.objects.filter(job_id_id=job.job_id)
            for application in applications:
                main_dict = dict(name=None, job_id=None, skill_set=None,
                                 qualification=None, other_info=None)
                main_dict['name'] = application.jobSeeker.jobseeker.name
                main_dict['skill_set'] = application.jobSeeker.jobseeker.skill_set
                main_dict['qualification'] = application.jobSeeker.jobseeker.qualification
                main_dict['other_info'] = application.jobSeeker.jobseeker.other_info
                main_dict['job_id'] = job.job_id

                main_list.append(main_dict)

        if len(main_list) == 0:
            return error_response(message="no application")

        else:
            return ok_response(data=main_list)


@api_view(['POST'])
def RemoveJob(request):
    if request.method == 'POST':
        request_data = json.loads(request.body)

        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")
        group_name = Group.objects.filter(user=user_id)
        if str(group_name[0]) not in ['rct']:
            return error_response(code=406, message="access denied")
        if 'body' in request_data:
            body_data = request_data['body']
            job_id = body_data['job_id']
            job = Jobs.objects.filter(job_id=job_id, is_active=True).first()
            if job:
                job.is_active = False
                job.save()
                return ok_response(message="job remove succesfully")
            else:
                return error_response(message="invalid request")
