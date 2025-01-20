@interface AMSDGenerateMultiUserTokenTask
+ (double)_scheduleRefreshInterval;
- (ACAccount)account;
- (AMSDGenerateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5;
- (AMSDHome)home;
- (AMSDMultiUserController)controller;
- (AMSDMultiUserMetrics)metrics;
- (BOOL)_saveMultiUserToken:(id)a3 forHomeParticipant:(id)a4 iCloudAccount:(id)a5 error:(id *)a6;
- (BOOL)_shouldGenerateInviteToken;
- (BOOL)tokenNeedsRegeneration;
- (id)_generateAppProvidedDataWithAction:(id)a3 inviteToken:(id)a4;
- (id)_generateMultiUserTokenWithAction:(id)a3 iCloudAccount:(id)a4 inviteToken:(id)a5 error:(id *)a6;
- (id)_saveRecord:(id)a3 database:(id)a4;
- (id)_shareRecord:(id)a3 withError:(id *)a4;
- (id)performTask;
- (void)setMetrics:(id)a3;
- (void)setTokenNeedsRegeneration:(BOOL)a3;
@end

@implementation AMSDGenerateMultiUserTokenTask

- (AMSDGenerateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AMSDGenerateMultiUserTokenTask;
  v12 = -[AMSDGenerateMultiUserTokenTask init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_controller, a3);
    objc_storeStrong((id *)&v13->_home, a5);
  }

  return v13;
}

- (id)performTask
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001D8D4;
  v5[3] = &unk_1000D6788;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask performTaskWithBlock:](self, "performTaskWithBlock:", v5));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_generateAppProvidedDataWithAction:(id)a3 inviteToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask home](self, "home"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAuthenticateOptions amsd_createAppProvidedDataWithMultiUserAction:home:]( &OBJC_CLASS___AMSAuthenticateOptions,  "amsd_createAppProvidedDataWithMultiUserAction:home:",  v7,  v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask account](self, "account"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_altDSID"));
  objc_msgSend(v9, "ams_setNullableObject:forKey:", v11, @"inviteeiTunesAltDsId");

  objc_msgSend( v9,  "ams_setNullableObject:forKey:",  @"com.apple.gs.itunes.mu.invite",  @"inviteeiTunesAuthTokenType");
  objc_msgSend(v9, "ams_setNullableObject:forKey:", v6, @"muInviteCode");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask account](self, "account"));
  id v35 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:",  v13,  AMSAccountGrandSlamTokenIdentifierMultiUser,  &v35));
  id v15 = v35;

  if (!v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class(self, v18);
      uint64_t v21 = AMSLogKey(v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v23 = AMSHashIfNeeded(v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v19;
      __int16 v38 = 2114;
      v39 = v22;
      __int16 v40 = 2114;
      v41 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch the GrandSlam token. error = %{public}@",  buf,  0x20u);
    }
  }

  objc_msgSend(v9, "ams_setNullableObject:forKey:", v14, @"inviteeiTunesAuthToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v25) {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = objc_opt_class(self, v27);
    uint64_t v30 = AMSLogKey(v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = AMSHashIfNeeded(v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v28;
    __int16 v38 = 2114;
    v39 = v31;
    __int16 v40 = 2114;
    v41 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] appProvidedData = %{public}@",  buf,  0x20u);
  }

  return v9;
}

- (id)_shareRecord:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = v9;
    __int16 v52 = 2114;
    v53 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Sharing a record.",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask controller](self, "controller"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cloudContainer]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 privateDatabase]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneIdentifier]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 shareForRecordZoneIdentifier:v17]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 fetchRecordWithRecordIdentifier:v19]);

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10001EF4C;
  v47[3] = &unk_1000D6710;
  v47[4] = self;
  id v21 = v18;
  id v48 = v21;
  id v22 = v15;
  id v49 = v22;
  v42 = v20;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 catchWithBlock:v47]);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10001EFBC;
  v45[3] = &unk_1000D67F0;
  v45[4] = self;
  id v24 = v22;
  id v46 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 thenWithBlock:v45]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10001F1F4;
  v44[3] = &unk_1000D6818;
  v44[4] = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 thenWithBlock:v44]);
  id v43 = 0LL;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 resultWithError:&v43]);
  id v28 = v43;
  if (v27)
  {
    id v29 = v27;
  }

  else
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v30) {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = objc_opt_class(self, v32);
      uint64_t v34 = AMSLogKey(v39, v33);
      __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v34);
      uint64_t v35 = AMSHashIfNeeded(v28);
      uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = v39;
      __int16 v52 = 2114;
      v53 = v40;
      __int16 v54 = 2114;
      uint64_t v55 = v36;
      uint64_t v37 = (void *)v36;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to share the record. error = %{public}@",  buf,  0x20u);
    }

    if (a4) {
      *a4 = v28;
    }
  }

  return v27;
}

