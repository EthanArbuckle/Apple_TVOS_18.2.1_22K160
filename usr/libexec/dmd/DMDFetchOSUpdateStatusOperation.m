@interface DMDFetchOSUpdateStatusOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)_downloadStatusAndPercentComplete:(double *)a3 fromStatus:(id)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchOSUpdateStatusOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchOSUpdateStatusRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A57F0;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4 = DMFOSUpdateLog(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "fetch-os-update-status starting",  (uint8_t *)v23,  2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMDSUManagerInstallTask sharedInstallTask]( &OBJC_CLASS___DMDSUManagerInstallTask,  "sharedInstallTask"));
  id v24 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentStatusWithError:&v24]);
  id v8 = v24;
  v9 = v8;
  if (v7)
  {
    id v10 = [(id)objc_opt_class(v6) productKeyOrDefaultFromStatus:v7];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v23[0] = 0.0;
    unint64_t v12 = -[DMDFetchOSUpdateStatusOperation _downloadStatusAndPercentComplete:fromStatus:]( self,  "_downloadStatusAndPercentComplete:fromStatus:",  v23,  v7);
    id v13 = objc_alloc(&OBJC_CLASS___DMFFetchOSUpdateStatusResultObject);
    id v14 = [v13 initWithProductKey:v11 status:v12 downloadPercentComplete:v23[0]];
    -[DMDFetchOSUpdateStatusOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v14);

    uint64_t v16 = DMFOSUpdateLog(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "fetch-os-update-status done",  (uint8_t *)v23,  2u);
    }
  }

  else
  {
    uint64_t v18 = DMFOSUpdateLog(v8);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100064C18((uint64_t)v9, v19);
    }

    if (v9)
    {
      NSErrorUserInfoKey v25 = NSUnderlyingErrorKey;
      v26 = v9;
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      uint64_t v20 = DMFErrorWithCodeAndUserInfo(0LL, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[DMDFetchOSUpdateStatusOperation endOperationWithError:](self, "endOperationWithError:", v21);
    }

    else
    {
      uint64_t v22 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      -[DMDFetchOSUpdateStatusOperation endOperationWithError:](self, "endOperationWithError:", v17);
    }
  }
}

- (unint64_t)_downloadStatusAndPercentComplete:(double *)a3 fromStatus:(id)a4
{
  id v5 = a4;
  double v6 = 1.0;
  if ([v5 isInstalling])
  {
    unint64_t v7 = 2LL;
  }

  else if ([v5 isDownloadComplete])
  {
    unint64_t v7 = 0LL;
  }

  else if ([v5 isDownloading])
  {
    [v5 downloadPercentComplete];
    double v6 = v8;
    unint64_t v7 = 1LL;
  }

  else
  {
    unint64_t v7 = 0LL;
    double v6 = 0.0;
  }

  *a3 = v6;

  return v7;
}

@end