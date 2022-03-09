module {
    
    public type List<T> = ?(T, List<T>);
    
    // Challenge 7
    public func is_null<T>(l : List<T>) : Bool {
        switch(l) {
            case(null) {
                return true;
            };
            case(?_) {
                return false;
            };
        };
    };

    // Challenge 8
    public func last<T>(l : List<T>) : ?T {
        switch(l) {
            case (null) {
                return null;
            };
            case (?(i, null)) {
                return ?i;
            };
            case (?(_, r)) {
                return last<T>(r);
            };
        };
    };

    // Challenge 9
    public func size<T>(l : List<T>) : Nat {
        func len(l : List<T>, n : Nat) : Nat {
            switch(l) {
                case (null) {
                    return n
                };
                case (?(_, t)) {
                    return len(t, n + 1);
                };
            };
        };
        len(l, 0);
    };

    // Challenge 10
    public func get<T>(l : List<T>, n: Nat) : ?T {
        switch (n, l) {
            case (_, null) {
                return null;
            };
            case (0, (?(h, t))) {
                return ?h;
            };
            case (_, (?(_, t))) {
                return get<T>(t, n - 1);
            };
        };
    };

    // Challenge 11
    public func reverse(l : List) : List {
        func rev(l : List, r: List) : List {
            switch (l) {
                case (null) {
                    return r;
                };
                case(?(h, t)) {
                    return rev(t, ?(h, r))
                };
            };
        };
        rev(l, null);
    };


}