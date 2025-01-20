@interface RestoreDemotedApplicationsRequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
- (void)main;
@end

@implementation RestoreDemotedApplicationsRequestTask

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RestoreDemotedApplicationsRequestTask;
  v7 = -[RequestTask initForClient:withOptions:](&v18, "initForClient:withOptions:", a3, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
    id v9 = [v8 copy];
    v10 = (void *)v7[8];
    v7[8] = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
    id v12 = [v11 copy];
    v13 = (void *)v7[9];
    v7[9] = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIDs]);
    id v15 = [v14 copy];
    v16 = (void *)v7[10];
    v7[10] = v15;
  }

  return v7;
}

- (void)main
{
  options = self->super._options;
  uint64_t v4 = ASDLogHandleForCategory(29LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (options)
  {
    if (v6)
    {
      client = self->super._client;
      v8 = self->super._options;
      *(_DWORD *)buf = 138543618;
      v35 = client;
      __int16 v36 = 2114;
      v37 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Looking for demoted applications for accountID: %{public}@ appleID: %{public}@",  buf,  0x16u);
    }

    id v9 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = self->super._options;
    id v33 = 0LL;
    id v12 = sub_1002108B4(v10, v11, &v33);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    v14 = (XPCClient *)v33;

    if (v14)
    {
      uint64_t v15 = ASDLogHandleForCategory(29LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to log into account due to error: %{public}@",  buf,  0xCu);
      }
    }

    if (v13)
    {
      id v17 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      sub_100212B78((uint64_t)v18, v13, 0);

      id v19 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

      unsigned __int8 v21 = 1;
    }

    else
    {
      uint64_t v28 = ASDLogHandleForCategory(29LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->super._client;
        v30 = self->super._options;
        *(_DWORD *)buf = 138543618;
        v35 = v29;
        __int16 v36 = 2114;
        v37 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not find account for accountID: %{public}@] appleID: %{public}@",  buf,  0x16u);
      }

      id v13 = 0LL;
      unsigned __int8 v21 = 0;
    }
  }

  else
  {
    if (v6)
    {
      v22 = (XPCClient *)objc_claimAutoreleasedReturnValue( -[NSNumber componentsJoinedByString:]( self->_accountID,  "componentsJoinedByString:",  @", "));
      *(_DWORD *)buf = 138543362;
      v35 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Creating jobs for demoted apps: [%{public}@]",  buf,  0xCu);
    }

    id v13 = sub_10020B788(objc_alloc(&OBJC_CLASS___ImportJobsForDemotedAppsTask), self->_accountID);
    id v32 = 0LL;
    unsigned __int8 v21 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v13, &v32);
    v14 = (XPCClient *)v32;
    uint64_t v23 = ASDLogHandleForCategory(29LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    v20 = v24;
    if (v14)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (v13) {
          id Property = objc_getProperty(v13, v25, 32LL, 1);
        }
        else {
          id Property = 0LL;
        }
        v27 = (XPCClient *)Property;
        *(_DWORD *)buf = 138543362;
        v35 = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Completed request with error: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Completed Restore Demoted request successfully",  buf,  2u);
      }

      v14 = 0LL;
    }
  }

  LOBYTE(self->super.super._keepAlive) = v21;
  objc_setProperty_atomic_copy(self, v31, v14, 32LL);
}

- (void).cxx_destruct
{
}

@end