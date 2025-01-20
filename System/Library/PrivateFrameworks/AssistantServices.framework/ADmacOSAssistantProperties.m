@interface ADmacOSAssistantProperties
- (BOOL)_getIsExternalMicrophoneHSEnabled;
- (id)getODDmacOSAssistantProperties;
@end

@implementation ADmacOSAssistantProperties

- (id)getODDmacOSAssistantProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[ADmacOSAssistantProperties getODDmacOSAssistantProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDmacOSAssistantProperties);
  objc_msgSend( v4,  "setIsExternalMicrophoneHSEnabled:",  -[ADmacOSAssistantProperties _getIsExternalMicrophoneHSEnabled](self, "_getIsExternalMicrophoneHSEnabled"));
  return v4;
}

- (BOOL)_getIsExternalMicrophoneHSEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 voiceTriggerEnabledWithDeviceType:3 endpointId:0];

  return v3;
}

@end