@interface BuyMicroPaymentOperation
- (BOOL)purchaseOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4;
- (BOOL)simulatesAskToBuyInSandbox;
- (MicroPaymentQueueResponse)response;
- (NSData)clientAuditTokenData;
- (NSData)requestData;
- (NSManagedObjectID)paymentID;
- (NSNumber)discountTimestamp;
- (NSString)applicationUsername;
- (NSString)buyParameters;
- (NSString)discountIdentifier;
- (NSString)discountKeyIdentifier;
- (NSString)discountNonceString;
- (NSString)discountSignature;
- (NSString)originatingStorefront;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)productIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (id)_appProxy;
- (id)_fullBuyParametersWithAppProxy:(id)a3;
- (int64_t)quantity;
- (void)run;
- (void)setApplicationUsername:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientIdentity:(id)a3;
- (void)setDiscountIdentifier:(id)a3;
- (void)setDiscountKeyIdentifier:(id)a3;
- (void)setDiscountNonceString:(id)a3;
- (void)setDiscountSignature:(id)a3;
- (void)setDiscountTimestamp:(id)a3;
- (void)setOriginatingStorefront:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentID:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setQuantity:(int64_t)a3;
- (void)setRequestData:(id)a3;
- (void)setSimulatesAskToBuyInSandbox:(BOOL)a3;
@end

@implementation BuyMicroPaymentOperation

