@interface NSDecimalNumber
+ (BOOL)supportsSecureCoding;
+ (NSDecimalNumber)allocWithZone:(_NSZone *)a3;
+ (NSDecimalNumber)decimalNumberWithDecimal:(NSDecimal *)dcm;
+ (NSDecimalNumber)decimalNumberWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag;
+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue;
+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue locale:(id)locale;
+ (NSDecimalNumber)maximumDecimalNumber;
+ (NSDecimalNumber)minimumDecimalNumber;
+ (NSDecimalNumber)notANumber;
+ (NSDecimalNumber)numberWithBool:(BOOL)a3;
+ (NSDecimalNumber)numberWithChar:(char)a3;
+ (NSDecimalNumber)numberWithDouble:(double)a3;
+ (NSDecimalNumber)numberWithFloat:(float)a3;
+ (NSDecimalNumber)numberWithInt:(int)a3;
+ (NSDecimalNumber)numberWithInteger:(int64_t)a3;
+ (NSDecimalNumber)numberWithLong:(int64_t)a3;
+ (NSDecimalNumber)numberWithLongLong:(int64_t)a3;
+ (NSDecimalNumber)numberWithShort:(signed __int16)a3;
+ (NSDecimalNumber)numberWithUnsignedChar:(unsigned __int8)a3;
+ (NSDecimalNumber)numberWithUnsignedInt:(unsigned int)a3;
+ (NSDecimalNumber)numberWithUnsignedInteger:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedLong:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedLongLong:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedShort:(unsigned __int16)a3;
+ (NSDecimalNumber)one;
+ (NSDecimalNumber)zero;
+ (id)defaultBehavior;
+ (void)initialize;
+ (void)setDefaultBehavior:(id)defaultBehavior;
- (BOOL)BOOLValue;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSComparisonResult)compare:(NSNumber *)decimalNumber;
- (NSDecimal)decimalValue;
- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power;
- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power;
- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByRoundingAccordingToBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)initWithCoder:(id)a3;
- (NSDecimalNumber)initWithDecimal:(NSDecimal *)dcm;
- (NSDecimalNumber)initWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag;
- (NSDecimalNumber)initWithString:(NSString *)numberValue;
- (NSDecimalNumber)initWithString:(NSString *)numberValue locale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decimalNumberBySubstracting:(id)a3;
- (id)description;
- (int)intValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation NSDecimalNumber

+ (void)initialize
{
  if (&OBJC_CLASS___NSDecimalNumber == a1) {
    objc_opt_class();
  }
}

+ (NSDecimalNumber)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1) {
    return (NSDecimalNumber *)&_cachedPlaceholder;
  }
  else {
    return (NSDecimalNumber *)NSAllocateObject((Class)a1, 0LL, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (NSShouldRetainWithZone(self, a3)) {
    return self;
  }
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }

  else
  {
    v5[0] = 0LL;
    v5[1] = 0LL;
    int v6 = 0;
  }

  return -[NSDecimalNumberPlaceholder initWithDecimal:](&_cachedPlaceholder, "initWithDecimal:", v5);
}

+ (NSDecimalNumber)decimalNumberWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{
  return (NSDecimalNumber *) -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:]( &_cachedPlaceholder,  "initWithMantissa:exponent:isNegative:",  mantissa,  exponent,  flag);
}

+ (NSDecimalNumber)decimalNumberWithDecimal:(NSDecimal *)dcm
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSDecimal v4 = *dcm;
  return (NSDecimalNumber *) -[NSDecimalNumberPlaceholder initWithDecimal:]( &_cachedPlaceholder,  "initWithDecimal:",  &v4);
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue
{
  return (NSDecimalNumber *) -[NSDecimalNumberPlaceholder initWithString:]( &_cachedPlaceholder,  "initWithString:",  numberValue);
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue locale:(id)locale
{
  return (NSDecimalNumber *) -[NSDecimalNumberPlaceholder initWithString:locale:]( &_cachedPlaceholder,  "initWithString:locale:",  numberValue,  locale);
}

- (NSDecimalNumber)initWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Did you forget to nest alloc and initWithMantissa:exponent:isNegative ?" userInfo:0]);
  return -[NSDecimalNumber initWithDecimal:](v5, v6, v7);
}

