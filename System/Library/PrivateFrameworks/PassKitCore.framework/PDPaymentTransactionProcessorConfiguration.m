@interface PDPaymentTransactionProcessorConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSString)transactionIdentifier;
- (PDPaymentTransactionProcessorConfiguration)initWithTransactionIdentifier:(id)a3 updateReasons:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)updateReasons;
@end

@implementation PDPaymentTransactionProcessorConfiguration

- (PDPaymentTransactionProcessorConfiguration)initWithTransactionIdentifier:(id)a3 updateReasons:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPaymentTransactionProcessorConfiguration;
  v8 = -[PDPaymentTransactionProcessorConfiguration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transactionIdentifier, a3);
    v9->_updateReasons = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDPaymentTransactionProcessorConfiguration *)a3;
  v6 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[PDPaymentTransactionProcessorConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_updateReasons == *((void *)v4 + 2))
  {
    v6 = (void *)*((void *)v4 + 1);
    uint64_t v7 = self->_transactionIdentifier;
    BOOL v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      unsigned __int8 v10 = 1;
    }

    else
    {
      unsigned __int8 v10 = 0;
      if (v7 && v8) {
        unsigned __int8 v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);
      }
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray safelyAddObject:](v3, "safelyAddObject:", self->_transactionIdentifier);
  uint64_t v4 = PKCombinedHash(PKHashStartingValue, v3);
  unint64_t v5 = PKIntegerHash(v4, self->_updateReasons);

  return v5;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
}

@end