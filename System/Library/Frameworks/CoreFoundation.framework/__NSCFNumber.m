@interface __NSCFNumber
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (BOOL)isNSNumber__;
- (__NSCFNumber)retain;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)stringValue;
- (int)intValue;
- (int64_t)_cfNumberType;
- (int64_t)_reverseCompare:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)_cfTypeID;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)release;
@end

@implementation __NSCFNumber

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isNSNumber__
{
  return 1;
}

- (BOOL)isEqualToNumber:(id)a3
{
  return self == a3 || -[__NSCFNumber compare:](self, "compare:", v3, v4) == 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      int v5 = _NSIsNSNumber((uint64_t)a3);
      if (v5) {
        LOBYTE(v5) = -[__NSCFNumber isEqualToNumber:](self, "isEqualToNumber:", a3);
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (__NSCFNumber)retain
{
  return self;
}

- (void)release
{
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)descriptionWithLocale:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (!objc_lookUpClass("NSNumber")) {
    return (id)(id)__CFNumberCopyFormattingDescription((uint64_t)self);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFNumber;
  return -[__NSCFNumber descriptionWithLocale:](&v6, sel_descriptionWithLocale_, a3);
}

- (id)description
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (!objc_lookUpClass("NSNumber")) {
    return -[__NSCFNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSCFNumber;
  return -[__NSCFType description](&v4, sel_description);
}

- (id)stringValue
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (!objc_lookUpClass("NSNumber")) {
    return (id)(id)__CFNumberCreateFormattingDescription( (const __CFAllocator *)&__kCFAllocatorSystemDefault,  (uint64_t)self);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSCFNumber;
  return -[__NSCFNumber stringValue](&v4, sel_stringValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (void)getValue:(void *)a3
{
  valuePtr[2] = *MEMORY[0x1895F89C0];
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)self);
LABEL_8:
    CFNumberGetValue((CFNumberRef)self, Type, a3);
    return;
  }

  CFNumberType Type = _CFNumberGetType2((unint64_t *)self);
  if (Type != (kCFNumberMaxType|kCFNumberSInt8Type)) {
    goto LABEL_8;
  }
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, valuePtr);
  if (valuePtr[0]) {
    uint64_t v6 = -1LL;
  }
  else {
    uint64_t v6 = valuePtr[1];
  }
  *(void *)a3 = v6;
}

- (const)objCType
{
  result = (const char *)_CFNumberGetType2((unint64_t *)self);
  uint64_t v3 = result - 1;
  __break(1u);
  return result;
}

- (char)charValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (unsigned)unsignedCharValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (signed)shortValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, &v3);
  return v3;
}

- (unsigned)unsignedShortValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, &v3);
  return v3;
}

- (int)intValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, &v3);
  return v3;
}

- (unsigned)unsignedIntValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, &v3);
  return v3;
}

- (int64_t)longValue
{
  v3[1] = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (unint64_t)unsignedLongValue
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, valuePtr);
  return v4;
}

- (int64_t)longLongValue
{
  v3[1] = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (unint64_t)unsignedLongLongValue
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, valuePtr);
  return v4;
}

- (float)floatValue
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberFloatType, &valuePtr);
  return valuePtr;
}

- (double)doubleValue
{
  v3[1] = *MEMORY[0x1895F89C0];
  CFNumberGetValue((CFNumberRef)self, kCFNumberDoubleType, v3);
  return *(double *)v3;
}

- (BOOL)BOOLValue
{
  v5[1] = *(double *)MEMORY[0x1895F89C0];
  if (CFNumberIsFloatType((CFNumberRef)self))
  {
    CFNumberGetValue((CFNumberRef)self, kCFNumberDoubleType, v5);
    BOOL v3 = v5[0] == 0.0;
  }

  else
  {
    CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v5);
    BOOL v3 = *(void *)&v5[0] == 0LL;
  }

  return !v3;
}

- (unint64_t)_cfTypeID
{
  return 22LL;
}

- (int64_t)_cfNumberType
{
  int v3 = *-[__NSCFNumber objCType](self, "objCType");
  int64_t result = 7LL;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if ((-[__NSCFNumber unsignedIntValue](self, "unsignedIntValue") & 0x80000000) != 0) {
          return 11LL;
        }
        else {
          return 9LL;
        }
      }

      if (v3 == 76)
      {
        if ((-[__NSCFNumber unsignedLongValue](self, "unsignedLongValue") & 0x8000000000000000LL) == 0LL) {
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
      *(_BYTE *)a3 = -[__NSCFNumber charValue](self, "charValue");
      goto LABEL_9;
    case 2LL:
      *(_WORD *)a3 = -[__NSCFNumber shortValue](self, "shortValue");
      goto LABEL_9;
    case 3LL:
      *(_DWORD *)a3 = -[__NSCFNumber intValue](self, "intValue");
      goto LABEL_9;
    case 4LL:
      *(void *)a3 = -[__NSCFNumber longLongValue](self, "longLongValue");
      goto LABEL_9;
    case 5LL:
      -[__NSCFNumber floatValue](self, "floatValue");
      *(_DWORD *)a3 = v5;
      goto LABEL_9;
    case 6LL:
      -[__NSCFNumber doubleValue](self, "doubleValue");
      *(void *)a3 = v6;
      goto LABEL_9;
    case 17LL:
      uint64_t v7 = -[__NSCFNumber longLongValue](self, "longLongValue");
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

- (int64_t)_reverseCompare:(id)a3
{
  int64_t v3 = -[__NSCFNumber compare:](self, "compare:", a3);
  if (v3 == 1) {
    int64_t v4 = -1LL;
  }
  else {
    int64_t v4 = 0LL;
  }
  if (v3 == -1) {
    return 1LL;
  }
  else {
    return v4;
  }
}

- (int64_t)compare:(id)a3
{
  if (a3)
  {
    if (self == a3) {
      return 0LL;
    }
    int v5 = *(unsigned __int8 *)[a3 objCType];
    uint64_t v6 = -[__NSCFNumber objCType](self, "objCType");
    if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
    {
      -[__NSCFNumber doubleValue](self, "doubleValue");
      double v13 = v12;
      [a3 doubleValue];
      if (v13 >= v14) {
        return v14 < v13;
      }
    }

    else
    {
      if (v5 == 81 && v7 == 81)
      {
        unint64_t v8 = -[__NSCFNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        unint64_t v9 = [a3 unsignedLongLongValue];
        if (v8 >= v9) {
          int64_t v10 = 0LL;
        }
        else {
          int64_t v10 = -1LL;
        }
        if (v8 > v9) {
          return 1LL;
        }
        else {
          return v10;
        }
      }

      if (v7 == 81
        && (-[__NSCFNumber unsignedLongLongValue](self, "unsignedLongLongValue") & 0x8000000000000000LL) != 0)
      {
        return 1LL;
      }

      if (v5 != 81 || ([a3 unsignedLongLongValue] & 0x8000000000000000) == 0)
      {
        int64_t v15 = -[__NSCFNumber longLongValue](self, "longLongValue");
        uint64_t v16 = [a3 longLongValue];
        if (v15 >= v16) {
          int64_t v17 = 0LL;
        }
        else {
          int64_t v17 = -1LL;
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

  -[__NSCFNumber compare:].cold.1((objc_class *)self, a2);
  int64_t v18 = -1LL;
  if (v19 < 0) {
    return 1LL;
  }
  return v18;
}

- (uint64_t)compare:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: nil argument");
  return -[__NSCFBoolean compare:].cold.1(v2);
}

@end