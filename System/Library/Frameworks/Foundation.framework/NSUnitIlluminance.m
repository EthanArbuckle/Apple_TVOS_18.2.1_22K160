@interface NSUnitIlluminance
+ (NSUnitIlluminance)lux;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitIlluminance

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitIlluminance == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitIlluminance lux](&OBJC_CLASS___NSUnitIlluminance, "lux");
}

+ (id)icuType
{
  return @"light";
}

+ (NSUnitIlluminance)lux
{
  return (NSUnitIlluminance *)&lux__struct_lx;
}

@end