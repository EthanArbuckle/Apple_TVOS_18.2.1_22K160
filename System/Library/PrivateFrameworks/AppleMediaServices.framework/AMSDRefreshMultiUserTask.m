@interface AMSDRefreshMultiUserTask
+ (id)_createGenerateMultiUserTokenTaskForAccount:(id)a3 withController:(id)a4 home:(id)a5 multiUserTokenExists:(BOOL)a6;
- (AMSDMultiUserController)controller;
- (AMSDMultiUserMetrics)metrics;
- (AMSDRefreshMultiUserOptions)options;
- (AMSDRefreshMultiUserTask)initWithMultiUserController:(id)a3 homes:(id)a4 options:(id)a5;
- (BOOL)_createMultiUserTokenForHome:(id)a3 error:(id *)a4;
- (NSArray)homes;
- (id)performTask;
- (void)_configurePreferredMediaUser:(id)a3;
- (void)_createMultiUserTokensWithErrors:(id)a3;
- (void)_reconcileRecordZonesWithErrors:(id)a3;
- (void)_reconcileiTunesAccountsWithErrors:(id)a3;
- (void)_refreshCloudDatabasesWithErrors:(id)a3;
- (void)_removeRenewCredentialsFollowUp;
- (void)_transferHomeSettingsToAccountsWithErrors:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AMSDRefreshMultiUserTask

- (AMSDRefreshMultiUserTask)initWithMultiUserController:(id)a3 homes:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AMSDRefreshMultiUserTask;
  v12 = -[AMSDRefreshMultiUserTask init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a3);
    objc_storeStrong((id *)&v13->_homes, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (id)performTask
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003DA24;
  v3[3] = &unk_1000D6328;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserTask performTaskWithBlock:]( self,  "performTaskWithBlock:",  v3));
}

