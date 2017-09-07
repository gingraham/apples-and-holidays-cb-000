require 'pry'

def second_supply_for_fourth_of_july(holiday_supplies)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_supplies, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies.each do |k,v|
    v.each do |k,v|
      v.push(supply)
    end
  end
end


def add_supply_to_memorial_day(holiday_supplies, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_supplies.each do |k,v|
    v.each do |k,v|
      v.push(supply)
    end
  end
end

def add_new_holiday_with_supplies(holiday_supplies, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_supplies[season][holiday_name] = supply_array
 holiday_supplies
end

def all_winter_holiday_supplies(holiday_supplies)
  # return an array of all of the supplies that are used in the winter season
  all_items = []
   holiday_supplies[:winter].collect do |supply|
    supply.each do |items|
       if holiday_supplies[:winter][items] != nil
         all_items.concat(holiday_supplies[:winter][items])
       end
    end
   end
   all_items
end

def all_supplies_in_holidays(holiday_supplies)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_supplies.collect do |season, v|
    puts "#{season.capitalize}:"
    v.collect do |holiday, items|
      puts "  #{holiday.to_s.gsub("_", " ").split.map(&:capitalize).join(' ')}: #{items.join(", ")}"
    end
  end

end

def all_holidays_with_bbq(holiday_supplies)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holiday = []
    holiday_supplies.each do |season, v|
      v.each do |holiday, items|
        if items.include?("BBQ")
          bbq_holiday << holiday
        end
      end
    end
    bbq_holiday
end
