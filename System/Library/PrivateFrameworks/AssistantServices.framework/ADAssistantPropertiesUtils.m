@interface ADAssistantPropertiesUtils
+ (id)SISchemaLocaleToSISchemaISOLocale:(int)a3;
+ (int)ODDSiriSchemaODDListenForFrom:(id)a3;
+ (int)SISchemaDataSharingOptInStateFrom:(int64_t)a3;
+ (int)SISchemaVoiceGenderFromAFVoiceGender:(int64_t)a3;
@end

@implementation ADAssistantPropertiesUtils

+ (int)SISchemaVoiceGenderFromAFVoiceGender:(int64_t)a3
{
  else {
    return dword_1003C9FE8[a3 - 1];
  }
}

+ (int)SISchemaDataSharingOptInStateFrom:(int64_t)a3
{
  else {
    return 0;
  }
}

+ (int)ODDSiriSchemaODDListenForFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isHeySiriTriggerPhraseEnabled]
    && ([v3 isJustSiriTriggerPhraseEnabled] & 1) != 0)
  {
    int v4 = 1;
  }

  else if ([v3 isHeySiriTriggerPhraseEnabled])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 3;
  }

  return v4;
}

+ (id)SISchemaLocaleToSISchemaISOLocale:(int)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaISOLocale);
  v5 = v4;
  if (a3 <= 0x3E)
  {
    uint64_t v6 = dword_1003C9FF4[a3];
    uint64_t v7 = dword_1003CA0F0[a3];
    [v4 setCountryCode:v6];
    [v5 setLanguageCode:v7];
  }

  return v5;
}

@end