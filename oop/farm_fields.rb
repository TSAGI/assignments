class Fields
    @@all_fields = []    
    @current_field = {}
    attr_accessor :type, :food_per_hectare, :area, :total_food

    def initialize(type, food_per_hectare, area)        
        @type = type
        @food_per_hectare = food_per_hectare        
        @area = area
    end

    def self.harvest        
       fields = @@all_fields.map {|field| { type: field[:type] }}
       fields.uniq!       
       puts "Total Food Collected:"
       for f in fields
            total_harvest = 0
            @@all_fields.each { |field| 
                if field[:type] == f[:type]
                    total_harvest += field[:total_food]
                end }           
            f.each {|k,v| puts "#{v}: #{total_harvest}"}
        end
        puts
    end

    def self.relax
        @@all_fields.each {|field| 
            field.each {|k,v|puts "#{k}: #{v}"}
            puts
        }
    end

    def self.status
        x = @@all_fields.length        
        if x > 0
            puts "You have #{x} fields. Which one do you want to examine?"
            print "Pick a number from 1 to #{x}: "
            num = gets.chomp.to_i
            @@all_fields[num].each {|k,v| puts "#{k}: #{v}"}
            puts
        else
            puts "You don't have any fields to examine yet."
            puts
        end        
    end

    def self.create(type, food_per_hectare, area)
        new_field = Fields.new(type, food_per_hectare, area)
        @current_field = {:type => type, :area => area, 
            :total_food => (area * food_per_hectare)}
        @@all_fields << @current_field
        return new_field
    end

    def self.add
        print "What type of crop will you be planting: "
        type = gets.chomp
        print "How many hectares is your field: "
        area = gets.chomp.to_i
        print "How much food per hectare will your crop produce: "
        food_per_hectare = gets.chomp.to_i
        puts
        Fields.create(type, food_per_hectare, area)
    end

    def self.menu
        while true
            puts "1. Add a field"
            puts "2. Check status of a field"
            puts "3. Relax and look at all fields"
            puts "4. Harvest all fields"
            puts "0. Exit"
            print "Enter a number: "
            choice = gets.chomp.to_i
            puts
            case choice
                when 1 then Fields.add
                when 2 then Fields.status
                when 3 then Fields.relax
                when 4 then Fields.harvest
                when 0 then exit
            end
        end
    end
end

Fields.menu
