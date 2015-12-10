#!/usr/bin/env python
# -*- coding: utf-8 -*-

import TicketHelpdesk

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

version = TicketHelpdesk.__version__
readme = open('README.rst').read()
history = open('HISTORY.rst').read().replace('.. :changelog:', '')
install_requirements = open(
    'requirements/requirements_production.txt').read().splitlines()

setup(
    name='TicketHelpdesk',
    version=version,
    description="""Helpdesk app for Django/Mezzanine project""",
    long_description=readme + '\n\n' + history,
    author='Abdikarim Hassan',
    author_email='21304298@student.uwl.ac.uk',
    url='https://github.com/TicketHelpdesk/TicketHelpdesk',
    packages=[
        'TicketHelpdesk',
    ],
    include_package_data=True,
    install_requires=install_requirements,
    license="BSD",
    zip_safe=False,
    keywords='TicketHelpdesk',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Web Environment',
        'Framework :: Django :: 1.7',
        'Framework :: Django :: 1.8',
        'Intended Audience :: Customer Service',
        'Intended Audience :: Developers',
        'Intended Audience :: Information Technology',
        'License :: OSI Approved :: BSD License',
        'Natural Language :: English',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: WSGI',
        'Topic :: Internet :: WWW/HTTP :: WSGI :: Application',
    ],
)
