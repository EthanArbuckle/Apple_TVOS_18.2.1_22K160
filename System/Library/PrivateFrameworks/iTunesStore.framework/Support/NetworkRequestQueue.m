@interface NetworkRequestQueue
+ (id)sharedNetworkRequestQueue;
+ (void)_addSubscriptionOperationWithType:(int64_t)a3 message:(id)a4 connection:(id)a5;
+ (void)authenticationRequestWithMessage:(id)a3 connection:(id)a4;
+ (void)claimAppsWithMessage:(id)a3 connection:(id)a4;
+ (void)disableAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)disableSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)enableSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)getDownloadQueueWithMessage:(id)a3 connection:(id)a4;
+ (void)getMatchStatusWithMessage:(id)a3 connection:(id)a4;
+ (void)getSubscriptionEntitlements:(id)a3 connection:(id)a4;
+ (void)getSubscriptionStatusWithMessage:(id)a3 connection:(id)a4;
+ (void)importDownloadToIPodLibraryWithMessage:(id)a3 connection:(id)a4;
+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4;
+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4 provideDetailedResponse:(BOOL)a5;
+ (void)installManagedAppWithMessageAndDetailedResponse:(id)a3 connection:(id)a4;
+ (void)keybagSyncWithMessage:(id)a3 connection:(id)a4;
+ (void)loadURLBagWithMessage:(id)a3 connection:(id)a4;
+ (void)lookupItemsWithMessage:(id)a3 connection:(id)a4;
+ (void)lookupWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)performMigrationWithMessage:(id)a3 connection:(id)a4;
+ (void)presentRemoteWebViewWithMessage:(id)a3 connection:(id)a4;
+ (void)refreshSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)rentalInformationRequestWithMessage:(id)a3 connection:(id)a4;
+ (void)repairAppWithMessage:(id)a3 connection:(id)a4;
+ (void)requestURLWithMessage:(id)a3 connection:(id)a4;
+ (void)restoreDemotedApplicationsWithMessage:(id)a3 connection:(id)a4;
+ (void)sdk_getCloudServiceCapabilities:(id)a3 connection:(id)a4;
+ (void)sdk_loadStoreFrontIdentifierWithMessage:(id)a3 connection:(id)a4;
+ (void)sdk_requestAPITokenWithMessage:(id)a3 connection:(id)a4;
+ (void)serverAuthenticateWithMessage:(id)a3 connection:(id)a4;
+ (void)silentEnrollmentVerificationWithMessage:(id)a3 connection:(id)a4;
+ (void)silentEnrollmentWithMessage:(id)a3 connection:(id)a4;
+ (void)updateMediaContentTasteWithMessage:(id)a3 connection:(id)a4;
+ (void)wishlistAddItemsWithMessage:(id)a3 connection:(id)a4;
- (NetworkRequestQueue)init;
- (id)_copyAuthenticationContextWithContext:(id)a3 client:(id)a4;
- (id)_managedQueue;
- (id)_newClientWithMessage:(id)a3 connection:(id)a4;
- (void)_dequeueSubscriptionStatusOperation:(id)a3;
- (void)_enqueueOperationsForStoreServicesURL:(id)a3;
- (void)_enqueueSubscriptionStatusOperation:(id)a3 forClient:(id)a4;
- (void)_sendMessageWithError:(id)a3 toClient:(id)a4;
- (void)_sendNotSupportedMessageToClient:(id)a3;
- (void)_sendUnentitledMessageToClient:(id)a3;
- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4;
@end

@implementation NetworkRequestQueue

- (NetworkRequestQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NetworkRequestQueue;
  v2 = -[RequestQueue init](&v7, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("NetworkRequestQueueSubscriptionStatusAccessQueue", 0LL);
    subscriptionStatusOperationAccessQueue = v2->_subscriptionStatusOperationAccessQueue;
    v2->_subscriptionStatusOperationAccessQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:](v5, "setAdjustsMaxConcurrentOperationCount:", 0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](v5, "setMaxConcurrentOperationCount:", 24LL);
    -[RequestQueue setOperationQueue:](v2, "setOperationQueue:", v5);
  }

  return v2;
}

+ (id)sharedNetworkRequestQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4230;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3338 != -1) {
    dispatch_once(&qword_1003A3338, block);
  }
  return (id)qword_1003A3330;
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"claimAppsWithMessage:connection:" forMessage:138];
  [v4 addObserver:a1 selector:"getMatchStatusWithMessage:connection:" forMessage:130];
  [v4 addObserver:a1 selector:"disableAutomaticDownloadKindsWithMessage:connection:" forMessage:194];
  [v4 addObserver:a1 selector:"keybagSyncWithMessage:connection:" forMessage:144];
  [v4 addObserver:a1 selector:"installManagedAppWithMessage:connection:" forMessage:112];
  [v4 addObserver:a1 selector:"installManagedAppWithMessageAndDetailedResponse:connection:" forMessage:113];
  [v4 addObserver:a1 selector:"getDownloadQueueWithMessage:connection:" forMessage:65];
  [v4 addObserver:a1 selector:"importDownloadToIPodLibraryWithMessage:connection:" forMessage:66];
  [v4 addObserver:a1 selector:"loadURLBagWithMessage:connection:" forMessage:25];
  [v4 addObserver:a1 selector:"lookupItemsWithMessage:connection:" forMessage:54];
  [v4 addObserver:a1 selector:"lookupWithMessage:connection:" forMessage:85];
  [v4 addObserver:a1 selector:"sdk_loadStoreFrontIdentifierWithMessage:connection:" forMessage:174];
  [v4 addObserver:a1 selector:"sdk_getCloudServiceCapabilities:connection:" forMessage:175];
  [v4 addObserver:a1 selector:"performMigrationWithMessage:connection:" forMessage:116];
  [v4 addObserver:a1 selector:"repairAppWithMessage:connection:" forMessage:148];
  [v4 addObserver:a1 selector:"requestURLWithMessage:connection:" forMessage:62];
  [v4 addObserver:a1 selector:"restoreDemotedApplicationsWithMessage:connection:" forMessage:162];
  [v4 addObserver:a1 selector:"serverAuthenticateWithMessage:connection:" forMessage:132];
  [v4 addObserver:a1 selector:"authenticationRequestWithMessage:connection:" forMessage:133];
  [v4 addObserver:a1 selector:"updateMediaContentTasteWithMessage:connection:" forMessage:163];
  [v4 addObserver:a1 selector:"wishlistAddItemsWithMessage:connection:" forMessage:166];
  [v4 addObserver:a1 selector:"presentRemoteWebViewWithMessage:connection:" forMessage:209];
  [v4 addObserver:a1 selector:"disableSubscriptionWithMessage:connection:" forMessage:145];
  [v4 addObserver:a1 selector:"enableSubscriptionWithMessage:connection:" forMessage:146];
  [v4 addObserver:a1 selector:"getSubscriptionStatusWithMessage:connection:" forMessage:149];
  [v4 addObserver:a1 selector:"getSubscriptionEntitlements:connection:" forMessage:150];
  [v4 addObserver:a1 selector:"refreshSubscriptionWithMessage:connection:" forMessage:147];
  [v4 addObserver:a1 selector:"rentalInformationRequestWithMessage:connection:" forMessage:170];
  [v4 addObserver:a1 selector:"sdk_requestAPITokenWithMessage:connection:" forMessage:191];
  [v4 addObserver:a1 selector:"silentEnrollmentWithMessage:connection:" forMessage:211];
  [v4 addObserver:a1 selector:"silentEnrollmentVerificationWithMessage:connection:" forMessage:212];
}

+ (void)claimAppsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) == 0
    && (SSXPCConnectionHasEntitlement(v7, kSSITunesStoreEntitlementClaimApps) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v15 shouldLog];
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
      int v25 = 138412546;
      id v26 = (id)objc_opt_class(v8);
      __int16 v27 = 2112;
      id v28 = v9;
      id v19 = v26;
      v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Cannot get match status for unentitled client: %@",  &v25,  22);

      if (!v20)
      {
LABEL_19:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_20;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v15, @"%@");
    }

    goto LABEL_19;
  }

  id v10 = objc_alloc(&OBJC_CLASS___SSVClaimApplicationsRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  if ([v13 claimStyle])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000A4928;
    v21[3] = &unk_10034D4A0;
    v14 = &v22;
    id v22 = v9;
    +[AppStoreUtility checkClaimsEstablishingActiveAccounts:ignoringPreviousClaimAttempts:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "checkClaimsEstablishingActiveAccounts:ignoringPreviousClaimAttempts:completionBlock:",  1LL,  1LL,  v21);
  }

  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000A4870;
    v23[3] = &unk_10034D4A0;
    v14 = &v24;
    id v24 = v9;
    +[AppStoreUtility checkFirstPartyClaimsWithCompletionBlock:]( &OBJC_CLASS___AppStoreUtility,  "checkFirstPartyClaimsWithCompletionBlock:",  v23);
  }

