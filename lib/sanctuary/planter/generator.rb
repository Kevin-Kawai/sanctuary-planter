require "sanctuary"

module Sanctuary
  module Planter
    module Generator
      def self.generate_file_from_plant(plant)
        home_dir = Sanctuary::HOME_DIR
        template_file = IO.read(home_dir + "/" + plant.plant_template)
        template = ERB.new(template_file, nil, '-%<>')
        local_binding = binding
        local_binding.local_variable_set(:name, plant.name)
        local_binding.local_variable_set(:fields, plant.fields)
        local_binding.local_variable_set(:methods, plant.methods)
        puts "Generated #{plant.name}"
        File.open(plant.name + "." + plant.plant_template.split("/").last.split(".")[1], "w") do |f|
          f.write(template.result(local_binding))
        end
      end
    end
  end
end
