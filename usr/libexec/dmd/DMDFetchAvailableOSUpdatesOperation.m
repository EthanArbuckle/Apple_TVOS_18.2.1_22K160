@interface DMDFetchAvailableOSUpdatesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchAvailableOSUpdatesOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchAvailableOSUpdatesRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A56E8;
}

- (void)runWithRequest:(id)a3
{
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))DMFOSUpdateLog)();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates starting", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMDSUManagerInstallTask sharedInstallTask]( &OBJC_CLASS___DMDSUManagerInstallTask,  "sharedInstallTask"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 productVersion]);
  id v10 = [v5 useDelay];

  uint64_t v11 = ((uint64_t (*)(void))DMFOSUpdateLog)();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = @"default";
    v14 = @"NO";
    if (v9) {
      v13 = v9;
    }
    if ((_DWORD)v10) {
      v14 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "fetch-available-os-updates: product version = %@, use delay = %@",  buf,  0x16u);
  }

  id v23 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 availableUpdateWithVersion:v9 useDelay:v10 error:&v23]);
  id v16 = v23;
  v17 = v16;
  if (v15)
  {
    id v18 = [[DMFFetchAvailableOSUpdatesResultObject alloc] initWithUpdate:v15];
    -[DMDFetchAvailableOSUpdatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v18);
  }

  else
  {
    if (!v16)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v22 handleFailureInMethod:a2 object:self file:@"DMDFetchAvailableOSUpdatesOperation.m" lineNumber:45 description:@"DMDFetchAvailableOSUpdatesOperation: no update returned"];
    }

    id v19 = -[DMDFetchAvailableOSUpdatesOperation endOperationWithError:](self, "endOperationWithError:", v17);
  }

  uint64_t v20 = DMFOSUpdateLog(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates done", buf, 2u);
  }
}

@end