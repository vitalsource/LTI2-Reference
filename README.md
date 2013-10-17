LTI2 -- Reference Implementation
==============

This is the LTI2 reference implementation.  To be able to show full working LTI2 interactions this reference implementation needs to create both ends of an LTI2 conversation.  Therefore, this implementation provides both an LTI2 Tool Consumer and an LTI2 Tool Provider.

For all the details, see the full [LTI2 online docs](http://www.imsglobal.org/lti/index.html).

This reference implementation is written in the Ruby language under the Rails web framework. 

__NOTE WELL: Default database choice has changed!  It is now sqlite3, not MySQL__
sqlite3 is built in and the data is prebuilt in github.  This means that the TC and TP can be checked out and immediately run with no database prep.

If you'd prefer to use MySQL it's easy to switch.  

* To change the TC to MySQL, edit lti_tc/config/database.yml. To change the TP to MySQL, edit lti_tp/config/database.yml.  These are entirely independent.  There is no requirement that they use the same database configuration.

* Follow the TC- or TP-appropriate instructions in the sections below.  For a MySQL database you'll need to load the database from the /backups directory.


Prerequisites
-------------
* Ruby/Rails.
Follow online docs to install Ruby/Rails for your development platform.  This code should run on any Ruby/Rails version written in recent years.

* Github identity.  During the prototype period (pre-conformance test) this must be sent to Lisa Mattson )Lisa Mattson (lisa@imsglobal.org) all access to the repos.

* With a valid Github identity, 'git clone git@github.com:IMSGlobal/lti2_reference.git'.

* This code has been tested with either MySQL or sqlite.  The default database load instructions will work for either of these databases. They would likely work with virtually any other Rails-compatible database.


Structure of this repository
-----------------------------
The repository structure is as follows:

	lti2_repository
		|
		|
		--lti2_tc   		(tool consumer)
		|
		|
		--lti2_tp			(tool provider)
		|
		|
		--lti2_commons		(library used by both TC and TP)


Setting up your database (unless default sqlite3 is used)
---------------------------------------------------------



LTI2 -- Tool Consumer
=====================

lti2_tc implements Lumos, a skeletal Learning Management System with LTI2 capability.  Lumos capabilities include:

lti2-tc uses LTI to invoke various resources in a tool provided by the lti2_tp.

lti2_commons implements functions common to both tool consumer and tool provider.


Install lti2_tc
---------------
1. git clone git@github.com:IMSGlobal/lti2_tc.git
2. gem install bundler
3. cd lti2_tc
4. bundle install
5. rails s -p 4000

If you choose a MySQL Database  
---------------------
1. Create the 'Lumos' database.
2. Allow Lumos access to user: 'ltiuser' with password 'ltipswd'.
3. Initialize the database: mysql Lumos -u ltiuser -p < backup/lti2_tc.sql

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


LTI2 -- Tool Provider
=====================

lti2_tp implements Fabericious, a skeletal an LTI2-compatible tool provider.  

lti2_commons implements functions common to both tool consumer and tool provider.


Install lti2_tp
---------------
1. git clone git@github.com:IMSGlobal/lti2_tp.git
2. gem install bundler
3. cd lti2_tp
4. bundle install
5. rails s -p 5000

If you choose a MySQL Database 
---------------------
1. Create the 'fabericious' database.
2. Allow fabericious access to user: 'ltiuser' with password 'ltipswd'.
3. mysql fabericious -u ltiuser -p < backup/lti2_tp.sql

Running lti2_tp
---------------
http://localhost:5000/admin
Login credentials: admin@lumos.org / password		(literally: 'password')


Resetting the data
------------------
[in directory lti2_tp]

1. Terminate (ctrl-C) the process if it's running
2. rake db:load
3. restart (i.e., 'rails s -p 5000)


