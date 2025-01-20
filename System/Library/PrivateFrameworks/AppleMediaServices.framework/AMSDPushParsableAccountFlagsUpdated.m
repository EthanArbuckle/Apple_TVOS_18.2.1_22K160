@interface AMSDPushParsableAccountFlagsUpdated
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableAccountFlagsUpdated

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedPushNotificationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedPushNotificationConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = (id)objc_opt_class(a1, v9);
    id v10 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received a push notification to update an account's account flags.",  buf,  0xCu);
  }

  if (_os_feature_enabled_impl("AppleMediaServices", "AccountFlagsV2Polus"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class(a1, v13);
      *(_DWORD *)buf = 138543362;
      id v43 = v14;
      id v15 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Skipping account flag update, since account data has replaced it.",  buf,  0xCu);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
    v11 = v16;
    if (v16)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_accountFlags"));
      v18 = (void *)v17;
      v19 = &__NSDictionary0__struct;
      if (v17) {
        v19 = (void *)v17;
      }
      v12 = v19;

      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"accountFlags"]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
      if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0) {
        v23 = v20;
      }
      else {
        v23 = 0LL;
      }

      if (v23 && (-[os_log_s isEqualToDictionary:](v12, "isEqualToDictionary:", v23) & 1) == 0)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s ams_dictionaryByAddingEntriesFromDictionary:]( v12,  "ams_dictionaryByAddingEntriesFromDictionary:",  v23));
        objc_msgSend(v11, "ams_setAccountFlags:", v31);

        objc_msgSend(v11, "ams_setDisableAccountFlagsSync:", 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_saveAccount:", v11));
        id v41 = 0LL;
        unsigned __int8 v34 = [v33 resultWithError:&v41];
        id v35 = v41;

        if ((v34 & 1) == 0)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
          if (!v36) {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v39 = (void *)objc_opt_class(a1, v38);
            *(_DWORD *)buf = 138543618;
            id v43 = v39;
            __int16 v44 = 2114;
            id v45 = v35;
            id v40 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to save the account after updating its account flags. error = %{public}@",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v12) {
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v12, "OSLogObject"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_opt_class(a1, v24);
        id v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringValue]);
        uint64_t v29 = AMSHashIfNeeded(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138543618;
        id v43 = v25;
        __int16 v44 = 2114;
        id v45 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to update an account's account flags. No account exists with the specified DSID, %{public}@.",  buf,  0x16u);
      }
    }
  }
}

@end