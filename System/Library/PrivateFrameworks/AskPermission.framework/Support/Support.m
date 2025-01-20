uint64_t start()
{
  DaemonRunLoop *v0;
  v0 = objc_alloc_init(&OBJC_CLASS___DaemonRunLoop);
  -[RunLoop runUntilIdleExit](v0, "runUntilIdleExit");

  return 0LL;
}

BOOL sub_100001E3C(uint64_t a1, void *a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 request]);
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting handle approver local notification task. Request: %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) request]);
  id v13 = 0LL;
  +[ProductPagePresenter presentRequest:withError:]( &OBJC_CLASS___ProductPagePresenter,  "presentRequest:withError:",  v10,  &v13);
  id v11 = v13;

  if (a2) {
    *a2 = v11;
  }

  return v11 == 0LL;
}

BOOL sub_1000021C8(uint64_t a1, void *a2)
{
  v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
    *(_DWORD *)buf = 138543618;
    v82 = v7;
    __int16 v83 = 2114;
    id v84 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting handle approver remote notification task. Payload: %{public}@",  buf,  0x16u);
  }

  +[APDefaults setIsApprover:](&OBJC_CLASS___APDefaults, "setIsApprover:", 1LL);
  +[APDefaults setIsRequester:](&OBJC_CLASS___APDefaults, "setIsRequester:", 0LL);
  id v11 = [*(id *)(a1 + 32) requestStatus];
  uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestIdentifier]);
  id v13 = (void *)v12;
  if (v11 == (id)-2LL)
  {
    v14 = @"Could not retrieve request status.";
LABEL_13:
    uint64_t v23 = APError(3LL, @"Invalid notification payload", v14, 0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    goto LABEL_49;
  }

  if (!v12)
  {
    v14 = @"Could not retrieve request identifier.";
    goto LABEL_13;
  }

  if ((unint64_t)v11 <= 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestIdentifier]);
    [v15 dismissNotificationWithIdentifier:v16];

    if (_os_feature_enabled_impl("AskPermission", "BiomeDonation"))
    {
      v17 = *(void **)(a1 + 32);
      id v79 = 0LL;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _approvalRequestWithError:&v79]);
      id v19 = v79;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
      [v20 storeApprovalRequest:v18];

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v22 = v21;
      v66 = a2;
      if (v18)
      {
        [v21 addObject:v18];
      }

      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v29) {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class(*(void *)(a1 + 32));
          *(_DWORD *)buf = 138543618;
          v82 = v31;
          __int16 v83 = 2112;
          id v84 = v19;
          id v32 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to create Request to translate to Biome - Error: %@",  buf,  0x16u);
        }
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueIdentifier]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v33 approvalRequestsMatchingUniqueIdentifier:v34]);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v36) {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v64 = v19;
      v65 = v13;
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_opt_class(*(void *)(a1 + 32));
        v39 = v22;
        id v40 = v38;
        id v41 = [v35 count];
        *(_DWORD *)buf = 138543618;
        v82 = v38;
        __int16 v83 = 2048;
        id v84 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Matching requests found: %lu",  buf,  0x16u);

        v22 = v39;
      }

      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      id obj = v35;
      id v70 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
      if (v70)
      {
        uint64_t v42 = *(void *)v76;
        v67 = v18;
        v68 = v22;
        do
        {
          for (i = 0LL; i != v70; i = (char *)i + 1)
          {
            if (*(void *)v76 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v4[36] sharedDaemonConfig]);
            if (!v45) {
              v45 = (void *)objc_claimAutoreleasedReturnValue([v4[36] sharedConfig]);
            }
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 OSLogObject]);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v47 = (void *)objc_opt_class(*(void *)(a1 + 32));
              uint64_t v48 = a1;
              id v49 = v47;
              uint64_t v50 = v42;
              v51 = v4;
              v52 = (void *)objc_claimAutoreleasedReturnValue([v44 uniqueIdentifier]);
              *(_DWORD *)buf = 138543618;
              v82 = v47;
              __int16 v83 = 2114;
              id v84 = v52;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Updating request: %{public}@",  buf,  0x16u);

              v4 = v51;
              uint64_t v42 = v50;

              a1 = v48;
              v18 = v67;
              v22 = v68;
            }

            id v53 = [v18 status];
            v54 = (void *)objc_claimAutoreleasedReturnValue([v18 approverDSID]);
            [v44 updateStatus:v53 withApproverDSID:v54];

            v55 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
            [v55 storeApprovalRequest:v44];

            [v22 addObject:v44];
          }

          id v70 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
        }

        while (v70);
      }

      v56 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472LL;
      v73[2] = sub_1000029B0;
      v73[3] = &unk_100030588;
      id v74 = v22;
      id v57 = v22;
      -[NSOperationQueue addOperationWithBlock:](v56, "addOperationWithBlock:", v73);

      id v13 = v65;
      a2 = v66;
      id v24 = v64;
      goto LABEL_49;
    }

