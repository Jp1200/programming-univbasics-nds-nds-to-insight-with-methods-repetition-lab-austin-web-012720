$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
    director_list = []
    index = 0 
    while index < source.length do 
      director_list << source[index][:name]
      index += 1 
    end 
    return director_list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  index = 0 
  total = 0 
  names_of_director = list_of_directors(source)
  while index < names_of_director.length do 
    gross_of_director = directors_totals(source)
   # pp gross_of_director
     total += gross_of_director[names_of_director[index]]
   #  pp names_of_director
    index += 1 
  end
  return total 
    
end


