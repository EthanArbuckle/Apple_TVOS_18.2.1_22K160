@interface NSUnitFuelEfficiency
+ (BOOL)supportsRegionalPreference;
+ (NSUnitFuelEfficiency)litersPer100Kilometers;
+ (NSUnitFuelEfficiency)milesPerGallon;
+ (NSUnitFuelEfficiency)milesPerImperialGallon;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitFuelEfficiency

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitFuelEfficiency == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitFuelEfficiency litersPer100Kilometers](&OBJC_CLASS___NSUnitFuelEfficiency, "litersPer100Kilometers");
}

+ (id)icuType
{
  return @"consumption";
}

+ (NSUnitFuelEfficiency)milesPerImperialGallon
{
  if (qword_18C64DEC0 != -1) {
    dispatch_once(&qword_18C64DEC0, &__block_literal_global_14);
  }
  return (NSUnitFuelEfficiency *)_MergedGlobals_49;
}

NSUnitFuelEfficiency *__46__NSUnitFuelEfficiency_milesPerImperialGallon__block_invoke()
{
  result = -[NSDimension initWithSpecifier:symbol:converter:]( objc_alloc(&OBJC_CLASS___NSUnitFuelEfficiency),  "initWithSpecifier:symbol:converter:",  3331LL,  @"mpg",   -[NSUnitConverterReciprocal initWithReciprocalValue:]( objc_alloc(&OBJC_CLASS___NSUnitConverterReciprocal),  "initWithReciprocalValue:",  282.481));
  _MergedGlobals_49 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)milesPerGallon
{
  if (qword_18C64DED0 != -1) {
    dispatch_once(&qword_18C64DED0, &__block_literal_global_579);
  }
  return (NSUnitFuelEfficiency *)qword_18C64DEC8;
}

NSUnitFuelEfficiency *__38__NSUnitFuelEfficiency_milesPerGallon__block_invoke()
{
  result = -[NSDimension initWithSpecifier:symbol:converter:]( objc_alloc(&OBJC_CLASS___NSUnitFuelEfficiency),  "initWithSpecifier:symbol:converter:",  3329LL,  @"mpg",   -[NSUnitConverterReciprocal initWithReciprocalValue:]( objc_alloc(&OBJC_CLASS___NSUnitConverterReciprocal),  "initWithReciprocalValue:",  235.215));
  qword_18C64DEC8 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)litersPer100Kilometers
{
  return (NSUnitFuelEfficiency *)&litersPer100Kilometers__struct_lpkm;
}

@end