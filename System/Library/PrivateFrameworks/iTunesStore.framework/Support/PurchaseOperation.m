@interface PurchaseOperation
+ (double)_randomDouble;
+ (void)reportAnonymousPings:(id)a3;
- (AMSPurchaseShim)shim;
- (BOOL)_clientIsViewService;
- (BOOL)_shouldDisableReversePush;
- (BOOL)_shouldSendKeyBagSyncData;
- (BOOL)_shouldSendSBSyncData;
- (BOOL)_shouldUseClientAuthentication;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)didConsumeScore;
- (BOOL)displayedErrorDialog;
- (BOOL)isBackgroundPurchase;
- (BOOL)isMoveToiOS;
- (BOOL)isPlaybackRequest;
- (BOOL)isPreauthenticated;
- (BOOL)microPayment;
- (BOOL)requiresAuthentication;
- (BOOL)requiresSerialNumber;
- (BOOL)shouldSendKeyBagSyncData;
- (BOOL)skipsConfirmationDialogs;
- (BOOL)useRemoteAuthentication;
- (ISURLRequestPerformance)requestPerformanceMetrics;
- (NSData)clientAuditTokenData;
- (NSDictionary)rawOutput;
- (NSDictionary)tidHeaders;
- (NSNumber)originalProductOwnerAccountDSID;
- (NSString)affiliateIdentifier;
- (NSString)buyParameters;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)deviceScore;
- (NSString)logKey;
- (NSString)originatingStorefront;
- (NSString)storeCorrelationID;
- (NSString)urlBagKey;
- (PurchaseOperation)init;
- (PurchaseOperation)initWithPurchase:(id)a3;
- (SSAuthenticationContext)authenticationContext;
- (SSURLConnectionResponse)URLResponse;
- (id)_URLBagContext;
- (id)_account;
- (id)_accountWithUniqueIdentifier:(id)a3;
- (id)_buyParamProductType;
- (id)_countryCode;
- (id)_deviceScoreMetricsParam;
- (id)_fairPlaySubscriptionController;
- (id)_newPurchaseRequestOperation;
- (id)_newRequestParameters;
- (id)_priceFromBuyParams;
- (id)_recordEngagementEventWithResult:(id)a3 error:(id)a4;
- (id)authenticatedAccountDSID;
- (id)remoteAuthenticationHandler;
- (id)uniqueKey;
- (int64_t)_purchaseType;
- (int64_t)bagType;
- (void)_addFairPlayToRequestProperties:(id)a3 withAccountIdentifier:(unint64_t)a4;
- (void)_continueTouchIDSessionWithDialog:(id)a3;
- (void)_handleFailureForOperation:(id)a3;
- (void)_performApplePayClassicCheck;
- (void)_performAutoEnrollmentCheck;
- (void)_performDelayedGotoForOperation:(id)a3;
- (void)_performMachineDataActionForURLResponse:(id)a3;
- (void)_runDialogOperationForDialog:(id)a3;
- (void)_runPurchaseRequest;
- (void)_scoreDevice;
- (void)_scoreDeviceRetryFailedV2Score;
- (void)_setChangedBuyParameters:(id)a3 fromDataProvider:(id)a4;
- (void)_setMoveToiOS;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)operation:(id)a3 shouldAuthenticateWithContext:(id)a4 responseHandler:(id)a5;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)run;
- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4;
- (void)sender:(id)a3 shouldContinueTouchIDSession:(BOOL)a4;
- (void)sender:(id)a3 willSendChallenge:(id)a4 andSignature:(id)a5 andPaymentTokenData:(id)a6 andFpanID:(id)a7 isExtendedAction:(BOOL)a8 isPayment:(BOOL)a9 additionalHeaders:(id)a10;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBackgroundPurchase:(BOOL)a3;
- (void)setBagType:(int64_t)a3;
- (void)setBuyParameters:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setDidConsumeScore:(BOOL)a3;
- (void)setDisplayedErrorDialog:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMicroPayment:(BOOL)a3;
- (void)setOriginalProductOwnerAccountDSID:(id)a3;
- (void)setOriginatingStorefront:(id)a3;
- (void)setPlaybackRequest:(BOOL)a3;
- (void)setPreauthenticated:(BOOL)a3;
- (void)setRawOutput:(id)a3;
- (void)setRemoteAuthenticationHandler:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresSerialNumber:(BOOL)a3;
- (void)setShouldSendKeyBagSyncData:(BOOL)a3;
- (void)setSkipsConfirmationDialogs:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setUrlBagKey:(id)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseOperation

- (PurchaseOperation)init
{
  return -[PurchaseOperation initWithPurchase:](self, "initWithPurchase:", 0LL);
}

- (PurchaseOperation)initWithPurchase:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PurchaseOperation;
  v5 = -[PurchaseOperation init](&v36, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 affiliateIdentifier]);
    affiliateIdentifier = v5->_affiliateIdentifier;
    v5->_affiliateIdentifier = (NSString *)v6;

    v8 = objc_alloc(&OBJC_CLASS___SSAuthenticationContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    v10 = -[SSAuthenticationContext initWithAccountIdentifier:](v8, "initWithAccountIdentifier:", v9);
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___SSBiometricAuthenticationContext);
    biometricAuthenticationContext = v5->_biometricAuthenticationContext;
    v5->_biometricAuthenticationContext = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 buyParameters]);
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 valueForDownloadProperty:SSDownloadPropertyKind]);
    downloadKind = v5->_downloadKind;
    v5->_downloadKind = (NSString *)v16;

    v5->_didConsumeScore = 0;
    v5->_displaysOnLockScreen = [v4 displaysOnLockScreen];
    v5->_ignoresForcedPasswordRestriction = [v4 ignoresForcedPasswordRestriction];
    v5->_isBackgroundPurchase = [v4 isBackgroundPurchase];
    v5->_isPlaybackRequest = [v4 isPlaybackRequest];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SSAuthenticationContext logUUID](v5->_authenticationContext, "logUUID"));
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 storeFrontIdentifier]);
    originatingStorefront = v5->_originatingStorefront;
    v5->_originatingStorefront = (NSString *)v21;

    v5->_preauthenticated = [v4 isPreauthenticated];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 requestProperties]);
    v24 = (SSURLRequestProperties *)[v23 copy];
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForDownloadProperty:SSDownloadPropertyShouldSuppressErrorDialogs]);
    v5->_suppressDialogs = [v26 BOOLValue];

    v5->_silentAuthCount = 0LL;
    v5->_shouldCancelBiometricTokenUpdate = +[ISBiometricStore tokenUpdateState]( &OBJC_CLASS___ISBiometricStore,  "tokenUpdateState") == (id)1;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 tidHeaders]);
    if (v27)
    {
      -[SSBiometricAuthenticationContext setIsPayment:](v5->_biometricAuthenticationContext, "setIsPayment:", 1LL);
      -[SSBiometricAuthenticationContext setShouldContinueTouchIDSession:]( v5->_biometricAuthenticationContext,  "setShouldContinueTouchIDSession:",  1LL);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDChallenge]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDSignature]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDAction]);
      if (v28) {
        -[SSBiometricAuthenticationContext setChallenge:](v5->_biometricAuthenticationContext, "setChallenge:", v28);
      }
      if (v29) {
        -[SSBiometricAuthenticationContext setSignature:](v5->_biometricAuthenticationContext, "setSignature:", v29);
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uppercaseString]);
      unsigned int v32 = [v31 isEqualToString:@"FB"];

      if (v32) {
        -[SSBiometricAuthenticationContext setDidFallbackToPassword:]( v5->_biometricAuthenticationContext,  "setDidFallbackToPassword:",  1LL);
      }
    }

    -[PurchaseOperation setPowerAssertionIdentifier:]( v5,  "setPowerAssertionIdentifier:",  @"com.apple.itunesstored.purchase");
    -[PurchaseOperation _setMoveToiOS](v5, "_setMoveToiOS");
    if (!v5->_moveToiOS)
    {
      v33 = -[AMSPurchaseShim initWithPurchase:](objc_alloc(&OBJC_CLASS___AMSPurchaseShim), "initWithPurchase:", v4);
      shim = v5->_shim;
      v5->_shim = v33;
    }
  }

  return v5;
}

+ (void)reportAnonymousPings:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)ISWeakLinkedClassForString(@"MCProfileConnection", 17), "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = [v5 isAppAnalyticsAllowed];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v18 = v3;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v12);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            v15 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v13);
            id v16 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
            [v16 setQueuePriority:-4];
            [v16 _setUsesPrivateCookieStore:0];
            v17 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v15);
            -[SSMutableURLRequestProperties setAllowedRetryCount:](v17, "setAllowedRetryCount:", 0LL);
            -[SSMutableURLRequestProperties setITunesStoreRequest:](v17, "setITunesStoreRequest:", 0LL);
            -[SSMutableURLRequestProperties setTimeoutInterval:](v17, "setTimeoutInterval:", 20.0);
            [v16 setRequestProperties:v17];
            [v7 addOperation:v16];
          }

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v10);
    }

    id v3 = v18;
  }
}

