@interface SiriTVSettingsGetMidnightMode
- (id)_getAudioVideoSettings;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsGetMidnightMode

- (void)performWithCompletion:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsGetMidnightMode _getAudioVideoSettings](self, "_getAudioVideoSettings"));
    id v6 = [v5 lateNightModeEnabled];

    id v10 = (id)objc_opt_new(&OBJC_CLASS___SASettingGetBoolResponse);
    v7 = (void *)objc_opt_new(&OBJC_CLASS___SASettingBooleanEntity);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    [v7 setPreviousValue:v8];

    [v7 setValue:v6];
    [v10 setSetting:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
    v4[2](v4, v9);
  }

- (id)_getAudioVideoSettings
{
  return +[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance");
}

@end