- (NSDecimalNumber)initWithDecimal:(NSDecimal *)dcm
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Did you forget to nest alloc and initWithDecimal: ?" userInfo:0]);
  return -[NSDecimalNumber initWithString:](v3, v4, v5);
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Did you forget to nest alloc and initWithString: ?" userInfo:0]);
  return -[NSDecimalNumber initWithString:locale:](v3, v4, v5, v6);
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue locale:(id)locale
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Did you forget to nest alloc and initWithString:locale: ?" userInfo:0]);
  return (NSDecimalNumber *)+[NSDecimalNumber supportsSecureCoding](v4, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Did you forget to nest alloc and initWithCoder: ?" userInfo:0]);
  return (NSDecimalNumber *)-[NSDecimalNumber description](v3, v4);
}

- (id)description
{
  return -[NSDecimalNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0LL);
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }

  else
  {
    v5[0] = 0LL;
    v5[1] = 0LL;
    int v6 = 0;
  }

  return (NSString *)_NSDecimalString((uint64_t)v5, (uint64_t)locale);
}

- (NSDecimal)decimalValue
{
  *(void *)retstr = 0LL;
  *(void *)&retstr->_mantissa[2] = 0LL;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
  NSDecimalCopy(retstr, (const NSDecimal *)((char *)self + 8));
  return result;
}

+ (NSDecimalNumber)minimumDecimalNumber
{
  return (NSDecimalNumber *)&minimumDecimalNumber__minimumDecimalNumber;
}

+ (NSDecimalNumber)maximumDecimalNumber
{
  return (NSDecimalNumber *)&maximumDecimalNumber__maximumDecimalNumber;
}

+ (NSDecimalNumber)zero
{
  return (NSDecimalNumber *)&zero__zero;
}

+ (NSDecimalNumber)one
{
  return (NSDecimalNumber *)&one__one;
}

+ (NSDecimalNumber)notANumber
{
  result = (NSDecimalNumber *)notANumber_n;
  if (!notANumber_n)
  {
    v3 = (objc_class *)objc_opt_self();
    result = (NSDecimalNumber *)NSAllocateObject(v3, 0LL, 0LL);
    notANumber_n = (uint64_t)result;
    *((_BYTE *)result + 9) &= 0xF0u;
    *((_BYTE *)result + 9) |= 0x10u;
  }

  return result;
}

- (NSComparisonResult)compare:(NSNumber *)decimalNumber
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (self == (NSDecimalNumber *)decimalNumber) {
    return 0LL;
  }
  if (!decimalNumber) {
    return 1LL;
  }
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      -[NSDecimalNumber decimalValue](self, "decimalValue");
    }

    else
    {
      v8[0] = 0LL;
      v8[1] = 0LL;
      int v9 = 0;
    }

    -[NSNumber decimalValue](decimalNumber, "decimalValue");
    return _NSDecimalCompare((uint64_t)v8, (uint64_t)v7);
  }

  else
  {
    NSComparisonResult v6 = -[NSNumber compare:](decimalNumber, "compare:", self);
    if (v6 == NSOrderedDescending) {
      return -1LL;
    }
    else {
      return (unint64_t)(v6 == NSOrderedAscending);
    }
  }

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = _NSIsNSNumber();
    if (v5) {
      LOBYTE(v5) = -[NSDecimalNumber compare:](self, "compare:", a3) == NSOrderedSame;
    }
  }

  return v5;
}

- (const)objCType
{
  return "d";
}

- (double)doubleValue
{
  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    uint64_t v3 = 2LL * (*((_BYTE *)self + 9) & 0xF);
    double result = 0.0;
    do
    {
      LOWORD(v2) = *(_WORD *)((char *)self + v3 + 10);
      double v2 = (double)*(unint64_t *)&v2;
      double result = v2 + result * 65536.0;
      v3 -= 2LL;
    }

    while (v3);
  }

  else
  {
    double result = 0.0;
    if ((*((_BYTE *)self + 9) & 0x10) != 0) {
      return NAN;
    }
  }

  uint64_t v5 = *((char *)self + 8);
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v6 = -(int)v5;
    do
    {
      double result = result / 10.0;
      --v6;
    }

    while (v6);
  }

  else if (*((_BYTE *)self + 8))
  {
    do
    {
      double result = result * 10.0;
      --v5;
    }

    while (v5);
  }

  if ((*((_BYTE *)self + 9) & 0x10) != 0) {
    return -result;
  }
  return result;
}

