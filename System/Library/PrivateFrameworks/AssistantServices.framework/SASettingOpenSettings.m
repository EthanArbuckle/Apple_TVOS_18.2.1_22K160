@interface SASettingOpenSettings
- (id)_ad_settingsRequestRepresentation;
- (int64_t)_ad_settingType;
@end

@implementation SASettingOpenSettings

- (int64_t)_ad_settingType
{
  return 0LL;
}

- (id)_ad_settingsRequestRepresentation
{
  return  objc_msgSend( [AFShowSettingRequest alloc],  "_initWithSettingType:",  -[SASettingOpenSettings _ad_settingType](self, "_ad_settingType"));
}

@end