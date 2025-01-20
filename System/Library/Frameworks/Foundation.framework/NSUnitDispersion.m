@interface NSUnitDispersion
+ (NSUnitDispersion)partsPerMillion;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitDispersion

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitDispersion == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitDispersion partsPerMillion](&OBJC_CLASS___NSUnitDispersion, "partsPerMillion");
}

+ (id)icuType
{
  return @"concentr";
}

+ (NSUnitDispersion)partsPerMillion
{
  return (NSUnitDispersion *)&partsPerMillion__struct_ppm;
}

@end