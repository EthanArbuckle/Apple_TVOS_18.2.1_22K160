@interface PurchaseManagerOperation
- (BOOL)_isDeviceCapableForPurchase;
- (BOOL)useRemoteAuthentication;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (PurchaseManagerOperation)initWithPurchase:(id)a3;
- (SSPurchase)purchase;
- (id)_appleIDForApp:(id)a3 error:(id *)a4;
- (id)_familyPurchaserAccountIdentifierForApplication:(id)a3;
- (id)_incompatibleErrorWithPurchase:(id)a3;
- (id)_installedSoftwareApplicationForPurchase:(id)a3;
- (id)_localRedownloadParametersForPurchase:(id)a3;
- (id)_newPurchaseOperationWithPurchase:(id)a3;
- (id)_personalizedRedownloadParametersForPurchase:(id)a3;
- (id)_urlBagKey;
- (id)purchaseBlock;
- (id)remoteAuthenticationHandler;
- (int64_t)URLBagType;
- (void)_performSetup;
- (void)_performTeardownWithResult:(BOOL)a3 queueResponse:(id)a4;
- (void)_showDialogForPurchase:(id)a3 error:(id)a4;
- (void)_updateAccount:(id)a3 withPurchaseResponse:(id)a4;
- (void)run;
- (void)setClientIdentifier:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPurchaseBlock:(id)a3;
- (void)setRemoteAuthenticationHandler:(id)a3;
- (void)setURLBagType:(int64_t)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseManagerOperation

- (PurchaseManagerOperation)initWithPurchase:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PurchaseManagerOperation;
  v6 = -[PurchaseManagerOperation init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_purchase, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 requestProperties]);
    v7->_urlBagType = (int64_t)[v8 URLBagType];
  }

  return v7;
}

