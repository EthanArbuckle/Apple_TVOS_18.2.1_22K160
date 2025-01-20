@interface LoadCompletedMicroPaymentsOperation
- (BOOL)isPartialFailure;
- (NSString)applicationUsername;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyResponseForIdentity:(id)a3 startID:(id)a4 endID:(id)a5 returningError:(id *)a6;
- (id)_newFetchOperationForIdentity:(id)a3 startID:(id)a4 endID:(id)a5;
- (id)paymentBatchBlock;
- (void)_runForIdentity:(id)a3;
- (void)run;
- (void)setApplicationUsername:(id)a3;
- (void)setClientIdentity:(id)a3;
- (void)setPaymentBatchBlock:(id)a3;
@end

@implementation LoadCompletedMicroPaymentsOperation

- (NSString)applicationUsername
{
  id v3 = -[NSString copy](self->_applicationUsername, "copy");
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  id v3 = -[StoreKitClientIdentity copy](self->_clientIdentity, "copy");
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  return (StoreKitClientIdentity *)v3;
}

- (BOOL)isPartialFailure
{
  BOOL partialFailure = self->_partialFailure;
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  return partialFailure;
}

- (id)paymentBatchBlock
{
  id v3 = [self->_paymentBatchBlock copy];
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setApplicationUsername:(id)a3
{
  v6 = (NSString *)a3;
  -[LoadCompletedMicroPaymentsOperation lock](self, "lock");
  if (self->_applicationUsername != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    applicationUsername = self->_applicationUsername;
    self->_applicationUsername = v4;
  }

  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
}

- (void)setClientIdentity:(id)a3
{
  v6 = (StoreKitClientIdentity *)a3;
  -[LoadCompletedMicroPaymentsOperation lock](self, "lock");
  if (self->_clientIdentity != v6)
  {
    id v4 = (StoreKitClientIdentity *)-[StoreKitClientIdentity copy](v6, "copy");
    clientIdentity = self->_clientIdentity;
    self->_clientIdentity = v4;
  }

  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
}

- (void)setPaymentBatchBlock:(id)a3
{
  id v6 = a3;
  -[LoadCompletedMicroPaymentsOperation lock](self, "lock");
  if (self->_paymentBatchBlock != v6)
  {
    id v4 = [v6 copy];
    id paymentBatchBlock = self->_paymentBatchBlock;
    self->_id paymentBatchBlock = v4;
  }

  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadCompletedMicroPaymentsOperation clientIdentity](self, "clientIdentity"));
  if (![v3 usesIdentityAttributes])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appState]);
    unsigned __int8 v7 = [v6 isValid];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  v4));

      v5 = (void *)v8;
    }

    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 itemID]);
      if ([v9 integerValue])
      {

LABEL_9:
        id v12 = [v3 copy];
        [v12 setValuesWithSoftwareApplicationProxy:v5];
        -[LoadCompletedMicroPaymentsOperation _runForIdentity:](self, "_runForIdentity:", v12);
LABEL_23:

        goto LABEL_24;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      id v11 = [v10 length];

      if (v11) {
        goto LABEL_9;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v22 = 138412546;
      id v23 = (id)objc_opt_class(self);
      __int16 v24 = 2112;
      v25 = v4;
      id v17 = v23;
      v18 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Could not find app for identifier: %@",  &v22,  22);

      if (!v18)
      {
LABEL_22:

        v19 = sub_100146868();
        id v12 = (id)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v20 = ISErrorWithDomain(v12, 1LL, 0LL, 0LL);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[LoadCompletedMicroPaymentsOperation setError:](self, "setError:", v21);

        goto LABEL_23;
      }

      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      SSFileLog(v13, @"%@");
    }

    goto LABEL_22;
  }

  -[LoadCompletedMicroPaymentsOperation _runForIdentity:](self, "_runForIdentity:", v3);
LABEL_24:
}

- (id)_copyResponseForIdentity:(id)a3 startID:(id)a4 endID:(id)a5 returningError:(id *)a6
{
  id v8 = -[LoadCompletedMicroPaymentsOperation _newFetchOperationForIdentity:startID:endID:]( self,  "_newFetchOperationForIdentity:startID:endID:",  a3,  a4,  a5);
  [v8 setDelegate:self];
  v9 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v8 setDataProvider:v9];
  id v21 = 0LL;
  unsigned int v10 = -[LoadCompletedMicroPaymentsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &v21);
  id v11 = v21;
  if (v10)
  {
    id v12 = -[MicroPaymentQueueResponse initWithRequestType:]( objc_alloc(&OBJC_CLASS___MicroPaymentQueueResponse),  "initWithRequestType:",  1LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticatedAccountDSID]);
    if (!v13)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activeAccount]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueIdentifier]);
    }

    -[MicroPaymentQueueResponse setUserIdentifier:](v12, "setUserIdentifier:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonProtocolDataProvider output](v9, "output"));
    unsigned __int8 v17 = -[MicroPaymentQueueResponse loadFromPropertyList:](v12, "loadFromPropertyList:", v16);

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = ISErrorWithDomain(ISErrorDomain, 2LL, 0LL, 0LL);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

      id v12 = 0LL;
      id v11 = (id)v19;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  [v8 setDelegate:0];
  if (a6 && !v12) {
    *a6 = v11;
  }

  return v12;
}

