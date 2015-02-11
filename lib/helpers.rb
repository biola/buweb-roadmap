def scheduled_projects
  projects = @items.select do |i|
    i.identifier.start_with?('/external/project/') && i[:start_date] != nil
  end
  projects.sort_by do |e|
    [ e[:start_date], e[:title] ]
  end
end

def unscheduled_projects
  projects = @items.select do |i|
    i.identifier.start_with?('/external/project/') && i[:start_date].nil?
  end
  projects.sort_by do |e|
    [ e[:title] ]
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

def start_date_label(string)
  if string
    string.strftime('%B') || "Not Scheduled"
  end
end

def project_status_label_class(status = "backlog")
  return "warning" if status.include? "backlog"
  return "success" if status.include? "in progress"
  return "default" if status.include? "done"
  return "default"
end

def projects_with_status(projects=[], status="")
  matched_projects = []
  projects.each{|p| matched_projects << p if p[:status].include? status}
  matched_projects
end

def get_summary_for(projects=[])
  effort_total = projects.collect{|p| p[:effort]}.inject(:+) || 0
  effort_completed = effort_total_by_status(projects,"done") || 0
  {
    total: projects.count,
    total_in_progress: count_by_status(projects,"in progress"),
    total_completed: count_by_status(projects,"done"),
    total_in_backlog: count_by_status(projects,"backlog"),
    effort_total: effort_total,
    effort_completed: effort_completed,
    percent_complete: (effort_completed / effort_total) * 100
  }
end

def count_by_status(projects, status="")
  projects.count{|p| p[:status].include? status}
end

def effort_total_by_status(projects, status="")
  effort_array = projects_with_status(projects,status).collect{|p| p[:effort]}
  effort_array.inject(:+)
end