LABEL_15:
    id v24 = 0LL;
    goto LABEL_49;
  }

  if (v11 != (id)-1LL) {
    goto LABEL_15;
  }
  int v25 = _os_feature_enabled_impl("AskPermission", "BiomeDonation");
  v26 = *(void **)(a1 + 32);
  if (v25)
  {
    id v72 = 0LL;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 _approvalRequestWithError:&v72]);
    id v24 = v72;
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
      [v28 storeApprovalRequest:v27];

      +[BiomeHelper donateToBiomeWithRequest:](&OBJC_CLASS___BiomeHelper, "donateToBiomeWithRequest:", v27);
      [*(id *)(a1 + 32) _presentRequest:v27];
    }

    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v59) {
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 OSLogObject]);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (void *)objc_opt_class(*(void *)(a1 + 32));
        *(_DWORD *)buf = 138543618;
        v82 = v61;
        __int16 v83 = 2112;
        id v84 = v24;
        id v62 = v61;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "%{public}@: Create Request for Cache failed - Error: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v71 = 0LL;
    v58 = (void *)objc_claimAutoreleasedReturnValue([v26 _requestWithError:&v71]);
    id v24 = v71;
    if (v58) {
      [*(id *)(a1 + 32) _presentRequest:v58];
    }
  }

  objc_msgSend( *(id *)(a1 + 32),  "_handleApproverNotification:",  *(void *)(a1 + 48),  *(void *)v19,  *(_OWORD *)&v19[8]);
LABEL_22:
}

  return v4;
}

LABEL_49:
  if (a2) {
    *a2 = v24;
  }

  return v24 == 0LL;
}

void sub_1000029B0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", *(void *)(a1 + 32)));
  +[BiomeHelper donateToBiomeWithRequests:](&OBJC_CLASS___BiomeHelper, "donateToBiomeWithRequests:", v1);
}

id sub_100003D5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadItemsIntoMemory];
}

void sub_100003E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100003E5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003E6C(uint64_t a1)
{
}

void sub_100003E74(uint64_t a1)
{
}

void sub_100003F38(uint64_t a1)
{
}

void sub_100003F84(id a1)
{
  id v1 = -[ApproverStore initWithInMemoryStore:](objc_alloc(&OBJC_CLASS___ApproverStore), "initWithInMemoryStore:", 1LL);
  v2 = (void *)qword_10003A960;
  qword_10003A960 = (uint64_t)v1;
}

void sub_100003FF4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___ApproverStore);
  v2 = (void *)qword_10003A970;
  qword_10003A970 = (uint64_t)v1;
}

void sub_100004154(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestStore]);
  [v2 clearCache];
}

id sub_100004394(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveChanges];
}

LABEL_13:
  return v7;
}

LABEL_24:
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

id sub_100004CC4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _approvalRequestWithStoreItem:a2];
}

id sub_100004E30(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___ApproverStoreItem);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = -[ApproverStoreItem initWithRequest:date:](v2, "initWithRequest:date:", v3, v4);
  v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  [v6 setObject:v5 forKeyedSubscript:v7];

  return [*(id *)(a1 + 32) _saveChanges];
}

void sub_100007BB8(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.AskPermission.BiometricsHandler", 0LL);
  id v2 = (void *)qword_10003A980;
  qword_10003A980 = (uint64_t)v1;
}

id sub_100007FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

id sub_1000081F0(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 40) setState:a2];
  if (a2 == 2) {
    return [*(id *)(a1 + 40) _storeToken:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_100008514(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v2) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v6 = 138543362;
    v7 = v4;
    id v5 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not remove biometrics token, platform not supported",  (uint8_t *)&v6,  0xCu);
  }
}

void sub_100008770(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v2) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class(*(void *)(a1 + 40));
    int v9 = 138543362;
    v10 = v4;
    id v5 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not retreive biometrics token, platform not supported",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = APError(5LL, @"Platform Not Supported", @"This platform does not support biometrics.", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v8);
}

void sub_1000089F4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v2) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v6 = 138543362;
    uint64_t v7 = v4;
    id v5 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not store biometrics token, platform not supported",  (uint8_t *)&v6,  0xCu);
  }
}

void sub_100008B20(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___ConnectionReceiver);
  id v2 = (void *)qword_10003A990;
  qword_10003A990 = (uint64_t)v1;
}
}

void sub_100008EC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100008EF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v2) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class(WeakRetained);
    id v4 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@: Connection invalidated",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100008FF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v2) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class(WeakRetained);
    id v4 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@: Connection interrupted",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_1000092A0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v18 = 138543362;
      id v19 = v9;
      id v10 = v9;
      id v11 = "%{public}@: Posted request successfully";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v18, v14);
    }
  }

  else
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v18 = 138543618;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = v5;
      id v10 = v15;
      id v11 = "%{public}@: Error posting request. Error: %{public}@";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  uint64_t v16 = *(void *)(a1 + 40);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_sanitizedForSecureCoding"));
  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
}

void sub_100009648(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v16 = 138543362;
      v17 = v9;
      id v10 = v9;
      id v11 = "%{public}@: Reset requester account successfully";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }

  else
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2114;
      id v19 = v5;
      id v10 = v15;
      id v11 = "%{public}@: Error resetting requester account. Error: %{public}@";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }
}

uint64_t sub_100009D94(uint64_t a1, void *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v11 = 138543362;
    uint64_t v12 = v6;
    id v7 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting daemon startup task",  (uint8_t *)&v11,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionReceiver sharedReceiver](&OBJC_CLASS___ConnectionReceiver, "sharedReceiver"));
  [v8 start];

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[RemoteNotificationHandler sharedHandler](&OBJC_CLASS___RemoteNotificationHandler, "sharedHandler"));
  [v9 start];

  if (a2) {
    *a2 = 0LL;
  }
  return 1LL;
}

uint64_t sub_10000A078(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 selectedActionIdentifier]);
    [v5 integerValue];

    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  return v4();
}