- (id)_newFetchOperationForIdentity:(id)a3 startID:(id)a4 endID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  if (![v8 isSandboxed])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v14 = (SSAccount *)objc_claimAutoreleasedReturnValue([v13 activeAccount]);
    goto LABEL_5;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

  if (v13)
  {
    unsigned int v14 = -[SSAccount initWithBackingAccount:](objc_alloc(&OBJC_CLASS___SSAccount), "initWithBackingAccount:", v13);
LABEL_5:
    uint64_t v15 = v14;
    goto LABEL_7;
  }

  uint64_t v15 = 0LL;
LABEL_7:

  v34 = v15;
  v16 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v15);
  -[SSMutableAuthenticationContext setAllowsBootstrapCellularData:]( v16,  "setAllowsBootstrapCellularData:",  [v8 allowsBootstrapCellularData]);
  -[SSMutableAuthenticationContext setTokenType:](v16, "setTokenType:", 1LL);
  [v11 setAuthenticationContext:v16];
  unsigned __int8 v17 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v17, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setAllowsBootstrapCellularData:]( v17,  "setAllowsBootstrapCellularData:",  [v8 allowsBootstrapCellularData]);
  -[SSMutableURLRequestProperties setCachePolicy:](v17, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setHTTPMethod:](v17, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setShouldDecodeResponse:](v17, "setShouldDecodeResponse:", 0LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v17, "setURLBagKey:", @"p2-in-app-regrant-purchase-history");
  uint64_t v18 = sub_100052B5C(v8);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = (char *)[v10 itemIdentifierValue];

  id v21 = (char *)[v9 itemIdentifierValue];
  if (v20 - 1 < v21)
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v20));
    [v19 setObject:v22 forKey:kISLoadMoreStartIDParameter];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v21));
    [v19 setObject:v23 forKey:kISLoadMoreEndIDParameter];

    -[SSMutableAuthenticationContext setPromptStyle:](v16, "setPromptStyle:", 0LL);
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
  v25 = v24;
  if (v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringValue]);
    [v19 setObject:v26 forKey:@"appDsid"];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 guid]);

  if (v28) {
    [v19 setObject:v28 forKey:@"guid"];
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 serialNumber]);

  if (v30) {
    [v19 setObject:v30 forKey:@"serialNumber"];
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue([v8 vendorIdentifier]);
  if (v31) {
    [v19 setObject:v31 forKey:@"vid"];
  }
  -[LoadCompletedMicroPaymentsOperation lock](self, "lock");
  applicationUsername = self->_applicationUsername;
  if (applicationUsername) {
    [v19 setObject:applicationUsername forKey:@"applicationUsername"];
  }
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  -[SSMutableURLRequestProperties setRequestParameters:](v17, "setRequestParameters:", v19);
  [v11 setRequestProperties:v17];

  return v11;
}

- (void)_runForIdentity:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
  id v8 = -[NSMutableArray initWithObjects:](v5, "initWithObjects:", v6, v7, 0LL);

  v55 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LoadCompletedMicroPaymentsOperation paymentBatchBlock](self, "paymentBatchBlock"));
  v61 = v4;
  id v9 = -[ClaimStoreKitClientOperation initWithClientIdentity:]( objc_alloc(&OBJC_CLASS___ClaimStoreKitClientOperation),  "initWithClientIdentity:",  v4);
  v51 = v9;
  if (-[LoadCompletedMicroPaymentsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  0LL))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ClaimStoreKitClientOperation clientIdentity](v9, "clientIdentity"));

    v61 = (void *)v10;
  }

  if ((unint64_t)-[NSMutableArray count](v8, "count") >= 2)
  {
    char v11 = 0;
    char v52 = 0;
    id v56 = 0LL;
    id v12 = &ACSLocateCachingServer_ptr;
    v53 = self;
    v57 = v8;
    while (1)
    {
      context = objc_autoreleasePoolPush();
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v8, "objectAtIndex:", 0LL));
      uint64_t v62 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v8, "objectAtIndex:", 1LL));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12[459] sharedDaemonConfig]);
      if (!v14) {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12[459] sharedConfig]);
      }
      unsigned int v15 = [v14 shouldLog];
      else {
        unsigned int v16 = v15;
      }
      unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 2;
      }
      if ((_DWORD)v18)
      {
        uint64_t v19 = (void *)objc_opt_class(self);
        int v64 = 138412802;
        v65 = v19;
        __int16 v66 = 2112;
        *(void *)v67 = v13;
        *(_WORD *)&v67[8] = 2112;
        uint64_t v20 = (void *)v62;
        *(void *)&v67[10] = v62;
        id v21 = v19;
        v50 = &v64;
        int v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Fetching range [%@, %@]");

        id v12 = &ACSLocateCachingServer_ptr;
        if (!v22) {
          goto LABEL_19;
        }
        unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
        free(v22);
        v50 = (int *)v17;
        SSFileLog(v14, @"%@");
      }

      else
      {
        uint64_t v20 = (void *)v62;
      }

