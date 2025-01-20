uint64_t sub_52A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_5A98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_5AAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logKey]);
  id v5 = (id)AMSSetLogKey();

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(*(void *)(a1 + 40));
    uint64_t v9 = AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verifying credentials.", buf, 0x16u);
  }

  v11 = objc_alloc(&OBJC_CLASS___AMSVerifyCredentialsTask);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientInfo]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag ams_bagForProcessInfo:](&OBJC_CLASS___AMSBag, "ams_bagForProcessInfo:", v14));
  v16 = -[AMSVerifyCredentialsTask initWithAccount:accountStore:bag:options:]( v11,  "initWithAccount:accountStore:bag:options:",  v12,  v13,  v15,  *(void *)(a1 + 32));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask performTask](v16, "performTask"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_5CB0;
  v19[3] = &unk_143E8;
  id v20 = v3;
  id v18 = v3;
  [v17 resultWithCompletion:v19];
}

uint64_t sub_5CB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_5CBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_5D8C;
    block[3] = &unk_14460;
    id v13 = v7;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t sub_5D8C(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

AMSSyncAccountFlagsResult *sub_68E4(uint64_t a1, void *a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  unsigned int v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    uint64_t v6 = AMSError(2LL, @"Invalid Parameter", @"We can't sync flags from the local account.", 0LL);
    *a2 = (id)objc_claimAutoreleasedReturnValue(v6);
    return (AMSSyncAccountFlagsResult *)0LL;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v11 = ((uint64_t (*)(void))AMSLogKey)();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v82 = a2;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
    uint64_t v14 = AMSHashIfNeeded(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_accountFlags"));
    uint64_t v18 = AMSHashIfNeeded(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138544130;
    uint64_t v87 = v10;
    __int16 v88 = 2114;
    v89 = v12;
    __int16 v90 = 2114;
    v91 = v15;
    __int16 v92 = 2114;
    v93 = v19;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@",  buf,  0x2Au);

    a2 = v82;
  }

  id v20 = objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder);
  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bag]);
  id v22 = [v20 initWithBag:v21];

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  [v22 setAccount:v23];

  uint64_t v24 = AMSLogKey([v22 setRequestEncoding:3]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v22 setLogUUID:v25];

  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ams_accountFlags"));
  v29 = (void *)v28;
  if (v28) {
    v30 = (void *)v28;
  }
  else {
    v30 = &__NSDictionary0__struct;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v30, @"accountFlags");

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v26,  "ams_setNullableObject:forKey:",  v31,  AMSQueryParameterKeyGUID);

  v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bag]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 URLForKey:@"account-flags"]);

  if (_os_feature_enabled_impl("AppleMediaServices", "AccountFlagsV2Polus"))
  {
    v34 = v22;
    uint64_t v35 = 2LL;
    v36 = v33;
    v37 = 0LL;
  }

  else
  {
    v34 = v22;
    uint64_t v35 = 4LL;
    v36 = v33;
    v37 = v26;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v34 requestWithMethod:v35 bagURL:v36 parameters:v37]);
  id v85 = 0LL;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 resultWithError:&v85]);
  id v40 = v85;
  if (v40)
  {
    id v41 = v40;
    v42 = 0LL;
  }

  else
  {
    v81 = v33;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
    v44 = v39;
    v45 = v43;
    v83 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "dataTaskPromiseWithRequest:"));
    id v84 = 0LL;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v46 resultWithError:&v84]);
    id v41 = v84;

    if (!v41)
    {
      v80 = v42;
      v49 = (void *)objc_claimAutoreleasedReturnValue([v42 object]);
      uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0) {
        id v47 = v49;
      }
      else {
        id v47 = 0LL;
      }
      v39 = v83;

      uint64_t v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "ams_accountFlags"));
      uint64_t v52 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
      v53 = (void *)v52;
      if (v51)
      {
        if (!v52) {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 OSLogObject]);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v55 = objc_opt_class(*(void *)(a1 + 32));
          uint64_t v56 = AMSLogKey(v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
          *(_DWORD *)buf = 138543618;
          uint64_t v87 = v55;
          __int16 v88 = 2114;
          v89 = v57;
          _os_log_impl( &dword_0,  v54,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Successfully synced the account flags.",  buf,  0x16u);
        }

        v48 = -[AMSSyncAccountFlagsResult initWithAccountFlags:]( objc_alloc(&OBJC_CLASS___AMSSyncAccountFlagsResult),  "initWithAccountFlags:",  v51);
        v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
        uint64_t v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "ams_accountFlags"));
        v60 = (void *)v51;
        v61 = (void *)v59;
        v78 = v60;
        unsigned __int8 v62 = [v60 isEqualToDictionary:v59];

        v42 = v80;
        v33 = v81;
        if ((v62 & 1) == 0)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
          if (!v63) {
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue([v63 OSLogObject]);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            log = v64;
            uint64_t v65 = objc_opt_class(*(void *)(a1 + 32));
            uint64_t v66 = AMSLogKey(v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
            *(_DWORD *)buf = 138543618;
            uint64_t v87 = v65;
            v64 = log;
            __int16 v88 = 2114;
            v89 = v67;
            _os_log_impl( &dword_0,  log,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The server provided updated account flags.",  buf,  0x16u);

            v42 = v80;
          }

          v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
          objc_msgSend(v68, "ams_setAccountFlags:", v78);

          v69 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
          v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
          id v71 = objc_msgSend(v69, "ams_saveAccount:verifyCredentials:", v70, 0);
        }

        v39 = v83;
      }

      else
      {
        if (!v52) {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 OSLogObject]);
        v42 = v80;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          uint64_t v79 = objc_opt_class(*(void *)(a1 + 32));
          uint64_t v73 = AMSLogKey(v79);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          v75 = (void *)objc_claimAutoreleasedReturnValue([v80 object]);
          *(_DWORD *)buf = 138543874;
          uint64_t v87 = v79;
          __int16 v88 = 2114;
          v89 = v74;
          __int16 v90 = 2114;
          v91 = v75;
          _os_log_impl( &dword_0,  v72,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] The response was invalid. response = %{public}@",  buf,  0x20u);

          v39 = v83;
        }

        uint64_t v76 = AMSError( 301LL,  @"Invalid Response",  @"The request was successful, but the server's response was invalid.",  0LL);
        v48 = 0LL;
        *a2 = (id)objc_claimAutoreleasedReturnValue(v76);
        v33 = v81;
      }

      goto LABEL_18;
    }

    v39 = v83;
  }

  id v47 = v41;
  v48 = 0LL;
  *a2 = v47;
