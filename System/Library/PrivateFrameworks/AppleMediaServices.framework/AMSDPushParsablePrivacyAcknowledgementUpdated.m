@interface AMSDPushParsablePrivacyAcknowledgementUpdated
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsablePrivacyAcknowledgementUpdated

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
    id v61 = (id)objc_opt_class(a1, v9);
    id v10 = v61;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received a push notification to update an account's privacy acknowledgement.",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v14) {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      v45 = (void *)objc_opt_class(a1, v44);
      v36 = v45;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
      uint64_t v47 = AMSHashIfNeeded(v46);
      v48 = v11;
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      *(_DWORD *)buf = 138543618;
      id v61 = v45;
      __int16 v62 = 2114;
      v63 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to update an account's privacy acknowledgement. No account exists with the specified DSID, %{public}@.",  buf,  0x16u);

      v11 = v48;
      goto LABEL_35;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"privacyAcknowledgement"]);
    if (!v14)
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v35) {
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v35, "OSLogObject"));
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)objc_opt_class(a1, v50);
        *(_DWORD *)buf = 138543362;
        id v61 = v51;
        id v52 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to update an account's privacy acknowledgement. The value for 'privacyAcknowledgement' in t he push notification is nil.",  buf,  0xCu);
      }

      goto LABEL_35;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedPushNotificationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedPushNotificationConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    id v58 = a1;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v56 = v12;
      v18 = v11;
      v19 = (void *)objc_opt_class(a1, v17);
      id v54 = v19;
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 hashedDescription]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
      uint64_t v22 = AMSHashIfNeeded(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543874;
      id v61 = v19;
      v11 = v18;
      v12 = v56;
      __int16 v62 = 2114;
      v63 = v20;
      __int16 v64 = 2114;
      v65 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: account = %{public}@ | newPrivacyAcknowledgement = %{public}@",  buf,  0x20u);

      a1 = v58;
    }

    id v24 = objc_msgSend(v13, "ams_mergePrivacyAcknowledgement:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedPushNotificationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedPushNotificationConfig"));
    if (!v25) {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v55 = v24;
      v28 = (void *)objc_opt_class(a1, v27);
      id v53 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_privacyAcknowledgement"));
      v57 = v11;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
      uint64_t v31 = AMSHashIfNeeded(v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138543618;
      id v61 = v28;
      id v24 = v55;
      __int16 v62 = 2114;
      v63 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: updatedPrivacyAcknowledgement = %{public}@",  buf,  0x16u);

      v11 = v57;
    }

    if (v24)
    {
      objc_msgSend(v13, "ams_setDisablePrivacyAcknowledgementSync:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_saveAccount:", v13));
      id v59 = 0LL;
      unsigned __int8 v34 = [v33 resultWithError:&v59];
      v35 = (os_log_s *)v59;

      if ((v34 & 1) != 0)
      {
LABEL_36:

        goto LABEL_37;
      }

      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v36) {
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v36, "OSLogObject"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v39 = (void *)objc_opt_class(v58, v38);
        *(_DWORD *)buf = 138543618;
        id v61 = v39;
        __int16 v62 = 2114;
        v63 = v35;
        id v40 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to save the account after updating its privacyAcknowledgement. error = %{public}@",  buf,  0x16u);
      }

LABEL_35:
      goto LABEL_36;
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      v42 = (void *)objc_opt_class(a1, v41);
      *(_DWORD *)buf = 138543362;
      id v61 = v42;
      id v43 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%{public}@: Unable to update an account's privacy acknowledgement. The push notification doesn't have a DSID.",  buf,  0xCu);
    }
  }

@end