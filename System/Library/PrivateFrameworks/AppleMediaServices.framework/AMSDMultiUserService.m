@interface AMSDMultiUserService
+ (AMSDMultiUserService)sharedService;
+ (Class)machService;
+ (id)_sanitizeError:(id)a3;
- (AMSDMultiUserController)multiUserController;
- (AMSDMultiUserService)initWithMultiUserController:(id)a3;
- (id)_multiUserTokenForHomeuser:(id)a3 home:(id)a4 database:(id)a5 metrics:(id)a6 qualityOfService:(int64_t)a7;
- (void)_multiUserTokenForHomeIdentifier:(id)a3 homeUserIdentifier:(id)a4 metrics:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)generateInfoWithCompletion:(id)a3;
- (void)iTunesAccountIsHomeOwner:(id)a3 completion:(id)a4;
- (void)importMultiUserTokenWithInfoDictionary:(id)a3 completion:(id)a4;
- (void)invalidateMultiUserTokenForAccount:(id)a3 homeUserIdentifier:(id)a4 completion:(id)a5;
- (void)multiUserTokenForAccount:(id)a3 completion:(id)a4;
- (void)multiUserTokenForAccount:(id)a3 homeUserIdentifier:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)multiUserTokenFromCloudKitForAccount:(id)a3 homeUserIdentifier:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)multiUserTokenFromKeychainForAccount:(id)a3 completion:(id)a4;
- (void)performMultiUserAuthenticationForHomeUserIdentifier:(id)a3 completion:(id)a4;
- (void)refreshAfterTimeInterval:(double)a3 completion:(id)a4;
- (void)setiTunesAccount:(id)a3 forHomeWithIdentifier:(id)a4 completion:(id)a5;
- (void)storeMultiUserTokenInKeychainForAccount:(id)a3 token:(id)a4 completion:(id)a5;
@end

@implementation AMSDMultiUserService

+ (Class)machService
{
  return (Class)objc_opt_class(&OBJC_CLASS___AMSMultiUserService, a2);
}

+ (AMSDMultiUserService)sharedService
{
  if (qword_1000F2028 != -1) {
    dispatch_once(&qword_1000F2028, &stru_1000D70A8);
  }
  return (AMSDMultiUserService *)(id)qword_1000F2030;
}

- (AMSDMultiUserService)initWithMultiUserController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDMultiUserService;
  v6 = -[AMSDMultiUserService init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_multiUserController, a3);
  }

  return v7;
}

- (void)generateInfoWithCompletion:(id)a3
{
  id v32 = a3;
  id v5 = (id)AMSSetLogKey(0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject", v32));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543874;
    uint64_t v42 = v9;
    __int16 v43 = 2114;
    v44 = v12;
    __int16 v45 = 2114;
    v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.generateInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudContainer]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 privateDatabase]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cloudContainer]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sharedDatabase]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 homeManager]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allHomes]);
  v40[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v17 fetchRecordZones]);
  v40[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v20 fetchRecordZones]);
  v40[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 3LL));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:timeout:](&OBJC_CLASS___AMSPromise, "promiseWithAll:timeout:", v26, 60.0));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10002CBCC;
  v37[3] = &unk_1000D6D10;
  id v38 = v17;
  id v39 = v20;
  id v28 = v20;
  id v29 = v17;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v27 thenWithBlock:v37]);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10002DBB8;
  v34[3] = &unk_1000D71C0;
  v35 = @"com.apple.amsaccountsd.AMSDMultiUserService.generateInfo";
  id v36 = v33;
  id v31 = v33;
  [v30 addFinishBlock:v34];
}

