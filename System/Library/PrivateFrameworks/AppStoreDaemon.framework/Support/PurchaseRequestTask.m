@interface PurchaseRequestTask
- (void)main;
@end

@implementation PurchaseRequestTask

- (void)main
{
  id v3 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v5 = response;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse purchases](v5, "purchases"));

  uint64_t v7 = ASDLogHandleForCategory(25LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (_TtC9appstored6LogKey *)[v6 count];
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v11 = error;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v11, "clientID"));
    *(_DWORD *)buf = 134218242;
    v64 = v9;
    __int16 v65 = 2114;
    v66 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Purchasing %ld app(s) for client: %{public}@",  buf,  0x16u);
  }

  if ([v6 count])
  {
    if (self) {
      v13 = self->super.super._error;
    }
    else {
      v13 = 0LL;
    }
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v14, "clientID"));

    if (v15)
    {
      v16 = objc_alloc(&OBJC_CLASS___AMSProcessInfo);
      if (self) {
        v17 = self->super.super._error;
      }
      else {
        v17 = 0LL;
      }
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v18, "clientID"));
      v20 = -[AMSProcessInfo initWithBundleIdentifier:](v16, "initWithBundleIdentifier:", v19);
    }

    else
    {
      v20 = 0LL;
    }

    v49 = v20;
    v21 = sub_100316A44((uint64_t)&OBJC_CLASS___XPCRequestToken, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id obj = v6;
    id v23 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v58;
      uint64_t v51 = ASDErrorDomain;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v26);
          v28 = objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v27 itemID]);
          v31 = -[LogKey initWithBatchLogKey:logCode:externalID:bundleID:itemID:]( v28,  "initWithBatchLogKey:logCode:externalID:bundleID:itemID:",  0LL,  @"BUY",  0LL,  v29,  v30);

          uint64_t v32 = ASDLogHandleForCategory(25LL);
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@]: Starting purchase", buf, 0xCu);
          }

          dispatch_semaphore_t v34 = dispatch_semaphore_create(0LL);
          v61 = v27;
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v61,  1LL));
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472LL;
          v53[2] = sub_1002CEE20;
          v53[3] = &unk_1003F1BB0;
          v36 = v31;
          v54 = v36;
          v55 = self;
          v37 = v34;
          v56 = v37;
          [v52 processPurchases:v35 failBatchOnError:0 requestToken:v22 withReplyHandler:v53];

          dispatch_time_t v38 = dispatch_time(0LL, 7200000000000LL);
          if (dispatch_semaphore_wait(v37, v38))
          {
            uint64_t v39 = ASDLogHandleForCategory(25LL);
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v36;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_FAULT,  "[%@]: Purchase never completed after two hours",  buf,  0xCu);
            }

            uint64_t v41 = ASDErrorWithTitleAndMessage(v51, 515LL, 0LL, 0LL);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            v43 = -[ASDPurchaseResponse initWithError:]( objc_alloc(&OBJC_CLASS___ASDPurchaseResponse),  "initWithError:",  v42);
            sub_1002CEF58(self, v43);
          }

          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
      }

      while (v24);
    }
  }

  uint64_t v44 = ASDLogHandleForCategory(25LL);
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      v46 = self->super.super._error;
    }
    else {
      v46 = 0LL;
    }
    v47 = v46;
    v48 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v47, "clientID"));
    *(_DWORD *)buf = 138543362;
    v64 = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Purchasing complete for client: %{public}@",  buf,  0xCu);
  }
}

@end