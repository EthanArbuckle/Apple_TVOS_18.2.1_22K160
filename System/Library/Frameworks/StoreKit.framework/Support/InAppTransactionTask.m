@interface InAppTransactionTask
- (AppleIDAuthorizationRequestInfo)siwaAuthorizationInfo;
- (BOOL)excludeReceiptFromRequest;
- (BOOL)forceAuthentication;
- (BOOL)hideConfirmation;
- (BOOL)isProcessingInterruptedBuy;
- (BOOL)isStoreKitViewInitiated;
- (BOOL)isStoreOriginated;
- (BOOL)privacyAcknowledgementRequired;
- (BOOL)shouldInstallParentAppWithBuyParams:(id)a3;
- (BOOL)simulateAskToBuy;
- (DialogProtocol)dialogContext;
- (InAppTransactionTask)initWithBuyParams:(id)a3 client:(id)a4 apiVersion:(int64_t)a5;
- (InAppTransactionTask)initWithProductIdentifier:(id)a3 quantity:(unint64_t)a4 client:(id)a5 apiVersion:(int64_t)a6;
- (NSData)requestData;
- (NSDictionary)additionalBuyParams;
- (NSDictionary)customBuyParams;
- (NSDictionary)response;
- (NSDictionary)transaction;
- (NSNumber)discountTimestamp;
- (NSString)appAccountToken;
- (NSString)applicationUsername;
- (NSString)discountIdentifier;
- (NSString)discountKeyIdentifier;
- (NSString)discountNonceString;
- (NSString)discountSignature;
- (NSString)logKey;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)presentingSceneID;
- (NSString)productIdentifier;
- (NSString)productKind;
- (NSString)serverCorrelationIdentifier;
- (NSString)subscriptionPeriod;
- (NSString)winbackOfferIdentifier;
- (NSURL)receiptInstallURL;
- (SKPaymentDelegateProtocol)paymentDelegate;
- (_TtC9storekitd6Client)client;
- (id)_authenticateWithAccountInfo:(id)a3 error:(id *)a4;
- (id)_processPurchaseResult:(id)a3 authorizationResult:(id)a4;
- (int64_t)apiVersion;
- (unint64_t)quantity;
- (void)_cacheLegacyTransaction;
- (void)_latestTransactionWithCompletion:(id)a3;
- (void)_performWithBuyParams:(id)a3;
- (void)buyParams:(BOOL)a3 completionHandler:(id)a4;
- (void)clearTransactionCache;
- (void)main;
- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
- (void)purchaseIntakeWithMetrics:(id)a3;
- (void)setAdditionalBuyParams:(id)a3;
- (void)setAppAccountToken:(id)a3;
- (void)setApplicationUsername:(id)a3;
- (void)setCustomBuyParams:(id)a3;
- (void)setDialogContext:(id)a3;
- (void)setDiscountIdentifier:(id)a3;
- (void)setDiscountKeyIdentifier:(id)a3;
- (void)setDiscountNonceString:(id)a3;
- (void)setDiscountSignature:(id)a3;
- (void)setDiscountTimestamp:(id)a3;
- (void)setExcludeReceiptFromRequest:(BOOL)a3;
- (void)setForceAuthentication:(BOOL)a3;
- (void)setHideConfirmation:(BOOL)a3;
- (void)setIsProcessingInterruptedBuy:(BOOL)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentDelegate:(id)a3;
- (void)setPresentingSceneID:(id)a3;
- (void)setPrivacyAcknowledgementRequired:(BOOL)a3;
- (void)setProductKind:(id)a3;
- (void)setReceiptInstallURL:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSimulateAskToBuy:(BOOL)a3;
- (void)setSiwaAuthorizationInfo:(id)a3;
- (void)setStoreOriginated:(BOOL)a3;
- (void)setStorekitViewInitiated:(BOOL)a3;
- (void)setSubscriptionPeriod:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setWinbackOfferIdentifier:(id)a3;
@end

@implementation InAppTransactionTask

