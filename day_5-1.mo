import Hashmap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";

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

    system func preupgrade() {
        favoriteNumberEntries := Iter.toArray(favoriteNumber.entries());
    };

    system func postupgrade() {
        favoriteNumberEntries := [];
    };
}