@interface NSDecimalNumberPlaceholder
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
- (Class)classForCoder;
- (NSDecimalNumberPlaceholder)init;
- (NSDecimalNumberPlaceholder)initWithBool:(BOOL)a3;
- (NSDecimalNumberPlaceholder)initWithChar:(char)a3;
- (NSDecimalNumberPlaceholder)initWithCoder:(id)a3;
- (NSDecimalNumberPlaceholder)initWithDecimal:(id *)a3;
- (NSDecimalNumberPlaceholder)initWithDouble:(double)a3;
- (NSDecimalNumberPlaceholder)initWithFloat:(float)a3;
- (NSDecimalNumberPlaceholder)initWithInt:(int)a3;
- (NSDecimalNumberPlaceholder)initWithLongLong:(int64_t)a3;
- (NSDecimalNumberPlaceholder)initWithMantissa:(unint64_t)a3 exponent:(signed __int16)a4 isNegative:(BOOL)a5;
- (NSDecimalNumberPlaceholder)initWithShort:(signed __int16)a3;
- (NSDecimalNumberPlaceholder)initWithString:(id)a3;
- (NSDecimalNumberPlaceholder)initWithString:(id)a3 locale:(id)a4;
- (NSDecimalNumberPlaceholder)initWithUnsignedChar:(unsigned __int8)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedInt:(unsigned int)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedLongLong:(unint64_t)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedShort:(unsigned __int16)a3;
- (unint64_t)retainCount;
@end

@implementation NSDecimalNumberPlaceholder

+ (id)allocWithZone:(_NSZone *)a3
{
  return &_cachedPlaceholder;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (NSDecimalNumberPlaceholder)init
{
  return (NSDecimalNumberPlaceholder *)-[NSDecimalNumber copyWithZone:]( +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"),  "copyWithZone:",  0LL);
}

- (NSDecimalNumberPlaceholder)initWithDecimal:(id *)a3
{
  v4 = (objc_class *)objc_opt_self();
  v5 = (char *)NSAllocateObject(v4, ((unint64_t)*(_DWORD *)a3 >> 7) & 0x1E, 0LL);
  NSDecimalCopy((NSDecimal *)(v5 + 8), (const NSDecimal *)a3);
  return (NSDecimalNumberPlaceholder *)v5;
}

- (NSDecimalNumberPlaceholder)initWithString:(id)a3
{
  return -[NSDecimalNumberPlaceholder initWithString:locale:](self, "initWithString:locale:", a3, 0LL);
}

- (NSDecimalNumberPlaceholder)initWithString:(id)a3 locale:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v6 = (void *)[objc_allocWithZone((Class)NSScanner) initWithString:a3];
  v7 = v6;
  __int128 v13 = 0uLL;
  int v14 = 0;
  if (a4) {
    [v6 setLocale:a4];
  }
  if ([v7 scanDecimal:&v13])
  {
    __int128 v11 = v13;
    int v12 = v14;
    v8 = -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", &v11);
  }

  else
  {
    v8 = -[NSDecimalNumberPlaceholder init](self, "init");
  }

  v9 = v8;

  return v9;
}

- (NSDecimalNumberPlaceholder)initWithMantissa:(unint64_t)a3 exponent:(signed __int16)a4 isNegative:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(_OWORD *)&v11[4] = 0uLL;
  int v5 = 0;
  if (a3)
  {
    unint64_t v6 = 0LL;
    do
    {
      *(_WORD *)&v11[2 * v6 + 4] = a3;
      v5 += 256;
      if (v6 > 6) {
        break;
      }
      a3 >>= 16;
      ++v6;
    }

    while (a3);
  }

  if (a5) {
    int v7 = 4096;
  }
  else {
    int v7 = 0;
  }
  *(_DWORD *)__int128 v11 = v7 & 0xFFFFFF00 | a4 | v5;
  __int128 v9 = *(_OWORD *)v11;
  int v10 = *(_DWORD *)&v11[16];
  return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", &v9);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumberPlaceholder)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    *(_OWORD *)&v29[4] = 0uLL;
    [a3 decodeValueOfObjCType:"i" at:v26 size:4];
    [a3 decodeValueOfObjCType:"S" at:&v25 size:2];
    [a3 decodeValueOfObjCType:"C" at:&v24 size:1];
    [a3 decodeValueOfObjCType:"C" at:&v23 size:1];
    unsigned int v16 = (v25 & 0xF) << 8;
    if (v16 < 0x801)
    {
      *(_DWORD *)v29 = v26[0] | v16 | ((v24 != 0) << 12) | ((v23 != 0) << 13);
      [a3 decodeValueOfObjCType:"I" at:&v22 size:4];
      if (v22 < 9)
      {
        objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "S");
        __int128 v27 = *(_OWORD *)v29;
        int v28 = *(_DWORD *)&v29[16];
        uint64_t v15 = &v27;
        return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", v15);
      }
    }

    v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: critical NSDecimalNumber archived data is wrong size",  self);

    v20 = (void *)MEMORY[0x189603F70];
    v21 = v19;
