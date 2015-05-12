
LTI2 Gem -- Ruby/Rails reference implementation
==============
__John Tibbetts, Integration Architect, Vital Source Technologies__

> #### Note the LTI2 gem and sample apps have been signficantly reorganized!  The sample apps have been removed!
> #### The LTI2-Reference repo only contains the revised LTI2 gem
> #### The LTI2_tc_sample_app repo contains the Tool Consumer sample app
> #### The LTI2_tp_sample_app repo contains the Tool Provider sample app


This is Vital Source's LTI2 implementation.  VST uses this code primarily as a Tool Provider.  However there's also a Tool Consumer here that we've used for early testing (even before there were any LTI2 TCs).  In addition we use the Tool Consumer for brokered LTI launches.  This is used, say, in an interactive book that has been launched by an external Tool Consumer but contains dynamic pages within the book that, in turn, launch other LTI tools.

* It implements both sides of the LTI convesation; that is, Tool Consumer (often an LMS) and Tool Provider.  These two components will work (out-of-the-box) with one another.  Or the Tool Consumer can be aimed at an external Tool Provider (possibly in development) to test it.  Or the Tool Provider can be addressed by an external Tool Consumer (possibly in development) to test it.

* As new facilities, messages, or services are added to LTI2 they will be added to this reference model.  The intent is to add them in while they are still in development so that the LTI Services Task Force can see them in early operation.

* The actual LTI-specific TC and TP functionality are implemented as Rails mountable engines.  A mountable engine is a type of gem that is used for creating a Rails 'sub-application'; that is, an application within an application.  Each mountable engine has its own models, controller, etc.  Both of these engines are embedded in the single parent gem.  Common behavior of both engines is abstracted into the /lib folder.  A consequence of using this design modularity is that either one or both engines can also be mounted in real working production code.  In particular, the Vital Source BusinessCenter incorporates the Tool Consumer engine to provide launches appropriate for viewing e-textbooks.  It also incorporates the Tool Provider to allow new interactive e-textbooks to launch out of the book into other LTI tools, either provided by Vital Source, the book publisher, or anyone else.

* The reference implementation contains sample applications that can either be run under sqlite3 or MySQL.  Sample data is provided for each type of database.