- (NSString)clientIdentifier
{
  id v3 = -[NSString copy](self->_clientIdentifier, "copy");
  -[PurchaseManagerOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)clientIdentifierHeader
{
  id v3 = -[NSString copy](self->_clientIdentifierHeader, "copy");
  -[PurchaseManagerOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (SSPurchase)purchase
{
  return self->_purchase;
}

- (id)purchaseBlock
{
  id v3 = [self->_purchaseBlock copy];
  -[PurchaseManagerOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setClientIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  -[PurchaseManagerOperation lock](self, "lock");
  if (self->_clientIdentifier != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    clientIdentifier = self->_clientIdentifier;
    self->_clientIdentifier = v4;
  }

  -[PurchaseManagerOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
  v6 = (NSString *)a3;
  -[PurchaseManagerOperation lock](self, "lock");
  if (self->_clientIdentifierHeader != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    clientIdentifierHeader = self->_clientIdentifierHeader;
    self->_clientIdentifierHeader = v4;
  }

  -[PurchaseManagerOperation unlock](self, "unlock");
}

- (void)setPurchaseBlock:(id)a3
{
  id v6 = a3;
  -[PurchaseManagerOperation lock](self, "lock");
  if (self->_purchaseBlock != v6)
  {
    id v4 = [v6 copy];
    id purchaseBlock = self->_purchaseBlock;
    self->_id purchaseBlock = v4;
  }

  -[PurchaseManagerOperation unlock](self, "unlock");
}

- (void)setURLBagType:(int64_t)a3
{
  self->_urlBagType = a3;
  -[PurchaseManagerOperation unlock](self, "unlock");
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  self->_useRemoteAuthentication = a3;
  -[PurchaseManagerOperation unlock](self, "unlock");
}

- (int64_t)URLBagType
{
  int64_t urlBagType = self->_urlBagType;
  -[PurchaseManagerOperation unlock](self, "unlock");
  return urlBagType;
}

- (BOOL)useRemoteAuthentication
{
  BOOL useRemoteAuthentication = self->_useRemoteAuthentication;
  -[PurchaseManagerOperation unlock](self, "unlock");
  return useRemoteAuthentication;
}

- (void)run
{
  v2 = self;
  if (-[PurchaseManagerOperation _isDeviceCapableForPurchase](self, "_isDeviceCapableForPurchase"))
  {
    -[PurchaseManagerOperation _performSetup](v2, "_performSetup");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase gratisIdentifiers](v2->_purchase, "gratisIdentifiers"));
    id v4 = [v3 count];

    if (v4)
    {
      if (-[SSPurchase isGratisSoftwareClaim](v2->_purchase, "isGratisSoftwareClaim"))
      {
        +[AppStoreUtility claimAppsWithPurchase:]( &OBJC_CLASS___AppStoreUtility,  "claimAppsWithPurchase:",  v2->_purchase);
        unint64_t v5 = 0LL;
        uint64_t v6 = 0LL;
        v7 = 0LL;
        uint64_t v111 = 0LL;
        v8 = 0LL;
        v120 = 0LL;
        v121 = 0LL;
        goto LABEL_46;
      }

      v22 = -[GratisClaimOperation initWithPurchase:]( objc_alloc(&OBJC_CLASS___GratisClaimOperation),  "initWithPurchase:",  v2->_purchase);
      id v123 = 0LL;
      unint64_t v5 = (unint64_t)-[PurchaseManagerOperation runSubOperation:returningError:]( v2,  "runSubOperation:returningError:",  v22,  &v123);
      id v122 = v123;
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[GratisClaimOperation authenticatedAccountDSID](v22, "authenticatedAccountDSID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation rawOutput](v22, "rawOutput"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation URLResponse](v22, "URLResponse"));
      v121 = 0LL;
      uint64_t v111 = 0LL;
      v19 = 0LL;
      goto LABEL_43;
    }

    v22 = -[PurchaseManagerOperation _newPurchaseOperationWithPurchase:]( v2,  "_newPurchaseOperationWithPurchase:",  v2->_purchase);
    id v124 = 0LL;
    unint64_t v5 = (unint64_t)-[PurchaseManagerOperation runSubOperation:returningError:]( v2,  "runSubOperation:returningError:",  v22,  &v124);
    id v122 = v124;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v24 authenticatedAccountDSID]);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v25 rawOutput]);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      uint64_t v111 = objc_claimAutoreleasedReturnValue([v26 requestPerformanceMetrics]);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v27 storeCorrelationID]);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      v121 = (void *)objc_claimAutoreleasedReturnValue([v28 tidHeaders]);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation shim](v22, "shim"));
      v120 = (void *)objc_claimAutoreleasedReturnValue([v29 URLResponse]);
    }

    else
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[GratisClaimOperation authenticatedAccountDSID](v22, "authenticatedAccountDSID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation rawOutput](v22, "rawOutput"));
      uint64_t v111 = objc_claimAutoreleasedReturnValue(-[GratisClaimOperation requestPerformanceMetrics](v22, "requestPerformanceMetrics"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation storeCorrelationID](v22, "storeCorrelationID"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation tidHeaders](v22, "tidHeaders"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[GratisClaimOperation URLResponse](v22, "URLResponse"));
    }

    if (!-[GratisClaimOperation isMoveToiOS](v22, "isMoveToiOS"))
    {
LABEL_43:

      v40 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"cancel-purchase-batch"]);
      if ((objc_opt_respondsToSelector(v40, "BOOLValue") & 1) == 0)
      {
        unsigned int v114 = 0;
LABEL_49:

        if (v6) {
          goto LABEL_53;
        }
        goto LABEL_50;
      }

      unsigned int v41 = [v40 BOOLValue];

      if (!v41)
      {
        unsigned int v114 = 0;
        if (v6) {
          goto LABEL_53;
        }
LABEL_50:
        uint64_t v6 = objc_claimAutoreleasedReturnValue( -[SSPurchase valueForDownloadProperty:]( v2->_purchase,  "valueForDownloadProperty:",  SSDownloadPropertyStoreAccountIdentifier,  v97));
        if (!v6)
        {
LABEL_54:
          v115 = (void *)v6;
          if (!v7)
          {
            v21 = 0LL;
            v20 = (void *)v111;
LABEL_86:
            -[PurchaseManagerOperation _performTeardownWithResult:queueResponse:]( v2,  "_performTeardownWithResult:queueResponse:",  v5,  v21,  v97);
            goto LABEL_87;
          }

          v46 = (void *)objc_claimAutoreleasedReturnValue( -[SSPurchase valueForDownloadProperty:]( v2->_purchase,  "valueForDownloadProperty:",  SSDownloadPropertyPreferredAssetFlavor));
          v21 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:preferredAssetFlavor:]( objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse),  "initWithDictionary:userIdentifier:preferredAssetFlavor:",  v7,  v6,  v46);
          if ([v19 length]) {
            -[StoreDownloadQueueResponse setStoreCorrelationID:](v21, "setStoreCorrelationID:", v19);
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"jingleAction"]);
          uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString);
          v20 = (void *)v111;
          if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0
            && [v47 isEqualToString:@"inAppBuy"])
          {
            v49 = v21;
            v50 = -[MicroPaymentQueueResponse initWithRequestType:]( objc_alloc(&OBJC_CLASS___MicroPaymentQueueResponse),  "initWithRequestType:",  0LL);
            if (-[MicroPaymentQueueResponse loadFromPropertyList:](v50, "loadFromPropertyList:", v7))
            {
              v104 = v47;
              v51 = v2;
              v52 = v19;
              v53 = v46;
              v54 = (void *)objc_claimAutoreleasedReturnValue(+[MicroPaymentQueue paymentQueue](&OBJC_CLASS___MicroPaymentQueue, "paymentQueue"));
              [v54 updateWithPurchaseResponse:v50];

              v46 = v53;
              v19 = v52;
              v2 = v51;
              v47 = v104;
            }

            v21 = v49;
          }

          v118 = v7;
          v55 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ad-network"]);
          v56 = v55;
          if (!v55)
          {
LABEL_85:

            v7 = v118;
            goto LABEL_86;
          }

          v105 = v47;
          v106 = v21;
          v57 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:@"error"]);

          unsigned int v109 = v5;
          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v58) {
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v59 = [v58 shouldLog];
            else {
              unsigned int v60 = v59;
            }
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v58 OSLogObject]);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              uint64_t v62 = v60;
            }
            else {
              uint64_t v62 = v60 & 2;
            }
            if (!(_DWORD)v62)
            {
              unint64_t v5 = v109;
              v21 = v106;
LABEL_83:

              goto LABEL_84;
            }

            v103 = v46;
            v112 = v19;
            v63 = (void *)objc_opt_class(v2);
            id v64 = v63;
            v65 = (SSPurchase *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"error"]);
            int v125 = 138543618;
            v126 = v63;
            __int16 v127 = 2112;
            v128 = v65;
            LODWORD(v98) = 22;
            v66 = (void *)_os_log_send_and_compose_impl( v62,  0LL,  0LL,  0LL,  &_mh_execute_header,  v61,  16LL,  "[%{public}@]: Install attribution response error: %@",  &v125,  v98);

            if (!v66)
            {
              unint64_t v5 = v109;
              v19 = v112;
              v21 = v106;
              v46 = v103;
LABEL_84:

              v47 = v105;
              goto LABEL_85;
            }

            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v66,  4LL));
            free(v66);
            v97 = v61;
            SSFileLog(v58, @"%@");
          }

          else
          {
            v112 = v19;
            v58 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"ad-network-id"]);
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"adam-id"]);
            v101 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"campaign-id"]);
            v67 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"transaction-id"]);
            v102 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"signature"]);
            uint64_t v68 = objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"url"]);
            v103 = v46;
            v99 = (void *)v68;
            if (v68) {
              v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v68));
            }
            else {
              v100 = 0LL;
            }
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v69 timeIntervalSince1970];
            uint64_t v71 = (uint64_t)(v70 * 1000.0);

            v72 = objc_alloc(&OBJC_CLASS___InstallAttributionPingback);
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v71));
            v74 = -[InstallAttributionPingback initWithAppAdamId:transactionId:campaignId:adNetworkId:attributionSignature:pingbackUrl:retryCount:localTimestamp:]( v72,  "initWithAppAdamId:transactionId:campaignId:adNetworkId:attributionSignature:pingbackUrl:retryCount:localTimestamp:",  v61,  v67,  v101,  v58,  v102,  v100,  0LL,  v73);

            v75 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseActionsManager sharedInstance]( &OBJC_CLASS___PurchaseActionsManager,  "sharedInstance"));
            [v75 insertInstallAttributionPingback:v74];

            v76 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseActionsManager sharedInstance]( &OBJC_CLASS___PurchaseActionsManager,  "sharedInstance"));
            [v76 removeInstallAttributionParamsForApp:v61];
          }

          unint64_t v5 = v109;
          v19 = v112;
          v21 = v106;
          v46 = v103;
          goto LABEL_83;
        }

