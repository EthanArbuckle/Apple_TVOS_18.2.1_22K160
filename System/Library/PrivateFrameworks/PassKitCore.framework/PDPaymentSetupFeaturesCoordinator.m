@interface PDPaymentSetupFeaturesCoordinator
- (BOOL)_productsNeedUpdating:(id *)a3 ignoreCache:(BOOL *)a4;
- (PDAccountManager)accountManager;
- (PDPaymentSetupFeaturesCoordinator)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 accountManager:(id)a7 familyCircleManager:(id)a8 discoveryManager:(id)a9;
- (PDUserNotificationManager)userNotificationManager;
- (id)_paymentSetupFeaturesForFilteredProducts:(id)a3;
- (id)_staticAvailableProductsRequest:(BOOL *)a3;
- (void)_applyRegionFilteringAndAgeCheckToProductsResponse:(id)a3 completion:(id)a4;
- (void)_cachedPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 completion:(id)a5;
- (void)_fetchAccountFeaturesWithSupportedFeatureIdentifiers:(id)a3 paymentSetupFeatures:(id)a4 completion:(id)a5;
- (void)_fetchPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 completion:(id)a5;
- (void)_performProductActionRequest:(id)a3 completion:(id)a4;
- (void)_processPaymentSetupProductsResponse:(id)a3 completion:(id)a4;
- (void)_productsWithRequest:(id)a3 completion:(id)a4;
- (void)_runNextProductsRequest;
- (void)_storeServerPaymentSetupFeatures:(id)a3 productsResponse:(id)a4 priorDirtyStateIdentifier:(id)a5;
- (void)clearPaymentSetupFeatures;
- (void)handleWebServiceRequest:(id)a3 completion:(id)a4;
- (void)markProductsDirty;
- (void)paymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4;
- (void)performProductActionRequest:(id)a3 completion:(id)a4;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)staticFilteredProductsWithDiagnosticReason:(id)a3 completion:(id)a4;
- (void)staticPaymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4;
@end

@implementation PDPaymentSetupFeaturesCoordinator

- (PDPaymentSetupFeaturesCoordinator)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 accountManager:(id)a7 familyCircleManager:(id)a8 discoveryManager:(id)a9
{
  id v15 = a3;
  id v45 = a4;
  id v44 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___PDPaymentSetupFeaturesCoordinator;
  v19 = -[PDPaymentSetupFeaturesCoordinator init](&v50, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_webService, a3);
    objc_storeStrong((id *)&v20->_webServiceQueue, a4);
    objc_storeStrong((id *)&v20->_databaseManager, a5);
    objc_storeWeak((id *)&v20->_paymentWebServiceCoordinator, v16);
    objc_storeStrong((id *)&v20->_familyCircleManager, a8);
    objc_storeStrong((id *)&v20->_discoveryManager, a9);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.PDPaymentSetupFeaturesCoordinator.reply", v22);
    replyQueue = v20->_replyQueue;
    v20->_replyQueue = (OS_dispatch_queue *)v23;

    v25 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    if (PDPaymentSetupFeaturesAreDirty())
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: PDPaymentSetupFeaturesDirty is dirty due to locale has changed",  buf,  2u);
      }

      PDSetPaymentSetupFeaturesAreDirty(0LL);
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager paymentSetupFeatures](v20->_databaseManager, "paymentSetupFeatures"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allObjects]);

      if ([v29 count])
      {
        id v43 = v15;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v30 = v29;
        id v31 = [v30 countByEnumeratingWithState:&v46 objects:v53 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v47;
          while (2)
          {
            for (i = 0LL; i != v32; i = (char *)i + 1)
            {
              if (*(void *)v47 != v33) {
                objc_enumerationMutation(v30);
              }
              if ([*(id *)(*((void *)&v46 + 1) + 8 * (void)i) productType])
              {

                v25 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
                v37 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v30);
                paymentSetupFeatures = (os_log_s *)v20->_paymentSetupFeatures;
                v20->_paymentSetupFeatures = v37;
                id v15 = v43;
                goto LABEL_19;
              }
            }

            id v32 = [v30 countByEnumeratingWithState:&v46 objects:v53 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }

        uint64_t v35 = PKLogFacilityTypeGetObject(6LL);
        paymentSetupFeatures = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(paymentSetupFeatures, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v52 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  paymentSetupFeatures,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Invalid payment setup features from database, ignoring: %@",  buf,  0xCu);
        }

        id v15 = v43;
        v25 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
LABEL_19:
      }
    }

    v38 = (NSMutableArray *)objc_alloc_init((Class)v25[388]);
    pendingProductRequests = v20->_pendingProductRequests;
    v20->_pendingProductRequests = v38;

    v40 = (NSMutableArray *)objc_alloc_init((Class)v25[388]);
    pendingPaymentSetupFeatureBlocks = v20->_pendingPaymentSetupFeatureBlocks;
    v20->_pendingPaymentSetupFeatureBlocks = v40;
  }

  return v20;
}

