#!/usr/bin/env ruby

require 'csv'

NOT_FOUND = "<Not Found>"

class People

  def initialize(file)
    @ids = {}
    @names = {}
    @values = {}

    options = {:headers => true, :header_converters => :symbol}
    @data = CSV.foreach(file, options).map { |r| r.to_h }
    @data.each_with_index do |o, i|
      @ids[o[:id]] = i
      @names[o[:name]] = i
      @values[o[:value]] = [] unless @values.has_key?(o[:value])
      @values[o[:value]] << i
    end
  end

  def with_id(id)
    @ids.has_key?(id.to_s) ?  @data[@ids[id.to_s]] : NOT_FOUND
  end

  def with_name(name)
    @names.has_key?(name) ? @data[@names[name]] : NOT_FOUND
  end

  def with_value(value)
    return NOT_FOUND unless @values.has_key?(value.to_s)
    @values[value.to_s].map {|i| @data[i]}
  end

end

e = People.new('people.csv')
puts e.with_id(2)
puts e.with_name('Jane Doe')
puts e.with_name('John Doe')
puts e.with_value(40)

__END__

{:id=>"2", :name=>"Paul Jons", :value=>"30"}
{:id=>"1", :name=>"Jane Doe", :value=>"50"}
<Not Found>
{:id=>"0", :name=>"John Smith", :value=>"40"}
{:id=>"5", :name=>"Biff Henderson", :value=>"40"}
