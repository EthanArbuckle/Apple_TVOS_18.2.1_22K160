@interface PS190Epoch
- (PS190Epoch)initWithEpoch:(unsigned __int8)a3;
- (id)description;
- (unsigned)epoch;
@end

@implementation PS190Epoch

- (PS190Epoch)initWithEpoch:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190Epoch;
  result = -[PS190Epoch init](&v5, sel_init);
  if (result) {
    result->_epoch = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", self->_epoch);
}

- (unsigned)epoch
{
  return self->_epoch;
}

@end