LABEL_18:

  return v48;
}

id sub_7394(uint64_t a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    uint64_t v6 = AMSLogKey(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v10 = AMSLogKey(v8);
      uint64_t v1 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v9,  v1));
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v8));
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
    uint64_t v13 = AMSHashIfNeeded(v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    uint64_t v16 = AMSHashIfNeeded(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543874;
    v33 = v11;
    __int16 v34 = 2114;
    uint64_t v35 = v14;
    __int16 v36 = 2114;
    v37 = v17;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@Starting an account credential verification. account = %{public}@ | options = %{public}@",  buf,  0x20u);

    if (v7)
    {

      uint64_t v11 = (void *)v1;
    }
  }

  [(id)objc_opt_class(*(void *)(a1 + 32)) _postAuthenticationBeganNotification];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 metricsIdentifier]);

  if (v19)
  {
    id v20 = objc_alloc(&OBJC_CLASS___AMSAuthenticateMetricsContext);
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
    id v23 = [v20 initWithOptions:v21 account:v22];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metrics]);
    id v25 = [v24 enqueueWithEvent:3 context:v23];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _generatePasswordIfNeeded]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_76C4;
  v31[3] = &unk_14500;
  v31[4] = *(void *)(a1 + 32);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 thenWithBlock:v31]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_7868;
  v30[3] = &unk_14528;
  v30[4] = *(void *)(a1 + 32);
  [v27 addFinishBlock:v30];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_7A70;
  v29[3] = &unk_14528;
  v29[4] = *(void *)(a1 + 32);
  [v27 addFinishBlock:v29];

  return v27;
}

id sub_76C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [(id)objc_opt_class(v3) _postAuthenticationSubmittedNotification];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
  [v6 setDelegate:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bag]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLForKey:@"authenticateAccount" account:v4]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createAuthenticateRequestEncoder]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createAuthenticateRequestForAccount:v4 URL:v8 requestEncoder:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataTaskPromiseWithRequestPromise:v10]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_7814;
  v15[3] = &unk_144D8;
  v15[4] = *(void *)(a1 + 32);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 continueWithBlock:v15]);

  return v13;
}

id sub_7814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _promiseOfAccountFromResult:a2 orError:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithPromiseResult:](&OBJC_CLASS___AMSPromise, "promiseWithPromiseResult:", v3));

  return v4;
}

