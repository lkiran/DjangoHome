from enum import IntEnum


class ClassEnum(IntEnum):
    Error = 0
    Integer = 1
    String = 2
    Boolean = 3
    Color = 4
    Day_Of_Weeks = 5
    Date = 6
    Time = 7


class ComparerEnum(IntEnum):
    Equal = 0
    Not_Equal = 1
    Greater = 2
    Smaller = 3


class TypeEnum(IntEnum):
    Error = 0
    Read_Only = 1
    Write_Only = 2
    Read_Or_Write = 3
