@interface PDPassShareBundle
+ (id)passSharesFromCarKeySharesDictionary:(id)a3;
+ (id)passSharesFromLegacyCarKeySharesDictionary:(id)a3 entitlements:(id)a4;
+ (id)subcredentialEntitlementsFromPassDictionary:(id)a3;
- (NSArray)entitlements;
- (NSArray)shares;
- (PDPassShareBundle)init;
- (PDPassShareBundle)initWithPassURL:(id)a3 passDictionary:(id)a4;
- (id)_initWithCarKeySharesDictionary:(id)a3 passDict:(id)a4;
- (id)_initWithShareBundleDictionary:(id)a3;
- (id)_initWithShares:(id)a3 entitlements:(id)a4;
- (id)description;
- (void)setEntitlements:(id)a3;
- (void)setShares:(id)a3;
@end

@implementation PDPassShareBundle

- (PDPassShareBundle)init
{
  return 0LL;
}

- (PDPassShareBundle)initWithPassURL:(id)a3 passDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:PKPassSharingBundleFileName]);
  id v9 = sub_1003ADB34((uint64_t)v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (PDPassShareBundle *) -[PDPassShareBundle _initWithShareBundleDictionary:]( self,  "_initWithShareBundleDictionary:",  v10);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:PKCarKeyPassSharingBundleFileName]);
    id v14 = sub_1003ADB34((uint64_t)v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(33LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "PDPassShareBundle: Shares: %@",  (uint8_t *)&v18,  0xCu);
      }
    }

    v12 = (PDPassShareBundle *) -[PDPassShareBundle _initWithCarKeySharesDictionary:passDict:]( self,  "_initWithCarKeySharesDictionary:passDict:",  v11,  v7);
  }

  return v12;
}

- (id)_initWithShareBundleDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_msgSend( v3,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v5),  PKPassSharingBundleSharesKey);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        v12 = -[PKPassShare initWithDictionary:](objc_alloc(&OBJC_CLASS___PKPassShare), "initWithDictionary:", v11);
        if (v12)
        {
          -[NSMutableArray addObject:](v4, "addObject:", v12);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(33LL);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v45 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PDPassShareBundle: Unable to create share from %{private}@",  buf,  0xCu);
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }

    while (v8);
  }

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v33 = v3;
  id v17 = objc_msgSend( v3,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v16),  PKPassSharingBundleEntitlementsKey);
  int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)j);
        v24 = -[PKPassEntitlement initWithDictionary:]( objc_alloc(&OBJC_CLASS___PKPassEntitlement),  "initWithDictionary:",  v23);
        if (v24)
        {
          -[NSMutableArray addObject:](v15, "addObject:", v24);
        }

        else
        {
          uint64_t v25 = PKLogFacilityTypeGetObject(33LL);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v45 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "PDPassShareBundle: Unable to create entitlement from %{private}@",  buf,  0xCu);
          }
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }

    while (v20);
  }

  id v27 = -[NSMutableArray copy](v4, "copy", self);
  id v28 = -[NSMutableArray copy](v15, "copy");
  id v29 = [v32 _initWithShares:v27 entitlements:v28];

  return v29;
}

- (id)_initWithShares:(id)a3 entitlements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPassShareBundle;
  uint64_t v9 = -[PDPassShareBundle init](&v12, "init");
  if (v9)
  {
    if (![v7 count] && !objc_msgSend(v8, "count"))
    {
      uint64_t v10 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v9->_shares, a3);
    objc_storeStrong((id *)&v9->_entitlements, a4);
  }

  uint64_t v10 = v9;
LABEL_6:

  return v10;
}

- (id)_initWithCarKeySharesDictionary:(id)a3 passDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 PKStringForKey:@"version"]);
  id v9 = [v8 integerValue];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassShareBundle subcredentialEntitlementsFromPassDictionary:]( &OBJC_CLASS___PDPassShareBundle,  "subcredentialEntitlementsFromPassDictionary:",  v7));
  if (v9 != (id)2)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKPassSharingCarKeyBundleSharesKey]);

    if (!v11)
    {
      if (v10)
      {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassShareBundle passSharesFromLegacyCarKeySharesDictionary:entitlements:]( &OBJC_CLASS___PDPassShareBundle,  "passSharesFromLegacyCarKeySharesDictionary:entitlements:",  v6,  v10));
        goto LABEL_4;
      }

      objc_super v12 = 0LL;
