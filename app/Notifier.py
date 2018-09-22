import abc
import sys
from inspect import isabstract, isclass, getmembers


class AbsListener(object):
	__metaclass__ = abc.ABCMeta

	@abc.abstractmethod
	def OnNotification(self, **kwargs):
		pass


class Notifier(object):
	def Notify(self, className, **kwargs):
		listeners = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in listeners:
			if isclass(_type) and issubclass(_type, AbsListener) and not isabstract(_type):
				_type.OnNotification(**kwargs)


if __name__ == "__main__":
	Notifier().Notify("ConditionService")