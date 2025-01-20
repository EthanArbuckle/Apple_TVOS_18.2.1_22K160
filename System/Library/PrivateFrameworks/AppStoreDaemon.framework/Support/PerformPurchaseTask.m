@interface PerformPurchaseTask
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation PerformPurchaseTask

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  v12 = *(PurchaseBatch **)((char *)&self->_purchaseBatch + 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  if ((+[AMSDevice deviceIsAppleWatch](&OBJC_CLASS___AMSDevice, "deviceIsAppleWatch") & 1) != 0
    || ([v14 useLocalAuthAndSystemDialogs] & 1) != 0
    || [v14 useLocalAuthAndInteractiveDialogs])
  {
    uint64_t v16 = ASDLogHandleForCategory(25LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
      *(_DWORD *)buf = 138543362;
      v44 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Sending authentication request",  buf,  0xCu);
    }

    id v19 = objc_alloc(&OBJC_CLASS___AMSAuthenticateTask);
    id v20 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = [v19 initWithRequest:v9 bag:v21];

    [v22 setDelegate:self];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 performAuthentication]);
    id v42 = 0LL;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 resultWithError:&v42]);
    id v25 = v42;

    if (v25)
    {
      uint64_t v26 = ASDLogHandleForCategory(25LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
        *(_DWORD *)buf = 138543618;
        v44 = v37;
        __int16 v45 = 2114;
        id v46 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed authentication request with error %{public}@",  buf,  0x16u);
      }
    }

    v11[2](v11, v24, v25);
  }

  else
  {
    id Property = *(id *)(&self->super.super._success + 2);
    if (Property) {
      id Property = objc_getProperty(Property, v15, 40LL, 1);
    }
    id v29 = Property;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 notificationClient]);

    uint64_t v31 = ASDLogHandleForCategory(25LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412546;
        v44 = v34;
        __int16 v45 = 2114;
        id v46 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%@] Sending authentication request to client %{public}@",  buf,  0x16u);
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10025A778;
      v38[3] = &unk_1003EEC10;
      id v39 = v14;
      id v22 = v30;
      id v40 = v22;
      v41 = v11;
      [v22 deliverAuthenticateRequest:v9 withResultHandler:v38];

      id v25 = v39;
    }

    else
    {
      if (v33)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412290;
        v44 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%@] No client available to handle authentication request",  buf,  0xCu);
      }

      uint64_t v36 = ASDErrorWithDescription( ASDErrorDomain,  1061LL,  @"No client available to handle authentication request");
      id v25 = (id)objc_claimAutoreleasedReturnValue(v36);
      v11[2](v11, 0LL, v25);
      id v22 = 0LL;
    }
  }
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  v12 = *(PurchaseBatch **)((char *)&self->_purchaseBatch + 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  unsigned int v15 = [v14 useLocalAuthAndSystemDialogs];
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    uint64_t v17 = ASDLogHandleForCategory(25LL);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[%@] System Dialogs are not supports on macOS. Using remote dialog requests",  buf,  0xCu);
    }

    unsigned int v15 = 0;
  }

  if ((+[AMSDevice deviceIsAppleWatch](&OBJC_CLASS___AMSDevice, "deviceIsAppleWatch") & 1) != 0 || v15)
  {
    uint64_t v28 = ASDLogHandleForCategory(25LL);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
      *(_DWORD *)buf = 138412290;
      v52 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@] Sending dialog request", buf, 0xCu);
    }

    id v22 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v9);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v22, "present"));
    id v50 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 resultWithError:&v50]);
    v27 = (AMSSystemAlertDialogTask *)v50;

    if (v27)
    {
      uint64_t v33 = ASDLogHandleForCategory(25LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412546;
        v52 = v42;
        __int16 v53 = 2114;
        v54 = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "[%@] Error sending dialog request: %{public}@",  buf,  0x16u);
      }
    }

    v11[2](v11, v32, v27);
  }

  else
  {
    id Property = *(id *)(&self->super.super._success + 2);
    if (Property) {
      id Property = objc_getProperty(Property, v19, 40LL, 1);
    }
    id v21 = Property;
    id v22 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue([v21 notificationClient]);

    if ([v14 useLocalAuthAndInteractiveDialogs])
    {
      uint64_t v23 = ASDLogHandleForCategory(25LL);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412290;
        v52 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[%@] Sending interactive dialog request",  buf,  0xCu);
      }

      uint64_t v26 = sub_10025A1CC((uint64_t)self, v10);
      v27 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue(v26);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10025AE70;
      v47[3] = &unk_1003EBDA8;
      id v48 = v10;
      v49 = v11;
      -[AMSSystemAlertDialogTask presentDialogRequest:resultHandler:]( v27,  "presentDialogRequest:resultHandler:",  v9,  v47);
    }

    else
    {
      uint64_t v35 = ASDLogHandleForCategory(25LL);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
          *(_DWORD *)buf = 138412546;
          v52 = v38;
          __int16 v53 = 2114;
          v54 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%@] Sending dialog request to client %{public}@",  buf,  0x16u);
        }

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_10025AF7C;
        v43[3] = &unk_1003EEC38;
        v44 = v14;
        id v22 = v22;
        __int16 v45 = v22;
        id v46 = v11;
        -[AMSSystemAlertDialogTask deliverDialogRequest:withResultHandler:]( v22,  "deliverDialogRequest:withResultHandler:",  v9,  v43);

        v27 = v44;
      }

      else
      {
        if (v37)
        {
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
          *(_DWORD *)buf = 138412290;
          v52 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%@] No client available to handle dialog request",  buf,  0xCu);
        }

        uint64_t v40 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle dialog request");
        v27 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue(v40);
        v11[2](v11, 0LL, v27);
        id v22 = 0LL;
      }
    }
  }
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = *(PurchaseBatch **)((char *)&self->_purchaseBatch + 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  id Property = *(id *)(&self->super.super._success + 2);
  if (Property) {
    id Property = objc_getProperty(Property, v15, 40LL, 1);
  }
  id v17 = Property;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 notificationClient]);

  if ([v14 useLocalAuthAndInteractiveDialogs])
  {
    uint64_t v19 = ASDLogHandleForCategory(25LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
      *(_DWORD *)buf = 138412290;
      id v39 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] Sending interactive engagement request",  buf,  0xCu);
    }

    id v22 = sub_10025A1CC((uint64_t)self, v10);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v14 clientInfo]);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10025B40C;
    v35[3] = &unk_1003EEC60;
    id v36 = v10;
    id v37 = v11;
    [v23 presentEngagementRequest:v9 withClientInfo:v24 resultHandler:v35];
  }

  else
  {
    uint64_t v25 = ASDLogHandleForCategory(25LL);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v27)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
        *(_DWORD *)buf = 138543618;
        id v39 = v28;
        __int16 v40 = 2114;
        v41 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Sending engagement request to client %{public}@",  buf,  0x16u);
      }

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10025B518;
      v31[3] = &unk_1003EEC88;
      id v32 = v10;
      id v33 = v18;
      id v34 = v11;
      [v33 deliverEngagementRequest:v9 withResultHandler:v31];

      uint64_t v23 = v32;
    }

    else
    {
      if (v27)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
        *(_DWORD *)buf = 138543362;
        id v39 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No client available to handle engagement request",  buf,  0xCu);
      }

      uint64_t v30 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle engagement request");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v30);
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v23);
    }
  }
}

