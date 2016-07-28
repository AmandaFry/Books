from system.core.model import Model
from flask import Flask, flash, session
from datetime import datetime
import re

NOSPACE_REGEX = re.compile(r'^[a-zA-Z0-9]*$')

class BooksModel(Model):
    def __init__(self):
        super(BooksModel, self).__init__()
 
