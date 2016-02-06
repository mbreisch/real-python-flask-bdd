from behave import *


@given(u'flaskr is set up')
def flask_is_setup(context):
    assert context.client and context.db


@given(u'we are not logged in')
def logout(context):
    context.page = context.client.get('/logout', follow_redirects=True)


@given(u'there are no posts')
def delete_entries(context):
    context.page=context.client.get('/delete',follow_redirects=True)


@given(u'we log in with "{username}" and "{password}"')
@when(u'we log in with "{username}" and "{password}"')
def login(context, username, password):
    context.page = context.client.post('/login',
                                       data=dict(username=username, password=password), follow_redirects=True)
    assert context.page


@when(u'we logout')
def logout(context):
    context.page = context.client.get('/logout', follow_redirects=True)
    assert context.page


@when(u'we add a new entry with "{title}" and "{text}" as the title and text')
def add(context, title, text):
    context.page = context.client.post('/add', data=dict(title=title, text=text), follow_redirects=True)
    assert context.page


@when(u'we view the index page')
def get_index(context):
    context.page = context.client.get('/', follow_redirects=True)


@then(u'we should see the alert "{message}"')
def message(context, message):
    assert message in context.page.data


@then(u'we should see the post with "{title}" and "{text}" as the title and text')
def entry(context, title, text):
    assert title and text in context.page.data


@then(u'we should see a "{code}" status code')
def code(context, code):
    assert code in str(context.page.status_code)