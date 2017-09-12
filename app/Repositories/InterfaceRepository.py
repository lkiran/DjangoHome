from app.models import Interface


class InterfaceRepository:
    def Get(self):
        return Interface.objects.all()

    def Save(self, interface):
        if (interface.id is None) or (interface.id == ""):
            return self.__Add(interface)
        return self.__Update(interface)

    def __Add(self, interface):
        pass

    def __Update(self, interface):
        pass
