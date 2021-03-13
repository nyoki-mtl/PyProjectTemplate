from setuptools import setup, find_packages
from torch.utils.cpp_extension import BuildExtension

if __name__ == '__main__':
    setup(
        name='myproject',
        description='Template for python project.',
        author='Hiroki Taniai',
        author_email='charmer.popopo@gmail.com',
        packages=find_packages(include=['src']),
        cmdclass={'build_ext': BuildExtension},
    )