- (InAppTransactionTask)initWithBuyParams:(id)a3 client:(id)a4 apiVersion:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 parameterForKey:@"offerName"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 parameterForKey:@"quantity"]);
  id v12 = [v11 integerValue];

  v13 = -[InAppTransactionTask initWithProductIdentifier:quantity:client:apiVersion:]( self,  "initWithProductIdentifier:quantity:client:apiVersion:",  v10,  v12,  v9,  a5);
  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 dictionary]);
    v15 = *(NSString **)((char *)&v13->_logKey + 2);
    *(NSString **)((char *)&v13->_logKey + 2) = (NSString *)v14;

    *(&v13->super.super._success + 2) = 0;
  }

  return v13;
}

- (InAppTransactionTask)initWithProductIdentifier:(id)a3 quantity:(unint64_t)a4 client:(id)a5 apiVersion:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___InAppTransactionTask;
  v13 = -[Task init](&v18, "init");
  uint64_t v14 = v13;
  if (v13)
  {
    *(void *)(v13 + 66) = a6;
    objc_storeStrong((id *)(v13 + 74), a5);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKeyWithAPIVersion:](&OBJC_CLASS___NSUUID, "lib_shortLogKeyWithAPIVersion:", a6));
    v16 = *(void **)(v14 + 82);
    *(void *)(v14 + 82) = v15;

    v14[62] = 1;
    objc_storeStrong((id *)(v14 + 90), a3);
    *(void *)(v14 + 98) = a4;
    v14[65] = 0;
    v14[58] = 0;
    v14[42] = 1;
  }

  return (InAppTransactionTask *)v14;
}

- (void)main
{
  if (qword_10032DF88 != -1) {
    dispatch_once(&qword_10032DF88, &stru_1002E76E8);
  }
  v3 = (void *)qword_10032DF58;
  if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    id v12 = (id)objc_opt_class(self);
    id v6 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Started task",  buf,  0x16u);
  }

  uint64_t v7 = *((unsigned __int8 *)&self->super.super._success + 2);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100019104;
  v8[3] = &unk_1002E75B0;
  v8[4] = self;
  -[InAppTransactionTask buyParams:completionHandler:](self, "buyParams:completionHandler:", v7, v8);
}

- (void)_performWithBuyParams:(id)a3
{
  id v143 = a3;
  v148 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](self, "client"));
  v141 = (void *)objc_claimAutoreleasedReturnValue([v4 bag]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
  v144 = (void *)objc_claimAutoreleasedReturnValue([v5 account]);

  if (v144)
  {
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "ams_storefront"));
    goto LABEL_3;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountMediaType]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ams_localiTunesAccountForAccountMediaType:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 resultWithError:0]);

  if (v26) {
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ams_storefront"));
  }
  else {
    v142 = 0LL;
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
  unsigned int v59 = [v58 isBeta];

  if (!v59)
  {
    id v68 = 0LL;
    goto LABEL_64;
  }

  if (qword_10032DF88 != -1) {
    dispatch_once(&qword_10032DF88, &stru_1002E76E8);
  }
  v60 = (os_log_s *)(id)qword_10032DF58;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
    *(_DWORD *)buf = 138543362;
    v164 = v61;
    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] TF account not detected.",  buf,  0xCu);
  }

  id v62 = AMSAccountMediaTypeProduction;
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v62));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "ams_activeiTunesAccount"));

  if (!v64)
  {
    id v68 = 0LL;
LABEL_63:

LABEL_64:
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
    BOOL v71 = objc_msgSend(v70, "objc_clientType") == 3;

    if (v71)
    {
      uint64_t v54 = 0LL;
    }

    else
    {
      id v160 = v68;
      uint64_t v54 = objc_claimAutoreleasedReturnValue( -[InAppTransactionTask _authenticateWithAccountInfo:error:]( v148,  "_authenticateWithAccountInfo:error:",  0LL,  &v160));
      id v72 = v160;

      [v143 setParameter:&__kCFBooleanTrue forKey:AMSBuyParamPropertyHasBeenAuthedForBuy];
      id v68 = v72;
    }

    goto LABEL_67;
  }

  if (qword_10032DF88 != -1) {
    dispatch_once(&qword_10032DF88, &stru_1002E76E8);
  }
  v65 = (os_log_s *)(id)qword_10032DF58;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
    *(_DWORD *)buf = 138543362;
    v164 = v66;
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Attempting to use existing account.",  buf,  0xCu);
  }

  id v161 = 0LL;
  uint64_t v67 = objc_claimAutoreleasedReturnValue( -[InAppTransactionTask _authenticateWithAccountInfo:error:]( v148,  "_authenticateWithAccountInfo:error:",  v64,  &v161));
  id v68 = v161;
  if (!v67) {
    goto LABEL_63;
  }
  [v143 setParameter:&__kCFBooleanTrue forKey:AMSBuyParamPropertyHasBeenAuthedForBuy];

  uint64_t v54 = v67;
