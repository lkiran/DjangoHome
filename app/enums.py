from enum import Enum


class ClassEnum(Enum):
	Error = 0
	Integer = 1
	String = 2
	Boolean = 3
	Color = 4
	DayOfWeek = 5
	Date = 6
	Time = 7
	Empty = 8
	DateTime = 9


class ComparerEnum(Enum):
	Equal = 0
	NotEqual = 1
	Greater = 2
	EqualOrGreater = 3
	Smaller = 4
	EqualOrSmaller = 5


class TypeEnum(Enum):
	Error = 0
	Read_Only = 1
	Write_Only = 2
	Read_Or_Write = 3


class ModelStatus(Enum):
	Same = 0
	Modified = 1
	New = 2
