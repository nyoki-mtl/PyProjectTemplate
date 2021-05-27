from setuptools import setup, find_packages

if __name__ == '__main__':
    setup(
        name='myproject',
        description='Template for python project.',
        author='Hiroki Taniai',
        author_email='charmer.popopo@gmail.com',
        packages=find_packages(include=['src']),
    )