- (void)paymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    webServiceQueue = self->_webServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002720B8;
    block[3] = &unk_10063C450;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)webServiceQueue, block);
  }
}

- (void)staticPaymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4
{
  if (a4) {
    -[PDPaymentSetupFeaturesCoordinator _fetchPaymentSetupFeaturesForSourceApplicationID:useStaticContent:completion:]( self,  "_fetchPaymentSetupFeaturesForSourceApplicationID:useStaticContent:completion:",  a3,  1LL,  a4);
  }
}

- (void)_fetchPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: PDPaymentWebServiceCoordinator preparing payment setup features",  buf,  2u);
  }

  if (+[PKWalletVisibility isWalletRestricted](&OBJC_CLASS___PKWalletVisibility, "isWalletRestricted"))
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Wallet is restricted, returning no supported features",  buf,  2u);
    }

    v9[2](v9, 0LL);
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    *(void *)buf = 0LL;
    v36 = buf;
    uint64_t v37 = 0x3032000000LL;
    v38 = sub_100272704;
    v39 = sub_100272714;
    id v40 = 0LL;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10027271C;
    v34[3] = &unk_1006396D8;
    v34[4] = self;
    [v12 addOperation:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1002727DC;
    v33[3] = &unk_1006396D8;
    v33[4] = self;
    [v12 addOperation:v33];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10027294C;
    v30[3] = &unk_10063BA38;
    v30[4] = self;
    id v32 = buf;
    v14 = v13;
    id v31 = v14;
    [v12 addOperation:v30];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100272B78;
    v26[3] = &unk_100650B78;
    v26[4] = self;
    id v27 = v8;
    BOOL v29 = a4;
    id v15 = v14;
    v28 = v15;
    [v12 addOperation:v26];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100272E30;
    v23[3] = &unk_100641168;
    v25 = buf;
    v23[4] = self;
    id v16 = v15;
    v24 = v16;
    [v12 addOperation:v23];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100273098;
    v20[3] = &unk_100650BA0;
    id v18 = v16;
    dispatch_queue_attr_t v21 = v18;
    v22 = v9;
    id v19 = [v12 evaluateWithInput:v17 completion:v20];

    _Block_object_dispose(buf, 8);
  }
}

- (void)_fetchAccountFeaturesWithSupportedFeatureIdentifiers:(id)a3 paymentSetupFeatures:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accountManager = self->_accountManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10027326C;
  v15[3] = &unk_100650BE8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[PDAccountManager accountsForProvisioningWithCompletion:]( accountManager,  "accountsForProvisioningWithCompletion:",  v15);
}

- (id)_staticAvailableProductsRequest:(BOOL *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentWebService supportedRegionFeatureOfType:didFailOSVersionRequirements:]( self->_webService,  "supportedRegionFeatureOfType:didFailOSVersionRequirements:",  14LL,  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 createProductsRequestWithIsFetchBlocked:a3]);

  return v5;
}

