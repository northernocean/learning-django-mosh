from django.shortcuts import render
from django.core.mail import send_mail, mail_admins, BadHeaderError, EmailMessage

def say_hello(request):
    try:
        #send_mail('subject', 'message', 'noreply@example.com', ['bob@example.com'])
        message = EmailMessage('subject', 'message', 'noreply@example.com', ['bob@example.com'])
        message.attach_file('playground/static/images/turtle.jpeg')
        message.send()
    except BadHeaderError:
        # send_mail can throw errors if the mail is attempted to be modified (?)
        pass
    # if email was successful - display the hello world page
    return render(request, 'hello.html', {'name': 'Mosh'})