- (id)_appleIDForApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appState]);
  unsigned __int8 v8 = [v7 isValid];

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleContainerURL]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"iTunesMetadata.plist"]);

    if (v10)
    {
      v32[0] = @"com.apple.iTunesStore.downloadInfo";
      v32[1] = @"accountInfo";
      v32[2] = @"AppleID";
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@":"]);

      v13 = (void *)objc_claimAutoreleasedReturnValue( +[MappedPropertyList readKeyPath:fromURL:error:]( &OBJC_CLASS___MappedPropertyList,  "readKeyPath:fromURL:error:",  v12,  v10,  a4));
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      {
        v19 = 0LL;
LABEL_39:

        goto LABEL_40;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.apple.iTunesStore.downloadInfo"]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        v19 = 0LL;
        goto LABEL_38;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"accountInfo"]);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"AppleID"]);
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
LABEL_9:

LABEL_38:
          goto LABEL_39;
        }
      }

      v19 = 0LL;
      goto LABEL_9;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v26 = [v12 shouldLog];
    else {
      LODWORD(v27) = v26;
    }
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      int v33 = 138543618;
      id v34 = (id)objc_opt_class(self);
      __int16 v35 = 2114;
      id v36 = v6;
      id v29 = v34;
      v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  16LL,  "[%{public}@]: Account lookup failed when composing bundle URL for proxy: %{public}@",  &v33,  22);

      if (!v30)
      {
LABEL_35:
        v19 = 0LL;
LABEL_40:

        goto LABEL_41;
      }

      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
      free(v30);
      SSFileLog(v12, @"%@");
    }

    goto LABEL_35;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v21 = [v10 shouldLog];
  else {
    LODWORD(v22) = v21;
  }
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    uint64_t v22 = v22;
  }
  else {
    v22 &= 2u;
  }
  if (!(_DWORD)v22) {
    goto LABEL_21;
  }
  int v33 = 138543618;
  id v34 = (id)objc_opt_class(self);
  __int16 v35 = 2114;
  id v36 = v6;
  id v24 = v34;
  v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  16LL,  "[%{public}@]: Account lookup failed for invalid proxy: %{public}@",  &v33,  22);

  if (v25)
  {
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    SSFileLog(v10, @"%@");
LABEL_21:
  }

  v19 = 0LL;
