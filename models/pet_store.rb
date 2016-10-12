require_relative('../db/sql_runner')

class PetStore

    attr_reader :id, :name, :address, :type

    def initialize (options)
        @id     = options['id'].to_i
        @name   = options['name']
        @address= options['address']
        @type   = options['type']
    end

    
end