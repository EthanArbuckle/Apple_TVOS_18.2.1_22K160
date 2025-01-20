@interface NSNumber
+ (BOOL)supportsSecureCoding;
+ (NSNumber)allocWithZone:(_NSZone *)a3;
+ (NSNumber)numberWithBool:(BOOL)value;
+ (NSNumber)numberWithChar:(char)value;
+ (NSNumber)numberWithDouble:(double)value;
+ (NSNumber)numberWithFloat:(float)value;
+ (NSNumber)numberWithInt:(int)value;
+ (NSNumber)numberWithInteger:(NSInteger)value;
+ (NSNumber)numberWithLong:(uint64_t)value;
+ (NSNumber)numberWithLongLong:(uint64_t)value;
+ (NSNumber)numberWithShort:(__int16)value;
+ (NSNumber)numberWithUnsignedChar:(unsigned __int8)value;
+ (NSNumber)numberWithUnsignedInt:(unsigned int)value;
+ (NSNumber)numberWithUnsignedInteger:(NSUInteger)value;
+ (NSNumber)numberWithUnsignedLong:(unint64_t)value;
+ (NSNumber)numberWithUnsignedLongLong:(unint64_t)value;
+ (NSNumber)numberWithUnsignedShort:(unsigned __int16)value;
+ (void)initialize;
- (BOOL)BOOLValue;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(NSNumber *)number;
- (BOOL)isNSNumber__;
- (Class)classForCoder;
- (NSComparisonResult)compare:(NSNumber *)otherNumber;
- (NSDecimal)decimalValue;
- (NSNumber)initWithBool:(BOOL)value;
- (NSNumber)initWithChar:(char)value;
- (NSNumber)initWithCoder:(NSCoder *)aDecoder;
- (NSNumber)initWithDouble:(double)value;
- (NSNumber)initWithFloat:(float)value;
- (NSNumber)initWithInt:(int)value;
- (NSNumber)initWithInteger:(NSInteger)value;
- (NSNumber)initWithLong:(uint64_t)value;
- (NSNumber)initWithLongLong:(uint64_t)value;
- (NSNumber)initWithShort:(__int16)value;
- (NSNumber)initWithUnsignedChar:(unsigned __int8)value;
- (NSNumber)initWithUnsignedInt:(unsigned int)value;
- (NSNumber)initWithUnsignedInteger:(NSUInteger)value;
- (NSNumber)initWithUnsignedLong:(unint64_t)value;
- (NSNumber)initWithUnsignedLongLong:(unint64_t)value;
- (NSNumber)initWithUnsignedShort:(unsigned __int16)value;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)stringValue;
- (__int16)shortValue;
- (char)charValue;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int)intValue;
- (int64_t)_cfNumberType;
- (int64_t)_reverseCompare:(id)a3;
- (uint64_t)longLongValue;
- (uint64_t)longValue;
- (unint64_t)hash;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSNumber

+ (NSNumber)numberWithUnsignedLongLong:(unint64_t)value
{
  if (&OBJC_CLASS___NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0) {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithUnsignedLongLong:value];
  }
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSNumber == a1) {
    return (NSNumber *)&__placeholderNumber;
  }
  else {
    return (NSNumber *)NSAllocateObject((Class)a1, 0LL, a3);
  }
}

