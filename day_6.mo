actor {
    // Challenge 1
    type TokenIndex = Nat;
    type Error = {
        #Error1;
        #Error2;
    };

    // Challenge 2
    let registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

    // Challenge 3
    type NextTokenIndex = Nat;
    var next : NextTokenIndex = 0;
    type Result<Ok, Err> = {
        #ok : Ok;
        #err : Err;
    };

    public shared ({ caller }) func mint() : async Result<(), Text> {
        if(Principal.isAnonymous(caller)) { return #err("You need to authenticate to register!"); }
        registry.put(next, caller);
        next += 2;
        return #ok;
    };

    public func checkRegistry (): async [(Nat, Principal)] {
        return Iter.toArray<(Nat, Principal)>(registry.entries());
    };

    // Challenge 4
    public func transfer (to : Principal, tokenIndex : Nat): async Result<(), Text> {
        let check = registry.get(tokenIndex);
        switch check {
            case null return #err("tokenId does not exists");
            case (?Principal) {
                registry.put(tokenIndex, to);
                return #ok;
            };
        };
    };
};