- (NSString)applicationUsername
{
  id v3 = -[NSString copy](self->_applicationUsername, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)buyParameters
{
  id v3 = -[NSString copy](self->_buyParameters, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSData)clientAuditTokenData
{
  id v3 = self->_clientAuditTokenData;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  id v3 = self->_clientIdentity;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (NSString)partnerIdentifier
{
  id v3 = -[NSString copy](self->_partnerIdentifier, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)partnerTransactionIdentifier
{
  id v3 = -[NSString copy](self->_partnerTransactionIdentifier, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)productIdentifier
{
  id v3 = -[NSString copy](self->_productIdentifier, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (int64_t)quantity
{
  int64_t quantity = self->_quantity;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return quantity;
}

- (NSData)requestData
{
  id v3 = -[NSData copy](self->_requestData, "copy");
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return (NSData *)v3;
}

- (MicroPaymentQueueResponse)response
{
  id v3 = self->_response;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)simulatesAskToBuyInSandbox
{
  BOOL simulatesAskToBuyInSandbox = self->_simulatesAskToBuyInSandbox;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
  return simulatesAskToBuyInSandbox;
}

- (void)setApplicationUsername:(id)a3
{
  v6 = (NSString *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_applicationUsername != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    applicationUsername = self->_applicationUsername;
    self->_applicationUsername = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setBuyParameters:(id)a3
{
  v6 = (NSString *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_buyParameters != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    buyParameters = self->_buyParameters;
    self->_buyParameters = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setClientAuditTokenData:(id)a3
{
  v5 = (NSData *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_clientAuditTokenData != v5) {
    objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
  }
  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setClientIdentity:(id)a3
{
  v5 = (StoreKitClientIdentity *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_clientIdentity != v5) {
    objc_storeStrong((id *)&self->_clientIdentity, a3);
  }
  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setPartnerIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_partnerIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_partnerTransactionIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    partnerTransactionIdentifier = self->_partnerTransactionIdentifier;
    self->_partnerTransactionIdentifier = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setProductIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_productIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    productIdentifier = self->_productIdentifier;
    self->_productIdentifier = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setQuantity:(int64_t)a3
{
  self->_int64_t quantity = a3;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setRequestData:(id)a3
{
  v6 = (NSData *)a3;
  -[BuyMicroPaymentOperation lock](self, "lock");
  if (self->_requestData != v6)
  {
    v4 = (NSData *)-[NSData copy](v6, "copy");
    requestData = self->_requestData;
    self->_requestData = v4;
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (void)setSimulatesAskToBuyInSandbox:(BOOL)a3
{
  self->_BOOL simulatesAskToBuyInSandbox = a3;
  -[BuyMicroPaymentOperation unlock](self, "unlock");
}

- (BOOL)purchaseOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation delegate](self, "delegate"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation delegate](self, "delegate")),
        char v9 = objc_opt_respondsToSelector(v8, "buyMicroPaymentOperation:shouldContinueWithNewStorefront:"),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation delegate](self, "delegate"));
    unsigned __int8 v11 = [v10 buyMicroPaymentOperation:self shouldContinueWithNewStorefront:v5];
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation clientIdentity](self, "clientIdentity"));
  v4 = -[ClaimStoreKitClientOperation initWithClientIdentity:]( objc_alloc(&OBJC_CLASS___ClaimStoreKitClientOperation),  "initWithClientIdentity:",  v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation clientAuditTokenData](self, "clientAuditTokenData"));
  -[ClaimStoreKitClientOperation setClientAuditTokenData:](v4, "setClientAuditTokenData:", v5);

  if (-[BuyMicroPaymentOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v4,  0LL))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ClaimStoreKitClientOperation clientIdentity](v4, "clientIdentity"));

    -[BuyMicroPaymentOperation setClientIdentity:](self, "setClientIdentity:", v6);
    id v3 = (void *)v6;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation _appProxy](self, "_appProxy"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation _fullBuyParametersWithAppProxy:](self, "_fullBuyParametersWithAppProxy:", v7));
  if (!v8)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      int v64 = 138412290;
      id v65 = (id)objc_opt_class(self);
      id v31 = v65;
      v32 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Could not generate buy parameters",  &v64,  12);

      if (!v32)
      {
LABEL_32:

        uint64_t v33 = ISError(2LL, 0LL, 0LL);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        -[BuyMicroPaymentOperation setError:](self, "setError:", v34);
        goto LABEL_64;
      }

      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
      free(v32);
      SSFileLog(v27, @"%@");
    }

    goto LABEL_32;
  }

  char v9 = (void *)v8;
  v10 = objc_alloc_init(&OBJC_CLASS___PurchaseOperation);
  -[PurchaseOperation setMicroPayment:](v10, "setMicroPayment:", 1LL);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation clientAuditTokenData](self, "clientAuditTokenData"));
  -[PurchaseOperation setClientAuditTokenData:](v10, "setClientAuditTokenData:", v11);

  if (([v3 usesIdentityAttributes] & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v12));
    if (v13
      || (v13 = (void *)objc_claimAutoreleasedReturnValue( +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  v12))) != 0LL)
    {
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  id v15 = [v14 length];

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    uint64_t v17 = ISClientIdentifierForBundleIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[PurchaseOperation setClientIdentifierHeader:](v10, "setClientIdentifierHeader:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL escapedStringForString:](&OBJC_CLASS___NSURL, "escapedStringForString:", v19));

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingFormat:@"&%@=%@", @"originatingBundleID", v20]);
    char v9 = (void *)v21;
  }

  -[PurchaseOperation setBuyParameters:](v10, "setBuyParameters:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation originatingStorefront](self, "originatingStorefront"));
  -[PurchaseOperation setOriginatingStorefront:](v10, "setOriginatingStorefront:", v22);

  -[PurchaseOperation setShouldSendKeyBagSyncData:](v10, "setShouldSendKeyBagSyncData:", 1LL);
  -[PurchaseOperation setUrlBagKey:](v10, "setUrlBagKey:", @"p2-in-app-buy");
  v61 = v7;
  if ([v7 isBetaApp])
  {
    -[PurchaseOperation setBagType:](v10, "setBagType:", 1LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreBeta));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ams_activeiTunesAccount"));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStore));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ams_activeiTunesAccount"));

      if (!v24)
      {
        v26 = 0LL;
        goto LABEL_39;
      }
    }
  }

  else
  {
    if (![v3 isSandboxed])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      v36 = (SSAccount *)objc_claimAutoreleasedReturnValue([v24 activeAccount]);
      goto LABEL_37;
    }

    -[PurchaseOperation setBagType:](v10, "setBagType:", 1LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ams_activeiTunesAccount"));

    if (!v24)
    {
      v26 = 0LL;
      goto LABEL_38;
    }
  }

  v36 = -[SSAccount initWithBackingAccount:](objc_alloc(&OBJC_CLASS___SSAccount), "initWithBackingAccount:", v24);
LABEL_37:
  v26 = v36;
LABEL_38:

