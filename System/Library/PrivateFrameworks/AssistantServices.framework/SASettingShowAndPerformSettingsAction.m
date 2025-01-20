@interface SASettingShowAndPerformSettingsAction
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_settingsRequestRepresentation;
@end

@implementation SASettingShowAndPerformSettingsAction

- (id)_ad_settingsRequestRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASettingShowAndPerformSettingsAction settingsAction](self, "settingsAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_ad_settingsRequestRepresentation"));

  return v3;
}

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    v6 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
  }
  else {
    v6 = 0LL;
  }
  return v6;
}

@end