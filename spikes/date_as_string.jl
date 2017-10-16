using DataGenerators

# This is a naive and actually faulty date generator since it does not handle
# constraints in max number of days for each month.
@generator DateStringGen1 begin
    start()       = datestring()
    datestring()  = yearstring() * "-" * monthstring() * "-"* daystring()
    yearstring()  = @sprintf("%04d", choose(Int, 0, 9999))
    monthstring() = @sprintf("%02d", choose(Int, 1, 12))
    daystring()   = @sprintf("%02d", choose(Int, 1, 31))
end

dsg1 = DateStringGen1()
ds1 = map(_ -> choose(dsg1), 1:10)

isleapyear(y::Int) = (y%4 == 0) && ((y%100 != 0) || (y%400 == 0))

DaysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
function maxdaysinmonth(year::Int, month::Int)
    @assert 1 <= month <= 12
    (month == 2) ? (isleapyear(year) ? 29 : 28) : DaysPerMonth[month]
end

# This should respect the month-based max days constraints.
@generator DateStringGen2 begin
    start()       = datestring()
    datestring()  = begin
        y = year()
        m = month()
        ystr = @sprintf("%04d", y)
        mstr = @sprintf("%02d", m)
        "$(ystr)-$(mstr)-" * daystring(y, m)
    end
    year() = choose(Int, 0, 9999)
    month() = choose(Int, 1, 12)
    daystring(y, m)   = @sprintf("%02d", choose(Int, 1, maxdaysinmonth(y, m)))
end

dsg2 = DateStringGen2()
ds2 = map(_ -> choose(dsg2), 1:10)

# DataGenerators is not very good at optimising int values in large ranges so possible workaround:
Years = vcat(collect(1969:2042), Int[rand(0:1968), rand(2051:2100), rand(2101:9999)])
NumYears = length(Years)
@generator DateStringGen3 begin
    start()       = datestring()
    datestring()  = begin
        y = year()
        m = month()
        ystr = @sprintf("%04d", y)
        mstr = @sprintf("%02d", m)
        "$(ystr)-$(mstr)-" * daystring(y, m)
    end
    year() = Years[choose(Int, 1, NumYears)]
    month() = choose(Int, 1, 12)
    daystring(y, m)   = @sprintf("%02d", choose(Int, 1, maxdaysinmonth(y, m)))
end

dsg3 = DateStringGen3()
ds3 = map(_ -> choose(dsg3), 1:10)