LABEL_20:
}

+ (void)disableAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v15 shouldLog];
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
      int v23 = 138543618;
      id v24 = (id)objc_opt_class(v8);
      __int16 v25 = 2114;
      id v26 = v9;
      id v19 = v24;
      v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%{public}@: Cannot disable automatic download kinds for unentitled client. client = %{public}@",  &v23,  22);

      if (!v20)
      {
LABEL_15:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_16;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v15, @"%@");
    }

    goto LABEL_15;
  }

  id v10 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:]( objc_alloc(&OBJC_CLASS___SetAutomaticDownloadKindsOperation),  "initWithDownloadKinds:",  0LL);
  -[SetAutomaticDownloadKindsOperation setShouldSuppressServerDialogs:](v10, "setShouldSuppressServerDialogs:", 1LL);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SSAuthenticationContext);
  v12 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "1", v11);
  id v13 = [v8 _copyAuthenticationContextWithContext:v12 client:v9];

  -[SetAutomaticDownloadKindsOperation setAuthenticationContext:](v10, "setAuthenticationContext:", v13);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000A4CA4;
  v21[3] = &unk_10034D4C8;
  id v22 = v10;
  v14 = v10;
  [v8 addOperation:v14 forMessage:v6 connection:v7 replyBlock:v21];

LABEL_16:
}

+ (void)disableSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)enableSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)getMatchStatusWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) == 0
    && (SSXPCConnectionHasEntitlement(v7, kSSITunesStoreEntitlementAccounts) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v15 shouldLog];
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
      int v23 = 138412546;
      id v24 = (id)objc_opt_class(v8);
      __int16 v25 = 2112;
      id v26 = v9;
      id v19 = v24;
      v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Cannot get match status for unentitled client: %@",  &v23,  22);

      if (!v20)
      {
LABEL_16:

        [v8 _sendUnentitledReplyForMessage:v6 connection:v7];
        goto LABEL_17;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v15, @"%@");
    }

    goto LABEL_16;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v11 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "1", v10);
  v12 = -[LoadMatchStatusOperation initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___LoadMatchStatusOperation),  "initWithAccountIdentifier:",  v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userAgent]);
  -[LoadMatchStatusOperation setUserAgent:](v12, "setUserAgent:", v13);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000A4FF0;
  v21[3] = &unk_10034D4C8;
  id v22 = v12;
  v14 = v12;
  [v8 addOperation:v14 forMessage:v6 connection:v7 replyBlock:v21];

LABEL_17:
}

+ (void)getSubscriptionStatusWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0 || (SSIsDaemon() & 1) != 0)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___SubscriptionStatusOperation);
    id v11 = objc_alloc(&OBJC_CLASS___SSVSubscriptionStatusRequest);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v14 = [v11 initWithXPCEncoding:v13];

    -[SubscriptionStatusOperation setAuthenticatesIfNecessary:]( v10,  "setAuthenticatesIfNecessary:",  [v14 authenticatesIfNecessary]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 authenticationContext]);
    -[SubscriptionStatusOperation setAuthenticationContext:](v10, "setAuthenticationContext:", v15);

    -[SubscriptionStatusOperation setCarrierBundleProvisioningStyle:]( v10,  "setCarrierBundleProvisioningStyle:",  [v14 carrierBundleProvisioningStyle]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedAuthenticationReason]);
    -[SubscriptionStatusOperation setLocalizedAuthenticationReason:](v10, "setLocalizedAuthenticationReason:", v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 reason]);
    -[SubscriptionStatusOperation setReason:](v10, "setReason:", v17);

    objc_initWeak((id *)location, v10);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000A5428;
    v27[3] = &unk_10034D4F0;
    id v18 = v9;
    id v28 = v18;
    objc_copyWeak(&v30, (id *)location);
    id v19 = v8;
    id v29 = v19;
    -[SubscriptionStatusOperation setStatusBlock:](v10, "setStatusBlock:", v27);
    [v19 _enqueueSubscriptionStatusOperation:v10 forClient:v18];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v32 = 2112;
      id v33 = v9;
      id v24 = *(id *)&location[4];
      __int16 v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: Deny unentitled client: %@",  location,  22);

      if (v25)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
        free(v25);
        SSFileLog(v20, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)getDownloadQueueWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc(&OBJC_CLASS___SSVDownloadQueueRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  id v14 = [v13 queueType];
  if ([v9 hasEntitlements])
  {
    v15 = @"pendingApps";
    if (v14 == (id)1) {
      v15 = @"pendingRentals";
    }
    if (v14) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = @"pendingSongs";
    }
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 auditTokenData]);
    -[SSMutableURLRequestProperties setClientAuditTokenData:](v17, "setClientAuditTokenData:", v18);

    -[SSMutableURLRequestProperties setURLBagKey:](v17, "setURLBagKey:", v16);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 userAgent]);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v17,  "setValue:forHTTPHeaderField:",  v19,  SSHTTPHeaderUserAgent);

    v20 = -[LoadDownloadQueueOperation initWithRequestProperties:]( objc_alloc(&OBJC_CLASS___LoadDownloadQueueOperation),  "initWithRequestProperties:",  v17);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);

    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
    -[LoadDownloadQueueOperation setAccountIdentifier:](v20, "setAccountIdentifier:", v23);

    -[LoadDownloadQueueOperation setNeedsAuthentication:](v20, "setNeedsAuthentication:", 0LL);
    objc_initWeak((id *)location, v20);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000A5910;
    v32[3] = &unk_10034C8F8;
    objc_copyWeak(&v34, (id *)location);
    id v33 = v9;
    -[LoadDownloadQueueOperation setCompletionBlock:](v20, "setCompletionBlock:", v32);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 operationQueue]);
    [v24 addOperation:v20];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)location);
  }

  else
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v25) {
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v26 = [v25 shouldLog];
    else {
      LODWORD(v27) = v26;
    }
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v36 = 2112;
      id v37 = v9;
      id v29 = *(id *)&location[4];
      id v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: Cannot install items for unentitled client: %@",  location,  22);

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
        free(v30);
        SSFileLog(v25, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)importDownloadToIPodLibraryWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc(&OBJC_CLASS___SSImportDownloadToIPodLibraryRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v37 = [v10 initWithXPCEncoding:v12];

  if ([v9 hasEntitlements])
  {
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v37 downloadMetadata]);
    if (v13
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue([v37 purchaseResponse]),
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 purchase]),
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]),
          v15,
          id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "downloadMetadataForItemIdentifier:",  objc_msgSend(v16, "unsignedLongLongValue"))),  v16,  v14,  v13))
    {
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___IPodLibraryItem);
      id v18 = objc_alloc(&OBJC_CLASS___StoreDownload);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
      v20 = -[StoreDownload initWithDictionary:](v18, "initWithDictionary:", v19);

      -[IPodLibraryItem setItemMetadata:](v17, "setItemMetadata:", v20);
      if (-[StoreDownload isRental](v20, "isRental"))
      {
        -[IPodLibraryItem setUpdateType:](v17, "setUpdateType:", 2LL);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload fullSizeImageURL](v20, "fullSizeImageURL"));

        if (v21)
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload fullSizeImageURL](v20, "fullSizeImageURL"));
          int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v22));

          -[IPodLibraryItem setItemArtworkData:](v17, "setItemArtworkData:", v23);
        }
      }

      id v24 = -[AddItemToIPodLibraryOperation initWithIPodLibraryItem:]( objc_alloc(&OBJC_CLASS___AddItemToIPodLibraryOperation),  "initWithIPodLibraryItem:",  v17);
      objc_initWeak((id *)location, v24);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_1000A60A0;
      v38[3] = &unk_10034D518;
      objc_copyWeak(&v42, (id *)location);
      id v39 = v6;
      id v40 = v7;
      id v25 = v36;
      id v41 = v25;
      -[AddItemToIPodLibraryOperation setCompletionBlock:](v24, "setCompletionBlock:", v38);
      [v25 setClient:v9 forOperation:v24];
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 operationQueue]);
      [v26 addOperation:v24];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)location);
    }

    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      v35 = reply;
      if (reply)
      {
        xpc_dictionary_set_int64(reply, "0", 1011LL);
        xpc_dictionary_set_BOOL(v35, "1", 0);
        xpc_connection_send_message((xpc_connection_t)v7, v35);
      }
    }
  }

  else
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = v28 & 2;
    }
    if ((_DWORD)v30)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v44 = 2112;
      id v45 = v9;
      id v31 = *(id *)&location[4];
      __int16 v32 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%@: Cannot import item for unentitled client: %@",  location,  22);

      if (v32)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
        free(v32);
        SSFileLog(v27, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)sdk_getCloudServiceCapabilities:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  xpc_connection_get_audit_token(v7, v28);
  if ((SSXPCConnectionHasEntitlement(v7, kSSStoreKitEntitlementCloudServiceExemptedFromTCCAccess) & 1) != 0
    || (*(_OWORD *)location = v28[0],
        __int128 v30 = v28[1],
        TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, location, 0LL)))
  {
    id v10 = objc_alloc(&OBJC_CLASS___SSVCloudServiceCapabilitiesRequest);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    v12 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v13 = [v10 initWithXPCEncoding:v12];

    id v14 = objc_alloc_init(&OBJC_CLASS___CloudServiceCapabilitiesOperation);
    -[CloudServiceCapabilitiesOperation setAllowsPromptingForPrivacyAcknowledgement:]( v14,  "setAllowsPromptingForPrivacyAcknowledgement:",  [v13 allowsPromptingForPrivacyAcknowledgement]);
    v15 = (void *)SSXPCConnectionCopyValueForEntitlement(v7, @"com.apple.itunesstored.privacy-acknowledged");
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0 || (objc_opt_respondsToSelector(v15, "BOOLValue") & 1) != 0) {
      -[CloudServiceCapabilitiesOperation setAllowsBypassOfPrivacyAcknowledgement:]( v14,  "setAllowsBypassOfPrivacyAcknowledgement:",  1LL);
    }
    objc_initWeak(location, v14);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000A650C;
    v24[3] = &unk_10034D540;
    objc_copyWeak(&v27, location);
    id v17 = v9;
    id v25 = v17;
    id v18 = v8;
    id v26 = v18;
    -[CloudServiceCapabilitiesOperation setResponseBlock:](v14, "setResponseBlock:", v24);
    [v18 setClient:v17 forOperation:v14];
    [v18 addOperation:v14];

    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v13 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    id v14 = (CloudServiceCapabilitiesOperation *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      unsigned int v21 = (void *)objc_opt_class(v8);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v21;
      id v22 = v21;
      int v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Cannot load cloud service capabilities for unauthorized client",  location,  12);

      if (!v23) {
        goto LABEL_8;
      }
      id v14 = (CloudServiceCapabilitiesOperation *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v13, @"%@");
    }
  }