- (void)_cachedPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  if (v6)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[PDPaymentSetupFeaturesCoordinator _staticAvailableProductsRequest:]( self,  "_staticAvailableProductsRequest:",  &v30));
    id v11 = (id)v10;
    if (v30)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Static fetching disabled, returning cached payment setup features for: %@",  buf,  0xCu);
      }

      id v14 = -[NSMutableArray copy](self->_paymentSetupFeatures, "copy");
      v9[2](v9, v14);

      goto LABEL_18;
    }

    if (v10)
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(6LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Getting cached static payment setup features for: %@",  buf,  0xCu);
      }

      [v11 setSourceApplicationIdentifier:v8];
      webService = self->_webService;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100273AC8;
      v26[3] = &unk_100650C10;
      id v27 = v8;
      v28 = self;
      BOOL v29 = v9;
      -[PKPaymentWebService availableCommonProductsWithRequest:completion:]( webService,  "availableCommonProductsWithRequest:completion:",  v11,  v26);

      id v18 = v27;
LABEL_14:

      goto LABEL_18;
    }
  }

  unsigned int v19 = -[PDPaymentSetupFeaturesCoordinator _productsNeedUpdating:ignoreCache:]( self,  "_productsNeedUpdating:ignoreCache:",  0LL,  0LL);
  uint64_t v20 = PKLogFacilityTypeGetObject(6LL);
  dispatch_queue_attr_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Updating payment setup feature cache for: %@",  buf,  0xCu);
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___PKPaymentAvailableProductsRequest);
    [v11 setSourceApplicationIdentifier:v8];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100273C0C;
    v23[3] = &unk_100650C38;
    v23[4] = self;
    id v24 = v8;
    v25 = v9;
    -[PDPaymentSetupFeaturesCoordinator handleWebServiceRequest:completion:]( self,  "handleWebServiceRequest:completion:",  v11,  v23);

    id v18 = v24;
    goto LABEL_14;
  }

  if (v22)
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Returning cached payment setup features for: %@",  buf,  0xCu);
  }

  id v11 = -[NSMutableArray copy](self->_paymentSetupFeatures, "copy");
  v9[2](v9, v11);
LABEL_18:
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100273E0C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)webServiceQueue, block);
}

- (void)staticFilteredProductsWithDiagnosticReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100273EC8;
  block[3] = &unk_10063C450;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)webServiceQueue, block);
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002741B4;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)webServiceQueue, block);
}

- (void)handleWebServiceRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___PDProductRequestTask);
  -[PDProductRequestTask setRequest:](v8, "setRequest:", v7);

  -[PDProductRequestTask setCompletion:](v8, "setCompletion:", v6);
  -[NSMutableArray addObject:](self->_pendingProductRequests, "addObject:", v8);
  -[PDPaymentSetupFeaturesCoordinator _runNextProductsRequest](self, "_runNextProductsRequest");
}