- (id)_generateMultiUserTokenWithAction:(id)a3 iCloudAccount:(id)a4 inviteToken:(id)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDGenerateMultiUserTokenTask _generateAppProvidedDataWithAction:inviteToken:]( self,  "_generateAppProvidedDataWithAction:inviteToken:",  a3,  a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAuthenticateOptions amsd_multiUserAuthenticateOptionsWithAppProvidedData:]( &OBJC_CLASS___AMSAuthenticateOptions,  "amsd_multiUserAuthenticateOptionsWithAppProvidedData:",  v11));
  [v12 setAuthenticationType:1];
  [v12 setDebugReason:@"Generating a multi-user token"];
  id v13 = [[AMSAuthKitUpdateTask alloc] initWithAccount:v10 options:v12];

  [v13 setRunMode:1];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 performAuthKitUpdate]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 thenWithBlock:&stru_1000D6858]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 resultWithError:a6]);
  return v16;
}

- (BOOL)_saveMultiUserToken:(id)a3 forHomeParticipant:(id)a4 iCloudAccount:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_altDSID"));
  [v11 setField:v13 forKey:@"AMSHomeParticipant_iCloudAltDSID"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_DSID"));
  [v11 setField:v14 forKey:@"AMSHomeParticipant_iCloudDSID"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask account](self, "account"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_altDSID"));
  [v11 setField:v16 forKey:@"AMSHomeParticipant_iTunesAltDSID"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask account](self, "account"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_DSID"));
  [v11 setField:v18 forKey:@"AMSHomeParticipant_iTunesDSID"];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask account](self, "account"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 username]);
  [v11 setField:v20 forKey:@"AMSHomeParticipant_iTunesUsername"];

  [v11 setField:v12 forKey:@"AMSHomeParticipant_MultiUserToken"];
  [v11 setField:&__kCFBooleanFalse forKey:@"AMSHomeParticipant_MultiUserTokenInvalid"];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask controller](self, "controller"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 cloudContainer]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 privateDatabase]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask _saveRecord:database:](self, "_saveRecord:database:", v11, v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 resultWithError:a6]);
  LOBYTE(a6) = v25 != 0LL;

  return (char)a6;
}

- (id)_saveRecord:(id)a3 database:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a4 saveRecord:a3]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001F7E0;
  v7[3] = &unk_1000D6880;
  v7[4] = self;
  [v5 addFinishBlock:v7];
  return v5;
}

+ (double)_scheduleRefreshInterval
{
  id v2 = a1;
  objc_sync_enter(v2);
  else {
    double v3 = *(double *)&qword_1000F1FB8 + *(double *)&qword_1000F1FB8;
  }
  qword_1000F1FB8 = *(void *)&v3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldGenerateInviteToken
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDGenerateMultiUserTokenTask home](self, "home"));
  char v3 = [v2 isCurrentUserOwner] ^ 1;

  return v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDHome)home
{
  return self->_home;
}

- (BOOL)tokenNeedsRegeneration
{
  return self->_tokenNeedsRegeneration;
}

- (void)setTokenNeedsRegeneration:(BOOL)a3
{
  self->_tokenNeedsRegeneration = a3;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end