+ (NSNumber)numberWithUnsignedInteger:(NSUInteger)value
{
  if (&OBJC_CLASS___NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0) {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithUnsignedInteger:value];
  }
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (NSString)descriptionWithLocale:(id)locale
{
  int v6 = *-[NSValue objCType](self, "objCType");
  if (v6 > 80)
  {
    switch(v6)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        id v7 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
        -[NSNumber doubleValue](self, "doubleValue");
        v9 = (void *)objc_msgSend(v7, "initWithFormat:locale:", @"%0.16g", locale, v8);
        return (NSString *)v9;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_26;
      case 'f':
        id v12 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
        -[NSNumber floatValue](self, "floatValue");
        v9 = (void *)objc_msgSend(v12, "initWithFormat:locale:", @"%0.7g", locale, v13);
        return (NSString *)v9;
      case 'i':
        id v10 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
        unint64_t v20 = -[NSNumber intValue](self, "intValue");
        goto LABEL_19;
      case 'l':
        v9 = (void *)objc_msgSend( objc_allocWithZone((Class)NSString),  "initWithFormat:locale:",  @"%ld",  locale,  -[NSNumber longValue](self, "longValue"));
        return (NSString *)v9;
      case 'q':
        v9 = (void *)objc_msgSend( objc_allocWithZone((Class)NSString),  "initWithFormat:locale:",  @"%lld",  locale,  -[NSNumber longLongValue](self, "longLongValue"));
        return (NSString *)v9;
      case 's':
        v9 = (void *)objc_msgSend( objc_allocWithZone((Class)NSString),  "initWithFormat:locale:",  @"%hi",  locale,  -[NSNumber shortValue](self, "shortValue"));
        return (NSString *)v9;
      default:
        if (v6 == 81)
        {
          id v10 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
          unint64_t v20 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
          v11 = @"%llu";
          goto LABEL_24;
        }

        if (v6 != 83) {
          goto LABEL_26;
        }
        v9 = (void *)objc_msgSend( objc_allocWithZone((Class)NSString),  "initWithFormat:locale:",  @"%hu",  locale,  -[NSNumber unsignedShortValue](self, "unsignedShortValue"));
        break;
    }

    return (NSString *)v9;
  }

  if (v6 > 72)
  {
    if (v6 == 73)
    {
      id v10 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
      unint64_t v20 = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      goto LABEL_16;
    }

    if (v6 == 76)
    {
      v9 = (void *)objc_msgSend( objc_allocWithZone((Class)NSString),  "initWithFormat:locale:",  @"%lu",  locale,  -[NSNumber unsignedLongValue](self, "unsignedLongValue"));
      return (NSString *)v9;
    }
  }

  else
  {
    if (v6 == 66)
    {
LABEL_11:
      id v10 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
      unint64_t v20 = -[NSNumber charValue](self, "charValue");
LABEL_19:
      v11 = @"%d";
      goto LABEL_24;
    }

    if (v6 == 67)
    {
      id v10 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
      unint64_t v20 = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
LABEL_16:
      v11 = @"%u";
LABEL_24:
      v9 = (void *)objc_msgSend(v10, "initWithFormat:locale:", v11, locale, v20);
      return (NSString *)v9;
    }
  }

- (id)description
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

+ (NSNumber)numberWithInt:(int)value
{
  if (&OBJC_CLASS___NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0) {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithInt:*(void *)&value];
  }
  result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000013LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithLong:(uint64_t)value
{
  if (&OBJC_CLASS___NSNumber != a1
    || (unint64_t)(value - 0x80000000000000LL) < 0xFF00000000000001LL
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithLong:value];
  }

  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithUnsignedInt:(unsigned int)value
{
  if (&OBJC_CLASS___NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0) {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithUnsignedInt:*(void *)&value];
  }
  result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (NSString)stringValue
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

+ (NSNumber)numberWithLongLong:(uint64_t)value
{
  if (&OBJC_CLASS___NSNumber != a1
    || (unint64_t)(value - 0x80000000000000LL) < 0xFF00000000000001LL
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithLongLong:value];
  }

  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSNumber;
}

+ (NSNumber)numberWithInteger:(NSInteger)value
{
  if (&OBJC_CLASS___NSNumber != a1
    || (unint64_t)(value - 0x80000000000000LL) < 0xFF00000000000001LL
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithInteger:value];
  }

  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithBool:(BOOL)value
{
  v3 = (NSNumber **)MEMORY[0x189604DE8];
  if (!value) {
    v3 = (NSNumber **)MEMORY[0x189604DE0];
  }
  return *v3;
}

+ (NSNumber)numberWithDouble:(double)value
{
  if (&OBJC_CLASS___NSNumber != a1) {
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithDouble:value];
  }
  uint64_t v4 = (uint64_t)value;
  if (!v4)
  {
    if ((*(void *)&value & 0x8000000000000000LL) == 0) {
      goto LABEL_9;
    }
    return (NSNumber *)(id)[objc_allocWithZone((Class)a1) initWithDouble:value];
  }

