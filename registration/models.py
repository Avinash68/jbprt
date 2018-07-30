# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models


class JobSeeker(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=200, default=None)
    skill_set = models.CharField(max_length=200, default=None)
    qualification = models.CharField(max_length=200, default=None)
    other_info = models.CharField(max_length=200, default=None)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)

    def __unicode__(self):
        return u'%s' % self.name

class Recruiter(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=200, default=None)
    skill_set = models.CharField(max_length=200, default=None)
    qualification = models.CharField(max_length=200, default=None)
    company_name = models.CharField(max_length=200, default=None)
    other_info = models.CharField(max_length=200)

    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)

    def __unicode__(self):
        return u'%s' % self.name


class Jobs(models.Model):
    job_id = models.AutoField(primary_key=True)
    recruiter_id = models.ForeignKey(Recruiter)
    req_skill_set = models.CharField(max_length=200, default=None)
    jobtitle = models.CharField(max_length=200, default=None)
    job_description = models.CharField(max_length=200, default=None)
    req_exp = models.CharField(max_length=200, default=None)
    company_name = models.CharField(max_length=200, default=None)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)

    def __unicode__(self):
        return u'%s' % self.job_id


class Job_Applications(models.Model):
    job_id = models.ForeignKey(Jobs)
    jobSeeker = models.ForeignKey(User)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)

    def __unicode__(self):
        return u'%s' % self.job_id
