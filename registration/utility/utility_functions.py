from rest_framework.authtoken.models import Token
from pytz import timezone


def checkToken(user_token):
    try:
        user_id = Token.objects.get(key=user_token).user_id
    except Exception as e:
        print e
        return 0
    return user_id


def convert_ist(data):
    if data:
        if data.tzname() == 'UTC':
            return data.astimezone(timezone('Asia/Kolkata')).date()
        else:
            return data.astimezone(timezone('Asia/Kolkata')).date()
    else:
        return data.date()
