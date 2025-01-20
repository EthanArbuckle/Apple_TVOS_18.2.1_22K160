@interface ADwatchOSAssistantProperties
- (BOOL)_getIsRaiseToSpeakEnabled;
- (BOOL)_getIsSiriTryItCompleted;
- (id)getODDwatchOSAssistantProperties;
@end

@implementation ADwatchOSAssistantProperties

- (id)getODDwatchOSAssistantProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[ADwatchOSAssistantProperties getODDwatchOSAssistantProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDwatchOSAssistantProperties);
  objc_msgSend( v4,  "setIsRaiseToSpeakEnabled:",  -[ADwatchOSAssistantProperties _getIsRaiseToSpeakEnabled](self, "_getIsRaiseToSpeakEnabled"));
  objc_msgSend( v4,  "setIsSiriTryItCompleted:",  -[ADwatchOSAssistantProperties _getIsSiriTryItCompleted](self, "_getIsSiriTryItCompleted"));
  return v4;
}

- (BOOL)_getIsRaiseToSpeakEnabled
{
  return 0;
}

- (BOOL)_getIsSiriTryItCompleted
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.SiriCarouselAlert");
  unsigned __int8 v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"TryItCompleted");

  return v3;
}

@end