void sub_10000A2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v5 = (void *)v4;
  if (a2 == -1)
  {
    if (!v4) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v13 = 138543362;
      uint32_t v14 = v12;
      id v8 = v12;
      int v9 = "%{public}@: Error presenting request";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }

  else
  {
    if (!v4) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v13 = 138543362;
      uint32_t v14 = v7;
      id v8 = v7;
      int v9 = "%{public}@: Presented request succesfully";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, 0xCu);
    }
  }
}

void sub_10000A5C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_opt_class(*(void *)(a1 + 40));
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    id v14 = v5;
    id v10 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received dialog result. Result: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v5, v6);
}

void sub_10000A734(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___ExtensionManager);
  id v2 = (void *)qword_10003A9A0;
  qword_10003A9A0 = (uint64_t)v1;
}

id sub_10000A9DC(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"APExtensionDownloadContentType"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 32)));
  id v7 = [v5 isEqualToNumber:v6];

  return v7;
}

id sub_10000AB0C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"APExtensionSupportedProductTypes"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) productType]);
  id v7 = [v5 containsObject:v6];

  return v7;
}

uint64_t sub_10000AE20(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 infoDictionary]);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

id sub_10000AE68(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10000B0B8(_Unwind_Exception *a1)
{
}

void sub_10000B0FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class(WeakRetained);
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Extension completed. Request identifier: %{public}@",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10000B218(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class(WeakRetained);
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@: Extension cancelled. Request identifier: %{public}@",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10000B334(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class(WeakRetained);
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@: Extension interrupted. Request identifier: %{public}@",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10000B798(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = v8;
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = a2;
    id v9 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Got a FamilyCircle: %{public}@",  v19,  0x16u);
  }

  if (a2)
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) DSID]);
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) DSID]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a2 memberForDSID:v11]);
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a2 me]);
    }

    id v17 = [*(id *)(a1 + 32) _familyMemberType:v12];
    __int16 v18 = objc_alloc_init(&OBJC_CLASS___FamilyMember);
    -[FamilyMember setType:](v18, "setType:", v17);
    [*(id *)(a1 + 40) finishWithResult:v18];
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject", *(_OWORD *)v19, *(void *)&v19[16]));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)id v19 = 138543618;
      *(void *)&v19[4] = v15;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v5;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Error: %{public}@", v19, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v5];
  }
}

BOOL sub_10000BE48(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 retrieveRequestURL]);

  uint64_t v42 = @"requestId";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  v43 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));

  int v8 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v8,  "requestWithMethod:bagURL:parameters:",  4LL,  v5,  v7));
  id v39 = 0LL;
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resultWithTimeout:&v39 error:60.0]);
  id v11 = (ApprovalRequest *)v39;
  if (v10)
  {
    v35 = v7;
    v36 = a2;
    v37 = v5;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v41 = v14;
      id v15 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataTaskPromiseWithRequest:v10]);

    v38 = v11;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resultWithTimeout:&v38 error:60.0]);
    id v19 = v38;

    if (!v18) {
      goto LABEL_25;
    }
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v41 = v22;
      uint64_t v23 = v19;
      id v24 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);

      id v19 = v23;
    }

    int v25 = (void *)objc_claimAutoreleasedReturnValue([v18 object]);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    a2 = v36;
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
      id v27 = v25;
    }
    else {
      id v27 = 0LL;
    }

    if (v27)
    {
      v28 = -[ApprovalRequest initWithCloudPushDictionary:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithCloudPushDictionary:",  v27);
      if (v28)
      {
        v29 = v28;
        v34 = v19;
        [*(id *)(a1 + 32) setRequest:v28];
        if (+[APDefaults isRequester](&OBJC_CLASS___APDefaults, "isRequester"))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
          [v30 storeRequest:v29];
        }

        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
          [v30 storeApprovalRequest:v29];
        }

        id v19 = v34;
        goto LABEL_24;
      }

      v31 = @"Server response missing values";
    }

    else
    {
      v31 = @"Server response object is nil";
    }

    uint64_t v32 = APError(101LL, @"Invalid Response", v31, 0LL);
    v29 = v19;
    id v19 = (ApprovalRequest *)objc_claimAutoreleasedReturnValue(v32);
LABEL_24:

LABEL_25:
    id v11 = v19;
    id v5 = v37;
    id v7 = v35;
  }

  if (v11) {
    *a2 = v11;
  }

  return v11 == 0LL;
}

BOOL sub_10000C3BC(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 itemIdentifier]);
    *(_DWORD *)buf = 138543618;
    v37 = v6;
    __int16 v38 = 2114;
    id v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting local approve request task. Item identifier: %{public}@",  buf,  0x16u);
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) itemIdentifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 requestIdentifierWithItemIdentifier:v11]);

  if (!v12)
  {
    uint64_t v33 = APError(0LL, @"Local approval error", @"Request identifier for item identifier not found", 0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v33);
    if (!a2) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[UserProvider localApprovalUser](&OBJC_CLASS___UserProvider, "localApprovalUser"));
  id v35 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resultWithError:&v35]);
  id v15 = v35;
  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      id v19 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved local approval user",  buf,  0xCu);
    }

    __int16 v20 = *(void **)(a1 + 32);
    id v34 = v15;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 _serverRequestWithUser:v14 requestIdentifier:v12 error:&v34]);
    id v22 = v34;

    if (v21)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v23) {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = (void *)objc_opt_class(*(void *)(a1 + 32));
        *(_DWORD *)buf = 138543362;
        v37 = v25;
        id v26 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
      }

      uint64_t v27 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _parseResult:v21]);
      id v22 = (id)v27;
      if (!v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v28) {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_opt_class(*(void *)(a1 + 32));
          *(_DWORD *)buf = 138543362;
          v37 = v30;
          id v31 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Local approve success",  buf,  0xCu);
        }

        id v22 = 0LL;
      }
    }

    id v15 = v22;
  }

  if (a2) {
LABEL_24:
  }
    *a2 = v15;
