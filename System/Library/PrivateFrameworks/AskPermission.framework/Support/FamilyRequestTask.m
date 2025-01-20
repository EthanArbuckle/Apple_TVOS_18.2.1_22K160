@interface FamilyRequestTask
- (FamilyRequestTask)initWithDSID:(id)a3;
- (NSNumber)DSID;
- (id)_performWithFamilyRequest:(id)a3;
- (id)perform;
- (int64_t)_familyMemberType:(id)a3;
- (void)setDSID:(id)a3;
@end

@implementation FamilyRequestTask

- (FamilyRequestTask)initWithDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FamilyRequestTask;
  v6 = -[FamilyRequestTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_DSID, a3);
  }

  return v7;
}

- (id)perform
{
  id v3 = objc_alloc_init(&OBJC_CLASS___FAFetchFamilyCircleRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyRequestTask _performWithFamilyRequest:](self, "_performWithFamilyRequest:", v3));

  return v4;
}

- (id)_performWithFamilyRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class(self);
    id v8 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching FamilyCircle", buf, 0xCu);
  }

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10000B798;
  v20 = &unk_100030980;
  v21 = self;
  id v9 = v5;
  id v22 = v9;
  [v4 startRequestWithCompletionHandler:&v17];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[APLogConfig sharedDaemonConfig]( &OBJC_CLASS___APLogConfig,  "sharedDaemonConfig",  v17,  v18,  v19,  v20,  v21));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543362;
    id v24 = v12;
    id v13 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Waiting on FamilyCircle",  buf,  0xCu);
  }

  v14 = v22;
  id v15 = v9;

  return v15;
}

- (int64_t)_familyMemberType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v16 = 138543362;
    id v17 = (id)objc_opt_class(self);
    id v10 = v17;
    v11 = "%{public}@: Family Member == nil. Unable to determine if Guardian or Requester.";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }

  if (([v4 isGuardian] & 1) != 0
    || ([v5 isParent] & 1) != 0
    || [v5 isOrganizer])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = (id)objc_opt_class(self);
      __int16 v18 = 2114;
      v19 = v5;
      id v8 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: I am a Guardian/Parent/Organizer: %{public}@",  (uint8_t *)&v16,  0x16u);
    }

    int64_t v9 = 0LL;
    goto LABEL_16;
  }

  if (([v5 isChildAccount] & 1) == 0 && !objc_msgSend(v5, "isTeenAccount"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v16 = 138543362;
    id v17 = (id)objc_opt_class(self);
    id v10 = v17;
    v11 = "%{public}@: Unable to determine if Guardian or Requester.";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v16, 0xCu);

LABEL_15:
    int64_t v9 = 2LL;
    goto LABEL_16;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = (id)objc_opt_class(self);
    __int16 v18 = 2114;
    v19 = v5;
    id v15 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: I am a Child/Teen: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  int64_t v9 = 1LL;
LABEL_16:

  return v9;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end