+ (NSNumber)numberWithFloat:(float)value
{
  if (&OBJC_CLASS___NSNumber != a1) {
    goto LABEL_2;
  }
  uint64_t v7 = (uint64_t)value;
  if (!v7)
  {
    if ((LODWORD(value) & 0x80000000) == 0) {
      goto LABEL_9;
    }
LABEL_2:
    id v4 = objc_allocWithZone((Class)a1);
    *(float *)&double v5 = value;
    return (NSNumber *)(id)[v4 initWithFloat:v5];
  }

- (int64_t)_cfNumberType
{
  int v3 = *-[NSValue objCType](self, "objCType");
  int64_t result = 7LL;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if ((-[NSNumber unsignedIntValue](self, "unsignedIntValue") & 0x80000000) != 0) {
          return 11LL;
        }
        else {
          return 9LL;
        }
      }

      if (v3 == 76)
      {
        if ((-[NSNumber unsignedLongValue](self, "unsignedLongValue") & 0x8000000000000000LL) == 0LL) {
          return 10LL;
        }
        else {
          return 11LL;
        }
      }
    }

    else
    {
      if (v3 == 66) {
        return result;
      }
      if (v3 == 67) {
        return 8LL;
      }
    }

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  switch(a4)
  {
    case 1LL:
      *(_BYTE *)a3 = -[NSNumber charValue](self, "charValue");
      goto LABEL_9;
    case 2LL:
      *(_WORD *)a3 = -[NSNumber shortValue](self, "shortValue");
      goto LABEL_9;
    case 3LL:
      *(_DWORD *)a3 = -[NSNumber intValue](self, "intValue");
      goto LABEL_9;
    case 4LL:
      *(void *)a3 = -[NSNumber longLongValue](self, "longLongValue");
      goto LABEL_9;
    case 5LL:
      -[NSNumber floatValue](self, "floatValue");
      *(_DWORD *)a3 = v5;
      goto LABEL_9;
    case 6LL:
      -[NSNumber doubleValue](self, "doubleValue");
      *(void *)a3 = v6;
      goto LABEL_9;
    case 17LL:
      uint64_t v7 = -[NSNumber longLongValue](self, "longLongValue");
      *(void *)a3 = v7 >> 63;
      *((void *)a3 + 1) = v7;
LABEL_9:
      LOBYTE(self) = 1;
      break;
    default:
      __break(1u);
      break;
  }

  return self;
}

- (BOOL)isNSNumber__
{
  return 1;
}

- (int64_t)_reverseCompare:(id)a3
{
  NSComparisonResult v3 = -[NSNumber compare:](self, "compare:", a3);
  if (v3 == NSOrderedDescending) {
    int64_t v4 = -1LL;
  }
  else {
    int64_t v4 = 0LL;
  }
  if (v3 == NSOrderedAscending) {
    return 1LL;
  }
  else {
    return v4;
  }
}

- (NSDecimal)decimalValue
{
  int v5 = +[NSScanner scannerWithString:]( &OBJC_CLASS___NSScanner,  "scannerWithString:",  -[NSNumber stringValue](self, "stringValue"));
  *(void *)retstr = 0LL;
  *(void *)&retstr->_mantissa[2] = 0LL;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
  if (!-[NSScanner scanDecimal:](v5, "scanDecimal:", retstr))
  {
    uint64_t v6 = +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber");
    if (v6)
    {
      -[NSDecimalNumber decimalValue](v6, "decimalValue");
    }

    else
    {
      __int128 v8 = 0uLL;
      int v9 = 0;
    }

    *(_OWORD *)retstr = v8;
    *(_DWORD *)&retstr->_mantissa[6] = v9;
  }

  return (NSDecimal *)_CFAutoreleasePoolPop();
}

+ (void)initialize
{
}

