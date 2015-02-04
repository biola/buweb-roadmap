def sorted_projects
  projects = @items.select do |i|
    i.identifier.start_with?('/external/project/')
  end
  projects.sort_by do |e|
    [ e[:start_date], e[:title] ]
  end
end

def project_tag_classes(values=[])
  classes = []
  unless values.nil?
    values.each do |tag|
      classes << "category-#{tag.gsub(/[^a-z0-9\-_]+/, "-")}"
    end
  end
  return classes
end

def project_status_classes(values=[])
  classes = []
  unless values.nil?
    values.each do |tag|
      classes << "status-#{tag.gsub(/[^a-z0-9\-_]+/, "-")}"
    end
  end
  return classes
end

def project_skillset_classes(values=[])
  classes = []
  unless values.nil?
    values.each do |tag|
      classes << "skillsets-#{tag.gsub(/[^a-z0-9\-_]+/, "-")}"
    end
  end
  return classes
end
