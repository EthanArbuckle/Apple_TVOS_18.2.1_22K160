@interface NSUnitSpeed
+ (BOOL)supportsRegionalPreference;
+ (NSUnitSpeed)kilometersPerHour;
+ (NSUnitSpeed)knots;
+ (NSUnitSpeed)metersPerSecond;
+ (NSUnitSpeed)milesPerHour;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitSpeed

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitSpeed == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitSpeed metersPerSecond](&OBJC_CLASS___NSUnitSpeed, "metersPerSecond");
}

+ (id)icuType
{
  return @"speed";
}

+ (NSUnitSpeed)metersPerSecond
{
  return (NSUnitSpeed *)&metersPerSecond__struct_mps;
}

+ (NSUnitSpeed)kilometersPerHour
{
  return (NSUnitSpeed *)&kilometersPerHour__struct_kph;
}

+ (NSUnitSpeed)milesPerHour
{
  return (NSUnitSpeed *)&milesPerHour__struct_mph;
}

+ (NSUnitSpeed)knots
{
  return (NSUnitSpeed *)&knots__struct_kn;
}

@end