+ (NSNumber)numberWithChar:(char)value
{
  int64_t result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000003LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithUnsignedChar:(unsigned __int8)value
{
  int64_t result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000000BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithShort:(__int16)value
{
  int64_t result = (NSNumber *)(((uint64_t)value << 7) | 0x800000000000000BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithUnsignedShort:(unsigned __int16)value
{
  int64_t result = (NSNumber *)(((unint64_t)value << 7) | 0x8000000000000013LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

+ (NSNumber)numberWithUnsignedLong:(unint64_t)value
{
  int64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (BOOL)BOOLValue
{
  unsigned int v4 = *-[NSValue objCType](self, "objCType") - 66;
  if (v4 > 0x31) {
    goto LABEL_12;
  }
  if (((1LL << v4) & 0x2048200020483LL) != 0)
  {
    uint64_t v5 = -[NSNumber longValue](self, "longValue");
LABEL_4:
    BOOL v6 = v5 == 0;
    return !v6;
  }

  if (((1LL << v4) & 0x1400000000LL) == 0)
  {
    if (((1LL << v4) & 0x800000008000LL) != 0)
    {
      uint64_t v5 = -[NSNumber longLongValue](self, "longLongValue");
      goto LABEL_4;
    }

- (char)charValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }

      if (v4 == 76)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }

    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOBYTE(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }

      if (v4 == 67)
      {
        LOBYTE(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }

- (unsigned)unsignedCharValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }

      if (v4 == 76)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }

    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOBYTE(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }

      if (v4 == 67)
      {
        LOBYTE(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }

- (__int16)shortValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }

      if (v4 == 76)
      {
        LOWORD(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }

    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }

      if (v4 == 67)
      {
        LOWORD(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }

- (unsigned)unsignedShortValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }

      if (v4 == 76)
      {
        LOWORD(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }

    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }

      if (v4 == 67)
      {
        LOWORD(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }

- (int)intValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73) {
        return -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      }
      if (v4 == 76) {
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      }
    }

    else
    {
      if (v4 == 66) {
        return -[NSNumber charValue](self, "charValue");
      }
      if (v4 == 67) {
        return -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      }
    }

- (unsigned)unsignedIntValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73) {
        return -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      }
      if (v4 == 76) {
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      }
    }

    else
    {
      if (v4 == 66) {
        return -[NSNumber charValue](self, "charValue");
      }
      if (v4 == 67) {
        return -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      }
    }

- (uint64_t)longValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (uint64_t)v5;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 == 81) {
          return -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_25;
        }
        LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return result;
  }

  if (v4 > 72)
  {
    if (v4 == 73)
    {
      LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      return result;
    }

    if (v4 == 76) {
      return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
    }
    goto LABEL_25;
  }

  if (v4 != 66)
  {
    if (v4 == 67)
    {
      LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      return result;
    }

- (unint64_t)unsignedLongValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (unint64_t)v5;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 == 81) {
          return -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_25;
        }
        LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return result;
  }

  if (v4 > 72)
  {
    if (v4 == 73)
    {
      LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      return result;
    }

    if (v4 == 76) {
      return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
    }
    goto LABEL_25;
  }

  if (v4 != 66)
  {
    if (v4 == 67)
    {
      LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      return result;
    }

- (double)doubleValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (double)-[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return result;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_27;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return v9;
      case 'i':
        return (double)-[NSNumber intValue](self, "intValue");
      case 'l':
        return (double)-[NSNumber longValue](self, "longValue");
      case 'q':
        return (double)-[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return (double)-[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 == 81) {
          return (double)-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_27;
        }
        unsigned int v6 = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return (double)v6;
  }

  if (v4 > 72)
  {
    if (v4 == 73) {
      return (double)-[NSNumber unsignedIntValue](self, "unsignedIntValue");
    }
    if (v4 != 76) {
      goto LABEL_27;
    }
    return (double)-[NSNumber unsignedLongValue](self, "unsignedLongValue");
  }

  else
  {
    if (v4 != 66)
    {
      if (v4 == 67) {
        return (double)-[NSNumber unsignedCharValue](self, "unsignedCharValue");
      }
LABEL_27:
      SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
      objc_exception_throw(v11);
      *(float *)&double result = -[NSNumber floatValue](v12, v13);
      return result;
    }

    return (double)-[NSNumber charValue](self, "charValue");
  }

- (float)floatValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (float)-[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return v5;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_27;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return result;
      case 'i':
        return (float)-[NSNumber intValue](self, "intValue");
      case 'l':
        return (float)-[NSNumber longValue](self, "longValue");
      case 'q':
        return (float)-[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return (float)-[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 == 81) {
          return (float)-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_27;
        }
        unsigned int v7 = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return (float)v7;
  }

  if (v4 > 72)
  {
    if (v4 == 73) {
      return (float)-[NSNumber unsignedIntValue](self, "unsignedIntValue");
    }
    if (v4 != 76) {
      goto LABEL_27;
    }
    return (float)-[NSNumber unsignedLongValue](self, "unsignedLongValue");
  }

  else
  {
    if (v4 != 66)
    {
      if (v4 == 67) {
        return (float)-[NSNumber unsignedCharValue](self, "unsignedCharValue");
      }
LABEL_27:
      SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
      objc_exception_throw(v11);
      -[NSNumber longLongValue](v12, v13);
      return result;
    }

    return (float)-[NSNumber charValue](self, "charValue");
  }

- (uint64_t)longLongValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (uint64_t)v5;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 == 81) {
          return -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_25;
        }
        LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return result;
  }

  if (v4 > 72)
  {
    if (v4 == 73)
    {
      LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      return result;
    }

    if (v4 == 76) {
      return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
    }
    goto LABEL_25;
  }

  if (v4 != 66)
  {
    if (v4 == 67)
    {
      LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      return result;
    }

- (unint64_t)unsignedLongLongValue
{
  int v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (unint64_t)v5;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 == 81) {
          return -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        }
        if (v4 != 83) {
          goto LABEL_25;
        }
        LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
        break;
    }

    return result;
  }

  if (v4 > 72)
  {
    if (v4 == 73)
    {
      LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
      return result;
    }

    if (v4 == 76) {
      return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
    }
    goto LABEL_25;
  }

  if (v4 != 66)
  {
    if (v4 == 67)
    {
      LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      return result;
    }

- (NSComparisonResult)compare:(NSNumber *)otherNumber
{
  if (otherNumber)
  {
    if (self == otherNumber) {
      return 0LL;
    }
    int v5 = *(unsigned __int8 *)-[NSValue objCType](otherNumber, "objCType");
    unsigned int v6 = -[NSValue objCType](self, "objCType");
    if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
    {
      -[NSNumber doubleValue](self, "doubleValue");
      double v13 = v12;
      -[NSNumber doubleValue](otherNumber, "doubleValue");
      if (v13 >= v14) {
        return (unint64_t)(v14 < v13);
      }
    }

    else
    {
      if (v5 == 81 && v7 == 81)
      {
        unint64_t v8 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        unint64_t v9 = -[NSNumber unsignedLongLongValue](otherNumber, "unsignedLongLongValue");
        if (v8 >= v9) {
          NSComparisonResult v10 = NSOrderedSame;
        }
        else {
          NSComparisonResult v10 = NSOrderedAscending;
        }
        if (v8 > v9) {
          return 1LL;
        }
        else {
          return v10;
        }
      }

      if (v7 == 81 && (-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue") & 0x8000000000000000LL) != 0) {
        return 1LL;
      }
      if (v5 != 81
        || (-[NSNumber unsignedLongLongValue](otherNumber, "unsignedLongLongValue") & 0x8000000000000000LL) == 0)
      {
        uint64_t v15 = -[NSNumber longLongValue](self, "longLongValue");
        uint64_t v16 = -[NSNumber longLongValue](otherNumber, "longLongValue");
        if (v15 >= v16) {
          NSComparisonResult v17 = NSOrderedSame;
        }
        else {
          NSComparisonResult v17 = NSOrderedAscending;
        }
        if (v15 > v16) {
          return 1LL;
        }
        else {
          return v17;
        }
      }
    }

    return -1LL;
  }

  v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v18);
  NSComparisonResult v19 = NSOrderedAscending;
  if (v20 < 0) {
    return 1LL;
  }
  return v19;
}

- (BOOL)isEqualToNumber:(NSNumber *)number
{
  return self == number || -[NSNumber compare:](self, "compare:", v3, v4) == NSOrderedSame;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = _NSIsNSNumber();
    if (v5) {
      LOBYTE(v5) = -[NSNumber isEqualToNumber:](self, "isEqualToNumber:", a3);
    }
  }

  return v5;
}

