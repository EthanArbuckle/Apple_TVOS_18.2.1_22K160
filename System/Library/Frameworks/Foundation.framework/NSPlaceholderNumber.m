@interface NSPlaceholderNumber
+ (BOOL)supportsSecureCoding;
- (NSPlaceholderNumber)init;
- (NSPlaceholderNumber)initWithBool:(BOOL)a3;
- (NSPlaceholderNumber)initWithChar:(char)a3;
- (NSPlaceholderNumber)initWithCoder:(id)a3;
- (NSPlaceholderNumber)initWithDouble:(double)a3;
- (NSPlaceholderNumber)initWithFloat:(float)a3;
- (NSPlaceholderNumber)initWithInt:(int)a3;
- (NSPlaceholderNumber)initWithInteger:(int64_t)a3;
- (NSPlaceholderNumber)initWithLong:(int64_t)a3;
- (NSPlaceholderNumber)initWithLongLong:(int64_t)a3;
- (NSPlaceholderNumber)initWithShort:(signed __int16)a3;
- (NSPlaceholderNumber)initWithUnsignedChar:(unsigned __int8)a3;
- (NSPlaceholderNumber)initWithUnsignedInt:(unsigned int)a3;
- (NSPlaceholderNumber)initWithUnsignedInteger:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedLong:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedLongLong:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedShort:(unsigned __int16)a3;
@end

@implementation NSPlaceholderNumber

- (NSPlaceholderNumber)initWithUnsignedLongLong:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1895F89C0];
  if ((a3 & 0x8000000000000000LL) != 0)
  {
    valuePtr[0] = 0LL;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }

  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberSInt64Type;
  }

  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithDouble:(double)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  *(double *)CFNumberType v4 = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, v4);
}

- (NSPlaceholderNumber)initWithUnsignedInteger:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1895F89C0];
  if ((a3 & 0x8000000000000000LL) != 0)
  {
    valuePtr[0] = 0LL;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }

  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberSInt64Type;
  }

  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)init
{
  return 0LL;
}

- (NSPlaceholderNumber)initWithChar:(char)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt8Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedChar:(unsigned __int8)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  __int16 valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithShort:(signed __int16)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  signed __int16 valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedShort:(unsigned __int16)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithInt:(int)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedInt:(unsigned int)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithInteger:(int64_t)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithLong:(int64_t)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithUnsignedLong:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1895F89C0];
  if ((a3 & 0x8000000000000000LL) != 0)
  {
    valuePtr[0] = 0LL;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }

  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberType v4 = kCFNumberSInt64Type;
  }

  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithLongLong:(int64_t)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithFloat:(float)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  float valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberFloatType, &valuePtr);
}

- (NSPlaceholderNumber)initWithBool:(BOOL)a3
{
  v3 = (CFTypeRef *)MEMORY[0x189604DE8];
  if (!a3) {
    v3 = (CFTypeRef *)MEMORY[0x189604DE0];
  }
  return (NSPlaceholderNumber *)CFRetain(*v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPlaceholderNumber)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    return newDecodedNumber(a3);
  }
  if (object_getClass(a3) == (Class)&OBJC_CLASS___NSKeyedUnarchiver
    || [a3 containsValueForKey:@"NS.number"])
  {
    id v7 = (id)[a3 _decodePropertyListForKey:@"NS.number"];
    if ((_NSIsNSNumber() & 1) != 0)
    {
      return (NSPlaceholderNumber *)v7;
    }

    else
    {
      objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Decoded object is not a number"));

      return 0LL;
    }
  }

  else if ([a3 containsValueForKey:@"NS.BOOLval"])
  {
    return -[NSPlaceholderNumber initWithBool:]( self,  "initWithBool:",  [a3 decodeBoolForKey:@"NS.BOOLval"]);
  }

  else if ([a3 containsValueForKey:@"NS.intval"])
  {
    return -[NSPlaceholderNumber initWithLongLong:]( self,  "initWithLongLong:",  [a3 decodeInt64ForKey:@"NS.intval"]);
  }

  else if ([a3 containsValueForKey:@"NS.dblval"])
  {
    [a3 decodeDoubleForKey:@"NS.dblval"];
    return -[NSPlaceholderNumber initWithDouble:](self, "initWithDouble:");
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"*** -[NSPlaceholderNumber initWithCoder:]: unknown number type" userInfo:0]);
    return (NSPlaceholderNumber *)cachedObjCTypeInfoHash(v6);
  }

@end