@interface MicroPaymentProduct
+ (id)periodFromISO8601String:(id)a3;
- (BOOL)isHosted;
- (MicroPaymentProduct)initWithDictionary:(id)a3;
- (MicroPaymentProductDiscount)introductoryPrice;
- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod;
- (NSArray)discounts;
- (NSNumber)price;
- (NSString)contentVersion;
- (NSString)localeIdentifier;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)productIdentifier;
- (NSString)subscriptionGroupIdentifier;
- (id)copyProduct;
- (int64_t)contentSize;
- (void)dealloc;
- (void)setContentSize:(int64_t)a3;
- (void)setContentVersion:(id)a3;
- (void)setDiscounts:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setIntroductoryPrice:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPrice:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setSubscriptionGroupIdentifier:(id)a3;
- (void)setSubscriptionPeriod:(id)a3;
@end

@implementation MicroPaymentProduct

- (MicroPaymentProduct)initWithDictionary:(id)a3
{
  v4 = -[MicroPaymentProduct init](self, "init");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"icu-locale"];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      -[MicroPaymentProduct setLocaleIdentifier:](v4, "setLocaleIdentifier:", v5);
    }
    id v7 = [a3 objectForKey:@"description"];
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      -[MicroPaymentProduct setLocalizedDescription:](v4, "setLocalizedDescription:", v7);
    }
    id v9 = [a3 objectForKey:@"is-hosted"];
    if ((objc_opt_respondsToSelector(v9, "BOOLValue") & 1) != 0) {
      -[MicroPaymentProduct setHosted:](v4, "setHosted:", [v9 BOOLValue]);
    }
    id v10 = [a3 objectForKey:@"title"];
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      -[MicroPaymentProduct setLocalizedTitle:](v4, "setLocalizedTitle:", v10);
    }
    id v12 = [a3 objectForKey:@"offerName"];
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      -[MicroPaymentProduct setProductIdentifier:](v4, "setProductIdentifier:", v12);
    }
    id v14 = [a3 objectForKey:@"version"];
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
      -[MicroPaymentProduct setContentVersion:](v4, "setContentVersion:", v14);
    }
    id v16 = [a3 objectForKey:@"subscriptionFamilyId"];
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      -[MicroPaymentProduct setSubscriptionGroupIdentifier:](v4, "setSubscriptionGroupIdentifier:", v16);
    }
    id v18 = [a3 objectForKey:@"recurringSubscriptionPeriod"];
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
      -[MicroPaymentProduct setSubscriptionPeriod:]( v4,  "setSubscriptionPeriod:",  [(id)objc_opt_class(v4) periodFromISO8601String:v18]);
    }
    id v20 = [a3 objectForKey:SSItemProtocolKeyStoreOffers];
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      id v22 = [v20 objectForKey:@"STDQ"];
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      {
        id v24 = [v22 objectForKey:@"price"];
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
          -[MicroPaymentProduct setPrice:](v4, "setPrice:", v24);
        }
        id v26 = [v22 objectForKey:@"size"];
        if ((objc_opt_respondsToSelector(v26, "longLongValue") & 1) != 0) {
          -[MicroPaymentProduct setContentSize:](v4, "setContentSize:", [v26 longLongValue]);
        }
      }
    }

    id v27 = [a3 objectForKey:@"discounts"];
    v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v29 = [v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = -[MicroPaymentProductDiscount initWithDictionary:]( objc_alloc(&OBJC_CLASS___MicroPaymentProductDiscount),  "initWithDictionary:",  *(void *)(*((void *)&v42 + 1) + 8LL * (void)i));
          if (-[MicroPaymentProductDiscount type](v33, "type"))
          {
            if ((id)-[MicroPaymentProductDiscount type](v33, "type") == (id)1) {
              -[NSMutableArray addObject:](v28, "addObject:", v33);
            }
          }

          else
          {
            -[MicroPaymentProduct setIntroductoryPrice:](v4, "setIntroductoryPrice:", v33);
          }
        }

        id v30 = [v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v30);
    }

    -[MicroPaymentProduct setDiscounts:]( v4,  "setDiscounts:",  +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v28));

    if (!v4->_productIdentifier || !v4->_localeIdentifier || !v4->_price)
    {
      id v34 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v34) {
        id v34 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v35 = [v34 shouldLog];
      else {
        LODWORD(v36) = v35;
      }
      v37 = (os_log_s *)[v34 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v36 = v36;
      }
      else {
        v36 &= 2u;
      }
      if ((_DWORD)v36)
      {
        uint64_t v38 = objc_opt_class(v4);
        int v46 = 138412290;
        uint64_t v47 = v38;
        uint64_t v39 = _os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "%@: Received invalid product dictionary",  &v46,  12);
        if (v39)
        {
          v40 = (void *)v39;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v39, 4LL);
          free(v40);
          SSFileLog(v34, @"%@");
        }
      }

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPaymentProduct;
  -[MicroPaymentProduct dealloc](&v3, "dealloc");
}

