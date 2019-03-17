# README
David McVicar submission to Kipu code challenge.

to run:

1. clone repo
2. bundle
3. bundle exec rake db:create db:migrate db:seed
4. rails s
5. in browser: localhost:3000
6. select patient on search page
7. template should render

Notes:
- app/lib/mustache_parser.rb has the mustache language parser.
- app/helpers/admissions_helper.rb has the template_field helper method used in summary template
- template_field.rb model holds mustache expressions.  Each facility can have a custom set of template_fields that
  are referenced from the admissions/index.html.erb.
- Bootstrap 4 gem was used for Rails 5 ease of install.  But I believe the classes are compatibile with Bootstrap 3



