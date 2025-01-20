@interface NSConstantDoubleNumber
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)new;
- ($2F068FC02377E22BA03580A8162C781E)decimalValue;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (int64_t)integerValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)retainCount;
- (unint64_t)unsignedIntegerValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSConstantDoubleNumber

- (void)getValue:(void *)a3
{
  *(double *)a3 = self->_value;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (a4 == 8)
  {
    *(double *)a3 = self->_value;
  }

  else
  {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes",  a4,  "d",  8LL);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v4 userInfo:0]);
    -[NSConstantDoubleNumber decimalValue](v7, v5, v6);
  }

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  v4 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSDecimalNumber), "initWithDouble:", self->_value);
  if (v4)
  {
    SEL v6 = v4;
    -[NSDecimalNumber decimalValue](v4, "decimalValue");
    v4 = v6;
  }

  else
  {
    *(void *)retstr = 0LL;
    *(void *)&retstr->var5[2] = 0LL;
    *(_DWORD *)&retstr->var5[6] = 0;
  }

  return result;
}

- (const)objCType
{
  return "d";
}

- (BOOL)BOOLValue
{
  return self->_value != 0.0;
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSNumber allocWithZone:](&OBJC_CLASS___NSNumber, "allocWithZone:", a3);
}

- (char)charValue
{
  return (int)self->_value;
}

- (unsigned)unsignedCharValue
{
  return (int)self->_value;
}

- (signed)shortValue
{
  return (int)self->_value;
}

- (unsigned)unsignedShortValue
{
  return (int)self->_value;
}

- (int)intValue
{
  return (int)self->_value;
}

- (unsigned)unsignedIntValue
{
  return self->_value;
}

- (int64_t)longValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongValue
{
  return (unint64_t)self->_value;
}

- (int64_t)longLongValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongLongValue
{
  return (unint64_t)self->_value;
}

- (float)floatValue
{
  return self->_value;
}

- (double)doubleValue
{
  return self->_value;
}

- (int64_t)integerValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedIntegerValue
{
  return (unint64_t)self->_value;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end