LABEL_25:

  return v15 == 0LL;
}

void sub_10000D034(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___LocalNotificationHandler);
  uint64_t v2 = (void *)qword_10003A9B0;
  qword_10003A9B0 = (uint64_t)v1;
}

void sub_10000DE08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000DE2C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v8 = (void *)v7;
  if (a2)
  {
    if (!v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class(WeakRetained);
      id v10 = v18;
      id v11 = "%{public}@: Handled requester local notification succesfully.";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }

  else
  {
    if (!v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class(WeakRetained);
      __int16 v19 = 2114;
      id v20 = v5;
      id v10 = v18;
      id v11 = "%{public}@: Failed to handle requester local notification. Error: %{public}@";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v15, v16);
}

void sub_10000E258( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000E27C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_opt_class(WeakRetained);
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 requestIdentifier]);
      int v12 = *(unsigned __int8 *)(a1 + 48);
      int v20 = 138544130;
      id v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 1026;
      int v25 = v12;
      __int16 v26 = 2114;
      id v27 = v3;
      os_log_type_t v13 = "%{public}@: Could not present notification. Identifier: %{public}@, silently: %{public}d, error:%{public}@";
      uint32_t v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 38;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }

  else
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = (void *)objc_opt_class(WeakRetained);
      id v18 = *(void **)(a1 + 32);
      id v10 = v17;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v18 requestIdentifier]);
      int v19 = *(unsigned __int8 *)(a1 + 48);
      int v20 = 138543874;
      id v21 = v17;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 1026;
      int v25 = v19;
      os_log_type_t v13 = "%{public}@: Presented notification successfully. Identifier: %{public}@, silently: %{public}d";
      uint32_t v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 28;
      goto LABEL_10;
    }
  }
}

void sub_10000E588( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000E5AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_opt_class(WeakRetained);
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 requestIdentifier]);
      int v18 = 138543874;
      int v19 = v8;
      __int16 v20 = 2114;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v3;
      int v12 = "%{public}@: Could not replace notification content. Identifier: %{public}@, error:%{public}@";
      os_log_type_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 32;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v18, v15);
    }
  }

  else
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = (void *)objc_opt_class(WeakRetained);
      int v17 = *(void **)(a1 + 32);
      id v10 = v16;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 requestIdentifier]);
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2114;
      id v21 = v11;
      int v12 = "%{public}@: Replaced notification content successfully. Identifier: %{public}@";
      os_log_type_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 22;
      goto LABEL_10;
    }
  }
}

BOOL sub_10000EB98(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 requestURL]);
    *(_DWORD *)buf = 138543618;
    id v34 = v6;
    __int16 v35 = 2114;
    id v36 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting post request task. Request URL: %{public}@",  buf,  0x16u);
  }

  +[APDefaults setIsRequester:](&OBJC_CLASS___APDefaults, "setIsRequester:", 1LL);
  +[APDefaults setIsApprover:](&OBJC_CLASS___APDefaults, "setIsApprover:", 0LL);
  id v10 = *(void **)(a1 + 32);
  id v32 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _serverRequestWithError:&v32]);
  id v12 = v32;
  if (v11)
  {
    os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v34 = v15;
      id v16 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result.",  buf,  0xCu);
    }

    int v17 = *(void **)(a1 + 32);
    id v31 = v12;
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _storeRequestWithResult:v11 error:&v31]);
    id v19 = v31;

    if (_os_feature_enabled_impl("AskPermission", "BiomeDonation"))
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 object]);
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
        id v22 = v20;
      }
      else {
        id v22 = 0LL;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"requestId"]);
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
        id v25 = v23;
      }
      else {
        id v25 = 0LL;
      }

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v26) {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_opt_class(*(void *)(a1 + 32));
        *(_DWORD *)buf = 138543618;
        id v34 = v28;
        __int16 v35 = 2112;
        id v36 = v25;
        id v29 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Requesting Biome Donation - Request Identifier: %@",  buf,  0x16u);
      }

      +[BiomeHelper donateToBiomeWithRequest:](&OBJC_CLASS___BiomeHelper, "donateToBiomeWithRequest:", v18);
    }

    id v12 = v19;
  }

  if (a2) {
    *a2 = v12;
  }

  return v12 == 0LL;
}

void sub_10000F754(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___RemoteNotificationHandler);
  uint64_t v2 = (void *)qword_10003A9C0;
  qword_10003A9C0 = (uint64_t)v1;
}

id sub_10000F86C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStoreNotificationPayload:*(void *)(a1 + 40)];
}

LABEL_18:
    goto LABEL_19;
  }

  -[RemoteNotificationHandler _handleCloudNotificationPayload:](self, "_handleCloudNotificationPayload:", v10);
LABEL_19:
}

void sub_100010314(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 type];
    if (v7 != (id)1)
    {
      if (v7) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }

    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }

    int v18 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v19 = 138543362;
    *(void *)&v19[4] = v18;
    id v17 = v18;
