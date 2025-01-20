@interface STSetting
- (id)_ad_aceSettingBooleanEntityRepresentation;
@end

@implementation STSetting

- (id)_ad_aceSettingBooleanEntityRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SASettingBooleanEntity);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STSetting value](self, "value"));
  objc_msgSend(v3, "setValue:", objc_msgSend(v4, "BOOLValue"));

  return v3;
}

@end