class Color(object):
    Red = 0
    Green = 0
    Blue = 0
    Alpha = 0

    def __init__(self, r, g, b, a):
        self.Red = r
        self.Green = g
        self.Blue = b
        self.Alpha = a

    def __str__(self):
        return u'rgba({0},{1},{2},{3})'.format(self.Red, self.Green, self.Blue, self.Alpha)

    def __unicode__(self):
        return u'rgba({0},{1},{2},{3})'.format(self.Red, self.Green, self.Blue, self.Alpha)

    def toList(self):
        return [self.Red, self.Green, self.Blue, self.Alpha]

    def toHex(self, withHashPrefix=True):
        template = '#{:02x}{:02x}{:02x}' if withHashPrefix else '{:02x}{:02x}{:02x}'
        return template.format(
            int(self.Red * self.Alpha),
            int(self.Green * self.Alpha),
            int(self.Blue * self.Alpha))
