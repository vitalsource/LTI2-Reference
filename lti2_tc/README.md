LTI2 -- Tool Consumer
=====================

lti2_tc implements Lumos, a skeletal Learning Management System with LTI2 capability.  Lumos capabilities include:

lti2-tc uses LTI to invoke various resources in a tool provided by the lti2_tp.

lti2_commons implements functions common to both tool consumer and tool provider.

Prerequisites
-------------
* Ruby/Rails
	* If you need to install, try "curl -L https://get.rvm.io | bash -s stable --rails"
	* (or wget if you don't use curl)
* Github identity.  During the prototype period (pre-conformance test) this must be sent to Lisa Mattson )Lisa Mattson (lisa@imsglobal.org) all access to the repos.

Option
======
* MySQL .. database ships ready-to-run with Sqlite builtin.  But conversion to MySQL
is easy and initial data is provided.

Install lti2_tc
---------------
1. git clone git@github.com:IMSGlobal/lti2_tc.git
2. gem install bundler
3. cd lti2_tc
4. bundle install
5. rails s -p 4000

Running lti2_tc
---------------
http://localhost:4000/admin
Login credentials: admin@lumos.org / password		(literally: 'password')

To Register a new Tool Provider, use the following Registration URL:
http://localhost:5000/deployment_proposals

Resetting the data
------------------
[in directory lti2_tc]
1. Terminate (ctrl-C) the process if it's running
2. rake db:load
3. restart (i.e., 'rails s -p 4000)


Switching to MySQL
==================

Database Initialization (only used if MySQL replaces Sqlite)
---------------------
1. Create the 'Lumos' database.
2. Allow Lumos access to user: 'ltiuser' with password 'ltipswd'.
3. mysql Lumus -u ltiuser -p < data/lti2_tc.sql

<<todo: database.yml changes>>