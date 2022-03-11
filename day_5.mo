import Array "mo:base/Array";
import Hashmap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";

actor {

    // Challenge 1
    public shared({caller}) func is_anonymous() : async Bool {
        // return Principal.isAnonymous(caller);
        return false;
    };

    // Challenge 2
    let favoriteNumber : Hashmap.HashMap<Principal, Nat> = Hashmap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // Challenge 3
    public shared({caller}) func add_favorite_number(n: Nat) {
        favoriteNumber.put(caller, n);
    };

    public shared({caller}) func show_favorite_number() : async ?Nat {
        return favoriteNumber.get(caller);
    };

    // Challenge 4
    public shared({caller}) func _add_favorite_number(n: Nat) : async Text {
        switch(favoriteNumber.get(caller)) {
            case(null) {
                favoriteNumber.put(caller, n);
                return "You've successfully registered your number";
            };
            case(_exists) {
                return "You've already registered your number";
            };
        };
    };

    // Challenge 5
    public shared({caller}) func update_favorite_number(n: Nat) {
        return favoriteNumber.put(caller, n);
    };

    public shared({caller}) func delete_favorite_number() {
        return favoriteNumber.delete(caller);
    };

    // Challenge 6 (Not working correctly);
    let PAY_CYCLES : Nat = 100_000_000;
    public func deposit_cycles() : async Nat {
        return (Cycles.accept(PAY_CYCLES));
    };

    public func get_balance() : async Nat {
        return (Cycles.balance());
    };

    public func get_available() : async Nat {
        return (Cycles.available());
    };

    // Challenge 7


    // Challenge 8
    stable var counter : Nat = 0;
    stable var _v : Nat = 0;

    public func increment_counter(n: Nat) : async Nat {
        counter += n;
        return counter;
    };

    public func clear_counter() : async Text {
        counter := 0;
        return "Counter is set to initial value: 0";
    };

    public query func getCurrentCounter() : async Nat {
        counter;
    };

    public query func getVersionNumber() : async Nat {
        _v;
    }

    system func preupgrade() {
        // Logic before upgrade
        _v += 1;
    };

    // Challenge 9


};