LABEL_8:
}

+ (void)getSubscriptionEntitlements:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0 || (SSIsDaemon() & 1) != 0)
  {
    BOOL v10 = xpc_dictionary_get_BOOL(v6, "1");
    id v11 = objc_alloc_init(&OBJC_CLASS___SubscriptionEntitlementsOperation);
    -[SubscriptionEntitlementsOperation setIgnoreCaches:](v11, "setIgnoreCaches:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifier]);
    -[SubscriptionEntitlementsOperation setClientIdentifier:](v11, "setClientIdentifier:", v12);

    objc_initWeak((id *)location, v11);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000A6914;
    v21[3] = &unk_10034D568;
    objc_copyWeak(&v25, (id *)location);
    id v22 = v6;
    id v23 = v7;
    id v13 = v8;
    id v24 = v13;
    -[SubscriptionEntitlementsOperation setSubscriptionEntitlementsBlock:]( v11,  "setSubscriptionEntitlementsBlock:",  v21);
    [v13 setClient:v9 forOperation:v11];
    [v13 addOperation:v11];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v27 = 2112;
      id v28 = v9;
      id v18 = *(id *)&location[4];
      unsigned int v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Deny unentitled client: %@",  location,  22);

      if (v19)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
        free(v19);
        SSFileLog(v14, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)installManagedAppWithMessageAndDetailedResponse:(id)a3 connection:(id)a4
{
}

+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4 provideDetailedResponse:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v11 = [v10 _newClientWithMessage:v9 connection:v8];

  id v12 = objc_alloc(&OBJC_CLASS___SSVInstallManagedApplicationRequest);
  xpc_object_t value = xpc_dictionary_get_value(v9, "1");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(value);

  id v15 = [v12 initWithXPCEncoding:v14];
  if (([v11 hasEntitlements] & 1) == 0)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v26) {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v27 = [v26 shouldLog];
    else {
      LODWORD(v28) = v27;
    }
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v28 = v28;
    }
    else {
      v28 &= 2u;
    }
    if ((_DWORD)v28)
    {
      int v44 = 138412546;
      id v45 = (id)objc_opt_class(v10);
      __int16 v46 = 2112;
      id v47 = v11;
      id v30 = v45;
      id v31 = (void *)_os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%@: Cannot install items for unentitled client: %@",  &v44,  22);

      if (!v31)
      {
LABEL_28:

        [v10 _sendUnentitledMessageToClient:v11];
        goto LABEL_42;
      }

      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      SSFileLog(v26, @"%@");
    }

    goto LABEL_28;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 itemIdentifier]);

  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v18 = (void *)v17;
  if (!v16)
  {
    if (!v17) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v32 = [v18 shouldLog];
    else {
      LODWORD(v33) = v32;
    }
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v33 = v33;
    }
    else {
      v33 &= 2u;
    }
    if ((_DWORD)v33)
    {
      int v44 = 138412290;
      id v45 = (id)objc_opt_class(a1);
      id v35 = v45;
      __int16 v36 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[%@] Managed application request requires an itemIdentifier",  &v44,  12);

      if (!v36)
      {
LABEL_41:

        uint64_t v37 = SSError(SSErrorDomain, 116LL, 0LL, 0LL);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        [v10 _sendMessageWithError:v38 toClient:v11];

        goto LABEL_42;
      }

      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
      free(v36);
      SSFileLog(v18, @"%@");
    }

    goto LABEL_41;
  }

  if (!v17) {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v19 = [v18 shouldLog];
  else {
    LODWORD(v20) = v19;
  }
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v20 = v20;
  }
  else {
    v20 &= 2u;
  }
  if (!(_DWORD)v20) {
    goto LABEL_14;
  }
  id v22 = (void *)objc_opt_class(v10);
  id v23 = v22;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 itemIdentifier]);
  int v44 = 138412802;
  id v45 = v22;
  __int16 v46 = 2112;
  id v47 = v11;
  __int16 v48 = 2112;
  v49 = v24;
  id v25 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Sending managed application request from client: %@ for itemID: %@",  &v44,  32);

  if (v25)
  {
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    SSFileLog(v18, @"%@");
LABEL_14:
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000A6F2C;
  v39[3] = &unk_10034D590;
  id v40 = v10;
  id v41 = v15;
  BOOL v43 = a5;
  id v42 = v11;
  +[AppStoreUtility installManagedAppWithRequest:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "installManagedAppWithRequest:completionBlock:",  v41,  v39);

LABEL_42:
}

+ (void)keybagSyncWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  char HasEntitlement = SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement);

  if ((HasEntitlement & 1) == 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v24 = 138412546;
      id v25 = (id)objc_opt_class(v8);
      __int16 v26 = 2112;
      id v27 = v9;
      id v20 = v25;
      unsigned int v21 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Cannot kbsync for unentitled client: %@",  &v24,  22);

      if (!v21)
      {
LABEL_15:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_16;
      }

      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_15;
  }

  id v11 = objc_alloc(&OBJC_CLASS___SSVKeybagSyncRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v14 = [v11 initWithXPCEncoding:v13];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000A74B0;
  v22[3] = &unk_10034D4C8;
  id v23 = -[KeybagSyncOperation initWithKeybagSyncRequest:]( objc_alloc(&OBJC_CLASS___KeybagSyncOperation),  "initWithKeybagSyncRequest:",  v14);
  id v15 = v23;
  [v8 addOperation:v15 forClient:v9 withMessageBlock:v22];

LABEL_16:
}

