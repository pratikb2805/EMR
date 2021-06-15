class MyDate(object):
    def __init__(self, d: int = 0, m: int = 0, y: int = 0) -> None:
        super().__init__()
        self.setDate(d, y, m)

    def setDate(self, d: int = 0, y: int = 0, m: int = 0):
        self.d = d
        self.y = y
        self.m = m

    def showDate(self):
        print(f'{self.d}/{self.y}/{self.y}')

    def getDay(self):
        return self.d

    def getMonth(self):
        return self.m

    def getYear(self):
        return self.y

    def getAge(self, dob):
        if dob.y > self.y or (dob.y == self.y and dob.m > self.y) or (dob.y == self.y and dob.m == self.y and dob.d > self.d):
            raise 'INvalid param: dob later than current date'
        diff_days = self.d - dob.d
        carry_months = 0
        carry_years = 0
        if diff_days < 0:
            carry_months = 1
            diff_days += 30
        diff_months = self.m - dob.m - carry_months
        if diff_months < 0:
            carry_years = 1
            diff_months += 12
        diff_years = self.y - dob.y - carry_years
        return MyDate(diff_days, diff_months, diff_years)