LABEL_41:

  return v19;
}

- (id)_familyPurchaserAccountIdentifierForApplication:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleIdentifier]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sinfPathForBundleID:v3]);

    if (v5)
    {
      id v6 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v5);
      v7 = v6;
      if (v6)
      {
        uint64_t v14 = 0LL;
        sub_1000231EC(v6, 4uLL, &v14);
        unsigned __int8 v8 = 0LL;
        if (v9) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v14 == 0;
        }
        if (!v10)
        {
          uint64_t v13 = 0LL;
          sub_1000231EC(v7, 2uLL, &v13);
          unsigned __int8 v8 = 0LL;
          if (!v11)
          {
            if (v13) {
              unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:"));
            }
          }
        }
      }

      else
      {
        unsigned __int8 v8 = 0LL;
      }
    }

    else
    {
      unsigned __int8 v8 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (id)_incompatibleErrorWithPurchase:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForDownloadProperty:SSDownloadPropertyTitle]);
  uint64_t v4 = ISDeviceIncompatibleAppErrorWithAppTitle(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)_installedSoftwareApplicationForPurchase:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]);
  if (!v4
    || (unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForItemID:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForItemID:",  v4))) == 0LL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForDownloadProperty:SSDownloadPropertyBundleIdentifier]);
    if (v6) {
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
    }
    else {
      unint64_t v5 = 0LL;
    }
  }

  return v5;
}

