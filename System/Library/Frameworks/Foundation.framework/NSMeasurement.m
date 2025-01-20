@interface NSMeasurement
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeConvertedToUnit:(NSUnit *)unit;
- (BOOL)isEqual:(id)a3;
- (NSMeasurement)initWithCoder:(id)a3;
- (NSMeasurement)initWithDoubleValue:(double)doubleValue unit:(id)unit;
- (NSMeasurement)measurementByAddingMeasurement:(NSMeasurement *)measurement;
- (NSMeasurement)measurementByConvertingToUnit:(NSUnit *)unit;
- (NSMeasurement)measurementBySubtractingMeasurement:(NSMeasurement *)measurement;
- (double)doubleValue;
- (id)_performOperation:(int64_t)a3 withMeasurement:(id)a4;
- (id)description;
- (id)unit;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMeasurement

- (NSMeasurement)initWithDoubleValue:(double)doubleValue unit:(id)unit
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Must pass in an NSUnit object!" userInfo:0]);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSMeasurement;
  v7 = -[NSMeasurement init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_doubleValue = doubleValue;
    v7->_unit = (NSUnit *)[unit copy];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMeasurement;
  -[NSMeasurement dealloc](&v3, sel_dealloc);
}

- (id)unit
{
  return self->_unit;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)canBeConvertedToUnit:(NSUnit *)unit
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSUnit _effectiveUnitClass](self->_unit, "_effectiveUnitClass");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSMeasurement)measurementByConvertingToUnit:(NSUnit *)unit
{
  if (-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:"))
  {
    if (-[NSUnit isEqual:](self->_unit, "isEqual:", unit))
    {
      v5 = objc_alloc(&OBJC_CLASS___NSMeasurement);
      double doubleValue = self->_doubleValue;
      return -[NSMeasurement initWithDoubleValue:unit:](v5, "initWithDoubleValue:unit:", unit, doubleValue);
    }

    if (isDimensional() && isDimensional())
    {
      objc_msgSend((id)-[NSUnit converter](self->_unit, "converter"), "baseUnitValueFromValue:", self->_doubleValue);
      double v8 = v7;
      -[NSUnit dimension](unit, "dimension");
      if (!-[NSUnit isEqual:](unit, "isEqual:", [(id)objc_opt_class() baseUnit]))
      {
        objc_msgSend((id)-[NSUnit converter](unit, "converter"), "valueFromBaseUnitValue:", v8);
        double v8 = v9;
      }

      v5 = objc_alloc(&OBJC_CLASS___NSMeasurement);
      double doubleValue = v8;
      return -[NSMeasurement initWithDoubleValue:unit:](v5, "initWithDoubleValue:unit:", unit, doubleValue);
    }

    uint64_t v13 = objc_opt_class();
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot convert differing units that are non-dimensional! lhs: %@ rhs: %@",  v13,  objc_opt_class());
  }

  else
  {
    uint64_t v11 = objc_opt_class();
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot convert measurements of differing unit types! self: %@ unit: %@",  v11,  objc_opt_class());
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v12 userInfo:0]);
  return (NSMeasurement *)isDimensional();
}

- (id)_performOperation:(int64_t)a3 withMeasurement:(id)a4
{
  if (!-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:", [a4 unit]))
  {
    uint64_t v13 = objc_opt_class();
    [a4 unit];
    uint64_t v14 = objc_opt_class();
    if (a3 == 1)
    {
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot subtract measurements of differing unit types! lhs: %@ rhs: %@",  v13,  v14);
    }

    else
    {
      if (a3) {
        goto LABEL_23;
      }
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot add measurements of differing unit types! lhs: %@ rhs: %@",  v13,  v14);
    }

- (NSMeasurement)measurementByAddingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)-[NSMeasurement _performOperation:withMeasurement:]( self,  "_performOperation:withMeasurement:",  0LL,  measurement);
}

- (NSMeasurement)measurementBySubtractingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)-[NSMeasurement _performOperation:withMeasurement:]( self,  "_performOperation:withMeasurement:",  1LL,  measurement);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    double doubleValue = self->_doubleValue;
    [a3 doubleValue];
  }

  return 0;
}

- (unint64_t)hash
{
  double doubleValue = self->_doubleValue;
  double v3 = -doubleValue;
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
  v3.super_class = (Class)&OBJC_CLASS___NSMeasurement;
  return (id)objc_msgSend( -[NSMeasurement description](&v3, sel_description),  "stringByAppendingString:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @" value: %f unit: %@",  *(void *)&self->_doubleValue,  -[NSUnit symbol](self->_unit, "symbol")));
}

- (NSMeasurement)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSMeasurement cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  [a3 decodeDoubleForKey:@"NS.value"];
  double v6 = v5;
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.unit"];
  if (v7) {
    return -[NSMeasurement initWithDoubleValue:unit:](self, "initWithDoubleValue:unit:", v7, v6);
  }

  unint64_t v9 = @"NSLocalizedDescription";
  v10[0] = @"Unit class object has been corrupted!";
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"NS.value" forKey:self->_doubleValue];
    [a3 encodeObject:self->_unit forKey:@"NS.unit"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSMeasurement cannot be encoded by non-keyed archivers" userInfo:0]);
    +[NSMeasurement supportsSecureCoding](v5, v6);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end