@interface PDExpressTransactionEventTransactionTimeout
- (PDExpressTransactionEventTransactionTimeout)init;
- (id)_initWithType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventTransactionTimeout

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventTransactionTimeout)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventTransactionTimeout;
  return (PDExpressTransactionEventTransactionTimeout *)-[PDExpressTransactionEvent _initWithType:]( &v3,  "_initWithType:",  3LL);
}

@end