require "sanctuary"

module Sanctuary
  module Planter
    class CLI
      def self.start
        if ARGV.include?("-i")
          File.open(ARGV[1]) do |f|
           f.each_line do |line|
             if line[1..4] == "TYPE"
               puts "generating #{line.split("TYPE:").last.split(" ")[0]} as #{line.split("NAME:").last}"
               Sanctuary::Generator.start([line.split("TYPE:")[1].split(" ")[0].lstrip.chomp, line.split("NAME:").last.chomp])
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