require 'chronic'

class ProjectDataSource < ::Nanoc::DataSource
  identifier :project

  def up
    projects = []
    Dir.glob("data/*projects.yaml") do |filename|
      projects = projects + YAML::load(File.read(filename))["projects"]
    end
    # projects = YAML::load(File.read("data/projects.yaml"))["projects"] + YAML::load(File.read("data/cf_migration_projects.yaml"))["projects"]
    @db = {"projects" => projects}
    
  end

  def items
    @db["projects"].map do |project|
      # parse time fields
      project["start_date"] = Chronic.parse(project["start_date"])
      project["effort"] = project["effort"] || 2
      # create Nanoc item
      Nanoc::Item.new(
        '',
        project,
        "/#{project['slug']}/"
      )
    end
  end

end
