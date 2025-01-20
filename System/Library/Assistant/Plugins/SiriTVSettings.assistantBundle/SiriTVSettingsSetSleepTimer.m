@interface SiriTVSettingsSetSleepTimer
- (id)_getSystemServiceProxy;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsSetSleepTimer

- (void)performWithCompletion:(id)a3
{
  v13 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetSleepTimer timer](self, "timer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 timerValue]);

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetSleepTimer _getSystemServiceProxy](self, "_getSystemServiceProxy"));
    v9 = v8;
    if (v7 <= 0.0) {
      [v8 sleepSystemForReason:PBSSleepReasonSiriCommand];
    }
    else {
      [v8 setSleepTimeout:v7];
    }

    if (v13)
    {
      v10 = &OBJC_CLASS___SATimerSetCompleted_ptr;
      goto LABEL_9;
    }
  }

  else if (v13)
  {
    v10 = &OBJC_CLASS___SACommandFailed_ptr;
LABEL_9:
    v11 = (void *)objc_opt_new(*v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
    v13[2](v13, v12);
  }
}

- (id)_getSystemServiceProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemServiceProxy]);

  return v3;
}

@end