@interface PDInAppPaymentService
- (BOOL)_hasValidSecureElement;
- (PDDatabaseManager)databaseManager;
- (PDInAppPaymentService)initWithConnection:(id)a3;
- (PDInAppPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDInAppPaymentServiceDelegate)delegate;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PKIDSManager)idsManager;
- (PKSecureElement)secureElement;
- (id)_paymentServicesMerchantURLForAPIType:(int64_t)a3;
- (int64_t)_AMPEnrollmentAccountStatus;
- (int64_t)_cardsAvailableForAMPWithCountryCode:(id)a3;
- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5;
- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4;
- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5;
- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 handler:(id)a6;
- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 handler:(id)a4;
- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 handler:(id)a12;
- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 handler:(id)a5;
- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 handler:(id)a4;
- (void)secureElementStatusWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdsManager:(id)a3;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)setSecureElement:(id)a3;
@end

@implementation PDInAppPaymentService

- (PDInAppPaymentService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDInAppPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDInAppPaymentService;
  v8 = -[PDInAppPaymentService initWithConnection:](&v19, "initWithConnection:", v6);
  if (v8)
  {
    v9 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v6);
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    uint64_t v11 = sub_10002A820((uint64_t)v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = sub_100016B80((uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v14;

    uint64_t v16 = PDInAppPaymentServiceInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v6 setExportedInterface:v17];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 handler:(id)a12
{
  BOOL v16 = a4;
  id v18 = a3;
  id v35 = a5;
  id v34 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = @"false";
    if (v16) {
      v26 = @"true";
    }
    *(_DWORD *)buf = 138543618;
    id v50 = v18;
    __int16 v51 = 2114;
    v52 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Received PKPaymentRequest: %{public}@, Remote Payment Request Promised? %{public}@",  buf,  0x16u);
  }

  if ((-[PKEntitlementWhitelist isEntitledForPaymentRequest:]( self->_whitelist,  "isEntitledForPaymentRequest:",  v18) & 1) != 0 || v16)
  {
    id v32 = PDDefaultQueue();
    v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100253134;
    block[3] = &unk_10064FC10;
    block[4] = self;
    id v37 = v18;
    BOOL v45 = v16;
    id v38 = v35;
    id v39 = v34;
    id v40 = v19;
    BOOL v46 = a9;
    id v41 = v21;
    id v42 = v22;
    id v43 = v20;
    id v44 = v23;
    dispatch_async(v33, block);
  }

  else if (v23)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 merchantIdentifier]);
    uint64_t v28 = PKLocalizedPaymentString(@"IN_APP_PAYMENT_ERROR_NO_ENTITLEMENT_FORMAT", @"%@", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  v30));
    (*((void (**)(id, void, void *))v23 + 2))(v23, 0LL, v31);
  }
}

- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments") & 1) != 0
    || (-[PKEntitlementWhitelist inAppPayments](self->_whitelist, "inAppPayments") & 1) != 0
    || -[PKEntitlementWhitelist cardOnFilePayments](self->_whitelist, "cardOnFilePayments"))
  {
    id v11 = PDDefaultQueue();
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002534DC;
    v15[3] = &unk_10063B440;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    dispatch_async(v12, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[PDInAppPaymentService registerPaymentListenerEndpoint:forHostIdentifier:handler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDInAppPaymentService delegate](self, "delegate"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10025370C;
    v11[3] = &unk_10064FC38;
    id v12 = v7;
    [v8 inAppPaymentService:self retrievePaymentListenerEndpointForHostIdentifier:v6 completion:v11];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[PDInAppPaymentService retrievePaymentListenerEndpointForHostIdentifier:handler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 handler:(id)a6
{
  id v35 = a3;
  id v10 = a4;
  id v11 = (char *)a5;
  id v12 = a6;
  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x2020000000LL;
  char v47 = 0;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x3032000000LL;
  v44[3] = sub_100253C18;
  v44[4] = sub_100253C28;
  id v45 = 0LL;
  uint64_t v13 = dispatch_group_create();
  if (!-[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[PDInAppPaymentService merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:handler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    goto LABEL_18;
  }

  -[PDPaymentWebServiceCoordinator updateWebServiceConfigurationWithCompletion:]( self->_paymentWebServiceCoordinator,  "updateWebServiceConfigurationWithCompletion:",  0LL);
  if (-[PDInAppPaymentService _hasValidSecureElement](self, "_hasValidSecureElement"))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryRegion]);

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 inAppPaymentServicesURL]);
    if (v16) {
      goto LABEL_6;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 configuration]);
  uint64_t v19 = PKCurrentRegion();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 paymentServicesURLForRegion:v20]);

  if (v16
    || (v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext")),  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 configuration]),  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "paymentServicesURLForRegion:", @"US")),  v22,  v21,  v16))
  {
LABEL_6:
    id v23 = [[PKPaymentCheckMerchantRequest alloc] initWithMerchantIdentifier:v35 domainName:v10];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 _urlRequestWithServiceURL:v16]);
    if (v24)
    {
      uint64_t v25 = PKLogFacilityTypeGetObject(6LL);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue([v24 URL]);
        *(_DWORD *)buf = 138412290;
        v49 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Performing merchantStatusCheck with URL: %@",  buf,  0xCu);
      }

      if (v11)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "source application secondary identifier set to %@",  buf,  0xCu);
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
        objc_msgSend(v28, "set_sourceApplicationSecondaryIdentifier:", v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v28));
      }

      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
      }

      dispatch_group_enter(v13);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100253C30;
      v40[3] = &unk_10064FC60;
      id v42 = v46;
      id v43 = v44;
      id v41 = v13;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 dataTaskWithRequest:v24 completionHandler:v40]);
      [v31 resume];
    }

