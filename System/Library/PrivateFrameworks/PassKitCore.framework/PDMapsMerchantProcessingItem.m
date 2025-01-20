@interface PDMapsMerchantProcessingItem
- (NSSet)transactionSourceIdentifiers;
- (PKPaymentTransaction)transaction;
- (void)setTransaction:(id)a3;
- (void)setTransactionSourceIdentifiers:(id)a3;
@end

@implementation PDMapsMerchantProcessingItem

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end