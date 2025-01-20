@interface ADiOSAssistantPropertiesUtilities
+ (int)_audibleVoiceFeedbackSettingFromSISchemaToODD:(int)a3;
+ (int)_heySiriHangupEnablementStateFromSISchemaToODD:(int)a3;
+ (int)_siriInCallEnablementStateFromSISchemaToODD:(int)a3;
+ (int)getHangUpEnablementState;
+ (int)getODDCarPlayAnnounceStatusFrom:(int64_t)a3;
+ (int)getSiriInCallEnablementState;
+ (int)getSiriPauseTimeStateFrom:(int64_t)a3;
+ (int)getVoiceFeedbackStatus;
@end

@implementation ADiOSAssistantPropertiesUtilities

+ (int)getHangUpEnablementState
{
  if (AFSupportsCallHangUp(a1, a2)
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences")),
        unint64_t v4 = (unint64_t)[v3 canUseVoiceTriggerDuringPhoneCallWithState],
        v3,
        v4 <= 2))
  {
    uint64_t v5 = dword_1003C9DE8[v4];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return _[a1 _heySiriHangupEnablementStateFromSISchemaToODD:v5];
}

+ (int)getSiriInCallEnablementState
{
  return _[a1 _siriInCallEnablementStateFromSISchemaToODD:0];
}

+ (int)getVoiceFeedbackStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unint64_t v4 = (unint64_t)[v3 useDeviceSpeakerForTTS];

  if (v4 > 3) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = dword_1003CA340[v4];
  }
  return _[a1 _audibleVoiceFeedbackSettingFromSISchemaToODD:v5];
}

+ (int)getODDCarPlayAnnounceStatusFrom:(int64_t)a3
{
  else {
    return dword_1003CA350[a3 - 1];
  }
}

+ (int)getSiriPauseTimeStateFrom:(int64_t)a3
{
  else {
    return 0;
  }
}

+ (int)_heySiriHangupEnablementStateFromSISchemaToODD:(int)a3
{
  else {
    return a3;
  }
}

+ (int)_siriInCallEnablementStateFromSISchemaToODD:(int)a3
{
  else {
    return a3;
  }
}

+ (int)_audibleVoiceFeedbackSettingFromSISchemaToODD:(int)a3
{
  else {
    return a3;
  }
}

@end