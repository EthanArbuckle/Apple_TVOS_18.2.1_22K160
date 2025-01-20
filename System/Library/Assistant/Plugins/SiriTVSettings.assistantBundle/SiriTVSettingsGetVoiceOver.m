@interface SiriTVSettingsGetVoiceOver
- (BOOL)_voiceOverTouchEnabled;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsGetVoiceOver

- (void)performWithCompletion:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    BOOL v5 = -[SiriTVSettingsGetVoiceOver _voiceOverTouchEnabled](self, "_voiceOverTouchEnabled");
    id v9 = (id)objc_opt_new(&OBJC_CLASS___SASettingGetBoolResponse);
    v6 = (void *)objc_opt_new(&OBJC_CLASS___SASettingBooleanEntity);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    [v6 setPreviousValue:v7];

    [v6 setValue:v5];
    [v9 setSetting:v6];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
    v4[2](v4, v8);
  }

- (BOOL)_voiceOverTouchEnabled
{
  return _AXSVoiceOverTouchEnabled(self, a2) != 0;
}

@end