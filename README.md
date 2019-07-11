# Backbase Tech Test by Edward Rothwell

####Project for uploading and sharing backbase tech test.

Manual test cases can be found in **test_case.xlsx**
Bugs can be found in **bugs.xlsx**

Automated Tests have been written in Cucumber/Ruby using Capybara. 
Cucumber was chosen as it allows human readable scenarios and steps so non-technical people can run tests or view test results and understand what is being tested. These almost mimic and if not do better than the manual test cases in that they can check more thoroughly.

Ruby was used as this is a familiar to myself, and is commonly used for testing. It's versatile enough to be used in many different scenarios such as API or UI testing.

Capybara makes interacting with web elements very easily and works seemlessly with site-prisms POM.

Rubocop is running with default linting rules. These also run on commit to prevent bad code being pushed.

As an extra I added some API checks for bad API response checking.

Results are found in the report.html

You may be able to speed up tests by commenting out line 10 in hooks.rb, but this is not recommended.

Any problems accessing the repo let me know.

##### Expected Test Failures due to bugs
See feature file for more info.
```
cucumber features/feature_files/pagination.feature:15 # Scenario: Pagination works as expected when results are filtered
cucumber features/feature_files/sort_computers.feature:15 # Scenario Outline: Sort columns descending/ascending, Examples (#1)
cucumber features/feature_files/sort_computers.feature:16 # Scenario Outline: Sort columns descending/ascending, Examples (#2)
cucumber features/feature_files/sort_computers.feature:17 # Scenario Outline: Sort columns descending/ascending, Examples (#3)
```

##### Test failures that may occur if test page is in use by others
```cucumber features/feature_files/add_computer.feature: # Scenario Outline: Computers can be created with all companies```

##### Disables Tests due to bug that would allow computer to remain in table
Searching with certain symbolic input doesn't work.

```cucumber features/feature_files/search_computer.feature:15 # Scenario Outline: Searching computer entries returns correct results, Examples (#3)```
```cucumber features/feature_files/add_computer.feature:36 # Scenario Outline: Creating computer entries with non-standard name entries, Examples (#3)```



### Test repository

Clone repo:
```git clone https://github.com/Llewhtor/backbase_tech_test.git```


### Mac Setup

I had no access to a mac to test this, it's all done from memory and google... Any trouble let me know.

Install homebrew:
```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

Install brew doctor:
```brew doctor```

Install brew cask:
```brew install caskroom/cask/brew-cask```

Install gnupg:
```brew install gnupg```

Add mpapis public key:
```
gpg --keyserver hkp://keys.gnupg.net
    --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```

Install RVM:
```\curl -sSL https://get.rvm.io | bash -s stable --ruby```

Get ruby 2.5.5:
```rvm install 2.5.5```

Set ruby 2.5.5 as active ruby version:
```rvm use 2.5.5```

Install bundler:
```gem install bundler```

Install Gems:
```bundle install```
- do nut run update or you may get problems as the Gemfile.lock has the working gems that this was written on. 

### Windows setup

install ruby 2.5.5:
```https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.5.5-1/rubyinstaller-devkit-2.5.5-1-x64.exe```

Install bundler:
```gem install bundler```

Install Gems:
```bundle install```
- do nut run update or you may get problems as the Gemfile.lock has the working gems that this was written on. 

Install ANSICON 1.31 or higher:
```http://adoxa.altervista.org/ansicon/```

### Running Tests

To run all tests execute the following in cmd or terminal:
```cucumber -p default```

To run specific tags execute the following in cmd or terminal:
```cucumber -p default -t @tagname```
