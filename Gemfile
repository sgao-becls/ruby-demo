source 'https://rubygems.org'

# To set up rvm for the first time:
#  rvm install jruby-9.2.20.1
#  rvm use --default jruby-9.2.20.1
#  rvm gemset create cytobank
#  bundle install
#
# To setup the environment for tomcat, run:
#  rvm use --default jruby-9.2.20.1@cytobank
# The environment will then be configured properly.
#
# To prepare to run the specs, you'll also need to install the test gems:
#  BUNDLE_IGNORE_CONFIG= bundle install
#
# To run the specs, you'll still need to disable bundler's configuration for
# this project, which only hides the test group; for example, to run the specs
# under spec/billing, run:
#  BUNDLE_IGNORE_CONFIG= RAILS_ENV=test bundle exec rspec spec/billing
#
# You might need an old version of bundler
# (http://stackoverflow.com/questions/15349869/undefined-method-source-index-for-gemmodule-nomethoderror):
#  gem update --system 1.8.25

# To configure bundler to manage the bundled gems/ directory rather than your
# local directory, first configure rvm as bove, and then set both GEM_PATH and
# GEM_HOME to the absolute path to this directory, and also prefix PATH with
# the gems/bin directory.  Then "bundle update", "bundle install", "bundle
# exec" etc. will be configured to use the bundled gems/ directory in this
# repo.  (Don't forget to remove and check-in as appropriate with "git add",
# "git rm" etc.)
#
# The rvm setup described earlier will configure tomcat to use your local
# gemset.  If you *also*, after setting up rvm, set the three environment
# variables as described in the above paragraph, then tomcat will use this
# repo's bundled gems/ directory for its gems.

# Note when updating gems: for some gems, updating them requires also replacing
# the gem's jar files in lib/.  Not *all* jar files from gems are in lib/, but
# some are.  When updating, check the diff in Gemfile.lock, search the gem's
# internal directory for jar files, and check whether there's an older version
# of the jar file (potentially with the older version as part of the jar's
# filename) in lib/, and if there is, remove the old version and replace it
# with the newer version.  The comments above each gem in this Gemfile may also
# be helpful.

# Note: when updating jruby, be sure to follow the instructions below about
# updating the gem dependencies that provide jars that tomcat needs to run
# rails: jruby-rack, and jruby-jars.
#
# Also be sure to update .ruby-version in the same directory, and changes
# also require changes outside the scope of this repository.
ruby '2.5.9'
# .rvmrc exists to suppress benign warnings from RVM due to it being unable to
# parse the above line.  Since .rvmrc, currently empty, is in place, rvm will
# skip Gemfile and read .rvmrc instead.
#
# An alternative is to disable RVM's per-project behaviour entirely by writing
# "rvm_project_rvmrc=0" to either /etc/rvmrc or ~/.rvmrc, configuring RVM to
# ignore both Gemfile and .rvmrc in all individual projects.
#
# Finally, without .rvmrc or the above configuration, the line *below* can,
# with exactly one hash, fix RVM's parsing problems, but RVM will then switch
# both the version of jruby *and* the gemset to the so-called "(default)"
# gemset, overriding whichever gemset you had been using previously, so this
# may not be an ideal solution.
##ruby=jruby-9.2.20.1

# Core gems
gem 'rails', '6.1.4.4'
gem 'rake', '12.3.2'

# jruby-rack provides jars that need to be visible to tomcat, so when upgrading
# this gem, copy the gem's jars (currently lib/jruby-rack-VER.jar)
# to /web/WEB-INF/lib.
gem 'jruby-rack', '1.1.20'
gem 'rack-cache', '1.7.0'

# As above, copy the gem's jars (lib/jruby-core-complete-VER.jar and lib/jruby-stdlib-complete.jar)
# to /web/WEB-INF/lib, or alternatively get them from JRuby's download page.
gem 'jruby-jars', '9.2.20.1'

# AWS v3
gem 'aws-sdk-s3'
gem 'aws-sdk-sqs'
gem 'aws-sdk-dynamodb'
gem 'aws-sdk-kms'

# Needs upgrading (especially prawn!)
gem 'prawn', '0.12.0' # very out of date, but needs careful attention to upgrade
gem 'stripe', '3.3.1'

# Would be great to remove
gem 'dynamic_form', '~> 1.1.4' # would be great to remove, currenty used for a few instances of 'error_messages_for'


gem 'active_model_serializers', '0.8.3'
# activerecord-jdbcmysql-adapter's jar need to be visable to tomcat so when upgrading this gem
# run `bundle pristine` to build the jar and
# copy the jar (activerecord-jdbc-adapter-VERSION-java/lib/arjdbc/jdbc/adapter_java.jar) to /web/WEB-INF/lib.
gem 'activerecord-jdbcmysql-adapter', '61.1', :platform => :jruby
gem 'activerecord-session_store', '1.1.3'
gem 'airbrake', '9.5.5', require: false
gem 'authlogic', '6.4.1'
gem 'bulk_insert', '1.9.0'
gem 'browser', '1.1.0'
gem 'concurrent-ruby'
gem 'dalli', '2.7.6'
gem 'facets', '~> 3.0.0', require: false # Subsets of this gem required in some util + preinitializer files
gem 'file-tail', '1.2.0' # This should be require: false, but some work needed to de-entagle it from file_tail.rb
gem 'haml', '5.1.1'
gem 'i18n', '1.8.7', platform: :jruby # Set version due to bug, fix pending: https://github.com/ruby-i18n/i18n/issues/555
gem 'jruby-openssl', '0.10.5'
gem 'jwt', '1.5.6'
gem 'mime-types', '~> 1.25.1'
gem 'mixpanel-ruby', '2.2.0'
gem 'nokogiri', '1.10.3'
gem 'peach', '0.5.1', require: false # Required in export_spade_pdfs_background_task.rb and gate_dao_impl_spec.rb
gem 'rack-ssl', '1.4.1'
gem 'recaptcha', '4.6.2', require: 'recaptcha/rails'
gem 'responders', '3.0.0'
gem 'rest-client', '2.0.2'
gem 'ruby-saml', '1.7.0'
gem 'sass', '3.5.1'
gem 'scrypt', '3.0.6'
gem 'sys-filesystem', '1.1.7'
gem 'uuidtools', '~> 2.1.4', require: false # Required in user_invites_controller.rb

gem 'activerecord-import', '~> 1.1.0'


group :production do
  gem 'newrelic_rpm', '6.15.0'
end


group :development do
  gem 'pry-debugger-jruby'
  gem 'puma'
  gem 'colorize'
  gem 'annotate', '2.7.5'
  gem 'brakeman', '3.5.0'
  gem 'bullet', '~> 4.14'
  # gem 'irbtools', require: 'irbtools/binding'
  # gem 'rubocop', '0.64.0' # commenting out due to causing errors "can't find parser/lexer"
  # gem 'rubocop-rspec'     # can un-comment these if you want to use them to do some linting
end


group :test do
  gem 'pry-debugger-jruby'
  gem 'colorize'
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner', '1.7.0'
  gem 'factory_bot', '5.0.2', require: false
  gem 'rspec', '~> 3.5.0'
  gem 'rspec-activemodel-mocks', '~> 1.0.3'
  gem 'rspec-rails', '~> 3.5.2'
  gem 'shoulda-matchers', '~> 2.0'
  gem 'test-unit', '3.0.1'
end