LABEL_67:
  id v145 = v68;
  if (v68)
  {
    v138 = 0LL;
    v140 = 0LL;
    goto LABEL_69;
  }

  v144 = (void *)v54;
LABEL_3:
  *(void *)v175 = 0LL;
  *(void *)&v175[8] = v175;
  *(void *)&v175[16] = 0x2020000000LL;
  char v176 = 1;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "ams_storefront"));
  if (v6 && ([v142 isEqualToString:v6] & 1) == 0)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    id v8 = *(NSError **)((char *)&v148->super.super._error + 2);
    v157[0] = _NSConcreteStackBlock;
    v157[1] = 3221225472LL;
    v157[2] = sub_10001A848;
    v157[3] = &unk_1002E75D8;
    v159 = v175;
    id v9 = v7;
    v158 = v9;
    [v8 shouldContinueTransactionWithNewStorefront:v142 replyBlock:v157];
    dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_semaphore_wait(v9, v10) >= 1)
    {
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      __int16 v11 = (os_log_s *)(id)qword_10032DF58;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
        v131 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
        v132 = (void *)objc_claimAutoreleasedReturnValue([v131 requestBundleID]);
        *(_DWORD *)buf = 138543618;
        v164 = v130;
        __int16 v165 = 2114;
        v166 = v132;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[%{public}@] shouldContinueTransaction timed out for bundle ID: %{public}@. Not continuing transaction.",  buf,  0x16u);
      }

      *(_BYTE *)(*(void *)&v175[8] + 24LL) = 0;
    }
  }

  if (!*(_BYTE *)(*(void *)&v175[8] + 24LL))
  {
    uint64_t v69 = ASDErrorWithDescription(ASDErrorDomain, 1054LL, @"Product is not available in the current storefront");
    id v145 = (id)objc_claimAutoreleasedReturnValue(v69);
    v140 = 0LL;
    v138 = 0LL;
  }

  else
  {
LABEL_15:
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      v21 = -[AMSPurchase initWithPurchaseType:buyParams:]( objc_alloc(&OBJC_CLASS___AMSPurchase),  "initWithPurchaseType:buyParams:",  3LL,  v143);
    }

    else
    {
      uint64_t v14 = -[AMSPurchaseSIWA initWithPurchaseType:buyParams:]( objc_alloc(&OBJC_CLASS___AMSPurchaseSIWA),  "initWithPurchaseType:buyParams:",  3LL,  v143);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 teamID]);
      -[AMSPurchaseSIWA setTeamID:](v14, "setTeamID:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientID]);
      -[AMSPurchaseSIWA setBundleID:](v14, "setBundleID:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceID]);
      -[AMSPurchaseSIWA setServiceID:](v14, "setServiceID:", v20);

      v21 = v14;
    }

    -[AMSPurchase setAccount:](v21, "setAccount:", v144);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](v148, "client"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 processInfo]);
    -[AMSPurchase setClientInfo:](v21, "setClientInfo:", v28);

    -[AMSPurchase setUserInitiated:](v21, "setUserInitiated:", 1LL);
    -[AMSPurchase setSendBlindedData:](v21, "setSendBlindedData:", 1LL);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
    -[AMSPurchase setLogUUID:](v21, "setLogUUID:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask presentingSceneID](v148, "presentingSceneID"));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask presentingSceneID](v148, "presentingSceneID"));
      -[AMSPurchase setPresentingSceneIdentifier:](v21, "setPresentingSceneIdentifier:", v31);
    }

    uint64_t v32 = *(void *)(&v148->_generateBuyParams + 2);
    if (v32 != 1)
    {
      v173 = @"X-Apple-Client-StoreKit-Version";
      v33 = sub_100026E88(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v174 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v174,  &v173,  1LL));
      -[AMSPurchase setAdditionalHeaders:](v21, "setAdditionalHeaders:", v35);
    }

    uint64_t v36 = objc_opt_class(&OBJC_CLASS___AMSPurchaseSIWA);
    if ((objc_opt_isKindOfClass(v21, v36) & 1) != 0)
    {
      id v37 = [[AMSPurchaseSIWATask alloc] initWithPurchaseSIWA:v21 bag:v141];
      [v37 setDelegate:v148];
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      v38 = (os_log_s *)(id)qword_10032DF58;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
        v146 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](v148, "productIdentifier"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 teamID]);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 clientID]);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask siwaAuthorizationInfo](v148, "siwaAuthorizationInfo"));
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 serviceID]);
        *(_DWORD *)buf = 138544386;
        v164 = v39;
        __int16 v165 = 2114;
        v166 = v146;
        __int16 v167 = 2114;
        v168 = v41;
        __int16 v169 = 2114;
        v170 = v43;
        __int16 v171 = 2114;
        v172 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Running auth payment for %{public}@ with teamID: %{public}@ clientID: %{public}@ serviceID: %{public}@",  buf,  0x34u);
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue([v37 performPurchaseSIWA]);
      id v156 = 0LL;
      id v47 = (id)objc_claimAutoreleasedReturnValue([v46 resultWithError:&v156]);
      id v145 = v156;

      v140 = (void *)objc_claimAutoreleasedReturnValue([v47 authorizationResult]);
      v138 = (void *)objc_claimAutoreleasedReturnValue([v47 purchaseResult]);
      if (!v140)
      {
        if (qword_10032DF88 != -1) {
          dispatch_once(&qword_10032DF88, &stru_1002E76E8);
        }
        v48 = (os_log_s *)(id)qword_10032DF58;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](v148, "productIdentifier"));
          sub_10025BDF0(v49, v50, (uint64_t)buf, v48);
        }
      }
    }

    else
    {
      id v47 = [[AMSPurchaseTask alloc] initWithPurchase:v21 bag:v141];
      [v47 setDelegate:v148];
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      v51 = (os_log_s *)(id)qword_10032DF58;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](v148, "productIdentifier"));
        *(_DWORD *)buf = 138543618;
        v164 = v52;
        __int16 v165 = 2112;
        v166 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Running payment for %@",  buf,  0x16u);
      }

      id v37 = (id)objc_claimAutoreleasedReturnValue([v47 performPurchase]);
      id v155 = 0LL;
      v138 = (void *)objc_claimAutoreleasedReturnValue([v37 resultWithError:&v155]);
      id v145 = v155;
      v140 = 0LL;
    }
  }

  uint64_t v54 = (uint64_t)v144;
  _Block_object_dispose(v175, 8);
  if (!v145)
  {
    if (qword_10032DF88 != -1) {
      dispatch_once(&qword_10032DF88, &stru_1002E76E8);
    }
    v55 = (void *)qword_10032DF58;
    if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_DEFAULT))
    {
      v56 = v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](v148, "logKey"));
      *(_DWORD *)v175 = 138543362;
      *(void *)&v175[4] = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "[%{public}@] Payment complete", v175, 0xCu);
    }

    id v145 = (id)objc_claimAutoreleasedReturnValue( -[InAppTransactionTask _processPurchaseResult:authorizationResult:]( v148,  "_processPurchaseResult:authorizationResult:",  v138,  v140));
    goto LABEL_159;
  }

