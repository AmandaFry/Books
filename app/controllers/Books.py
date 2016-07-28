from system.core.controller import *
from flask import Flask, flash, session, request, redirect

class Books(Controller):
    def __init__(self, action):
        super(Books, self).__init__(action)
        self.load_model('BooksModel')

    def dashboard(self):
        # need this if people just type in the dashbaord you need to be pass login to get here.
        try:
            session['id']
        except:
            return redirect ('/')
        return self.load_view('dashboard.html')

    def details(self,id):
        pass

    def addReview(self, id):
        pass