void sub_7868(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (char *)objc_msgSend(v3, "ams_lastAuthenticationCredentialSource");
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  uint64_t v6 = (void *)v5;
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    if (!v5) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class(*(void *)(a1 + 32));
      uint64_t v9 = AMSLogKey(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = AMSHashIfNeeded(v3);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v19 = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Loud auth completed, will sync data for authenticatedAccount = %{public}@",  (uint8_t *)&v19,  0x20u);
    }

    [*(id *)(a1 + 32) _startDataSyncForAccount:v3];
  }

  else
  {
    if (!v5) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = objc_opt_class(*(void *)(a1 + 32));
      uint64_t v15 = AMSLogKey(v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = AMSHashIfNeeded(v3);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v18;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Auth completed without prompt, no data sync for authenticatedAccount = %{public}@",  (uint8_t *)&v19,  0x20u);
    }
  }
}

void sub_7A70(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricsIdentifier]);

  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___AMSAuthenticateMetricsContext);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
    id v10 = [v7 initWithOptions:v8 account:v9];

    [v10 setError:v4];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metrics]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 enqueueWithEvent:4 context:v10]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_7B9C;
    v13[3] = &unk_14550;
    v13[4] = *(void *)(a1 + 32);
    [v12 resultWithCompletion:v13];
  }
}

void sub_7B9C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metrics]);
  [v1 flushEvents];
}

id sub_82C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  unsigned int v5 = [v4 ignoreAccountConversion];

  if (v5) {
    [v3 setValue:@"true" forHTTPHeaderField:AMSHTTPHeaderIgnoreAccountConversion];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userAgent]);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userAgent]);
    [v3 setValue:v9 forHTTPHeaderField:AMSHTTPHeaderUserAgent];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userAgentSuffix]);

  if (v11)
  {
    uint64_t v12 = AMSHTTPHeaderUserAgent;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForHTTPHeaderField:AMSHTTPHeaderUserAgent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userAgentSuffix]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v13, v15));

    [v3 setValue:v16 forHTTPHeaderField:v12];
  }

  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_86D0;
  v44 = sub_86E0;
  id v45 = 0LL;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 HTTPHeaders]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_86E8;
  v36[3] = &unk_145A0;
  id v19 = v3;
  uint64_t v20 = *(void *)(a1 + 32);
  id v37 = v19;
  uint64_t v38 = v20;
  v39 = &v40;
  [v18 enumerateKeysAndObjectsUsingBlock:v36];

  if (v41[5])
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:"));
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    BOOL v23 = [v22 credentialSource] == (char *)&dword_4 + 2;

    if (v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v24) {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        uint64_t v27 = AMSLogKey(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        uint64_t v29 = *(void *)(a1 + 32);
        if (v28)
        {
          uint64_t v30 = objc_opt_class(v29);
          uint64_t v31 = AMSLogKey(v30);
          a1 = objc_claimAutoreleasedReturnValue(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v30,  a1));
        }

        else
        {
          v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  objc_opt_class(v29));
          v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
        }

        *(_DWORD *)buf = 138543362;
        id v47 = v32;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@Credential source is multi-user, adding additional headers.",  buf,  0xCu);
        if (v28)
        {

          v32 = (void *)a1;
        }
      }

      objc_msgSend(v19, "ak_addClientInfoHeader");
      objc_msgSend(v19, "ak_addDeviceUDIDHeader");
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v19));
  }

  __int16 v34 = (void *)v21;

  _Block_object_dispose(&v40, 8);
  return v34;
}

void sub_86A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_86D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_86E0(uint64_t a1)
{
}

