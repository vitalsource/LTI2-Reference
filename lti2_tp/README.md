LTI2 -- Tool Provider
=====================

lti2_tp implements Fabericious, a skeletal an LTI2-compatible tool provider.  

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

Install lti2_tp
---------------
1. git clone git@github.com:IMSGlobal/lti2_tp.git
2. gem install bundler
3. cd lti2_tp
4. bundle install
5. rails s -p 5000

Resetting the data
------------------
[in directory lti2_tp]
1. Terminate (ctrl-C) the process if it's running
2. rake db:load
3. restart (i.e., 'rails s -p 5000)

Database Initialization (only used if MySQL replaces Sqlite)
---------------------
1. Create the 'Fabericious' database.
2. Allow Lumos access to user: 'ltiuser' with password 'ltipswd'.
3. mysql Lumus -u ltiuser -p < data/lti2_tp.sql


<<todo: database.yml changes>>