class Fields
    @@all_fields = []    
    @current_field = {}
    attr_accessor :type, :food_per_hectare, :area, :total_food

    def initialize(type, food_per_hectare, area)        
        @type = type
        @food_per_hectare = food_per_hectare        
        @area = area
    end

    #this method collects food from every one of your farm fields and 
    #records how much total food you have collected, in this format(example):
    #Total Food Collected:
    #corn: 2000
    #beans: 3000
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

    #this method lists each farm field with it's type, area, and harvest
    #(which I called total_food, because I already have a harvest method)
    def self.relax
        @@all_fields.each {|field| 
            field.each {|k,v|puts "#{k}: #{v}"}
            puts
        }
    end

    #this method prompts the user for a number, and then uses that 
    #number to find the index in the array where the farm field is located 
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

    #this method creates a new farm field, which is stored in hash format,
    #and then added to an array.
    def self.create(type, food_per_hectare, area)
        new_field = Fields.new(type, food_per_hectare, area)
        @current_field = {:type => type, :area => area, 
            :total_food => (area * food_per_hectare)}
        @@all_fields << @current_field
        return new_field
    end

    #this method asks the user to input the variables that will be used
    #to create a new farm field.
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