void sub_86E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    [*(id *)(a1 + 32) setValue:v6 forHTTPHeaderField:v5];
  }

  else
  {
    unsigned int v8 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    id v10 = (void *)v9;
    if (v8)
    {
      if (!v9) {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = (void *)objc_opt_class(*(void *)(a1 + 40));
        int v21 = 138543362;
        id v22 = v12;
        id v13 = v12;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: _createAuthenticateRequestForAccount: AMSAuthenticateOptions.HTTPHeaders a contains non-string value",  (uint8_t *)&v21,  0xCu);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v14 userInfo:0];
    }

    else
    {
      if (!v9) {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        uint64_t v15 = (void *)objc_opt_class(*(void *)(a1 + 40));
        int v21 = 138543362;
        id v22 = v15;
        id v16 = v15;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_FAULT,  "%{public}@: _createAuthenticateRequestForAccount: AMSAuthenticateOptions.HTTPHeaders a contains non-string value",  (uint8_t *)&v21,  0xCu);
      }
    }

    uint64_t v17 = AMSCustomError( AMSErrorDomain,  2LL,  @"AMSAuthenticateOptions.HTTPHeaders contains a non-string value",  0LL,  0LL,  0LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

LABEL_20:
  unsigned int v8 = v104;
  id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_creditsString"));
  objc_msgSend(v10, "ams_setCreditsString:", v37);

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_firstName"));
  objc_msgSend(v10, "ams_setFirstName:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_lastName"));
  objc_msgSend(v10, "ams_setLastName:", v39);

  objc_msgSend(v10, "ams_setManagedAppleID:", objc_msgSend(v7, "ams_isManagedAppleID"));
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_privacyAcknowledgement"));
  objc_msgSend(v10, "ams_mergePrivacyAcknowledgement:", v40);

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "ams_storefront"));

  v105 = v42;
  if ([v42 length])
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 clientInfo]);
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 accountMediaType]);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_storefrontForMediaType:", v45));
    id v47 = [v46 isEqualToString:v42];

    if ((v47 & 1) == 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v48) {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 OSLogObject]);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v97 = objc_opt_class(self);
        uint64_t v50 = AMSLogKey(v97);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 clientInfo]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 accountMediaType]);
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_storefrontForMediaType:", v54));
        *(_DWORD *)buf = 138544130;
        v107 = v97;
        v108 = 2114;
        v109 = v51;
        v110 = 2114;
        v111 = v55;
        v112 = 2114;
        v113 = v105;
        _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Updating the account's storefront. oldStorefront = %{public}@ | newStorefront = %{public}@",  buf,  0x2Au);

        self = v100;
      }

      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 clientInfo]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 accountMediaType]);
      objc_msgSend(v10, "ams_setStorefront:forMediaType:", v105, v58);
    }
  }

  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_altDSID", v97));
  if (v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_altDSID"));
    v61 = [v60 isEqualToString:v59];

    if ((v61 & 1) == 0)
    {
      unsigned __int8 v62 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v62) {
        unsigned __int8 v62 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue([v62 OSLogObject]);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v98 = objc_opt_class(v100);
        v64 = AMSLogKey(v98);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_altDSID"));
        v67 = AMSHashIfNeeded(v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v69 = AMSHashIfNeeded(v59);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        *(_DWORD *)buf = 138544130;
        v107 = v98;
        v108 = 2114;
        v109 = v65;
        v110 = 2114;
        v111 = v68;
        v112 = 2114;
        v113 = v70;
        _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Updating the account's altDSID. oldAltDSID = %{public}@ | newAltDSID = %{public}@",  buf,  0x2Au);
      }

      objc_msgSend(v10, "ams_setAltDSID:", v59);
    }
  }

  id v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID", v98));
  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_DSID"));
    uint64_t v73 = [v72 isEqualToNumber:v71];

    if ((v73 & 1) == 0)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v74) {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 OSLogObject]);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v99 = objc_opt_class(v100);
        uint64_t v76 = AMSLogKey(v99);
        v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_DSID"));
        uint64_t v79 = AMSHashIfNeeded(v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        v81 = AMSHashIfNeeded(v71);
        v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
        *(_DWORD *)buf = 138544130;
        v107 = v99;
        v108 = 2114;
        v109 = v77;
        v110 = 2114;
        v111 = v80;
        v112 = 2114;
        v113 = v82;
        _os_log_impl( &dword_0,  v75,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Updating the account's DSID. oldDSID = %{public}@ | newDSID = %{public}@",  buf,  0x2Au);

        unsigned int v8 = v104;
      }

      objc_msgSend(v10, "ams_setDSID:", v71);
    }
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username", v99));
  id v84 = [v83 isEqualToString:v8];

  if ((v84 & 1) == 0)
  {
    id v85 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v85) {
      id v85 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue([v85 OSLogObject]);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v87 = objc_opt_class(v100);
      __int16 v88 = AMSLogKey(v87);
      v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
      __int16 v90 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
      v91 = AMSHashIfNeeded(v90);
      __int16 v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
      v93 = AMSHashIfNeeded(v104);
      v101 = v59;
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
      *(_DWORD *)buf = 138544130;
      v107 = v87;
      v108 = 2114;
      v109 = v89;
      v110 = 2114;
      v111 = v92;
      v112 = 2114;
      v113 = v94;
      _os_log_impl( &dword_0,  v86,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Updating the account's username. oldUsername = %{public}@ | newUsername = %{public}@",  buf,  0x2Au);

      uint64_t v59 = v101;
      unsigned int v8 = v104;
    }

    [v10 setUsername:v8];
  }

  v95 = v10;

  id v4 = v102;