- (void)getValue:(void *)a3
{
  *(void *)a3 = v4;
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByAdding:withBehavior:]( self,  "decimalNumberByAdding:withBehavior:",  decimalNumber,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (!self)
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    int v17 = 0;
    if (decimalNumber) {
      goto LABEL_3;
    }
LABEL_5:
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
    goto LABEL_6;
  }

  -[NSDecimalNumber decimalValue](self, "decimalValue");
  if (!decimalNumber) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
LABEL_6:
  uint64_t v10 = _NSDecimalAdd(&v18, v16, v14, v9);
  __int128 v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound( v10,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)decimalNumber,  v8,  v9,  (uint64_t)&v12,  behavior);
}

- (id)decimalNumberBySubstracting:(id)a3
{
  return -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:]( self,  "decimalNumberBySubtracting:withBehavior:",  a3,  +[NSDecimalNumber defaultBehavior](&OBJC_CLASS___NSDecimalNumber, "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:]( self,  "decimalNumberBySubtracting:withBehavior:",  decimalNumber,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (!self)
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    int v17 = 0;
    if (decimalNumber) {
      goto LABEL_3;
    }
LABEL_5:
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
    goto LABEL_6;
  }

  -[NSDecimalNumber decimalValue](self, "decimalValue");
  if (!decimalNumber) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
LABEL_6:
  uint64_t v10 = _NSDecimalSubtract(&v18, v16, v14, v9);
  __int128 v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound( v10,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)decimalNumber,  v8,  v9,  (uint64_t)&v12,  behavior);
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByMultiplyingBy:withBehavior:]( self,  "decimalNumberByMultiplyingBy:withBehavior:",  decimalNumber,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (!self)
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    int v17 = 0;
    if (decimalNumber) {
      goto LABEL_3;
    }
LABEL_5:
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
    goto LABEL_6;
  }

  -[NSDecimalNumber decimalValue](self, "decimalValue");
  if (!decimalNumber) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
LABEL_6:
  uint64_t v10 = _NSDecimalMultiply(&v18, v16, v14, v9);
  __int128 v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound( v10,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)decimalNumber,  v8,  v9,  (uint64_t)&v12,  behavior);
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByDividingBy:withBehavior:]( self,  "decimalNumberByDividingBy:withBehavior:",  decimalNumber,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (!self)
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    int v17 = 0;
    if (decimalNumber) {
      goto LABEL_3;
    }
LABEL_5:
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
    goto LABEL_6;
  }

  -[NSDecimalNumber decimalValue](self, "decimalValue");
  if (!decimalNumber) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
LABEL_6:
  uint64_t v10 = _NSDecimalDivide(&v18, v16, v14, v9);
  __int128 v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound( v10,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)decimalNumber,  v8,  v9,  (uint64_t)&v12,  behavior);
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power
{
  return -[NSDecimalNumber decimalNumberByRaisingToPower:withBehavior:]( self,  "decimalNumberByRaisingToPower:withBehavior:",  power,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power withBehavior:(id)behavior
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0uLL;
  int v17 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }

  else
  {
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
  }

  uint64_t v10 = _NSDecimalPower(&v16, v14, power, v9);
  __int128 v12 = v16;
  int v13 = v17;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0LL, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power
{
  return -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:withBehavior:]( self,  "decimalNumberByMultiplyingByPowerOf10:withBehavior:",  power,  [(id)objc_opt_self() defaultBehavior]);
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power withBehavior:(id)behavior
{
  uint64_t v5 = power;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0uLL;
  int v17 = 0;
  int v8 = [behavior scale];
  int v9 = (NSDecimal *)[behavior roundingMode];
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }

  else
  {
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v15 = 0;
  }

  uint64_t v10 = _NSDecimalMultiplyByPowerOf10(&v16, v14, v5, v9);
  __int128 v12 = v16;
  int v13 = v17;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0LL, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByRoundingAccordingToBehavior:(id)behavior
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v5 = [behavior scale];
  if (v5 == 0x7FFF) {
    return self;
  }
  int v7 = v5;
  __int128 v13 = 0uLL;
  int v14 = 0;
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }

  else
  {
    v11[0] = 0LL;
    v11[1] = 0LL;
    int v12 = 0;
  }

  _NSDecimalRound((uint64_t)&v13, (int)v11, v7, (NSDecimal *)[behavior roundingMode]);
  int v8 = (void *)objc_opt_self();
  __int128 v9 = v13;
  int v10 = v14;
  return (NSDecimalNumber *)[v8 decimalNumberWithDecimal:&v9];
}

