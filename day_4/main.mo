import Person "person";
import Player "custom";
import Animal "animal";
import List "mo:base/List";

actor {
    public type Person = Person.Person;
    public type Player = Player.Player;
    public type Animal = Animal.Animal;

    let penelope : Person = {
        name = "Penelope Cruz";
        age = 47;
    };

    // Challenge 1
    public func fun() : async Player {
        return { name = "Tara"; injured = false; age = 12; points = 11238 };
    };

    // Challenge 2
    let dog : Animal = {
        specie = "Kangaroo";
        energy = 10;
    };

    // Challenge 3 (test)
    public func _animal_sleep(a : Animal) : async Animal {
        return Animal.animal_sleep(a);
    };

    // Challenge 4
    public func create_animal_then_takes_a_break(specie: Text, energy: Nat) : async Animal {
        var animal : Animal = {
            specie = specie;
            energy = energy;
        };

        return Animal.animal_sleep(animal);
    };

    // Challenge 5
    var animal_list = List.nil<Animal>();

    // Challenge 6
    public func push_animal(a: Animal) {
        animal_list := List.push(a, animal_list);
    };

    public func get_animals() : async [Animal] {
        return List.toArray<Animal>(animal_list);
    };

}