LABEL_49:

  return v95;
}

AMSPromise *__cdecl sub_9934(id a1, AMSAuthKitUpdateResult *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthKitUpdateResult account](a2, "account"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v2));

  return (AMSPromise *)v3;
}

void sub_9980(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v7 = AMSLogKey(v6);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = AMSHashIfNeeded(v3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to generate a password for the account. error = %{public}@",  (uint8_t *)&v11,  0x20u);
  }
}

void sub_9AB0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v2) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v5 = AMSLogKey(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Successfully generated a password for the account.",  (uint8_t *)&v7,  0x16u);
  }
}

AMSPromise *__cdecl sub_9BB0(id a1, NSError *a2)
{
  return +[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", a2);
}

void sub_A0C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v7 = AMSLogKey(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Device offer registration failed. error = %{public}@",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_A1E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_mapWithTransform:", &stru_146D8));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v8 = AMSLogKey(v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138544130;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    id v15 = [v3 count];
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%{public}@:[%{public}@] Did receive %ld offers: %@",  (uint8_t *)&v10,  0x2Au);
  }

  +[AMSDefaults setDidRetrieveDeviceOffers:](&OBJC_CLASS___AMSDefaults, "setDidRetrieveDeviceOffers:", 1LL);
}

id sub_A340(id a1, AMSDeviceOffer *a2)
{
  return -[AMSDeviceOffer offerIdentifier](a2, "offerIdentifier");
}
}

LABEL_39:
  if (v83 == (char *)-5000LL || v83 == byte_14B8 || v83 == "md.dylib")
  {
    v57 = v84;
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AMSServerErrorDomain,  v82));
  }

  else
  {
    uint64_t v65 = AMSError( 0LL,  @"Authentication Failed",  @"Encountered an unrecognized authentication failure.",  0LL);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    v57 = v84;
  }

  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask dialogRequest](self, "dialogRequest", v82));

  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v67) {
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v68 = v4;
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue([v67 OSLogObject]);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v93 = v70;
      v94 = 2114;
      v95 = v22;
      _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The authentication resulted in an AMSDialogRequest. Encoding the request.",  buf,  0x16u);
    }

    id v71 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask dialogRequest](self, "dialogRequest"));
    uint64_t v87 = 0LL;
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v71,  1LL,  &v87));
    uint64_t v73 = v87;

    if (v72)
    {
      __int16 v90 = AMSAuthenticateErrorDialogKey;
      v91 = v72;
      v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
      v75 = v58;
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s ams_errorByAddingUserInfo:](v58, "ams_errorByAddingUserInfo:", v74));
    }

    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v74) {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 OSLogObject]);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        uint64_t v76 = objc_opt_class(self);
        v77 = AMSLogableError(v73);
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        *(_DWORD *)buf = 138543874;
        v93 = v76;
        v94 = 2114;
        v95 = v22;
        v96 = 2114;
        v97 = v78;
        _os_log_impl( &dword_0,  v75,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to encode the AMSDialogRequest. error = %{public}@",  buf,  0x20u);
      }
    }

    uint64_t v4 = v68;

    v57 = v84;
  }

  return v58;
}

id sub_B764()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19A40;
  uint64_t v7 = qword_19A40;
  if (!qword_19A40)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_C66C;
    v3[3] = &unk_14750;
    v3[4] = &v4;
    sub_C66C((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_B800( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_BAD0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_opt_class(*(void *)(a1 + 40));
      if (v9) {
        uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v10,  *(void *)(a1 + 32));
      }
      else {
        uint64_t v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v10, v19);
      }
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543362;
      int v21 = v15;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed duplicate account", buf, 0xCu);
    }
  }

  else
  {
    if (!v6) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = objc_opt_class(*(void *)(a1 + 40));
      if (v12) {
        __int16 v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v13,  *(void *)(a1 + 32));
      }
      else {
        __int16 v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v13, v19);
      }
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v17 = AMSLogableError(v5);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543618;
      int v21 = v16;
      __int16 v22 = 2114;
      BOOL v23 = v18;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to remove duplicate account. error = %{public}@",  buf,  0x16u);
    }
  }
}

