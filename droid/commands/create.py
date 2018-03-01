"""The create command used to create android project."""


from json import dumps

from .base import Base
import subprocess
import os


class Create(Base):

    """Create android project"""
    def call_create_script():
        p = subprocess.Popen(
            ['./create_project.sh MainActivity '
             + self.options['<pkg_name>'] +' '
             +self.options['<sdk_target>']+' '
             +self.options['<project_name>']],
             shell=True,
             cwd=os.getcwd() + '/commands/shell/',
             stdout=subprocess.PIPE,
             stderr=subprocess.STDOUT,
              executable='/bin/sh'
        )
        for line in p.stdout.readlines():
            print line
        p.wait()

        
    def run(self):
        print('Creating your Android project')
        call_create_script()
        print('Creating your Android project')
