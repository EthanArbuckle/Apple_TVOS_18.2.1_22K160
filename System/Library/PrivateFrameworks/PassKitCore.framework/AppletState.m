@interface AppletState
- (NSString)paymentTransactionIdentifier;
- (PKTransitAppletState)transitAppletState;
- (void)setPaymentTransactionIdentifier:(id)a3;
@end

@implementation AppletState

- (NSString)paymentTransactionIdentifier
{
  return self->_paymentTransactionIdentifier;
}

- (void)setPaymentTransactionIdentifier:(id)a3
{
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (void).cxx_destruct
{
}

@end