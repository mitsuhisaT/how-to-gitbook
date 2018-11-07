@startuml

class Vehicle {
  -tires: Integer
  -engineType: Enum
  +Vehicle()
  +Vehicle(num: Integer, type: Enum)
  +Integer getTires()
  +void setTires(num: Integer)
  +Ineger getEngineType()
  +void setEngineType(type: Enum)
}

@enduml
