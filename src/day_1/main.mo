import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {

    // Challenge 1
    public func add(n: Nat, m: Nat) : async Nat {
        return n + m;
    };

    // Challenge 2
    public func square(n: Nat) : async Nat {
        return n * n;
    };

    // Challenge 3
    public func days_to_second(n: Nat) : async Nat {
        return n * 24 * 60 * 60;
    };

    // Challenge 4
    var counter : Nat = 0;
    public func increment_counter(n: Nat) : async Nat {
        counter += n;
        return counter;
    };

    public func clear_counter() : async Nat {
        counter := 0;
        return counter;
    };

    // Challenge 5
    public func divide(n: Nat, m: Nat) : async Bool {
        if (n == 0) {
            return false;
        };

        return m % n == 0;
    };

    // Challenge 6
    public func is_even(n: Nat) : async Bool {
        return n % 2 == 0;
    };

    // Challenge 7
    public func sum_of_array(n: [Nat]) : async Nat {
        var sum: Nat = 0;
        for (val in n.vals()) {
            sum += val;
        };
        return sum;
    };

    // Challenge 8
    public func maximum(n: [Nat]) : async Nat {
        var max: Nat = 0;
        for (val in n.vals()) {
            if (val > max) {
                max := val;
            };
        };
        return max;
    };

    // Challenge 9
    public func remove_from_array(a: [Nat], n: Nat) : async [Nat] {
        return Array.filter(a, func (v: Nat) : Bool {
            return v != n;
        });
    };

    // Challenge 10
    public func selection_sort(n: [Nat]) : async [Nat] {
        return Array.sort(n, Nat.compare);
    };


};
