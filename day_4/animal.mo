module {
    public type Animal = {
        specie: Text;
        energy: Nat;
    };

    // Challenge 3
    public func animal_sleep(a: Animal) : Animal {
        var _a : Animal = {
            specie = a.specie;
            energy = a.energy + 10;
        };

        return _a;
    };
}