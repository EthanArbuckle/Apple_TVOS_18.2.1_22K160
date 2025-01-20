@interface SKProduct
+ (id)productsFromDictionaries:(id)a3;
+ (id)productsFromXPCEncodingsArray:(id)a3;
- (BOOL)downloadable;
- (BOOL)isDownloadable;
- (NSArray)contentLengths;
- (NSArray)discounts;
- (NSArray)downloadContentLengths;
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)_localeIdentifier;
- (NSString)contentVersion;
- (NSString)downloadContentVersion;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)productIdentifier;
- (NSString)subscriptionGroupIdentifier;
- (SKProduct)init;
- (SKProduct)initWithDictionary:(id)a3;
- (SKProduct)initWithXPCEncoding:(id)a3;
- (SKProductDiscount)introductoryPrice;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)copyXPCEncoding;
- (id)initMinusLocaleWithDictionary:(id)a3;
- (id)initMinusLocaleWithXPCEncoding:(id)a3;
- (void)_setContentVersion:(id)a3;
- (void)_setDiscounts:(id)a3;
- (void)_setDownloadContentLengths:(id)a3;
- (void)_setDownloadable:(BOOL)a3;
- (void)_setIntroductoryPrice:(id)a3;
- (void)_setLocale:(id)a3;
- (void)_setLocaleIdentifier:(id)a3;
- (void)_setLocalizedDescription:(id)a3;
- (void)_setLocalizedTitle:(id)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setProductIdentifier:(id)a3;
- (void)_setSubscriptionGroupIdentifier:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
@end

@implementation SKProduct

- (SKProduct)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKProduct;
  v2 = -[SKProduct init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SKProductInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }

  return v2;
}

+ (id)productsFromDictionaries:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v11 = -[SKProduct initMinusLocaleWithDictionary:]( objc_alloc(&OBJC_CLASS___SKProduct),  "initMinusLocaleWithDictionary:",  v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"loc"]);
        if (!v12
          || (v13 = (NSLocale *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12))) == 0LL)
        {
          v14 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  v12);
          v13 = v14;
          if (v12) {
            BOOL v15 = v14 == 0LL;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v12);
          }
        }

        [v11 _setLocale:v13];
        v16 = (void *)objc_claimAutoreleasedReturnValue([v11 introductoryPrice]);
        [v16 _setPriceLocale:v13];

        -[NSMutableArray addObject:](v5, "addObject:", v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }

  id v17 = -[NSMutableArray copy](v5, "copy");
  return v17;
}

- (id)initMinusLocaleWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[SKProduct init](self, "init");
  if (!v5) {
    goto LABEL_35;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"desc"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_storeStrong((id *)v5->_internal + 6, v6);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"name"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    objc_storeStrong((id *)v5->_internal + 7, v8);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"id"]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    objc_storeStrong((id *)v5->_internal + 10, v10);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"pri"]);

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v15) & 1) == 0)
    {
      v14 = 0LL;
      goto LABEL_18;
    }

    v16 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
    v14 = -[NSDecimalNumber initWithString:](v16, "initWithString:", v17);

    if (!v14) {
      goto LABEL_18;
    }
LABEL_13:
    v18 = -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( objc_alloc(&OBJC_CLASS___NSDecimalNumberHandler),  "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  0LL,  2LL,  0LL,  0LL,  0LL,  0LL);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:]( v14,  "decimalNumberByRoundingAccordingToBehavior:",  v18));
    __int128 v20 = (void *)v19;
    if (v19) {
      __int128 v21 = (void *)v19;
    }
    else {
      __int128 v21 = v14;
    }
    objc_storeStrong((id *)v5->_internal + 8, v21);

    goto LABEL_18;
  }

  v14 = v12;
  if (v14) {
    goto LABEL_13;
  }
LABEL_18:
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"is-hosted"]);

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0 && [v22 BOOLValue])
  {
    *((_BYTE *)v5->_internal + 16) = 1;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"hosted-version"]);

    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
      objc_storeStrong((id *)v5->_internal + 1, v24);
    }
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"hosted-content-length"]);

    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v22, v26) & 1) != 0)
    {
      v46 = v22;
      uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
      id internal = v5->_internal;
      v29 = (void *)internal[3];
      internal[3] = v27;
    }
  }

  else
  {
    *((_BYTE *)v5->_internal + 16) = 0;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"disc"]);

  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
  {
    id v32 = v30;
    v30 = v32;
    if ([v32 count])
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v32 firstObject]);

      uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v30, v33) & 1) != 0)
      {
        v34 = -[SKProductDiscount initWithDictionary:]( objc_alloc(&OBJC_CLASS___SKProductDiscount),  "initWithDictionary:",  v30);
        v35 = v5->_internal;
        v36 = (void *)v35[4];
        v35[4] = v34;
        v37 = v34;
      }
    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"subscriptionFamilyId"]);

  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0) {
    objc_storeStrong((id *)v5->_internal + 11, v38);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"per"]);

  uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
  {
    v42 = -[SKProductSubscriptionPeriod initWithISO8601String:]( objc_alloc(&OBJC_CLASS___SKProductSubscriptionPeriod),  "initWithISO8601String:",  v40);
    v43 = v5->_internal;
    v44 = (void *)v43[12];
    v43[12] = v42;
  }

