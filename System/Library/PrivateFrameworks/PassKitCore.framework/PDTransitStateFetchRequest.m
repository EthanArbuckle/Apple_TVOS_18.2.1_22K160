@interface PDTransitStateFetchRequest
- (BOOL)forceTransactionGeneration;
- (BOOL)isEqual:(id)a3;
- (BOOL)recoverMissingTransactions;
- (NSDate)transactionDate;
- (NSString)passUniqueIdentifier;
- (NSString)paymentApplicationIdentifier;
- (NSString)secureElementIdentifier;
- (PKExpressTransactionState)expressState;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setExpressState:(id)a3;
- (void)setForceTransactionGeneration:(BOOL)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setPaymentApplicationIdentifier:(id)a3;
- (void)setRecoverMissingTransactions:(BOOL)a3;
- (void)setSecureElementIdentifier:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation PDTransitStateFetchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[PDTransitStateFetchRequest init]( +[PDTransitStateFetchRequest allocWithZone:](&OBJC_CLASS___PDTransitStateFetchRequest, "allocWithZone:"),  "init");
  v6 = (NSString *)-[NSString copyWithZone:](self->_passUniqueIdentifier, "copyWithZone:", a3);
  passUniqueIdentifier = v5->_passUniqueIdentifier;
  v5->_passUniqueIdentifier = v6;

  v8 = (NSString *)-[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = v8;

  v10 = (NSString *)-[NSString copyWithZone:](self->_paymentApplicationIdentifier, "copyWithZone:", a3);
  paymentApplicationIdentifier = v5->_paymentApplicationIdentifier;
  v5->_paymentApplicationIdentifier = v10;

  v5->_forceTransactionGeneration = self->_forceTransactionGeneration;
  v12 = (NSDate *)-[NSDate copyWithZone:](self->_transactionDate, "copyWithZone:", a3);
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = v12;

  v5->_recoverMissingTransactions = self->_recoverMissingTransactions;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDTransitStateFetchRequest, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if ((isKindOfClass & 1) != 0) {
    v8 = v4;
  }
  else {
    v8 = 0LL;
  }
  id v9 = v8;
  if ((isKindOfClass & 1) != 0
    && PKEqualObjects(self->_passUniqueIdentifier, v4[2])
    && PKEqualObjects(self->_secureElementIdentifier, v4[3]))
  {
    char v10 = PKEqualObjects(self->_paymentApplicationIdentifier, v4[4]);
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_passUniqueIdentifier, "hash");
  unint64_t v4 = -[NSString hash](self->_secureElementIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_paymentApplicationIdentifier, "hash");
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
}

- (PKExpressTransactionState)expressState
{
  return self->_expressState;
}

- (void)setExpressState:(id)a3
{
}

- (BOOL)forceTransactionGeneration
{
  return self->_forceTransactionGeneration;
}

- (void)setForceTransactionGeneration:(BOOL)a3
{
  self->_forceTransactionGeneration = a3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (BOOL)recoverMissingTransactions
{
  return self->_recoverMissingTransactions;
}

- (void)setRecoverMissingTransactions:(BOOL)a3
{
  self->_recoverMissingTransactions = a3;
}

- (void).cxx_destruct
{
}

@end