- (void)iTunesAccountIsHomeOwner:(id)a3 completion:(id)a4
{
  id v78 = a3;
  v6 = (void (**)(id, id, void))a4;
  id v7 = (id)AMSSetLogKey(0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = AMSLogKey(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v80 = v11;
    __int16 v81 = 2114;
    v82 = v14;
    __int16 v83 = 2114;
    v84 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "ams_homeUserAllIdentifiers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "ams_homeIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 homeManager]);
  v76 = (void *)objc_claimAutoreleasedReturnValue([v21 homeWithHomeIdentifier:v19]);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 homeManager]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 primaryUser]);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v20 homeManager]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentHome]);
  unsigned int v26 = [v25 isCurrentUserOwner];

  uint64_t v27 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
  id v28 = (void *)v27;
  if (v23)
  {
    unsigned int v74 = v26;
    v75 = v23;
    if (!v27) {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v71 = v19;
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___AMSDMultiUserService, v30);
      uint64_t v33 = AMSLogKey(v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v20 homeManager]);
      v73 = v6;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 currentHome]);
      uint64_t v37 = AMSHashIfNeeded(v36);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      uint64_t v39 = AMSHashIfNeeded(v78);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      uint64_t v41 = AMSHashIfNeeded(v75);
      v72 = v18;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138544386;
      uint64_t v80 = v31;
      v19 = v71;
      __int16 v81 = 2114;
      v82 = v34;
      __int16 v83 = 2114;
      v84 = v38;
      __int16 v85 = 2114;
      v86 = v40;
      __int16 v87 = 2114;
      v88 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Checking for home ownership home: %{public}@ account: %{public}@ owner: %{public}@",  buf,  0x34u);

      v6 = v73;
      v18 = v72;
    }

    uint64_t v43 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
    v44 = (void *)v43;
    if (v18)
    {
      v23 = v75;
      if (!v43) {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "OSLogObject", v71));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = objc_opt_class(self, v46);
        uint64_t v49 = AMSLogKey(v47, v48);
        v50 = v19;
        v51 = (void *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 138543618;
        uint64_t v80 = v47;
        __int16 v81 = 2114;
        v82 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Comparing owner / account identifiers",  buf,  0x16u);

        v19 = v50;
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue([v75 identifier]);
      v6[2](v6, [v52 isEqual:v18], 0);
    }

    else
    {
      v23 = v75;
      if (!v43) {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "OSLogObject", v71));
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v66 = objc_opt_class(self, v65);
        uint64_t v68 = AMSLogKey(v66, v67);
        v69 = v19;
        v70 = (void *)objc_claimAutoreleasedReturnValue(v68);
        *(_DWORD *)buf = 138543618;
        uint64_t v80 = v66;
        __int16 v81 = 2114;
        v82 = v70;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Checking currentUserIsOwner",  buf,  0x16u);

        v19 = v69;
      }

      v6[2](v6, (id)v74, 0LL);
    }
  }

  else
  {
    if (!v27) {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      uint64_t v55 = objc_opt_class(&OBJC_CLASS___AMSDMultiUserService, v54);
      uint64_t v57 = AMSLogKey(v55, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      uint64_t v59 = AMSHashIfNeeded(v78);
      v60 = v6;
      v61 = (void *)objc_claimAutoreleasedReturnValue(v59);
      *(_DWORD *)buf = 138543874;
      uint64_t v80 = v55;
      __int16 v81 = 2114;
      v82 = v58;
      __int16 v83 = 2114;
      v84 = v61;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to locate home owner. account = %{public}@",  buf,  0x20u);

      v6 = v60;
    }

    uint64_t v62 = AMSError( 7LL,  @"Home owner not found",  @"The primary user for the current home returned empty, unable to determine home ownership.",  0LL);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    ((void (**)(id, id, void *))v6)[2](v6, 0LL, v63);
  }
}

