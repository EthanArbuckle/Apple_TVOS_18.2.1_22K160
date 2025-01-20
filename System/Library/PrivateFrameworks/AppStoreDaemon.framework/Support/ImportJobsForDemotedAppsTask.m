@interface ImportJobsForDemotedAppsTask
- (ImportJobsForDemotedAppsTask)init;
- (void)main;
@end

@implementation ImportJobsForDemotedAppsTask

- (ImportJobsForDemotedAppsTask)init
{
  return (ImportJobsForDemotedAppsTask *)sub_10020B788(self, 0LL);
}

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(29LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(&OBJC_CLASS___ImportJobsForDemotedAppsTask, v6);
    v8 = *(void **)&self->super._success;
    id v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2114;
    v31 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Checking for demoted placeholders for bundleIDs: [%{public}@]",  buf,  0x20u);
  }

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_10020BB24;
  v27 = &unk_1003ECC50;
  v28 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v29 = v11;
  v12 = &v24;
  if (self)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSDatabaseContext sharedDatabaseContext]( &OBJC_CLASS___LSDatabaseContext,  "sharedDatabaseContext",  v24,  v25,  v26,  v27,  v28));
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10020BDE4;
    v31 = &unk_1003ECCA0;
    v32 = self;
    v33 = v12;
    [v13 accessUsingBlock:buf];
  }

  if ([v11 count])
  {
    uint64_t v14 = ASDLogHandleForCategory(29LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Hydrating apps: [%{public}@]", buf, 0xCu);
    }

    id v17 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    sub_100211310((uint64_t)v18, v11);

    if (self) {
      LOBYTE(self->super._keepAlive) = 1;
    }
  }

  uint64_t v19 = ASDLogHandleForCategory(29LL);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_opt_class(&OBJC_CLASS___ImportJobsForDemotedAppsTask, v21);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    id v23 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Check for demoted placeholders complete",  buf,  0x16u);
  }
}

- (void).cxx_destruct
{
}

@end