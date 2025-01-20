@interface NSUnitConverterLinear
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUnitConverterLinear)initWithCoder:(id)a3;
- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient;
- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient constant:(double)constant;
- (double)baseUnitValueFromValue:(double)a3;
- (double)coefficient;
- (double)constant;
- (double)valueFromBaseUnitValue:(double)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSUnitConverterLinear

- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient
{
  return -[NSUnitConverterLinear initWithCoefficient:constant:](self, "initWithCoefficient:constant:", coefficient, 0.0);
}

- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient constant:(double)constant
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSUnitConverterLinear;
  result = -[NSUnitConverterLinear init](&v7, sel_init);
  if (result)
  {
    result->_coefficient = coefficient;
    result->_constant = constant;
  }

  return result;
}

- (double)baseUnitValueFromValue:(double)a3
{
  double v6 = v5;
  -[NSUnitConverterLinear constant](self, "constant");
  return v7 + a3 * v6;
}

- (double)valueFromBaseUnitValue:(double)a3
{
  double v6 = a3 - v5;
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  return v6 / v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  double v6 = v5;
  [a3 coefficient];
  if (v6 != v7) {
    return 0;
  }
  -[NSUnitConverterLinear constant](self, "constant");
  double v10 = v9;
  [a3 constant];
  return v10 == v11;
}

- (unint64_t)hash
{
  double v4 = -v3;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  -[NSUnitConverterLinear constant](self, "constant");
  double v13 = -v12;
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  double v18 = fabs(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSUnitConverterLinear;
  id v3 = -[NSUnitConverterLinear description](&v8, sel_description);
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  uint64_t v5 = v4;
  -[NSUnitConverterLinear constant](self, "constant");
  return (id)[v3 stringByAppendingString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @" coefficient = %f, constant = %f", v5, v6)];
}

- (NSUnitConverterLinear)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"NS.coefficient"];
    double v6 = v5;
    [a3 decodeDoubleForKey:@"NS.constant"];
    return -[NSUnitConverterLinear initWithCoefficient:constant:](self, "initWithCoefficient:constant:", v6, v7);
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitConverterLinear cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSUnitConverterLinear encodeWithCoder:](v9, v10, v11);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    -[NSUnitConverterLinear coefficient](self, "coefficient");
    objc_msgSend(a3, "encodeDouble:forKey:", @"NS.coefficient");
    -[NSUnitConverterLinear constant](self, "constant");
    objc_msgSend(a3, "encodeDouble:forKey:", @"NS.constant");
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitConverterLinear encoder does not allow non-keyed coding!" userInfo:0]);
    +[NSUnitConverterLinear supportsSecureCoding](v5, v6);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)coefficient
{
  return self->_coefficient;
}

- (double)constant
{
  return self->_constant;
}

@end