- (void)importMultiUserTokenWithInfoDictionary:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)AMSSetLogKey(0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  LODWORD(v13) = os_signpost_enabled(v12);

  if (!v10) {
  if ((_DWORD)v13)
  }
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    v15 = v14;
    if (!v14) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    if (!v14) {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    }
    v19 = v18;
    if (v18)
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    }

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v22 = NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = (uint64_t)v23;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "importMultiUserToken",  "%{public}@",  buf,  0xCu);
    }
  }

  else
  {
    os_signpost_id_t v17 = 0LL;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v24) {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = objc_opt_class(self, v26);
    uint64_t v29 = AMSLogKey(v27, v28);
    os_signpost_id_t v40 = v17;
    char v30 = (char)v13;
    id v13 = v8;
    id v31 = v7;
    uint64_t v32 = self;
    uint64_t v33 = a2;
    v34 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v35 = NSStringFromSelector(v33);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    *(_DWORD *)buf = 138543874;
    uint64_t v48 = v27;
    __int16 v49 = 2114;
    v50 = v34;
    __int16 v51 = 2114;
    v52 = v36;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    a2 = v33;
    self = v32;
    id v7 = v31;
    id v8 = v13;
    LOBYTE(v13) = v30;
    os_signpost_id_t v17 = v40;
  }

  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.importMultiUserTokenWithInfoDictionary");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 performAuthenticationWithExportedToken:v8]);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10002E5E4;
  v41[3] = &unk_1000D71E8;
  char v46 = (char)v13;
  os_signpost_id_t v44 = v17;
  SEL v45 = a2;
  uint64_t v42 = @"com.apple.amsaccountsd.AMSDMultiUserService.importMultiUserTokenWithInfoDictionary";
  id v43 = v7;
  id v39 = v7;
  [v38 addFinishBlock:v41];
}

- (void)invalidateMultiUserTokenForAccount:(id)a3 homeUserIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (id)AMSSetLogKey(0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = objc_opt_class(self, v15);
    uint64_t v18 = AMSLogKey(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v16;
    __int16 v55 = 2114;
    uint64_t v56 = v19;
    __int16 v57 = 2114;
    v58 = v21;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.invalidateMultiUserTokenForAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v52 = 0LL;
  objc_msgSend(v22, "ams_setMultiUserToken:forAccount:error:", 0, v9, &v52);
  id v23 = v52;

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v24) {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_opt_class(self, v26);
    SEL v45 = self;
    id v28 = v11;
    id v29 = v23;
    uint64_t v30 = v27;
    uint64_t v32 = AMSLogKey(v27, v31);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = AMSHashIfNeeded(v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    uint64_t v36 = AMSHashIfNeeded(v10);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    *(_DWORD *)buf = 138544130;
    uint64_t v54 = v30;
    id v23 = v29;
    id v11 = v28;
    self = v45;
    __int16 v55 = 2114;
    uint64_t v56 = v33;
    __int16 v57 = 2114;
    v58 = v35;
    __int16 v59 = 2114;
    v60 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Sending a multi-user token invalidated message. account = %{public}@ | homeUserIdentifier = %{public}@",  buf,  0x2Au);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 fetchHomeHomeUserPairForAccount:v9 homeUserIdentifier:v10]);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10002EB40;
  v50[3] = &unk_1000D7210;
  id v51 = v38;
  id v40 = v38;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 thenWithBlock:v50]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 binaryPromiseAdapter]);

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10002EBE4;
  v46[3] = &unk_1000D7238;
  id v47 = v9;
  uint64_t v48 = @"com.apple.amsaccountsd.AMSDMultiUserService.invalidateMultiUserTokenForAccount";
  id v49 = v11;
  id v43 = v11;
  id v44 = v9;
  [v42 addFinishBlock:v46];
}

- (void)multiUserTokenFromKeychainForAccount:(id)a3 completion:(id)a4
{
  id v10 = (void (**)(id, void *, void))a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_multiUserTokenForAccount:", v5));

  if (v7)
  {
    v10[2](v10, v7, 0LL);
  }

  else
  {
    uint64_t v8 = AMSError(7LL, @"Token not found", 0LL, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v9);
  }
}

- (void)storeMultiUserTokenInKeychainForAccount:(id)a3 token:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v13 = 0LL;
  id v11 = objc_msgSend(v10, "ams_setMultiUserToken:forAccount:error:", v8, v9, &v13);

  id v12 = v13;
  v7[2](v7, v11, v12);
}