- (NSString)affiliateIdentifier
{
  id v3 = self->_affiliateIdentifier;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  id v3 = self->_authenticationContext;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifier
{
  id v3 = self->_clientIdentifier;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifierHeader
{
  id v3 = self->_clientIdentifierHeader;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (NSString)deviceScore
{
  id v3 = -[NSString copy](self->_deviceScore, "copy");
  -[PurchaseOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (BOOL)isBackgroundPurchase
{
  BOOL isBackgroundPurchase = self->_isBackgroundPurchase;
  -[PurchaseOperation unlock](self, "unlock");
  return isBackgroundPurchase;
}

- (BOOL)isPlaybackRequest
{
  BOOL isPlaybackRequest = self->_isPlaybackRequest;
  -[PurchaseOperation unlock](self, "unlock");
  return isPlaybackRequest;
}

- (BOOL)isMoveToiOS
{
  BOOL moveToiOS = self->_moveToiOS;
  -[PurchaseOperation unlock](self, "unlock");
  return moveToiOS;
}

- (NSString)logKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](self, "authenticationContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 logUUID]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](self, "authenticationContext"));
    unsigned int v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 logUUID]);
  }

  else
  {
    unsigned int v6 = self->_logKey;
  }

  return v6;
}

- (NSNumber)originalProductOwnerAccountDSID
{
  id v3 = self->_originalProductOwnerAccountDSID;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (ISURLRequestPerformance)requestPerformanceMetrics
{
  id v3 = self->_requestPerformanceMetrics;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (void)setAffiliateIdentifier:(id)a3
{
  unsigned int v6 = (NSString *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_affiliateIdentifier != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v4;
  }

  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setAuthenticationContext:(id)a3
{
  unsigned int v6 = (SSAuthenticationContext *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    id v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }

  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setBackgroundPurchase:(BOOL)a3
{
  self->_BOOL isBackgroundPurchase = a3;
  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setPlaybackRequest:(BOOL)a3
{
  self->_BOOL isPlaybackRequest = a3;
  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setClientIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_clientIdentifier != v5) {
    objc_storeStrong((id *)&self->_clientIdentifier, a3);
  }
  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
  unsigned int v6 = (NSString *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_clientIdentifierHeader != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    clientIdentifierHeader = self->_clientIdentifierHeader;
    self->_clientIdentifierHeader = v4;
  }

  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setOriginalProductOwnerAccountDSID:(id)a3
{
  unsigned int v6 = (NSNumber *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_originalProductOwnerAccountDSID != v6)
  {
    id v4 = (NSNumber *)-[NSNumber copy](v6, "copy");
    originalProductOwnerAccountDSID = self->_originalProductOwnerAccountDSID;
    self->_originalProductOwnerAccountDSID = v4;
  }

  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setUrlBagKey:(id)a3
{
  unsigned int v6 = (NSString *)a3;
  -[PurchaseOperation lock](self, "lock");
  if (self->_urlBagKey != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    urlBagKey = self->_urlBagKey;
    self->_urlBagKey = v4;
  }

  -[PurchaseOperation unlock](self, "unlock");
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  self->_useRemoteAuthentication = a3;
  -[PurchaseOperation unlock](self, "unlock");
}

- (NSDictionary)tidHeaders
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSBiometricAuthenticationContext challenge](self->_biometricAuthenticationContext, "challenge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSBiometricAuthenticationContext signature](self->_biometricAuthenticationContext, "signature"));
  unsigned int v6 = -[SSBiometricAuthenticationContext didFallbackToPassword]( self->_biometricAuthenticationContext,  "didFallbackToPassword");
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, SSHTTPHeaderXAppleTouchIDChallenge);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, SSHTTPHeaderXAppleTouchIDSignature);
  }

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", @"FB", SSHTTPHeaderXAppleTouchIDAction);
  }
  -[PurchaseOperation unlock](self, "unlock");
  if (-[NSMutableDictionary count](v3, "count")) {
    id v8 = -[NSMutableDictionary copy](v3, "copy");
  }
  else {
    id v8 = 0LL;
  }

  return (NSDictionary *)v8;
}

- (NSString)urlBagKey
{
  id v3 = self->_urlBagKey;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"buyProduct";
  }
  -[PurchaseOperation unlock](self, "unlock");
  return (NSString *)v4;
}

- (BOOL)useRemoteAuthentication
{
  BOOL useRemoteAuthentication = self->_useRemoteAuthentication;
  -[PurchaseOperation unlock](self, "unlock");
  return useRemoteAuthentication;
}

- (SSURLConnectionResponse)URLResponse
{
  id v3 = self->_urlResponse;
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (id)authenticatedAccountDSID
{
  id v3 = self->_accountID;
  if (!v3) {
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue( -[SSAuthenticationContext requiredUniqueIdentifier]( self->_authenticationContext,  "requiredUniqueIdentifier"));
  }
  -[PurchaseOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  shim = self->_shim;
  if (shim)
  {
    id v136 = 0LL;
    id v4 = -[AMSPurchaseShim runPurchase:](shim, "runPurchase:", &v136);
    id v5 = v136;
    unsigned int v6 = v5;
    if (!v5)
    {
LABEL_63:
      -[PurchaseOperation setSuccess:](self, "setSuccess:", v6 == 0LL, v127);
      goto LABEL_190;
    }

    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      unsigned int v10 = v9;
    }
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v10 & 2;
    }
    if ((_DWORD)v12)
    {
      uint64_t v13 = (void *)objc_opt_class(self);
      id v14 = v13;
      uint64_t v15 = AMSLogKey();
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v137 = 138543874;
      v138 = v13;
      __int16 v139 = 2114;
      id v140 = v16;
      __int16 v141 = 2114;
      unsigned int v6 = v7;
      v142 = v7;
      v17 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: [%{public}@] Error encountered with shimmed purchase: %{public}@",  &v137,  32);

      if (!v17)
      {
LABEL_62:

        -[PurchaseOperation setError:](self, "setError:", v6);
        goto LABEL_63;
      }

      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      v127 = v11;
      SSFileLog(v8, @"%@");
    }

    else
    {
      unsigned int v6 = v7;
    }

    goto LABEL_62;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
  id v19 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v18,  1LL);

  id v132 = v19;
  v133 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"salableAdamId"]);
  __int128 v20 = &ACSLocateCachingServer_ptr;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v21) {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v22 = [v21 shouldLog];
  else {
    unsigned int v23 = v22;
  }
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v23 & 2;
  }
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_opt_class(self);
    id v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
    int v137 = 138543874;
    v138 = v26;
    __int16 v139 = 2114;
    id v140 = v28;
    __int16 v141 = 2112;
    v142 = v133;
    v29 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%{public}@: [%{public}@] Starting purchase for adamID: %@",  &v137,  32);

    __int128 v20 = &ACSLocateCachingServer_ptr;
    if (!v29) {
      goto LABEL_26;
    }
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
    free(v29);
    v127 = v24;
    SSFileLog(v21, @"%@");
  }

LABEL_26:
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _URLBagContext](self, "_URLBagContext"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation clientAuditTokenData](self, "clientAuditTokenData"));
  [v30 setClientAuditTokenData:v31];

  id v135 = 0LL;
  v131 = v30;
  unsigned int v32 = -[PurchaseOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v30,  &v135);
  id v33 = v135;
  if ((v32 & 1) != 0) {
    goto LABEL_40;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v34) {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v35 = objc_msgSend(v34, "shouldLog", v127);
  else {
    unsigned int v36 = v35;
  }
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v38 = v36;
  }
  else {
    uint64_t v38 = v36 & 2;
  }
  if (!(_DWORD)v38) {
    goto LABEL_38;
  }
  v39 = (void *)objc_opt_class(self);
  int v137 = 138412546;
  v138 = v39;
  __int16 v139 = 2112;
  id v140 = v33;
  id v40 = v39;
  LODWORD(v129) = 22;
  v41 = (void *)_os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "%@: Could not load URL bag: %@",  &v137,  v129);

  if (v41)
  {
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
    free(v41);
    v127 = v37;
    SSFileLog(v34, @"%@");
LABEL_38:
  }

  -[PurchaseOperation setError:](self, "setError:", v33);
  __int128 v20 = &ACSLocateCachingServer_ptr;
LABEL_40:
  v42 = objc_alloc_init(&OBJC_CLASS___PurchaseResponseInfo);
  responseInfo = self->_responseInfo;
  self->_responseInfo = v42;

  v130 = v33;
  if (+[ISBiometricStore shouldUseApplePayClassic]( &OBJC_CLASS___ISBiometricStore,  "shouldUseApplePayClassic"))
  {
    -[PurchaseOperation _performApplePayClassicCheck](self, "_performApplePayClassicCheck");
  }

  else if (+[ISBiometricStore shouldUseAutoEnrollment]( &OBJC_CLASS___ISBiometricStore,  "shouldUseAutoEnrollment"))
  {
    -[PurchaseOperation _performAutoEnrollmentCheck](self, "_performAutoEnrollmentCheck");
  }

  if (!+[DeviceScorer deviceScoringSupported](&OBJC_CLASS___DeviceScorer, "deviceScoringSupported", v127)) {
    goto LABEL_70;
  }
  int64_t v44 = -[PurchaseOperation _purchaseType](self, "_purchaseType");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v45) {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v46 = [v45 shouldLog];
  else {
    unsigned int v47 = v46;
  }
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 OSLogObject]);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
    uint64_t v49 = v47;
  }
  else {
    uint64_t v49 = v47 & 2;
  }
  if ((_DWORD)v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v44));
    int v137 = 138543618;
    v138 = v50;
    __int16 v139 = 2114;
    id v140 = v51;
    LODWORD(v129) = 22;
    v52 = (void *)_os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  1LL,  "PurchaseOperation: [%{public}@] Evaluating AFDS for purchase type: %{public}@",  &v137,  v129,  v130);

    if (!v52) {
      goto LABEL_57;
    }
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL));
    free(v52);
    v128 = v48;
    SSFileLog(v45, @"%@");
  }

LABEL_57:
  if (v44 != 3 && v44)
  {
    unsigned int v53 = 0;
  }

  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters", v128));
    unsigned int v53 = [v45 containsString:@"STDRDL"] ^ 1;
  }

  __int128 v20 = &ACSLocateCachingServer_ptr;
  if (v44 == 3 || !v44) {

  }
  if (v53) {
    -[PurchaseOperation _scoreDevice](self, "_scoreDevice");
  }
LABEL_70:
  if (!v32) {
    goto LABEL_164;
  }
  HIDWORD(v129) = 0;
  while (1)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseResponseInfo dialog](self->_responseInfo, "dialog", v128));
    -[PurchaseResponseInfo reset](self->_responseInfo, "reset");
    -[PurchaseOperation setError:](self, "setError:", 0LL);
    if (v54) {
      -[PurchaseOperation _runDialogOperationForDialog:](self, "_runDialogOperationForDialog:", v54);
    }
    else {
      -[PurchaseOperation _runPurchaseRequest](self, "_runPurchaseRequest");
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseResponseInfo changedBuyParameters](self->_responseInfo, "changedBuyParameters"));
    if ((-[PurchaseOperation success](self, "success") & 1) != 0
      || (-[PurchaseOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      break;
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseResponseInfo dialog](self->_responseInfo, "dialog"));

    if (v56)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedDaemonConfig]);
      if (!v57) {
        v57 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedConfig]);
      }
      LODWORD(v58) = [v57 shouldLog];
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v57 OSLogObject]);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
        uint64_t v58 = v58;
      }
      else {
        v58 &= 2u;
      }
      if ((_DWORD)v58)
      {
        v60 = (void *)objc_opt_class(self);
        int v137 = 138412290;
        v138 = v60;
        id v61 = v60;
        LODWORD(v129) = 12;
        v62 = (void *)_os_log_send_and_compose_impl( v58,  0LL,  0LL,  0LL,  &_mh_execute_header,  v59,  1LL,  "%@: Retry purchase operation after dialog",  &v137,  v129);

        __int128 v20 = &ACSLocateCachingServer_ptr;
        if (!v62) {
          goto LABEL_89;
        }
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v62,  4LL));
        free(v62);
        v128 = v59;
        SSFileLog(v57, @"%@");
      }

      goto LABEL_89;
    }

    if (-[PurchaseResponseInfo shouldRetryForDelayedGoto](self->_responseInfo, "shouldRetryForDelayedGoto"))
    {
      uint64_t v63 = -[PurchaseResponseInfo delayedGotoRetryCount](self->_responseInfo, "delayedGotoRetryCount");
      if (v63 > 4) {
        break;
      }
      uint64_t v64 = v63;
      v65 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedDaemonConfig]);
      if (!v65) {
        v65 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedConfig]);
      }
      LODWORD(v66) = [v65 shouldLog];
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue([v65 OSLogObject]);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO)) {
        uint64_t v66 = v66;
      }
      else {
        v66 &= 2u;
      }
      if ((_DWORD)v66)
      {
        v68 = (void *)objc_opt_class(self);
        int v137 = 138412290;
        v138 = v68;
        id v69 = v68;
        LODWORD(v129) = 12;
        v70 = (void *)_os_log_send_and_compose_impl( v66,  0LL,  0LL,  0LL,  &_mh_execute_header,  v67,  1LL,  "%@: Retry after delayed goto",  &v137,  v129);

        if (v70)
        {
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v70,  4LL));
          free(v70);
          v128 = v67;
          SSFileLog(v65, @"%@");
          goto LABEL_102;
        }
      }

      else
      {
LABEL_102:
      }

      if (v55) {
        -[PurchaseOperation setBuyParameters:](self, "setBuyParameters:", v55);
      }
      -[PurchaseResponseInfo setDelayedGotoRetryCount:](self->_responseInfo, "setDelayedGotoRetryCount:", v64 + 1, v128);
      __int128 v20 = &ACSLocateCachingServer_ptr;
      goto LABEL_119;
    }

    if (v55)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedDaemonConfig]);
      if (!v71) {
        v71 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedConfig]);
      }
      LODWORD(v72) = [v71 shouldLog];
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue([v71 OSLogObject]);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO)) {
        uint64_t v72 = v72;
      }
      else {
        v72 &= 2u;
      }
      if ((_DWORD)v72)
      {
        v74 = (void *)objc_opt_class(self);
        int v137 = 138412290;
        v138 = v74;
        id v75 = v74;
        LODWORD(v129) = 12;
        v76 = (void *)_os_log_send_and_compose_impl( v72,  0LL,  0LL,  0LL,  &_mh_execute_header,  v73,  1LL,  "%@: Retry purchase operation after changed buy parameters",  &v137,  v129);

        __int128 v20 = &ACSLocateCachingServer_ptr;
        if (v76)
        {
          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v76,  4LL));
          free(v76);
          v128 = v73;
          SSFileLog(v71, @"%@");
          goto LABEL_117;
        }
      }

      else
      {
LABEL_117:
      }

      -[PurchaseOperation setBuyParameters:](self, "setBuyParameters:", v55);
      goto LABEL_119;
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseResponseInfo machineDataSyncState](self->_responseInfo, "machineDataSyncState"));

    if (v77)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedDaemonConfig]);
      if (!v57) {
        v57 = (void *)objc_claimAutoreleasedReturnValue([v20[459] sharedConfig]);
      }
      LODWORD(v78) = [v57 shouldLog];
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue([v57 OSLogObject]);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO)) {
        uint64_t v78 = v78;
      }
      else {
        v78 &= 2u;
      }
      if ((_DWORD)v78)
      {
        v80 = (void *)objc_opt_class(self);
        int v137 = 138412290;
        v138 = v80;
        id v81 = v80;
        LODWORD(v129) = 12;
        v82 = (void *)_os_log_send_and_compose_impl( v78,  0LL,  0LL,  0LL,  &_mh_execute_header,  v79,  1LL,  "%@: Retry purchase with MD sync state",  &v137,  v129);

        __int128 v20 = &ACSLocateCachingServer_ptr;
        if (v82)
        {
          v79 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v82,  4LL));
          free(v82);
          v128 = v79;
          SSFileLog(v57, @"%@");
          goto LABEL_132;
        }
      }

      else
      {
LABEL_132:
      }

