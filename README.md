# buweb-roadmap
a nanoc project to help manage the roadmap for web projects

New to Nanoc?  See http://nanoc.ws.

## Getting Started
1. run `bundle`
2. run `bundle exec nanoc` to compile the `output` directory
3. run `bundle exec nanoc view` to start the built-in web server

## Adding/Updating Projects
Project data is stored in yaml files under `data`. 

### To add another project yaml file...
Separate projects to make them easier to manage by adding another yaml file to the `data` directory.

Add the new yaml file to the `up` method in `lib/data_source/project_db.rb`

# TO DO
1. Separate the various types of tags into separate Hashes in the yaml file(s).
2. Add deployment config
3. Get feedback on categories and teams and update accordingly.
4. Add media queries and other UI tweaks for a better mobile experience.
