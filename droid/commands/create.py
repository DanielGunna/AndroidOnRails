"""The create command used to create android project."""


from json import dumps

from .base import Base

class Create(Base):

    def run(self):
        print('Creating your Android project')
        print('You supplied the following options:', dumps(self.options, indent=2, sort_keys=True))