LABEL_19:
      id v63 = 0LL;
      v60 = (void *)v13;
      id v23 = -[LoadCompletedMicroPaymentsOperation _copyResponseForIdentity:startID:endID:returningError:]( self,  "_copyResponseForIdentity:startID:endID:returningError:",  v61,  v13,  v20,  &v63);
      id v24 = v63;
      id v25 = v24;
      if (v23)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v23 rangesToLoad]);
        if (v26) {
          -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v26);
        }
        v58 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[459], "sharedDaemonConfig", v50));
        if (!v27) {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v12[459] sharedConfig]);
        }
        unsigned int v28 = [v27 shouldLog];
        else {
          unsigned int v29 = v28;
        }
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = v29 & 2;
        }
        if ((_DWORD)v31)
        {
          v32 = (void *)objc_opt_class(self);
          id v54 = v32;
          v33 = (void *)objc_claimAutoreleasedReturnValue([v23 appReceipt]);
          unsigned int v34 = [v33 length];
          v35 = (void *)objc_claimAutoreleasedReturnValue([v61 bundleIdentifier]);
          int v64 = 138412802;
          v65 = v32;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v34;
          *(_WORD *)&v67[4] = 2112;
          *(void *)&v67[6] = v35;
          v50 = &v64;
          v36 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  2LL,  "[%@] Deciding to write receipt: %d bytes -- %@");

          uint64_t v20 = (void *)v62;
          if (v36)
          {
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
            free(v36);
            v50 = (int *)v30;
            SSFileLog(v27, @"%@");
            goto LABEL_33;
          }
        }

        else
        {
LABEL_33:
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue([v23 appReceipt]);
        id v38 = [v37 length];

        if (v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v23 appReceipt]);
          +[AppReceipt writeReceipt:forStoreKitClient:]( &OBJC_CLASS___AppReceipt,  "writeReceipt:forStoreKitClient:",  v39,  v61);
        }

        self = v53;
        id v8 = v57;
        id v12 = &ACSLocateCachingServer_ptr;
        if (v55) {
          v55[2]();
        }
        char v11 = 1;
        v40 = v58;
        goto LABEL_53;
      }

      v41 = v24;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v12[459] sharedDaemonConfig]);
      if (!v42) {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v12[459] sharedConfig]);
      }
      unsigned int v43 = objc_msgSend(v42, "shouldLog", v50);
      else {
        unsigned int v44 = v43;
      }
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
        uint64_t v46 = v44;
      }
      else {
        uint64_t v46 = v44 & 2;
      }
      if (!(_DWORD)v46)
      {
        id v8 = v57;
        uint64_t v20 = (void *)v62;
        goto LABEL_51;
      }

      v47 = (void *)objc_opt_class(self);
      int v64 = 138413058;
      v65 = v47;
      __int16 v66 = 2112;
      *(void *)v67 = v60;
      *(_WORD *)&v67[8] = 2112;
      uint64_t v20 = (void *)v62;
      *(void *)&v67[10] = v62;
      __int16 v68 = 2112;
      v69 = v41;
      id v48 = v47;
      v50 = &v64;
      v49 = (void *)_os_log_send_and_compose_impl( v46,  0LL,  0LL,  0LL,  &_mh_execute_header,  v45,  1LL,  "%@: Range [%@, %@] failed with error: %@");

      id v8 = v57;
      if (v49)
      {
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v49,  4LL));
        free(v49);
        v50 = (int *)v45;
        SSFileLog(v42, @"%@");
LABEL_51:
      }

      v40 = v41;
      v26 = v56;
      char v52 = 1;
      id v56 = [v41 copy];
LABEL_53:

      -[NSMutableArray removeObjectsInRange:](v8, "removeObjectsInRange:", 0LL, 2LL);
      objc_autoreleasePoolPop(context);
    }
  }

  id v56 = 0LL;
  char v52 = 0;
  char v11 = 0;
LABEL_56:
  -[LoadCompletedMicroPaymentsOperation lock](self, "lock", v50);
  self->_BOOL partialFailure = v11 & 1 & v52;
  -[LoadCompletedMicroPaymentsOperation unlock](self, "unlock");
  -[LoadCompletedMicroPaymentsOperation setError:](self, "setError:", v56);
  -[LoadCompletedMicroPaymentsOperation setSuccess:](self, "setSuccess:", v11 & 1);
}

- (void).cxx_destruct
{
}

@end