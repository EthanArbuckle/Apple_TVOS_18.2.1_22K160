@interface MicroPaymentProductDiscount
- (MicroPaymentProductDiscount)initWithDictionary:(id)a3;
- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod;
- (NSNumber)price;
- (NSString)identifier;
- (id)copyProductDiscount;
- (unint64_t)numberOfPeriods;
- (unint64_t)paymentMode;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setNumberOfPeriods:(unint64_t)a3;
- (void)setPaymentMode:(unint64_t)a3;
- (void)setPrice:(id)a3;
- (void)setSubscriptionPeriod:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MicroPaymentProductDiscount

- (MicroPaymentProductDiscount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[MicroPaymentProductDiscount init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"price"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      -[MicroPaymentProductDiscount setPrice:](v5, "setPrice:", v6);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"modeType"]);

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      if ([v8 isEqualToString:@"PayAsYouGo"])
      {
        uint64_t v10 = 0LL;
      }

      else if ([v8 isEqualToString:@"PayUpFront"])
      {
        uint64_t v10 = 1LL;
      }

      else
      {
        uint64_t v10 = 2LL;
      }

      -[MicroPaymentProductDiscount setPaymentMode:](v5, "setPaymentMode:", v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"numOfPeriods"]);

    if ((objc_opt_respondsToSelector(v11, "unsignedIntegerValue") & 1) == 0) {
      goto LABEL_15;
    }
    if ([v11 unsignedIntegerValue])
    {
      -[MicroPaymentProductDiscount setNumberOfPeriods:]( v5,  "setNumberOfPeriods:",  [v11 unsignedIntegerValue]);
LABEL_15:
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"recurringSubscriptionPeriod"]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[MicroPaymentProduct periodFromISO8601String:]( &OBJC_CLASS___MicroPaymentProduct,  "periodFromISO8601String:",  v12));
        -[MicroPaymentProductDiscount setSubscriptionPeriod:](v5, "setSubscriptionPeriod:", v14);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"recurringSubscriptionPeriod"]);

      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[MicroPaymentProduct periodFromISO8601String:]( &OBJC_CLASS___MicroPaymentProduct,  "periodFromISO8601String:",  v15));
        -[MicroPaymentProductDiscount setSubscriptionPeriod:](v5, "setSubscriptionPeriod:", v17);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"]);

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0) {
        goto LABEL_25;
      }
      if ([v18 isEqualToString:@"IntroOffer"])
      {
        uint64_t v20 = 0LL;
      }

      else
      {
        uint64_t v20 = 1LL;
      }

      -[MicroPaymentProductDiscount setType:](v5, "setType:", v20);
LABEL_25:
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"id"]);

      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v8, v21) & 1) != 0) {
        -[MicroPaymentProductDiscount setIdentifier:](v5, "setIdentifier:", v8);
      }
      goto LABEL_29;
    }

    v8 = v11;
LABEL_28:

    v5 = 0LL;
LABEL_29:
  }

  return v5;
}

- (id)copyProductDiscount
{
  id v3 = objc_alloc_init((Class)sub_1001468E8());
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentProductDiscount price](self, "price"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  v5));
  [v3 _setPrice:v6];

  objc_msgSend(v3, "_setPaymentMode:", -[MicroPaymentProductDiscount paymentMode](self, "paymentMode"));
  objc_msgSend(v3, "_setNumberOfPeriods:", -[MicroPaymentProductDiscount numberOfPeriods](self, "numberOfPeriods"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentProductDiscount identifier](self, "identifier"));
  [v3 _setIdentifier:v7];

  objc_msgSend(v3, "_setType:", -[MicroPaymentProductDiscount type](self, "type"));
  id v8 = objc_alloc_init((Class)sub_1001468D0());
  objc_msgSend(v8, "_setUnit:", -[MicroPaymentProductSubscriptionPeriod unit](self->_subscriptionPeriod, "unit"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentProductDiscount subscriptionPeriod](self, "subscriptionPeriod"));
  objc_msgSend(v8, "_setNumberOfUnits:", objc_msgSend(v9, "numberOfUnits"));

  [v3 _setSubscriptionPeriod:v8];
  return v3;
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod
{
  return self->_subscriptionPeriod;
}

- (void)setSubscriptionPeriod:(id)a3
{
}

- (unint64_t)numberOfPeriods
{
  return self->_numberOfPeriods;
}

- (void)setNumberOfPeriods:(unint64_t)a3
{
  self->_numberOfPeriods = a3;
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end