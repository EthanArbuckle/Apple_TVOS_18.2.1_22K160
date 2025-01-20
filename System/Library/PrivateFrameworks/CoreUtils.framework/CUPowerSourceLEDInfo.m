@interface CUPowerSourceLEDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CUPowerSourceLEDInfo)initWithCoder:(id)a3;
- (id)description;
- (int)LEDColor;
- (int)LEDState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLEDColor:(int)a3;
- (void)setLEDState:(int)a3;
@end

@implementation CUPowerSourceLEDInfo

- (CUPowerSourceLEDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CUPowerSourceLEDInfo;
  v5 = -[CUPowerSourceLEDInfo init](&v8, sel_init);
  if (v5)
  {
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t LEDState = self->_LEDState;
  id v7 = v4;
  if ((_DWORD)LEDState)
  {
    [v4 encodeInteger:LEDState forKey:@"state"];
    id v4 = v7;
  }

  uint64_t LEDColor = self->_LEDColor;
  if ((_DWORD)LEDColor)
  {
    [v7 encodeInteger:LEDColor forKey:@"color"];
    id v4 = v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int LEDState = self->_LEDState, LEDState == [v4 LEDState]))
  {
    int LEDColor = self->_LEDColor;
    BOOL v7 = LEDColor == [v4 LEDColor];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_LEDColor ^ self->_LEDState;
}

- (id)description
{
  CFMutableStringRef v8 = 0LL;
  NSAppendPrintF(&v8);
  v2 = v8;
  CFMutableStringRef v7 = v2;
  NSAppendPrintF(&v7);
  v3 = v7;

  CFMutableStringRef v6 = v3;
  NSAppendPrintF(&v6);
  id v4 = v6;

  return v4;
}

- (int)LEDColor
{
  return self->_LEDColor;
}

- (void)setLEDColor:(int)a3
{
  self->_int LEDColor = a3;
}

- (int)LEDState
{
  return self->_LEDState;
}

- (void)setLEDState:(int)a3
{
  self->_int LEDState = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end