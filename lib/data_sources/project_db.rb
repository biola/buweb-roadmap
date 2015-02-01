class ProjectDataSource < ::Nanoc::DataSource
  identifier :project

  def up
    projects = []
    Dir.glob("data/*_projects.yaml") do |filename|
      projects = projects + YAML::load(File.read(filename))["projects"]
    end
    # projects = YAML::load(File.read("data/projects.yaml"))["projects"] + YAML::load(File.read("data/cf_migration_projects.yaml"))["projects"]
    @db = {"projects" => projects}
    
  end

  def items
    @db["projects"].map do |project|
      Nanoc::Item.new(
        '',
        project,
        "/#{project['slug']}/"
      )
    end
  end

end