- (BOOL)_isDeviceCapableForPurchase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase requiredDeviceCapabilities](self->_purchase, "requiredDeviceCapabilities"));
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    unint64_t v5 = (const __CFDictionary *)MobileInstallationCheckCapabilitiesMatch();
    if (v5)
    {
      id v6 = v5;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v5, @"CapabilitiesMatch");
      if (Value) {
        BOOL v8 = CFBooleanGetValue(Value) != 0;
      }
      else {
        BOOL v8 = 0;
      }
      CFRelease(v6);
    }

    else
    {
      BOOL v8 = 0;
    }

    CFRelease(v4);
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)_localRedownloadParametersForPurchase:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_10016C884;
  id v15 = sub_10016C894;
  id v16 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]);
  if (v4)
  {
    id v5 = +[SSAppPurchaseHistoryDatabase newDefaultInstance]( &OBJC_CLASS___SSAppPurchaseHistoryDatabase,  "newDefaultInstance");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10016C89C;
    v8[3] = &unk_100350400;
    id v9 = v4;
    BOOL v10 = &v11;
    [v5 readUsingTransactionBlock:v8];
  }

  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_newPurchaseOperationWithPurchase:(id)a3
{
  id v4 = a3;
  id v5 = -[PurchaseOperation initWithPurchase:](objc_alloc(&OBJC_CLASS___PurchaseOperation), "initWithPurchase:", v4);

  -[PurchaseOperation setBagType:](v5, "setBagType:", -[PurchaseManagerOperation URLBagType](self, "URLBagType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseManagerOperation clientIdentifier](self, "clientIdentifier"));
  -[PurchaseOperation setClientIdentifier:](v5, "setClientIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseManagerOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  -[PurchaseOperation setClientIdentifierHeader:](v5, "setClientIdentifierHeader:", v7);

  -[PurchaseOperation setOriginalProductOwnerAccountDSID:]( v5,  "setOriginalProductOwnerAccountDSID:",  self->_applicationOwnerAccountDSID);
  -[PurchaseOperation setShouldSendKeyBagSyncData:](v5, "setShouldSendKeyBagSyncData:", 1LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseManagerOperation _urlBagKey](self, "_urlBagKey"));
  -[PurchaseOperation setUrlBagKey:](v5, "setUrlBagKey:", v8);

  if (-[PurchaseManagerOperation useRemoteAuthentication](self, "useRemoteAuthentication"))
  {
    -[PurchaseOperation setUseRemoteAuthentication:](v5, "setUseRemoteAuthentication:", 1LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10016CC6C;
    v10[3] = &unk_100350428;
    v10[4] = self;
    -[PurchaseOperation setRemoteAuthenticationHandler:](v5, "setRemoteAuthenticationHandler:", v10);
  }

  return v5;
}

- (void)_performSetup
{
  purchase = self->_purchase;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SSTonePurchase);
  if ((objc_opt_isKindOfClass(purchase, v4) & 1) != 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___RingtonePurchaseStore);
    v101 = self->_purchase;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v101, 1LL));
    -[RingtonePurchaseStore addRingtonesForPurchases:](v5, "addRingtonesForPurchases:", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[SSPurchase valueForDownloadProperty:]( self->_purchase,  "valueForDownloadProperty:",  SSDownloadPropertyKind));
  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadController controller](&OBJC_CLASS___DownloadController, "controller"));
    [v8 beginUsingNetworkForDownloadKind:v7];
  }

  if (SSDownloadKindIsSoftwareKind(v7))
  {
    if (!-[SSPurchase usesLocalRedownloadParametersIfPossible]( self->_purchase,  "usesLocalRedownloadParametersIfPossible"))
    {
      unint64_t v91 = 0LL;
      goto LABEL_32;
    }

    unint64_t v91 = (void *)objc_claimAutoreleasedReturnValue( -[PurchaseManagerOperation _installedSoftwareApplicationForPurchase:]( self,  "_installedSoftwareApplicationForPurchase:",  self->_purchase));
    if (v91) {
      goto LABEL_32;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PurchaseManagerOperation _personalizedRedownloadParametersForPurchase:]( self,  "_personalizedRedownloadParametersForPurchase:",  self->_purchase));
    BOOL v10 = v9;
    if (v9)
    {
      id v89 = [v9 length];
    }

    else
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[PurchaseManagerOperation _localRedownloadParametersForPurchase:]( self,  "_localRedownloadParametersForPurchase:",  self->_purchase));
      id v89 = [v10 length];
      if (!v10) {
        goto LABEL_32;
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase buyParameters](self->_purchase, "buyParameters"));
    id v12 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v11,  1LL);

    uint64_t v13 = 0LL;
    __int128 v100 = *(_OWORD *)off_100350448;
    char v14 = 1;
    do
    {
      char v15 = v14;
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 objectForKey:*((void *)&v100 + v13)]);
      v17 = (void *)v16;
      if (v16)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingFormat:@"&%@=%@", *((void *)&v100 + v13), v16]);

        BOOL v10 = (void *)v18;
      }

      char v14 = 0;
      uint64_t v13 = 1LL;
    }

    while ((v15 & 1) != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v20) = [v19 shouldLog];
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      *(_DWORD *)v96 = 138412546;
      *(void *)&v96[4] = objc_opt_class(self);
      *(_WORD *)&v96[12] = 2112;
      *(void *)&v96[14] = v10;
      id v22 = *(id *)&v96[4];
      LODWORD(v84) = 22;
      v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Using local buy parameters for purchase: %@",  v96,  v84);

      if (!v23)
      {
LABEL_27:

        if (v89) {
          -[SSPurchase setValue:forDownloadProperty:]( self->_purchase,  "setValue:forDownloadProperty:",  &__kCFBooleanTrue,  SSDownloadPropertyIsRedownload);
        }
        -[SSPurchase setBuyParameters:](self->_purchase, "setBuyParameters:", v10, v82);
        for (uint64_t i = 8LL; i != -8; i -= 8LL)

LABEL_32:
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase accountIdentifier](self->_purchase, "accountIdentifier"));
        if (v25) {
          goto LABEL_55;
        }
        if ((-[SSPurchase skipSoftwareAccountPreflight](self->_purchase, "skipSoftwareAccountPreflight") & 1) != 0)
        {
          v25 = 0LL;
          goto LABEL_55;
        }

        unsigned int v26 = v91;
        if (!v91) {
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( -[PurchaseManagerOperation _installedSoftwareApplicationForPurchase:]( self,  "_installedSoftwareApplicationForPurchase:",  self->_purchase));
        }
        unint64_t v91 = v26;
        applicationOwnerAccountDSID = (NSNumber *)objc_claimAutoreleasedReturnValue([v91 purchaserDSID]);
        if (-[NSNumber unsignedLongLongValue](applicationOwnerAccountDSID, "unsignedLongLongValue") == -1LL)
        {
          v25 = 0LL;
        }

        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v91 purchaserDSID]);
          BOOL v29 = [v28 unsignedLongLongValue] == 0;

          if (v29)
          {
LABEL_38:
            v25 = 0LL;
            goto LABEL_44;
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue([v91 purchaserDSID]);
          v30 = (NSNumber *)[v25 copy];
          applicationOwnerAccountDSID = self->_applicationOwnerAccountDSID;
          self->_applicationOwnerAccountDSID = v30;
        }