LABEL_8:

      id v13 = 0LL;
      goto LABEL_9;
    }
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassShareBundle passSharesFromCarKeySharesDictionary:]( &OBJC_CLASS___PDPassShareBundle,  "passSharesFromCarKeySharesDictionary:",  v6));
  if (!v10) {
    goto LABEL_8;
  }
LABEL_4:
  id v13 = -[PDPassShareBundle _initWithShares:entitlements:](self, "_initWithShares:entitlements:", v12, v10);
LABEL_9:

  return v13;
}

+ (id)passSharesFromLegacyCarKeySharesDictionary:(id)a3 entitlements:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = objc_msgSend( v6,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v7),  @"sharedKeysData");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_groupDictionaryByApplyingBlock:", &stru_10065B130));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 PKStringForKey:@"keyID"]);

  objc_super v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  uint64_t v25 = sub_1003AE338;
  v26 = &unk_10063F1B8;
  id v27 = v11;
  id v28 = v5;
  id v14 = v12;
  id v29 = v14;
  v15 = v13;
  v30 = v15;
  id v16 = v5;
  id v17 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:&v23];
  if (-[NSMutableArray count](v14, "count", v23, v24, v25, v26))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PDPassShareBundle: dropped friend credentials with these identifiers: %@",  buf,  0xCu);
    }
  }

  id v20 = v30;
  uint64_t v21 = v15;

  return v21;
}

+ (id)passSharesFromCarKeySharesDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_msgSend( v3,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v5),  PKPassSharingCarKeyBundleSharesKey);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v13 = -[PKPassShare initWithSubcredentialDictionary:]( objc_alloc(&OBJC_CLASS___PKPassShare),  "initWithSubcredentialDictionary:",  v12);
        if (v13)
        {
          -[NSMutableArray addObject:](v4, "addObject:", v13);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(33LL);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v23 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDPassShareBundle: Unable to create share from %{private}@",  buf,  0xCu);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v9);
  }

  id v16 = -[NSMutableArray copy](v4, "copy");

  return v16;
}

+ (id)subcredentialEntitlementsFromPassDictionary:(id)a3
{
  id v3 = a3;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1003AEBA4;
  v41[3] = &unk_10065B1C0;
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = v26;
  v4 = objc_retainBlock(v41);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PKSecureElement primarySecureElementIdentifier]( &OBJC_CLASS___PKSecureElement,  "primarySecureElementIdentifier"));
  id v27 = v3;
  id v7 = objc_msgSend( v3,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v6),  PKPassKeyPaymentApplications);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v7);
  id v32 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v38;
    uint64_t v30 = PKPassPaymentApplicationsKeySEID;
    uint64_t v28 = PKPassPaymentApplicationsKeySubcredential;
    uint64_t v8 = PKPassPaymentApplicationsKeySubcredentials;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 PKStringForKey:v30]);
        id v12 = v5;
        id v13 = v11;
        if (v12 == v13)
        {

LABEL_12:
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 PKDictionaryForKey:v28]);
          ((void (*)(void *, void *))v4[2])(v4, v14);
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          uint64_t v17 = v8;
          id v18 = objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(NSDictionary, v16), v8);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          id v20 = [v19 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v34;
            do
            {
              for (j = 0LL; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v34 != v22) {
                  objc_enumerationMutation(v19);
                }
                ((void (*)(void *, void))v4[2])(v4, *(void *)(*((void *)&v33 + 1) + 8LL * (void)j));
              }

              id v21 = [v19 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }

            while (v21);
          }

          uint64_t v8 = v17;
          id v12 = (id)objc_claimAutoreleasedReturnValue([v10 PKDictionaryForKey:v17]);
          if (v12) {
            ((void (*)(void *, id))v4[2])(v4, v12);
          }
LABEL_22:

          continue;
        }

        id v14 = v13;
        if (!v5 || !v13)
        {

          goto LABEL_22;
        }

        unsigned int v15 = [v12 isEqualToString:v13];

        if (v15) {
          goto LABEL_12;
        }
      }

      id v32 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }

    while (v32);
  }

  id v24 = -[NSMutableArray copy](v26, "copy");

  return v24;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  [v6 appendFormat:@"entitlements: '%@'; ", self->_entitlements];
  [v6 appendFormat:@"shares: '%@'; ", self->_shares];
  [v6 appendFormat:@">"];
  id v7 = [v6 copy];

  return v7;
}

- (NSArray)shares
{
  return self->_shares;
}

- (void)setShares:(id)a3
{
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end