- (void)_configurePreferredMediaUser:(id)a3
{
  id v5 = a3;
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers]( &OBJC_CLASS___AMSDMultiUserController,  "deviceSupportsMultipleUsers")
    && (-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    v6 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask ams_activeiTunesAccount](v6, "ams_activeiTunesAccount"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 homeManager]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preferredMediaUser]);

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserTask ams_iTunesAccountWithHomeUserIdentifier:]( v6,  "ams_iTunesAccountWithHomeUserIdentifier:",  v11));

        if (v12
          && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_DSID")),
              unsigned __int8 v15 = [v13 isEqualToNumber:v14],
              v14,
              v13,
              (v15 & 1) == 0))
        {
          id v16 = (id)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v16) {
            id v16 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
          BOOL v50 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v50)
          {
            v125 = v7;
            uint64_t v52 = AMSLogKey(v50, v51);
            uint64_t v53 = objc_claimAutoreleasedReturnValue(v52);
            uint64_t v55 = objc_opt_class(self, v54);
            uint64_t v57 = v55;
            v124 = (void *)v53;
            v127 = v6;
            if (v53)
            {
              uint64_t v58 = AMSLogKey(v55, v56);
              uint64_t v122 = objc_claimAutoreleasedReturnValue(v58);
              v59 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v57,  v122));
            }

            else
            {
              v59 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v55));
            }

            uint64_t v95 = AMSHashIfNeeded(v10);
            v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
            uint64_t v97 = AMSHashIfNeeded(v12);
            v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
            uint64_t v99 = AMSHashIfNeeded(v125);
            v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
            *(_DWORD *)buf = 138544130;
            v131 = v59;
            __int16 v132 = 2114;
            v133 = v96;
            __int16 v134 = 2114;
            v135 = v98;
            __int16 v136 = 2114;
            v137 = v100;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@Active account does not match preferred media user. preferred media user = %{public}@ account = %{public}@ active account = %{public}@",  buf,  0x2Au);
            if (v124)
            {

              v59 = (AMSDRefreshMultiUserTask *)v122;
            }

            v7 = v125;
            v6 = v127;
          }
        }

        else
        {
          id v16 = (id)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v16) {
            id v16 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            v126 = v6;
            uint64_t v20 = AMSLogKey(v18, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v23 = objc_opt_class(self, v22);
            uint64_t v25 = v23;
            if (v21)
            {
              uint64_t v26 = AMSLogKey(v23, v24);
              self = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue(v26);
              v27 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v25,  self));
            }

            else
            {
              v27 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v23));
            }

            uint64_t v87 = AMSHashIfNeeded(v7);
            v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
            *(_DWORD *)buf = 138543618;
            v131 = v27;
            __int16 v132 = 2114;
            v133 = v88;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@Preferred media user set to active account = %{public}@",  buf,  0x16u);
            if (v21)
            {

              v27 = self;
            }

            v6 = v126;
          }
        }
      }

      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
        if (!v12) {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        id v16 = (id)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
        BOOL v40 = os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT);
        if (v40)
        {
          uint64_t v42 = AMSLogKey(v40, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          uint64_t v45 = objc_opt_class(self, v44);
          uint64_t v47 = v45;
          if (v43)
          {
            uint64_t v48 = AMSLogKey(v45, v46);
            self = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue(v48);
            v49 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v47,  self));
          }

          else
          {
            v49 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v45));
          }

          uint64_t v89 = AMSHashIfNeeded(v7);
          v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
          *(_DWORD *)buf = 138543618;
          v131 = v49;
          __int16 v132 = 2114;
          v133 = v90;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@Preferred media user set to HomePod account. active account = %{public}@",  buf,  0x16u);
          if (v43)
          {

            v49 = self;
          }
        }
      }

      goto LABEL_78;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v28) {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      uint64_t v32 = AMSLogKey(v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      uint64_t v35 = objc_opt_class(self, v34);
      uint64_t v37 = v35;
      if (v33)
      {
        uint64_t v38 = AMSLogKey(v35, v36);
        uint64_t v3 = objc_claimAutoreleasedReturnValue(v38);
        v39 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v37,  v3));
      }

      else
      {
        v39 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v35));
      }

      *(_DWORD *)buf = 138543362;
      v131 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@Missing active iTunes account. Attempting to repair.",  buf,  0xCu);
      if (v33)
      {

        v39 = (AMSDRefreshMultiUserTask *)v3;
      }
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 homeManager]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v61 preferredMediaUser]);

    v128 = v6;
    if (v10)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserTask ams_iTunesAccountWithHomeUserIdentifier:]( v6,  "ams_iTunesAccountWithHomeUserIdentifier:",  v62));

      uint64_t v63 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
      v64 = (void *)v63;
      if (v12)
      {
        if (!v63) {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64 OSLogObject]);
        BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
        if (!v66) {
          goto LABEL_76;
        }
        uint64_t v68 = AMSLogKey(v66, v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        uint64_t v71 = objc_opt_class(self, v70);
        uint64_t v73 = v71;
        if (v69)
        {
          uint64_t v74 = AMSLogKey(v71, v72);
          uint64_t v123 = objc_claimAutoreleasedReturnValue(v74);
          v75 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v73,  v123));
        }

        else
        {
          v75 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v71));
        }

        uint64_t v91 = AMSHashIfNeeded(v10);
        v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
        uint64_t v93 = AMSHashIfNeeded(v12);
        v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
        *(_DWORD *)buf = 138543874;
        v131 = v75;
        __int16 v132 = 2114;
        v133 = v92;
        __int16 v134 = 2114;
        v135 = v94;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "%{public}@Attempting to make preferred media user active. home user = %{public}@ account = %{public}@",  buf,  0x20u);
        if (v69)
        {

          v75 = (AMSDRefreshMultiUserTask *)v123;
        }

LABEL_75:
        v6 = v128;
LABEL_76:

        v7 = 0LL;
        if ([v12 isActive])
        {
LABEL_79:

          goto LABEL_80;
        }

        [v12 setActive:1];
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask ams_saveAccount:](v6, "ams_saveAccount:", v12));
        id v129 = 0LL;
        [v121 resultWithError:&v129];
        id v16 = v129;

        objc_msgSend(v5, "ams_addNullableObject:", v16);
