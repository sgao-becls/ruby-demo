module Mods
    PI = 3.14
    module LevelOne
        PI = 9.99
        class FooClass
            PI = 3.15
            def foo
                puts PI
                puts "Mods::LevelOne::FooClass foo method called"
            end
        end

        class PiClass
            PI = 3.16
        end

        class WatClass < PiClass
            #PI = 3.33
            def wat
                puts PI
                puts "Mods::LevelOne::WatClass wat method called"
            end
            def self.inspect_nesting

                puts Module.nesting.inspect
                puts PI
            end
        end

        def bar
            puts "Mods::LevelOne instance bar method called"
        end

        def self.tue
            puts "Mods::LevelOne tue method called"
        end
    end

    def bar
        puts "Mods instance bar method called"
    end
end