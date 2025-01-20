@interface LoadMicroPaymentProductsOperation
- (BOOL)_loadResponseForIdentity:(id)a3 batchSize:(int64_t)a4 returningError:(id *)a5;
- (LoadMicroPaymentProductsOperation)initWithProductIdentifiers:(id)a3;
- (NSArray)productIdentifiers;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyQueryStringDictionaryForIdentity:(id)a3 productIdentifiers:(id)a4;
- (id)_copyResponseForIdentity:(id)a3 identifiers:(id)a4 returningError:(id *)a5;
- (id)copyProductsResponse;
- (int64_t)_batchSizeForIdentity:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)run;
- (void)setClientIdentity:(id)a3;
@end

@implementation LoadMicroPaymentProductsOperation

- (LoadMicroPaymentProductsOperation)initWithProductIdentifiers:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LoadMicroPaymentProductsOperation;
  v4 = -[LoadMicroPaymentProductsOperation init](&v6, "init");
  if (v4) {
    v4->_productIdentifiers = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadMicroPaymentProductsOperation;
  -[LoadMicroPaymentProductsOperation dealloc](&v3, "dealloc");
}

- (StoreKitClientIdentity)clientIdentity
{
  objc_super v3 = self->_clientIdentity;
  -[LoadMicroPaymentProductsOperation unlock](self, "unlock");
  return v3;
}

- (id)copyProductsResponse
{
  objc_super v3 = self->_response;
  -[LoadMicroPaymentProductsOperation unlock](self, "unlock");
  return v3;
}

- (NSArray)productIdentifiers
{
  return self->_productIdentifiers;
}

- (void)setClientIdentity:(id)a3
{
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)[a3 copy];
  }

  -[LoadMicroPaymentProductsOperation unlock](self, "unlock");
}

- (void)run
{
  v35 = 0LL;
  objc_super v3 = -[LoadMicroPaymentProductsOperation clientIdentity](self, "clientIdentity");
  if (!-[StoreKitClientIdentity usesIdentityAttributes](v3, "usesIdentityAttributes"))
  {
    v4 = objc_autoreleasePoolPush();
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  -[StoreKitClientIdentity bundleIdentifier](v3, "bundleIdentifier"));
    id v6 = [v5 bundleType];
    if (([v6 isEqualToString:LSUserApplicationType] & 1) == 0) {
      id v5 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  -[StoreKitClientIdentity bundleIdentifier](v3, "bundleIdentifier"));
    }
    if (v5)
    {
      -[StoreKitClientIdentity setValuesWithSoftwareApplicationProxy:](v3, "setValuesWithSoftwareApplicationProxy:", v5);
LABEL_18:
      objc_autoreleasePoolPop(v4);
      goto LABEL_19;
    }

    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v36 = 138412546;
      uint64_t v37 = objc_opt_class(self);
      __int16 v38 = 2112;
      v39 = -[StoreKitClientIdentity bundleIdentifier](v3, "bundleIdentifier");
      objc_super v3 = (StoreKitClientIdentity *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: No app for ID: %@",  &v36,  22);
      if (!v3) {
        goto LABEL_18;
      }
      v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v3, 4LL);
      free(v3);
      v32 = v11;
      SSFileLog(v7, @"%@");
    }

    objc_super v3 = 0LL;
    goto LABEL_18;
  }

- (int64_t)_batchSizeForIdentity:(id)a3 error:(id *)a4
{
  v16 = 0LL;
  id v6 = +[SSURLBagContext contextWithBagType:]( SSURLBagContext,  "contextWithBagType:",  [a3 isSandboxed]);
  if ((-[LoadMicroPaymentProductsOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v6,  &v16) & 1) != 0)
  {
    id v7 = objc_msgSend( objc_msgSend( +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"),  "URLBagForContext:",  v6),  "valueForKey:",  @"p2-product-offers-batch-limit");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    id v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      uint64_t v14 = objc_opt_class(self);
      int v17 = 138412290;
      uint64_t v18 = v14;
      int64_t result = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Couldn't load bag to get batch size",  &v17,  12);
      if (!result) {
        goto LABEL_17;
      }
      uint64_t v15 = (void *)result;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", result, 4LL);
      free(v15);
      SSFileLog(v10, @"%@");
    }

    int64_t result = 0LL;
  }

- (id)_copyQueryStringDictionaryForIdentity:(id)a3 productIdentifiers:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = [a3 bundleIdentifier];
  if (v7)
  {
    id v8 = [v7 copyUTF8StringOfLength:256];
    if (v8)
    {
      uint64_t v9 = v8;
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, @"bid");
    }
  }

  id v10 = [a3 bundleVersion];
  if (v10)
  {
    id v11 = [v10 copyUTF8StringOfLength:100];
    if (v11)
    {
      uint64_t v12 = v11;
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v11, @"bvrs");
    }
  }

  id v13 = [a3 storeIdentifier];
  if (v13) {
    -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  [v13 stringValue],  @"appAdamId");
  }
  uint64_t v14 = +[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale");
  if (v14) {
    -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  -[NSLocale localeIdentifier](v14, "localeIdentifier"),  @"icuLocale");
  }
  id v15 = [a4 componentsJoinedByString:@","];
  if ([v15 length]) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v15, @"offerNames");
  }
  id v16 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "storeFrontIdentifier");
  if (v16) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v16, @"sfId");
  }
  id v17 = [a3 storeVersion];
  if (v17) {
    -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  [v17 stringValue],  @"appExtVrsId");
  }
  return v6;
}

