@interface PDExpressTransactionEventTransactionEnd
- (NSNumber)brandCode;
- (PDExpressTransactionEventTransactionEnd)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)status;
- (void)setBrandCode:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PDExpressTransactionEventTransactionEnd

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventTransactionEnd)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventTransactionEnd;
  return (PDExpressTransactionEventTransactionEnd *)-[PDExpressTransactionEvent _initWithType:]( &v3,  "_initWithType:",  4LL);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSNumber)brandCode
{
  return self->_brandCode;
}

- (void)setBrandCode:(id)a3
{
  self->_brandCode = (NSNumber *)a3;
}

@end