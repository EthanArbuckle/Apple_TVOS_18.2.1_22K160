@interface AppleTypeCRetimerPanicStatus
- (AppleTypeCRetimerPanicStatus)initWithPanicState:(BOOL)a3 assertID:(unsigned int)a4;
- (BOOL)fwPanic;
- (id)description;
- (unsigned)assertID;
- (void)setAssertID:(unsigned int)a3;
- (void)setFwPanic:(BOOL)a3;
@end

@implementation AppleTypeCRetimerPanicStatus

- (AppleTypeCRetimerPanicStatus)initWithPanicState:(BOOL)a3 assertID:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerPanicStatus;
  result = -[AppleTypeCRetimerPanicStatus init](&v7, sel_init);
  if (result)
  {
    result->_fwPanic = a3;
    result->_assertID = a4;
  }

  return result;
}

- (id)description
{
  v2 = @"YES";
  if (!self->_fwPanic) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"panicState=%@ assertID=%u", v2, self->_assertID];
}

- (BOOL)fwPanic
{
  return self->_fwPanic;
}

- (void)setFwPanic:(BOOL)a3
{
  self->_fwPanic = a3;
}

- (unsigned)assertID
{
  return self->_assertID;
}

- (void)setAssertID:(unsigned int)a3
{
  self->_assertID = a3;
}

@end