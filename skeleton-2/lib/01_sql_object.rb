require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    # name = table_name
    arr = DBConnection.execute2(<<-SQL)
      select
        *
      from
        #{self.table_name}
    SQL

    arr.first.map { |str| str.to_sym }
  end

  def self.finalize!
    self.columns do |column|
      define_method(column) do 
        instance_variable_get("@#{column}")
      end

      define_method("#{column}=") do |val|
        instance_variable_set("@#{column}", val)
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    # ...
    # define_method(table_name) do
    #   instance_variable_get()
    # end

    @table_name ||= "#{self}".downcase.pluralize
    
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    @table_name
    # ...
  end

  def attributes
    @attributes ||= {}

    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