LABEL_78:

        goto LABEL_79;
      }

      if (!v63) {
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64 OSLogObject]);
      BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
      if (v77)
      {
        uint64_t v79 = AMSLogKey(v77, v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        uint64_t v82 = objc_opt_class(self, v81);
        uint64_t v84 = v82;
        if (v80)
        {
          uint64_t v85 = AMSLogKey(v82, v83);
          v6 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue(v85);
          v86 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v84,  v6));
        }

        else
        {
          v86 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v82));
        }

        uint64_t v101 = AMSHashIfNeeded(v10);
        v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
        *(_DWORD *)buf = 138543618;
        v131 = v86;
        __int16 v132 = 2114;
        v133 = v102;
        _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "%{public}@A preferred media user is configured, however we don't have an associated media account. home user = %{public}@",  buf,  0x16u);
        if (v80)
        {

          v86 = v6;
        }

        v6 = v128;
      }
    }

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 homeManager]);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v104 primaryUser]);

    v105 = (void *)objc_claimAutoreleasedReturnValue([v64 identifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserTask ams_iTunesAccountWithHomeUserIdentifier:]( v6,  "ams_iTunesAccountWithHomeUserIdentifier:",  v105));

    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v65) {
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v65, "OSLogObject"));
    BOOL v107 = os_log_type_enabled(v106, OS_LOG_TYPE_ERROR);
    if (v107)
    {
      uint64_t v109 = AMSLogKey(v107, v108);
      v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
      uint64_t v112 = objc_opt_class(self, v111);
      uint64_t v114 = v112;
      if (v110)
      {
        uint64_t v115 = AMSLogKey(v112, v113);
        uint64_t v123 = objc_claimAutoreleasedReturnValue(v115);
        v116 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v114,  v123));
      }

      else
      {
        v116 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v112));
      }

      uint64_t v117 = AMSHashIfNeeded(v10);
      v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
      uint64_t v119 = AMSHashIfNeeded(v12);
      v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
      *(_DWORD *)buf = 138543874;
      v131 = v116;
      __int16 v132 = 2114;
      v133 = v118;
      __int16 v134 = 2114;
      v135 = v120;
      _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_ERROR,  "%{public}@Attempting to make home owner active. home owner = %{public}@ account = %{public}@",  buf,  0x20u);
      if (v110)
      {

        v116 = (AMSDRefreshMultiUserTask *)v123;
      }
    }

    goto LABEL_75;
  }

+ (id)_createGenerateMultiUserTokenTaskForAccount:(id)a3 withController:(id)a4 home:(id)a5 multiUserTokenExists:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = -[AMSDGenerateMultiUserTokenTask initWithController:account:home:]( objc_alloc(&OBJC_CLASS___AMSDGenerateMultiUserTokenTask),  "initWithController:account:home:",  v10,  v11,  v9);

  -[AMSDGenerateMultiUserTokenTask setRunMode:](v12, "setRunMode:", 1LL);
  -[AMSDGenerateMultiUserTokenTask setTokenNeedsRegeneration:](v12, "setTokenNeedsRegeneration:", v6);
  return v12;
}