LABEL_35:
  return v5;
}

- (SKProduct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[SKProduct initMinusLocaleWithDictionary:](self, "initMinusLocaleWithDictionary:", v4);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"loc"]);
    uint64_t v7 = -[NSLocale initWithLocaleIdentifier:](objc_alloc(&OBJC_CLASS___NSLocale), "initWithLocaleIdentifier:", v6);
    -[SKProduct _setLocale:](v5, "_setLocale:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKProduct introductoryPrice](v5, "introductoryPrice"));
    [v8 _setPriceLocale:v7];
  }

  return v5;
}

- (NSArray)contentLengths
{
  return -[SKProduct downloadContentLengths](self, "downloadContentLengths");
}

- (NSString)contentVersion
{
  return -[SKProduct downloadContentVersion](self, "downloadContentVersion");
}

- (NSArray)downloadContentLengths
{
  return (NSArray *)*((id *)self->_internal + 3);
}

- (NSString)downloadContentVersion
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (BOOL)isDownloadable
{
  return *((_BYTE *)self->_internal + 16);
}

- (BOOL)downloadable
{
  return *((_BYTE *)self->_internal + 16);
}

- (SKProductDiscount)introductoryPrice
{
  return (SKProductDiscount *)*((id *)self->_internal + 4);
}

- (NSString)localizedDescription
{
  return (NSString *)*((id *)self->_internal + 6);
}

- (NSString)localizedTitle
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 8);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 9);
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 10);
}

- (NSString)subscriptionGroupIdentifier
{
  return (NSString *)*((id *)self->_internal + 11);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 12);
}

- (NSArray)discounts
{
  return (NSArray *)*((id *)self->_internal + 13);
}

- (NSString)_localeIdentifier
{
  return (NSString *)*((id *)self->_internal + 5);
}

- (void)_setContentVersion:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[1];
    internal[1] = v5;
  }

- (void)_setDownloadContentLengths:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[3] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[3];
    internal[3] = v5;
  }

- (void)_setDownloadable:(BOOL)a3
{
  *((_BYTE *)self->_internal + 16) = a3;
}

- (void)_setIntroductoryPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  uint64_t v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setLocale:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[9];
    internal[9] = v5;
  }

- (void)_setLocaleIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[5] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[5];
    internal[5] = v5;
  }

- (void)_setLocalizedDescription:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[6];
    internal[6] = v5;
  }

- (void)_setLocalizedTitle:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[7] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[7];
    internal[7] = v5;
  }

- (void)_setPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 8);
  uint64_t v7 = (id *)(internal + 64);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setPriceLocale:(id)a3
{
  id v6 = a3;
  id v5 = (id *)self->_internal;
  if (v5[9] != v6) {
    objc_storeStrong(v5 + 9, a3);
  }
  [v5[4] _setPriceLocale:v6];
}

- (void)_setProductIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[10] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[10];
    internal[10] = v5;
  }

- (void)_setSubscriptionGroupIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[11] != a3)
  {
    uint64_t v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[11];
    internal[11] = v5;
  }

- (void)_setSubscriptionPeriod:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 12);
  uint64_t v7 = (id *)(internal + 96);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setDiscounts:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  id v6 = (void *)internal[13];
  internal[13] = v4;
}

+ (id)productsFromXPCEncodingsArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_array)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_10003C27C;
    uint64_t v13 = &unk_10034BC18;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = v6;
    uint64_t v7 = v6;
    id v8 = v14;
    xpc_array_apply(v4, &v10);
    id v5 = -[NSMutableArray copy](v7, "copy", v10, v11, v12, v13);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)initMinusLocaleWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = -[SKProduct init](self, "init");
    id v6 = v8;
    if (!v8) {
      goto LABEL_5;
    }
    self = (SKProduct *)v8->_internal;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v10 = sub_1000E358C(v5, "0", v9);
    id internal = self->_internal;
    self->_id internal = v10;

    LOBYTE(self[1].super.isa) = xpc_dictionary_get_BOOL(v5, "2");
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    CFDictionaryRef v13 = sub_1000E358C(v5, "3", v12);
    id v14 = self[1]._internal;
    self[1]._id internal = v13;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v16 = sub_1000E358C(v5, "5", v15);
    id v17 = self[2]._internal;
    self[2]._id internal = v16;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v19 = (objc_class *)sub_1000E358C(v5, "1", v18);
    Class isa = self[3].super.isa;
    self[3].super.Class isa = v19;

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v22 = sub_1000E358C(v5, "7", v21);
    id v23 = self[3]._internal;
    self[3]._id internal = v22;

    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v25 = (objc_class *)sub_1000E358C(v5, "4", v24);
    Class v26 = self[5].super.isa;
    self[5].super.Class isa = v25;

    uint64_t v27 = objc_alloc(&OBJC_CLASS___SKProductSubscriptionPeriod);
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "8");
    v29 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    v30 = -[SKProductSubscriptionPeriod initWithXPCEncoding:](v27, "initWithXPCEncoding:", v29);
    Class v31 = self[6].super.isa;
    self[6].super.Class isa = v30;

    id v32 = objc_alloc(&OBJC_CLASS___SKProductDiscount);
    xpc_object_t v33 = xpc_dictionary_get_dictionary(v5, "9");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = -[SKProductDiscount initWithXPCEncoding:](v32, "initWithXPCEncoding:", v34);
    Class v36 = self[2].super.isa;
    self[2].super.Class isa = v35;

    uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v38 = sub_1000E358C(v5, "10", v37);
    id v39 = self[5]._internal;
    self[5]._id internal = v38;

    v40 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    xpc_object_t array = xpc_dictionary_get_array(v5, "11");
    v42 = (void *)objc_claimAutoreleasedReturnValue(array);
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10003C738;
    applier[3] = &unk_10034BBD0;
    v43 = v40;
    v55 = v43;
    xpc_array_apply(v42, applier);
    CFDictionaryRef v44 = sub_1000E3558(v5, "6");
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
    {
      v46 = v44;
      if (!v46) {
        goto LABEL_17;
      }
LABEL_12:
      v50 = -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( objc_alloc(&OBJC_CLASS___NSDecimalNumberHandler),  "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  0LL,  2LL,  0LL,  0LL,  0LL,  0LL);
      uint64_t v51 = objc_claimAutoreleasedReturnValue( -[__CFDictionary decimalNumberByRoundingAccordingToBehavior:]( v46,  "decimalNumberByRoundingAccordingToBehavior:",  v50));
      v52 = (void *)v51;
      if (v51) {
        v53 = (void *)v51;
      }
      else {
        v53 = v46;
      }
      objc_storeStrong((id *)&self[4].super.isa, v53);

      goto LABEL_17;
    }

    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v44, v47) & 1) != 0)
    {
      v48 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary stringValue](v44, "stringValue"));
      v46 = -[NSDecimalNumber initWithString:](v48, "initWithString:", v49);

      if (v46) {
        goto LABEL_12;
      }
    }

    else
    {
      v46 = 0LL;
    }

- (SKProduct)initWithXPCEncoding:(id)a3
{
  id v3 = -[SKProduct initMinusLocaleWithXPCEncoding:](self, "initMinusLocaleWithXPCEncoding:", a3);
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKProduct _localeIdentifier](v3, "_localeIdentifier"));
    id v6 = -[NSLocale initWithLocaleIdentifier:](objc_alloc(&OBJC_CLASS___NSLocale), "initWithLocaleIdentifier:", v5);
    -[SKProduct _setPriceLocale:](v4, "_setPriceLocale:", v6);
    -[SKProduct _setLocaleIdentifier:](v4, "_setLocaleIdentifier:", 0LL);
  }

  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v4 = self->_internal;
  sub_1000E35D4(v3, "0", *((__CFString **)v4 + 1));
  sub_1000E35D4(v3, "1", *((__CFString **)v4 + 6));
  xpc_dictionary_set_BOOL(v3, "2", *((_BYTE *)v4 + 16));
  sub_1000E35D4(v3, "3", *((__CFString **)v4 + 3));
  sub_1000E35D4(v3, "4", *((__CFString **)v4 + 10));
  sub_1000E35D4(v3, "5", *((__CFString **)v4 + 5));
  sub_1000E35D4(v3, "6", *((__CFString **)v4 + 8));
  sub_1000E35D4(v3, "7", *((__CFString **)v4 + 7));
  sub_1000E35D4(v3, "10", *((__CFString **)v4 + 11));
  id v5 = [*((id *)v4 + 12) copyXPCEncoding];
  if (v5) {
    xpc_dictionary_set_value(v3, "8", v5);
  }
  id v6 = [*((id *)v4 + 4) copyXPCEncoding];
  if (v6) {
    xpc_dictionary_set_value(v3, "9", v6);
  }
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = *((id *)v4 + 13);
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "copyXPCEncoding", (void)v15);
          if (v13) {
            xpc_array_append_value(v7, v13);
          }

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    xpc_dictionary_set_value(v3, "11", v7);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end