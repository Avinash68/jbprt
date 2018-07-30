from registration.models import JobSeeker, Recruiter
from registration.utility.response_utils import error_response, ok_response
from django.contrib.auth.models import User, Group
from django.contrib import auth
from rest_framework.authtoken.models import Token


def login_core(username, password):
    username = User.objects.filter(username=username, is_active=True).first()
    if username:
        group_name = Group.objects.filter(user=username).first()
    else:
        return error_response(code=406, message="invalid username")

    dataDict = dict(token=None, name=None, skillset=None, qualification=None, group=group_name, other_info=None
                    )
    if username:
        if auth.authenticate(username=username, password=password):
            token, created = Token.objects.get_or_create(user=username)
            dataDict["token"] = token.key
            dataDict["group"] = str(group_name)

            if str(group_name) in ["js"]:
                jbs = JobSeeker.objects.filter(user=username.id, is_active=1).first()
                if jbs:
                    dataDict["name"] = jbs.name
                    dataDict["skillset"] = jbs.skill_set
                    dataDict["other_info"] = jbs.other_info
                    dataDict["qualification"] = jbs.qualification
                else:
                    return error_response(code=406, message="data not exist")

            elif str(group_name) in ["rct"]:
                rct = Recruiter.objects.filter(user=username.id, is_active=1).first()
                if rct:

                    dataDict["name"] = rct.name
                    dataDict["skillset"] = rct.skill_set
                    dataDict["other_info"] = rct.other_info
                    dataDict["qualification"] = rct.qualification
                else:
                    return error_response(code=406, message="data not exist")
            else:
                return ok_response(data=dataDict)
            return ok_response(data=dataDict)

        else:
            return error_response(code=406, message="wrong password")
    else:
        return error_response(code=406, message="wrong username")