- (id)uniqueKey
{
  return @"com.apple.itunesstored.PurchaseOperation";
}

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v20 _requestProperties]);
  if (!SSAccountScopeForURLBagType([v7 URLBagType]))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v10 = (SSAccount *)objc_claimAutoreleasedReturnValue([v9 accountWithUniqueIdentifier:v6 scope:0]);
    goto LABEL_5;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_iTunesAccountWithDSID:", v6));

  if (v9)
  {
    unsigned int v10 = -[SSAccount initWithBackingAccount:](objc_alloc(&OBJC_CLASS___SSAccount), "initWithBackingAccount:", v9);
LABEL_5:
    uint64_t v11 = v10;
    goto LABEL_7;
  }

  uint64_t v11 = 0LL;
LABEL_7:

  if (v6) {
    -[PurchaseOperation _addFairPlayToRequestProperties:withAccountIdentifier:]( self,  "_addFairPlayToRequestProperties:withAccountIdentifier:",  v7,  [v6 unsignedLongLongValue]);
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount popBiometricToken](v11, "popBiometricToken"));
  if (!v12) {
    [v20 setIgnorePreexistingSecureToken:0];
  }
  -[PurchaseOperation lock](self, "lock");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
  objc_storeStrong((id *)&self->_mToken, v13);
  -[PurchaseResponseInfo setDidPasswordAuthenticate:]( self->_responseInfo,  "setDidPasswordAuthenticate:",  -[SSBiometricAuthenticationContext didFallbackToPassword]( self->_biometricAuthenticationContext,  "didFallbackToPassword"));
  -[PurchaseOperation unlock](self, "unlock");
  [v7 setValue:v13 forHTTPHeaderField:SSHTTPHeaderXToken];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v7 setValue:v14 forRequestParameter:@"hasBeenAuthedForBuy"];

  -[PurchaseOperation lock](self, "lock");
  authenticationContext = self->_authenticationContext;
  if (authenticationContext)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[SSAuthenticationContext requiredUniqueIdentifier]( authenticationContext,  "requiredUniqueIdentifier"));

    id v17 = 0LL;
    if (!v16 && v11)
    {
      id v17 = -[SSAuthenticationContext mutableCopy](self->_authenticationContext, "mutableCopy");
      [v17 setValuesWithAccount:v11];
      id v18 = (SSAuthenticationContext *)[v17 copy];
      id v19 = self->_authenticationContext;
      self->_authenticationContext = v18;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  self->_didAuthenticate = 1;
  -[PurchaseOperation unlock](self, "unlock");
  if (v17) {
    [v20 setAuthenticationContext:v17];
  }
}

- (void)operation:(id)a3 shouldAuthenticateWithContext:(id)a4 responseHandler:(id)a5
{
  id v14 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  if (!-[PurchaseOperation useRemoteAuthentication](self, "useRemoteAuthentication"))
  {
    uint64_t v8 = SSError(SSErrorDomain, 106LL, 0LL, 0LL);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, 0LL, v9);
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PurchaseOperation remoteAuthenticationHandler](self, "remoteAuthenticationHandler"));
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v14, v7);
  }

  else
  {
    uint64_t v12 = SSError(SSErrorDomain, 106LL, 0LL, 0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v7[2](v7, 0LL, v13);
  }
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForHTTPHeaderField:SSHTTPHeaderXAppleMD]);

  if (!v8)
  {
    unsigned int v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 _accountIdentifier]);
    if (v9)
    {
LABEL_3:
      SSVAnisetteAddHeadersToURLRequest(v7, objc_msgSend(v9, "unsignedLongLongValue", v17), 0);

      goto LABEL_4;
    }

    urlBagKey = self->_urlBagKey;
    if (urlBagKey)
    {
      if (-[NSString isEqualToString:](urlBagKey, "isEqualToString:", @"downloadProduct"))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v11) {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v12 = [v11 shouldLog];
        else {
          LODWORD(v13) = v12;
        }
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v13 = v13;
        }
        else {
          v13 &= 2u;
        }
        if ((_DWORD)v13)
        {
          int v18 = 138543362;
          id v19 = (id)objc_opt_class(self);
          id v15 = v19;
          id v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%{public}@: Using default machine account request for ADI header",  &v18,  12);

          if (!v16)
          {
LABEL_19:

            unsigned int v9 = &off_10036D590;
            goto LABEL_3;
          }

          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
          free(v16);
          id v17 = v14;
          SSFileLog(v11, @"%@");
        }

        goto LABEL_19;
      }
    }
  }

- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4
{
}

- (void)sender:(id)a3 shouldContinueTouchIDSession:(BOOL)a4
{
}

- (void)sender:(id)a3 willSendChallenge:(id)a4 andSignature:(id)a5 andPaymentTokenData:(id)a6 andFpanID:(id)a7 isExtendedAction:(BOOL)a8 isPayment:(BOOL)a9 additionalHeaders:(id)a10
{
  BOOL v10 = a8;
  id v23 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  if (v16) {
    -[SSBiometricAuthenticationContext setChallenge:](self->_biometricAuthenticationContext, "setChallenge:", v16);
  }
  if (v17) {
    -[SSBiometricAuthenticationContext setSignature:](self->_biometricAuthenticationContext, "setSignature:", v17);
  }
  if (v18) {
    -[SSBiometricAuthenticationContext setPaymentTokenData:]( self->_biometricAuthenticationContext,  "setPaymentTokenData:",  v18);
  }
  if (v19) {
    -[SSBiometricAuthenticationContext setFpanID:](self->_biometricAuthenticationContext, "setFpanID:", v19);
  }
  -[SSBiometricAuthenticationContext setIsExtendedAction:]( self->_biometricAuthenticationContext,  "setIsExtendedAction:",  v10);
  -[SSBiometricAuthenticationContext setIsPayment:](self->_biometricAuthenticationContext, "setIsPayment:", a9);
  if (v20)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:SSHTTPHeaderXAppleAMD]);
    if (v21) {
      -[SSBiometricAuthenticationContext setXAppleAMDHeader:]( self->_biometricAuthenticationContext,  "setXAppleAMDHeader:",  v21);
    }
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:SSHTTPHeaderXAppleAMDM]);
    if (v22) {
      -[SSBiometricAuthenticationContext setXAppleAMDMHeader:]( self->_biometricAuthenticationContext,  "setXAppleAMDMHeader:",  v22);
    }
  }
}

- (id)_account
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](self, "authenticationContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requiredUniqueIdentifier]);
  if (v5
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 activeAccount]),
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]),
        v6,
        v5))
  {
    id v7 = [v4 accountScope];
    if (!v7
      || (uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 accountWithUniqueIdentifier:v5 scope:v7])) == 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 accountWithUniqueIdentifier:v5]);
    }

    unsigned int v9 = (void *)v8;
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  return v9;
}

- (id)_accountWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](self, "authenticationContext"));
    id v6 = [v5 accountScope];
    if (!v6
      || (id v7 = v6,
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore")),
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountWithUniqueIdentifier:v4 scope:v7]),
          v8,
          !v9))
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 accountWithUniqueIdentifier:v4]);
    }
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  return v9;
}

- (void)_addFairPlayToRequestProperties:(id)a3 withAccountIdentifier:(unint64_t)a4
{
  id v6 = a3;
  if (-[PurchaseOperation _shouldSendKeyBagSyncData](self, "_shouldSendKeyBagSyncData"))
  {
    CFDataRef v7 = sub_100022204(a4, 1LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v7, "base64EncodedStringWithOptions:", 0LL));
    if (v8) {
      [v6 setValue:v8 forRequestParameter:@"kbsync"];
    }
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  MachineDataAddHeadersToRequestProperties(v6, v9);

  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v28 = 0LL;
  sub_1001A9B64(-1LL, (uint64_t)&v30, (uint64_t)&v28 + 4, (uint64_t)&v29, (uint64_t)&v28);
  if (v10)
  {
    int v11 = v10;
    unsigned int v12 = (NSData *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      unsigned int v12 = (NSData *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = -[NSData shouldLog](v12, "shouldLog");
    else {
      unsigned int v14 = v13;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSData OSLogObject](v12, "OSLogObject"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v14 & 2;
    }
    if ((_DWORD)v16)
    {
      int v31 = 134217984;
      uint64_t v32 = v11;
      id v17 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  2LL,  "[MD]: Skipping OTP request after return code: %ld",  &v31);

      if (!v17) {
        goto LABEL_35;
      }
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      SSFileLog(v12, @"%@");
    }

    goto LABEL_34;
  }

  if (HIDWORD(v28))
  {
    id v18 = objc_alloc(&OBJC_CLASS___NSData);
    unsigned int v12 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v18,  "initWithBytesNoCopy:length:freeWhenDone:",  v30,  HIDWORD(v28),  0LL);
  }

  else
  {
    unsigned int v12 = 0LL;
  }

  if (-[PurchaseOperation _shouldSendSBSyncData](self, "_shouldSendSBSyncData"))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _fairPlaySubscriptionController](self, "_fairPlaySubscriptionController"));
    id v26 = 0LL;
    id v27 = 0LL;
    [v19 generateSubscriptionBagRequestWithAccountUniqueIdentifier:a4 transactionType:312 machineIDData:v12 returningSubscriptionBagData:&v27 error:&v26];
    id v20 = v27;
    id v21 = v26;
    if (!v21)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
      if (v22) {
        [v6 setValue:v22 forRequestParameter:@"sbsync"];
      }
    }
  }

  if (v12)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v12, "base64EncodedStringWithOptions:", 0LL));
    if (v23) {
      [v6 setValue:v23 forHTTPHeaderField:SSHTTPHeaderXAppleAMDM];
    }
  }

  if (v29)
  {
    v24 = objc_alloc(&OBJC_CLASS___NSData);
    id v15 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v24,  "initWithBytesNoCopy:length:freeWhenDone:",  v29,  v28,  0LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s base64EncodedStringWithOptions:](v15, "base64EncodedStringWithOptions:", 0LL));
    if (v25) {
      [v6 setValue:v25 forHTTPHeaderField:SSHTTPHeaderXAppleAMD];
    }

LABEL_34:
  }