Class sub_C66C(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_19A48)
  {
    __int128 v4 = off_14770;
    uint64_t v5 = 0LL;
    qword_19A48 = _sl_dlopen(&v4, &v3);
    if (!qword_19A48)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_CFD4();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("SSVSubscriptionStatusCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_19A40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_CCF8()
{
  return dispatch thunk of PromiseSerialQueue.runPromiseBlock(_:)();
}

id sub_CD98()
{
  uint64_t v1 = OBJC_IVAR___AMSAccountAuthenticationPluginQueue_promiseSerialQueue;
  id v2 = objc_allocWithZone((Class)type metadata accessor for PromiseSerialQueue(0LL));
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AccountAuthenticationPluginQueue();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t sub_CE14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[4] = a1;
  uint64_t v9 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_CEA8;
  v8[3] = &unk_14850;
  objc_super v5 = _Block_copy(v8);
  uint64_t v6 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain(a2);
  v6(a3, v5);
  _Block_release(v5);
  return swift_release(v9);
}

uint64_t sub_CEA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  swift_unknownObjectRetain(a2);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);

  return swift_unknownObjectRelease(a2);
}

id sub_CF30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountAuthenticationPluginQueue();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountAuthenticationPluginQueue()
{
  return objc_opt_self(&OBJC_CLASS___AMSAccountAuthenticationPluginQueue);
}

uint64_t sub_CF90()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_CFB4(uint64_t a1, uint64_t a2)
{
  return sub_CE14(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_CFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_CFCC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_CFD4()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "SSVSubscriptionStatusCoordinator");
  dispatch thunk of PromiseSerialQueue.runPromiseBlock(_:)(v0);
}

id objc_msgSend_HTTPHeaders(void *a1, const char *a2, ...)
{
  return _[a1 HTTPHeaders];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLForKey_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:account:");
}

id objc_msgSend__createAuthenticateRequestEncoder(void *a1, const char *a2, ...)
{
  return _[a1 _createAuthenticateRequestEncoder];
}

id objc_msgSend__createAuthenticateRequestForAccount_URL_requestEncoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAuthenticateRequestForAccount:URL:requestEncoder:");
}

id objc_msgSend__createAuthenticateRequestParametersForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAuthenticateRequestParametersForAccount:");
}

id objc_msgSend__createUpdatedAccountWithAuthenticationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createUpdatedAccountWithAuthenticationResult:");
}

id objc_msgSend__generatePasswordIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _generatePasswordIfNeeded];
}

id objc_msgSend__handleBiometricsForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBiometricsForAuthenticatedAccount:");
}

id objc_msgSend__handleDeviceOffersForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDeviceOffersForAuthenticatedAccount:");
}

id objc_msgSend__handleIDMSRetentionForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIDMSRetentionForAuthenticatedAccount:");
}

id objc_msgSend__postAuthenticationBeganNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationBeganNotification];
}

id objc_msgSend__postAuthenticationFailedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationFailedNotification];
}

id objc_msgSend__postAuthenticationSubmittedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationSubmittedNotification];
}

id objc_msgSend__processAuthenticationFailureWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAuthenticationFailureWithResult:");
}

id objc_msgSend__processAuthenticationSuccessWithResult_authenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAuthenticationSuccessWithResult:authenticatedAccount:");
}

id objc_msgSend__promiseOfAccountFromResult_orError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promiseOfAccountFromResult:orError:");
}

id objc_msgSend__removeInactiveDuplicatesForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeInactiveDuplicatesForAuthenticatedAccount:");
}

id objc_msgSend__removeRenewCredentialsFollowUp(void *a1, const char *a2, ...)
{
  return _[a1 _removeRenewCredentialsFollowUp];
}

id objc_msgSend__retainIDMS_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retainIDMS:forAccount:");
}

id objc_msgSend__startDataSyncForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDataSyncForAccount:");
}

id objc_msgSend__updateAccount_withLegacyOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAccount:withLegacyOptions:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAuthSyncForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAuthSyncForAccountID:");
}

id objc_msgSend_accountMediaType(void *a1, const char *a2, ...)
{
  return _[a1 accountMediaType];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountWasOriginallyActive(void *a1, const char *a2, ...)
{
  return _[a1 accountWasOriginallyActive];
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_ak_addClientInfoHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addClientInfoHeader");
}

id objc_msgSend_ak_addDeviceUDIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addDeviceUDIDHeader");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allowPasswordGeneration(void *a1, const char *a2, ...)
{
  return _[a1 allowPasswordGeneration];
}

id objc_msgSend_allowServerDialogs(void *a1, const char *a2, ...)
{
  return _[a1 allowServerDialogs];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_accountFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountFlags");
}

id objc_msgSend_ams_accountID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountID");
}

id objc_msgSend_ams_addCookiesForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addCookiesForResult:");
}

