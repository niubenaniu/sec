# Create your views here.
from django.core.context_processors import csrf
from django.http import HttpResponse
from  django.shortcuts  import  render_to_response


def index(request):
    return render_to_response('index.html')
def upload(request):
    c = {}
    c.update(csrf(request))
    return render_to_response('index.html',c)
