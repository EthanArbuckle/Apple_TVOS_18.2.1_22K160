@interface AFSetSettingsResponse
- (id)_ad_aceSettingsResponseRepresentationForSetValueCommand:(id)a3;
@end

@implementation AFSetSettingsResponse

- (id)_ad_aceSettingsResponseRepresentationForSetValueCommand:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFSetSettingsResponse settingChanges](self, "settingChanges"));
  if ((unint64_t)[v5 count] >= 2)
  {
    v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      int v11 = 136315394;
      v12 = "-[AFSetSettingsResponse(ADSettingsTransformer) _ad_aceSettingsResponseRepresentationForSetValueCommand:]";
      __int16 v13 = 2048;
      id v14 = [v5 count];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s has %ld setting changes, but can only handle one. Dropping all but the first on the floor.",  (uint8_t *)&v11,  0x16u);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_ad_aceSettingsResponseRepresentationForSetValueCommand:", v4));

  return v9;
}

@end