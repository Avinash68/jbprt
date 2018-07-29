# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models


# Create your models here.

class jobSeeker(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=200)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)


class Recruiter(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=200)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)


class jobs(models.Model):
    job_id = models.AutoField(primary_key=True)
    recruter_id = models.ForeignKey(Recruiter)
    skillset = models.CharField(max_length=200)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)


class Job_Application(models.Model):
    job_id = models.ForeignKey(jobs)
    jobSeeker = models.ForeignKey(jobSeeker)
    is_active = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, null=True)
