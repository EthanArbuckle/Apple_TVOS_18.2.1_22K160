@interface LaunchableAppRequestTask
- (void)main;
@end

@implementation LaunchableAppRequestTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(9LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class(self, v5);
    id v7 = v6;
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v9 = error;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v9, "clientID"));
    if (self) {
      response = self->super._response;
    }
    else {
      response = 0LL;
    }
    v12 = response;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse bundleIDs](v12, "bundleIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138543874;
    v42 = v6;
    __int16 v43 = 2114;
    v44 = v10;
    __int16 v45 = 2114;
    v46 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Launable apps request by client: %{public}@ for bundleIDs: [%{public}@]",  buf,  0x20u);
  }

  v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v35 = self;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  unsigned int v33 = [v34 startAccessingReturningError:0];
  if (self) {
    v16 = self->super._response;
  }
  else {
    v16 = 0LL;
  }
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse bundleIDs](v17, "bundleIDs"));

  id v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        v24 = objc_autoreleasePoolPush();
        v25 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v23,  0LL,  0LL);
        v26 = v25;
        if (v25)
        {
          if ((sub_100325BAC(v25) & 2) != 0)
          {
            -[NSMutableArray addObject:](v15, "addObject:", v23);
          }

          else
          {
            uint64_t v27 = ASDLogHandleForCategory(9LL);
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v30 = (void *)objc_opt_class(v35, v29);
              *(_DWORD *)buf = 138543618;
              v42 = v30;
              __int16 v43 = 2114;
              v44 = v23;
              id v31 = v30;
              _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[%{public}@]: App: %{public}@ is not launchable",  buf,  0x16u);
            }
          }
        }

        objc_autoreleasePoolPop(v24);
      }

      id v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v20);
  }

  if (v33) {
    [v34 stopAccessing];
  }
  id v32 = [[ASDLaunchableAppsResponse alloc] initWithBundleIDs:v15];
  sub_1001BA9FC(v35, v32);
  if (v35) {
    LOBYTE(v35->super.super._keepAlive) = 1;
  }
}

@end