- (void)clearTransactionCache
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[ReceiptManager managerForClient:]( &OBJC_CLASS___ReceiptManager,  "managerForClient:",  *(SKPaymentDelegateProtocol **)((char *)&self->_paymentDelegate + 2)));
  [v2 invalidateLegacyTransactionCache];
}

- (id)_authenticateWithAccountInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_10001AEAC;
  v49 = sub_10001AEBC;
  id v50 = 0LL;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_10001AEAC;
  v43 = sub_10001AEBC;
  id v44 = 0LL;
  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask dialogContext](self, "dialogContext"));
  BOOL v8 = v7 == 0LL;

  if (v8)
  {
    if (qword_10032DF88 != -1) {
      dispatch_once(&qword_10032DF88, &stru_1002E76E8);
    }
    v24 = (os_log_s *)(id)qword_10032DF58;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543362;
      v52 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No client available to handle authentication request",  buf,  0xCu);
    }

    uint64_t v26 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle authentication request");
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    id v12 = (id)v46[5];
    v46[5] = v27;
  }

  else
  {
    if (qword_10032DF88 != -1) {
      dispatch_once(&qword_10032DF88, &stru_1002E76E8);
    }
    id v9 = (os_log_s *)(id)qword_10032DF58;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](self, "productIdentifier"));
      *(_DWORD *)buf = 138543618;
      v52 = v10;
      __int16 v53 = 2114;
      uint64_t v54 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Sending authentication request for %{public}@",  buf,  0x16u);
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](self, "client"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 processInfo]);
    [v12 setClientInfo:v14];

    [v12 setDebugReason:@"In App"];
    if (v6) {
      [v12 setAuthenticationType:0];
    }
    uint64_t v15 = objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_altDSID"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    v19 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]( v15,  "initWithDSID:altDSID:username:options:",  v16,  v17,  v18,  v12);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
    -[AMSAuthenticateRequest setLogKey:](v19, "setLogKey:", v20);

    dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask dialogContext](self, "dialogContext"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10001AEC4;
    v35[3] = &unk_1002E7628;
    id v37 = &v39;
    v38 = &v45;
    v23 = v21;
    uint64_t v36 = v23;
    [v22 handleAuthenticateRequest:v19 completionHandler:v35];

    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([(id)v40[5] account]);
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v40[5] account]);
  }

  else
  {
    if (qword_10032DF88 != -1) {
      dispatch_once(&qword_10032DF88, &stru_1002E76E8);
    }
    v30 = (os_log_s *)(id)qword_10032DF58;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](self, "productIdentifier"));
      uint64_t v34 = v46[5];
      *(_DWORD *)buf = 138543874;
      v52 = v32;
      __int16 v53 = 2114;
      uint64_t v54 = v33;
      __int16 v55 = 2114;
      uint64_t v56 = v34;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "[%{public}@] No account for %{public}@: %{public}@",  buf,  0x20u);
    }

    v29 = 0LL;
    if (a4) {
      *a4 = (id) v46[5];
    }
  }

  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v29;
}

