@interface NSUnitLength
+ (BOOL)supportsRegionalPreference;
+ (NSUnitLength)astronomicalUnits;
+ (NSUnitLength)centimeters;
+ (NSUnitLength)decameters;
+ (NSUnitLength)decimeters;
+ (NSUnitLength)fathoms;
+ (NSUnitLength)feet;
+ (NSUnitLength)furlongs;
+ (NSUnitLength)hectometers;
+ (NSUnitLength)inches;
+ (NSUnitLength)kilometers;
+ (NSUnitLength)lightyears;
+ (NSUnitLength)megameters;
+ (NSUnitLength)meters;
+ (NSUnitLength)micrometers;
+ (NSUnitLength)miles;
+ (NSUnitLength)millimeters;
+ (NSUnitLength)nanometers;
+ (NSUnitLength)nauticalMiles;
+ (NSUnitLength)parsecs;
+ (NSUnitLength)picometers;
+ (NSUnitLength)scandinavianMiles;
+ (NSUnitLength)yards;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitLength

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitLength == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitLength meters](&OBJC_CLASS___NSUnitLength, "meters");
}

+ (id)icuType
{
  return @"length";
}

+ (NSUnitLength)megameters
{
  return (NSUnitLength *)&megameters__struct_Mm;
}

+ (NSUnitLength)kilometers
{
  return (NSUnitLength *)&kilometers__struct_km;
}

+ (NSUnitLength)hectometers
{
  return (NSUnitLength *)&hectometers__struct_hm;
}

+ (NSUnitLength)decameters
{
  return (NSUnitLength *)&decameters__struct_dam;
}

+ (NSUnitLength)meters
{
  return (NSUnitLength *)&meters__struct_meter;
}

+ (NSUnitLength)decimeters
{
  return (NSUnitLength *)&decimeters__struct_dm;
}

+ (NSUnitLength)centimeters
{
  return (NSUnitLength *)&centimeters__struct_cm;
}

+ (NSUnitLength)millimeters
{
  return (NSUnitLength *)&millimeters__struct_mm;
}

+ (NSUnitLength)micrometers
{
  return (NSUnitLength *)&micrometers__struct_microm;
}

+ (NSUnitLength)nanometers
{
  return (NSUnitLength *)&nanometers__struct_nm;
}

+ (NSUnitLength)picometers
{
  return (NSUnitLength *)&picometers__struct_pm;
}

+ (NSUnitLength)inches
{
  return (NSUnitLength *)&inches__struct_in;
}

+ (NSUnitLength)feet
{
  return (NSUnitLength *)&feet__struct_ft;
}

+ (NSUnitLength)yards
{
  return (NSUnitLength *)&yards__struct_yd;
}

+ (NSUnitLength)miles
{
  return (NSUnitLength *)&miles__struct_mi;
}

+ (NSUnitLength)scandinavianMiles
{
  return (NSUnitLength *)&scandinavianMiles__struct_smi;
}

+ (NSUnitLength)lightyears
{
  return (NSUnitLength *)&lightyears__struct_ly;
}

+ (NSUnitLength)nauticalMiles
{
  return (NSUnitLength *)&nauticalMiles__struct_NM;
}

+ (NSUnitLength)fathoms
{
  return (NSUnitLength *)&fathoms__struct_ftm;
}

+ (NSUnitLength)furlongs
{
  return (NSUnitLength *)&furlongs__struct_fur;
}

+ (NSUnitLength)astronomicalUnits
{
  return (NSUnitLength *)&astronomicalUnits__struct_ua;
}

+ (NSUnitLength)parsecs
{
  return (NSUnitLength *)&parsecs__struct_pc;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend( (id)objc_msgSend(a3, "unit"),  "isEqual:",  +[NSUnitLength baseUnit](NSUnitLength, "baseUnit")) & 1) == 0) {
        id v4 = (id)objc_msgSend( v4,  "measurementByConvertingToUnit:",  +[NSUnitLength baseUnit](NSUnitLength, "baseUnit"));
      }
      [v4 doubleValue];
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitLength kilometers](&OBJC_CLASS___NSUnitLength, "kilometers");
        return (id)[v4 measurementByConvertingToUnit:v6];
      }

      if (v7 <= 0.001)
      {
        v6 = +[NSUnitLength millimeters](&OBJC_CLASS___NSUnitLength, "millimeters");
        return (id)[v4 measurementByConvertingToUnit:v6];
      }
    }

    return v4;
  }

  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitLength feet](NSUnitLength, "feet")) & 1) == 0) {
    id v4 = (id)objc_msgSend( v4,  "measurementByConvertingToUnit:",  +[NSUnitLength feet](NSUnitLength, "feet"));
  }
  [v4 doubleValue];
  if (v5 >= 2640.0)
  {
    v6 = +[NSUnitLength miles](&OBJC_CLASS___NSUnitLength, "miles");
    return (id)[v4 measurementByConvertingToUnit:v6];
  }

  if (v5 >= 900.0)
  {
    v6 = +[NSUnitLength yards](&OBJC_CLASS___NSUnitLength, "yards");
    return (id)[v4 measurementByConvertingToUnit:v6];
  }

  if (v5 > 6.5) {
    return v4;
  }
  v6 = +[NSUnitLength inches](&OBJC_CLASS___NSUnitLength, "inches");
  return (id)[v4 measurementByConvertingToUnit:v6];
}

@end