@interface DMDConfigurationSourceStatusUpdateOperation
- (BOOL)isAsynchronous;
- (void)main;
@end

@implementation DMDConfigurationSourceStatusUpdateOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation controller](self, "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  uint64_t v5 = objc_opt_respondsToSelector(v4, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");
  if ((v5 & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002C820;
    v8[3] = &unk_10009E760;
    v8[4] = self;
    [v4 configurationSourceController:v3 fetchStatusUpdatesWithCompletionHandler:v8];
  }

  else
  {
    uint64_t v6 = DMFConfigurationEngineLog(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000632F8(v7);
    }

    -[DMDConfigurationSourceStatusUpdateOperation endOperationWithResultObject:]( self,  "endOperationWithResultObject:",  0LL);
  }
}

@end