- (id)_processPurchaseResult:(id)a3 authorizationResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (NSString *)objc_claimAutoreleasedReturnValue([v6 responseDictionary]);
  id v9 = *(NSString **)((char *)&self->_winbackOfferIdentifier + 2);
  *(NSString **)((char *)&self->_winbackOfferIdentifier + 2) = v8;

  dispatch_time_t v10 = (NSURL *)objc_claimAutoreleasedReturnValue([v6 correlationID]);
  __int16 v11 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
  *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v12)
  {
    if (qword_10032DF88 != -1) {
      dispatch_once(&qword_10032DF88, &stru_1002E76E8);
    }
    BOOL v13 = (void *)qword_10032DF58;
    if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_ERROR)) {
      sub_10025C2A0(v13, self);
    }
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 error]);
    goto LABEL_7;
  }

  if (!v7 || (v16 = (void *)objc_claimAutoreleasedReturnValue([v7 error]), v16, !v16))
  {
LABEL_18:
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 responseDictionary]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](self, "client"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask receiptInstallURL](self, "receiptInstallURL"));
    uint64_t v26 = -[InAppTransactionTask apiVersion](self, "apiVersion");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
    id v28 = sub_100025EEC(v23, v24, v25, v26, v27, 1, *((unsigned __int8 *)&self->_generateBuyParams + 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (![v29 count])
    {
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      v43 = (void *)qword_10032DF58;
      if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_ERROR)) {
        sub_10025BE54(v43);
      }
      uint64_t v44 = ASDErrorWithDescription(ASDErrorDomain, 825LL, @"No transactions in response");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v44);
      goto LABEL_67;
    }

    if ((unint64_t)[v29 count] >= 2)
    {
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      v30 = (void *)qword_10032DF58;
      if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        uint64_t v32 = (InAppTransactionTask *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
        *(_DWORD *)buf = 138543618;
        v76 = v32;
        __int16 v77 = 2112;
        v78 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Payment received more than one transaction: %@ Using only the first.",  buf,  0x16u);
      }
    }

    if (v7)
    {
      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      v33 = (void *)qword_10032DF58;
      if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
        *(_DWORD *)buf = 138543618;
        v76 = self;
        __int16 v77 = 2114;
        v78 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] Processing auth result.",  buf,  0x16u);
      }

      uint64_t v36 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
      v38 = -[NSMutableDictionary initWithDictionary:](v36, "initWithDictionary:", v37);

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
        uint64_t v41 = ASDErrorWithSafeUserInfo(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v42, off_100327EB8[0]);

