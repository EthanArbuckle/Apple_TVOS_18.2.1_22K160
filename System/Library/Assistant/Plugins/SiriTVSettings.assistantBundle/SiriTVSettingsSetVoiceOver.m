@interface SiriTVSettingsSetVoiceOver
- (BOOL)_voiceOverTouchEnabled;
- (void)_voiceOverTouchSetEnabled:(BOOL)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsSetVoiceOver

- (void)performWithCompletion:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  BOOL v4 = -[SiriTVSettingsSetVoiceOver _voiceOverTouchEnabled](self, "_voiceOverTouchEnabled");
  else {
    id v5 = -[SiriTVSettingsSetVoiceOver value](self, "value");
  }
  -[SiriTVSettingsSetVoiceOver _voiceOverTouchSetEnabled:](self, "_voiceOverTouchSetEnabled:", v5);
  v6 = (void *)objc_opt_new(&OBJC_CLASS___SASettingSetBoolResponse);
  v7 = (void *)objc_opt_new(&OBJC_CLASS___SASettingBooleanEntity);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v7 setPreviousValue:v8];

  [v7 setValue:v5];
  [v6 setSetting:v7];
  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionary]);
    v10[2](v10, v9);
  }
}

- (BOOL)_voiceOverTouchEnabled
{
  return _AXSVoiceOverTouchEnabled(self, a2) != 0;
}

- (void)_voiceOverTouchSetEnabled:(BOOL)a3
{
}

@end