LABEL_44:
        unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
        unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 activeAccount]);
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueIdentifier]);

        if (!v25)
        {
LABEL_54:

LABEL_55:
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase ownerAccountDSID](self->_purchase, "ownerAccountDSID"));

          if (v40)
          {
            unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase ownerAccountDSID](self->_purchase, "ownerAccountDSID"));
            uint64_t v42 = (NSNumber *)[v41 copy];
            uint64_t v43 = self->_applicationOwnerAccountDSID;
            self->_applicationOwnerAccountDSID = v42;
          }

          if (!v25)
          {
LABEL_85:
            id v64 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase downloadProperties](self->_purchase, "downloadProperties", v82));
            v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:SSDownloadPropertyIsRedownload]);
            BOOL v66 = [v65 integerValue] == 0;

            if (!v66)
            {
LABEL_100:

              goto LABEL_101;
            }

            dispatch_semaphore_t v67 = dispatch_semaphore_create(0LL);
            *(void *)v96 = 0LL;
            *(void *)&v96[8] = v96;
            *(void *)&v96[16] = 0x3032000000LL;
            v97 = sub_10016C884;
            uint64_t v98 = sub_10016C894;
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase buyParameters](self->_purchase, "buyParameters"));
            id v99 = [v68 copy];

            v69 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseActionsManager sharedInstance]( &OBJC_CLASS___PurchaseActionsManager,  "sharedInstance"));
            double v70 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase downloadProperties](self->_purchase, "downloadProperties"));
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:SSDownloadPropertyStoreItemIdentifier]);
            v92[0] = _NSConcreteStackBlock;
            v92[1] = 3221225472LL;
            v92[2] = sub_10016D9CC;
            v92[3] = &unk_100350460;
            v92[4] = self;
            v94 = v96;
            v72 = v67;
            double v93 = v72;
            [v69 getInstallAttributionParamsForApp:v71 completionHandler:v92];

            dispatch_time_t v73 = dispatch_time(0LL, 30000000000LL);
            if (!dispatch_semaphore_wait(v72, v73))
            {
LABEL_99:
              -[SSPurchase setBuyParameters:]( self->_purchase,  "setBuyParameters:",  *(void *)(*(void *)&v96[8] + 40LL),  v83);

              _Block_object_dispose(v96, 8);
              goto LABEL_100;
            }

            v74 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v74) {
              v74 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v75) = [v74 shouldLog];
            unsigned int v76 = [v74 shouldLogToDisk];
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 OSLogObject]);
            v78 = v77;
            if (v76) {
              LODWORD(v75) = v75 | 2;
            }
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              uint64_t v75 = v75;
            }
            else {
              v75 &= 2u;
            }
            if ((_DWORD)v75)
            {
              v79 = (void *)objc_opt_class(self);
              LODWORD(v100) = 138543362;
              *(void *)((char *)&v100 + 4) = v79;
              id v80 = v79;
              LODWORD(v84) = 12;
              v81 = (void *)_os_log_send_and_compose_impl( v75,  0LL,  0LL,  0LL,  &_mh_execute_header,  v78,  16LL,  "[%{public}@]: Timed out waiting to get install attribution params from DB",  &v100,  v84);

              if (!v81)
              {
LABEL_98:

                goto LABEL_99;
              }

              v78 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v81,  4LL));
              free(v81);
              v83 = v78;
              SSFileLog(v74, @"%@");
            }

            goto LABEL_98;
          }

          double v90 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v90 accountWithUniqueIdentifier:v25]);
          if (v44)
          {
LABEL_84:

            goto LABEL_85;
          }

          id v95 = 0LL;
          uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseManagerOperation _appleIDForApp:error:](self, "_appleIDForApp:error:", v91, &v95));
          char v86 = (uint64_t (*)(uint64_t, uint64_t))v95;
          if (!v87)
          {
            v56 = (SSAccount *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
            if (!v56) {
              v56 = (SSAccount *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            v88 = v56;
            unsigned int v57 = -[SSAccount shouldLog](v56, "shouldLog");
            v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SSAccount OSLogObject](v88, "OSLogObject"));
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v59 = v57;
            }
            else {
              uint64_t v59 = v57 & 2;
            }
            if ((_DWORD)v59)
            {
              unsigned int v60 = (void *)objc_opt_class(self);
              id v61 = v60;
              uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v91 bundleIdentifier]);
              *(_DWORD *)v96 = 138543874;
              *(void *)&v96[4] = v60;
              *(_WORD *)&v96[12] = 2114;
              *(void *)&v96[14] = v62;
              *(_WORD *)&v96[22] = 2114;
              v97 = v86;
              LODWORD(v84) = 32;
              v63 = (void *)_os_log_send_and_compose_impl( v59,  0LL,  0LL,  0LL,  &_mh_execute_header,  v58,  0LL,  "%{public}@: Failed to find account name for %{public}@ error: %{public}@",  v96,  v84);

              if (!v63) {
                goto LABEL_83;
              }
              v58 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v63,  4LL));
              free(v63);
              v82 = v58;
              SSFileLog(v88, @"%@");
            }

            goto LABEL_83;
          }

          v88 = objc_alloc_init(&OBJC_CLASS___SSAccount);
          -[SSAccount setAccountName:](v88, "setAccountName:", v87);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v90 activeAccount]);
          -[SSAccount setActive:](v88, "setActive:", v45 == 0LL);

          v46 = (void *)objc_claimAutoreleasedReturnValue([v91 storeFront]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 stringValue]);
          -[SSAccount setStoreFrontIdentifier:](v88, "setStoreFrontIdentifier:", v47);

          -[SSAccount setUniqueIdentifier:](v88, "setUniqueIdentifier:", v25);
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
          if (!v48) {
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v49) = [v48 shouldLog];
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 OSLogObject]);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v49 = v49;
          }
          else {
            v49 &= 2u;
          }
          if ((_DWORD)v49)
          {
            v51 = (void *)objc_opt_class(self);
            id v85 = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount accountName](v88, "accountName"));
            uint64_t v53 = SSHashIfNeeded(v52);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            *(_DWORD *)v96 = 138543618;
            *(void *)&v96[4] = v51;
            *(_WORD *)&v96[12] = 2114;
            *(void *)&v96[14] = v54;
            LODWORD(v84) = 22;
            v55 = (void *)_os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v50,  0LL,  "%{public}@: Adding an account for purchases. Saving %{public}@.",  v96,  v84);

            if (!v55)
            {
LABEL_71:

              [v90 saveAccount:v88 verifyCredentials:0 completion:0];
LABEL_83:

              uint64_t v44 = 0LL;
              goto LABEL_84;
            }

            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v55,  4LL));
            free(v55);
            v82 = v50;
            SSFileLog(v48, @"%@");
          }

          goto LABEL_71;
        }

        if (([v25 isEqual:v33] & 1) == 0)
        {
          id v34 = (id)objc_claimAutoreleasedReturnValue( -[PurchaseManagerOperation _familyPurchaserAccountIdentifierForApplication:]( self,  "_familyPurchaserAccountIdentifierForApplication:",  v91));
          if (v34)
          {
LABEL_47:
            __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase buyParameters](self->_purchase, "buyParameters"));
            id v36 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v35,  "stringByAppendingFormat:",  @"&ownerDsid=%llu",  objc_msgSend(v34, "unsignedLongLongValue")));

            -[SSPurchase setBuyParameters:](self->_purchase, "setBuyParameters:", v36);
            v25 = 0LL;
            goto LABEL_54;
          }

          uint64_t v37 = objc_alloc_init(&OBJC_CLASS___FamilyCircleOperation);
          if (-[PurchaseManagerOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v37,  0LL))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleOperation familyCircle](v37, "familyCircle"));
            v39 = (void *)objc_claimAutoreleasedReturnValue([v38 allITunesIdentifiers]);

            if ([v39 containsObject:v25])
            {
              id v34 = v25;

              goto LABEL_47;
            }
          }
        }

        -[SSPurchase setAccountIdentifier:](self->_purchase, "setAccountIdentifier:", v25);
        goto LABEL_54;
      }

      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      v82 = v21;
      SSFileLog(v19, @"%@");
    }

    goto LABEL_27;
  }

