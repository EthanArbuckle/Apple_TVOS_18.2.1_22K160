@interface NSDecimalNumberHandler
+ (NSDecimalNumberHandler)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;
+ (NSDecimalNumberHandler)defaultDecimalNumberHandler;
- (NSDecimalNumberHandler)initWithCoder:(id)a3;
- (NSDecimalNumberHandler)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;
- (id)exceptionDuringOperation:(SEL)a3 error:(unint64_t)a4 leftOperand:(id)a5 rightOperand:(id)a6;
- (signed)scale;
- (unint64_t)roundingMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDecimalNumberHandler

+ (NSDecimalNumberHandler)defaultDecimalNumberHandler
{
  result = (NSDecimalNumberHandler *)defaultDecimalNumberHandler_b;
  if (!defaultDecimalNumberHandler_b)
  {
    result = (NSDecimalNumberHandler *)[objc_allocWithZone((Class)a1) initWithRoundingMode:0 scale:0x7FFFLL raiseOnExactness:0 raiseOnOverflow:1 raiseOnUnderflow:1 ra iseOnDivideByZero:1];
    defaultDecimalNumberHandler_b = (uint64_t)result;
  }

  return result;
}

- (NSDecimalNumberHandler)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  BOOL v8 = divideByZero;
  BOOL v9 = underflow;
  BOOL v10 = overflow;
  BOOL v11 = exact;
  char v13 = roundingMode;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSDecimalNumberHandler;
  result = -[NSDecimalNumberHandler init](&v20, sel_init);
  char v15 = *((_BYTE *)result + 10) & 0x80;
  *((_WORD *)result + 4) = scale;
  if (v11) {
    char v16 = 8;
  }
  else {
    char v16 = 0;
  }
  if (v10) {
    char v17 = 16;
  }
  else {
    char v17 = 0;
  }
  if (v9) {
    char v18 = 32;
  }
  else {
    char v18 = 0;
  }
  if (v8) {
    char v19 = 64;
  }
  else {
    char v19 = 0;
  }
  *((_BYTE *)result + 10) = v16 & 0xF8 | v13 & 7 | v17 | v18 | v19 | v15;
  return result;
}

+ (NSDecimalNumberHandler)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  return (NSDecimalNumberHandler *)(id)[objc_allocWithZone((Class)a1) initWithRoundingMode:roundingMode scale:scale raiseOnExactness:exact raiseOnOverflow:overflow ra iseOnUnderflow:underflow raiseOnDivideByZero:divideByZero];
}

- (unint64_t)roundingMode
{
  return *((_BYTE *)self + 10) & 7;
}

- (signed)scale
{
  return *((_WORD *)self + 4);
}

- (void)encodeWithCoder:(id)a3
{
  if ((*((_BYTE *)self + 10) & 7) != 0) {
    objc_msgSend(a3, "encodeInteger:forKey:");
  }
  uint64_t v5 = *((__int16 *)self + 4);
  if (v5 != 0x7FFF) {
    [a3 encodeInteger:v5 forKey:@"NS.scale"];
  }
  char v6 = *((_BYTE *)self + 10);
  if ((v6 & 8) == 0)
  {
    if ((*((_BYTE *)self + 10) & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    [a3 encodeBool:1 forKey:@"NS.raise.overflow"];
    char v6 = *((_BYTE *)self + 10);
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 0x40) == 0) {
        return;
      }
LABEL_14:
      [a3 encodeBool:1 forKey:@"NS.raise.dividebyzero"];
      return;
    }

    goto LABEL_13;
  }

  [a3 encodeBool:1 forKey:@"NS.raise.exactness"];
  char v6 = *((_BYTE *)self + 10);
  if ((v6 & 0x10) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((v6 & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_13:
  [a3 encodeBool:1 forKey:@"NS.raise.underflow"];
  if ((*((_BYTE *)self + 10) & 0x40) != 0) {
    goto LABEL_14;
  }
}

- (NSDecimalNumberHandler)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"NS.roundingmode"];
    else {
      __int16 v6 = 0x7FFF;
    }
    return -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( self,  "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  v5,  v6,  [a3 decodeBoolForKey:@"NS.raise.exactness"],  objc_msgSend(a3, "decodeBoolForKey:", @"NS.raise.overflow"),  objc_msgSend(a3, "decodeBoolForKey:", @"NS.raise.underflow"),  objc_msgSend(a3, "decodeBoolForKey:", @"NS.raise.dividebyzero"));
  }

  else
  {

    return 0LL;
  }

- (id)exceptionDuringOperation:(SEL)a3 error:(unint64_t)a4 leftOperand:(id)a5 rightOperand:(id)a6
{
  switch(a4)
  {
    case 1uLL:
      if ((*((_BYTE *)self + 10) & 8) == 0) {
        goto LABEL_9;
      }
      __int16 v6 = (void *)MEMORY[0x189603F70];
      v7 = @"NSDecimalNumberExactnessException";
      BOOL v8 = @"NSDecimalNumber exactness exception";
      goto LABEL_11;
    case 2uLL:
      if ((*((_BYTE *)self + 10) & 0x20) == 0) {
        goto LABEL_9;
      }
      __int16 v6 = (void *)MEMORY[0x189603F70];
      v7 = @"NSDecimalNumberUnderflowException";
      BOOL v8 = @"NSDecimalNumber underflow exception";
      goto LABEL_11;
    case 3uLL:
      if ((*((_BYTE *)self + 10) & 0x10) == 0) {
        goto LABEL_9;
      }
      __int16 v6 = (void *)MEMORY[0x189603F70];
      v7 = @"NSDecimalNumberOverflowException";
      BOOL v8 = @"NSDecimalNumber overflow exception";
      goto LABEL_11;
    case 4uLL:
      if ((*((_BYTE *)self + 10) & 0x40) == 0) {
        goto LABEL_9;
      }
      __int16 v6 = (void *)MEMORY[0x189603F70];
      v7 = @"NSDecimalNumberDivideByZeroException";
      BOOL v8 = @"NSDecimalNumber divide by zero exception";
LABEL_11:
      objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0, a6));
      id result = -[NSNumber decimalValue](v12, v10, v11);
      break;
    default:
LABEL_9:
      id result = 0LL;
      break;
  }

  return result;
}

@end