LABEL_20:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Ignoring cloud notification on requester's device",  v19,  0xCu);

    goto LABEL_21;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = v10;
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v6;
    id v11 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to determine if Guardian or Requester. Falling back to UserDefaults. Error: %{public}@",  v19,  0x16u);
  }

  if ((+[APDefaults isRequester](&OBJC_CLASS___APDefaults, "isRequester") & 1) != 0
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore")),
        unsigned __int8 v13 = [v12 containsRequestWithIdentifier:*(void *)(a1 + 40)],
        v12,
        (v13 & 1) != 0))
  {
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[APLogConfig sharedDaemonConfig]( &OBJC_CLASS___APLogConfig,  "sharedDaemonConfig",  *(_OWORD *)v19,  *(void *)&v19[16]));
    if (!v14) {
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v16 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v19 = 138543362;
    *(void *)&v19[4] = v16;
    id v17 = v16;
    goto LABEL_20;
  }

LABEL_30:
}

void sub_100010ABC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5 || [v5 type] == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)id v17 = 138543618;
      *(void *)&v17[4] = v9;
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v6;
      id v10 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to determine if Guardian or Requester. Falling back to UserDefaults. Error: %{public}@",  v17,  0x16u);
    }

    if (!+[APDefaults isRequester](&OBJC_CLASS___APDefaults, "isRequester"))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v11) {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OSLogObject", *(_OWORD *)v17, *(void *)&v17[16]));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      unsigned __int8 v13 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)id v17 = 138543362;
      *(void *)&v17[4] = v13;
      id v14 = v13;
LABEL_18:
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Ignoring store notification on approver's device",  v17,  0xCu);

LABEL_19:
      goto LABEL_21;
    }

LABEL_20:
    objc_msgSend( *(id *)(a1 + 32),  "_handleRequesterNotification:andSuppressDialog:",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)v17,  *(_OWORD *)&v17[8]);
    goto LABEL_21;
  }

  id v15 = [v5 type];
  if (v15 == (id)1) {
    goto LABEL_20;
  }
  if (!v15)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v16 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v17 = 138543362;
    *(void *)&v17[4] = v16;
    id v14 = v16;
    goto LABEL_18;
  }

LABEL_21:
}

void sub_100010DDC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v16 = 138543362;
      id v17 = v9;
      id v10 = v9;
      id v11 = "%{public}@: Handled requester remote notification succesfully";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }

  else
  {
    if (!v6) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v16 = 138543618;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = v5;
      id v10 = v15;
      id v11 = "%{public}@: Failed to handle requester remote notification. Error: %{public}@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }
}

uint64_t sub_100011768(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 request]);
    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting handle requester local notification task. Request: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) request]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
  [v10 dismissNotificationWithIdentifier:v12];

  if (a2) {
    *a2 = 0LL;
  }
  return 1LL;
}