- (void)_performTeardownWithResult:(BOOL)a3 queueResponse:(id)a4
{
  id v6 = a4;
  purchase = self->_purchase;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SSTonePurchase);
  if ((objc_opt_isKindOfClass(purchase, v8) & 1) != 0)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___RingtonePurchaseStore);
    if (a3)
    {
      char v14 = self->_purchase;
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 downloads]);
      -[RingtonePurchaseStore updateRingtonesForPurchases:withDownloads:]( v9,  "updateRingtonesForPurchases:withDownloads:",  v10,  v11);
    }

    else
    {
      char v15 = self->_purchase;
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      -[RingtonePurchaseStore removeRingtonesForPurchases:](v9, "removeRingtonesForPurchases:", v10);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SSPurchase valueForDownloadProperty:]( self->_purchase,  "valueForDownloadProperty:",  SSDownloadPropertyKind));
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadController controller](&OBJC_CLASS___DownloadController, "controller"));
    [v13 endUsingNetworkForDownloadKind:v12];
  }
}

- (id)_personalizedRedownloadParametersForPurchase:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);

  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SSLookupProperties);
    -[SSLookupProperties setKeyProfile:](v6, "setKeyProfile:", @"offer");
    -[SSLookupProperties setTimeoutInterval:](v6, "setTimeoutInterval:", &off_10036E458);
    -[SSLookupProperties setValue:forRequestParameter:]( v6,  "setValue:forRequestParameter:",  @"itunesstored",  SSLookupParameterCaller);
    -[SSLookupProperties setValue:forRequestParameter:]( v6,  "setValue:forRequestParameter:",  v5,  SSLookupParameterItemIdentifiers);
    -[SSLookupProperties setValue:forRequestParameter:]( v6,  "setValue:forRequestParameter:",  @"1",  SSLookupParameterProtocolVersion);
    v7 = -[LookupRequestOperation initWithLookupProperties:]( objc_alloc(&OBJC_CLASS___LookupRequestOperation),  "initWithLookupProperties:",  v6);
    -[LookupRequestOperation setPersonalizationStyle:](v7, "setPersonalizationStyle:", 0LL);
    id v8 = 0LL;
    if (-[PurchaseManagerOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  0LL))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[LookupRequestOperation lookupResponse](v7, "lookupResponse"));
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemForKey:v5]);

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 offers]);
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        unsigned int v21 = v10;
        id v22 = v5;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "offerType", v21, v22, (void)v23));
            unsigned int v18 = [v17 isEqualToString:@"redownload"];

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue([v16 buyParameters]);
              id v8 = [v19 copy];

              goto LABEL_14;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        id v8 = 0LL;
