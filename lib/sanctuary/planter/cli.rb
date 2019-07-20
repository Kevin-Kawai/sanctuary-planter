require "sanctuary"

module Sanctuary
  module Planter
    class CLI
      def self.start
        if ARGV.include?("-i")
          File.open(ARGV[1]) do |f|
           f.each_line do |line|
             if line[1..4] == "TYPE"
               puts "generating #{line.split(":")[1]}"
               Sanctuary::Generator.start([line.split(":")[1].chomp])
             end
           end
         end
        else
          puts "NO SUCH INPUT"
        end
      end
    end
  end
end