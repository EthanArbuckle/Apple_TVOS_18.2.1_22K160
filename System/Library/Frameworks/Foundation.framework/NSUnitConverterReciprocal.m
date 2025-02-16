@interface NSUnitConverterReciprocal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUnitConverterReciprocal)initWithCoder:(id)a3;
- (NSUnitConverterReciprocal)initWithReciprocalValue:(double)a3;
- (double)baseUnitValueFromValue:(double)a3;
- (double)reciprocalValue;
- (double)valueFromBaseUnitValue:(double)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSUnitConverterReciprocal

- (NSUnitConverterReciprocal)initWithReciprocalValue:(double)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSUnitConverterReciprocal;
  result = -[NSUnitConverterReciprocal init](&v5, sel_init);
  if (result) {
    result->_reciprocalValue = a3;
  }
  return result;
}

- (double)baseUnitValueFromValue:(double)a3
{
  return self->_reciprocalValue / a3;
}

- (double)valueFromBaseUnitValue:(double)a3
{
  return self->_reciprocalValue / a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  double reciprocalValue = self->_reciprocalValue;
  [a3 reciprocalValue];
  return reciprocalValue == v4;
}

- (unint64_t)hash
{
  double v3 = -v2;
  if (v2 >= 0.0) {
    double v3 = v2;
  }
  double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUnitConverterReciprocal;
  return (id)objc_msgSend( -[NSUnitConverterReciprocal description](&v3, sel_description),  "stringByAppendingString:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @" double reciprocalValue = %f",  *(void *)&self->_reciprocalValue));
}

- (NSUnitConverterReciprocal)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"NS.reciprocalValue"];
    return -[NSUnitConverterReciprocal initWithReciprocalValue:](self, "initWithReciprocalValue:");
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitConverterReciprocal cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSUnitConverterReciprocal encodeWithCoder:](v6, v7, v8);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"NS.reciprocalValue" forKey:self->_reciprocalValue];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitConverterReciprocal encoder does not allow non-keyed coding!" userInfo:0]);
    +[NSUnitConverterReciprocal supportsSecureCoding](v5, v6);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)reciprocalValue
{
  return self->_reciprocalValue;
}

@end