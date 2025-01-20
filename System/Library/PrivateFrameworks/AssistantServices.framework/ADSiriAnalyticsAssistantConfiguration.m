@interface ADSiriAnalyticsAssistantConfiguration
- (BOOL)assistantEnabled;
- (BOOL)dictationEnabled;
- (BOOL)optedInToDataSharing;
- (BOOL)removePersistentIdentifiers;
@end

@implementation ADSiriAnalyticsAssistantConfiguration

- (BOOL)assistantEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

- (BOOL)dictationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 dictationIsEnabled];

  return v3;
}

- (BOOL)optedInToDataSharing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  BOOL v3 = [v2 siriDataSharingOptInStatus] == (id)1;

  return v3;
}

- (BOOL)removePersistentIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  char v3 = [v2 longLivedIdentifierUploadingEnabled] ^ 1;

  return v3;
}

@end