class ProjectDataSource < ::Nanoc::DataSource
  identifier :project

  def up
    projects = YAML::load(File.read("data/projects.yaml"))["projects"] + YAML::load(File.read("data/cf_migration_projects.yaml"))["projects"]
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