- (void)_runNextProductsRequest
{
  if (self->_isUpdatingProducts)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Waiting for current running products update to complete",  buf,  2u);
    }
  }

  else
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pendingProductRequests, "firstObject"));
    v3 = v5;
    if (v5)
    {
      uint64_t v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472LL;
      BOOL v22 = sub_1002744D4;
      dispatch_queue_t v23 = &unk_100650CB0;
      id v24 = self;
      v3 = v5;
      v25 = v3;
      id v6 = objc_retainBlock(&v20);
      self->_isUpdatingProducts = 1;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s request](v3, "request", v20, v21, v22, v23, v24));
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___PKPaymentAvailableProductsRequest, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        -[PDPaymentSetupFeaturesCoordinator _productsWithRequest:completion:]( self,  "_productsWithRequest:completion:",  v7,  v6);
      }

      else
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___PKPaymentProductsActionRequest, v10);
        if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
        {
          -[PDPaymentSetupFeaturesCoordinator _performProductActionRequest:completion:]( self,  "_performProductActionRequest:completion:",  v7,  v6);
        }

        else
        {
          uint64_t v14 = PKLogFacilityTypeGetObject(6LL);
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (objc_class *)objc_opt_class(v7, v16);
            id v18 = NSStringFromClass(v17);
            unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            *(_DWORD *)buf = 138412290;
            id v27 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Error: unknown request class: %@ removing and running next request",  buf,  0xCu);
          }

          ((void (*)(void ***, void, void))v6[2])(v6, 0LL, 0LL);
        }
      }
    }

    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(6LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Completed all product request tasks",  buf,  2u);
      }
    }
  }
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.product_action");
  webService = self->_webService;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002746C4;
  v12[3] = &unk_100650C10;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  -[PKPaymentWebService performProductActionRequest:completion:]( webService,  "performProductActionRequest:completion:",  v7,  v12);
}

- (void)_productsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.update_products");
  char v30 = 0;
  id v9 = [v6 cachePolicyOverride];
  if (v9 == (id)3)
  {
    id v10 = 0LL;
  }

  else
  {
    id v29 = 0LL;
    -[PDPaymentSetupFeaturesCoordinator _productsNeedUpdating:ignoreCache:]( self,  "_productsNeedUpdating:ignoreCache:",  &v29,  &v30);
    id v10 = v29;
    if (v30) {
      [v6 setCachePolicyOverride:1];
    }
  }

  BOOL v11 = v9 == (id)3;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100274A78;
  v24[3] = &unk_100650D28;
  BOOL v28 = v9 == (id)3;
  v24[4] = self;
  id v25 = v10;
  id v26 = v8;
  id v27 = v7;
  id v12 = v8;
  id v13 = v7;
  id v14 = v10;
  uint64_t v15 = objc_retainBlock(v24);
  webService = self->_webService;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100274CB4;
  v19[3] = &unk_100650D78;
  char v22 = v30;
  BOOL v23 = v11;
  v19[4] = self;
  id v20 = v6;
  id v21 = v15;
  id v17 = v15;
  id v18 = v6;
  -[PKPaymentWebService availableProductsWithRequest:completion:]( webService,  "availableProductsWithRequest:completion:",  v18,  v19);
}

- (void)_processPaymentSetupProductsResponse:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100274F50;
  v6[3] = &unk_10063F520;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[PDPaymentSetupFeaturesCoordinator _applyRegionFilteringAndAgeCheckToProductsResponse:completion:]( v7,  "_applyRegionFilteringAndAgeCheckToProductsResponse:completion:",  a3,  v6);
}

- (void)_applyRegionFilteringAndAgeCheckToProductsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___PKPaymentSetupProductModel);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 JSONObject]);
  [v8 updateWithPaymentSetupProductsResponse:v9 productsFilter:0 sectionsFilter:0];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appleAccountInformation]);
  id v12 = [v11 ageCategory];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allSetupProducts", 0));
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v19 = (uint64_t)[v18 minimumSupportedAge];
        if (v19 < 18 || (BOOL v20 = 0LL, v12 != (id)2) && v12 != (id)4) {
          BOOL v20 = v19 < 13 || v12 != (id)1;
        }
        [v18 setMeetsAgeRequirements:v20];
      }

      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v15);
  }

  uint64_t v22 = PKCurrentMobileCarrierRegion();
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService targetDevice](self->_webService, "targetDevice"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceRegion]);

  id v26 = (void *)objc_claimAutoreleasedReturnValue( [v8 filteredPaymentSetupProductModel:self->_webService mobileCarrierRegion:v23 deviceRegion:v25 cardOnFiles:0]);
  v7[2](v7, v26);
}

