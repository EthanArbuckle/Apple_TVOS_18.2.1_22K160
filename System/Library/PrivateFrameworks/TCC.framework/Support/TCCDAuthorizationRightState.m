@interface TCCDAuthorizationRightState
- (NSString)description;
- (NSString)reasonDescription;
- (NSString)rightDescription;
- (TCCDAuthorizationRightState)init;
- (unint64_t)reason;
- (unint64_t)right;
- (void)reset;
- (void)setReason:(unint64_t)a3;
- (void)setRight:(unint64_t)a3;
@end

@implementation TCCDAuthorizationRightState

- (TCCDAuthorizationRightState)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TCCDAuthorizationRightState;
  v2 = -[TCCDAuthorizationRightState init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TCCDAuthorizationRightState setRight:](v2, "setRight:", 1LL);
    -[TCCDAuthorizationRightState setReason:](v3, "setReason:", 0LL);
  }

  return v3;
}

- (NSString)rightDescription
{
  unint64_t v2 = -[TCCDAuthorizationRightState right](self, "right");
  if (v2 > 6) {
    return (NSString *)@"<Unspported Authorization Right value>";
  }
  else {
    return &off_1000654C8[v2]->isa;
  }
}

- (NSString)reasonDescription
{
  unint64_t v2 = -[TCCDAuthorizationRightState reason](self, "reason");
  if (v2 > 0xF) {
    return (NSString *)@"<Unspported Authorization Reason value>";
  }
  else {
    return &off_100065500[v2]->isa;
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAuthorizationRightState rightDescription](self, "rightDescription"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAuthorizationRightState reasonDescription](self, "reasonDescription"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@ (%@)", v4, v5);

  return (NSString *)v3;
}

- (void)reset
{
}

- (unint64_t)right
{
  return self->_right;
}

- (void)setRight:(unint64_t)a3
{
  self->_right = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end