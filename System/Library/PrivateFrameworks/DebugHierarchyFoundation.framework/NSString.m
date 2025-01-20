@interface NSString
- (BOOL)dbgBoolValue;
- (double)dbgDoubleValue;
- (float)dbgFloatValue;
- (id)dbgDataValue;
- (int)dbgIntValue;
- (int64_t)dbgLongLongValue;
- (int64_t)dbgLongValue;
- (unint64_t)dbgUnsignedLongLongValue;
- (unint64_t)dbgUnsignedLongValue;
- (unsigned)dbgUnsignedIntValue;
@end

@implementation NSString

- (BOOL)dbgBoolValue
{
  return v3 != 0;
}

- (float)dbgFloatValue
{
  return v3;
}

- (double)dbgDoubleValue
{
  return v3;
}

- (int)dbgIntValue
{
  return v3;
}

- (unsigned)dbgUnsignedIntValue
{
  return v3;
}

- (int64_t)dbgLongValue
{
  return v3;
}

- (unint64_t)dbgUnsignedLongValue
{
  return v3;
}

- (int64_t)dbgLongLongValue
{
  return v3;
}

- (unint64_t)dbgUnsignedLongLongValue
{
  return v3;
}

- (id)dbgDataValue
{
  return  -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  self,  0LL);
}

@end