- (id)_paymentSetupFeaturesForFilteredProducts:(id)a3
{
  id v3 = a3;
  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    uint64_t v34 = *(void *)v38;
    id v35 = v4;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
        id v11 = [v10 state];
        else {
          unint64_t v12 = ((unint64_t)[v9 supportedProvisioningMethods] >> 1) & 1;
        }
        if ((_DWORD)v12) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v11 == 0LL;
        }
        if (!v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentOptions]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

          uint64_t v16 = PKPaymentNetworkNameForPaymentCredentialType([v15 cardType]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
          id v18 = (void *)v17;
          if (v17) {
            BOOL v19 = 0;
          }
          else {
            BOOL v19 = v11 == 0LL;
          }
          if (!v19)
          {
            uint64_t v20 = PKPaymentTransitAppletFormatForPaymentNetwork(v17);
            id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedTransitNetworkIdentifiers]);
            BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

            if (![v23 count] && v21)
            {
              uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v21));

              BOOL v23 = (void *)v24;
            }

            id v25 = objc_alloc_init(&OBJC_CLASS___PKPaymentSetupFeature);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 productIdentifier]);
            -[PKPaymentSetupFeature setProductIdentifier:](v25, "setProductIdentifier:", v26);

            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 partnerIdentifier]);
            -[PKPaymentSetupFeature setPartnerIdentifier:](v25, "setPartnerIdentifier:", v27);

            -[PKPaymentSetupFeature setFeatureIdentifier:]( v25,  "setFeatureIdentifier:",  [v10 featureIdentifier]);
            -[PKPaymentSetupFeature setProductType:](v25, "setProductType:", [v10 type]);
            -[PKPaymentSetupFeature setProductState:](v25, "setProductState:", [v10 state]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationTitle]);
            -[PKPaymentSetupFeature setNotificationTitle:](v25, "setNotificationTitle:", v28);

            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationMessage]);
            -[PKPaymentSetupFeature setNotificationMessage:](v25, "setNotificationMessage:", v29);

            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryCardIdentifier]);
            -[PKPaymentSetupFeature setDiscoveryCardIdentifier:](v25, "setDiscoveryCardIdentifier:", v30);

            -[PKPaymentSetupFeature setSupportedDevices:](v25, "setSupportedDevices:", 1LL);
            if ([v23 count])
            {
              -[PKPaymentSetupFeature setIdentifiers:](v25, "setIdentifiers:", v23);
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
              -[PKPaymentSetupFeature setLocalizedDisplayName:](v25, "setLocalizedDisplayName:", v31);

              -[PKPaymentSetupFeature setType:](v25, "setType:", 3LL);
              -[PKPaymentSetupFeature setState:](v25, "setState:", 1LL);
              -[PKPaymentSetupFeature setSupportedOptions:](v25, "setSupportedOptions:", 0LL);
            }

            -[NSMutableArray addObject:](v36, "addObject:", v25);

            uint64_t v7 = v34;
            id v4 = v35;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v6);
  }

  id v32 = -[NSMutableArray copy](v36, "copy");
  return v32;
}

- (void)_storeServerPaymentSetupFeatures:(id)a3 productsResponse:(id)a4 priorDirtyStateIdentifier:(id)a5
{
  id v8 = a3;
  id v80 = a4;
  id v79 = a5;
  v82 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v86 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v81 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v84 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  v90 = self;
  id obj = -[NSMutableArray copy](self->_paymentSetupFeatures, "copy");
  id v9 = [obj countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v112;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v112 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v111 + 1) + 8LL * (void)i);
        if (![v8 count]) {
          goto LABEL_20;
        }
        uint64_t v14 = 0LL;
        while (1)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v14]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 productIdentifier]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 productIdentifier]);
          id v18 = v16;
          id v19 = v17;
          if (v18 == v19) {
            break;
          }
          uint64_t v20 = v19;
          if (v18 && v19)
          {
            unsigned __int8 v21 = [v18 isEqualToString:v19];

            if ((v21 & 1) != 0) {
              goto LABEL_17;
            }
          }

          else
          {
          }
        }