- (BOOL)_createMultiUserTokenForHome:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 isCurrentUserRestrictedGuest];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
  id v9 = (void *)v8;
  if (v7)
  {
    if (!v8) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class(self, v11);
      uint64_t v14 = AMSLogKey(v12, v13);
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543874;
      uint64_t v128 = v12;
      __int16 v129 = 2114;
      v130 = v15;
      __int16 v131 = 2114;
      id v132 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Skipping multi-user token generation restricted guest in home = %{public}@",  buf,  0x20u);
    }

    goto LABEL_7;
  }

  if (!v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_opt_class(self, v18);
    uint64_t v21 = AMSLogKey(v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = AMSHashIfNeeded(v6);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138543874;
    uint64_t v128 = v19;
    __int16 v129 = 2114;
    v130 = v22;
    __int16 v131 = 2114;
    id v132 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Creating a Multi-User token if necessary. home = %{public}@",  buf,  0x20u);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ams_activeiTunesAccount"));

  if (v9)
  {
    uint64_t v122 = a4;
    uint64_t v26 = objc_alloc(&OBJC_CLASS___AMSDFetchMultiUserRecordZoneTask);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 currentUser]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 cloudContainer]);
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v29 privateDatabase]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask metrics](self, "metrics"));
    uint64_t v32 = -[AMSDFetchMultiUserRecordZoneTask initWithHome:homeUser:database:metrics:]( v26,  "initWithHome:homeUser:database:metrics:",  v6,  v27,  v30,  v31);

    -[AMSDFetchMultiUserRecordZoneTask setRunMode:](v32, "setRunMode:", 1LL);
    uint64_t v123 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask performTask](v32, "performTask"));
    id v126 = 0LL;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 resultWithError:&v126]);
    id v35 = v126;
    if (!v34)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v62) {
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue([v62 OSLogObject]);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = objc_opt_class(self, v64);
        uint64_t v67 = AMSLogKey(v65, v66);
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        uint64_t v69 = AMSLogableError(v35);
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        *(_DWORD *)buf = 138543874;
        uint64_t v128 = v65;
        __int16 v129 = 2114;
        v130 = v68;
        __int16 v131 = 2114;
        id v132 = v70;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to fetch a home's record zone. error = %{public}@",  buf,  0x20u);

        uint64_t v34 = 0LL;
      }

      if (v122)
      {
        id v35 = v35;
        BOOL v16 = 0;
        *uint64_t v122 = v35;
      }

      else
      {
        BOOL v16 = 0;
      }

      uint64_t v87 = v123;
      goto LABEL_68;
    }

    uint64_t v119 = v33;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
    uint64_t v37 = v34;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v36 cloudContainer]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 privateDatabase]);
    v118 = v37;
    BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v40]);
    id v125 = v35;
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 resultWithError:&v125]);
    id v120 = v125;

    v43 = v42;
    if (!v42
      && (objc_msgSend(v120, "ams_hasDomain:code:", @"AMSDCloudDataErrorDomain", 7) & 1) == 0)
    {
      uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      v98 = v122;
      if (!v97) {
        uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue([v97 OSLogObject]);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        uint64_t v101 = objc_opt_class(self, v100);
        uint64_t v103 = AMSLogKey(v101, v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
        uint64_t v105 = AMSLogableError(v120);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
        *(_DWORD *)buf = 138543874;
        uint64_t v128 = v101;
        __int16 v129 = 2114;
        v130 = v104;
        __int16 v131 = 2114;
        id v132 = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to fetch a HomeParticipant record. error = %{public}@",  buf,  0x20u);

        v43 = 0LL;
        v98 = v122;
      }

      uint64_t v87 = v123;
      id v35 = v120;
      if (v98) {
        id *v98 = v120;
      }
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask metrics](self, "metrics"));
      id v107 = [v73 enqueueCloudKitFetchFailedEventWithError:v120];
      BOOL v16 = 0;
      goto LABEL_67;
    }

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask metrics](self, "metrics"));
    id v45 = [v44 enqueueCloudKitFetchSuccessEvent];

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v42 fieldForKey:@"AMSHomeParticipant_MultiUserToken"]);
    uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString, v47);
    char isKindOfClass = objc_opt_isKindOfClass(v46, v48);

    BOOL v50 = (void *)objc_claimAutoreleasedReturnValue([v42 fieldForKey:@"AMSHomeParticipant_MultiUserTokenInvalid"]);
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber, v51);
    if ((objc_opt_isKindOfClass(v50, v52) & 1) != 0) {
      id v53 = v50;
    }
    else {
      id v53 = 0LL;
    }

    unsigned __int8 v71 = [v53 BOOLValue];
    uint64_t v72 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
    uint64_t v73 = (void *)v72;
    if ((isKindOfClass & 1) != 0 && (v71 & 1) == 0)
    {
      if (!v72) {
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue([v73 OSLogObject]);
      id v35 = v120;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v76 = objc_opt_class(self, v75);
        uint64_t v78 = AMSLogKey(v76, v77);
        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        *(_DWORD *)buf = 138543618;
        uint64_t v128 = v76;
        __int16 v129 = 2114;
        v130 = v79;
        _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] A Multi-User token already exists.",  buf,  0x16u);
      }

      BOOL v16 = 1;
      goto LABEL_51;
    }

    if ((isKindOfClass & 1) != 0)
    {
      if (!v72) {
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue([v73 OSLogObject]);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v82 = objc_opt_class(self, v81);
        uint64_t v84 = AMSLogKey(v82, v83);
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
        *(_DWORD *)buf = 138543618;
        uint64_t v128 = v82;
        __int16 v129 = 2114;
        v130 = v85;
        v86 = "%{public}@: [%{public}@] A Multi-User token exists but is invalid.";
LABEL_49:
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, v86, buf, 0x16u);
      }
    }

    else
    {
      if (!v72) {
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue([v73 OSLogObject]);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v89 = objc_opt_class(self, v88);
        uint64_t v91 = AMSLogKey(v89, v90);
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(v91);
        *(_DWORD *)buf = 138543618;
        uint64_t v128 = v89;
        __int16 v129 = 2114;
        v130 = v85;
        v86 = "%{public}@: [%{public}@] No Multi-User token exists.";
        goto LABEL_49;
      }
    }

    uint64_t v93 = (void *)objc_opt_class(self, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( [v93 _createGenerateMultiUserTokenTaskForAccount:v9 withController:v94 home:v6 multiUserTokenExists:isKindOfClass & 1]);

    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([v73 performTask]);
    id v124 = v120;
    v96 = (void *)objc_claimAutoreleasedReturnValue([v95 resultWithError:&v124]);
    id v35 = v124;

    BOOL v16 = v96 != 0LL;
    if (!v96)
    {
      id v121 = v42;
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v108) {
        uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v109 = (os_log_s *)objc_claimAutoreleasedReturnValue([v108 OSLogObject]);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      {
        uint64_t v111 = objc_opt_class(self, v110);
        uint64_t v113 = AMSLogKey(v111, v112);
        uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
        uint64_t v115 = AMSLogableError(v35);
        v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
        *(_DWORD *)buf = 138543874;
        uint64_t v128 = v111;
        __int16 v129 = 2114;
        v130 = v114;
        __int16 v131 = 2114;
        id v132 = v116;
        _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Error generating multi-user token: %{public}@",  buf,  0x20u);
      }

      if (v122)
      {
        id v35 = v35;
        BOOL v16 = 0;
        *uint64_t v122 = v35;
      }

      else
      {
        BOOL v16 = 0;
      }

      uint64_t v87 = v123;
      v43 = v121;
      goto LABEL_67;
    }

- (void)_createMultiUserTokensWithErrors:(id)a3
{
  id v8 = a3;
  if (+[AMSDMultiUserController deviceCanManageMultiUser]( &OBJC_CLASS___AMSDMultiUserController,  "deviceCanManageMultiUser"))
  {
    if ((-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0
      && (sub_10000AFA8(v8, v4) & 1) == 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask options](self, "options"));
      unsigned int v6 = [v5 shouldUseCloudData];

      if (v6)
      {
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask homes](self, "homes"));
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_10003F514;
        v9[3] = &unk_1000D7C20;
        v9[4] = self;
        id v10 = v8;
        [v7 enumerateObjectsUsingBlock:v9];
      }
    }
  }
}

