
LTI2 -- Ruby/Rails reference implementation
==============
__John Tibbetts, Integration Architect, Vital Source Technologies__

This is an LTI2 reference implementation.  A reference implementation is one that is intended to demonstrate working code based on an emerging standard.  However implementation provides than just exemplary code.  In 
addition, it fulfills the following responsibilities:

* It implements both sides of the LTI convesation; that is, Tool Consumer (often an LMS) and Tool Provider.  These two components will work (out-of-the-box) with one another.  Or the Tool Consumer can be aimed at an external Tool Provider (possibly in development) to test it.  Or the Tool Provider can be addressed by an external Tool Consumer (possibly in development) to test it.

* As new facilities, messages, or services are added to LTI2 they will be added to this reference model.  The intent is to add them in while they are still in development so that the LTI Services Task Force can see them in early operation.

* The actual LTI-specific TC and TP functionality are implemented as Rails moountable engines.  A mountable engine is a type of gem that is used for creating a Rails 'sub-application'; that is, an application within an application.  Each mountable engine has its own models, controller, etc.  Common behavior of both engines is abstracted into a third gem: lti2-commons.  A consequence of using this design modularity is that either one or both engines can also be mounted in real working production code.  In particular, the Vital Source BusinessCenter incorporates the Tool Consumer engine to provide launches appropriate for viewing e-textbooks.  It also incorporates the Tool Provider to allow new interactive e-textbooks to launch out of the book into other LTI tools, either provided by Vital Source, the book publisher, or anyone else.

* The reference implementation contains sample applications that can either be run under sqlite3 or MySQL.  Sample data is provided for each type of database.

For all the details of LTI, see the full [LTI2 online docs](http://www.imsglobal.org/lti/index.html).



Prerequisites
-------------
* Ruby/Rails.
Follow online docs to install Ruby/Rails for your development platform.  This code should run on any Ruby/Rails version written in recent years.

* Github identity.  During the prototype period (pre-conformance test) this must be sent to Lisa Mattson )Lisa Mattson (lisa@imsglobal.org) all access to the repos.

* With a valid Github identity, clone this repo.

* This code has been tested with either MySQL or sqlite.  The default database load instructions will work for either of these databases. They would likely work with virtually any other Rails-compatible database.


Structure of this repository
-----------------------------
The repository structure is as follows:

	LTI2--
		|
		|
		--closet			(database backups, common scripts, metadata artifacts)
		|
		|
		--lti2_tc   		(tool consumer engine)
		|
		|
		--lti2_tp			(tool provider engine)
		|
		|
		--lti2_commons		(library used by both TC and TP)
		|
		|
		--tc_sample_app		(lightweight TC host based on active_admin gem)
		|
		|˙
		--tp_sample_app		(lightweight TP and tool)
		

Getting it running
==================

1. Clone the repo onto your machine.  

2. Create a command prompt for the tool consumer.  chdir into <lti_repo>/tc_sample_app.  

3. [FIRST-TIME ONLY after clone of TC] 'rake init_task:backup'.  This will reset data to base state and ensure that sqlite3 is the current database.  (Instructions below for changing to MySQL.  Recommend running it first as sqlite3).

4. Start a rails server for the Tool Consumer on port 4000: 'rails s -p 4000'.

5. Create a command prompt for the tool provider.  chdir into <lti_repo>/tp_sample_app.

6. [FIRST-TIME ONLY after clone of TP] 'rake init_task:backup'.  This will reset data to base state and ensure that sqlite3 is the current database.  (Instructions below for changing to MySQL.  Recommend running it first as sqlite3).

7. Start a rails server for the Tool Provider on port 5000: 'rails s -p 5000'.

8. Open a browser and go to: 'http://localhost:4000/admin'.  If you're prompted for a login, username is 'admin@lumos.org', password is 'password'.

9. Note: from here on you can see this tool used at: [LTI2 webcast](https://www.youtube.com/watch?v=3zTbtTldeiA "LTI2 webcast").

10. Dashboard: 'Admin Functions' -> 'Register New Tool'.  Enter: 'http://localhost:5000/lti2_tp/registrations'.

11. This will invoke an LTI2 Registration request to the Tool Provider.  The screen with title Fabericious is the Tool Provider's dialog to gather information.  The only action is to add some unique string to the end of the 'Institution name'.  For example, put in the time 1113.  Doing this ensures it can be run repeatedly, since duplicate subsequent entries would be rejected if the value didn't change.  Click the "Update" button.

12. This should return you to the Tool Actions page of the Tool Consumer.  Click on the "[enable now]" link in the column 'Enabled?'.  This will activate the newly registered tool.

13. Return to admin menu.  Click 'My Courses'.  Pick SMPL101A.  Links to a number of resources (within the single tool) are available.  Try 'Echo' to see the Tool Provider's log of the LTI parameters.  Try other resources as you like.

14. Return to Admin.  'Admin Functions' --> 'Show Wirelog'.  This will display a structured log with messages emanating from the Tool Consumer left-adjusted and messages emanating from the Tool Provider center-adjusted.







Changing your database configuration
------------------------

__NOTE WELL: Default database choice has changed!  It is now sqlite3, not MySQL__

sqlite3 is built in and the data is prebuilt in github.  This means that the TC and TP can be checked out and immediately run with no database prep.

If you'd prefer to use MySQL it's easy to switch.  

* To change the TC to MySQL, edit lti_tc/config/database.yml. To change the TP to MySQL, edit lti_tp/config/database.yml.  These are entirely independent.  There is no requirement that they use the same database configuration.

* Follow the TC- or TP-appropriate instructions in the sections below.  For a MySQL database you'll need to load the database from the /backups directory.



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


Resetting the data
------------------
[in directory lti2_tp]

1. Terminate (ctrl-C) the process if it's running
2. rake db:load
3. restart (i.e., 'rails s -p 5000)