- (id)copyProduct
{
  id v3 = objc_alloc_init((Class)sub_1001468DC());
  v4 = -[MicroPaymentProduct price](self, "price");
  if (-[MicroPaymentProduct isHosted](self, "isHosted"))
  {
    objc_msgSend(v3, "_setContentVersion:", -[MicroPaymentProduct contentVersion](self, "contentVersion"));
    [v3 _setDownloadable:1];
    objc_msgSend( v3,  "_setDownloadContentLengths:",  +[NSArray arrayWithObject:]( NSArray,  "arrayWithObject:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  -[MicroPaymentProduct contentSize](self, "contentSize"))));
  }

  objc_msgSend(v3, "_setLocaleIdentifier:", -[MicroPaymentProduct localeIdentifier](self, "localeIdentifier"));
  objc_msgSend( v3,  "_setLocalizedDescription:",  -[MicroPaymentProduct localizedDescription](self, "localizedDescription"));
  objc_msgSend(v3, "_setLocalizedTitle:", -[MicroPaymentProduct localizedTitle](self, "localizedTitle"));
  objc_msgSend( v3,  "_setPrice:",  +[NSDecimalNumber decimalNumberWithString:]( NSDecimalNumber,  "decimalNumberWithString:",  -[NSNumber stringValue](v4, "stringValue")));
  objc_msgSend(v3, "_setProductIdentifier:", -[MicroPaymentProduct productIdentifier](self, "productIdentifier"));
  objc_msgSend( v3,  "_setSubscriptionGroupIdentifier:",  -[MicroPaymentProduct subscriptionGroupIdentifier](self, "subscriptionGroupIdentifier"));
  id v5 = objc_alloc_init((Class)sub_1001468D0());
  objc_msgSend(v5, "_setUnit:", -[MicroPaymentProductSubscriptionPeriod unit](self->_subscriptionPeriod, "unit"));
  objc_msgSend( v5,  "_setNumberOfUnits:",  -[MicroPaymentProductSubscriptionPeriod numberOfUnits]( -[MicroPaymentProduct subscriptionPeriod](self, "subscriptionPeriod"),  "numberOfUnits"));
  [v3 _setSubscriptionPeriod:v5];
  objc_msgSend( v3,  "_setIntroductoryPrice:",   -[MicroPaymentProductDiscount copyProductDiscount]( -[MicroPaymentProduct introductoryPrice](self, "introductoryPrice"),  "copyProductDiscount"));
  uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = -[MicroPaymentProduct discounts](self, "discounts", 0LL);
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableArray addObject:]( v6,  "addObject:",  [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) copyProductDiscount]);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v9);
  }

  objc_msgSend(v3, "_setDiscounts:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));

  return v3;
}

+ (id)periodFromISO8601String:(id)a3
{
  id v3 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", a3);
  -[NSScanner scanString:intoString:](v3, "scanString:intoString:", @"P", &v8);
  if (!v8) {
    return 0LL;
  }
  -[NSScanner scanInteger:](v3, "scanInteger:", &v7);
  if (!v7) {
    return 0LL;
  }
  id v8 = 0LL;
  -[NSScanner scanCharactersFromSet:intoString:]( v3,  "scanCharactersFromSet:intoString:",  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"DWMY"),  &v8);
  if (!v8 || [v8 length] != (id)1) {
    return 0LL;
  }
  if (([v8 isEqualToString:@"D"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"W"])
    {
      uint64_t v4 = 1LL;
      goto LABEL_13;
    }

    if ([v8 isEqualToString:@"M"])
    {
      uint64_t v4 = 2LL;
      goto LABEL_13;
    }

    if ([v8 isEqualToString:@"Y"])
    {
      uint64_t v4 = 3LL;
      goto LABEL_13;
    }

    return 0LL;
  }

  uint64_t v4 = 0LL;
LABEL_13:
  id v5 = objc_opt_new(&OBJC_CLASS___MicroPaymentProductSubscriptionPeriod);
  -[MicroPaymentProductSubscriptionPeriod setNumberOfUnits:](v5, "setNumberOfUnits:", v7);
  -[MicroPaymentProductSubscriptionPeriod setUnit:](v5, "setUnit:", v4);
  return v5;
}

- (int64_t)contentSize
{
  return self->_contentSize;
}

- (void)setContentSize:(int64_t)a3
{
  self->_contentSize = a3;
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSArray)discounts
{
  return self->_discounts;
}

- (void)setDiscounts:(id)a3
{
}

- (MicroPaymentProductDiscount)introductoryPrice
{
  return self->_introductoryPrice;
}

- (void)setIntroductoryPrice:(id)a3
{
}

- (NSString)subscriptionGroupIdentifier
{
  return self->_subscriptionGroupIdentifier;
}

- (void)setSubscriptionGroupIdentifier:(id)a3
{
}

- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod
{
  return self->_subscriptionPeriod;
}

- (void)setSubscriptionPeriod:(id)a3
{
}

@end