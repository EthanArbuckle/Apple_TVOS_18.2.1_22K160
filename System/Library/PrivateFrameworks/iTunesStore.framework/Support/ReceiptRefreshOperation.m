@interface ReceiptRefreshOperation
- (BOOL)_isSandboxed;
- (ReceiptRefreshOperation)initWithClient:(id)a3 requestingClientIdentifier:(id)a4 receiptFlags:(unint64_t)a5;
- (id)_postBodyData;
- (id)resultBlock;
- (void)run;
- (void)setResultBlock:(id)a3;
@end

@implementation ReceiptRefreshOperation

- (ReceiptRefreshOperation)initWithClient:(id)a3 requestingClientIdentifier:(id)a4 receiptFlags:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ReceiptRefreshOperation;
  v11 = -[ReceiptRefreshOperation init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_client, a3);
    v12->_flags = a5;
    objc_storeStrong((id *)&v12->_requestingClientIdentifier, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 receiptDirectoryPath]);
    if (v13)
    {
      unsigned int v14 = -[ReceiptRefreshOperation _isSandboxed](v12, "_isSandboxed");
      v15 = objc_alloc(&OBJC_CLASS___SSPurchaseReceipt);
      if (v14) {
        v16 = @"sandboxReceipt";
      }
      else {
        v16 = @"receipt";
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v16]);
      v18 = -[SSPurchaseReceipt initWithContentsOfFile:](v15, "initWithContentsOfFile:", v17);
      existingReceipt = v12->_existingReceipt;
      v12->_existingReceipt = v18;
    }
  }

  return v12;
}

- (id)resultBlock
{
  id v3 = [self->_resultBlock copy];
  -[ReceiptRefreshOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  -[ReceiptRefreshOperation lock](self, "lock");
  if (self->_resultBlock != v6)
  {
    id v4 = [v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }

  -[ReceiptRefreshOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptRefreshOperation _postBodyData](self, "_postBodyData"));
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v4 setDataProvider:v5];
    id v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v6, "setAllowedRetryCount:", 0LL);
    v37 = v3;
    -[SSMutableURLRequestProperties setHTTPBody:](v6, "setHTTPBody:", v3);
    -[SSMutableURLRequestProperties setHTTPMethod:](v6, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v6,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
    uint64_t v7 = ISClientIdentifierForBundleIdentifier(self->_requestingClientIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SSMutableURLRequestProperties setClientIdentifier:](v6, "setClientIdentifier:", v8);

    id v9 = -[AppReceiptRefreshOperationOptions initWithReceiptFlags:]( objc_alloc(&OBJC_CLASS___AppReceiptRefreshOperationOptions),  "initWithReceiptFlags:",  self->_flags);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppReceiptRefreshOperationOptions URLBagKey](v9, "URLBagKey"));
    -[SSMutableURLRequestProperties setURLBagKey:](v6, "setURLBagKey:", v10);

    v11 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  0LL);
    -[SSMutableAuthenticationContext setPromptStyle:]( v11,  "setPromptStyle:",  -[AppReceiptRefreshOperationOptions authenticationPromptStyle](v9, "authenticationPromptStyle"));
    if ((-[AppReceiptRefreshOperationOptions receiptFlags](v9, "receiptFlags") & 4) != 0)
    {
      -[SSMutableAuthenticationContext setAccountScope:](v11, "setAccountScope:", 1LL);
      -[SSMutableURLRequestProperties setURLBagType:](v6, "setURLBagType:", 1LL);
    }

    v36 = v11;
    [v4 setAuthenticationContext:v11];
    [v4 setRequestProperties:v6];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      unsigned int v14 = v13;
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v14 & 2;
    }
    if ((_DWORD)v16)
    {
      v17 = (void *)objc_opt_class(self);
      client = self->_client;
      v35 = v9;
      v19 = v5;
      id v20 = v4;
      id v21 = v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKPaymentQueueClient bundleIdentifier](client, "bundleIdentifier"));
      int v39 = 138543618;
      v40 = v17;
      __int16 v41 = 2114;
      v42 = v22;
      v23 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[%{public}@]: Updating receipt for: %{public}@",  &v39,  22);

      id v4 = v20;
      v5 = v19;
      id v9 = v35;

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
        free(v23);
        v34 = v24;
        SSFileLog(v12, @"%@");
      }
    }

    else
    {
    }

    id v38 = 0LL;
    unsigned int v27 = -[ReceiptRefreshOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v4,  &v38);
    id v25 = v38;
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v5 output]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"receipt"]);
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      {
        v31 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
        -[StoreKitClientIdentity setValuesWithPaymentQueueClient:]( v31,  "setValuesWithPaymentQueueClient:",  self->_client);
        BOOL v26 = +[AppReceipt writeReceipt:forStoreKitClient:]( &OBJC_CLASS___AppReceipt,  "writeReceipt:forStoreKitClient:",  v29,  v31);
      }

      else
      {
        BOOL v26 = 0LL;
      }

      id v3 = v37;
    }

    else
    {
      BOOL v26 = 0LL;
      id v3 = v37;
    }
  }

  else
  {
    id v25 = 0LL;
    BOOL v26 = 0LL;
  }

  -[ReceiptRefreshOperation setError:](self, "setError:", v25, v34);
  -[ReceiptRefreshOperation setSuccess:](self, "setSuccess:", v26);
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ReceiptRefreshOperation resultBlock](self, "resultBlock"));
  v33 = (void *)v32;
  if (v32)
  {
    (*(void (**)(uint64_t, BOOL, id))(v32 + 16))(v32, v26, v25);
    -[ReceiptRefreshOperation setResultBlock:](self, "setResultBlock:", 0LL);
  }
}

- (BOOL)_isSandboxed
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKPaymentQueueClient storeExternalVersion](self->_client, "storeExternalVersion"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKPaymentQueueClient storeItemIdentifier](self->_client, "storeItemIdentifier"));
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_postBodyData
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"dsid");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);

  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"guid");
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKPaymentQueueClient bundleIdentifier](self->_client, "bundleIdentifier"));

  if (v10) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"bundle-id");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKPaymentQueueClient bundleVersion](self->_client, "bundleVersion"));

  if (v11) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"version-id");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serialNumber]);

  if (v13) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, @"serialNumber");
  }
  unint64_t flags = self->_flags;
  LOBYTE(v15) = flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, @"want-revoked");
    goto LABEL_17;
  }

  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, @"want-expired");
  unint64_t v15 = self->_flags;
  if ((v15 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_13:
  if (!(flags & 1 | v15 & 8))
  {
    int v16 = 0;
    goto LABEL_18;
  }

- (void).cxx_destruct
{
}

@end