LABEL_57:
        v65 = (NSString *)-[NSMutableDictionary copy](v38, "copy");
        v66 = *(NSString **)((char *)&self->_subscriptionPeriod + 2);
        *(NSString **)((char *)&self->_subscriptionPeriod + 2) = v65;

        goto LABEL_58;
      }

      id v50 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizationCredential]);

      if (v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizationCredential]);
        uint64_t v52 = objc_opt_class(&OBJC_CLASS___AKAuthorizationCredential);
        char isKindOfClass = objc_opt_isKindOfClass(v51, v52);

        if ((isKindOfClass & 1) != 0)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizationCredential]);
          id v74 = 0LL;
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v40,  1LL,  &v74));
          id v55 = v74;
          id v56 = sub_1000190C4();
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          v58 = v57;
          if (v55 || !v54)
          {
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
              sub_10025C0B8(self, (uint64_t)v55, v58);
            }

            uint64_t v71 = ASDErrorWithSafeUserInfo(v55);
            id v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v72,  off_100327EB8[0]);
          }

          else
          {
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v73 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask logKey](self, "logKey"));
              *(_DWORD *)buf = 138543618;
              v76 = self;
              __int16 v77 = 2114;
              v78 = v73;
              _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] Received credential",  buf,  0x16u);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v54,  off_100327EB8[0]);
          }

          goto LABEL_57;
        }

        id v62 = sub_1000190C4();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          sub_10025C168(self, v63);
        }

        uint64_t v48 = ASDErrorDomain;
        v49 = @"Invalid credential format in response";
      }

      else
      {
        id v60 = sub_1000190C4();
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10025C028(self, v61);
        }

        uint64_t v48 = ASDErrorDomain;
        v49 = @"Received SiWA purchase result without a credential or error";
      }
    }

    else
    {
      if (!*(NSString **)((char *)&self->_appAccountToken + 2))
      {
        unsigned int v59 = (NSString *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
        v38 = *(NSMutableDictionary **)((char *)&self->_subscriptionPeriod + 2);
        *(NSString **)((char *)&self->_subscriptionPeriod + 2) = v59;
LABEL_58:

        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask transaction](self, "transaction"));
        if (v67)
        {
          id v68 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"metrics"]);
          if (v68)
          {
            -[InAppTransactionTask purchaseIntakeWithMetrics:](self, "purchaseIntakeWithMetrics:", v68);
          }

          else
          {
            if (qword_10032DF88 != -1) {
              dispatch_once(&qword_10032DF88, &stru_1002E76E8);
            }
            uint64_t v69 = (void *)qword_10032DF58;
            if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_FAULT)) {
              sub_10025BEF0((uint64_t)self, v69);
            }
          }

          -[InAppTransactionTask _cacheLegacyTransaction](self, "_cacheLegacyTransaction", v73);
        }

        uint64_t v15 = 0LL;
LABEL_67:

        goto LABEL_68;
      }

      if (qword_10032DF88 != -1) {
        dispatch_once(&qword_10032DF88, &stru_1002E76E8);
      }
      uint64_t v45 = (void *)qword_10032DF58;
      if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_ERROR)) {
        sub_10025BF90((uint64_t)self, v45);
      }
      v46 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
      v38 = -[NSMutableDictionary initWithDictionary:](v46, "initWithDictionary:", v47);

      uint64_t v48 = ASDErrorDomain;
      v49 = @"Auth purchase completed without a result.";
    }

    uint64_t v64 = ASDErrorWithTitleAndMessage(v48, 507LL, v49, 0LL);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v64);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v40, off_100327EB8[0]);
    goto LABEL_57;
  }

  if (qword_10032DF88 != -1) {
    dispatch_once(&qword_10032DF88, &stru_1002E76E8);
  }
  v17 = (void *)qword_10032DF58;
  if (os_log_type_enabled((os_log_t)qword_10032DF58, OS_LOG_TYPE_ERROR)) {
    sub_10025C1F8(v17, self);
  }
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
  if (([v19 isEqualToString:AKAppleIDAuthenticationErrorDomain] & 1) == 0)
  {

    goto LABEL_18;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
  id v21 = [v20 code];

  if (v21 != (id)-7003LL) {
    goto LABEL_18;
  }
  uint64_t v22 = ASDErrorWithDescription(ASDErrorDomain, 912LL, @"Auth payment was cancelled");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v22);
