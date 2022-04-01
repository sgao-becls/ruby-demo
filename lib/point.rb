module Foo
    def foo 
        p 'foo from module Foo'
    end

    def show(something='world')
        p "We are showing #{something} from module Foo"
    end
end

module Show
    def show(something='world')
        p "We are showing #{something} from module Show"
    end

    def time
        p Time.now
    end 

    def self.add(p1, p2)
        p1 + p2
    end
end

class BasePoint
    @@base_id = 100

    def base_group
        p 'my base group'
    end

    def self.minusone
        @@base_id -= 1
    end
end

class AbstractPoint < BasePoint
    $x = 10
    @@id=1

    ENV = "local"

    def group(x, y)
        p "group point [#{@x},#{@y}], ID = #{@@id}"
    end

    def self.addone
        @@id += 1
    end
end

class Point < AbstractPoint
    include Foo
    include Show
   

    def initialize(x=0, y=0)
      @x, @y = x, y
    end

    class << self
        def hello(name='world')
            p "hello #{name}"
        end
    end

    def to_s
        "[#{@x},#{@y}] - #{@@id} - #{@@base_id}"
    end

end

class << Point
    def hackx
        p 'hack x'
    end
end

def Point.hack
    p 'hack from the outside of class Point'
end

class Apple
    def show
        $x += 2
    end
end