+ (void)loadURLBagWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(v7, kSSITunesStoreEntitlementLookup) & 1) != 0)
  {
    id v9 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v7);
    BOOL v10 = objc_alloc(&OBJC_CLASS___SSURLBagContext);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v13 = -[SSURLBagContext initWithXPCEncoding:](v10, "initWithXPCEncoding:", v12);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient auditTokenData](v9, "auditTokenData"));
    -[SSURLBagContext setClientAuditTokenData:](v13, "setClientAuditTokenData:", v14);

    uint64_t v15 = SSHTTPHeaderUserAgent;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLBagContext valueForHTTPHeaderField:](v13, "valueForHTTPHeaderField:", SSHTTPHeaderUserAgent));

    if (!v16)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient userAgent](v9, "userAgent"));
      -[SSURLBagContext setValue:forHTTPHeaderField:](v13, "setValue:forHTTPHeaderField:", v17, v15);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000A7848;
    v23[3] = &unk_10034D4C8;
    int v24 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v13);
    uint64_t v18 = v24;
    [v8 addOperation:v18 forMessage:v6 connection:v7 replyBlock:v23];
  }

  else
  {
    id v9 = (XPCClient *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (XPCClient *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = -[XPCClient shouldLog](v9, "shouldLog");
    else {
      LODWORD(v20) = v19;
    }
    id v13 = (SSURLBagContext *)objc_claimAutoreleasedReturnValue(-[XPCClient OSLogObject](v9, "OSLogObject"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      int v25 = 138412290;
      id v26 = (id)objc_opt_class(v8);
      id v21 = v26;
      id v22 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot load URL bag for unentitled client",  &v25,  12);

      if (!v22) {
        goto LABEL_7;
      }
      id v13 = (SSURLBagContext *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v9, @"%@");
    }
  }

LABEL_7:
}

+ (void)lookupItemsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ([v9 hasEntitlements])
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v10 setDataProvider:v11];

    id v12 = objc_alloc(&OBJC_CLASS___SSItemLookupRequest);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v15 = [v12 initWithXPCEncoding:v14];

    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifierHeader]);
    -[SSMutableURLRequestProperties setClientIdentifier:](v16, "setClientIdentifier:", v17);

    -[SSMutableURLRequestProperties setURLBagKey:](v16, "setURLBagKey:", @"adkit-product-url");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 userAgent]);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v16,  "setValue:forHTTPHeaderField:",  v18,  SSHTTPHeaderUserAgent);

    id v19 = [v15 copyQueryStringParameters];
    -[SSMutableURLRequestProperties setRequestParameters:](v16, "setRequestParameters:", v19);
    [v10 setRequestProperties:v16];
    objc_initWeak((id *)location, v10);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000A7CD4;
    v26[3] = &unk_10034C8F8;
    objc_copyWeak(&v28, (id *)location);
    id v27 = v9;
    [v10 setCompletionBlock:v26];
    [v8 addOperation:v10];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v10 shouldLog];
    else {
      LODWORD(v21) = v20;
    }
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if ((_DWORD)v21)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v30 = 2112;
      id v31 = v9;
      id v23 = *(id *)&location[4];
      int v24 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Cannot lookup items for unentitled client: %@",  location,  22);

      if (v24)
      {
        int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
        free(v24);
        SSFileLog(v10, @"%@");
      }
    }

    else
    {
    }
  }
}

+ (void)lookupWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) == 0
    && (SSXPCConnectionHasEntitlement(v7, kSSITunesStoreEntitlementLookup) & 1) == 0
    && (SSIsDaemon() & 1) == 0)
  {
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v24) {
      int v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v25 = [v24 shouldLog];
    else {
      LODWORD(v26) = v25;
    }
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = v26;
    }
    else {
      v26 &= 2u;
    }
    if ((_DWORD)v26)
    {
      int v32 = 138412546;
      id v33 = (id)objc_opt_class(v8);
      __int16 v34 = 2112;
      id v35 = v9;
      id v28 = v33;
      id v29 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%@: Cannot lookup for unentitled client: %@",  &v32,  22);

      if (!v29)
      {
LABEL_23:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_10;
      }

      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
      free(v29);
      SSFileLog(v24, @"%@");
    }

    goto LABEL_23;
  }

  id v10 = objc_alloc(&OBJC_CLASS___SSLookupRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _lookupProperties]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForRequestParameter:@"caller"]);
  if (!v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifier]);
    [v14 setValue:v16 forRequestParameter:@"caller"];
  }

  unsigned int v17 = -[LookupRequestOperation initWithLookupProperties:]( objc_alloc(&OBJC_CLASS___LookupRequestOperation),  "initWithLookupProperties:",  v14);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 authenticationContext]);
  -[LookupRequestOperation setAuthenticationContext:](v17, "setAuthenticationContext:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifierHeader]);
  -[LookupRequestOperation setClientIdentifierHeader:](v17, "setClientIdentifierHeader:", v19);

  -[LookupRequestOperation setPersonalizationStyle:]( v17,  "setPersonalizationStyle:",  [v13 personalizationStyle]);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v9 userAgent]);
  -[LookupRequestOperation setUserAgent:](v17, "setUserAgent:", v20);

  if ([v13 personalizationStyle] == (id)2)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifier]);
    unsigned int v22 = [v21 isEqualToString:@"com.apple.Health"];

    if (v22) {
      -[LookupRequestOperation setShouldSuppressCookies:](v17, "setShouldSuppressCookies:", 1LL);
    }
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000A8230;
  v30[3] = &unk_10034D4C8;
  id v31 = v17;
  id v23 = v17;
  [v8 addOperation:v23 forClient:v9 withMessageBlock:v30];

LABEL_10:
}

+ (void)performMigrationWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v33 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "1", v10);
    id v11 = [v33 integerValue];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      unsigned int v14 = v13;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v14 & 2;
    }
    if ((_DWORD)v16)
    {
      *(_DWORD *)v38 = 138412290;
      *(void *)&void v38[4] = objc_opt_class(a1);
      id v17 = *(id *)&v38[4];
      uint64_t v18 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "[%@]: Scheduling AppStore Migrator",  v38,  12);

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
        free(v18);
        SSFileLog(v12, @"%@");
      }
    }

    else
    {
    }

    id v27 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDMigrationRequestOptions", 29)),  "initWithMigrationType:",  v11);
    id v28 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDMigrationRequest", 29)),  "initWithOptions:",  v27);
    dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
    *(void *)v38 = 0LL;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x2020000000LL;
    char v39 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000A876C;
    v34[3] = &unk_10034D5B8;
    __int16 v36 = v38;
    id v37 = a1;
    __int16 v30 = v29;
    id v35 = v30;
    [v28 startWithCompletionBlock:v34];
    dispatch_time_t v31 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait(v30, v31);
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_int64(reply, "0", 1011LL);
    xpc_dictionary_set_BOOL(reply, "1", *(_BYTE *)(*(void *)&v38[8] + 24LL));
    xpc_connection_send_message(v7, reply);

    _Block_object_dispose(v38, 8);
  }

  else
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v20 shouldLog];
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
    if ((_DWORD)v22)
    {
      *(_DWORD *)v38 = 138412546;
      *(void *)&void v38[4] = objc_opt_class(v8);
      *(_WORD *)&v38[12] = 2112;
      *(void *)&v38[14] = v9;
      id v24 = *(id *)&v38[4];
      unsigned int v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: Cannot perform migration for unentitled client: %@",  v38,  22);

      if (v25)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
        free(v25);
        SSFileLog(v20, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)presentRemoteWebViewWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      int v24 = 138412546;
      id v25 = (id)objc_opt_class(v8);
      __int16 v26 = 2112;
      id v27 = v9;
      id v22 = v25;
      id v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Cannot show web view for unentitled client: %@",  &v24,  22);

      if (!v23)
      {
LABEL_15:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_16;
      }

      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v18, @"%@");
    }

    goto LABEL_15;
  }

  uint64_t v10 = objc_alloc(&OBJC_CLASS___SSRemoteWebViewRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  unsigned int v13 = -[SSRemoteWebViewRequest initWithXPCEncoding:](v10, "initWithXPCEncoding:", v12);

  unsigned int v14 = -[RemoteWebViewOperation initWithWebViewRequest:]( objc_alloc(&OBJC_CLASS___RemoteWebViewOperation),  "initWithWebViewRequest:",  v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 operationQueue]);
  [v15 addOperation:v14];

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v16, "0", 1011LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 outputConnection]);
  [v17 sendMessage:v16];