LABEL_7:
  uint64_t v15 = (void *)v14;
LABEL_68:

  return v15;
}

- (void)_cacheLegacyTransaction
{
  v3 = objc_alloc(&OBJC_CLASS___InAppReceiptDatabaseStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userDatabase]);
  id v6 = -[SQLiteDatabaseStore initWithDatabase:](v3, "initWithDatabase:", v5);

  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_10001AEAC;
  v16 = sub_10001AEBC;
  id v17 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001B9C8;
  v11[3] = &unk_1002E7158;
  v11[4] = self;
  v11[5] = &v12;
  -[SQLiteDatabaseStore readUsingSession:](v6, "readUsingSession:", v11);
  id v7 = (void *)v13[5];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](self, "client"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentAccountToken]);
  LODWORD(v7) = [v7 isEqualToString:v9];

  if ((_DWORD)v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001BA50;
    v10[3] = &unk_1002E6FC8;
    v10[4] = self;
    -[SQLiteDatabaseStore modifyUsingTransaction:](v6, "modifyUsingTransaction:", v10);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_latestTransactionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask client](self, "client"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v5));

  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = sub_10001AEAC;
  v16[4] = sub_10001AEBC;
  id v17 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppTransactionTask productIdentifier](self, "productIdentifier"));
  uint64_t v14 = v16;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001BCB8;
  v15[3] = &unk_1002E7650;
  v15[4] = v16;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001BCEC;
  v10[3] = &unk_1002E76C8;
  id v8 = v4;
  id v13 = v8;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = self;
  [v9 enumerateReceiptsForProductID:v7 usingBlock:v15 completionHandler:v10];

  _Block_object_dispose(v16, 8);
}

- (int64_t)apiVersion
{
  return *(void *)(&self->_generateBuyParams + 2);
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_paymentDelegate + 2);
}

- (NSString)logKey
{
  return *(NSString **)&self->_forceAuthentication;
}

- (NSString)productIdentifier
{
  return *(NSString **)((char *)&self->_apiVersion + 2);
}

- (unint64_t)quantity
{
  return *(unint64_t *)((char *)&self->_client + 2);
}

- (NSDictionary)additionalBuyParams
{
  return *(NSDictionary **)((char *)&self->_logKey + 2);
}

- (void)setAdditionalBuyParams:(id)a3
{
}

- (NSString)appAccountToken
{
  return *(NSString **)((char *)&self->_productIdentifier + 2);
}

- (void)setAppAccountToken:(id)a3
{
}

- (NSString)applicationUsername
{
  return *(NSString **)((char *)&self->_quantity + 2);
}

- (void)setApplicationUsername:(id)a3
{
}

- (DialogProtocol)dialogContext
{
  return *(DialogProtocol **)((char *)&self->_additionalBuyParams + 2);
}

- (void)setDialogContext:(id)a3
{
}

- (SKPaymentDelegateProtocol)paymentDelegate
{
  return *(SKPaymentDelegateProtocol **)((char *)&self->super.super._error + 2);
}

- (void)setPaymentDelegate:(id)a3
{
}

- (AppleIDAuthorizationRequestInfo)siwaAuthorizationInfo
{
  return *(AppleIDAuthorizationRequestInfo **)((char *)&self->_appAccountToken + 2);
}

- (void)setSiwaAuthorizationInfo:(id)a3
{
}

- (NSString)presentingSceneID
{
  return *(NSString **)((char *)&self->_applicationUsername + 2);
}

- (void)setPresentingSceneID:(id)a3
{
}

- (BOOL)isStoreKitViewInitiated
{
  return *(&self->super._finished + 1);
}

- (void)setStorekitViewInitiated:(BOOL)a3
{
  *(&self->super._finished + 1) = a3;
}

- (NSDictionary)customBuyParams
{
  return *(NSDictionary **)((char *)&self->_dialogContext + 2);
}

- (void)setCustomBuyParams:(id)a3
{
}

- (NSString)discountIdentifier
{
  return *(NSString **)((char *)&self->_siwaAuthorizationInfo + 2);
}