For all the details of LTI, see the full [LTI2 online docs](http://www.imsglobal.org/lti/index.html).



Prerequisites
-------------

* Ruby/Rails.  Follow online docs to install Ruby/Rails for your development platform.  This code is currently built on Ruby 1.9.3.

* This code is in a github Vital Source public repo 'LTI2-Reference'.  Clone it in a work directory.

* If you wish to use the sample Tool Consumer, clone 'LTI2_tc_sample_app.  Then bundle.

* If you wish to use the sample Tool Provider, clone 'LTI2_tp_sample_app.  Then bundle.

* This code has been tested with either MySQL or sqlite.  The default database load instructions will work for either of these databases. They would likely work with virtually any other Rails-compatible database.

		

Getting it running
==================

1. Follow instructions above for cloning and building the three repos.

2. Create a command prompt for the tool consumer.  chdir into <your_repo>/LTI2_tc_sample_app.  

3. [FIRST-TIME ONLY after clone of TC] 'rake init_task:backup'.  This will reset data to base state and ensure that sqlite3 is the current database.  (Instructions below for changing to MySQL.  Recommend running it first as sqlite3).

4. Start a rails server for the Tool Consumer on port 4000: 'rails s -p 4000'.

5. Create a command prompt for the tool provider.  chdir into <your_repo>/LTI2_tp_sample_app.

6. [FIRST-TIME ONLY after clone of TP] 'rake init_task:backup'.  This will reset data to base state and ensure that sqlite3 is the current database.  (Instructions below for changing to MySQL.  Recommend running it first as sqlite3).

7. Start a rails server for the Tool Provider on port 5000: 'rails s -p 5000'.

8. Open a browser and go to: 'http://localhost:4000/admin'.  If you're prompted for a login, username is 'admin@lumos.org', password is 'password'.

9. Note: from here on you can see this tool used at: [LTI2 webcast](https://www.youtube.com/watch?v=3zTbtTldeiA "LTI2 webcast").

10. Dashboard: 'Admin Functions' -> 'Register New Tool'.  Enter: 'http://localhost:5000/lti2_tp/registrations'.

11. This will invoke an LTI2 Registration request to the Tool Provider.  The screen with title Fabericious is the Tool Provider's dialog to gather information.  The only action is to add some unique string to the end of the 'Institution name'.  For example, put in the time 1113.  Doing this ensures it can be run repeatedly, since duplicate subsequent entries would be rejected if the value didn't change.  Click the "Update" button.

12. This should return you to the Tool Actions page of the Tool Consumer.  Click on the "[enable now]" link in the column 'Enabled?'.  This will activate the newly registered tool.

13. Return to admin menu.  Click 'My Courses'.  Pick SMPL101A.  Links to a number of resources (within the single tool) are available.  Try 'Echo' to see the Tool Provider's log of the LTI parameters.  Try other resources as you like.

14. Return to Admin.  'Admin Functions' --> 'Show Wirelog'.  This will display a structured log with messages emanating from the Tool Consumer left-adjusted and messages emanating from the Tool Provider center-adjusted.

Resetting the data
------------------

After running the demo, the data can be reset to its base state (eliminating any current registrations, links, etc.).  To reset the data for the Tool Consumer:

1. Stop the server in the TC directory. 
2. rake db:seed
3. Restart the server

The procedure is identical for the Tool Provider, except perform the operations in the TP directory.

Changing your database configuration
=============================

__NOTE WELL: Default database choice has changed!  It is now sqlite3, not MySQL__

__NOTE WELL: Both the TC and TP registries table has a base URL setting named tc_deployment_url and tp_deployment_url, respectively.  Make sure these contain reasonable values for your environment.  'localhost' is handy for testing locally, but since these values are passed to their partners they may need to contain environment-specific, external URLs__

sqlite3 is built in and the data is prebuilt in github.  This means that the TC and TP can be checked out and immediately run with no database prep.

If you'd prefer to use MySQL it's easy to switch.  

* To change the TC to MySQL, edit lti_tc/config/database.yml. To change the TP to MySQL, edit lti_tp/config/database.yml.  These are entirely independent.  There is no requirement that they use the same database configuration.

* Follow the TC- or TP-appropriate instructions in the sections below.  For a MySQL database you'll need to load the database from the /backups directory.

* There is no requirement that the TC and the TP need to use the same database configuration.  e.g. The TC might be using sqlite3 and the TP mysql.

It's also possible to switch database configurations with a command line option rather than hard-wiring the choice using database.yml.  To accomplish this use the -e option on the relevant rails command.

For example:

* Start the TC server with mysql: rails s -p 4000 -e mysql

* Start the TP server with sqlite: rails s -p 5000 -e sqlite3

If using this method remember to apply these same environments to rake tasks:

For example:

* Reseed the mysql database: RAILS_ENV=mysql rake db:seed

* Reseed the sqlite3 database: RAILS_ENV=sqlite3 rake db:seed


Setting up MySQL databases
-----------------------

_If you choose a MySQL Database for TC_  

1. Create the 'Lumos' database.
2. Allow Lumos access to user: 'ltiuser' with password 'ltipswd'.
3. Initialize the database: mysql Lumos -u ltiuser -p < backup/lti2_tc.sql

_If you choose a MySQL Database for TP__ 

1. Create the 'fabericious' database.
2. Allow fabericious access to user: 'ltiuser' with password 'ltipswd'.
3. mysql fabericious -u ltiuser -p < backup/lti2_tp.sql

Using the Tool Consumer Engine with another host application
=========================================
As described above, this distribution uses tc_sample_app as a pseudo LMS.  All of the LTI-specific behavior is mounted into this app using the Rails mountable engine capability.  To use this same engine in another host application the following steps need to be followed.

1. The Gemfile of the host application should access the gem from VST github by including the line:
	* gem 'lti2_tc', :github => 'vitalsource/lti2_tc'

2. At a rails command-line in the host, import the TC engine migrations into the db migrations of the host:
	* rake lti2_tc:install:migrations
	
3. In the host application's routes.rb, specify the mount point of the TC engine:
	* mount Lti2Tc::Engine, :at => '/lti2_tc'
	
4. Implement the host responsibilities of the engine.  The can be seen in exemplary code in the tc_sample_app.
	* In the database table 'lti2_tc_registries': modify the tc_deployment_url to the base URL of your server.
	* In the database table 'lti2_tc_registries': look for the field tool_consumer_profile_template.  This is
	  the tool_consumer_profile that your TC will serve.  Modify it to suit.
	* Implement a user experience to gather a Tool Provider ToolRegistration.  cf. tc_sample_app/app/admin/deployment_requests.rb in member_action :request_product.
	* Once the tool is registered it needs to be enabled.  Set up a UX to display tools and tool status.  Cf. tc_sample_app/app/admin/tool_actions.rb.  Enabling (or disabling) the tool is performed by changing 'is_enabled'.  cf. 'toggle' behavior in 'tool_actions'.
	* Set up 'resolver' methods (Visitor pattern) in course, user, grade_result.  These are invoked by the callbacks in app/services/LtiLaunch.
	
Using the Tool Provider Engine with another host application
=========================================
As described above, this distribution uses tp_sample_app as a pseudo tool provider.  All of the LTI-specific behavior is mounted into this app using the Rails mountable engine capability.  To use this same engine in another host application the following steps need to be followed.

1. The Gemfile of the host application should access the gem from VST github by including the line:
	* gem 'lti2_tp', :github => 'vitalsource/lti2_tp'

2. At a rails command-line in the host, import the TP engine migrations into the db migrations of the host:
	* rake lti2_tp:install:migrations
	
3. In the host application's routes.rb, specify the mount point of the TP engine:
	* mount Lti2Tp::Engine, :at => '/lti2_tp'
	
4. Implement the host responsibilities of the engine:
	* [to be added]
	




  