LABEL_16:
}

+ (void)refreshSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)rentalInformationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc(&OBJC_CLASS___SSRentalInformationRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  if ([v9 hasEntitlements])
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 rentalKeyIdentifier]);
    xpc_object_t v16 = -[LoadRentalInformationOperation initWithAccountIdentifier:rentalKeyIdentifier:]( objc_alloc(&OBJC_CLASS___LoadRentalInformationOperation),  "initWithAccountIdentifier:rentalKeyIdentifier:",  v14,  v15);
    objc_initWeak((id *)location, v16);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000A8F1C;
    v25[3] = &unk_10034C8F8;
    objc_copyWeak(&v27, (id *)location);
    id v26 = v9;
    -[LoadRentalInformationOperation setCompletionBlock:](v16, "setCompletionBlock:", v25);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 operationQueue]);
    [v17 addOperation:v16];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v8);
      __int16 v29 = 2112;
      id v30 = v9;
      id v22 = *(id *)&location[4];
      id v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Cannot read item for unentitled client: %@",  location,  22);

      if (v23)
      {
        int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
        free(v23);
        SSFileLog(v18, @"%@");
      }
    }

    else
    {
    }

    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)repairAppWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      unsigned int v29 = v28;
    }
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v31 = v29;
    }
    else {
      uint64_t v31 = v29 & 2;
    }
    if ((_DWORD)v31)
    {
      int v41 = 138412546;
      id v42 = (id)objc_opt_class(v8);
      __int16 v43 = 2112;
      id v44 = v9;
      id v32 = v42;
      id v33 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Cannot repair items for unentitled client: %@",  &v41,  22);

      if (!v33)
      {
LABEL_25:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_28;
      }

      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
      free(v33);
      SSFileLog(v27, @"%@");
    }

    goto LABEL_25;
  }

  id v10 = objc_alloc(&OBJC_CLASS___SSVRepairApplicationRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v15 = [v14 shouldLog];
  else {
    unsigned int v16 = v15;
  }
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 & 2;
  }
  if ((_DWORD)v18)
  {
    unsigned int v19 = (void *)objc_opt_class(a1);
    id v35 = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 accountDSID]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v13 bundleID]);
    id v36 = v13;
    id v22 = v8;
    id v23 = v6;
    int v24 = (void *)v21;
    int v41 = 138412802;
    id v42 = v19;
    __int16 v43 = 2112;
    id v44 = v20;
    __int16 v45 = 2112;
    uint64_t v46 = v21;
    id v25 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "[%@]: Repair request account DSID: %@ and bundleID %@",  &v41,  32);

    id v6 = v23;
    id v8 = v22;
    id v13 = v36;

    if (v25)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v14, @"%@");
    }
  }

  else
  {
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000A9440;
  v37[3] = &unk_10034D5E0;
  id v40 = a1;
  id v38 = v13;
  id v39 = v9;
  id v34 = v13;
  +[AppStoreUtility repairAppWithRequest:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "repairAppWithRequest:completionBlock:",  v34,  v37);

LABEL_28:
}

+ (void)requestURLWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      int v38 = 138412546;
      id v39 = (id)objc_opt_class(v8);
      __int16 v40 = 2112;
      id v41 = v9;
      id v31 = v39;
      id v32 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Cannot load URL for unentitled client: %@",  &v38,  22);

      if (!v32)
      {
LABEL_20:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_23;
      }

      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
      free(v32);
      SSFileLog(v27, @"%@");
    }

    goto LABEL_20;
  }

  id v10 = objc_alloc(&OBJC_CLASS___SSURLConnectionRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestProperties]);
  id v15 = [v14 mutableCopy];

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 auditTokenData]);
  [v15 setClientAuditTokenData:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 clientIdentifier]);
  if (!v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentifierHeader]);
    [v15 setClientIdentifier:v18];
  }

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v15 HTTPHeaders]);
  uint64_t v20 = SSHTTPHeaderUserAgent;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:SSHTTPHeaderUserAgent]);

  if (!v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 userAgent]);
    [v15 setValue:v22 forHTTPHeaderField:v20];
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 scheme]);
  unsigned int v25 = [v24 isEqualToString:SSActionURLScheme];

  if (v25)
  {
    id v26 = (URLConnectionRequestOperation *)objc_claimAutoreleasedReturnValue([v15 URL]);
    [v8 _enqueueOperationsForStoreServicesURL:v26];
  }

  else
  {
    id v33 = -[URLConnectionRequestOperation initWithRequestProperties:]( objc_alloc(&OBJC_CLASS___URLConnectionRequestOperation),  "initWithRequestProperties:",  v15);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v13 authenticationContext]);
    -[URLConnectionRequestOperation setAuthenticationContext:](v33, "setAuthenticationContext:", v34);

    id v35 = (void *)objc_claimAutoreleasedReturnValue([v13 destinationFileURL]);
    -[URLConnectionRequestOperation setDestinationFileURL:](v33, "setDestinationFileURL:", v35);

    -[URLConnectionRequestOperation setSendsResponseForHTTPFailures:]( v33,  "setSendsResponseForHTTPFailures:",  [v13 sendsResponseForHTTPFailures]);
    -[URLConnectionRequestOperation setShouldMescalSign:]( v33,  "setShouldMescalSign:",  [v13 shouldMescalSign]);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000A9B04;
    v36[3] = &unk_10034D4C8;
    id v37 = v33;
    id v26 = v33;
    [v8 addOperation:v26 forClient:v9 withMessageBlock:v36];
  }

LABEL_23:
}

+ (void)restoreDemotedApplicationsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if (([v9 hasEntitlements] & 1) == 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      int v29 = 138412546;
      id v30 = (id)objc_opt_class(v8);
      __int16 v31 = 2112;
      id v32 = v9;
      id v22 = v30;
      id v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Cannot demote unentitled client: %@",  &v29,  22);

      if (!v23)
      {
LABEL_18:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_25;
      }

      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v18, @"%@");
    }

    goto LABEL_18;
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v12 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "2", v11);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  xpc_type_t type = (xpc_type_t)objc_claimAutoreleasedReturnValue(value);
  xpc_type_t v16 = type;
  if (type)
  {
    xpc_type_t type = xpc_get_type(type);
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      id v17 = (const _xpc_type_s *)SSXPCCreateCFObjectFromXPCObject(v16);
      -[NSMutableArray addObject:](v10, "addObject:", v17);
      goto LABEL_20;
    }

    if (type == (xpc_type_t)&_xpc_type_array)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_1000A9F0C;
      applier[3] = &unk_10034BC18;
      id v27 = v16;
      unsigned int v28 = v10;
      xpc_array_apply(v27, applier);

      id v17 = v27;
LABEL_20:
    }
  }

  if (SSDebugShouldUseAppstored(type, v15))
  {
    +[AppStoreUtility restoreDemotedAppsWithBundleIDs:]( &OBJC_CLASS___AppStoreUtility,  "restoreDemotedAppsWithBundleIDs:",  v10);
  }

  else
  {
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[UpdateMigrator sharedInstance](&OBJC_CLASS___UpdateMigrator, "sharedInstance"));
    [v24 restoreDemotedBundleIdentifiers:v10 options:v12];
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_set_int64(reply, "0", 1011LL);
  xpc_dictionary_set_BOOL(reply, "1", 1);
  SSXPCDictionarySetObject(reply, "2", 0LL);
  xpc_connection_send_message(v7, reply);

LABEL_25:
}