- (void)setDiscountIdentifier:(id)a3
{
}

- (NSString)discountKeyIdentifier
{
  return *(NSString **)((char *)&self->_presentingSceneID + 2);
}

- (void)setDiscountKeyIdentifier:(id)a3
{
}

- (NSString)discountNonceString
{
  return *(NSString **)((char *)&self->_customBuyParams + 2);
}

- (void)setDiscountNonceString:(id)a3
{
}

- (NSString)discountSignature
{
  return *(NSString **)((char *)&self->_discountIdentifier + 2);
}

- (void)setDiscountSignature:(id)a3
{
}

- (NSNumber)discountTimestamp
{
  return *(NSNumber **)((char *)&self->_discountKeyIdentifier + 2);
}

- (void)setDiscountTimestamp:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return *(NSString **)((char *)&self->_discountNonceString + 2);
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (NSString)partnerTransactionIdentifier
{
  return *(NSString **)((char *)&self->_discountSignature + 2);
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
}

- (NSString)productKind
{
  return *(NSString **)((char *)&self->_discountTimestamp + 2);
}

- (void)setProductKind:(id)a3
{
}

- (NSData)requestData
{
  return *(NSData **)((char *)&self->_partnerIdentifier + 2);
}

- (void)setRequestData:(id)a3
{
}

- (NSString)subscriptionPeriod
{
  return *(NSString **)((char *)&self->_partnerTransactionIdentifier + 2);
}

- (void)setSubscriptionPeriod:(id)a3
{
}

- (NSString)winbackOfferIdentifier
{
  return *(NSString **)((char *)&self->_productKind + 2);
}

- (void)setWinbackOfferIdentifier:(id)a3
{
}

- (BOOL)excludeReceiptFromRequest
{
  return *(&self->super._finished + 2);
}

- (void)setExcludeReceiptFromRequest:(BOOL)a3
{
  *(&self->super._finished + 2) = a3;
}

- (BOOL)forceAuthentication
{
  return *(&self->super._finished + 3);
}

- (void)setForceAuthentication:(BOOL)a3
{
  *(&self->super._finished + 3) = a3;
}

- (BOOL)hideConfirmation
{
  return *(&self->super._finished + 4);
}

- (void)setHideConfirmation:(BOOL)a3
{
  *(&self->super._finished + 4) = a3;
}

- (BOOL)privacyAcknowledgementRequired
{
  return *(&self->super._finished + 5);
}

- (void)setPrivacyAcknowledgementRequired:(BOOL)a3
{
  *(&self->super._finished + 5) = a3;
}

- (BOOL)isStoreOriginated
{
  return *(&self->super._finished + 6);
}

- (void)setStoreOriginated:(BOOL)a3
{
  *(&self->super._finished + 6) = a3;
}

- (BOOL)simulateAskToBuy
{
  return self->_generateBuyParams;
}

- (void)setSimulateAskToBuy:(BOOL)a3
{
  self->_generateBuyParams = a3;
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)((char *)&self->_requestData + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (BOOL)isProcessingInterruptedBuy
{
  return *(&self->_generateBuyParams + 1);
}

- (void)setIsProcessingInterruptedBuy:(BOOL)a3
{
  *(&self->_generateBuyParams + 1) = a3;
}

- (NSDictionary)transaction
{
  return *(NSDictionary **)((char *)&self->_subscriptionPeriod + 2);
}

- (void)setTransaction:(id)a3
{
}

- (NSDictionary)response
{
  return *(NSDictionary **)((char *)&self->_winbackOfferIdentifier + 2);
}

- (void)setResponse:(id)a3
{
}

- (NSString)serverCorrelationIdentifier
{
  return *(NSString **)((char *)&self->_receiptInstallURL + 2);
}

- (void).cxx_destruct
{
}

- (BOOL)shouldInstallParentAppWithBuyParams:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_10009472C();

  return v6 & 1;
}

- (void)buyParams:(BOOL)a3 completionHandler:(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1002EB998, 40LL, 7LL);
  *(_BYTE *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  id v8 = self;
  sub_100121B88((uint64_t)&unk_10032A270, v7);
}

- (void)purchaseIntakeWithMetrics:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8);
  swift_bridgeObjectRelease(v3);
}

- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
}

@end