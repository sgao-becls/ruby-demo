class TokenRequest

    attr_reader :token

    def +(b)
        puts b
    end

    alias plus +

    def remember(t)
        self.token = t
        puts token
    end

    def set(t)
        @token = t
    end

    def foo(num, b1, b2)
        p num
        b1.call(num)
        b2.call(num)
        num
    end

    def bar(&b)
        a = [1 , 2, 3, 4, 5, 6]
        b.call a
        yield a
        yield a
        a
    end
end


