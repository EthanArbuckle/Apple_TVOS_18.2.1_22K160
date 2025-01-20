@interface PS190BootStatus
- (PS190BootStatus)initWithStatus:(unsigned __int8)a3;
- (id)description;
- (unsigned)status;
@end

@implementation PS190BootStatus

- (PS190BootStatus)initWithStatus:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190BootStatus;
  result = -[PS190BootStatus init](&v5, sel_init);
  if (result) {
    result->_status = a3;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithUTF8String:PS190StringForBootStatus(self->_status)];
}

- (unsigned)status
{
  return self->_status;
}

@end