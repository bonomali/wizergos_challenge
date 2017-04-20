**Go-Jek Testing Assignment - Problem Statement 1**

Take a website like (www.cleartrip.com)

Automate a scenario which is more like Round Trip ticket booking. 
From launching the app to doing a round trip booking to selecting a result and then entering passenger details. 
Proceed your functional scenario till you see the payment page.
 
Demo the various framework concept which you are aware of like Page factory, domain builders etc.

Use the IDE as per your convenience. 

Please use git to track the source folder, commit every 10 mins and send tar/zip the source including “. git” and send it to us. 
This is crucial to us understanding your thought process and the steps followed by you.

We would be treating code as the filter criteria for next round. Please use this opportunity to showcase your strength.

Please don’t upload the solution on any public platform like github, stackoverflow etc. 


**Approach** 

The solution to the above problem statement has been provided as a  UI Test Automation FW.
Built on rspec, ruby with rails support.
Notable Open Source Libraries used:

1. SitePrism
2. Capybara


To the run the FW locally, the system must be running on Ruby -v 2.3.1 with rvm and rails support. 


**Configuration To run locally**

1. Once on the root directory of the project, run the command `cd .`
This will create a disposable gemset which won't mess up the default gemset of the system. This has been automated using the .rvmrc file.
This file will produce a trust issue on bash and it is abosultely fine to trust the automation.
2. Run `gem install bundler -v '1.14.4'` from the root directory of project
3. Run `bundle install` from the root directory of project
4. All the user credentials required for the FW are present in the `spec/config/test_data.yml`
5. Run the all test scripts at once with the following command from the root directory of project 
`bundle exec rspec spec/features/flights/roundtrip/*.rb --format h > cleartrip_output.html`
The above command would give the output of the tests in an html format and the output will be present in the root directory of project 
6. If the tests need to be run one-at-a time, run it with the following command 
`bundle exec rspec spec/features/flights/roundtrip/roundtrip_search.rb` and 
`bundle exec rspec spec/features/flights/roundtrip/roundtrip_search_and_book.rb`
7. The FW has been configured to take screenshots on failures and will be stored in `spec/screenshots` folder in image and html format.
However they have been limited to store 20 screenshots at time. If the count increases, the folder will be successively cleared.
Keeping the screenshots for the last 20 failures at any given point of time.
8. The `spec/page_object` folder contains the page_objects for the various page and partials used in the scripts. 
This is scalable and new page_objects can be added without any other code changes to the existing FW.
9. The `spec/support/helpers` folder contains helper files which contain re-usable methods which may be used for other tests.
The methods provided here have optional parameters which make it flexible to fit into major workflows.
10. A generic Rakefile has been provided which can be scaled up so that the FW can be deployed on CI/CD environments.