LABEL_20:
    objc_exception_throw((id)[v20 exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v21 userInfo:0]);
    JUMPOUT(0x183561F00LL);
  }

  unsigned __int8 v5 = [a3 decodeInt32ForKey:@"NS.exponent"];
  char v6 = [a3 decodeInt32ForKey:@"NS.length"];
  if ((v6 & 0xFu) >= 9
    || ((char v7 = v6, ![a3 decodeBoolForKey:@"NS.negative"]) ? (v8 = 0) : (v8 = 4096),
        ![a3 decodeBoolForKey:@"NS.compact"] ? (int v9 = 0) : (int v9 = 0x2000),
        __int32 v10 = [a3 decodeInt32ForKey:@"NS.mantissa.bo"],
        __int128 v11 = (int8x16_t *)[a3 decodeBytesForKey:@"NS.mantissa" returnedLength:&v27],
        (void)v27 != 16LL))
  {
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: critical NSDecimalNumber archived data is wrong size",  self);
LABEL_19:
    v21 = v18;
    v20 = (void *)MEMORY[0x189603F70];
    goto LABEL_20;
  }

  if (!v11)
  {
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: critical NSDecimalNumber archived data is missing",  self);
    goto LABEL_19;
  }

  v12.i32[0] = 1;
  v13.i32[0] = v10;
  int8x16_t v14 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v13, v12), 0), *v11, vrev16q_s8(*v11));
  *(_DWORD *)v29 = v5 | ((v7 & 0xF) << 8) | v8 | v9;
  *(int8x16_t *)&v29[4] = v14;
  uint64_t v15 = (__int128 *)v29;
  return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", v15);
}

- (NSDecimalNumberPlaceholder)initWithLongLong:(int64_t)a3
{
  if (a3 >= 0) {
    int64_t v3 = a3;
  }
  else {
    int64_t v3 = -a3;
  }
  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:]( self,  "initWithMantissa:exponent:isNegative:",  v3,  0LL,  (unint64_t)a3 >> 63);
}

- (NSDecimalNumberPlaceholder)initWithBool:(BOOL)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithChar:(char)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithShort:(signed __int16)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithInt:(int)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedLongLong:(unint64_t)a3
{
  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:]( self,  "initWithMantissa:exponent:isNegative:",  a3,  0LL,  0LL);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedChar:(unsigned __int8)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedShort:(unsigned __int16)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedInt:(unsigned int)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithDouble:(double)a3
{
  double v3 = -a3;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (v3 >= 1.0e-110)
  {
    if (v3 <= 1.8e146)
    {
      for (__int16 i = 0; v3 < 1.84467441e19; --i)
        double v3 = v3 * 10.0;
      for (; v3 > 1.84467441e19; ++i)
        double v3 = v3 / 10.0;
      unint64_t v4 = (unint64_t)v3;
      BOOL v6 = a3 < 0.0;
      uint64_t v5 = i;
    }

    else
    {
      BOOL v6 = a3 < 0.0;
      unint64_t v4 = -1LL;
      uint64_t v5 = 127LL;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    BOOL v6 = 0LL;
  }

  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:]( self,  "initWithMantissa:exponent:isNegative:",  v4,  v5,  v6);
}

- (NSDecimalNumberPlaceholder)initWithFloat:(float)a3
{
  return -[NSDecimalNumberPlaceholder initWithDouble:](self, "initWithDouble:", a3);
}

@end