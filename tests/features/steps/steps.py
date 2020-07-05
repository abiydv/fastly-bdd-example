from behave import *
import requests

@given(u'I am a {useragent}')
def step_impl(context,useragent):
    if "bot" in useragent:
        context.useragent = useragent 
    else:
        context.useragent = "pybehave"

@given(u'I visit {url}')
def step_impl(context,url):
    headers = {'User-Agent': context.useragent}
    context.resp = requests.get(url, headers=headers, allow_redirects=False, verify=False )
    print("response_headers :"+str(context.resp.headers))

@then(u'Response is redirect')
def step_impl(context):
    assert context.resp.is_redirect

@then(u'Response reason is {resp_reason}')
def step_impl(context,resp_reason):
    print("response_reason : "+context.resp.reason)
    assert context.resp.reason == resp_reason

@then(u'Status code is {resp_status}')
def step_impl(context,resp_status):
    print("response_status : "+str(context.resp.status_code))
    assert context.resp.status_code == int(resp_status)

@then(u'Redirected url is {resp_url}')
def step_impl(context,resp_url):
    print("response_url : "+context.resp.headers['Location'])
    assert context.resp.headers['Location'] == resp_url
