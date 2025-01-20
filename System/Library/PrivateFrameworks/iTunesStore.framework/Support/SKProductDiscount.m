@interface SKProductDiscount
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)identifier;
- (NSUInteger)numberOfPeriods;
- (SKProductDiscount)init;
- (SKProductDiscount)initWithDictionary:(id)a3;
- (SKProductDiscount)initWithXPCEncoding:(id)a3;
- (SKProductDiscountPaymentMode)paymentMode;
- (SKProductDiscountType)type;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)copyXPCEncoding;
- (void)_setIdentifier:(id)a3;
- (void)_setNumberOfPeriods:(unint64_t)a3;
- (void)_setPaymentMode:(unint64_t)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
- (void)_setType:(unint64_t)a3;
@end

@implementation SKProductDiscount

- (SKProductDiscount)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKProductDiscount;
  v2 = -[SKProductDiscount init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SKProductDiscountInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }

  return v2;
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 1);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 2);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 4);
}

- (NSUInteger)numberOfPeriods
{
  return *((void *)self->_internal + 5);
}

- (SKProductDiscountPaymentMode)paymentMode
{
  return *((void *)self->_internal + 3);
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (SKProductDiscountType)type
{
  return *((void *)self->_internal + 6);
}

- (void)_setNumberOfPeriods:(unint64_t)a3
{
  *((void *)self->_internal + 5) = a3;
}

- (void)_setPaymentMode:(unint64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setPrice:(id)a3
{
}

- (void)_setPriceLocale:(id)a3
{
}

- (void)_setSubscriptionPeriod:(id)a3
{
}

- (void)_setIdentifier:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[7];
  internal[7] = v4;
}

- (void)_setType:(unint64_t)a3
{
  *((void *)self->_internal + 6) = a3;
}

- (SKProductDiscount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[SKProductDiscount init](self, "init");
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pri"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      if (!v8) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
      {
        v8 = 0LL;
        goto LABEL_12;
      }

      v10 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
      v8 = -[NSDecimalNumber initWithString:](v10, "initWithString:", v11);

      if (!v8) {
        goto LABEL_12;
      }
    }

    v12 = -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( objc_alloc(&OBJC_CLASS___NSDecimalNumberHandler),  "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  0LL,  2LL,  0LL,  0LL,  0LL,  0LL);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:]( v8,  "decimalNumberByRoundingAccordingToBehavior:",  v12));
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v8;
    }
    objc_storeStrong((id *)v5->_internal + 1, v15);

LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"per"]);

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    {
      v18 = -[SKProductSubscriptionPeriod initWithISO8601String:]( objc_alloc(&OBJC_CLASS___SKProductSubscriptionPeriod),  "initWithISO8601String:",  v16);
      id internal = v5->_internal;
      v20 = (void *)internal[4];
      internal[4] = v18;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"per-count"]);

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
      *((void *)v5->_internal + 5) = [v21 unsignedIntegerValue];
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mod"]);

    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    {
      v25 = v23;
      if ((-[SKProductDiscount isEqualToString:](v25, "isEqualToString:", @"FreeTrial") & 1) != 0)
      {
        uint64_t v26 = 2LL;
      }

      else if ((-[SKProductDiscount isEqualToString:](v25, "isEqualToString:", @"PayUpFront") & 1) != 0)
      {
        uint64_t v26 = 1LL;
      }

      else
      {
        if (!-[SKProductDiscount isEqualToString:](v25, "isEqualToString:", @"PayAsYouGo"))
        {
          v27 = v5;
          goto LABEL_29;
        }

        uint64_t v26 = 0LL;
      }

      *((void *)v5->_internal + 3) = v26;
    }

    v27 = (SKProductDiscount *)v5->_internal;
    if (v27->_internal && *((void *)v5->_internal + 4))
    {
      uint64_t v28 = *((void *)v5->_internal + 5);

      if (v28)
      {
LABEL_31:

        goto LABEL_32;
      }

- (SKProductDiscount)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_super v6 = -[SKProductDiscount init](self, "init");
    if (!v6) {
      goto LABEL_5;
    }
    *((void *)v6->_internal + 5) = xpc_dictionary_get_uint64(v5, "0");
    *((void *)v6->_internal + 3) = xpc_dictionary_get_uint64(v5, "1");
    v8 = objc_alloc(&OBJC_CLASS___SKProductSubscriptionPeriod);
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "4");
    v10 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    v11 = -[SKProductSubscriptionPeriod initWithXPCEncoding:](v8, "initWithXPCEncoding:", v10);
    id internal = v6->_internal;
    uint64_t v13 = (void *)internal[4];
    internal[4] = v11;

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v15 = sub_1000E358C(v5, "5", v14);
    v16 = v6->_internal;
    uint64_t v17 = (void *)v16[7];
    v16[7] = v15;

    *((void *)v6->_internal + 6) = xpc_dictionary_get_uint64(v5, "6");
    CFDictionaryRef v18 = sub_1000E3558(v5, "2");
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      self = v18;
      if (!self) {
        goto LABEL_17;
      }
LABEL_12:
      v23 = -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( objc_alloc(&OBJC_CLASS___NSDecimalNumberHandler),  "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  0LL,  2LL,  0LL,  0LL,  0LL,  0LL);
      uint64_t v24 = objc_claimAutoreleasedReturnValue( -[SKProductDiscount decimalNumberByRoundingAccordingToBehavior:]( self,  "decimalNumberByRoundingAccordingToBehavior:",  v23));
      v25 = (void *)v24;
      if (v24) {
        uint64_t v26 = (SKProductDiscount *)v24;
      }
      else {
        uint64_t v26 = self;
      }
      objc_storeStrong((id *)v6->_internal + 1, v26);

      goto LABEL_17;
    }

    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
    {
      v21 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary stringValue](v18, "stringValue"));
      self = -[NSDecimalNumber initWithString:](v21, "initWithString:", v22);

      if (self) {
        goto LABEL_12;
      }
    }

    else
    {
      self = 0LL;
    }

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v3, "0", *((void *)self->_internal + 5));
  xpc_dictionary_set_uint64(v3, "1", *((void *)self->_internal + 3));
  sub_1000E35D4(v3, "2", *((__CFString **)self->_internal + 1));
  id v4 = [*((id *)self->_internal + 4) copyXPCEncoding];
  xpc_dictionary_set_value(v3, "4", v4);

  sub_1000E35D4(v3, "5", *((__CFString **)self->_internal + 7));
  xpc_dictionary_set_uint64(v3, "6", *((void *)self->_internal + 6));
  return v3;
}

- (void).cxx_destruct
{
}

@end