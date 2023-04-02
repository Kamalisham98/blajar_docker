# Adds draw method into Rails routing
# It allows us to keep routing split into files
class ActionDispatch::Routing::Mapper
  def draw(route_file_path)
    instance_eval(File.read(Rails.root.join("config/routes/#{route_file_path}.rb")))
  end
end
