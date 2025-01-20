@interface LaunchServicesProgress
- (BOOL)observeLaunchProhibitedApps;
- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5;
- (void)cancelApp:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)pauseApp:(id)a3 withCompletionHandler:(id)a4;
- (void)resumeApp:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation LaunchServicesProgress

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LaunchServicesProgress;
  -[LaunchServicesProgress dealloc](&v4, "dealloc");
}

- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v5 = a3;
  uint64_t v7 = ASDLogHandleForCategory(2LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Canceling remote job for %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = ASDLogHandleForCategory(2LL, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to cancel remote job for %{public}@, no XDC support",  (uint8_t *)&v12,  0xCu);
  }
}

- (void)cancelApp:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v6 = (_TtC9appstored6LogKey *)a3;
  id v7 = a4;
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Canceling local job for %{public}@", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[RestoreKeeper shared](&OBJC_CLASS____TtC9appstored13RestoreKeeper, "shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey bundleID](v6, "bundleID"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 installForBundleID:v11]);

  if (v12)
  {
    id v13 = sub_100323C54(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v14) {
      v16 = v14;
    }
    else {
      v16 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    }
    v17 = v16;
  }

  else
  {
    v17 = 0LL;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey bundleID](v6, "bundleID"));
  unsigned int v19 = [v10 hasRestoringCoordinatorForBundleID:v18 logKey:v17];

  uint64_t v20 = ASDLogHandleForCategory(2LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Prompting the user whether or not to delete restore",  buf,  0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey bundleID](v6, "bundleID"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10019CCDC;
    v31[3] = &unk_1003E9C30;
    id v32 = v7;
    [v10 displayDeleteActiveRestoreDialogWithBundleID:v23 logKey:v17 completion:v31];

    v24 = v32;
  }

  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Canceling due to user request",  buf,  0xCu);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey bundleID](v6, "bundleID"));
    id v26 = sub_10019CCF0((uint64_t)self, v25, -30LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v26);

    uint64_t v27 = ASDLogHandleForCategory(2LL);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if (v24)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v30 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey bundleID](v6, "bundleID"));
        *(_DWORD *)buf = 138543362;
        v34 = v30;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unable to cancel, no job found for bundle ID: %{public}@",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@] Canceled local job", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v24);
    }
  }
}

- (void)pauseApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Pausing local job for %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v11 = sub_10019CCF0((uint64_t)self, v10, -10LL);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  uint64_t v13 = ASDLogHandleForCategory(2LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      int v17 = 138543362;
      id v18 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to pause, no job found for bundle ID: %{public}@",  (uint8_t *)&v17,  0xCu);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Paused local job for %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  if (v7) {
    v7[2](v7, v12);
  }
}

- (void)resumeApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Resuming local job for %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v11 = sub_10019CCF0((uint64_t)self, v10, 10LL);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  uint64_t v13 = ASDLogHandleForCategory(2LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      int v17 = 138543362;
      id v18 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to resume, no job found for bundle ID: %{public}@",  (uint8_t *)&v17,  0xCu);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Resumed local job for %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  if (v7) {
    v7[2](v7, v12);
  }
}

- (BOOL)observeLaunchProhibitedApps
{
  return 1;
}

- (void).cxx_destruct
{
}

@end