- (void)mainWithCompletionHandler:(id)a3
{
  id v126 = a3;
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  v3 = sub_10020DDEC(*(id **)(&self->super.super._success + 2));
  id obj = (id)objc_claimAutoreleasedReturnValue(v3);
  id v134 = [obj countByEnumeratingWithState:&v142 objects:v152 count:16];
  if (v134)
  {
    id v4 = 0LL;
    uint64_t v133 = *(void *)v143;
    uint64_t v128 = ASDErrorDomain;
    uint64_t v127 = AMSBuyParamPropertyPricingParameters;
    while (1)
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v143 != v133) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v142 + 1) + 8LL * (void)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));

        id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 username]);

        if (v4)
        {
          uint64_t v11 = ASDLogHandleForCategory(25LL);
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v4;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[%@] Failing purchase due to batch error: %{public}@",  buf,  0x16u);
          }

          v13 = (id *)objc_claimAutoreleasedReturnValue([v6 account]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_DSID"));
          unsigned int v15 = sub_1002EBF84((uint64_t)&OBJC_CLASS___StoreItemResponse, v4, v14);
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          [v6 setItemResponse:v16];

          goto LABEL_44;
        }

        id v17 = v6;
        if ([v17 purchaseType] != (id)4 && objc_msgSend(v17, "purchaseType") != (id)1)
        {
          uint64_t v27 = 0LL;
          goto LABEL_24;
        }

        id v18 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v146 = 0LL;
        id v20 = sub_100255DA0((uint64_t)v19, (uint64_t)@"updateProductContentType", &v146);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        id v22 = v146;

        if (!v21 || v22)
        {
          if (v22)
          {
            uint64_t v28 = ASDLogHandleForCategory(25LL);
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue([v17 logKey]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v100;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v22;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%@] Encountered bag error while fetching updateProduct content type: %@",  buf,  0x16u);
            }

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = ASDLogHandleForCategory(25LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  uint64_t v11 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v11, "present"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10025D27C;
  v14[3] = &unk_1003EBDA8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

- (void).cxx_destruct
{
}

@end