- (id)_buyParamProductType
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
  id v4 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v3,  1LL);

  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productType"]);
  if (!-[__CFString length](v5, "length") && -[PurchaseOperation microPayment](self, "microPayment"))
  {

    id v5 = @"A";
  }

  if (!-[__CFString length](v5, "length"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class(self);
      id v10 = v14;
      int v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "%{public}@: Unable to find productType in buyParams",  &v13,  12);

      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }

      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_17;
  }

- (BOOL)_clientIsViewService
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [&off_10036E3D0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&off_10036E3D0);
        }
        unsigned int v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v6);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation clientIdentifier](self, "clientIdentifier"));
        LOBYTE(v7) = [v7 isEqualToString:v8];

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = [&off_10036E3D0 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (void)_continueTouchIDSessionWithDialog:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "buttons", 0));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) dictionary]);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"tidContinue"]);

        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && [v10 BOOLValue])
        {

          -[SSBiometricAuthenticationContext setShouldContinueTouchIDSession:]( self->_biometricAuthenticationContext,  "setShouldContinueTouchIDSession:",  1LL);
          return;
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (id)_countryCode
{
  id v3 = objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v5 = -[ISLoadURLBagOperation initWithBagContext:](v3, "initWithBagContext:", v4);

  -[ISLoadURLBagOperation start](v5, "start");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v5, "URLBag"));
  uint64_t v7 = v6;
  if (!v6)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v10 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      int v22 = 138543362;
      id v23 = (id)objc_opt_class(self);
      id v19 = v23;
      id v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%{public}@: Auto-enrollment failed for no bag",  &v22,  12);

      if (!v20)
      {
LABEL_26:
        unsigned int v9 = 0LL;
        goto LABEL_27;
      }

      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_26;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"countryCode"]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_13;
  }
  int v22 = 138543618;
  id v23 = (id)objc_opt_class(self);
  __int16 v24 = 2114;
  uint64_t v25 = v9;
  id v14 = v23;
  __int128 v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%{public}@: Auto-enrollment found countryCode: %{public}@",  &v22,  22);

  if (v15)
  {
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v10, @"%@");
LABEL_13:
  }

- (id)_deviceScoreMetricsParam
{
  if (+[DeviceScorer deviceScoringSupported](&OBJC_CLASS___DeviceScorer, "deviceScoringSupported"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation deviceScore](self, "deviceScore"));
    id v4 = [v3 length];
    id v5 = @"true";
    if (!v4) {
      id v5 = @"false";
    }
    id v6 = v5;
  }

  else
  {
    id v6 = @"disabled";
  }

  return v6;
}

- (id)_fairPlaySubscriptionController
{
  if (!self->_fairPlaySubscriptionController)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SSVFairPlaySubscriptionController);
    fairPlaySubscriptionController = self->_fairPlaySubscriptionController;
    self->_fairPlaySubscriptionController = v3;
  }

  -[PurchaseOperation unlock](self, "unlock");
  return self->_fairPlaySubscriptionController;
}

- (void)_handleFailureForOperation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataProvider]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 output]);
  v105 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 redirectActionParameters]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISDialogKey]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISFailureTypeKey]);
  __int128 v10 = &selRef_operation_didReceiveResponse_;
  if ([v9 integerValue] == (id)3800 && self->_originalProductOwnerAccountDSID)
  {
    -[PurchaseResponseInfo setShouldRetryWithOriginalProductOwnerAccount:]( self->_responseInfo,  "setShouldRetryWithOriginalProductOwnerAccount:",  1LL);
    goto LABEL_91;
  }

  if (v7)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
    unsigned __int8 v12 = [v7 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v56) {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      v104 = v9;
      unsigned int v57 = [v56 shouldLog];
      else {
        unsigned int v58 = v57;
      }
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 OSLogObject]);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v60 = v58;
      }
      else {
        uint64_t v60 = v58 & 2;
      }
      if ((_DWORD)v60)
      {
        id v61 = v8;
        v62 = v7;
        uint64_t v63 = (void *)objc_opt_class(self);
        v99 = v6;
        id v64 = v63;
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
        int v111 = 138543874;
        uint64_t v112 = v63;
        uint64_t v7 = v62;
        uint64_t v8 = v61;
        __int16 v113 = 2114;
        id v114 = v65;
        __int16 v115 = 2112;
        v116 = v7;
        uint64_t v66 = (void *)_os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v59,  0LL,  "%{public}@: [%{public}@] Changing buy parameters after auth dialog: %@",  &v111,  32);

        id v6 = v99;
        if (v66)
        {
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v66,  4LL));
          free(v66);
          id v91 = v67;
          SSFileLog(v56, @"%@");
        }
      }

      else
      {
      }

      -[PurchaseOperation _setChangedBuyParameters:fromDataProvider:]( self,  "_setChangedBuyParameters:fromDataProvider:",  v7,  v105);
      unsigned int v9 = v104;
      goto LABEL_90;
    }
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    id v14 = -[ISDialog initWithDialogDictionary:](objc_alloc(&OBJC_CLASS___ISDialog), "initWithDialogDictionary:", v8);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationContext]);
    -[ISDialog setAuthenticationContext:](v14, "setAuthenticationContext:", v15);

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"metrics"]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SSAuthorizationMetricsController dialogIdForMetricsDictionary:]( &OBJC_CLASS___SSAuthorizationMetricsController,  "dialogIdForMetricsDictionary:",  v16));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ISDialog paymentSheet](v14, "paymentSheet"));
    [v18 setDialogId:v17];

    -[PurchaseOperation _continueTouchIDSessionWithDialog:](self, "_continueTouchIDSessionWithDialog:", v14);
    if (-[ISDialog kind](v14, "kind") == (id)1)
    {
LABEL_89:

LABEL_90:
      __int128 v10 = &selRef_operation_didReceiveResponse_;
      goto LABEL_91;
    }

    v94 = v16;
    id v96 = v4;
    uint64_t v100 = v7;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ISDialog buttons](v14, "buttons"));
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    id v20 = [v19 countByEnumeratingWithState:&v106 objects:v110 count:16];
    v93 = v17;
    unsigned int v98 = v6;
    id v102 = v9;
    if (v20)
    {
      id v21 = v20;
      char v22 = 0;
      char v23 = 0;
      uint64_t v24 = *(void *)v107;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v107 != v24) {
            objc_enumerationMutation(v19);
          }
          unsigned int v26 = [*(id *)(*((void *)&v106 + 1) + 8 * (void)i) actionType];
          if (v26 == 1)
          {
            char v22 = 1;
          }

          else if (v26 == 11 || v26 == 3)
          {
            char v23 = 1;
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v106 objects:v110 count:16];
      }

      while (v21);
      unsigned int v9 = v102;
      if ((v23 & 1) != 0)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v28) {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v29 = [v28 shouldLog];
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = v29 & 2;
        }
        if ((_DWORD)v31)
        {
          uint64_t v32 = (void *)objc_opt_class(self);
          id v33 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
          int v111 = 138412546;
          uint64_t v112 = v32;
          __int16 v113 = 2112;
          id v114 = v34;
          unsigned int v35 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Purchase failed with retry dialog: %@",  &v111,  22);

          id v4 = v96;
          unsigned int v9 = v102;
          if (!v35)
          {
LABEL_72:

            -[PurchaseResponseInfo setDialog:](self->_responseInfo, "setDialog:", v14);
LABEL_88:

            id v6 = v98;
            uint64_t v7 = v100;
            uint64_t v17 = v93;
            unsigned int v16 = v94;
            goto LABEL_89;
          }

          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
          free(v35);
          id v91 = v30;
          SSFileLog(v28, @"%@");
        }

        else
        {
          id v4 = v96;
          unsigned int v9 = v102;
        }

        goto LABEL_72;
      }
    }

    else
    {
      char v22 = 0;
    }

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation error](self, "error"));

    if (!v68)
    {
      if ((v22 & 1) != 0)
      {
        uint64_t v69 = ISError(16LL, 0LL, 0LL);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        -[PurchaseOperation setError:](self, "setError:", v70);
      }

      else
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"customerMessage"]);
        uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v70, v71) & 1) == 0)
        {

          v70 = 0LL;
        }

        if (v9)
        {
          uint64_t v72 = SSServerErrorDomain;
          uint64_t v73 = (uint64_t)[v9 integerValue];
          uint64_t v74 = v72;
        }

        else
        {
          uint64_t v74 = SSErrorDomain;
          uint64_t v73 = 13LL;
        }

        uint64_t v75 = SSError(v74, v73, v70, 0LL);
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        -[PurchaseOperation setError:](self, "setError:", v76);
      }
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v77) {
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v78 = [v77 shouldLog];
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue([v77 OSLogObject]);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v80 = v78;
    }
    else {
      uint64_t v80 = v78 & 2;
    }
    if ((_DWORD)v80)
    {
      id v81 = (void *)objc_opt_class(self);
      id v92 = v81;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
      unsigned int v83 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation error](self, "error"));
      int v111 = 138412802;
      uint64_t v112 = v81;
      __int16 v113 = 2112;
      id v114 = v82;
      __int16 v115 = 2112;
      v116 = v83;
      v84 = (void *)_os_log_send_and_compose_impl( v80,  0LL,  0LL,  0LL,  &_mh_execute_header,  v79,  0LL,  "%@: Purchase: %@ failed with dialog and error: %@",  &v111,  32);

      unsigned int v9 = v102;
      if (!v84)
      {
LABEL_87:

        -[PurchaseOperation setDisplayedErrorDialog:](self, "setDisplayedErrorDialog:", 1LL);
        int64_t v85 = objc_alloc_init(&OBJC_CLASS___NSUUID);
        int64_t v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v85, "UUIDString"));

        v87 = (void *)objc_claimAutoreleasedReturnValue(+[ISBiometricStore sharedInstance](&OBJC_CLASS___ISBiometricStore, "sharedInstance"));
        [v87 addContextToCache:self->_biometricAuthenticationContext withToken:v86];

        -[ISDialog setTouchIDContinueToken:](v14, "setTouchIDContinueToken:", v86);
        uint64_t v88 = -[DaemonDialogOperation initWithDialog:]( objc_alloc(&OBJC_CLASS___DaemonDialogOperation),  "initWithDialog:",  v14);
        -[DaemonDialogOperation setDisplaysOnLockscreen:](v88, "setDisplaysOnLockscreen:", self->_displaysOnLockScreen);
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
        [v89 addOperation:v88];

        id v4 = v96;
        goto LABEL_88;
      }

      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v84,  4LL));
      free(v84);
      id v91 = v79;
      SSFileLog(v77, @"%@");
    }

    goto LABEL_87;
  }

  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"customerMessage"]);
  uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
  v101 = v7;
  v103 = v9;
  if ((objc_opt_isKindOfClass(v36, v37) & 1) == 0)
  {
    uint64_t v38 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISOperation));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    uint64_t v40 = objc_claimAutoreleasedReturnValue( [v39 localizedStringForKey:@"GENERIC_PURCHASE_ERROR" value:&stru_10035EB18 table:0]);

    unsigned int v36 = (void *)v40;
  }

  unsigned int v97 = v36;
  uint64_t v41 = ISError(13LL, v36, 0LL);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[PurchaseOperation setError:](self, "setError:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v43) {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v44 = [v43 shouldLog];
  else {
    unsigned int v45 = v44;
  }
  unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v47 = v45;
  }
  else {
    uint64_t v47 = v45 & 2;
  }
  if ((_DWORD)v47)
  {
    v48 = (void *)objc_opt_class(self);
    id v95 = v48;
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
    v50 = v6;
    v51 = v8;
    id v52 = v4;
    unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
    int v111 = 138544130;
    uint64_t v112 = v48;
    __int16 v113 = 2114;
    id v114 = v49;
    __int16 v115 = 2112;
    unsigned int v9 = v103;
    v116 = v103;
    __int16 v117 = 2112;
    v118 = v53;
    v54 = (void *)_os_log_send_and_compose_impl( v47,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "%{public}@: [%{public}@] Purchase failed with code %@: %@",  &v111,  42);

    id v4 = v52;
    uint64_t v8 = v51;
    id v6 = v50;
    __int128 v10 = &selRef_operation_didReceiveResponse_;

    if (v54)
    {
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v54,  4LL));
      free(v54);
      id v91 = v55;
      SSFileLog(v43, @"%@");
    }
  }

  else
  {

    unsigned int v9 = v103;
  }

  uint64_t v7 = v101;