+ (void)sdk_loadStoreFrontIdentifierWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  xpc_connection_get_audit_token(v7, v25);
  v26[0] = v25[0];
  v26[1] = v25[1];
  if (TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, v26, 0LL))
  {
    id v9 = objc_alloc(&OBJC_CLASS___SSURLBagContext);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v12 = -[SSURLBagContext initWithXPCEncoding:](v9, "initWithXPCEncoding:", v11);

    uint64_t v13 = SSHTTPHeaderUserAgent;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLBagContext valueForHTTPHeaderField:](v12, "valueForHTTPHeaderField:", SSHTTPHeaderUserAgent));

    if (!v14)
    {
      uint64_t v15 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v7);
      xpc_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient userAgent](v15, "userAgent"));
      -[SSURLBagContext setValue:forHTTPHeaderField:](v12, "setValue:forHTTPHeaderField:", v16, v13);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000AA254;
    v23[3] = &unk_10034D4C8;
    int v24 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v12);
    id v17 = v24;
    [v8 addOperation:v17 forMessage:v6 connection:v7 replyBlock:v23];
  }

  else
  {
    id v12 = (SSURLBagContext *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (SSURLBagContext *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = -[SSURLBagContext shouldLog](v12, "shouldLog");
    else {
      LODWORD(v19) = v18;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SSURLBagContext OSLogObject](v12, "OSLogObject"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      uint64_t v20 = (void *)objc_opt_class(v8);
      LODWORD(v26[0]) = 138412290;
      *(void *)((char *)v26 + 4) = v20;
      id v21 = v20;
      id v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Cannot load storefront identifier for unauthorized client",  v26,  12);

      if (!v22) {
        goto LABEL_6;
      }
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v12, @"%@");
    }
  }

LABEL_6:
}

+ (void)sdk_requestAPITokenWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v7 = [v27 _newClientWithMessage:xdict connection:v6];
  xpc_connection_get_audit_token(v6, v32);
  *(_OWORD *)location = v32[0];
  __int128 v34 = v32[1];
  if (TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, location, 0LL))
  {
    id v8 = objc_alloc(&OBJC_CLASS___SSVCloudServiceAPITokenRequest);
    xpc_object_t value = xpc_dictionary_get_value(xdict, "1");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v11 = [v8 initWithXPCEncoding:v10];

    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 clientIdentifier]);
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v7 clientVersion]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeAccount]);

    if (v14) {
      uint64_t v15 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v14);
    }
    else {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___SSMutableAuthenticationContext);
    }
    uint64_t v20 = v15;
    -[SSMutableAuthenticationContext setPromptStyle:](v15, "setPromptStyle:", 0LL);
    -[SSMutableAuthenticationContext setAllowsSilentAuthentication:](v20, "setAllowsSilentAuthentication:", 1LL);
    id v21 = objc_alloc_init(&OBJC_CLASS___CloudServiceAPITokenOperation);
    -[CloudServiceAPITokenOperation setAuthenticationContext:](v21, "setAuthenticationContext:", v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 clientToken]);
    -[CloudServiceAPITokenOperation setClientToken:](v21, "setClientToken:", v22);

    -[CloudServiceAPITokenOperation setRequestingBundleID:](v21, "setRequestingBundleID:", v12);
    -[CloudServiceAPITokenOperation setRequestingBundleVersion:](v21, "setRequestingBundleVersion:", v25);
    objc_initWeak(location, v21);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    _OWORD v28[2] = sub_1000AA6E0;
    v28[3] = &unk_10034D608;
    objc_copyWeak(&v31, location);
    id v23 = v7;
    id v29 = v23;
    id v24 = v27;
    id v30 = v24;
    -[CloudServiceAPITokenOperation setResponseBlock:](v21, "setResponseBlock:", v28);
    [v24 setClient:v23 forOperation:v21];
    [v24 addOperation:v21];

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);

    goto LABEL_14;
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  LODWORD(v16) = [v11 shouldLog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v16 = v16;
  }
  else {
    v16 &= 2u;
  }
  if (!(_DWORD)v16) {
    goto LABEL_14;
  }
  id v17 = (void *)objc_opt_class(v27);
  LODWORD(location[0]) = 138412290;
  *(id *)((char *)location + 4) = v17;
  id v18 = v17;
  uint64_t v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Cannot fetch api token for unauthorized client",  location,  12);

  if (v19)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v11, @"%@");
LABEL_14:
  }
}

+ (void)silentEnrollmentWithMessage:(id)a3 connection:(id)a4
{
  id v39 = a3;
  id v40 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v41 = [v6 _newClientWithMessage:v39 connection:v40];
  if ((SSXPCConnectionHasEntitlement(v40, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SSSilentEnrollment);
    xpc_object_t value = xpc_dictionary_get_value(v39, "1");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v10 = [v7 initWithXPCEncoding:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    int v38 = (void *)objc_claimAutoreleasedReturnValue([v11 accountIdentifier]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v12 headerADSID]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v13 headerGSToken]);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v14 headerGuid]);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v15 headerMMeClientInfo]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v16 headerMMeDeviceId]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLString]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));

    id v20 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v21 = objc_alloc_init(&OBJC_CLASS___ISJSONDataProvider);
    [v20 setDataProvider:v21];
    id v22 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  v38);
    [v20 setAuthenticationContext:v22];
    id v23 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v19);
    -[NSMutableURLRequest setHTTPMethod:](v23, "setHTTPMethod:", @"GET");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v23,  "setValue:forHTTPHeaderField:",  v37,  SSHTTPHeaderXAppleADSID);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v23,  "setValue:forHTTPHeaderField:",  v36,  SSHTTPHeaderXAppleGSToken);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v23, "setValue:forHTTPHeaderField:", v35, SSHTTPHeaderGUID);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v23,  "setValue:forHTTPHeaderField:",  v34,  SSHTTPHeaderXAppleMMeClientInfo);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v23,  "setValue:forHTTPHeaderField:",  v33,  SSHTTPHeaderXAppleMMeDeviceID);
    id v24 = -[SSMutableURLRequestProperties initWithURLRequest:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURLRequest:",  v23);
    [v20 setRequestProperties:v24];
    objc_initWeak((id *)location, v20);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000AACFC;
    v42[3] = &unk_10034C8F8;
    objc_copyWeak(&v44, (id *)location);
    id v25 = v41;
    id v43 = v25;
    [v20 setCompletionBlock:v42];
    [v6 setClient:v25 forOperation:v20];
    [v6 addOperation:v20];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v26) {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v27 = [v26 shouldLog];
    unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = v27;
    }
    else {
      uint64_t v29 = v27 & 2;
    }
    if ((_DWORD)v29)
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class(v6);
      __int16 v46 = 2114;
      id v47 = v41;
      id v30 = *(id *)&location[4];
      id v31 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%{public}@: Silent enrollment XPC failed for no entitlements: %{public}@",  location,  22);

      if (v31)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
        free(v31);
        SSFileLog(v26, @"%@");
      }
    }

    else
    {
    }

    [v6 _sendUnentitledMessageToClient:v41];
  }
}

+ (void)silentEnrollmentVerificationWithMessage:(id)a3 connection:(id)a4
{
  id v41 = a3;
  id v42 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v43 = [v6 _newClientWithMessage:v41 connection:v42];
  if ((SSXPCConnectionHasEntitlement(v42, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SSSilentEnrollment);
    xpc_object_t value = xpc_dictionary_get_value(v41, "1");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v10 = [v7 initWithXPCEncoding:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v11 accountIdentifier]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v12 headerADSID]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    int v38 = (void *)objc_claimAutoreleasedReturnValue([v13 headerGSToken]);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v14 headerGuid]);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v15 headerMMeClientInfo]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v16 headerMMeDeviceId]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v17 parameters]);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 URLString]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));

    id v21 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v22 = objc_alloc_init(&OBJC_CLASS___ISJSONDataProvider);
    [v21 setDataProvider:v22];
    id v23 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  v40);
    [v21 setAuthenticationContext:v23];
    id v24 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v20);
    -[NSMutableURLRequest setHTTPBody:](v24, "setHTTPBody:", v34);
    -[NSMutableURLRequest setHTTPMethod:](v24, "setHTTPMethod:", @"POST");
    -[NSMutableURLRequest setHTTPContentType:](v24, "setHTTPContentType:", @"application/json");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  v39,  SSHTTPHeaderXAppleADSID);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  v38,  SSHTTPHeaderXAppleGSToken);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v24, "setValue:forHTTPHeaderField:", v37, SSHTTPHeaderGUID);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  v36,  SSHTTPHeaderXAppleMMeClientInfo);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  v35,  SSHTTPHeaderXAppleMMeDeviceID);
    id v25 = -[SSMutableURLRequestProperties initWithURLRequest:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURLRequest:",  v24);
    [v21 setRequestProperties:v25];
    objc_initWeak((id *)location, v21);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000AB4E4;
    v44[3] = &unk_10034C8F8;
    objc_copyWeak(&v46, (id *)location);
    id v26 = v43;
    id v45 = v26;
    [v21 setCompletionBlock:v44];
    [v6 setClient:v26 forOperation:v21];
    [v6 addOperation:v21];

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)location);
  }

  else
  {
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = v28 & 2;
    }
    if ((_DWORD)v30)
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class(v6);
      __int16 v48 = 2114;
      id v49 = v43;
      id v31 = *(id *)&location[4];
      id v32 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%{public}@: Silent enrollment XPC failed for no entitlements: %{public}@",  location,  22);

      if (v32)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
        free(v32);
        SSFileLog(v27, @"%@");
      }
    }

    else
    {
    }

    [v6 _sendUnentitledMessageToClient:v43];
  }
}