LABEL_18:
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100253D88;
  block[3] = &unk_100648798;
  id v37 = v12;
  id v38 = v46;
  id v39 = v44;
  id v34 = v12;
  dispatch_group_notify(v13, v33, block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
}

- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 handler:(id)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100253F38;
  v12[3] = &unk_10064FC88;
  id v6 = a4;
  id v13 = v6;
  id v7 = objc_retainBlock(v12);
  whitelist = self->_whitelist;
  if (a3 == 4)
  {
  }

  else if ((-[PKEntitlementWhitelist supportsWebPayments](whitelist, "supportsWebPayments") & 1) != 0)
  {
LABEL_6:
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDInAppPaymentService _paymentServicesMerchantURLForAPIType:]( self,  "_paymentServicesMerchantURLForAPIType:",  a3));
    goto LABEL_10;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[PDInAppPaymentService paymentServicesMerchantURLForAPIType:handler:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
  }

  id v9 = 0LL;
LABEL_10:
  ((void (*)(void *, BOOL, void *))v7[2])(v7, v9 != 0LL, v9);
}

- (void)secureElementStatusWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, BOOL, void))a3 + 2))( v5,  -[PDInAppPaymentService _hasValidSecureElement](self, "_hasValidSecureElement"),  0LL);
  }

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  if (!a3
    || a3 == 1
    && ((-[PKEntitlementWhitelist inAppPayments](self->_whitelist, "inAppPayments") & 1) != 0
     || -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments")))
  {
    -[PDPaymentWebServiceCoordinator paymentHardwareStatusWithType:completion:]( self->_paymentWebServiceCoordinator,  "paymentHardwareStatusWithType:completion:",  a3,  v6);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDInAppPaymentService paymentHardwareStatusWithType:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v9,  0xCu);
    }

    if (v6) {
      v6[2](v6, 0LL);
    }
  }
}

- (id)_paymentServicesMerchantURLForAPIType:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);

  uint64_t v7 = PKCurrentRegion();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 paymentServicesMerchantURLForRegion:v8]);

  if (!v9) {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 paymentServicesMerchantURLForRegion:@"US"]);
  }
  else {
    id v10 = *(&off_10064FD70 + a3);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v10]);

  return v11;
}

- (BOOL)_hasValidSecureElement
{
  return PKSecureElementIsAvailable(self, a2) != 0;
}

- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, int64_t))a4;
    int64_t v7 = -[PDInAppPaymentService _cardsAvailableForAMPWithCountryCode:]( self,  "_cardsAvailableForAMPWithCountryCode:",  a3);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = PKAMPCardEligibilityStatusToString(v7);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v12 = 136315394;
      id v13 = "-[PDInAppPaymentService cardsAvailableForAMPWithCountryCode:completion:]";
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v12, 0x16u);
    }

    v6[2](v6, v7);
  }

- (int64_t)_cardsAvailableForAMPWithCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = -[PKEntitlementWhitelist AMPCardEnrollment](self->_whitelist, "AMPCardEnrollment");
  if ((_DWORD)v5)
  {
    if (PKSecureElementIsAvailable(v5)
      && (id v6 = +[PKSecureElement isInFailForward](&OBJC_CLASS___PKSecureElement, "isInFailForward"),
          (v6 & 1) == 0))
    {
      if (PKPasscodeEnabled(v6, v7))
      {
        databaseManager = self->_databaseManager;
        id v11 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
        int v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentPassesWithIssuerCountryCodes:]( databaseManager,  "paymentPassesWithIssuerCountryCodes:",  v11));

        if ([v12 count])
        {
          int64_t v8 = -[PDInAppPaymentService _AMPEnrollmentAccountStatus](self, "_AMPEnrollmentAccountStatus");
          if (v8 == 1)
          {
            uint64_t v13 = PDDefaultPaymentPassUniqueIdentifier();
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472LL;
            v17[2] = sub_1002544FC;
            v17[3] = &unk_100644130;
            id v18 = (id)objc_claimAutoreleasedReturnValue(v13);
            id v14 = v18;
            v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectsPassingTest:v17]);
            id v16 = [v15 count];

            if (v16) {
              int64_t v8 = 1LL;
            }
            else {
              int64_t v8 = 8LL;
            }
          }
        }

        else
        {
          int64_t v8 = 5LL;
        }
      }

      else
      {
        int64_t v8 = 2LL;
      }
    }

    else
    {
      int64_t v8 = 4LL;
    }
  }

  else
  {
    int64_t v8 = 0LL;
  }

  return v8;
}

- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    unsigned int v11 = -[PKEntitlementWhitelist AMPCardEnrollment](self->_whitelist, "AMPCardEnrollment");
    unint64_t v12 = -[PDInAppPaymentService _cardsAvailableForAMPWithCountryCode:]( self,  "_cardsAvailableForAMPWithCountryCode:",  v9);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = PKAMPCardEligibilityStatusToString(v12);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AMP card eligibility: %@", buf, 0xCu);
    }

    if (v11)
    {
      if (v12 <= 8 && ((1LL << v12) & 0x182) != 0)
      {
        paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1002547BC;
        v22[3] = &unk_100642480;
        id v23 = (NSError *)v8;
        v24 = self;
        id v25 = v10;
        -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v22);

        id v18 = v23;
LABEL_10:

        goto LABEL_11;
      }

      id v20 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      v27 = @"This device is not currently eligible for enrollment.";
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      id v18 = -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  PKPaymentErrorDomain,  1LL,  v21);
    }

    else
    {
      id v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL);
    }

    id v19 = [[PKAMPCardRegistrationResponse alloc] initWithCardData:0 brokerURL:0 paymentServicesURL:0 error:v18];
    (*((void (**)(id, id))v10 + 2))(v10, v19);

    goto LABEL_10;
  }

- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100254C64;
  v36[3] = &unk_10064FCD8;
  id v10 = a5;
  id v37 = v10;
  unsigned int v11 = objc_retainBlock(v36);
  if ((PKBypassCertValidation() & 1) != 0)
  {
    BOOL v12 = 1;
  }

  else
  {
    uint64_t v13 = PKValidatePaymentMerchantSession(v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v12 = v14 == 0LL;
  }

  else {
    unsigned int v15 = -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess");
  }
  if ((v12 & v15) == 1)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 merchantSessionIdentifier]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
    [v16 appendData:v18];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 nonce]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pk_decodeHexadecimal"));
    [v16 appendData:v20];

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 ampEnrollmentPinning]);
    [v16 appendData:v21];

    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 paymentPass]);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 devicePrimaryInAppPaymentApplication]);
    secureElement = self->_secureElement;
    NSErrorUserInfoKey v26 = (void *)objc_claimAutoreleasedReturnValue([v16 SHA256Hash]);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100254C78;
    v31[3] = &unk_10064FD50;
    v31[4] = self;
    id v32 = v9;
    id v33 = v23;
    id v34 = v24;
    id v35 = v11;
    id v27 = v24;
    id v28 = v23;
    -[PKSecureElement signChallenge:forPaymentApplication:withCompletion:]( secureElement,  "signChallenge:forPaymentApplication:withCompletion:",  v26,  v27,  v31);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v39 = "-[PDInAppPaymentService enrollPaymentPassWithUniqueIdentifier:merchantSession:completion:]";
      __int16 v40 = 1024;
      unsigned int v41 = v15;
      __int16 v42 = 1024;
      BOOL v43 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Method: %s isEntitledClient: %d isValidSignature: %d",  buf,  0x18u);
    }

    ((void (*)(void *, void, void))v11[2])(v11, 0LL, 0LL);
  }
}

- (int64_t)_AMPEnrollmentAccountStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiCloudAccount"));
  if (v3) {
    int64_t v4 = 0LL;
  }
  else {
    int64_t v4 = 3LL;
  }

  return v4;
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PDInAppPaymentServiceDelegate)delegate
{
  return (PDInAppPaymentServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end