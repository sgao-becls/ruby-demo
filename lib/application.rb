require './foo'
require File.dirname(__FILE__) + '/mods'

class Application
    include Mods::LevelOne

    def self.main(args=[])
        f = Mods::LevelOne::FooClass.new
        f.foo
        fo = Foo.new
        fo.foo

        Mods::LevelOne::tue

        watc = Mods::LevelOne::WatClass.new
        watc.wat
    end

    def my_bar
        bar
    end
end

Application.main
