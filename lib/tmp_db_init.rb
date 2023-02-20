require_relative 'db_initializer.rb'
while true
  begin
      # block where exception raise
      DBInitialiser.initialise_DB

    rescue
      # block where exception rescue
      next
end
end