- (void)multiUserTokenFromCloudKitForAccount:(id)a3 homeUserIdentifier:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v49 = a4;
  id v48 = a6;
  id v11 = (id)AMSSetLogKey(0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class(self, v14);
    uint64_t v17 = AMSLogKey(v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138543874;
    uint64_t v56 = v15;
    __int16 v57 = 2114;
    v58 = v18;
    __int16 v59 = 2114;
    v60 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  v21 = objc_alloc_init(&OBJC_CLASS___AMSDMultiUserMetrics);
  id v22 =  -[AMSDMultiUserMetrics enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:]( v21,  "enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:",  v10);
  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.multiUserTokenForAccount");
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v23) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class(self, v25);
    uint64_t v28 = AMSLogKey(v26, v27);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = AMSHashIfNeeded(v49);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = AMSHashIfNeeded(v10);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138544130;
    uint64_t v56 = v26;
    __int16 v57 = 2114;
    v58 = v29;
    __int16 v59 = 2114;
    v60 = v31;
    __int16 v61 = 2114;
    uint64_t v62 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Fetching a multi-user token from CloudKit. homeUserIdentifier = %{public}@ | account = %{public}@",  buf,  0x2Au);
  }

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_homeIdentifier"));
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_homeIdentifier"));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10002F400;
    v50[3] = &unk_1000D7260;
    id v51 = v21;
    id v52 = v10;
    uint64_t v36 = v48;
    v53 = @"com.apple.amsaccountsd.AMSDMultiUserService.multiUserTokenForAccount";
    id v54 = v48;
    uint64_t v37 = v49;
    -[AMSDMultiUserService _multiUserTokenForHomeIdentifier:homeUserIdentifier:metrics:qualityOfService:completion:]( self,  "_multiUserTokenForHomeIdentifier:homeUserIdentifier:metrics:qualityOfService:completion:",  v35,  v49,  v51,  a5,  v50);

    id v38 = v51;
  }

  else
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    uint64_t v36 = v48;
    if (!v39) {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 OSLogObject]);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_opt_class(self, v41);
      uint64_t v44 = AMSLogKey(v42, v43);
      SEL v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v42;
      __int16 v57 = 2114;
      v58 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to fetch the multi-user token. The account doesn't have a home identifier.",  buf,  0x16u);
    }

    uint64_t v46 = AMSError(2LL, @"Invalid Home Identifier", @"No home exists with the given home identifier.", 0LL);
    id v38 = (AMSDMultiUserMetrics *)objc_claimAutoreleasedReturnValue(v46);
    (*((void (**)(id, void, AMSDMultiUserMetrics *))v48 + 2))(v48, 0LL, v38);
    uint64_t v37 = v49;
  }
}