- (unint64_t)hash
{
  int v3 = *-[NSValue objCType](self, "objCType");
  if (v3 <= 75)
  {
    if (v3 != 66)
    {
      if (v3 != 67 && v3 != 73) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v4 = (v3 - 83);
    if (v4 > 0x20)
    {
LABEL_17:
      if (v3 != 76)
      {
        if (v3 == 81)
        {
          double v6 = (double)-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
LABEL_25:
          double v14 = floor(v6 + 0.5);
          double v12 = (v6 - v14) * 1.84467441e19;
          unint64_t result = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
LABEL_26:
          if (v12 >= 0.0)
          {
            if (v12 > 0.0) {
              result += (unint64_t)v12;
            }
          }

          else
          {
            result -= (unint64_t)fabs(v12);
          }

          return result;
        }

- (id)redactedDescription
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)initWithCoder:(NSCoder *)aDecoder
{
  BOOL v5 = -[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding");

  if (!v5)
  {
    uint64_t v8 = aDecoder;
    return (NSNumber *)newDecodedNumber(v8);
  }

  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_self() && !-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NS.number"))
  {
    if (-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NS.BOOLval")) {
      return (NSNumber *)-[NSPlaceholderNumber initWithBool:]( &__placeholderNumber,  "initWithBool:",  -[NSCoder decodeBoolForKey:](aDecoder, "decodeBoolForKey:", @"NS.BOOLval"));
    }
    if (-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NS.intval")) {
      return (NSNumber *)-[NSPlaceholderNumber initWithLongLong:]( &__placeholderNumber,  "initWithLongLong:",  -[NSCoder decodeInt64ForKey:](aDecoder, "decodeInt64ForKey:", @"NS.intval"));
    }
    if (-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NS.dblval"))
    {
      -[NSCoder decodeDoubleForKey:](aDecoder, "decodeDoubleForKey:", @"NS.dblval");
      return (NSNumber *)-[NSPlaceholderNumber initWithDouble:](&__placeholderNumber, "initWithDouble:");
    }

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"*** -[NSNumber initWithCoder:]: unknown number type" userInfo:0]);
    return (NSNumber *)newDecodedNumber(v8);
  }

  id v9 = (id)-[NSCoder _decodePropertyListForKey:](aDecoder, "_decodePropertyListForKey:", @"NS.number");
  if ((_NSIsNSNumber() & 1) != 0) {
    return (NSNumber *)v9;
  }
  -[NSCoder failWithError:]( aDecoder,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Decoded object is not a number"));

  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  sizep[128] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v7 = -[NSValue objCType](self, "objCType");
    uint64_t v8 = v7;
    uint64_t v15 = v7;
    int v9 = *(unsigned __int8 *)v7;
    if (*v7 && !v7[1])
    {
      if (v9 == 76)
      {
        uint64_t v8 = "Q";
        goto LABEL_16;
      }

      if (v9 == 108)
      {
        uint64_t v8 = "q";
LABEL_16:
        uint64_t v15 = v8;
      }
    }

    NSGetSizeAndAlignment(v8, sizep, 0LL);
    NSUInteger v12 = sizep[0];
    if (sizep[0] < 0x401) {
      double v13 = sizep;
    }
    else {
      double v13 = malloc(sizep[0]);
    }
    if (*v8 == 94 && v8[1] == 118)
    {
      double v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot encode (void *) value: %@",  self);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
      __break(1u);
    }

    else
    {
      -[NSValue getValue:](self, "getValue:", v13);
      [a3 encodeValueOfObjCType:"*" at:&v15];
      [a3 encodeValueOfObjCType:v15 at:v13];
      if (v12 > 0x400) {
        free(v13);
      }
    }

    return;
  }

  if (object_getClass(a3) == (Class)&OBJC_CLASS___NSKeyedArchiver)
  {
    [a3 _encodePropertyList:self forKey:@"NS.number"];
  }

  else
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(self))
    {
      BOOL v6 = CFBooleanGetValue((CFBooleanRef)self) != 0;
LABEL_5:
      [a3 encodeBool:v6 forKey:@"NS.BOOLval"];
      return;
    }

    unint64_t v10 = -[NSValue objCType](self, "objCType");
    unsigned int v11 = *v10 - 66;
    if (v11 <= 0x31)
    {
      if (((1LL << v11) & 0x2848200028482LL) != 0)
      {
        objc_msgSend(a3, "encodeInt64:forKey:", -[NSNumber longLongValue](self, "longLongValue"), @"NS.intval");
      }

      else if (((1LL << v11) & 0x1400000000LL) != 0)
      {
        -[NSNumber doubleValue](self, "doubleValue");
        objc_msgSend(a3, "encodeDouble:forKey:", @"NS.dblval");
      }

      else if (*v10 == 66)
      {
        BOOL v6 = -[NSNumber BOOLValue](self, "BOOLValue");
        goto LABEL_5;
      }
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  sizep[128] = *MEMORY[0x1895F89C0];
  BOOL v5 = -[NSValue objCType](self, "objCType", a3);
  NSGetSizeAndAlignment(v5, sizep, 0LL);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    uint64_t v7 = (unsigned __int8 *)sizep;
  }
  else {
    uint64_t v7 = (unsigned __int8 *)malloc(sizep[0]);
  }
  -[NSValue getValue:](self, "getValue:", v7);
  int v9 = newNumber(*v5, v7, v8);
  if (!v9)
  {
    unsigned int v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\"", _NSMethodExceptionProem((objc_class *)self, a2), v5), 0 reason userInfo];
    objc_exception_throw(v11);
    __break(1u);
  }

  if (v6 >= 0x401) {
    free(v7);
  }
  return v9;
}

- (NSNumber)initWithChar:(char)value
{
}

- (NSNumber)initWithUnsignedChar:(unsigned __int8)value
{
}

- (NSNumber)initWithShort:(__int16)value
{
}

- (NSNumber)initWithUnsignedShort:(unsigned __int16)value
{
}

- (NSNumber)initWithInt:(int)value
{
}

- (NSNumber)initWithUnsignedInt:(unsigned int)value
{
}

- (NSNumber)initWithInteger:(NSInteger)value
{
}

- (NSNumber)initWithUnsignedInteger:(NSUInteger)value
{
}

- (NSNumber)initWithLong:(uint64_t)value
{
}

- (NSNumber)initWithUnsignedLong:(unint64_t)value
{
}

- (NSNumber)initWithLongLong:(uint64_t)value
{
}

- (NSNumber)initWithUnsignedLongLong:(unint64_t)value
{
}

- (NSNumber)initWithFloat:(float)value
{
}

- (NSNumber)initWithDouble:(double)value
{
}

- (NSNumber)initWithBool:(BOOL)value
{
}

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  int v9 = *-[NSValue objCType](self, "objCType");
  if (v9 <= 80)
  {
    if (v9 > 72)
    {
      if (v9 == 73)
      {
        -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        goto LABEL_16;
      }

      if (v9 == 76)
      {
        -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        int v10 = snprintf(a3, a4, "%lu");
        return v10 < a4;
      }
    }

    else
    {
      if (v9 == 66)
      {
LABEL_11:
        -[NSNumber charValue](self, "charValue");
        size_t v11 = a4;
LABEL_19:
        int v10 = snprintf(a3, v11, "%d");
        return v10 < a4;
      }

      if (v9 == 67)
      {
        -[NSNumber unsignedCharValue](self, "unsignedCharValue");
LABEL_16:
        int v10 = snprintf(a3, a4, "%u");
        return v10 < a4;
      }
    }

@end