BOOL sub_100011AC8(uint64_t a1, void *a2)
{
  uint64_t v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
    *(_DWORD *)buf = 138543618;
    v98 = v7;
    __int16 v99 = 2114;
    id v100 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting requester remote notification task. Payload: %{public}@",  buf,  0x16u);

    uint64_t v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
  }

  id v11 = [*(id *)(a1 + 32) requestStatus];
  uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestIdentifier]);
  os_log_type_t v13 = (void *)v12;
  if (v11 == (id)-2LL)
  {
    int v14 = @"Could not retrieve request status.";
LABEL_26:
    uint64_t v33 = APError(3LL, @"Invalid notification payload", v14, 0LL);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v33);
    goto LABEL_27;
  }

  if (!v12)
  {
    int v14 = @"Could not retrieve request identifier.";
    goto LABEL_26;
  }

  if ((unint64_t)v11 > 1)
  {
    id v18 = 0LL;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
    [v15 clearExpiredRequests];

    __int16 v16 = *(void **)(a1 + 32);
    id v95 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _serverRequestWithError:&v95]);
    id v18 = v95;
    if (v17)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v19) {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = (void *)objc_opt_class(*(void *)(a1 + 32));
        *(_DWORD *)buf = 138543618;
        v98 = v21;
        __int16 v99 = 2114;
        id v100 = v17;
        id v22 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result: %{public}@",  buf,  0x16u);

        uint64_t v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
      }

      id v23 = *(void **)(a1 + 32);
      id v94 = v18;
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 _requestFromResult:v17 withError:&v94]);
      id v82 = v94;

      v86 = (void *)v24;
      if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v25) {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = (void *)objc_opt_class(*(void *)(a1 + 32));
          *(_DWORD *)buf = 138543618;
          v98 = v27;
          __int16 v99 = 2114;
          id v100 = v86;
          id v28 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Decoded server response. Request: %{public}@",  buf,  0x16u);
        }

        if ([*(id *)(a1 + 32) suppressDialog])
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
          if (!v29) {
            id v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
          }
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = (void *)objc_opt_class(*(void *)(a1 + 32));
            *(_DWORD *)buf = 138543362;
            v98 = v31;
            id v32 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Suppressing Dialog for Inactive Account@",  buf,  0xCu);
          }
        }

        else
        {
          [*(id *)(a1 + 32) _presentRequest:v86];
        }

        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v17 object]);
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0) {
          id v37 = v35;
        }
        else {
          id v37 = 0LL;
        }
        id v81 = v11;

        if (v37)
        {
          __int128 v78 = v17;
          id v79 = v13;
          id v77 = v37;
          __int16 v38 = -[ApprovalRequest initWithCloudPushDictionary:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithCloudPushDictionary:",  v37);
          id v39 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
          [v39 storeRequest:v38];

          [v85 addObject:v38];
          id v40 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
          id v41 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest uniqueIdentifier](v38, "uniqueIdentifier"));
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 requestsMatchingUniqueIdentifier:v41]);

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
          if (!v43) {
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
          }
          v80 = a2;
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = (void *)objc_opt_class(*(void *)(a1 + 32));
            id v46 = v45;
            id v47 = [v42 count];
            *(_DWORD *)buf = 138543618;
            v98 = v45;
            __int16 v99 = 2048;
            id v100 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Matching requests found: %lu",  buf,  0x16u);
          }

          uint64_t v83 = a1;

          __int128 v92 = 0u;
          __int128 v93 = 0u;
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          uint64_t v48 = v42;
          id v49 = -[os_log_s countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v90,  v96,  16LL);
          uint64_t v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
          id v84 = v48;
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v91;
            do
            {
              for (i = 0LL; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v91 != v51) {
                  objc_enumerationMutation(v48);
                }
                id v53 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)i);
                v54 = (void *)objc_claimAutoreleasedReturnValue([v4[36] sharedDaemonConfig]);
                if (!v54) {
                  v54 = (void *)objc_claimAutoreleasedReturnValue([v4[36] sharedConfig]);
                }
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 OSLogObject]);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v56 = (void *)objc_opt_class(*(void *)(v83 + 32));
                  id v57 = v56;
                  v58 = (void *)objc_claimAutoreleasedReturnValue([v53 uniqueIdentifier]);
                  *(_DWORD *)buf = 138543618;
                  v98 = v56;
                  uint64_t v48 = v84;
                  __int16 v99 = 2114;
                  id v100 = v58;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Updating request: %{public}@",  buf,  0x16u);

                  uint64_t v4 = &AKAppleIDAuthenticationErrorDomain_ptr;
                }

                id v59 = [v86 status];
                v60 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest approverDSID](v38, "approverDSID"));
                [v53 updateStatus:v59 withApproverDSID:v60];

                v61 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
                [v61 storeRequest:v53];

                [v85 addObject:v53];
              }

              id v50 = -[os_log_s countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v90,  v96,  16LL);
            }

            while (v50);
          }

          if (_os_feature_enabled_impl("AskPermission", "BiomeDonation"))
          {
            id v62 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_10001249C;
            v88[3] = &unk_100030588;
            id v89 = v85;
            -[NSOperationQueue addOperationWithBlock:](v62, "addOperationWithBlock:", v88);
          }

          os_log_type_t v13 = v79;
          a2 = v80;
          a1 = v83;
          id v37 = v77;
          id v17 = v78;
        }

        else
        {
          __int16 v38 = (ApprovalRequest *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
          if (!v38) {
            __int16 v38 = (ApprovalRequest *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
          }
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest OSLogObject](v38, "OSLogObject"));
          id v84 = v63;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            id v64 = (void *)objc_opt_class(*(void *)(a1 + 32));
            *(_DWORD *)buf = 138543362;
            v98 = v64;
            id v65 = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Error gather information for Biome donation. Result Object NIL.",  buf,  0xCu);
          }
        }

        id v11 = v81;
      }

      if (v11 == (id)1)
      {
        v66 = *(void **)(a1 + 32);
        id v87 = v82;
        v67 = (void *)objc_claimAutoreleasedReturnValue([v66 _requestResultFromResult:v17 withError:&v87]);
        id v68 = v87;

        if (v67)
        {
          uint64_t v69 = objc_claimAutoreleasedReturnValue([v4[36] sharedDaemonConfig]);
          id v70 = v4;
          id v71 = (void *)v69;
          if (!v69) {
            id v71 = (void *)objc_claimAutoreleasedReturnValue([v70[36] sharedConfig]);
          }
          id v72 = (os_log_s *)objc_claimAutoreleasedReturnValue([v71 OSLogObject]);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v73 = (void *)objc_opt_class(*(void *)(a1 + 32));
            *(_DWORD *)buf = 138543618;
            v98 = v73;
            __int16 v99 = 2114;
            id v100 = v67;
            id v74 = v17;
            id v75 = v73;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Decoded server response. Result: %{public}@",  buf,  0x16u);

            id v17 = v74;
          }

          id v76 = [*(id *)(a1 + 32) _notifyExtensionWithResult:v67];
        }

        id v18 = v68;
      }

      else
      {
        id v18 = v82;
      }
    }
  }

LABEL_27:
  if (a2) {
    *a2 = v18;
  }

  return v18 == 0LL;
}

void sub_10001249C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", *(void *)(a1 + 32)));
  +[BiomeHelper donateToBiomeWithRequests:](&OBJC_CLASS___BiomeHelper, "donateToBiomeWithRequests:", v1);
}

id sub_100013394(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadItemsIntoMemory];
}

void sub_1000133DC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RequesterStore);
  uint64_t v2 = (void *)qword_10003A9D0;
  qword_10003A9D0 = (uint64_t)v1;
}

void sub_10001353C(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestItems]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);
        unsigned int v11 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v10);

        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
          -[NSMutableArray addObject:](v2, "addObject:", v12);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v6);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  os_log_type_t v13 = v2;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)j);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestItems", (void)v20));
        [v19 setObject:0 forKeyedSubscript:v18];
      }

      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
    }

    while (v15);
  }

  [*(id *)(a1 + 32) _saveChanges];
}

void sub_100013894(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestItems]);
  [v2 removeAllObjects];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestStore]);
  [v3 clearCache];
}

LABEL_2:
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 createdDate]);
  id v8 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v7);

  if ((v8 & 1) != 0) {
    goto LABEL_21;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore _requesterRequestWithStoreItem:](self, "_requesterRequestWithStoreItem:", v6));