+ (void)authenticationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
    if (!v14) {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class(v8);
      __int16 v24 = 2114;
      id v25 = v9;
      id v18 = v23;
      uint64_t v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "%{public}@: Cannot authenticate for unentitled client: %{public}@",  &v22,  22);

      if (!v19)
      {
LABEL_15:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_16;
      }

      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      SSFileLog(v14, @"%@");
    }

    goto LABEL_15;
  }

  +[SSVSubscriptionStatusCoordinator beginSuspendingSubscriptionStatusChangeNotifications]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "beginSuspendingSubscriptionStatusChangeNotifications");
  id v10 = objc_alloc(&OBJC_CLASS___SSAuthenticateRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000AB990;
  v20[3] = &unk_10034D630;
  id v21 = v9;
  [v13 startWithAuthenticateResponseBlock:v20];

LABEL_16:
}

+ (void)serverAuthenticateWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      int v31 = 138412546;
      id v32 = (id)objc_opt_class(v8);
      __int16 v33 = 2112;
      id v34 = v9;
      id v26 = v32;
      unsigned int v27 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Cannot authenticate for unentitled client: %@",  &v31,  22);

      if (!v27)
      {
LABEL_15:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_16;
      }

      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
      free(v27);
      SSFileLog(v22, @"%@");
    }

    goto LABEL_15;
  }

  id v10 = objc_alloc(&OBJC_CLASS___SSVServerAuthenticateRequest);
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v13 = [v10 initWithXPCEncoding:v12];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 authenticationContext]);
  id v15 = [v8 _copyAuthenticationContextWithContext:v14 client:v9];

  uint64_t v16 = objc_alloc(&OBJC_CLASS___ISDialog);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedDialog]);
  id v18 = -[ISDialog initWithXPCEncoding:](v16, "initWithXPCEncoding:", v17);

  uint64_t v19 = -[ServerAuthenticationOperation initWithDialog:]( objc_alloc(&OBJC_CLASS___ServerAuthenticationOperation),  "initWithDialog:",  v18);
  -[ServerAuthenticationOperation setAuthenticationContext:](v19, "setAuthenticationContext:", v15);
  -[ServerAuthenticationOperation setPerformsButtonAction:](v19, "setPerformsButtonAction:", 0LL);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  _OWORD v28[2] = sub_1000ABD7C;
  v28[3] = &unk_10034D658;
  uint64_t v29 = v19;
  uint64_t v30 = v18;
  id v20 = v18;
  id v21 = v19;
  [v8 addOperation:v21 forClient:v9 withMessageBlock:v28];

LABEL_16:
}

+ (void)updateMediaContentTasteWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v9 = [v8 _newClientWithMessage:v7 connection:v6];

  LOBYTE(v7) = SSXPCConnectionHasEntitlement(v6, kSSITunesStorePrivateEntitlement);
  if ((v7 & 1) == 0 && (SSIsDaemon() & 1) == 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v22 = 138412546;
      id v23 = (id)objc_opt_class(v8);
      __int16 v24 = 2112;
      id v25 = v9;
      id v20 = v23;
      id v21 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Deny unentitled client: %@",  &v22,  22);

      if (!v21)
      {
LABEL_28:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_29;
      }

      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_28;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_14;
  }
  int v22 = 138412546;
  id v23 = (id)objc_opt_class(v8);
  __int16 v24 = 2112;
  id v25 = v9;
  id v14 = v23;
  id v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  17LL,  "%@: Deny unsupported call to updateMediaContentTasteWithMessage:connection: from client: %@",  &v22,  22);

  if (v15)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v10, @"%@");
LABEL_14:
  }

  [v8 _sendNotSupportedMessageToClient:v9];
LABEL_29:
}

+ (void)wishlistAddItemsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v8 = [v7 _newClientWithMessage:v6 connection:v30];
  if ([v8 hasEntitlements])
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v9 setDataProvider:v10];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentifier]);
    uint64_t v14 = ISClientIdentifierForBundleIdentifier(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    id v16 = objc_alloc(&OBJC_CLASS___SSWishlistAddItemsRequest);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v19 = [v16 initWithXPCEncoding:v18];

    id v20 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentifier]);
    -[SSMutableURLRequestProperties setClientIdentifier:](v20, "setClientIdentifier:", v21);

    -[SSMutableURLRequestProperties setURLBagKey:](v20, "setURLBagKey:", @"addItemsToWishlistBaseUrl");
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v8 userAgent]);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v20,  "setValue:forHTTPHeaderField:",  v22,  SSHTTPHeaderUserAgent);

    id v23 = [v19 copyQueryStringParameters];
    -[SSMutableURLRequestProperties setRequestParameters:](v20, "setRequestParameters:", v23);
    [v9 setRequestProperties:v20];
    objc_initWeak((id *)location, v9);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000AC630;
    v31[3] = &unk_10034C8F8;
    objc_copyWeak(&v33, (id *)location);
    id v32 = v8;
    [v9 setCompletionBlock:v31];
    [v7 addOperation:v9];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)location);
  }

  else
  {
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v24) {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v25) = [v24 shouldLog];
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class(v7);
      __int16 v35 = 2112;
      id v36 = v8;
      id v27 = *(id *)&location[4];
      unsigned int v28 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Cannot add wishlist items for unentitled client: %@",  location,  22);

      if (v28)
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
        free(v28);
        SSFileLog(v24, @"%@");
      }
    }

    else
    {
    }

    [v7 _sendUnentitledMessageToClient:v8];
  }
}

+ (void)_addSubscriptionOperationWithType:(int64_t)a3 message:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedNetworkRequestQueue]);
  id v11 = [v10 _newClientWithMessage:v8 connection:v9];

  if ([v11 hasEntitlements])
  {
    if (a3 == 2)
    {
      id v19 = objc_alloc(&OBJC_CLASS___SSVRefreshSubscriptionRequest);
      xpc_object_t value = xpc_dictionary_get_value(v8, "1");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(value);
      id v22 = [v19 initWithXPCEncoding:v21];

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 authenticationContext]);
      id v24 = [v10 _copyAuthenticationContextWithContext:v23 client:v11];

      id v25 = [v22 isRequestingOfflineSlot];
    }

    else
    {
      if (a3 == 1)
      {
        uint64_t v12 = (objc_class *)&OBJC_CLASS___SSVEnableSubscriptionRequest;
      }

      else
      {
        if (a3)
        {
          id v24 = 0LL;
          id v25 = 0LL;
          goto LABEL_24;
        }

        uint64_t v12 = (objc_class *)&OBJC_CLASS___SSVDisableSubscriptionRequest;
      }

      id v26 = objc_alloc(v12);
      xpc_object_t v27 = xpc_dictionary_get_value(v8, "1");
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v22 = [v26 initWithXPCEncoding:v28];

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v22 authenticationContext]);
      id v24 = [v10 _copyAuthenticationContextWithContext:v29 client:v11];

      id v25 = 0LL;
    }

