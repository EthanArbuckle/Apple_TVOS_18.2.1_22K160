@interface AFGetSettingsResponse
- (id)_ad_aceSettingsGetBooleanResponseRepresentation;
@end

@implementation AFGetSettingsResponse

- (id)_ad_aceSettingsGetBooleanResponseRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AFGetSettingsResponse settings](self, "settings"));
  if ((unint64_t)[v2 count] >= 2)
  {
    v3 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      int v9 = 136315394;
      v10 = "-[AFGetSettingsResponse(ADSettingsTransformer) _ad_aceSettingsGetBooleanResponseRepresentation]";
      __int16 v11 = 2048;
      id v12 = [v2 count];
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s has %ld settings, but can only handle one. Dropping all but the first on the floor.",  (uint8_t *)&v9,  0x16u);
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v6 = objc_alloc_init(&OBJC_CLASS___SASettingGetBoolResponse);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_ad_aceSettingBooleanEntityRepresentation"));
  [v6 setSetting:v7];

  return v6;
}

@end