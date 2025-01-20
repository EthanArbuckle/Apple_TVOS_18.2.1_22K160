@interface NSUnitTemperature
+ (BOOL)supportsRegionalPreference;
+ (NSUnitTemperature)celsius;
+ (NSUnitTemperature)fahrenheit;
+ (NSUnitTemperature)kelvin;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitTemperature

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitTemperature == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitTemperature kelvin](&OBJC_CLASS___NSUnitTemperature, "kelvin");
}

+ (id)icuType
{
  return @"temperature";
}

+ (NSUnitTemperature)celsius
{
  return (NSUnitTemperature *)&celsius__struct_cels;
}

+ (NSUnitTemperature)fahrenheit
{
  return (NSUnitTemperature *)&fahrenheit__struct_fahr;
}

+ (NSUnitTemperature)kelvin
{
  return (NSUnitTemperature *)&kelvin__struct_kelv;
}

@end