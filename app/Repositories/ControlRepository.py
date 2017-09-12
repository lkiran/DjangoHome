from app.models import Control


class ControlRepository:
    def Get(self):
        return Control.objects.all()

    def Save(self, control):
        if (control.id is None) or (control.id == ""):
            return self.__Add(control)
        return self.__Update(control)

    def __Add(self, control):
        pass

    def __Update(self, control):
        pass
