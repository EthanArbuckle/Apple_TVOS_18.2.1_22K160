@interface NSUnitConcentrationMass
+ (BOOL)supportsRegionalPreference;
+ (NSUnitConcentrationMass)gramsPerLiter;
+ (NSUnitConcentrationMass)milligramsPerDeciliter;
+ (NSUnitConcentrationMass)millimolesPerLiterWithGramsPerMole:(double)gramsPerMole;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitConcentrationMass

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSUnitConcentrationMass == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitConcentrationMass gramsPerLiter](&OBJC_CLASS___NSUnitConcentrationMass, "gramsPerLiter");
}

+ (id)icuType
{
  return @"concentr";
}

+ (NSUnitConcentrationMass)gramsPerLiter
{
  return (NSUnitConcentrationMass *)&gramsPerLiter__struct_gpl;
}

+ (NSUnitConcentrationMass)milligramsPerDeciliter
{
  return (NSUnitConcentrationMass *)&milligramsPerDeciliter__struct_mgpd;
}

+ (NSUnitConcentrationMass)millimolesPerLiterWithGramsPerMole:(double)gramsPerMole
{
  return  -[NSDimension initWithSpecifier:symbol:converter:]( objc_alloc(&OBJC_CLASS___NSUnitConcentrationMass),  "initWithSpecifier:symbol:converter:",  4610LL,  @"mmol/L",   -[NSUnitConverterLinear initWithCoefficient:]( objc_alloc(&OBJC_CLASS___NSUnitConverterLinear),  "initWithCoefficient:",  gramsPerMole * 0.001));
}

@end