LABEL_91:
  objc_msgSend(*(id *)&self->ISOperation_opaque[*((int *)v10 + 821)], "setMachineDataSyncState:", 0, v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);
  -[PurchaseOperation _performMachineDataActionForURLResponse:](self, "_performMachineDataActionForURLResponse:", v90);
}

- (id)_newPurchaseRequestOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v3 setDelegate:self];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
  [v3 setLogKey:v4];

  [v3 setMachineDataStyle:0];
  [v3 setShouldCancelBiometricTokenUpdate:self->_shouldCancelBiometricTokenUpdate];
  [v3 setShouldSendXTokenHeader:1];
  [v3 setTracksPerformanceMetrics:1];
  [v3 setUseUserSpecificURLBag:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](self, "authenticationContext"));
  id v6 = (SSMutableAuthenticationContext *)[v5 mutableCopy];

  if (!v6)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
    id v6 = -[SSMutableAuthenticationContext initWithAccount:](v7, "initWithAccount:", v9);

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation logKey](self, "logKey"));
    -[SSMutableAuthenticationContext setLogUUID:](v6, "setLogUUID:", v10);
  }

  -[SSMutableAuthenticationContext setAllowsBootstrapCellularData:]( v6,  "setAllowsBootstrapCellularData:",  -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  -[SSMutableAuthenticationContext setDisplaysOnLockScreen:]( v6,  "setDisplaysOnLockScreen:",  self->_displaysOnLockScreen);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation urlBagKey](self, "urlBagKey"));
  unsigned int v12 = [v11 isEqualToString:@"updateProduct"];

  if (v12) {
    -[SSMutableAuthenticationContext setCanSetActiveAccount:](v6, "setCanSetActiveAccount:", 0LL);
  }
  if (-[PurchaseOperation isMoveToiOS](self, "isMoveToiOS"))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
    if (!v13) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      unsigned int v15 = v14;
    }
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v15 & 2;
    }
    if ((_DWORD)v17)
    {
      id v18 = (id)objc_opt_class(self);
      int v140 = 138543362;
      id v141 = v18;
      id v19 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%{public}@: Purchase operation is Move to iOS, ignoring account conversion.",  &v140,  12);

      if (!v19)
      {
LABEL_18:

        -[SSMutableAuthenticationContext setShouldIgnoreAccountConversion:]( v6,  "setShouldIgnoreAccountConversion:",  1LL);
        goto LABEL_19;
      }

      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      v124 = v16;
      SSFileLog(v13, @"%@");
    }

    goto LABEL_18;
  }

- (id)_newRequestParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
  id v4 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v3,  1LL);

  [v4 removeObjectForKey:@"isUpdateAll"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);

  if (v6) {
    [v4 setObject:v6 forKey:@"guid"];
  }
  if (-[PurchaseOperation requiresSerialNumber](self, "requiresSerialNumber"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 serialNumber]);

    if (v8)
    {
      [v4 setObject:v8 forKey:@"serialNumber"];
      id v6 = (void *)v8;
    }

    else
    {
      id v6 = 0LL;
    }
  }

  if (-[PurchaseOperation isBackgroundPurchase](self, "isBackgroundPurchase")) {
    [v4 setObject:@"1" forKey:@"is-background"];
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation affiliateIdentifier](self, "affiliateIdentifier"));

  if ([v9 length]) {
    [v4 setObject:v9 forKey:@"caller"];
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"generateBuyParams"]);

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 BOOLValue]));
    [v4 setObject:v11 forKey:@"generateBuyParams"];
  }

  if (-[PurchaseOperation isPlaybackRequest](self, "isPlaybackRequest")) {
    [v4 setObject:@"1" forKey:@"playback"];
  }
  if (qword_1003A31B8 != -1) {
    dispatch_once(&qword_1003A31B8, &stru_10034B150);
  }
  if (!byte_1003A31B0)
  {
    ISWeakLinkerLoadLibrary(12LL);
    unsigned int v12 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v12, "aa_primaryAppleAccount"));
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _account](self, "_account"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 creditsString]);

  if ([v15 length]) {
    [v4 setObject:v15 forKey:@"creditDisplay"];
  }
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation deviceScore](self, "deviceScore"));

  if (v16)
  {
    unsigned int v44 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceScorer context](self->_deviceScorer, "context"));
    id v18 = [v17 serverEndpoint];

    id v19 = @"afds";
    if (v18 == (id)2) {
      id v19 = @"afdsv2";
    }
    uint64_t v20 = v19;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation deviceScore](self, "deviceScore"));
    [v4 setObject:v21 forKey:v20];

    -[PurchaseOperation setDidConsumeScore:](self, "setDidConsumeScore:", 1LL);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      unsigned int v24 = v23;
    }
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v24 & 2;
    }
    if ((_DWORD)v26)
    {
      unsigned int v27 = (void *)objc_opt_class(self);
      id v41 = v27;
      uint64_t v28 = SSHashIfNeeded(v20);
      uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
      uint64_t v42 = v20;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
      id v43 = v14;
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation deviceScore](self, "deviceScore"));
      uint64_t v32 = SSHashIfNeeded(v31);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      int v47 = 138544130;
      uint64_t v48 = v27;
      __int16 v49 = 2114;
      uint64_t v50 = v29;
      v34 = (void *)v29;
      __int16 v51 = 2114;
      id v52 = v30;
      __int16 v53 = 2114;
      v54 = v33;
      id v35 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%{public}@: Attached fraud score to buyParams. buyParam = %{public}@, fraudAction = %{public}@, fr audScore = %{public}@",  &v47,  42);

      unsigned int v14 = v43;
      uint64_t v20 = v42;

      if (v35)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
        free(v35);
        unsigned int v40 = v36;
        SSFileLog(v22, @"%@");
      }
    }

    else
    {
    }

    unsigned int v15 = v44;
  }

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLRequestProperties requestParameters](self->_requestProperties, "requestParameters", v40));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100018F54;
  v45[3] = &unk_10034B178;
  id v38 = v4;
  id v46 = v38;
  [v37 enumerateKeysAndObjectsUsingBlock:v45];

  return v38;
}

- (void)_performDelayedGotoForOperation:(id)a3
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([a3 dataProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v11 output]);
  id v5 = objc_alloc(&OBJC_CLASS___DelayedGotoSemaphore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DelayedGoto"]);
  uint64_t v7 = -[DelayedGotoSemaphore initWithDelayedGoto:](v5, "initWithDelayedGoto:", v6);

  -[DelayedGotoSemaphore wait](v7, "wait");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DelayedGotoSemaphore bodyDictionary](v7, "bodyDictionary"));
  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL queryStringForDictionary:escapedValues:]( &OBJC_CLASS___NSURL,  "queryStringForDictionary:escapedValues:",  v8,  0LL));
    -[PurchaseOperation _setChangedBuyParameters:fromDataProvider:]( self,  "_setChangedBuyParameters:fromDataProvider:",  v9,  v11);
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[DelayedGotoSemaphore URL](v7, "URL"));
  if (v10) {
    -[PurchaseResponseInfo setRedirectURL:](self->_responseInfo, "setRedirectURL:", v10);
  }
  -[PurchaseResponseInfo setShouldRetryForDelayedGoto:](self->_responseInfo, "setShouldRetryForDelayedGoto:", 1LL);
}

- (void)_performMachineDataActionForURLResponse:(id)a3
{
  id v4 = a3;
  id v5 = [[SSMachineDataRequest alloc] initWithURLResponse:v4];

  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticatedAccountDSID](self, "authenticatedAccountDSID"));
  [v5 setAccountIdentifier:v6];
  objc_msgSend( v5,  "setAllowsBootstrapCellularData:",  -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  id v7 = [[ISMachineDataActionOperation alloc] initWithMachineDataRequest:v5];
  [v7 setBlocksPurchaseRequests:0];
  [v7 setHidesServerDrivenDialogs:self->_suppressDialogs];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLRequestProperties HTTPHeaders](self->_requestProperties, "HTTPHeaders"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:SSHTTPHeaderUserAgent]);
  [v7 setUserAgent:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 actionName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = [v11 shouldLog];
  else {
    unsigned int v13 = v12;
  }
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 & 2;
  }
  uint64_t v25 = (void *)v6;
  if (!(_DWORD)v15) {
    goto LABEL_13;
  }
  int v26 = 138412802;
  id v27 = (id)objc_opt_class(self);
  __int16 v28 = 2112;
  uint64_t v29 = v10;
  __int16 v30 = 2112;
  uint64_t v31 = v6;
  id v16 = v27;
  uint64_t v17 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%@: Performing machine-data action: %@ with accountID: %@",  &v26,  32);

  if (v17)
  {
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    unsigned int v24 = v14;
    SSFileLog(v11, @"%@");
LABEL_13:
  }

  -[PurchaseOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, 0LL);
  unsigned int v18 = [v7 success];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 syncState]);
  -[PurchaseResponseInfo setMachineDataSyncState:](self->_responseInfo, "setMachineDataSyncState:", v19);
  if (v19) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v18;
  }
  -[PurchaseResponseInfo setShouldRetryForMachineData:](self->_responseInfo, "setShouldRetryForMachineData:", v20, v24);
  if (-[PurchaseResponseInfo shouldRetryForMachineData](self->_responseInfo, "shouldRetryForMachineData"))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSBiometricAuthenticationContext challenge](self->_biometricAuthenticationContext, "challenge"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SSBiometricAuthenticationContext signature](self->_biometricAuthenticationContext, "signature"));
    unsigned int v23 = (void *)v22;
    if (v21 && v22) {
      -[SSBiometricAuthenticationContext setShouldContinueTouchIDSession:]( self->_biometricAuthenticationContext,  "setShouldContinueTouchIDSession:",  1LL);
    }
  }

LABEL_26:
}

- (void)_performApplePayClassicCheck
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v9 = 138543362;
  id v10 = (id)objc_opt_class(self);
  id v7 = v10;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: apple-pay-classic: Platform not supported",  &v9,  12);

  if (v8)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }
}

- (void)_performAutoEnrollmentCheck
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v9 = 138543362;
  id v10 = (id)objc_opt_class(self);
  id v7 = v10;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Auto-Enrollment Check: Platform not supported",  &v9,  12);

  if (v8)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }
}

- (id)_priceFromBuyParams
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
  id v3 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v2,  1LL);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"price"]);
  if (v4)
  {
    uint64_t v5 = (void *)qword_1003A31C0;
    if (!qword_1003A31C0)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      id v7 = (void *)qword_1003A31C0;
      qword_1003A31C0 = (uint64_t)v6;

      [(id)qword_1003A31C0 setNumberStyle:1];
      uint64_t v5 = (void *)qword_1003A31C0;
    }

    uint64_t v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v5 numberFromString:v4]);
  }

  else
  {
    uint64_t v8 = &off_10036D5A8;
  }

  return v8;
}

