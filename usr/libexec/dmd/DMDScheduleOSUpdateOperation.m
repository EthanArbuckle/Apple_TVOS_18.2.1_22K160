@interface DMDScheduleOSUpdateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)endOperationWithWrongProductKey:(id)a3 action:(unint64_t)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDScheduleOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFScheduleOSUpdateRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5B38;
}

- (void)endOperationWithWrongProductKey:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___DMFScheduleOSUpdateResultObject);
  uint64_t v8 = DMFErrorWithCodeAndUserInfo(2213LL, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v7 initWithAction:a4 productKey:v6 error:v9];

  -[DMDScheduleOSUpdateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);
}

- (void)runWithRequest:(id)a3
{
  id v5 = a3;
  uint64_t v6 = DMFOSUpdateLog(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "schedule-os-update starting, request = %{public}@",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMDSUManagerInstallTask sharedInstallTask]( &OBJC_CLASS___DMDSUManagerInstallTask,  "sharedInstallTask"));
  id v44 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentStatusWithError:&v44]);
  id v10 = v44;
  unint64_t v11 = (unint64_t)[v5 action];
  if (v11 == 2) {
    unint64_t v11 = [v9 isDownloadComplete];
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 productKey]);
  id v13 = [(id)objc_opt_class(v8) productKeyFromStatus:v9];
  id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [(id)objc_opt_class(v8) defaultProductKey];
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!v12
    || ([v12 isEqualToString:v16] & 1) != 0
    || !v14
    || (id v17 = [v12 isEqualToString:v14], (v17 & 1) != 0))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productVersion", v16));
    id v18 = [v5 useDelay];
    v38 = self;
    v39 = v9;
    if (v11 == 1)
    {
      uint64_t v27 = DMFOSUpdateLog(v18);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "schedule-os-update install action", buf, 2u);
      }

      id v41 = v10;
      unsigned __int8 v29 = [v8 startInstallWithError:&v41];
      id v26 = v41;

      v22 = 0LL;
      id v23 = 0LL;
      id v10 = v26;
      if ((v29 & 1) == 0) {
        goto LABEL_26;
      }
    }

    else if (v11)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v31 = self;
      id v26 = v30;
      [v30 handleFailureInMethod:a2 object:v31 file:@"DMDScheduleOSUpdateOperation.m" lineNumber:115 description:@"unexpected action value"];
      v22 = 0LL;
      id v23 = v10;
    }

    else
    {
      id v19 = v18;
      uint64_t v20 = DMFOSUpdateLog(v18);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "schedule-os-update download action", buf, 2u);
      }

      id v43 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 availableUpdateWithVersion:v40 useDelay:v19 error:&v43]);
      id v23 = v43;

      if (v22)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 productKey]);

        id v42 = v23;
        unsigned __int8 v25 = [v8 startDownloadWithError:&v42];
        id v26 = v42;

        if ((v25 & 1) == 0)
        {
          id v14 = (id)v24;
          id v10 = v26;
          goto LABEL_26;
        }

        id v23 = 0LL;
        id v14 = (id)v24;
      }

      else
      {
        id v26 = v14;
        id v14 = v12;
      }
    }

    id v10 = v23;
LABEL_26:
    id v34 = [[DMFScheduleOSUpdateResultObject alloc] initWithAction:v11 productKey:v14 error:v10];
    uint64_t v35 = DMFOSUpdateLog(-[DMDScheduleOSUpdateOperation endOperationWithResultObject:](v38, "endOperationWithResultObject:", v34));
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "schedule-os-update done, result = %{public}@",  buf,  0xCu);
    }

    v9 = v39;
    v16 = v37;
    goto LABEL_29;
  }

  uint64_t v32 = DMFOSUpdateLog(v17);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "schedule-os-update wrong product key", buf, 2u);
  }

  -[DMDScheduleOSUpdateOperation endOperationWithWrongProductKey:action:]( self,  "endOperationWithWrongProductKey:action:",  v12,  v11);
LABEL_29:
}

@end