- (void)multiUserTokenForAccount:(id)a3 homeUserIdentifier:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v59 = a4;
  id v58 = a6;
  id v11 = (id)AMSSetLogKey(0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "OSLogObject", a5));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class(self, v14);
    uint64_t v17 = AMSLogKey(v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138543874;
    uint64_t v67 = v15;
    __int16 v68 = 2114;
    v69 = v18;
    __int16 v70 = 2114;
    v71 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  v21 = objc_alloc_init(&OBJC_CLASS___AMSDMultiUserMetrics);
  id v22 =  -[AMSDMultiUserMetrics enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:]( v21,  "enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:",  v10);
  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.multiUserTokenForAccount");
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v23) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class(self, v25);
    uint64_t v28 = AMSLogKey(v26, v27);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = AMSHashIfNeeded(v59);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = AMSHashIfNeeded(v10);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138544130;
    uint64_t v67 = v26;
    __int16 v68 = 2114;
    v69 = v29;
    __int16 v70 = 2114;
    v71 = v31;
    __int16 v72 = 2114;
    v73 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Fetching a multi-user token. homeUserIdentifier = %{public}@ | account = %{public}@",  buf,  0x2Au);
  }

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ams_multiUserTokenForAccount:", v10));

  if (v35)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v36) {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = objc_opt_class(self, v38);
      uint64_t v41 = AMSLogKey(v39, v40);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138543618;
      uint64_t v67 = v39;
      __int16 v68 = 2114;
      v69 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Multi-user token located in keychain.",  buf,  0x16u);
    }

    id v43 =  -[AMSDMultiUserMetrics enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:]( v21,  "enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:",  v10);
    uint64_t v44 = v58;
    (*((void (**)(id, void *, void))v58 + 2))(v58, v35, 0LL);
  }

  else
  {
    SEL v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_homeIdentifier"));

    if (v45)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_homeIdentifier"));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_10002FA88;
      v60[3] = &unk_1000D7288;
      __int16 v61 = v21;
      id v62 = v10;
      v63 = self;
      uint64_t v44 = v58;
      v64 = @"com.apple.amsaccountsd.AMSDMultiUserService.multiUserTokenForAccount";
      id v65 = v58;
      -[AMSDMultiUserService _multiUserTokenForHomeIdentifier:homeUserIdentifier:metrics:qualityOfService:completion:]( self,  "_multiUserTokenForHomeIdentifier:homeUserIdentifier:metrics:qualityOfService:completion:",  v46,  v59,  v61,  v57,  v60);
    }

    else
    {
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v47) {
        id v47 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = objc_opt_class(self, v49);
        uint64_t v52 = AMSLogKey(v50, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        *(_DWORD *)buf = 138543618;
        uint64_t v67 = v50;
        __int16 v68 = 2114;
        v69 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to fetch the multi-user token. The account doesn't have a home identifier.",  buf,  0x16u);
      }

      uint64_t v54 = AMSError( 2LL,  @"Invalid Home Identifier",  @"No home exists with the given home identifier.",  0LL);
      __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      uint64_t v44 = v58;
      (*((void (**)(id, void, void *))v58 + 2))(v58, 0LL, v55);
    }
  }
}

