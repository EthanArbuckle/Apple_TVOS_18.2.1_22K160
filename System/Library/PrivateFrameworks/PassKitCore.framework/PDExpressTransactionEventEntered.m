@interface PDExpressTransactionEventEntered
- (PDExpressTransactionEventEntered)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)technologyType;
- (void)setTechnologyType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventEntered

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventEntered)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventEntered;
  return (PDExpressTransactionEventEntered *)-[PDExpressTransactionEvent _initWithType:](&v3, "_initWithType:", 0LL);
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

@end