LABEL_39:
  v37 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v26);
  -[SSMutableAuthenticationContext setShouldCreateNewSession:](v37, "setShouldCreateNewSession:", 1LL);
  -[SSMutableAuthenticationContext setTokenType:](v37, "setTokenType:", 1LL);
  v60 = v9;
  if ([v3 requiresAuthenticationForPayment])
  {
    -[SSMutableAuthenticationContext setPromptStyle:](v37, "setPromptStyle:", 1LL);
    -[PurchaseOperation setRequiresAuthentication:](v10, "setRequiresAuthentication:", 1LL);
  }

  v62 = v4;
  -[PurchaseOperation setAuthenticationContext:](v10, "setAuthenticationContext:", v37);
  id v63 = 0LL;
  id v38 = -[BuyMicroPaymentOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v10, &v63);
  id v39 = v63;
  v40 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueResponse);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticatedAccountDSID](v10, "authenticatedAccountDSID"));
  if (!v41) {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](v26, "uniqueIdentifier"));
  }
  v59 = v26;
  -[MicroPaymentQueueResponse setUserIdentifier:](v40, "setUserIdentifier:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation rawOutput](v10, "rawOutput"));
  unsigned int v43 = v38 & ~-[MicroPaymentQueueResponse loadFromPropertyList:](v40, "loadFromPropertyList:", v42);

  if (v43 == 1)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v44) {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v45) = [v44 shouldLog];
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v45 = v45;
    }
    else {
      v45 &= 2u;
    }
    if ((_DWORD)v45)
    {
      v47 = (void *)objc_opt_class(self);
      int v64 = 138412290;
      id v65 = v47;
      id v58 = v47;
      LODWORD(v57) = 12;
      v48 = (void *)_os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "%@: Could not parse response",  &v64,  v57);

      if (!v48)
      {
LABEL_57:

        uint64_t v49 = ISError(2LL, 0LL, 0LL);
        id v38 = 0LL;
        v50 = v39;
        id v39 = (id)objc_claimAutoreleasedReturnValue(v49);
        goto LABEL_59;
      }

      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v48,  4LL));
      free(v48);
      SSFileLog(v44, @"%@");
    }

    goto LABEL_57;
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentQueueResponse appReceipt](v40, "appReceipt"));
  +[AppReceipt writeReceipt:forStoreKitClient:](&OBJC_CLASS___AppReceipt, "writeReceipt:forStoreKitClient:", v50, v3);
LABEL_59:
  v4 = v62;

  -[BuyMicroPaymentOperation setError:](self, "setError:", v39);
  -[BuyMicroPaymentOperation setSuccess:](self, "setSuccess:", v38);
  -[BuyMicroPaymentOperation lock](self, "lock");
  response = self->_response;
  self->_response = v40;
  v52 = v40;

  -[BuyMicroPaymentOperation unlock](self, "unlock");
  LODWORD(response) = -[MicroPaymentQueueResponse shouldTriggerQueueCheck](v52, "shouldTriggerQueueCheck");

  if ((_DWORD)response && (v38 & 1) == 0 && !v39)
  {
    v53 = sub_100146868();
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    uint64_t v55 = ISErrorWithDomain(v54, 2LL, 0LL, 0LL);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    -[BuyMicroPaymentOperation setError:](self, "setError:", v56);
  }

  v34 = v60;
  v7 = v61;
LABEL_64:
}

- (id)_appProxy
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation clientIdentity](self, "clientIdentity"));
  if (([v3 usesIdentityAttributes] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v5));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 appState]);
    unsigned __int8 v7 = [v6 isValid];

    if ((v7 & 1) != 0) {
      goto LABEL_17;
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v25 = 138543618;
      id v26 = (id)objc_opt_class(self);
      __int16 v27 = 2114;
      unsigned int v28 = v5;
      id v12 = v26;
      v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%{public}@]: Got invalid application proxy for bundle id: %{public}@. Checking for plugin",  &v25,  22);

      if (!v13)
      {
LABEL_16:

        uint64_t v14 = objc_claimAutoreleasedReturnValue( +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  v5));
        v4 = (void *)v14;
LABEL_17:
        if (v4)
        {
LABEL_31:

          goto LABEL_32;
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v15) {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v16 = objc_msgSend(v15, "shouldLog", v23);
        else {
          LODWORD(v17) = v16;
        }
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v17 = v17;
        }
        else {
          v17 &= 2u;
        }
        if ((_DWORD)v17)
        {
          v19 = (void *)objc_opt_class(self);
          int v25 = 138412546;
          id v26 = v19;
          __int16 v27 = 2112;
          unsigned int v28 = v5;
          id v20 = v19;
          LODWORD(v24) = 22;
          uint64_t v21 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Could not find application for identifier: %@",  &v25,  v24);

          if (!v21)
          {
LABEL_30:

            goto LABEL_31;
          }

          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
          free(v21);
          SSFileLog(v15, @"%@");
        }

        goto LABEL_30;
      }

      unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      v23 = v11;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_16;
  }

  v4 = 0LL;
LABEL_32:

  return v4;
}