- (void)performMultiUserAuthenticationForHomeUserIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v77 = a4;
  id v8 = (id)AMSSetLogKey(0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = AMSLogKey(v12, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543874;
    uint64_t v91 = v12;
    __int16 v92 = 2114;
    v93 = v15;
    __int16 v94 = 2114;
    v95 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.performMultiUserAuthenticationForHomeUser");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v18) {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class(self, v20);
    uint64_t v23 = AMSLogKey(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = AMSHashIfNeeded(v7);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138543874;
    uint64_t v91 = v21;
    __int16 v92 = 2114;
    v93 = v24;
    __int16 v94 = 2114;
    v95 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing a multi-user authentication. homeUserIdentifier = %{public}@",  buf,  0x20u);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 homeManager]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 currentHome]);

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 users]);
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_1000304B0;
  v88[3] = &unk_1000D5ED8;
  id v31 = v7;
  id v89 = v31;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ams_firstObjectPassingTest:", v88));

  if (v29 && v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ams_iTunesAccountWithHomeUserIdentifier:", v31));

    if (v34
      && (v35 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( ACAccountStore,  "ams_sharedAccountStore")),  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ams_multiUserTokenForAccount:", v34)),  v36,  v35,  v36))
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v37) {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 OSLogObject]);
      uint64_t v40 = v77;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = objc_opt_class(self, v39);
        uint64_t v43 = AMSLogKey(v41, v42);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = 138543618;
        uint64_t v91 = v41;
        __int16 v92 = 2114;
        v93 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing Authentication using token stored in keychain.",  buf,  0x16u);
      }

      SEL v45 = (AMSDFetchMultiUserRecordZoneTask *)objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
      -[AMSDFetchMultiUserRecordZoneTask setAuthenticationType:](v45, "setAuthenticationType:", 1LL);
      -[AMSDFetchMultiUserRecordZoneTask setCanMakeAccountActive:](v45, "setCanMakeAccountActive:", 0LL);
      -[AMSDFetchMultiUserRecordZoneTask setDebugReason:]( v45,  "setDebugReason:",  @"Performing Authentication with Home User ID");
      id v46 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v45];
      id v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ams_altDSID"));
      [v46 setAltDSID:v47];

      id v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ams_DSID"));
      [v46 setDSID:v48];

      [v46 setHomeUserIdentifier:v31];
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v46 performAuthentication]);
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472LL;
      v85[2] = sub_1000304F0;
      v85[3] = &unk_1000D72B0;
      v86 = @"com.apple.amsaccountsd.AMSDMultiUserService.performMultiUserAuthenticationForHomeUser";
      __int16 v87 = (AMSDMultiUserMetrics *)v77;
      [v49 resultWithCompletion:v85];

      uint64_t v50 = v87;
    }

    else
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v64) {
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "OSLogObject", v34));
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = objc_opt_class(self, v66);
        uint64_t v69 = AMSLogKey(v67, v68);
        __int16 v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        *(_DWORD *)buf = 138543618;
        uint64_t v91 = v67;
        __int16 v92 = 2114;
        v93 = v70;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing Authentication using AMSHomeParticipant record.",  buf,  0x16u);
      }

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
      __int16 v72 = (void *)objc_claimAutoreleasedReturnValue([v71 databaseForHome:v29 user:v32]);

      v73 = objc_alloc_init(&OBJC_CLASS___AMSDMultiUserMetrics);
      SEL v45 = -[AMSDFetchMultiUserRecordZoneTask initWithHome:homeUser:database:metrics:]( objc_alloc(&OBJC_CLASS___AMSDFetchMultiUserRecordZoneTask),  "initWithHome:homeUser:database:metrics:",  v29,  v32,  v72,  v73);
      unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask performTask](v45, "performTask"));
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472LL;
      v83[2] = sub_100030524;
      v83[3] = &unk_1000D72D8;
      id v84 = v72;
      id v46 = v72;
      v75 = (void *)objc_claimAutoreleasedReturnValue([v74 continueWithBlock:v83]);

      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472LL;
      v78[2] = sub_1000305A0;
      v78[3] = &unk_1000D7300;
      v79 = v73;
      __int16 v81 = self;
      id v82 = v77;
      uint64_t v80 = @"com.apple.amsaccountsd.AMSDMultiUserService.performMultiUserAuthenticationForHomeUser";
      uint64_t v50 = v73;
      [v75 resultWithCompletion:v78];

      uint64_t v40 = v77;
      uint64_t v34 = v76;
    }
  }

  else
  {
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v51) {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 OSLogObject]);
    uint64_t v40 = v77;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v54 = objc_opt_class(self, v53);
      uint64_t v56 = AMSLogKey(v54, v55);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      uint64_t v58 = AMSHashIfNeeded(v29);
      id v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      uint64_t v60 = AMSHashIfNeeded(v32);
      __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      *(_DWORD *)buf = 138544130;
      uint64_t v91 = v54;
      __int16 v92 = 2114;
      v93 = v57;
      __int16 v94 = 2114;
      v95 = v59;
      __int16 v96 = 2114;
      v97 = v61;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Home user identifier returned no results. home = %{public}@ user = %{public}@",  buf,  0x2Au);
    }

    uint64_t v62 = AMSError( 2LL,  @"Missing home/user pair",  @"Unable to locate a home and home user for the given home user identifier",  0LL);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    (*((void (**)(id, void, void *))v77 + 2))(v77, 0LL, v63);

    +[AMSDTransactionStore releaseKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "releaseKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.performMultiUserAuthenticationForHomeUser");
  }
}

