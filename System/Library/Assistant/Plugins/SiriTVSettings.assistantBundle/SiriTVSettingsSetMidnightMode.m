@interface SiriTVSettingsSetMidnightMode
- (id)_getAudioVideoSettings;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsSetMidnightMode

- (void)performWithCompletion:(id)a3
{
  v11 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetMidnightMode _getAudioVideoSettings](self, "_getAudioVideoSettings"));
  id v5 = [v4 lateNightModeEnabled];
  else {
    id v6 = -[SiriTVSettingsSetMidnightMode value](self, "value");
  }
  [v4 setLateNightModeEnabled:v6];
  v7 = (void *)objc_opt_new(&OBJC_CLASS___SASettingSetBoolResponse);
  v8 = (void *)objc_opt_new(&OBJC_CLASS___SASettingBooleanEntity);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  [v8 setPreviousValue:v9];

  [v8 setValue:v6];
  [v7 setSetting:v8];
  if (v11)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionary]);
    v11[2](v11, v10);
  }
}

- (id)_getAudioVideoSettings
{
  return +[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance");
}

@end