LABEL_17:
        if (v15)
        {
          [v8 removeObjectAtIndex:v14];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 dirtyStateIdentifier]);
          [v15 setDirtyStateIdentifier:v22];

          -[NSMutableArray addObject:](v84, "addObject:", v15);
          if ((PKEqualObjects(v15, v13) & 1) == 0)
          {
            v126[0] = v13;
            v126[1] = v15;
            BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v126,  2LL));
            -[NSMutableArray addObject:](v81, "addObject:", v23);
          }
        }

        else
        {
LABEL_20:
          -[NSMutableArray addObject:](v86, "addObject:", v13);
          id v15 = 0LL;
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v111 objects:v127 count:16];
    }

    while (v10);
  }

  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id v24 = v8;
  id v25 = [v24 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v108;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v108 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v107 + 1) + 8LL * (void)j);
        -[NSMutableArray addObject:](v82, "addObject:", v29);
        -[NSMutableArray addObject:](v84, "addObject:", v29);
      }

      id v26 = [v24 countByEnumeratingWithState:&v107 objects:v125 count:16];
    }

    while (v26);
  }

  v78 = v24;

  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id obja = (id)objc_claimAutoreleasedReturnValue([v80 expiry]);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  v85 = v84;
  id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v85,  "countByEnumeratingWithState:objects:count:",  &v103,  v124,  16LL);
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v104;
    do
    {
      for (k = 0LL; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v104 != v33) {
          objc_enumerationMutation(v85);
        }
        id v35 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)k);
        [v35 setLastUpdated:v30];
        [v35 setExpiry:obja];
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 dirtyStateIdentifier]);
        unsigned int v37 = [v36 isEqualToString:v79];

        if (v37) {
          [v35 setDirtyStateIdentifier:0];
        }
      }

      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v85,  "countByEnumeratingWithState:objects:count:",  &v103,  v124,  16LL);
    }

    while (v32);
  }

  v77 = (void *)v30;

  __int128 v38 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager setPaymentSetupFeatures:](v90->_databaseManager, "setPaymentSetupFeatures:", v85));
  __int128 v40 = -[NSMutableArray initWithArray:](v38, "initWithArray:", v39);
  paymentSetupFeatures = v90->_paymentSetupFeatures;
  v90->_paymentSetupFeatures = v40;

  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  v83 = v82;
  id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v83,  "countByEnumeratingWithState:objects:count:",  &v99,  v123,  16LL);
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v100;
    do
    {
      for (m = 0LL; m != v43; m = (char *)m + 1)
      {
        if (*(void *)v100 != v44) {
          objc_enumerationMutation(v83);
        }
        __int128 v46 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)m);
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v46 productIdentifier]);
          uint64_t v50 = PKPaymentSetupProductStateToString([v46 productState]);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          *(_DWORD *)buf = 138412546;
          v116 = v49;
          __int16 v117 = 2112;
          v118 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Product Added: %@ state: %@",  buf,  0x16u);
        }

        -[PDPaymentSetupFeaturesCoordinator _notificationForNewProduct:oldProduct:]( v90,  "_notificationForNewProduct:oldProduct:",  v46,  0LL);
      }

      id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v83,  "countByEnumeratingWithState:objects:count:",  &v99,  v123,  16LL);
    }

    while (v43);
  }

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  v87 = v86;
  id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v95,  v122,  16LL);
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v96;
    do
    {
      for (n = 0LL; n != v53; n = (char *)n + 1)
      {
        if (*(void *)v96 != v54) {
          objc_enumerationMutation(v87);
        }
        v56 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)n);
        uint64_t v57 = PKLogFacilityTypeGetObject(6LL);
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue([v56 productIdentifier]);
          uint64_t v60 = PKPaymentSetupProductStateToString([v56 productState]);
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          *(_DWORD *)buf = 138412546;
          v116 = v59;
          __int16 v117 = 2112;
          v118 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Product Deleted: %@ state: %@",  buf,  0x16u);
        }

        -[PDPaymentSetupFeaturesCoordinator _removeNotificationForProduct:](v90, "_removeNotificationForProduct:", v56);
      }

      id v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v95,  v122,  16LL);
    }

    while (v53);
  }

  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  v62 = v81;
  id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v91,  v121,  16LL);
  if (v63)
  {
    id v64 = v63;
    uint64_t v65 = *(void *)v92;
    do
    {
      for (ii = 0LL; ii != v64; ii = (char *)ii + 1)
      {
        if (*(void *)v92 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)ii);
        if ([v67 count] == (id)2)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectAtIndexedSubscript:0]);
          v69 = (void *)objc_claimAutoreleasedReturnValue([v67 objectAtIndexedSubscript:1]);
          uint64_t v70 = PKLogFacilityTypeGetObject(6LL);
          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue([v69 productIdentifier]);
            uint64_t v73 = PKPaymentSetupProductStateToString([v69 productState]);
            v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
            uint64_t v75 = PKPaymentSetupProductStateToString([v68 productState]);
            v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
            *(_DWORD *)buf = 138412802;
            v116 = v72;
            __int16 v117 = 2112;
            v118 = v74;
            __int16 v119 = 2112;
            v120 = v76;
            _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Product Updated: %@ new state: %@ old state: %@",  buf,  0x20u);
          }

          -[PDPaymentSetupFeaturesCoordinator _notificationForNewProduct:oldProduct:]( v90,  "_notificationForNewProduct:oldProduct:",  v69,  v68);
        }
      }

      id v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v91,  v121,  16LL);
    }

    while (v64);
  }
}