+ (void)setDefaultBehavior:(id)defaultBehavior
{
}

+ (id)defaultBehavior
{
  id result = (id)-[NSMutableDictionary objectForKey:]( -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary"),  "objectForKey:",  @"NSDecimalNumberBehaviors");
  if (!result) {
    return +[NSDecimalNumberHandler defaultDecimalNumberHandler]( &OBJC_CLASS___NSDecimalNumberHandler,  "defaultDecimalNumberHandler");
  }
  return result;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    unsigned int v4 = 0;
    v10[0] = 0LL;
    v10[1] = 0LL;
    int v11 = 0;
    goto LABEL_5;
  }

  -[NSDecimalNumber decimalValue](self, "decimalValue");
  unsigned int v4 = (LODWORD(v10[0]) >> 8) & 0xF;
  if (v4 <= 7) {
LABEL_5:
  }
    bzero((char *)v10 + 2 * v4 + 4, 16LL - 2 * v4);
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt32:SLOBYTE(v10[0]) forKey:@"NS.exponent"];
    [a3 encodeInt32:(LODWORD(v10[0]) >> 8) & 0xF forKey:@"NS.length"];
    [a3 encodeBool:(LODWORD(v10[0]) >> 12) & 1 forKey:@"NS.negative"];
    [a3 encodeBool:(LODWORD(v10[0]) >> 13) & 1 forKey:@"NS.compact"];
    [a3 encodeInt32:1 forKey:@"NS.mantissa.bo"];
    [a3 encodeBytes:(char *)v10 + 4 length:16 forKey:@"NS.mantissa"];
  }

  else
  {
    uint64_t v9 = SLOBYTE(v10[0]);
    __int16 v8 = (LODWORD(v10[0]) >> 8) & 0xF;
    BOOL v7 = (v10[0] & 0x1000) != 0;
    BOOL v6 = (v10[0] & 0x2000) != 0;
    uint64_t v5 = 8LL;
    [a3 encodeValueOfObjCType:"i" at:&v9];
    [a3 encodeValueOfObjCType:"S" at:&v8];
    [a3 encodeValueOfObjCType:"C" at:&v7];
    [a3 encodeValueOfObjCType:"C" at:&v6];
    [a3 encodeValueOfObjCType:"I" at:&v5];
    [a3 encodeArrayOfObjCType:"S" count:v5 at:(char *)v10 + 4];
  }

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (char)charValue
{
  return (int)v2;
}

- (unsigned)unsignedCharValue
{
  return (int)v2;
}

- (signed)shortValue
{
  return (int)v2;
}

- (unsigned)unsignedShortValue
{
  return (int)v2;
}

- (int)intValue
{
  return (int)v2;
}

- (unsigned)unsignedIntValue
{
  return v2;
}

- (int64_t)longValue
{
  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    int64_t v2 = 0LL;
    uint64_t v3 = 2LL * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      int64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2LL;
    }

    while (v3);
  }

  else
  {
    int64_t v2 = 9LL;
    if ((*((_BYTE *)self + 9) & 0x10) != 0) {
      return v2;
    }
    int64_t v2 = 0LL;
  }

  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 10LL;
      --v5;
    }

    while (v5);
  }

  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10LL;
      --v4;
    }

    while (v4);
  }

  if ((*((_BYTE *)self + 9) & 0x10) != 0) {
    return -v2;
  }
  return v2;
}

