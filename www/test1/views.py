# Create your views here.
from django.http import HttpResponse


def index(request):
    return HttpResponse('OK!')
def test(request):
    print '\n'
    return HttpResponse(request.META)
    print '\n'

