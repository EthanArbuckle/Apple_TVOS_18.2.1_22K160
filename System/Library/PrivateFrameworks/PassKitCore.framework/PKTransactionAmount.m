@interface PKTransactionAmount
- (id)initWithTransientCurrencyAmount:(id)a3;
@end

@implementation PKTransactionAmount

- (id)initWithTransientCurrencyAmount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = &OBJC_CLASS___PKTransactionAmount;
  v5 = -[PKTransactionAmount init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 unitIdentifier]);
    -[PKTransactionAmount setUnitIdentifier:](v5, "setUnitIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
    -[PKTransactionAmount setAmount:](v5, "setAmount:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
    -[PKTransactionAmount setLabel:](v5, "setLabel:", v8);

    -[PKTransactionAmount setPending:](v5, "setPending:", [v4 pending]);
  }

  return v5;
}

@end