- (void)_reconcileiTunesAccountsWithErrors:(id)a3
{
  id v9 = a3;
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers]( &OBJC_CLASS___AMSDMultiUserController,  "deviceSupportsMultipleUsers")
    && (-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_iTunesAccountsWithHomeUserIdentifiers"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003F6D8;
    v13[3] = &unk_1000D7C88;
    v13[4] = self;
    id v6 = v9;
    id v14 = v6;
    [v5 enumerateObjectsUsingBlock:v13];

    if ((sub_10000AFA8(v6, v7) & 1) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask homes](self, "homes"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10003FBCC;
      v10[3] = &unk_1000D7CD8;
      v10[4] = self;
      id v11 = v6;
      id v12 = v4;
      [v8 enumerateObjectsUsingBlock:v10];
    }
  }
}

- (void)_reconcileRecordZonesWithErrors:(id)a3
{
  id v4 = a3;
  if (+[AMSDMultiUserController deviceCanManageMultiUser]( &OBJC_CLASS___AMSDMultiUserController,  "deviceCanManageMultiUser"))
  {
    if ((-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0
      && (sub_10000AFA8(v4, v5) & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask options](self, "options"));
      unsigned int v7 = [v6 shouldUseCloudData];

      if (v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudContainer]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 privateDatabase]);

        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fetchRecordZones]);
        id v28 = 0LL;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resultWithError:&v28]);
        id v13 = v28;

        if (v12)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 results]);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_100040C18;
          v24[3] = &unk_1000D7D00;
          id v25 = v10;
          uint64_t v26 = self;
          id v27 = v4;
          [v14 enumerateKeysAndObjectsUsingBlock:v24];
        }

        else
        {
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v15) {
            unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = objc_opt_class(self, v17);
            uint64_t v20 = AMSLogKey(v18, v19);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = AMSLogableError(v13);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            *(_DWORD *)buf = 138543874;
            uint64_t v30 = v18;
            __int16 v31 = 2114;
            uint64_t v32 = v21;
            __int16 v33 = 2114;
            uint64_t v34 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch all record zones. error = %{public}@",  buf,  0x20u);
          }

          [v4 addObject:v13];
        }
      }
    }
  }
}

