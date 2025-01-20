@interface CESRXPCActivity
- (void)registerDailyANECompilationActivity;
- (void)registerDailySubscriptionCleanupActivity;
- (void)registerPeriodicPreheatActivity;
- (void)registerPostUpgradeANECompilationActivity;
- (void)registerPostUpgradeSubscriptionActivity;
- (void)registerXPCActivities;
@end

@implementation CESRXPCActivity

- (void)registerXPCActivities
{
}

- (void)registerPostUpgradeSubscriptionActivity
{
  v2 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerPostUpgradeSubscriptionActivity]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: XPC: Registering the post-upgrade Subscription XPC Activity",  (uint8_t *)&v3,  0xCu);
  }

  sub_100027DF0( "com.apple.siri.xpc_activity.post-upgrade-subscriptions",  XPC_ACTIVITY_CHECK_IN,  &stru_10022A758,  &stru_10022A778);
}

- (void)registerDailySubscriptionCleanupActivity
{
  v2 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerDailySubscriptionCleanupActivity]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: XPC: Registering the daily Subscription Cleanup XPC Activity",  (uint8_t *)&v3,  0xCu);
  }

  sub_100027DF0( "com.apple.siri.xpc_activity.daily-subscription-cleanup",  XPC_ACTIVITY_CHECK_IN,  &stru_10022A798,  &stru_10022A7B8);
}

- (void)registerPostUpgradeANECompilationActivity
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier(self, a2) >= 10)
  {
    v2 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerPostUpgradeANECompilationActivity]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: XPC: Registering the post-upgrade ANE Compilation XPC Activity",  (uint8_t *)&v3,  0xCu);
    }

    sub_100027DF0( "com.apple.siri.xpc_activity.post-upgrade-speech-ane-compilation",  XPC_ACTIVITY_CHECK_IN,  &stru_10022A7D8,  &stru_10022A7F8);
  }

- (void)registerDailyANECompilationActivity
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier(self, a2) >= 10)
  {
    v2 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerDailyANECompilationActivity]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: XPC: Registering the daily ANE Compilation XPC Activity",  (uint8_t *)&v3,  0xCu);
    }

    sub_100027DF0( "com.apple.siri.xpc_activity.daily-speech-ane-compilation",  XPC_ACTIVITY_CHECK_IN,  &stru_10022A838,  &stru_10022A858);
  }

- (void)registerPeriodicPreheatActivity
{
  if (AFDeviceSupportsSiriMUX(self, a2) && AFIsUODCapableHorsemanDevice())
  {
    uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Enable ASR Periodic Preheat", @"com.apple.assistant", 0LL);
    int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0 && [v3 BOOLValue])
    {
      v6 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        int v7 = 136315138;
        v8 = "-[CESRXPCActivity registerPeriodicPreheatActivity]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: XPC: Registering the Periodic Preheat XPC Activity",  (uint8_t *)&v7,  0xCu);
      }

      sub_100027DF0( "com.apple.siri.xpc_activity.speech-periodic-preheat",  XPC_ACTIVITY_CHECK_IN,  &stru_10022A8F8,  &stru_10022A918);
    }
  }

@end