- (unint64_t)unsignedLongValue
{
  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = 2LL * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      unint64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2LL;
    }

    while (v3);
  }

  else
  {
    unint64_t v2 = 9LL;
    if ((*((_BYTE *)self + 9) & 0x10) != 0) {
      return v2;
    }
    unint64_t v2 = 0LL;
  }

  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }

    while (v5);
  }

  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10LL;
      --v4;
    }

    while (v4);
  }

  if ((*((_BYTE *)self + 9) & 0x10) != 0) {
    return -(uint64_t)v2;
  }
  return v2;
}

- (int64_t)longLongValue
{
  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    int64_t v2 = 0LL;
    uint64_t v3 = 2LL * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      int64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2LL;
    }

    while (v3);
  }

  else
  {
    int64_t v2 = 9LL;
    if ((*((_BYTE *)self + 9) & 0x10) != 0) {
      return v2;
    }
    int64_t v2 = 0LL;
  }

  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 10LL;
      --v5;
    }

    while (v5);
  }

  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10LL;
      --v4;
    }

    while (v4);
  }

  if ((*((_BYTE *)self + 9) & 0x10) != 0) {
    return -v2;
  }
  return v2;
}

- (unint64_t)unsignedLongLongValue
{
  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = 2LL * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      unint64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2LL;
    }

    while (v3);
  }

  else
  {
    unint64_t v2 = 9LL;
    if ((*((_BYTE *)self + 9) & 0x10) != 0) {
      return v2;
    }
    unint64_t v2 = 0LL;
  }

  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }

    while (v5);
  }

  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10LL;
      --v4;
    }

    while (v4);
  }

  if ((*((_BYTE *)self + 9) & 0x10) != 0) {
    return -(uint64_t)v2;
  }
  return v2;
}

- (float)floatValue
{
  return v2;
}

- (BOOL)BOOLValue
{
  return v2 != 0.0;
}

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  if (a5 != 1.0)
  {
    __int16 v8 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSDecimalNumber), "initWithDouble:", a5);
    self = -[NSDecimalNumber decimalNumberByMultiplyingBy:](self, "decimalNumberByMultiplyingBy:", v8);
  }

  return objc_msgSend( -[NSDecimalNumber description](self, "description"),  "getCString:maxLength:encoding:",  a3,  a4,  1);
}

+ (NSDecimalNumber)numberWithChar:(char)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithChar:a3];
}

+ (NSDecimalNumber)numberWithUnsignedChar:(unsigned __int8)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedChar:a3];
}

+ (NSDecimalNumber)numberWithShort:(signed __int16)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithShort:a3];
}

+ (NSDecimalNumber)numberWithUnsignedShort:(unsigned __int16)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedShort:a3];
}

+ (NSDecimalNumber)numberWithInt:(int)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithInt:*(void *)&a3];
}

+ (NSDecimalNumber)numberWithInteger:(int64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithInteger:a3];
}

+ (NSDecimalNumber)numberWithUnsignedInt:(unsigned int)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedInt:*(void *)&a3];
}

+ (NSDecimalNumber)numberWithUnsignedInteger:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedInteger:a3];
}

+ (NSDecimalNumber)numberWithLong:(int64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithLong:a3];
}

+ (NSDecimalNumber)numberWithUnsignedLong:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedLong:a3];
}

+ (NSDecimalNumber)numberWithLongLong:(int64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithLongLong:a3];
}

+ (NSDecimalNumber)numberWithUnsignedLongLong:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedLongLong:a3];
}

+ (NSDecimalNumber)numberWithFloat:(float)a3
{
  id v4 = objc_allocWithZone((Class)&OBJC_CLASS___NSDecimalNumber);
  *(float *)&double v5 = a3;
  return (NSDecimalNumber *)(id)[v4 initWithFloat:v5];
}

+ (NSDecimalNumber)numberWithDouble:(double)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithDouble:a3];
}

+ (NSDecimalNumber)numberWithBool:(BOOL)a3
{
  return (NSDecimalNumber *)(id)[objc_allocWithZone((Class)NSDecimalNumber) initWithBool:a3];
}

@end