LABEL_14:
        BOOL v10 = v21;
        id v5 = v22;
      }

      else
      {
        id v8 = 0LL;
      }
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_showDialogForPurchase:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v10 = -[ISDialog initWithError:](objc_alloc(&OBJC_CLASS___ISDialog), "initWithError:", v5);

  v7 = -[DaemonDialogOperation initWithDialog:](objc_alloc(&OBJC_CLASS___DaemonDialogOperation), "initWithDialog:", v10);
  id v8 = [v6 displaysOnLockScreen];

  -[DaemonDialogOperation setDisplaysOnLockscreen:](v7, "setDisplaysOnLockscreen:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v9 addOperation:v7];
}

- (void)_updateAccount:(id)a3 withPurchaseResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountWithUniqueIdentifier:v7]);

  id v10 = [v9 copy];
  if (!v10) {
    goto LABEL_22;
  }
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"newCustomer"]);
  id v12 = (void *)v11;
  if (!v11)
  {
    id v13 = 0LL;
    goto LABEL_6;
  }

  if ((objc_opt_respondsToSelector(v11, "BOOLValue") & 1) != 0)
  {
    id v13 = [v12 BOOLValue];
LABEL_6:
    [v10 setNewCustomer:v13];
  }

  id v33 = v6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"passwordSettings"]);
  char v15 = v14;
  if (v14)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"free"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:@"paid"]);
    int64_t v18 = +[UpdateAccountPasswordSettingsOperation _accountPasswordSettingValueForServerValue:]( &OBJC_CLASS___UpdateAccountPasswordSettingsOperation,  "_accountPasswordSettingValueForServerValue:",  v16);
    int64_t v19 = +[UpdateAccountPasswordSettingsOperation _accountPasswordSettingValueForServerValue:]( &OBJC_CLASS___UpdateAccountPasswordSettingsOperation,  "_accountPasswordSettingValueForServerValue:",  v17);
    [v10 setFreeDownloadsPasswordSetting:v18];
    [v10 setPaidPurchasesPasswordSetting:v19];
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
  if (!v20) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v21 = [v20 shouldLog];
  else {
    unsigned int v22 = v21;
  }
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v22 & 2;
  }
  if ((_DWORD)v24)
  {
    __int128 v25 = (void *)objc_opt_class(self);
    id v32 = v25;
    __int128 v26 = v12;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 accountName]);
    uint64_t v28 = SSHashIfNeeded(v27);
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    int v34 = 138543618;
    __int16 v35 = v25;
    __int16 v36 = 2114;
    uint64_t v37 = v29;
    v30 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%{public}@: Setting an account's password settings. Saving %{public}@.",  &v34,  22);

    id v12 = v26;
    if (v30)
    {
      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
      free(v30);
      SSFileLog(v20, @"%@");
    }
  }

  else
  {
  }

  [v8 saveAccount:v10 verifyCredentials:0 completion:0];
  id v6 = v33;
LABEL_22:
}

- (id)_urlBagKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SSPurchase valueForDownloadProperty:]( self->_purchase,  "valueForDownloadProperty:",  SSDownloadPropertyStorePreorderIdentifier));
  uint64_t v4 = SSGetItemIdentifierFromValue(v3);

  if (v4)
  {
    id v5 = @"p2-order-pre-order";
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase requestProperties](self->_purchase, "requestProperties"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 URLBagKey]);
  }

  return v5;
}

- (id)remoteAuthenticationHandler
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setRemoteAuthenticationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end