LABEL_22:

  return v9;
}

id sub_1000142B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestItems]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  [v3 setObject:v2 forKeyedSubscript:v4];

  return [*(id *)(a1 + 32) _saveChanges];
}

id sub_100014CB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteFile];
}

void sub_100014E60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100014E8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100014E9C(uint64_t a1)
{
}

void sub_100014EA4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _retrieveFile]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10001503C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeFileWithItems:*(void *)(a1 + 40)];
}

LABEL_17:
}

LABEL_23:
}

uint64_t sub_10001731C(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    __int128 v26 = v6;
    id v7 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting reset approver account task",  buf,  0xCu);
  }

  +[BiometricsHandler reset](&OBJC_CLASS___BiometricsHandler, "reset");
  +[APDefaults setIsApprover:](&OBJC_CLASS___APDefaults, "setIsApprover:", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
  [v8 clearRequests];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 presentedRequests]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend(v16, "status", (void)v20) == (id)-1)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[LocalNotificationHandler sharedHandler]( &OBJC_CLASS___LocalNotificationHandler,  "sharedHandler"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 requestIdentifier]);
          [v17 dismissNotificationWithIdentifier:v18];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }

  if (a2) {
    *a2 = 0LL;
  }

  return 1LL;
}

uint64_t sub_1000175AC(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v10 = 138543362;
    id v11 = v6;
    id v7 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting reset requester account task",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
  [v8 clearRequests];

  +[APDefaults setIsRequester:](&OBJC_CLASS___APDefaults, "setIsRequester:", 0LL);
  if (a2) {
    *a2 = 0LL;
  }
  return 1LL;
}

BOOL sub_100017C50(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
    id v9 = [*(id *)(a1 + 32) action];
    *(_DWORD *)buf = 138543874;
    id v53 = v5;
    __int16 v54 = 2114;
    v55 = v8;
    __int16 v56 = 2050;
    id v57 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting update request task. Identifier: %{public}@, action: %{public}ld",  buf,  0x20u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestIdentifier]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 retrieveRequestWithIdentifier:v11]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v53 = v15;
      id v16 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved request, dismissing notification",  buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestIdentifier]);
    [v17 dismissNotificationWithIdentifier:v18];
  }

  id v47 = (void *)v12;
  id v19 = 0LL;
  BOOL v20 = 0;
  __int128 v21 = 0LL;
  while (1)
  {
    __int128 v22 = v19;
    id v23 = objc_msgSend(*(id *)(a1 + 32), "action", v47);
    id v51 = v19;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[UserProvider primaryiCloudUserWithAction:keychainError:]( &OBJC_CLASS___UserProvider,  "primaryiCloudUserWithAction:keychainError:",  v23,  &v51));
    id v19 = v51;

    id v50 = v21;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 resultWithError:&v50]);
    id v26 = v50;

    if (!v25) {
      break;
    }
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v53 = v29;
      id v30 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved primary iCloud user.",  buf,  0xCu);
    }

    id v31 = *(void **)(a1 + 32);
    id v49 = v26;
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 _serverRequestWithUser:v25 error:&v49]);
    id v33 = v49;

    if (!v32)
    {
      __int128 v21 = v33;
LABEL_26:

      id v26 = v21;
      break;
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v34) {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = (void *)objc_opt_class(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v53 = v36;
      id v37 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result.",  buf,  0xCu);
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _parseResult:v32]);
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v25 biometricsToken]);
    BOOL v20 = v38 != 0LL;

    if (!v21 || !v38) {
      goto LABEL_26;
    }
    +[BiometricsHandler removeToken](&OBJC_CLASS___BiometricsHandler, "removeToken");

    BOOL v20 = 1;
  }

  if (v47 && v26)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v39) {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 OSLogObject]);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = (void *)objc_opt_class(*(void *)(a1 + 32));
      id v42 = v41;
      uint64_t v43 = AMSLogableError(v26);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      *(_DWORD *)buf = 138543618;
      id v53 = v41;
      __int16 v54 = 2114;
      v55 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@: Encountered error, presenting notification. error = %{public}@",  buf,  0x16u);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[LocalNotificationHandler sharedHandler](&OBJC_CLASS___LocalNotificationHandler, "sharedHandler"));
    [v45 presentNotificationWithRequest:v47 silently:1];
  }

  [*(id *)(a1 + 32) _enqueueMetricsWithKeychainError:v19 usedBiometrics:v20 request:v47 error:v26];
  if (a2) {
    *a2 = v26;
  }

  return v26 == 0LL;
}

void sub_1000188D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    [*(id *)(a1 + 32) enqueueEvent:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[APMetricsEvent nonIdentifiableMetricsFieldsForAccount:]( &OBJC_CLASS___APMetricsEvent,  "nonIdentifiableMetricsFieldsForAccount:",  a2));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10001898C;
    v5[3] = &unk_100030AE0;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v4 addFinishBlock:v5];
  }

id sub_10001898C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = a2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"userId"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"xpAccountsMatch"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"xpUserIdSyncState"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"clientId"]);

    [*(id *)(a1 + 32) setProperty:0 forBodyKey:@"dsId"];
    [*(id *)(a1 + 32) setProperty:v5 forBodyKey:@"userId"];
    [*(id *)(a1 + 32) setProperty:v8 forBodyKey:@"clientId"];
    [*(id *)(a1 + 32) setProperty:kUserIDNamespace forBodyKey:@"userNs"];
    [*(id *)(a1 + 32) setProperty:v6 forBodyKey:@"xpAccountsMatch"];
    [*(id *)(a1 + 32) setProperty:v7 forBodyKey:@"xpUserIdSyncState"];
  }

  return [*(id *)(a1 + 40) enqueueEvent:*(void *)(a1 + 32)];
}