- (void)_refreshCloudDatabasesWithErrors:(id)a3
{
  id v4 = a3;
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers]( &OBJC_CLASS___AMSDMultiUserController,  "deviceSupportsMultipleUsers"))
  {
    if ((-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0
      && (sub_10000AFA8(v4, v5) & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask options](self, "options"));
      unsigned int v7 = [v6 shouldUseCloudData];

      if (v7)
      {
        id v8 = objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserDatabaseTask);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudContainer]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 privateDatabase]);
        id v13 = -[AMSDRefreshMultiUserDatabaseTask initWithController:database:]( v8,  "initWithController:database:",  v9,  v12);

        -[AMSDRefreshMultiUserDatabaseTask setRunMode:](v13, "setRunMode:", 1LL);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask performTask](v13, "performTask"));
        id v46 = 0LL;
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 resultWithError:&v46]);
        id v16 = v46;

        if (!v15)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v17) {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = objc_opt_class(self, v19);
            uint64_t v22 = AMSLogKey(v20, v21);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            uint64_t v24 = AMSLogableError(v16);
            id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            *(_DWORD *)buf = 138543874;
            uint64_t v48 = v20;
            __int16 v49 = 2114;
            BOOL v50 = v23;
            __int16 v51 = 2114;
            uint64_t v52 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to refresh multi-user private database. error = %{public}@",  buf,  0x20u);
          }
        }

        objc_msgSend(v4, "ams_addNullableObject:", v16);
        if ((sub_10000AFA8(v4, v26) & 1) != 0)
        {
          id v27 = v16;
        }

        else
        {
          id v28 = objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserDatabaseTask);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask controller](self, "controller"));
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 cloudContainer]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedDatabase]);
          __int16 v33 = -[AMSDRefreshMultiUserDatabaseTask initWithController:database:]( v28,  "initWithController:database:",  v29,  v32);

          -[AMSDRefreshMultiUserDatabaseTask setRunMode:](v33, "setRunMode:", 1LL);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask performTask](v33, "performTask"));
          id v45 = v16;
          uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 resultWithError:&v45]);
          id v27 = v45;

          if (!v35)
          {
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
            if (!v36) {
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            }
            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              uint64_t v39 = objc_opt_class(self, v38);
              uint64_t v41 = AMSLogKey(v39, v40);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
              uint64_t v43 = AMSLogableError(v27);
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              *(_DWORD *)buf = 138543874;
              uint64_t v48 = v39;
              __int16 v49 = 2114;
              BOOL v50 = v42;
              __int16 v51 = 2114;
              uint64_t v52 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to refresh multi-user shared database. error = %{public}@",  buf,  0x20u);
            }
          }

          objc_msgSend(v4, "ams_addNullableObject:", v27);
          unsigned __int8 v15 = (void *)v35;
          id v13 = v33;
        }
      }
    }
  }
}

