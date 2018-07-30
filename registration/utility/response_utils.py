from rest_framework.response import Response

headers_mapping = {"csv": {"content-type": "application/csv"},
                   "json": {"content-type": "application/json"}}


def ok_response(data={}, status=True, code=200, message="ok", headers='json'):
    my_data = {"data": data, "message": message, "status": status}
    return Response(data=my_data, status=code, content_type=headers_mapping[headers])


def error_response(data={}, code=401, status=False, message="error", headers='json'):
    my_data = {"data": data, "message": message, "status": False}
    return Response(data=my_data, status=code, content_type=headers_mapping[headers])


def isNum(data):
    try:
        int(data)
        return True
    except ValueError:
        return False