- (id)_copyResponseForIdentity:(id)a3 identifiers:(id)a4 returningError:(id *)a5
{
  id v16 = 0LL;
  id v9 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  id v10 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v9 setDataProvider:v10];

  id v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v11, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setAllowsBootstrapCellularData:]( v11,  "setAllowsBootstrapCellularData:",  [a3 allowsBootstrapCellularData]);
  -[SSMutableURLRequestProperties setCachePolicy:](v11, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v11, "setURLBagKey:", @"p2-product-offers");
  -[SSMutableURLRequestProperties setURLBagType:](v11, "setURLBagType:", [a3 isSandboxed]);
  id v12 = -[LoadMicroPaymentProductsOperation _copyQueryStringDictionaryForIdentity:productIdentifiers:]( self,  "_copyQueryStringDictionaryForIdentity:productIdentifiers:",  a3,  a4);
  -[SSMutableURLRequestProperties setRequestParameters:](v11, "setRequestParameters:", v12);

  [v9 setRequestProperties:v11];
  unsigned int v13 = -[LoadMicroPaymentProductsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  &v16);
  uint64_t v14 = 0LL;
  if (v13)
  {
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___MicroPaymentProductsResponse);
    -[MicroPaymentProductsResponse setExpectedIdentifiers:](v14, "setExpectedIdentifiers:", a4);
    if (!-[MicroPaymentProductsResponse loadFromDictionary:error:]( v14,  "loadFromDictionary:error:",  -[DaemonProtocolDataProvider output](v10, "output"),  &v16))
    {

      uint64_t v14 = 0LL;
    }
  }

  if (a5) {
    *a5 = v16;
  }
  return v14;
}

- (BOOL)_loadResponseForIdentity:(id)a3 batchSize:(int64_t)a4 returningError:(id *)a5
{
  v48 = 0LL;
  v43 = -[NSArray sortedArrayUsingSelector:]( -[LoadMicroPaymentProductsOperation productIdentifiers](self, "productIdentifiers"),  "sortedArrayUsingSelector:",  "compare:");
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  v40 = a5;
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  id v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v50 = 138412802;
    uint64_t v51 = objc_opt_class(self);
    __int16 v52 = 2048;
    NSUInteger v53 = -[NSArray count](v43, "count");
    __int16 v54 = 2048;
    int64_t v55 = a4;
    uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Loading products for %lu identifiers with batch size %ld",  &v50,  32);
    if (v11)
    {
      id v12 = (void *)v11;
      unsigned int v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      v39 = v13;
      SSFileLog(v7, @"%@");
    }
  }

  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  NSUInteger v17 = -[NSArray count](v43, "count");
  if ((v17 & 0x8000000000000000LL) == 0)
  {
    int64_t v18 = v17;
    int64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    while (1)
    {
      if (v19 >= v18) {
        break;
      }
      id v21 = -[NSArray objectAtIndex:](v43, "objectAtIndex:", v19);
      unint64_t v22 = (unint64_t)[v21 length];
      if (v22 > 0x280) {
        goto LABEL_22;
      }
      if (!v21 || -[NSMutableArray count](v16, "count") == (id)a4 || v22 + v20 >= 0x281)
      {
LABEL_24:
        id v24 = -[LoadMicroPaymentProductsOperation _copyResponseForIdentity:identifiers:returningError:]( self,  "_copyResponseForIdentity:identifiers:returningError:",  a3,  v16,  &v48);
        BOOL v23 = v24 == 0LL;
        if (v24)
        {
          unsigned int v25 = v24;
          -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", [v24 products]);
          -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", [v25 invalidIdentifiers]);
        }

        -[NSMutableArray removeAllObjects](v16, "removeAllObjects");
        uint64_t v20 = 0LL;
        goto LABEL_27;
      }

@end