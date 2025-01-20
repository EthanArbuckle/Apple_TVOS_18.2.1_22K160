@interface AnonymousPingTask
- (void)main;
@end

@implementation AnonymousPingTask

- (void)main
{
  if ((sub_10031E2C8((uint64_t)&OBJC_CLASS___AnonymousPingTask) & 1) != 0)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = *(id *)&self->super._success;
    id v3 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v34 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(id *)(*((void *)&v36 + 1) + 8LL * (void)i);
          if (os_variant_has_internal_content("com.apple.appstored")
            && (id v7 = sub_1002F9844((uint64_t)&OBJC_CLASS___AppDefaultsManager),
                v8 = (void *)objc_claimAutoreleasedReturnValue(v7),
                v8,
                v8))
          {
            v45 = @"canaryIdentifier";
            id v9 = sub_1002F9844((uint64_t)&OBJC_CLASS___AppDefaultsManager);
            v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
            v46 = v10;
            v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
            id v12 = sub_1001ECDD8(v6, v11);
            id v13 = (id)objc_claimAutoreleasedReturnValue(v12);

            uint64_t v14 = ASDLogHandleForCategory(25LL);
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = sub_1002F9844((uint64_t)&OBJC_CLASS___AppDefaultsManager);
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              *(_DWORD *)buf = 138543362;
              id v41 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updated anonymous ping URL to include canaryIdentifier: %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            id v13 = v6;
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v13,  1LL,  20.0));
          id v19 = objc_alloc(&OBJC_CLASS___AMSURLRequest);
          id v20 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = [v19 initWithRequest:v18 bag:v21];

          v23 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise completionHandlerAdapter](v23, "completionHandlerAdapter"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v24 dataTaskWithRequest:v22 completionHandler:v25]);

          [v26 resume];
          id v35 = 0LL;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise resultWithError:](v23, "resultWithError:", &v35));
          id v28 = v35;
          uint64_t v29 = ASDLogHandleForCategory(25LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          v31 = v30;
          if (v27)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v41 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Successfully sent ping to: %{public}@",  buf,  0xCu);
            }
          }

          else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v41 = v13;
            __int16 v42 = 2114;
            id v43 = v28;
            _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Ping failed to: %{public}@ error: %{public}@",  buf,  0x16u);
          }
        }

        id v4 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v4);
    }
  }

  else
  {
    uint64_t v32 = ASDLogHandleForCategory(25LL);
    id obj = (id)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)obj,  OS_LOG_TYPE_DEBUG,  "Dropping anonymous pings - DNU submission disabled",  buf,  2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end