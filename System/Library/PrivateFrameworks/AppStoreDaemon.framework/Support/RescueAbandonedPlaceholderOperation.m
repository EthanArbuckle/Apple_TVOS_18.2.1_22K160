@interface RescueAbandonedPlaceholderOperation
- (void)main;
@end

@implementation RescueAbandonedPlaceholderOperation

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(9LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class(self, v5);
    v7 = *(void **)&self->super._success;
    *(_DWORD *)buf = 138543618;
    v63 = v6;
    __int16 v64 = 2114;
    id v65 = v7;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Attempting hydrate bundleID: %{public}@",  buf,  0x16u);
  }

  v9 = *(void **)&self->super._success;
  if (!v9)
  {
    uint64_t v20 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
    v22 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue(v20);
    v11 = 0LL;
    BOOL v23 = 0LL;
    goto LABEL_32;
  }

  id v10 = v9;
  id v61 = 0LL;
  v11 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v10,  1LL,  &v61);
  v12 = (LSApplicationRecord *)v61;
  if (!v11)
  {
    uint64_t v24 = ASDLogHandleForCategory(9LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v55 = (void *)objc_opt_class(self, v26);
      *(_DWORD *)buf = 138543618;
      v63 = v55;
      __int16 v64 = 2112;
      id v65 = v10;
      id v56 = v55;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Cannot find application with bundleID: %@",  buf,  0x16u);
    }

    uint64_t v27 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v27);
    v11 = v12;
    goto LABEL_13;
  }

  if ((-[LSApplicationRecord isPlaceholder](v11, "isPlaceholder") & 1) == 0)
  {
    uint64_t v13 = ASDLogHandleForCategory(9LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class(self, v15);
      *(_DWORD *)buf = 138543618;
      v63 = v16;
      __int16 v64 = 2112;
      id v65 = v10;
      id v17 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Application does not need rescue, bundleID: %@ is already installed!",  buf,  0x16u);
    }

    uint64_t v18 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

LABEL_13:
    v11 = 0LL;
    v12 = (LSApplicationRecord *)v19;
  }

  v28 = v12;

  v22 = v28;
  BOOL v23 = 0LL;
  if (!v22 && v11)
  {
    id v29 = *(id *)&self->super._success;
    v11 = v11;
    id v30 = -[LSApplicationRecord installType](v11, "installType");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v11, "iTunesMetadata"));
    id v32 = [v31 storeItemIdentifier];

    uint64_t v33 = ASDLogHandleForCategory(9LL);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if (v32)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_opt_class(self, v36);
        id v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v11, "iTunesMetadata"));
        id v40 = [v39 storeItemIdentifier];
        *(_DWORD *)buf = 138544130;
        v63 = v37;
        __int16 v64 = 2114;
        id v65 = v29;
        __int16 v66 = 2048;
        id v67 = v40;
        __int16 v68 = 2048;
        id v69 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Hydrating placeholder for bundleID: %{public}@ itemID: %llu installType: %ld",  buf,  0x2Au);
      }

      v41 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_opt_class(self, v42);
        *(_DWORD *)buf = 138543874;
        v63 = v57;
        __int16 v64 = 2114;
        id v65 = v29;
        __int16 v66 = 2048;
        id v67 = v30;
        id v58 = v57;
        _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Unable to hydrate placeholder for bundleID: %{public}@ installType: %ld due to lack of store itemID",  buf,  0x20u);
      }

      uint64_t v43 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, 0LL, 0LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v43);
    }

    id v44 = v41;

    v22 = (LSApplicationRecord *)v44;
    BOOL v23 = 0LL;
    if (!v22 && v32)
    {
      id v45 = *(id *)&self->super._success;
      v46 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v45, 0LL);
      id v47 = sub_10020B788(objc_alloc(&OBJC_CLASS___ImportJobsForDemotedAppsTask), v46);
      id v61 = 0LL;
      BOOL v23 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v47, &v61);
      if (!v23)
      {
        uint64_t v48 = ASDLogHandleForCategory(9LL);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v59 = (void *)objc_opt_class(self, v50);
          *(_DWORD *)buf = 138543874;
          v63 = v59;
          __int16 v64 = 2114;
          id v65 = v45;
          __int16 v66 = 2114;
          id v67 = v61;
          id v60 = v59;
          _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Failed to hydrate bundleID: %{public}@ error: %{public}@",  buf,  0x20u);
        }
      }

      id v51 = v61;
      if (v61) {
        id v52 = v61;
      }

      v22 = (LSApplicationRecord *)v51;
    }
  }

- (void).cxx_destruct
{
}

@end