- (int64_t)_purchaseType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation urlBagKey](self, "urlBagKey"));
  if ([v2 isEqualToString:@"backgroundUpdateProduct"])
  {
    int64_t v3 = 1LL;
  }

  else if ([v2 isEqualToString:@"buyProduct"])
  {
    int64_t v3 = 0LL;
  }

  else if ([v2 isEqualToString:@"downloadProduct"])
  {
    int64_t v3 = 2LL;
  }

  else if ([v2 isEqualToString:@"p2-in-app-buy"])
  {
    int64_t v3 = 3LL;
  }

  else if ([v2 isEqualToString:@"updateProduct"])
  {
    int64_t v3 = 4LL;
  }

  else
  {
    int64_t v3 = 0LL;
  }

  return v3;
}

- (id)_recordEngagementEventWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AMSMetricsEvent alloc] initForEngagement];
  [v8 setProperty:@"purchase" forBodyKey:@"eventType"];
  [v8 setProperty:@"AMS" forBodyKey:@"source"];
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6 == 0LL));
  [v8 setProperty:v9 forBodyKey:@"success"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PurchaseOperation _purchaseType](self, "_purchaseType")));
  [v8 setProperty:v10 forBodyKey:@"purchaseType"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](self, "buyParameters"));
  id v12 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v11,  1LL);

  [v8 setProperty:v12 forBodyKey:@"buyParameters"];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticatedAccountDSID](self, "authenticatedAccountDSID"));
  [v8 setProperty:v13 forBodyKey:@"accountId"];

  [v8 setProperty:v7 forBodyKey:@"responseDictionary"];
  if (v6)
  {
    v46[0] = @"code";
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    v47[0] = v14;
    v46[1] = @"domain";
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 domain]);
    id v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = (const __CFString *)v15;
    }
    else {
      uint64_t v17 = &stru_10035EB18;
    }
    v47[1] = v17;
    v46[2] = @"title";
    uint64_t v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_title"));
    id v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (const __CFString *)v18;
    }
    else {
      uint64_t v20 = &stru_10035EB18;
    }
    v47[2] = v20;
    v46[3] = @"message";
    uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_message"));
    uint64_t v22 = (void *)v21;
    if (v21) {
      unsigned int v23 = (const __CFString *)v21;
    }
    else {
      unsigned int v23 = &stru_10035EB18;
    }
    v47[3] = v23;
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  4LL));

    [v8 setProperty:v24 forBodyKey:@"error"];
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v25) {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_opt_class(self);
    uint64_t v28 = AMSLogKey();
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v27;
    __int16 v42 = 2114;
    id v43 = v29;
    __int16 v44 = 1024;
    BOOL v45 = v6 == 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Recording engagement event. success: %d",  buf,  0x1Cu);
  }

  id v30 = objc_alloc_init(&OBJC_CLASS___AMSEngagement);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 underlyingDictionary]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 enqueueData:v31]);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100019D24;
  v37[3] = &unk_10034B1A0;
  id v33 = objc_alloc_init(&OBJC_CLASS___AMSBinaryPromise);
  id v38 = v33;
  unsigned int v39 = self;
  [v32 addFinishBlock:v37];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100019F58;
  v36[3] = &unk_10034B1C8;
  v36[4] = self;
  [v33 addErrorBlock:v36];
  id v34 = v33;

  return v34;
}

- (void)_runDialogOperationForDialog:(id)a3
{
  id v121 = a3;
  v124 = self;
  if (!-[PurchaseOperation skipsConfirmationDialogs](self, "skipsConfirmationDialogs")) {
    goto LABEL_25;
  }
  id obj = (id)objc_claimAutoreleasedReturnValue([v121 buttons]);
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v4 = [obj countByEnumeratingWithState:&v140 objects:v154 count:16];
  if (!v4)
  {

    goto LABEL_25;
  }

  uint64_t v5 = *(void *)v141;
  char v6 = 1;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v141 != v5) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v140 + 1) + 8LL * (void)i);
      if (objc_msgSend(v8, "actionType", v117) == 3)
      {
        int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v9) {
          int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v10 = [v9 shouldLog];
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = v10 & 2;
        }
        if ((_DWORD)v12)
        {
          unsigned int v13 = (void *)objc_opt_class(v124);
          id v14 = v13;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 parameter]);
          *(_DWORD *)v150 = 138412546;
          *(void *)&v150[4] = v13;
          *(_WORD *)&v150[12] = 2112;
          *(void *)&v150[14] = v15;
          LODWORD(v120) = 22;
          id v16 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Skipping confirmation dialog with buy parameters: %@",  v150,  v120);

          if (v16)
          {
            id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
            free(v16);
            __int16 v117 = v11;
            SSFileLog(v9, @"%@");
            goto LABEL_18;
          }
        }

        else
        {
LABEL_18:
        }

        responseInfo = v124->_responseInfo;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 parameter]);
        -[PurchaseResponseInfo setChangedBuyParameters:](responseInfo, "setChangedBuyParameters:", v18);

        char v6 = 0;
        continue;
      }
    }

    id v4 = [obj countByEnumeratingWithState:&v140 objects:v154 count:16];
  }

  while (v4);

  if ((v6 & 1) == 0) {
    goto LABEL_139;
  }
LABEL_25:
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v117));
  if (!v19) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v20) = [v19 shouldLog];
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    uint64_t v20 = v20;
  }
  else {
    v20 &= 2u;
  }
  if ((_DWORD)v20)
  {
    uint64_t v22 = (void *)objc_opt_class(v124);
    *(_DWORD *)v150 = 138412290;
    *(void *)&v150[4] = v22;
    id v23 = v22;
    LODWORD(v120) = 12;
    unsigned int v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Prompting user with buy confirmation",  v150,  v120);

    if (v24)
    {
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      v118 = v21;
      SSFileLog(v19, @"%@");
      goto LABEL_35;
    }
  }

  else
  {
LABEL_35:
  }

  id obja = (id)objc_claimAutoreleasedReturnValue([v121 paymentSheet]);
  if (!obja)
  {
    uint64_t v50 = -[DaemonDialogOperation initWithDialog:]( objc_alloc(&OBJC_CLASS___DaemonDialogOperation),  "initWithDialog:",  v121);
    -[DaemonDialogOperation setDisplaysOnLockscreen:](v50, "setDisplaysOnLockscreen:", v124->_displaysOnLockScreen);
    *(void *)v150 = 0LL;
    *(void *)&v150[8] = v150;
    *(void *)&v150[16] = 0x3032000000LL;
    v151 = sub_10001B3B0;
    v152 = sub_10001B3C0;
    id v153 = 0LL;
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472LL;
    v127[2] = sub_10001B890;
    v127[3] = &unk_10034B240;
    uint64_t v129 = v150;
    id v51 = v121;
    id v128 = v51;
    -[DaemonDialogOperation setOutputBlock:](v50, "setOutputBlock:", v127);
    id v126 = 0LL;
    id v52 = v124;
    unsigned __int8 v53 = -[PurchaseOperation runSubOperation:returningError:]( v124,  "runSubOperation:returningError:",  v50,  &v126);
    id v54 = v126;
    if ((v53 & 1) == 0)
    {
      -[PurchaseOperation setError:](v124, "setError:", v54);
LABEL_137:

      _Block_object_dispose(v150, 8);
      goto LABEL_138;
    }

    BOOL v55 = *(void **)(*(void *)&v150[8] + 40LL);
    if (v55)
    {
      if ([v55 actionType] == 3)
      {
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v56) {
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v57 = objc_msgSend(v56, "shouldLog", v118);
        unsigned int v58 = [v56 shouldLogToDisk];
        unsigned int v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 OSLogObject]);
        unsigned int v60 = v59;
        if (v58) {
          v57 |= 2u;
        }
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
          uint64_t v61 = v57;
        }
        else {
          uint64_t v61 = v57 & 2;
        }
        if ((_DWORD)v61)
        {
          id v62 = (id)objc_opt_class(v124);
          id v63 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](v124, "buyParameters"));
          *(_DWORD *)v146 = 138412546;
          *(void *)&v146[4] = v62;
          *(_WORD *)&v146[12] = 2112;
          *(void *)&v146[14] = v63;
          LODWORD(v120) = 22;
          id v64 = (void *)_os_log_send_and_compose_impl( v61,  0LL,  0LL,  0LL,  &_mh_execute_header,  v60,  1LL,  "%@: User confirmed buy confirmation: %@",  v146,  v120);

          if (!v64)
          {
LABEL_76:

            v65 = v124->_responseInfo;
            unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v150[8] + 40) parameter]);
            -[PurchaseResponseInfo setChangedBuyParameters:](v65, "setChangedBuyParameters:", v66);
