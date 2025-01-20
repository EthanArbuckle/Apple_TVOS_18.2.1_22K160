@interface __NSCFBoolean
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (__NSCFBoolean)retain;
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
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)release;
@end

@implementation __NSCFBoolean

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isEqualToNumber:(id)a3
{
  return self == a3 || -[__NSCFBoolean compare:](self, "compare:", v3, v4) == 0;
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
        LOBYTE(v5) = -[__NSCFBoolean isEqualToNumber:](self, "isEqualToNumber:", a3);
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (__NSCFBoolean)retain
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
  if (-[__NSCFBoolean BOOLValue](self, "BOOLValue", a3)) {
    return @"1";
  }
  else {
    return @"0";
  }
}

- (id)description
{
  return -[__NSCFBoolean descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

- (id)stringValue
{
  return -[__NSCFBoolean descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

- (char)charValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unsigned)unsignedCharValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (signed)shortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unsigned)unsignedShortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int)intValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unsigned)unsignedIntValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)longValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unint64_t)unsignedLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)longLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unint64_t)unsignedLongLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (float)floatValue
{
  int Value = CFBooleanGetValue((CFBooleanRef)self);
  float result = 0.0;
  if (Value) {
    return 1.0;
  }
  return result;
}

- (double)doubleValue
{
  int Value = CFBooleanGetValue((CFBooleanRef)self);
  double result = 0.0;
  if (Value) {
    return 1.0;
  }
  return result;
}

- (BOOL)BOOLValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (void)getValue:(void *)a3
{
  *(_BYTE *)a3 = CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (const)objCType
{
  return "c";
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (int64_t)_cfNumberType
{
  int v3 = *-[__NSCFBoolean objCType](self, "objCType");
  int64_t result = 7LL;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if ((-[__NSCFBoolean unsignedIntValue](self, "unsignedIntValue") & 0x80000000) != 0) {
          return 11LL;
        }
        else {
          return 9LL;
        }
      }

      if (v3 == 76)
      {
        if ((-[__NSCFBoolean unsignedLongValue](self, "unsignedLongValue") & 0x8000000000000000LL) == 0LL) {
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
      *(_BYTE *)a3 = -[__NSCFBoolean charValue](self, "charValue");
      goto LABEL_9;
    case 2LL:
      *(_WORD *)a3 = -[__NSCFBoolean shortValue](self, "shortValue");
      goto LABEL_9;
    case 3LL:
      *(_DWORD *)a3 = -[__NSCFBoolean intValue](self, "intValue");
      goto LABEL_9;
    case 4LL:
      *(void *)a3 = -[__NSCFBoolean longLongValue](self, "longLongValue");
      goto LABEL_9;
    case 5LL:
      -[__NSCFBoolean floatValue](self, "floatValue");
      *(_DWORD *)a3 = v5;
      goto LABEL_9;
    case 6LL:
      -[__NSCFBoolean doubleValue](self, "doubleValue");
      *(void *)a3 = v6;
      goto LABEL_9;
    case 17LL:
      uint64_t v7 = -[__NSCFBoolean longLongValue](self, "longLongValue");
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
  int64_t v3 = -[__NSCFBoolean compare:](self, "compare:", a3);
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
    uint64_t v6 = -[__NSCFBoolean objCType](self, "objCType");
    if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
    {
      -[__NSCFBoolean doubleValue](self, "doubleValue");
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
        unint64_t v8 = -[__NSCFBoolean unsignedLongLongValue](self, "unsignedLongLongValue");
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
        && (-[__NSCFBoolean unsignedLongLongValue](self, "unsignedLongLongValue") & 0x8000000000000000LL) != 0)
      {
        return 1LL;
      }

      if (v5 != 81 || ([a3 unsignedLongLongValue] & 0x8000000000000000) == 0)
      {
        int64_t v15 = -[__NSCFBoolean longLongValue](self, "longLongValue");
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

  -[__NSCFBoolean compare:].cold.1((objc_class *)self, a2);
  int64_t v18 = -1LL;
  if (v19 < 0) {
    return 1LL;
  }
  return v18;
}

- (uint64_t)compare:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v6 = __CFExceptionProem(a1, a2);
  int v2 = OUTLINED_FUNCTION_0_8(v6, @"%@: nil argument");
  return -[CFPDCloudSource enqueueNewKey:value:encoding:inBatch:].cold.1(v2, v3, v4);
}

@end