id objc_msgSend_ams_addCookiesForResult_account_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addCookiesForResult:account:error:");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_bagForProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_bagForProcessInfo:");
}

id objc_msgSend_ams_creditsString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_creditsString");
}

id objc_msgSend_ams_errorByAddingUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_errorByAddingUserInfo:");
}

id objc_msgSend_ams_errorCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_errorCode");
}

id objc_msgSend_ams_firstName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_firstName");
}

id objc_msgSend_ams_freePasswordPromptSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_freePasswordPromptSetting");
}

id objc_msgSend_ams_homeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_homeID");
}

id objc_msgSend_ams_iTunesAccountWithAltDSID_DSID_username_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:");
}

id objc_msgSend_ams_isActiveForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isActiveForMediaType:");
}

id objc_msgSend_ams_isDuplicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isDuplicate:");
}

id objc_msgSend_ams_isLocalAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isLocalAccount");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_isSandboxAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isSandboxAccount");
}

id objc_msgSend_ams_lastAuthenticationCredentialSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_lastAuthenticationCredentialSource");
}

id objc_msgSend_ams_lastName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_lastName");
}

id objc_msgSend_ams_localiTunesAccountForAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:");
}

id objc_msgSend_ams_mapWithTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mapWithTransform:");
}

id objc_msgSend_ams_mergePrivacyAcknowledgement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mergePrivacyAcknowledgement:");
}

id objc_msgSend_ams_nonEmptyComponentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_nonEmptyComponentsJoinedByString:");
}

id objc_msgSend_ams_objectForCaseInsensitiveKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_objectForCaseInsensitiveKey:");
}

id objc_msgSend_ams_paidPasswordPromptSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_paidPasswordPromptSetting");
}

id objc_msgSend_ams_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_password");
}

id objc_msgSend_ams_privacyAcknowledgement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_privacyAcknowledgement");
}

id objc_msgSend_ams_sanitizedForSecureCoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sanitizedForSecureCoding");
}

id objc_msgSend_ams_saveAccount_verifyCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_saveAccount:verifyCredentials:");
}

id objc_msgSend_ams_secureToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_secureToken");
}

id objc_msgSend_ams_setAccountFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAccountFlags:");
}

id objc_msgSend_ams_setActive_forMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setActive:forMediaType:");
}

id objc_msgSend_ams_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAltDSID:");
}

id objc_msgSend_ams_setCreditsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setCreditsString:");
}

id objc_msgSend_ams_setDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setDSID:");
}

id objc_msgSend_ams_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setFirstName:");
}

id objc_msgSend_ams_setLastAuthenticated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastAuthenticated:");
}

id objc_msgSend_ams_setLastAuthenticationCredentialSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastAuthenticationCredentialSource:");
}

id objc_msgSend_ams_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastName:");
}

id objc_msgSend_ams_setManagedAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setManagedAppleID:");
}

id objc_msgSend_ams_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setNullableObject:forKey:");
}

id objc_msgSend_ams_setSecureToken_forAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setSecureToken:forAccount:error:");
}

id objc_msgSend_ams_setServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setServerResponse:");
}

id objc_msgSend_ams_setStorefront_forMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setStorefront:forMediaType:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_ams_storefrontForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefrontForMediaType:");
}

id objc_msgSend_ams_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_username");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_authenticationQueue(void *a1, const char *a2, ...)
{
  return _[a1 authenticationQueue];
}

id objc_msgSend_authenticationType(void *a1, const char *a2, ...)
{
  return _[a1 authenticationType];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_beginSuspendingSubscriptionStatusChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginSuspendingSubscriptionStatusChangeNotifications];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_catchWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catchWithBlock:");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_continueWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueWithBlock:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _[a1 credential];
}

id objc_msgSend_credentialSource(void *a1, const char *a2, ...)
{
  return _[a1 credentialSource];
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataTaskPromiseWithRequestPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequestPromise:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultMediaTypeForCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 defaultMediaTypeForCurrentProcess];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return _[a1 defaultSession];
}

id objc_msgSend_deviceGUID(void *a1, const char *a2, ...)
{
  return _[a1 deviceGUID];
}

id objc_msgSend_dialogRequest(void *a1, const char *a2, ...)
{
  return _[a1 dialogRequest];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didRetrieveDeviceOffers(void *a1, const char *a2, ...)
{
  return _[a1 didRetrieveDeviceOffers];
}

id objc_msgSend_endSuspendingSubscriptionStatusChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 endSuspendingSubscriptionStatusChangeNotifications];
}

