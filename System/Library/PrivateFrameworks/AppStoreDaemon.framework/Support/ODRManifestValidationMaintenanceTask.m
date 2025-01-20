@interface ODRManifestValidationMaintenanceTask
- (void)main;
@end

@implementation ODRManifestValidationMaintenanceTask

- (void)main
{
  v3 = -[KeepAlive initWithName:]( objc_alloc(&OBJC_CLASS___KeepAlive),  "initWithName:",  @"com.apple.appstored.ODRMainfestValidationMaintenanceOperation");
  uint64_t v4 = ASDLogHandleForCategory(19LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Executing the Validate Manifests task.",  buf,  2u);
  }

  if (-[ODRManifestValidationMaintenanceTask isCancelled](self, "isCancelled"))
  {
    uint64_t v6 = ASDLogHandleForCategory(19LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Validate manifests operation has been cancelled.",  buf,  2u);
    }
  }

  else
  {
    id v8 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002AEE80;
    v12[3] = &unk_1003E9858;
    v12[4] = self;
    [v9 modifyUsingTransaction:v12];

    uint64_t v10 = ASDLogHandleForCategory(19LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Validate Manifests task has finished.",  buf,  2u);
    }

    -[Task completeWithSuccess](self, "completeWithSuccess");
  }
}

@end