LABEL_136:

            goto LABEL_137;
          }

          unsigned int v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v64,  4LL));
          free(v64);
          SSFileLog(v56, @"%@");
        }

        goto LABEL_76;
      }

      BOOL v55 = *(void **)(*(void *)&v150[8] + 40LL);
    }

    if (objc_msgSend(v55, "actionType", v118) == 11)
    {
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v150[8] + 40) parameter]);
      uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0)
      {
        uint64_t v75 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v73));

        uint64_t v73 = (void *)v75;
        id v52 = v124;
      }

      id v76 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v76) {
        id v76 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v77) = [v76 shouldLog];
      unsigned int v78 = [v76 shouldLogToDisk];
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue([v76 OSLogObject]);
      uint64_t v80 = v79;
      if (v78) {
        LODWORD(v77) = v77 | 2;
      }
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO)) {
        uint64_t v77 = v77;
      }
      else {
        v77 &= 2u;
      }
      if ((_DWORD)v77)
      {
        id v81 = (void *)objc_opt_class(v52);
        *(_DWORD *)v146 = 138412546;
        *(void *)&v146[4] = v81;
        *(_WORD *)&v146[12] = 2112;
        *(void *)&v146[14] = v73;
        id v82 = v81;
        LODWORD(v120) = 22;
        unsigned int v83 = (void *)_os_log_send_and_compose_impl( v77,  0LL,  0LL,  0LL,  &_mh_execute_header,  v80,  1LL,  "%@: User attempted Ask to Buy: %@",  v146,  v120);

        if (!v83)
        {
LABEL_106:

          v84 = objc_alloc(&OBJC_CLASS___AskPermissionActionOperation);
          uint64_t v85 = objc_claimAutoreleasedReturnValue(-[PurchaseOperation _account](v124, "_account"));
          int64_t v86 = -[AskPermissionActionOperation initWithURL:account:](v84, "initWithURL:account:", v73, v85);

          id v125 = v54;
          LOBYTE(v85) = -[PurchaseOperation runSubOperation:returningError:]( v124,  "runSubOperation:returningError:",  v86,  &v125);
          id v87 = v125;

          if ((v85 & 1) != 0) {
            uint64_t v88 = SSError(SSErrorDomain, 134LL, 0LL, 0LL);
          }
          else {
            uint64_t v88 = SSError(SSErrorDomain, 16LL, 0LL, 0LL);
          }
          v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
          -[PurchaseOperation setError:](v124, "setError:", v89);

          -[PurchaseOperation setSuccess:](v124, "setSuccess:", 0LL);
          id v54 = v87;
          v101 = v124;
LABEL_122:
          id v102 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation authenticationContext](v101, "authenticationContext", v119));
          BOOL v103 = [v102 tokenType] == (id)1;

          if (!v103) {
            goto LABEL_137;
          }
          -[PurchaseOperation lock](v124, "lock");
          BOOL didAuthenticate = v124->_didAuthenticate;
          -[PurchaseOperation unlock](v124, "unlock");
          if (!didAuthenticate) {
            goto LABEL_137;
          }
          unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _account](v124, "_account"));
          [v66 setSecureToken:0];
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
          if (!v105) {
            v105 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v106 = [v105 shouldLog];
          unsigned int v107 = [v105 shouldLogToDisk];
          uint64_t v108 = (os_log_s *)objc_claimAutoreleasedReturnValue([v105 OSLogObject]);
          __int128 v109 = v108;
          if (v107) {
            v106 |= 2u;
          }
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v110 = v106;
          }
          else {
            uint64_t v110 = v106 & 2;
          }
          if ((_DWORD)v110)
          {
            id v111 = (id)objc_opt_class(v124);
            uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v66 accountName]);
            uint64_t v113 = SSHashIfNeeded(v112);
            id v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
            *(_DWORD *)v146 = 138543618;
            *(void *)&v146[4] = v111;
            *(_WORD *)&v146[12] = 2114;
            *(void *)&v146[14] = v114;
            LODWORD(v120) = 22;
            __int16 v115 = (void *)_os_log_send_and_compose_impl( v110,  0LL,  0LL,  0LL,  &_mh_execute_header,  v109,  0LL,  "%{public}@: Clearing credentials after buy confirm cancel. Saving %{public}@.",  v146,  v120);

            if (!v115)
            {
LABEL_135:

              v116 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
              [v116 saveAccount:v66 completion:0];

              goto LABEL_136;
            }

            __int128 v109 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v115,  4LL));
            free(v115);
            SSFileLog(v105, @"%@");
          }

          goto LABEL_135;
        }

        uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v83,  4LL));
        free(v83);
        id v119 = v80;
        SSFileLog(v76, @"%@");
      }

      goto LABEL_106;
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v90) {
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v91 = [v90 shouldLog];
    unsigned int v92 = [v90 shouldLogToDisk];
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue([v90 OSLogObject]);
    v94 = v93;
    if (v92) {
      v91 |= 2u;
    }
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v95 = v91;
    }
    else {
      uint64_t v95 = v91 & 2;
    }
    if ((_DWORD)v95)
    {
      id v96 = (id)objc_opt_class(v124);
      unsigned int v97 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation buyParameters](v124, "buyParameters"));
      *(_DWORD *)v146 = 138412546;
      *(void *)&v146[4] = v96;
      *(_WORD *)&v146[12] = 2112;
      *(void *)&v146[14] = v97;
      LODWORD(v120) = 22;
      unsigned int v98 = (void *)_os_log_send_and_compose_impl( v95,  0LL,  0LL,  0LL,  &_mh_execute_header,  v94,  0LL,  "%@: User declined buy confirmation: %@",  v146,  v120);

      if (!v98)
      {
LABEL_119:

        [*(id *)(*(void *)&v150[8] + 40) performDefaultActionForDialog:v51];
        uint64_t v99 = SSError(SSErrorDomain, 16LL, 0LL, 0LL);
        uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
        -[PurchaseOperation setError:](v124, "setError:", v100);

        v101 = v124;
        -[PurchaseOperation setSuccess:](v124, "setSuccess:", 0LL);
        goto LABEL_122;
      }

      v94 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v98,  4LL));
      free(v98);
      id v119 = v94;
      SSFileLog(v90, @"%@");
    }

    goto LABEL_119;
  }

  uint64_t v136 = 0LL;
  id v137 = &v136;
  uint64_t v138 = 0x2020000000LL;
  char v139 = 0;
  *(void *)v150 = 0LL;
  *(void *)&v150[8] = v150;
  *(void *)&v150[16] = 0x3032000000LL;
  v151 = sub_10001B3B0;
  v152 = sub_10001B3C0;
  id v153 = 0LL;
  uint64_t v25 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(v124));
  int v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = -[DisplayPaymentSheetOperation initWithPaymentSheet:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetOperation),  "initWithPaymentSheet:",  obja);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([obja dialogId]);
  -[DisplayPaymentSheetOperation setDialogId:](v27, "setDialogId:", v28);

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSAuthenticationContext accountName](v124->_authenticationContext, "accountName"));
  -[DisplayPaymentSheetOperation setAccountName:](v27, "setAccountName:", v29);

  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472LL;
  v132[2] = sub_10001B3C8;
  v132[3] = &unk_10034B1F0;
  id v30 = v26;
  id v133 = v30;
  v134 = v150;
  id v135 = &v136;
  -[DisplayPaymentSheetOperation setCompletionHandler:](v27, "setCompletionHandler:", v132);
  uint64_t v31 = -[DisplayPaymentSheetContainerOperation initWithDisplayPaymentSheetOperation:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetContainerOperation),  "initWithDisplayPaymentSheetOperation:",  v27);
  id v131 = 0LL;
  LODWORD(v29) = -[PurchaseOperation runSubOperation:returningError:]( v124,  "runSubOperation:returningError:",  v31,  &v131);
  id v32 = v131;
  if (!(_DWORD)v29 || !*((_BYTE *)v137 + 24))
  {
    -[PurchaseOperation setError:](v124, "setError:", v32);
    -[PurchaseOperation setSuccess:](v124, "setSuccess:", 0LL);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v44 = [v43 shouldLog];
    unsigned int v45 = [v43 shouldLogToDisk];
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
    int v47 = v46;
    if (v45) {
      v44 |= 2u;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      uint64_t v48 = v44;
    }
    else {
      uint64_t v48 = v44 & 2;
    }
    if ((_DWORD)v48)
    {
      *(_DWORD *)v146 = 138543618;
      *(void *)&v146[4] = v30;
      *(_WORD *)&v146[12] = 2114;
      *(void *)&v146[14] = v32;
      LODWORD(v120) = 22;
      __int16 v49 = (void *)_os_log_send_and_compose_impl( v48,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  16LL,  "%{public}@: Payment sheel container operation failed with error: %{public}@",  v146,  v120);

      if (!v49)
      {
LABEL_61:

        goto LABEL_90;
      }

      int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v49,  4LL));
      free(v49);
      SSFileLog(v43, @"%@");
    }

    goto LABEL_61;
  }

  *(void *)v146 = 0LL;
  *(void *)&v146[8] = v146;
  *(void *)&v146[16] = 0x3032000000LL;
  v147 = sub_10001B3B0;
  v148 = sub_10001B3C0;
  id v149 = 0LL;
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v121 buttons]);
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472LL;
  v130[2] = sub_10001B828;
  v130[3] = &unk_10034B218;
  v130[4] = v146;
  [v33 enumerateObjectsUsingBlock:v130];

  if (*(void *)(*(void *)&v146[8] + 40LL))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v34) {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v35 = [v34 shouldLog];
    unsigned int v36 = [v34 shouldLogToDisk];
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
    id v38 = v37;
    if (v36) {
      v35 |= 2u;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v39 = v35;
    }
    else {
      uint64_t v39 = v35 & 2;
    }
    if ((_DWORD)v39)
    {
      int v144 = 138543362;
      id v145 = v30;
      LODWORD(v120) = 12;
      unsigned int v40 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "%{public}@: User confirmed buy using payment sheet",  &v144,  v120);

      if (v40)
      {
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
        free(v40);
        SSFileLog(v34, @"%@");
        goto LABEL_50;
      }
    }

    else
    {
LABEL_50:
    }

    uint64_t v41 = v124->_responseInfo;
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v146[8] + 40) parameter]);
    -[PurchaseResponseInfo setChangedBuyParameters:](v41, "setChangedBuyParameters:", v42);
  }

  else
  {
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v42) {
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v67 = [v42 shouldLog];
    unsigned int v68 = [v42 shouldLogToDisk];
    uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
    id v70 = v69;
    if (v68) {
      v67 |= 2u;
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      uint64_t v71 = v67;
    }
    else {
      uint64_t v71 = v67 & 2;
    }
    if ((_DWORD)v71)
    {
      int v144 = 138412290;
      id v145 = v30;
      LODWORD(v120) = 12;
      uint64_t v72 = (void *)_os_log_send_and_compose_impl( v71,  0LL,  0LL,  0LL,  &_mh_execute_header,  v70,  16LL,  "%{poublic}@: Authorized payment, but failed to find buy button",  &v144,  v120);

      if (!v72) {
        goto LABEL_89;
      }
      id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v72,  4LL));
      free(v72);
      SSFileLog(v42, @"%@");
    }
  }

- (void)_runPurchaseRequest
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 storeFrontIdentifier]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation originatingStorefront](self, "originatingStorefront"));
    unsigned __int8 v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[PurchaseOperation delegate](self, "delegate"));
      if (!v7
        || (id v8 = (void *)v7,
            int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation delegate](self, "delegate")),
            char v10 = objc_opt_respondsToSelector(v9, "purchaseOperation:shouldContinueWithNewStorefront:"),
            v9,
            v8,
            (v10 & 1) == 0))
      {
LABEL_18:
        objc_storeStrong((id *)&self->_originatingStorefront, v4);
        goto LABEL_19;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v11) {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v12 = [v11 shouldLog];
      else {
        LODWORD(v13) = v12;
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v13;
      }
      else {
        v13 &= 2u;
      }
      if ((_DWORD)v13)
      {
        uint64_t v15 = (void *)objc_opt_class(self);
        id v16 = v15;
        uint64_t v17 = SSHashIfNeeded(v4);
        uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
        int v87 = 138543618;
        uint64_t v88 = v15;
        __int16 v89 = 2114;
        v90 = v18;
        id v19 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%{public}@: Storefront changed: %{public}@. Checking with delegate if purchase should continue.",  &v87,  22);

        if (!v19) {
          goto LABEL_17;
        }
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
        free(v19);
        unsigned int v78 = v14;
        SSFileLog(v11, @"%@");
      }

LABEL_17:
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation delegate](self, "delegate"));
      unsigned int v21 = [v20 purchaseOperation:self shouldContinueWithNewStorefront:v4];

      if (!v21)
      {
        id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v22 setObject:v4 forKeyedSubscript:@"storefront"];
        uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  156LL,  v22));
        -[PurchaseOperation setError:](self, "setError:", v77);

        -[PurchaseOperation setSuccess:](self, "setSuccess:", 0LL);
        goto LABEL_74;
      }

      goto LABEL_18;
    }
  }

- (void)_scoreDevice
{
  if (self->_deviceScorer) {
    goto LABEL_20;
  }
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _priceFromBuyParams](self, "_priceFromBuyParams"));
  [v3 floatValue];
  float v5 = v4;

  if (v5 == 0.0)
  {
    uint64_t v6 = 0LL;
  }

  else if (+[DeviceScorer deviceScoringSupportedV2](&OBJC_CLASS___DeviceScorer, "deviceScoringSupportedV2"))
  {
    uint64_t v6 = 2LL;
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  int v8 = [v7 shouldLog];
  unsigned int v9 = [v7 shouldLogToDisk] ? v8 | 2 : v8;
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  uint64_t v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT) ? v9 : v9 & 2u;
  if ((_DWORD)v11)
  {
    unsigned int v12 = (void *)objc_opt_class(self);
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v12;
    __int16 v32 = 2114;
    id v33 = v14;
    uint64_t v15 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Initialize device scorer with server endpoint: %{public}@",  location,  22);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      uint64_t v27 = v16;
      SSFileLog(v7, @"%@");
    }
  }

  else
  {
  }

  uint64_t v17 = -[DeviceScorer initWithServerEndpoint:](objc_alloc(&OBJC_CLASS___DeviceScorer), "initWithServerEndpoint:", v6);
  deviceScorer = self->_deviceScorer;
  self->_deviceScorer = v17;

  if (self->_deviceScorer)
  {
LABEL_20:
    objc_initWeak((id *)location, self);
    id v19 = self->_deviceScorer;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001C774;
    v29[3] = &unk_10034B268;
    objc_copyWeak(&v30, (id *)location);
    v29[4] = self;
    -[DeviceScorer deviceScoreWithNonce:completion:](v19, "deviceScoreWithNonce:completion:", 0LL, v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
    return;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v20) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v21 = objc_msgSend(v20, "shouldLog", v27);
  else {
    LODWORD(v22) = v21;
  }
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v22 = v22;
  }
  else {
    v22 &= 2u;
  }
  if (!(_DWORD)v22) {
    goto LABEL_32;
  }
  unsigned int v24 = (void *)objc_opt_class(self);
  *(_DWORD *)location = 138543362;
  *(void *)&location[4] = v24;
  id v25 = v24;
  LODWORD(v28) = 12;
  uint64_t v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%{public}@: Failed to create device scorer",  location,  v28);

  if (v26)
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
    free(v26);
    SSFileLog(v20, @"%@");