- (id)_fullBuyParametersWithAppProxy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation clientIdentity](self, "clientIdentity"));
  id v6 = [v5 copy];

  if (v4) {
    [v6 setValuesWithSoftwareApplicationProxy:v4];
  }
  unsigned __int8 v7 = sub_100052B5C(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v8 removeObjectForKey:@"vid"];
  [v8 setObject:@"true" forKey:@"generateBuyParams"];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[BuyMicroPaymentOperation quantity](self, "quantity")));
  [v8 setObject:v9 forKey:@"quantity"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation productIdentifier](self, "productIdentifier"));
  if (v10)
  {
    unsigned __int8 v11 = v10;
    id v12 = [v10 copyUTF8StringOfLength:100];

    if (v12)
    {
      [v8 setObject:v12 forKey:@"offerName"];
    }
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation buyParameters](self, "buyParameters"));
  if (v13)
  {
    id v14 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v13,  1LL);
    if (v14) {
      [v8 addEntriesFromDictionary:v14];
    }
  }

  uint64_t v49 = (void *)v13;
  v50 = v8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL queryStringForDictionary:escapedValues:]( &OBJC_CLASS___NSURL,  "queryStringForDictionary:escapedValues:",  v8,  0LL));
  id v52 = (id)objc_claimAutoreleasedReturnValue(-[BuyMicroPaymentOperation requestData](self, "requestData"));
  if ([v52 length])
  {
    id v16 = v52;
    uint64_t v17 = (void *)ISCopyEncodedBase64([v16 bytes], objc_msgSend(v16, "length"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
      id v19 = [v18 mutableCopy];

      [v19 removeCharactersInString:@"?=&+"];
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 stringByAddingPercentEncodingWithAllowedCharacters:v19]);
      uint64_t v21 = (void *)v20;
      if (v20) {
        [v15 appendFormat:@"&%@=%@", @"requestData", v20];
      }
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 purchaserDSID]);
  if ([v22 integerValue])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
    [v15 appendFormat:@"&%@=%@", @"appDsid", v23];
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 storeCohortMetadata]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSURL escapedStringForString:](&OBJC_CLASS___NSURL, "escapedStringForString:", v24));
    __int16 v27 = (void *)v26;
    if (v26) {
      [v15 appendFormat:@"&%@=%@", @"storeCohort", v26];
    }
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 vendorIdentifier]);
  uint64_t v29 = (void *)v28;
  if (v28) {
    [v15 appendFormat:@"&%@=%@", @"vid", v28];
  }
  v48 = v29;
  v51 = v4;
  if ([v6 isSandboxed]
    && -[BuyMicroPaymentOperation simulatesAskToBuyInSandbox](self, "simulatesAskToBuyInSandbox"))
  {
    [v15 appendString:@"&requiresAskToBuy=true"];
  }

  -[BuyMicroPaymentOperation lock](self, "lock");
  uint64_t v30 = 0LL;
  applicationUsername = self->_applicationUsername;
  v54[0] = @"applicationUsername";
  v54[1] = applicationUsername;
  partnerIdentifier = self->_partnerIdentifier;
  v54[2] = @"partnerId";
  v54[3] = partnerIdentifier;
  partnerTransactionIdentifier = self->_partnerTransactionIdentifier;
  v54[4] = @"partnerTransactionId";
  v54[5] = partnerTransactionIdentifier;
  do
  {
    v34 = (void *)v54[v30 + 1];
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"?=&+"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v34 stringByAddingPercentEncodingWithAllowedCharacters:v35]);

      if (v36) {
        [v15 appendFormat:@"&%@=%@", v54[v30], v36];
      }
    }

    v30 += 2LL;
  }

  while (v30 != 6);
  if (self->_discountIdentifier
    && self->_discountKeyIdentifier
    && self->_discountNonceString
    && self->_discountSignature
    && self->_discountTimestamp)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
    id v38 = [v37 mutableCopy];

    [v38 removeCharactersInString:@"?=&+"];
    discountIdentifier = self->_discountIdentifier;
    v53[0] = @"adHocOfferId";
    v53[1] = discountIdentifier;
    discountKeyIdentifier = self->_discountKeyIdentifier;
    v53[2] = @"adHocKeyId";
    v53[3] = discountKeyIdentifier;
    discountNonceString = self->_discountNonceString;
    v53[4] = @"adHocNonce";
    v53[5] = discountNonceString;
    discountSignature = self->_discountSignature;
    v53[6] = @"adHocSignature";
    v53[7] = discountSignature;
    v53[8] = @"adHocTimestamp";
    uint64_t v43 = 0LL;
    v53[9] = -[NSNumber stringValue](self->_discountTimestamp, "stringValue");
    do
    {
      v44 = (void *)v53[v43 + 1];
      if (v44)
      {
        uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 stringByAddingPercentEncodingWithAllowedCharacters:v38]);
        v46 = (void *)v45;
        if (v45) {
          [v15 appendFormat:@"&%@=%@", v53[v43], v45];
        }
      }

      v43 += 2LL;
    }

    while (v43 != 10);
  }

  -[BuyMicroPaymentOperation unlock](self, "unlock");

  return v15;
}

- (NSString)originatingStorefront
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setOriginatingStorefront:(id)a3
{
}

- (NSManagedObjectID)paymentID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setPaymentID:(id)a3
{
}

- (NSString)discountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setDiscountIdentifier:(id)a3
{
}

- (NSString)discountKeyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setDiscountKeyIdentifier:(id)a3
{
}

- (NSString)discountNonceString
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setDiscountNonceString:(id)a3
{
}

- (NSString)discountSignature
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setDiscountSignature:(id)a3
{
}

- (NSNumber)discountTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setDiscountTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end