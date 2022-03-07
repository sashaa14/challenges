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
    public func nat_to_nat8(n: Nat) : async Nat8 {
        if ( n > 255 ) { return 0 };
        return Nat8.fromNat(n);
    };

    // Challenge 2
    public func max_number_with_n_bits(n: Nat) : async Text {
        // Formula to get the maximum number M = 2^n - 1
        return Nat.toText(2 ** n - 1);
    };

    // Challenge 3
    public func decimal_to_bits(n: Nat) : async Text {
        var bits: Text = "";
        var num: Nat = n;

        while ( num > 0 ) {
            bits := Nat.toText(num % 2) # bits;
            num := num / 2;
        };

        return bits;
    };

    // Challlenge 4
    public func capitalize_character(c: Char) : async Char {
        var char: Char = c;

        if (Char.isLowercase(char)) {
            char := Char.fromNat32(Char.toNat32(char) - 32);
            return char;
        };

        return char;
    };

    // Challenge 5
    public func capitalize_text(t: Text) : async Text {
        var caps: Text = "";

        for (char in t.chars()) {
            if (Char.isLowercase(char)) {
                caps := caps # Char.toText(Char.fromNat32(Char.toNat32(char) - 32));
            } else {
                caps := caps # Char.toText(char);
            };
        };

        return caps;
    };

    // Challenge 6
    public func is_inside(t: Text, c: Char) : async Bool {
        // Below version is case sensitive
        // Improved => implement capitalize_text function
        return Text.contains(t, #text (Char.toText(c)));
    };

    // Challenge 7
    public func trim_whitespace(t: Text) : async Text {
        return Text.trim(t, #text " ");
    };

    // Challenge 8
    public func duplicated_character(t: Text) : async Text {
        // Not perfect version as it doesn't take in account
        // empty spaces if text has more words
        var d: Text = "";

        for (char in t.chars()) {
            if (Text.contains(d, #text (Char.toText(char)))) {
                return Char.toText(char);
            };

            d := d # Char.toText(char);
        };

        return d;
    };

    // Challenge 9
    public func size_in_bytes(t: Text) : async Nat {
        return (Text.encodeUtf8(t)).size();
    };

    // Challenge 10
    public func bubble_sort(n: [Nat]) : async [Nat] {
        var arr: [var Nat] = Array.thaw(n); 
        var i: Nat = 0;

        while (i < arr.size()) {
            var j : Nat = 0;
            while (j < arr.size()) {
                if (arr[i] < arr[j]) {
                    let tmp = arr[i];
                    arr[i] := arr[j];
                    arr[j] := tmp;
                };
                j += 1;
            };
            i += 1;
        };

        return Array.freeze(arr);

    };

}