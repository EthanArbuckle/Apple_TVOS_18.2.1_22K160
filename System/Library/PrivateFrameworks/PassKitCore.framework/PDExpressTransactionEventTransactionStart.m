@interface PDExpressTransactionEventTransactionStart
- (NSString)applicationIdentifier;
- (NSString)keyIdentifier;
- (PDExpressTransactionEventTransactionStart)init;
- (id)_initWithType:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation PDExpressTransactionEventTransactionStart

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventTransactionStart)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventTransactionStart;
  return (PDExpressTransactionEventTransactionStart *)-[PDExpressTransactionEvent _initWithType:]( &v3,  "_initWithType:",  2LL);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end