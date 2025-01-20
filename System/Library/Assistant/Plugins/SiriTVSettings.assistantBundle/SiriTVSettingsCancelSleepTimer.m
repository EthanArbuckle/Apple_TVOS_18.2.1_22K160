@interface SiriTVSettingsCancelSleepTimer
- (id)_getSystemServiceProxy;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsCancelSleepTimer

- (void)performWithCompletion:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsCancelSleepTimer _getSystemServiceProxy](self, "_getSystemServiceProxy"));
  [v4 setSleepTimeout:-1.0];

  if (v8)
  {
    v5 = (void *)objc_opt_new(&OBJC_CLASS___SATimerCancelCompleted);
    v6 = (void *)objc_opt_new(&OBJC_CLASS___SATimerObject);
    [v6 setTimerValue:&off_4458];
    [v6 setState:SATimerStateRunningValue];
    [v5 setTimer:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    v8[2](v8, v7);
  }
}

- (id)_getSystemServiceProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemServiceProxy]);

  return v3;
}

@end