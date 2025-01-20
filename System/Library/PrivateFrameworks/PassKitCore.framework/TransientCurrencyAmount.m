@interface TransientCurrencyAmount
- (BOOL)pending;
- (NSDecimalNumber)amount;
- (NSNumber)transactionPID;
- (NSString)currency;
- (NSString)label;
- (NSString)preformattedString;
- (NSString)unitIdentifier;
- (id)currencyAmount;
- (int64_t)exponent;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setExponent:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setPreformattedString:(id)a3;
- (void)setTransactionPID:(id)a3;
- (void)setUnitIdentifier:(id)a3;
@end

@implementation TransientCurrencyAmount

- (id)currencyAmount
{
  currency = self->_currency;
  if (currency)
  {
    v4 = (void *)PKNoCurrencyCode;
    v5 = currency;
    v6 = v4;
    if (v5 == v6)
    {
    }

    else
    {
      v7 = v6;
      if (!v6)
      {

LABEL_9:
        v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  self->_amount,  self->_currency,  self->_exponent);
        return v9;
      }

      unsigned __int8 v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if ((v8 & 1) == 0) {
        goto LABEL_9;
      }
    }
  }

  v9 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:exponent:preformattedString:",  self->_amount,  self->_exponent,  self->_preformattedString);
  return v9;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_exponent = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)preformattedString
{
  return self->_preformattedString;
}

- (void)setPreformattedString:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSString)unitIdentifier
{
  return self->_unitIdentifier;
}

- (void)setUnitIdentifier:(id)a3
{
}

- (NSNumber)transactionPID
{
  return self->_transactionPID;
}

- (void)setTransactionPID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end