id objc_msgSend_enqueuePromiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueuePromiseBlock:");
}

id objc_msgSend_enqueueWithEvent_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueWithEvent:context:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fetchMetricsIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 fetchMetricsIdentifiers];
}

id objc_msgSend_flushEvents(void *a1, const char *a2, ...)
{
  return _[a1 flushEvents];
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hashedDescription];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreAccountConversion(void *a1, const char *a2, ...)
{
  return _[a1 ignoreAccountConversion];
}

id objc_msgSend_initWithAccount_accountStore_bag_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:accountStore:bag:options:");
}

id objc_msgSend_initWithAccount_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bag:");
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithAccountFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountFlags:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithLegacyOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLegacyOptionsDictionary:");
}

id objc_msgSend_initWithOptions_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:account:");
}

id objc_msgSend_initWithOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsDictionary:");
}

id objc_msgSend_initWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResult:error:");
}

id objc_msgSend_initWithoutBag(void *a1, const char *a2, ...)
{
  return _[a1 initWithoutBag];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isBuddyRunning(void *a1, const char *a2, ...)
{
  return _[a1 isBuddyRunning];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isRunningUnitTests(void *a1, const char *a2, ...)
{
  return _[a1 isRunningUnitTests];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metricsIdentifier];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performAuthKitUpdate(void *a1, const char *a2, ...)
{
  return _[a1 performAuthKitUpdate];
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return _[a1 performTask];
}

id objc_msgSend_performTaskWithPromiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithPromiseBlock:");
}

id objc_msgSend_postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_promiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithError:");
}

id objc_msgSend_promiseWithPromiseResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithPromiseResult:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_removeAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:withCompletionHandler:");
}

id objc_msgSend_requestWithMethod_bagURL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:bagURL:parameters:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_resultWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithCompletion:");
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_saveDeviceOffersForAccount_response_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDeviceOffersForAccount:response:logKey:");
}

id objc_msgSend_serverValueForFreePasswordSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverValueForFreePasswordSetting:");
}

id objc_msgSend_serverValueForPaidPasswordSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverValueForPaidPasswordSetting:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountMediaType:");
}

id objc_msgSend_setAllowSecondaryCredentialSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowSecondaryCredentialSource:");
}

id objc_msgSend_setAllowServerDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerDialogs:");
}

id objc_msgSend_setAuthenticationStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationStarted:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setCanMakeAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMakeAccountActive:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setCreateAccountQueryParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateAccountQueryParams:");
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:");
}

id objc_msgSend_setDefaultButtonString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonString:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceOffersCheckEncodingForRequestParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceOffersCheckEncodingForRequestParameters:");
}

id objc_msgSend_setDialogOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogOptions:");
}

id objc_msgSend_setDialogRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogRequest:");
}

id objc_msgSend_setDidRetrieveDeviceOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidRetrieveDeviceOffers:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFlushTimerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlushTimerEnabled:");
}

id objc_msgSend_setHTTPHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPHeaders:");
}

id objc_msgSend_setIgnoreAccountConversion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreAccountConversion:");
}

id objc_msgSend_setIncludeClientVersions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeClientVersions:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setLogUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogUUID:");
}

id objc_msgSend_setMescalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMescalType:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPromptTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptTitle:");
}

id objc_msgSend_setProxyAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppBundleID:");
}

id objc_msgSend_setProxyAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppName:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRequestEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestEncoding:");
}

id objc_msgSend_setShouldSetCookiesFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSetCookiesFromResponse:");
}

id objc_msgSend_setShouldSetStorefrontFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSetStorefrontFromResponse:");
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAgent:");
}

id objc_msgSend_setUserAgentSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAgentSuffix:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_sharedAccountsAuthenticationPluginConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsAuthenticationPluginConfig];
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsConfig];
}

id objc_msgSend_sharedAccountsMultiUserConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsMultiUserConfig];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedDeviceOffersConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedDeviceOffersConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tearDownAllDeviceOfferFollowUpsForAccount_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tearDownAllDeviceOfferFollowUpsForAccount:logKey:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateWithResponseDictionary_accountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithResponseDictionary:accountIdentifier:");
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return _[a1 userAgent];
}

id objc_msgSend_userAgentSuffix(void *a1, const char *a2, ...)
{
  return _[a1 userAgentSuffix];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_verifyCredentialsForAccount_accountStore_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCredentialsForAccount:accountStore:options:completion:");
}