void sub_1000196A8(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___URLSession);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  uint64_t v2 = -[URLSession initWithConfiguration:](v1, "initWithConfiguration:", v4);
  uint64_t v3 = (void *)qword_10003A9E0;
  qword_10003A9E0 = (uint64_t)v2;
}

void sub_100019758(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___URLSessionHandler);
  uint64_t v2 = (void *)qword_10003A9F0;
  qword_10003A9F0 = (uint64_t)v1;
}

id sub_100019AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
  [*(id *)(a1 + 32) setPreviousLocalApprovalUsername:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v3));
  return v5;
}

void sub_10001F140(id a1)
{
  id v1 = (void *)qword_10003AA00;
  qword_10003AA00 = (uint64_t)&off_100032AF8;
}

void sub_100020D1C(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v1) {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 OSLogObject]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM, stopping daemon", v3, 2u);
  }

  exit(0);
}

void sub_1000215DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationDSIDKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = v8;
  }
  else {
    id v10 = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationUsernameKey]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v13 = v11;
  }
  else {
    id v13 = 0LL;
  }

  if (v6)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_opt_class(*(void *)(a1 + 40));
      int v41 = 138543618;
      id v42 = v16;
      __int16 v43 = 2114;
      id v44 = v6;
      id v17 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to authenticate user. Error: %{public}@",  (uint8_t *)&v41,  0x16u);
    }

    uint64_t v18 = @"Authentication failed";
    id v19 = v6;
    goto LABEL_28;
  }

  if ((objc_opt_respondsToSelector(v7, "stringValue") & 1) == 0
    || (BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]), v20, !v20))
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v29) {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = (void *)objc_opt_class(*(void *)(a1 + 40));
      int v41 = 138543362;
      id v42 = v31;
      id v32 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@: Authenticated user but no DSID",  (uint8_t *)&v41,  0xCu);
    }

    uint64_t v18 = @"Authenticated user but no DSID";
    goto LABEL_27;
  }

  if (!v10)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v34) {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = (void *)objc_opt_class(*(void *)(a1 + 40));
      int v41 = 138543362;
      id v42 = v36;
      id v37 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}@: Authenticated user but no password",  (uint8_t *)&v41,  0xCu);
    }

    uint64_t v18 = @"Authenticated user but no password";
    goto LABEL_27;
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  __int128 v22 = (void *)v21;
  if (!v13)
  {
    if (!v21) {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = (void *)objc_opt_class(*(void *)(a1 + 40));
      int v41 = 138543362;
      id v42 = v39;
      id v40 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%{public}@: Authenticated user but no username",  (uint8_t *)&v41,  0xCu);
    }

    uint64_t v18 = @"Authenticated user but no username";
LABEL_27:
    id v19 = 0LL;
LABEL_28:
    uint64_t v33 = APError(0LL, @"User error", v18, v19);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    __int128 v27 = 0LL;
    goto LABEL_29;
  }

  if (!v21) {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v24 = (void *)objc_opt_class(*(void *)(a1 + 40));
    int v41 = 138543362;
    id v42 = v24;
    id v25 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Authenticated user succesfully",  (uint8_t *)&v41,  0xCu);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  __int128 v27 = -[User initWithDSID:username:password:biometricsToken:]( objc_alloc(&OBJC_CLASS___User),  "initWithDSID:username:password:biometricsToken:",  v26,  v13,  v10,  0LL);

  id v28 = 0LL;
LABEL_29:
  (*(void (**)(void, User *, void *))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v27, v28);
}

id objc_msgSend_initWithDate_requestIdentifier_uniqueIdentifier_itemBundleIdentifier_itemIdentifier_localizations_mocked_offerName_previewURL_productType_productTypeName_productURL_requestInfo_status_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offe rName:previewURL:productType:productTypeName:productURL:requestInfo:status:");
}

id objc_msgSend_initWithDate_requestIdentifier_uniqueIdentifier_itemIdentifier_localizations_offerName_status_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:");
}

id objc_msgSend_initWithItemIdentifier_requestIdentifier_uniqueIdentifier_ageRating_approverDSID_requesterDSID_createdDate_modifiedDate_itemDesc_itemTitle_localizedPrice_previewURL_productType_productTypeName_productURL_offerName_requestString_requestSummary_priceSummary_status_starRating_thumbnailURLString_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithItemIdentifier:requestIdentifier:uniqueIdentifier:ageRating:approverDSID:requesterDSID:createdDate:mo difiedDate:itemDesc:itemTitle:localizedPrice:previewURL:productType:productTypeName:productURL:offerName:requ estString:requestSummary:priceSummary:status:starRating:thumbnailURLString:");
}

id objc_msgSend_initWithRequestID_eventTime_userID_actionUserID_status_itemTitle_itemDescription_itemLocalizedPrice_thumbnailPath_ageRating_starRating_productType_isActionUserDevice_storeLink_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithRequestID:eventTime:userID:actionUserID:status:itemTitle:itemDescription:itemLocalizedPrice:thumbnail Path:ageRating:starRating:productType:isActionUserDevice:storeLink:");
}

id objc_msgSend_replaceContentForRequestWithIdentifier_replacementContent_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}