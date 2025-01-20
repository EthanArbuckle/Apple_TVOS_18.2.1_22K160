@interface SASettingGetBool
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (int64_t)_ad_settingType;
- (void)_ad_getSettingsRequestForHandler:(id)a3 completion:(id)a4;
@end

@implementation SASettingGetBool

- (int64_t)_ad_settingType
{
  return 0LL;
}

- (void)_ad_getSettingsRequestForHandler:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, id))a4;
  if (v5)
  {
    int64_t v6 = -[SASettingGetBool _ad_settingType](self, "_ad_settingType");
    if (v6)
    {
      int64_t v7 = v6;
      v8 = objc_alloc_init(&OBJC_CLASS___AFGetSettingsRequest);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
      v11 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      -[AFGetSettingsRequest setSettings:](v8, "setSettings:", v10);
    }

    else
    {
      v8 = 0LL;
    }

    v5[2](v5, v8);
  }
}

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return _objc_msgSend(a3, "_ad_aceSettingsGetBooleanResponseRepresentation");
}

@end