- (void)refreshAfterTimeInterval:(double)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = (id)AMSSetLogKey(0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = AMSLogKey(v12, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v12;
    __int16 v27 = 2114;
    uint64_t v28 = v15;
    __int16 v29 = 2114;
    uint64_t v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }

  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDMultiUserService.refresh");
  uint64_t v18 = -[AMSDRefreshMultiUserOptions initWithReason:]( objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserOptions),  "initWithReason:",  @"amstool");
  -[AMSDRefreshMultiUserOptions setSchedulingInterval:](v18, "setSchedulingInterval:", a3);
  -[AMSDRefreshMultiUserOptions setThrottlingInterval:](v18, "setThrottlingInterval:", a3);
  -[AMSDRefreshMultiUserOptions setShouldUseCloudData:](v18, "setShouldUseCloudData:", 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 refreshWithOptions:v18]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100030940;
  v22[3] = &unk_1000D7328;
  uint64_t v23 = @"com.apple.amsaccountsd.AMSDMultiUserService.refresh";
  id v24 = v7;
  id v21 = v7;
  [v20 addFinishBlock:v22];
}

- (void)setiTunesAccount:(id)a3 forHomeWithIdentifier:(id)a4 completion:(id)a5
{
  id v6 = a5;
  uint64_t v7 = AMSError(5LL, @"Platform Not Supported", @"Not supported on this platform.", 0LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a5 + 2))(v6, 0LL, v8);
}

- (void)_multiUserTokenForHomeIdentifier:(id)a3 homeUserIdentifier:(id)a4 metrics:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserService multiUserController](self, "multiUserController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 homeManager]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 homeWithHomeIdentifier:v12]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100030BE8;
  v33[3] = &unk_1000D7350;
  id v19 = v13;
  id v34 = v19;
  id v35 = v16;
  uint64_t v36 = self;
  id v20 = v14;
  id v37 = v20;
  int64_t v38 = a6;
  id v21 = v16;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 continueWithBlock:v33]);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10003106C;
  v27[3] = &unk_1000D73A0;
  v27[4] = self;
  id v28 = v12;
  id v29 = v19;
  id v30 = v20;
  id v31 = v15;
  int64_t v32 = a6;
  id v23 = v20;
  id v24 = v19;
  id v25 = v12;
  id v26 = v15;
  [v22 addFinishBlock:v27];
}

- (id)_multiUserTokenForHomeuser:(id)a3 home:(id)a4 database:(id)a5 metrics:(id)a6 qualityOfService:(int64_t)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = -[AMSDFetchMultiUserRecordZoneTask initWithHome:homeUser:database:metrics:]( objc_alloc(&OBJC_CLASS___AMSDFetchMultiUserRecordZoneTask),  "initWithHome:homeUser:database:metrics:",  v14,  v15,  v12,  v13);

  -[AMSDFetchMultiUserRecordZoneTask setQualityOfService:](v16, "setQualityOfService:", a7);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask performTask](v16, "performTask"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003151C;
  v22[3] = &unk_1000D73F0;
  id v23 = v13;
  id v24 = v12;
  int64_t v25 = a7;
  SEL v26 = a2;
  id v18 = v12;
  id v19 = v13;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 continueWithBlock:v22]);

  return v20;
}

+ (id)_sanitizeError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_underlyingError"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_underlyingError"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _sanitizeError:v6]);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v9 = [v4 code];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_title"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_message"));
    uint64_t v12 = AMSCustomError(v8, v9, v10, v11, 0LL, v7);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  else
  {
    uint64_t v14 = AMSError(0LL, 0LL, 0LL, 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  return v13;
}

- (void)multiUserTokenForAccount:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (id)AMSSetLogKey(0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_homeUserAllIdentifiers"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  if (v9)
  {
    -[AMSDMultiUserService multiUserTokenForAccount:homeUserIdentifier:qualityOfService:completion:]( self,  "multiUserTokenForAccount:homeUserIdentifier:qualityOfService:completion:",  v12,  v9,  17LL,  v6);
  }

  else
  {
    uint64_t v10 = AMSError( 2LL,  @"No Home User Identifier",  @"The account isn't associated with any home users.",  0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v6[2](v6, 0LL, v11);
  }
}

- (AMSDMultiUserController)multiUserController
{
  return self->_multiUserController;
}

- (void).cxx_destruct
{
}

@end