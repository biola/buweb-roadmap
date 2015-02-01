def sorted_projects
  projects = @items.select do |i|
    i.identifier.start_with?('/external/project/')
  end
  projects.sort_by do |e|
    [ e[:start_date], e[:title] ]
  end
end

def project_tag_classes(tags=[])
  classes = []
  tags.each do |tag|
    classes << "category-#{tag.gsub(/[^a-z0-9\-_]+/, "-")}"
  end
  return classes
end
