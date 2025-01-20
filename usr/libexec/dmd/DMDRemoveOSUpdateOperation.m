@interface DMDRemoveOSUpdateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveOSUpdateRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5AA8;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4 = DMFOSUpdateLog(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove-os-update starting", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMDSUManagerInstallTask sharedInstallTask]( &OBJC_CLASS___DMDSUManagerInstallTask,  "sharedInstallTask"));
  id v17 = 0LL;
  unsigned int v7 = [v6 removeUpdateWithError:&v17];
  id v8 = v17;
  uint64_t v9 = DMFOSUpdateLog(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remove-os-update successful", v16, 2u);
    }

    id v12 = -[DMDRemoveOSUpdateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100066BFC((uint64_t)v8, v11);
    }

    id v12 = -[DMDRemoveOSUpdateOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }

  uint64_t v13 = DMFOSUpdateLog(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "remove-os-update done", v15, 2u);
  }
}

@end