LABEL_32:
  }
}

- (void)_scoreDeviceRetryFailedV2Score
{
  int64_t v3 = -[DeviceScorer initWithServerEndpoint:](objc_alloc(&OBJC_CLASS___DeviceScorer), "initWithServerEndpoint:", 1LL);
  deviceScorer = self->_deviceScorer;
  self->_deviceScorer = v3;

  if (self->_deviceScorer)
  {
    objc_initWeak(location, self);
    float v5 = self->_deviceScorer;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001CCCC;
    v13[3] = &unk_10034B290;
    objc_copyWeak(&v14, location);
    -[DeviceScorer deviceScoreWithNonce:completion:](v5, "deviceScoreWithNonce:completion:", 0LL, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class(self);
      id v10 = *(id *)((char *)location + 4);
      uint64_t v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Failed to create device scorer on retry",  location,  12);

      if (v11)
      {
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
        free(v11);
        SSFileLog(v6, @"%@");
      }
    }

    else
    {
    }
  }

- (void)_setChangedBuyParameters:(id)a3 fromDataProvider:(id)a4
{
  id v12 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a4 authenticatedAccountDSID]);
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _accountWithUniqueIdentifier:](self, "_accountWithUniqueIdentifier:", v6));
    if (v7)
    {
      uint64_t v8 = v7;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 popBiometricToken]);
      -[PurchaseOperation lock](self, "lock");
      self->_BOOL didAuthenticate = 1;
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
      mToken = self->_mToken;
      self->_mToken = v10;

      -[PurchaseResponseInfo setDidPasswordAuthenticate:]( self->_responseInfo,  "setDidPasswordAuthenticate:",  -[SSBiometricAuthenticationContext didFallbackToPassword]( self->_biometricAuthenticationContext,  "didFallbackToPassword"));
      -[PurchaseOperation unlock](self, "unlock");
    }
  }

  -[PurchaseResponseInfo setChangedBuyParameters:](self->_responseInfo, "setChangedBuyParameters:", v12);
}

- (BOOL)_shouldDisableReversePush
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSURLBagContext contextWithBagType:]( &OBJC_CLASS___SSURLBagContext,  "contextWithBagType:",  -[PurchaseOperation bagType](self, "bagType")));
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLBagForContext:v3]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _buyParamProductType](self, "_buyParamProductType"));
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"aps-allowed-product-type"]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      uint64_t v31 = v7;
      __int16 v32 = &off_10036E448;
      unsigned int v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    }

    else
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
      {
        id v25 = v5;
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v13 = v7;
        id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v27;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i),  &off_10036E448);
            }

            id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }

          while (v15);
        }

        float v5 = v25;
LABEL_18:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v6));
        if ((objc_opt_respondsToSelector(v19, "doubleValue") & 1) != 0)
        {
          id v20 = +[AMSDefaults reversePushEnabled](&OBJC_CLASS___AMSDefaults, "reversePushEnabled");
          if (v20 != (id)2)
          {
            if (v20 == (id)1)
            {
              BOOL v11 = 0;
LABEL_25:

              goto LABEL_26;
            }

            [(id)objc_opt_class(self) _randomDouble];
            if (v21 > 0.0)
            {
              double v22 = v21;
              [v19 doubleValue];
              BOOL v11 = v22 > v23;
              goto LABEL_25;
            }
          }
        }

        BOOL v11 = 1;
        goto LABEL_25;
      }

      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v18) & 1) == 0)
      {
        id v10 = 0LL;
        goto LABEL_18;
      }

      unsigned int v9 = v7;
    }

    id v10 = v9;
    goto LABEL_18;
  }

  BOOL v11 = 1;
LABEL_26:

  return v11;
}

+ (double)_randomDouble
{
  if (qword_1003A31C8 != -1) {
    dispatch_once(&qword_1003A31C8, &stru_10034B2B0);
  }
  return drand48();
}

- (void)_setMoveToiOS
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLRequestProperties HTTPHeaders](self->_requestProperties, "HTTPHeaders"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:SSHTTPHeaderUserAgent]);

  BOOL v6 = 0;
  if (v7)
  {
    float v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/",  ISClientIdentifierMoveToiOS));
    unsigned __int8 v5 = [v7 hasPrefix:v4];

    if ((v5 & 1) != 0) {
      BOOL v6 = 1;
    }
  }

  self->_BOOL moveToiOS = v6;
  -[PurchaseOperation unlock](self, "unlock");
}

- (BOOL)_shouldSendKeyBagSyncData
{
  if (!-[PurchaseOperation shouldSendKeyBagSyncData](self, "shouldSendKeyBagSyncData")) {
    return 0;
  }
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation urlBagKey](self, "urlBagKey"));
  float v4 = v3;
  if (v3
    && ([v3 isEqualToString:@"buyProduct"] & 1) == 0
    && ([v4 isEqualToString:@"backgroundUpdateProduct"] & 1) == 0
    && ([v4 isEqualToString:@"updateProduct"] & 1) == 0
    && ([v4 isEqualToString:@"redownloadProduct"] & 1) == 0
    && ([v4 isEqualToString:@"redownloadAllTones"] & 1) == 0
    && ![v4 isEqualToString:@"paidRedownloadProduct"])
  {
    unsigned int v11 = [v4 isEqualToString:@"p2-in-app-buy"];

    if (v11) {
      goto LABEL_10;
    }
    return 0;
  }

LABEL_10:
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _URLBagContext](self, "_URLBagContext"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLBagForContext:v5]);

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 valueForKey:kISURLBagAuthCanPostKey]);
  unsigned int v9 = (void *)v8;
  if (v8)
  {
    if ((objc_opt_respondsToSelector(v8, "BOOLValue") & 1) != 0) {
      unsigned __int8 v10 = [v9 BOOLValue];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldSendSBSyncData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation urlBagKey](self, "urlBagKey"));
  if (([v2 isEqualToString:@"buyProduct"] & 1) != 0
    || ([v2 isEqualToString:@"backgroundUpdateProduct"] & 1) != 0
    || ([v2 isEqualToString:@"updateProduct"] & 1) != 0
    || ([v2 isEqualToString:@"subDownload"] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    unsigned __int8 v3 = [v2 isEqualToString:@"sbDownload"];
  }

  return v3;
}

- (BOOL)_shouldUseClientAuthentication
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation urlBagKey](self, "urlBagKey"));
  if (!v3) {
    goto LABEL_20;
  }
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseOperation _URLBagContext](v2, "_URLBagContext"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[ISURLBag valueForKey:inBagContext:]( &OBJC_CLASS___ISURLBag,  "valueForKey:inBagContext:",  @"p2-client-authentication",  v4));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBag urlForKey:inBagContext:](&OBJC_CLASS___ISURLBag, "urlForKey:inBagContext:", v3, v4));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 path]);
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      char v10 = SSVURLPathMatchesActionDictionary(v8, v5);

      if ((v10 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_8:
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v13) {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v14 = [v13 shouldLog];
      else {
        LODWORD(v15) = v14;
      }
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        uint64_t v15 = v15;
      }
      else {
        v15 &= 2u;
      }
      if ((_DWORD)v15)
      {
        int v25 = 138412546;
        id v26 = (id)objc_opt_class(v2);
        __int16 v27 = 2112;
        __int128 v28 = v3;
        id v17 = v26;
        LOBYTE(v2) = 1;
        uint64_t v18 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Using client auth for purchase bag key: %@",  &v25,  22);

        if (!v18) {
          goto LABEL_32;
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
        free(v18);
        SSFileLog(v13, @"%@");
      }

      else
      {
      }

      LOBYTE(v2) = 1;
      goto LABEL_32;
    }

    goto LABEL_19;
  }

  id v7 = (void *)CFPreferencesCopyAppValue(@"p2-client-authentication", kSSUserDefaultsIdentifier);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0)
  {
LABEL_19:

    goto LABEL_20;
  }

  unsigned int v12 = [v7 containsObject:v3];

  if (v12) {
    goto LABEL_8;
  }
LABEL_20:
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v20 = [v13 shouldLog];
  else {
    LODWORD(v21) = v20;
  }
  double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    uint64_t v21 = v21;
  }
  else {
    v21 &= 2u;
  }
  if (!(_DWORD)v21) {
    goto LABEL_31;
  }
  int v25 = 138412546;
  id v26 = (id)objc_opt_class(v2);
  __int16 v27 = 2112;
  __int128 v28 = v3;
  id v23 = v26;
  v2 = (PurchaseOperation *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  2LL,  "%@: Using server auth for purchase bag key: %@",  &v25,  22);

  if (v2)
  {
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v2,  4LL));
    free(v2);
    SSFileLog(v13, @"%@");
LABEL_31:

    LOBYTE(v2) = 0;
  }

- (id)_URLBagContext
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSURLBagContext contextWithBagType:]( &OBJC_CLASS___SSURLBagContext,  "contextWithBagType:",  -[PurchaseOperation bagType](self, "bagType")));
  objc_msgSend( v3,  "setAllowsBootstrapCellularData:",  -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLRequestProperties HTTPHeaders](self->_requestProperties, "HTTPHeaders"));
  uint64_t v5 = SSHTTPHeaderUserAgent;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SSHTTPHeaderUserAgent]);
  [v3 setValue:v6 forHTTPHeaderField:v5];

  return v3;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (int64_t)bagType
{
  return self->_bagType;
}

- (void)setBagType:(int64_t)a3
{
  self->_bagType = a3;
}

- (NSString)buyParameters
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setBuyParameters:(id)a3
{
}

- (NSData)clientAuditTokenData
{
  return (NSData *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (BOOL)displayedErrorDialog
{
  return self->_displayedErrorDialog;
}

- (void)setDisplayedErrorDialog:(BOOL)a3
{
  self->_displayedErrorDialog = a3;
}

- (NSString)originatingStorefront
{
  return (NSString *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setOriginatingStorefront:(id)a3
{
}

- (BOOL)isPreauthenticated
{
  return self->_preauthenticated;
}

- (void)setPreauthenticated:(BOOL)a3
{
  self->_preauthenticated = a3;
}

- (NSDictionary)rawOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setRawOutput:(id)a3
{
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (BOOL)requiresSerialNumber
{
  return self->_requiresSerialNumber;
}

- (void)setRequiresSerialNumber:(BOOL)a3
{
  self->_requiresSerialNumber = a3;
}

- (BOOL)shouldSendKeyBagSyncData
{
  return self->_shouldSendKeyBagSyncData;
}

- (void)setShouldSendKeyBagSyncData:(BOOL)a3
{
  self->_shouldSendKeyBagSyncData = a3;
}

- (BOOL)skipsConfirmationDialogs
{
  return self->_skipsConfirmationDialogs;
}

- (void)setSkipsConfirmationDialogs:(BOOL)a3
{
  self->_skipsConfirmationDialogs = a3;
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
}

- (void)setLogKey:(id)a3
{
}

- (id)remoteAuthenticationHandler
{
  return objc_getProperty(self, a2, 360LL, 1);
}

- (void)setRemoteAuthenticationHandler:(id)a3
{
}

- (AMSPurchaseShim)shim
{
  return (AMSPurchaseShim *)objc_getProperty(self, a2, 368LL, 1);
}

- (BOOL)microPayment
{
  return self->_microPayment;
}

- (void)setMicroPayment:(BOOL)a3
{
  self->_microPayment = a3;
}

- (BOOL)didConsumeScore
{
  return self->_didConsumeScore;
}

- (void)setDidConsumeScore:(BOOL)a3
{
  self->_didConsumeScore = a3;
}

- (void).cxx_destruct
{
}

@end