- (BOOL)_productsNeedUpdating:(id *)a3 ignoreCache:(BOOL *)a4
{
  if (-[NSMutableArray count](self->_paymentSetupFeatures, "count"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v8 = -[NSMutableArray copy](self->_paymentSetupFeatures, "copy", 0LL);
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dirtyStateIdentifier]);
          id v15 = v14;
          if (a3 && v14)
          {
            id v15 = v14;
            *a3 = v15;
            uint64_t Object = PKLogFacilityTypeGetObject(6LL);
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Payment setup feature cache is dirty",  buf,  2u);
            }

            if (a4) {
              *a4 = 1;
            }
            goto LABEL_29;
          }

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 expiry]);
          [v16 timeIntervalSinceDate:v7];
          if (!v16 || v17 <= 0.0)
          {
            uint64_t v23 = PKLogFacilityTypeGetObject(6LL);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: Payment setup feature cache expired",  buf,  2u);
            }

            if (a4) {
              *a4 = 0;
            }

LABEL_29:
            BOOL v18 = 1;
            goto LABEL_30;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = 0;
    if (a4) {
      *a4 = 0;
    }
LABEL_30:
  }

  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject(6LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PDPaymentSetupFeaturesCoordinator: No payment setup feature cache",  buf,  2u);
    }

    if (a4) {
      *a4 = 0;
    }
    return 1;
  }

  return v18;
}

- (void)markProductsDirty
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = -[NSMutableArray copy](self->_paymentSetupFeatures, "copy", 0LL);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) setDirtyStateIdentifier:v4];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  id v10 =  -[PDDatabaseManager setPaymentSetupFeatures:]( self->_databaseManager,  "setPaymentSetupFeatures:",  self->_paymentSetupFeatures);
}

- (void)clearPaymentSetupFeatures
{
  paymentSetupFeatures = self->_paymentSetupFeatures;
  self->_paymentSetupFeatures = 0LL;

  id v4 =  -[PDDatabaseManager setPaymentSetupFeatures:]( self->_databaseManager,  "setPaymentSetupFeatures:",  self->_paymentSetupFeatures);
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end