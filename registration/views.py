# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
import json
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view

from registration.core.login import login_core
from registration.utility.response_utils import error_response, ok_response
from registration.utility.utility_functions import checkToken
from django.contrib.auth.models import User, Group
from rest_framework.authtoken.models import Token


@api_view(['GET'])
def ping(request):
    path1 = request.META['HTTP_HOST']
    path = path1 + request.get_full_path()
    content = {"status": "Ok",
               "Running Path": path,
               "Envirnment": os.environ['DJANGO_SETTINGS_MODULE']}
    return Response(content)


@api_view(['POST'])
def Login(request):
    if request.method == "POST":
        request_data = json.loads(request.body)

        if 'body' in request_data:
            body_data = request_data['body']
            if 'username' in body_data:
                user_name = body_data['username']
                if user_name == "":
                    return error_response(code=406, message="username value is required")

            else:
                return error_response(code=406, message="wrong username key")

            if 'password' in body_data:
                password = body_data['password']
                if password == "":
                    return error_response(code=406, message="password value is required")

            else:
                return error_response(code=406, message="wrong password key")

            login_data = login_core(user_name, password)

            return login_data
        else:
            return error_response(code=401, message="wrong body key")


@api_view(['GET'])
def Logout(request):
    if request.method == 'GET':
        try:
            token = request.META['HTTP_AUTHORIZATION']
        except Exception as e:
            print e
            return error_response(code=499, message="token not found")

        user_id = checkToken(token)
        if user_id == 0:
            return error_response(code=498, message="token not match")

        try:
            tokens = Token.objects.filter(user_id=user_id)
        except Exception as e:
            print e
            print "key error"

        if tokens.get().key == token:
            tokens.delete()

            return ok_response(message="user logged out")
        else:

            return error_response(code=498, message="token not match")
