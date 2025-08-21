//set up Unit for singleton
class Unit {
  const Unit._internal();

  @override
  String toString() => 'Unit';
}

const Unit unit = Unit._internal();