- (void)_removeRenewCredentialsFollowUp
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    uint64_t v8 = AMSLogKey(v6, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = v11;
    if (v9)
    {
      uint64_t v14 = AMSLogKey(v11, v12);
      uint64_t v2 = objc_claimAutoreleasedReturnValue(v14);
      unsigned __int8 v15 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v13,  v2));
    }

    else
    {
      unsigned __int8 v15 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v11));
    }

    *(_DWORD *)buf = 138543362;
    id v46 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@Clearing the renew credentials follow-up following a successful token refresh.",  buf,  0xCu);
    if (v9)
    {

      unsigned __int8 v15 = (AMSDRefreshMultiUserTask *)v2;
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AMSRenewAccountCredentialsFollowUpItem clear]( &OBJC_CLASS___AMSRenewAccountCredentialsFollowUpItem,  "clear"));
  id v44 = 0LL;
  unsigned int v17 = [v16 resultWithError:&v44];
  id v18 = v44;

  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
  uint64_t v20 = (void *)v19;
  if (v17)
  {
    if (!v19) {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v22)
    {
      uint64_t v24 = AMSLogKey(v22, v23);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v27 = objc_opt_class(self, v26);
      uint64_t v29 = v27;
      if (v25)
      {
        uint64_t v30 = AMSLogKey(v27, v28);
        self = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue(v30);
        __int16 v31 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v29,  self));
      }

      else
      {
        __int16 v31 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v27));
      }

      *(_DWORD *)buf = 138543362;
      id v46 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%{public}@Successfully cleared follow-up.",  buf,  0xCu);
      if (v25)
      {

        __int16 v31 = self;
      }
    }
  }

  else
  {
    if (!v19) {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    BOOL v32 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      uint64_t v34 = AMSLogKey(v32, v33);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      uint64_t v37 = objc_opt_class(self, v36);
      uint64_t v39 = v37;
      if (v35)
      {
        uint64_t v40 = AMSLogKey(v37, v38);
        self = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue(v40);
        uint64_t v41 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v39,  self));
      }

      else
      {
        uint64_t v41 = (AMSDRefreshMultiUserTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v37));
      }

      uint64_t v42 = AMSLogableError(v18);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138543618;
      id v46 = v41;
      __int16 v47 = 2114;
      uint64_t v48 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@Error clearing the renew credentials follow-up: %{public}@",  buf,  0x16u);
      if (v35)
      {

        uint64_t v41 = self;
      }
    }
  }
}

- (void)_transferHomeSettingsToAccountsWithErrors:(id)a3
{
  id v5 = a3;
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers]( &OBJC_CLASS___AMSDMultiUserController,  "deviceSupportsMultipleUsers")
    && (-[AMSDRefreshMultiUserTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserTask homes](self, "homes"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100041D00;
    v6[3] = &unk_1000D7C20;
    v6[4] = self;
    id v7 = v5;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (NSArray)homes
{
  return self->_homes;
}

- (AMSDRefreshMultiUserOptions)options
{
  return self->_options;
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