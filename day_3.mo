import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import List "mo:base/List";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Bool "mo:base/Bool";
import Blob "mo:base/Blob";

actor {
    // Challenge 1
    private func swap(a: [var Nat], j: Nat, i: Nat) : [var Nat] {
        let swap = a[j];
        a[j] := a[i];
        a[i] := swap;

        return a;
    };

    // Challenge 2
    public func init_count(n: Nat) : async [Nat] {
        return Array.tabulate<Nat>(n, func(_n : Nat) : Nat { return _n });
    };

    // Challenge 3
    public func seven(a: [Nat]) : async Text {
        if (Array.find<Nat>(a, func (n : Nat) : Bool {
            if (n == 7) {
                return true;
            } else {
                return false;
            };
        }) != null) {
            return "Seven is found";
        };
        return "Seven not found";
    };

    // Challenge 4
     public func nat_opt_to_nat(n: ?Nat, m: Nat) : async ?Nat {
        if (n == null) {
            return ?m;
        };
        return n;
    };

    // Challenge 5
    public func day_of_the_week(n: Nat) : async ?Text {
        let days : [Text] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
        if (n > 0 and n < 8) {
            return ?days[n - 1];
        } else {
            return null;
        };
    };

    // Challenge 6
    public func populate_array(a: [?Nat]) : async [Nat] {
        return Array.map<?Nat, Nat>(a, func(i : ?Nat) : Nat {
            switch(i) {
                case(null) { return 0 };
                case(?e) { return e };
            };
        });
    };

    // Challenge 7
    public func sum_of_array(a: [Nat]) : async Nat {
        return Array.foldLeft<Nat, Nat>(a, 0, func(acc, x) { acc + x });
    };

    // Challenge 8
    public func squared_array(a: [Nat]) : async [Nat] {
        return Array.map<Nat, Nat>(a, func(i : Nat) : Nat {
            i ** 2;
        });
    };

    // Challenge 9
    public func increase_by_index(a: [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(a, func(v, i) : Nat {
            v + i;
        });
    };

    // Challenge 10
    private func contains<A>(xs: [A], a: A, f : (A, A) -> Bool) : Bool {
        for (x in xs.vals()) {
            if (x == a) {
                return true;
            };
        };
        return false;
    };
};