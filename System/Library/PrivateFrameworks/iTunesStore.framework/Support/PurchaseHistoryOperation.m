@interface PurchaseHistoryOperation
- (NSArray)purchaseHistoryItems;
- (NSArray)purchasedItems;
- (PurchaseHistoryOperation)init;
- (PurchaseHistoryOperation)initWithPurchaseHistoryItems:(id)a3 authenticationContext:(id)a4;
- (SSAuthenticationContext)authenticationContext;
- (id)_newURLOperation;
- (void)_setOutputItemsWithMapping:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation PurchaseHistoryOperation

- (PurchaseHistoryOperation)init
{
  return -[PurchaseHistoryOperation initWithPurchaseHistoryItems:authenticationContext:]( self,  "initWithPurchaseHistoryItems:authenticationContext:",  0LL,  0LL);
}

- (PurchaseHistoryOperation)initWithPurchaseHistoryItems:(id)a3 authenticationContext:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PurchaseHistoryOperation;
  v6 = -[PurchaseHistoryOperation init](&v8, "init");
  if (v6)
  {
    v6->_authenticationContext = (SSAuthenticationContext *)[a4 copy];
    v6->_inputItems = (NSArray *)[a3 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseHistoryOperation;
  -[PurchaseHistoryOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (NSArray)purchasedItems
{
  objc_super v3 = self->_outputItems;
  -[PurchaseHistoryOperation unlock](self, "unlock");
  return v3;
}

- (NSArray)purchaseHistoryItems
{
  return self->_inputItems;
}

- (void)run
{
  id v3 = -[PurchaseHistoryOperation _newURLOperation](self, "_newURLOperation");
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v9 = objc_opt_class(self);
    NSUInteger v10 = -[NSArray count](self->_inputItems, "count");
    *(_DWORD *)v20 = 138412546;
    *(void *)&v20[4] = v9;
    __int16 v21 = 2048;
    NSUInteger v22 = v10;
    uint64_t v11 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Checking purchase history for %lu items",  v20,  22);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      v19 = v13;
      *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
    }
  }

  *(void *)v20 = 0LL;
  id v14 = -[PurchaseHistoryOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  v20,  v8,  v19);
  if ((_DWORD)v14)
  {
    id v15 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      id v17 = [v15 objectForKey:@"ownsCheck"];
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
        -[PurchaseHistoryOperation _setOutputItemsWithMapping:](self, "_setOutputItemsWithMapping:", v17);
      }
    }
  }

  -[PurchaseHistoryOperation setError:](self, "setError:", *(void *)v20);
  -[PurchaseHistoryOperation setSuccess:](self, "setSuccess:", v14);
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v3,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setAuthenticationContext:self->_authenticationContext];
  [v3 setNeedsAuthentication:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setClientIdentifier:]( v4,  "setClientIdentifier:",  -[SSAuthenticationContext clientIdentifierHeader](self->_authenticationContext, "clientIdentifierHeader"));
  -[SSMutableURLRequestProperties setURLBagKey:](v4, "setURLBagKey:", @"bundle-owns-check");
  id v5 = -[SSAuthenticationContext HTTPHeaders](self->_authenticationContext, "HTTPHeaders");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v4,  "setValue:forHTTPHeaderField:",  [v5 objectForKey:SSHTTPHeaderUserAgent],  SSHTTPHeaderUserAgent);
  -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v4,  "setValue:forRequestParameter:",  -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid"),  @"guid");
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  inputItems = self->_inputItems;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( inputItems,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    uint64_t v11 = SSPurchaseHistoryPropertyBundleIdentifier;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(inputItems);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) valueForProperty:v11];
        if ([v13 length])
        {
          if (-[NSMutableString length](v6, "length")) {
            -[NSMutableString appendString:](v6, "appendString:", @",");
          }
          -[NSMutableString appendString:](v6, "appendString:", v13);
        }

        v12 = (char *)v12 + 1;
      }

      while (v9 != v12);
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( inputItems,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  -[SSMutableURLRequestProperties setValue:forRequestParameter:](v4, "setValue:forRequestParameter:", v6, @"bids");

  [v3 setRequestProperties:v4];
  return v3;
}

- (void)_setOutputItemsWithMapping:(id)a3
{
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    uint64_t v7 = SSPurchaseHistoryPropertyBundleIdentifier;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v10 = [a3 objectForKey:v9];
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
          && (objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0
          && [v10 BOOLValue])
        {
          id v12 = objc_alloc_init(&OBJC_CLASS___SSPurchaseHistoryItem);
          [v12 setValue:v9 forProperty:v7];
          -[NSMutableArray addObject:](v26, "addObject:", v12);
        }
      }

      id v5 = [a3 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }

    while (v5);
  }

  id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    unsigned int v15 = v14;
  }
  __int128 v16 = (os_log_s *)[v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = v15 & 2;
  }
  if ((_DWORD)v18)
  {
    uint64_t v19 = objc_opt_class(self);
    id v20 = -[NSMutableArray count](v26, "count");
    int v31 = 138412546;
    uint64_t v32 = v19;
    __int16 v33 = 2048;
    id v34 = v20;
    uint64_t v21 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Found %lu purchased items",  &v31,  22);
    if (v21)
    {
      NSUInteger v22 = (void *)v21;
      v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
      free(v22);
      v24 = v23;
      *(void *)&double v17 = SSFileLog(v13, @"%@").n128_u64[0];
    }
  }

  -[PurchaseHistoryOperation lock](self, "lock", v17, v24);

  self->_outputItems = (NSArray *)-[NSMutableArray copy](v26, "copy");
  -[PurchaseHistoryOperation unlock](self, "unlock");
}

@end