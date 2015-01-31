class ProjectDataSource < ::Nanoc::DataSource
  identifier :project

  def up
    @db = YAML::load(File.read("data/projects.yaml"))
  end

  def items
    @db["projects"].map do |project|
      Nanoc::Item.new(
        '',
        project,
        "/projects/#{project['slug']}/"
      )
    end
  end

end
