@interface SASettingSetBool
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_setting;
- (id)_ad_settingsRequestRepresentation;
- (int64_t)_ad_settingType;
@end

@implementation SASettingSetBool

- (int64_t)_ad_settingType
{
  return 0LL;
}

- (id)_ad_setting
{
  v3 = objc_alloc_init(&OBJC_CLASS___STSetting);
  -[STSetting setType:](v3, "setType:", -[SASettingSetBool _ad_settingType](self, "_ad_settingType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SASettingSetBool value](self, "value")));
  -[STSetting setValue:](v3, "setValue:", v4);

  return v3;
}

- (id)_ad_settingsRequestRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___AFSetSettingsRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASettingSetBool _ad_setting](self, "_ad_setting"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  -[AFSetSettingsRequest _setSettings:](v3, "_setSettings:", v5);

  -[AFSetSettingsRequest _setApplyChanges:]( v3,  "_setApplyChanges:",  -[SASettingSetBool dryRun](self, "dryRun") ^ 1);
  return v3;
}

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return objc_msgSend(a3, "_ad_aceSettingsResponseRepresentationForSetValueCommand:", self);
}

@end