LABEL_24:
    id v30 = objc_alloc_init(&OBJC_CLASS___SubscriptionOperation);
    -[SubscriptionOperation setAuthenticationContext:](v30, "setAuthenticationContext:", v24);
    -[SubscriptionOperation setOperationType:](v30, "setOperationType:", a3);
    -[SubscriptionOperation setRequestingOfflineSlot:](v30, "setRequestingOfflineSlot:", v25);
    int v31 = (void *)objc_claimAutoreleasedReturnValue([v11 userAgent]);
    -[SubscriptionOperation setUserAgent:](v30, "setUserAgent:", v31);

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000ACAD8;
    v33[3] = &unk_10034D4C8;
    id v34 = v30;
    id v32 = v30;
    [v10 addOperation:v32 forClient:v11 withMessageBlock:v33];

    goto LABEL_25;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if (!(_DWORD)v15) {
    goto LABEL_17;
  }
  int v35 = 138412546;
  id v36 = (id)objc_opt_class(v10);
  __int16 v37 = 2112;
  id v38 = v11;
  id v17 = v36;
  uint64_t v18 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Cannot change subscription for unentitled client: %@",  &v35,  22);

  if (v18)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
    free(v18);
    SSFileLog(v13, @"%@");
LABEL_17:
  }

  [v10 _sendUnentitledMessageToClient:v11];
LABEL_25:
}

- (id)_copyAuthenticationContextWithContext:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = (SSMutableAuthenticationContext *)[a3 mutableCopy];
  if (!v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
    id v6 = -[SSMutableAuthenticationContext initWithAccount:](v7, "initWithAccount:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableAuthenticationContext clientIdentifierHeader](v6, "clientIdentifierHeader"));

  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 clientIdentifierHeader]);
    -[SSMutableAuthenticationContext setClientIdentifierHeader:](v6, "setClientIdentifierHeader:", v11);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableAuthenticationContext HTTPHeaders](v6, "HTTPHeaders"));
  uint64_t v13 = SSHTTPHeaderUserAgent;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:SSHTTPHeaderUserAgent]);

  if (!v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 userAgent]);
    -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:](v6, "setValue:forHTTPHeaderField:", v15, v13);
  }

  return v6;
}

- (void)_enqueueOperationsForStoreServicesURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000AD3FC;
  v60[3] = &unk_10034D680;
  id v8 = v5;
  v61 = v8;
  id v9 = v6;
  v62 = v9;
  id v10 = v7;
  v63 = v10;
  [v4 enumerateQueryWithBlock:v60];
  if (!-[NSMutableString isEqualToString:](v8, "isEqualToString:", @"download-manifest"))
  {
    id v30 = v10;
    int v31 = v9;
    unsigned int v32 = -[NSMutableString isEqualToString:](v8, "isEqualToString:", @"redeem-codes");
    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    uint64_t v13 = (RedeemCodesOperation *)v33;
    if (!v32)
    {
      if (!v33) {
        uint64_t v13 = (RedeemCodesOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v48 = -[RedeemCodesOperation shouldLog](v13, "shouldLog");
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation OSLogObject](v13, "OSLogObject"));
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v49 = v48;
      }
      else {
        uint64_t v49 = v48 & 2;
      }
      if ((_DWORD)v49)
      {
        v50 = (void *)objc_opt_class(self);
        int v65 = 138412546;
        v66 = v50;
        __int16 v67 = 2112;
        v68 = v8;
        id v51 = v50;
        v52 = (void *)_os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "%@: Received unknown action: %@",  &v65,  22);

        if (!v52)
        {
          id v10 = v30;
          goto LABEL_60;
        }

        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL));
        free(v52);
        SSFileLog(v13, @"%@");
      }

      id v10 = v30;
      goto LABEL_59;
    }

    if (!v33) {
      uint64_t v13 = (RedeemCodesOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v34 = -[RedeemCodesOperation shouldLog](v13, "shouldLog");
    int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation OSLogObject](v13, "OSLogObject"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      uint64_t v36 = v34;
    }
    else {
      uint64_t v36 = v34 & 2;
    }
    if ((_DWORD)v36)
    {
      __int16 v37 = (void *)objc_opt_class(self);
      id v38 = v4;
      id v39 = v37;
      id v40 = (NSMutableString *)-[NSMutableArray count](v31, "count");
      int v65 = 138412546;
      v66 = v37;
      __int16 v67 = 2048;
      v68 = v40;
      id v41 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "%@: Redeeming %lu codes from URL",  &v65,  22);

      id v4 = v38;
      id v9 = v31;

      id v10 = v30;
      if (!v41)
      {
LABEL_57:

        uint64_t v13 = -[RedeemCodesOperation initWithRedeemCodes:]( objc_alloc(&OBJC_CLASS___RedeemCodesOperation),  "initWithRedeemCodes:",  v9);
        -[RequestQueue addOperation:](self, "addOperation:", v13);
        goto LABEL_60;
      }

      int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
      free(v41);
      SSFileLog(v13, @"%@");
    }

    else
    {
      id v10 = v30;
    }

    goto LABEL_57;
  }

  int v11 = SSRestrictionsIsOnDeviceAppInstallationAllowed();
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  uint64_t v13 = (RedeemCodesOperation *)v12;
  if (!v11)
  {
    if (!v12) {
      uint64_t v13 = (RedeemCodesOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v42 = -[RedeemCodesOperation shouldLog](v13, "shouldLog");
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation OSLogObject](v13, "OSLogObject"));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v44 = v42;
    }
    else {
      uint64_t v44 = v42 & 2;
    }
    if ((_DWORD)v44)
    {
      id v45 = (void *)objc_opt_class(self);
      int v65 = 138412290;
      v66 = v45;
      id v46 = v45;
      id v47 = (void *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "%@: Download manifest installation is restricted",  &v65,  12);

      if (!v47) {
        goto LABEL_60;
      }
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
      free(v47);
      SSFileLog(v13, @"%@");
    }

- (id)_managedQueue
{
  managedQueue = self->_managedQueue;
  if (!managedQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    id v5 = self->_managedQueue;
    self->_managedQueue = v4;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( self->_managedQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](self->_managedQueue, "setMaxConcurrentOperationCount:", 1LL);
    managedQueue = self->_managedQueue;
  }

  return managedQueue;
}

- (id)_newClientWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v5);

  xpc_object_t value = xpc_dictionary_get_value(v6, "2");
  id v9 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue(value);

  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_endpoint)
  {
    xpc_connection_t v10 = xpc_connection_create_from_endpoint(v9);
    if (v10) {
      -[XPCClient setOutputConnectionWithConnection:](v7, "setOutputConnectionWithConnection:", v10);
    }
  }

  return v7;
}

- (void)_sendMessageWithError:(id)a3 toClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v8, "0", 1011LL);
  SSXPCDictionarySetObject(v8, "2", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 outputConnection]);
  [v7 sendMessage:v8];
}

- (void)_sendNotSupportedMessageToClient:(id)a3
{
  uint64_t v4 = SSErrorDomain;
  id v5 = a3;
  uint64_t v6 = SSError(v4, 157LL, 0LL, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[NetworkRequestQueue _sendMessageWithError:toClient:](self, "_sendMessageWithError:toClient:", v7, v5);
}

- (void)_sendUnentitledMessageToClient:(id)a3
{
  id v3 = a3;
  id v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v7, "0", 1011LL);
  uint64_t v4 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  SSXPCDictionarySetObject(v7, "2", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 outputConnection]);
  [v6 sendMessage:v7];
}

- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4
{
  connection = (_xpc_connection_s *)a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    uint64_t v6 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    SSXPCDictionarySetObject(reply, "2", v7);

    xpc_connection_send_message(connection, reply);
  }
}

- (void)_enqueueSubscriptionStatusOperation:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  subscriptionStatusOperationAccessQueue = (dispatch_queue_s *)self->_subscriptionStatusOperationAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AD8EC;
  block[3] = &unk_10034BCE8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(subscriptionStatusOperationAccessQueue, block);
}

- (void)_dequeueSubscriptionStatusOperation:(id)a3
{
  id v4 = a3;
  subscriptionStatusOperationAccessQueue = (dispatch_queue_s *)self->_subscriptionStatusOperationAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ADA04;
  block[3] = &unk_10034AD58;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(subscriptionStatusOperationAccessQueue, block);
}

- (void).cxx_destruct
{
}

@end