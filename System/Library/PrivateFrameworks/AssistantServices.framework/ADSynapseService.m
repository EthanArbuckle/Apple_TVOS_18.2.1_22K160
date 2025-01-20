@interface ADSynapseService
- (id)customVocabSyncInfo;
- (id)identifier;
@end

@implementation ADSynapseService

- (id)identifier
{
  return @"com.apple.siri.SynapseSyncPlugin";
}

- (id)customVocabSyncInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 assistantIsEnabled];

  if (v3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[_INVocabularyStoreManager savedCustomVocabularyOverviewDictionary]( &OBJC_CLASS____INVocabularyStoreManager,  "savedCustomVocabularyOverviewDictionary"));
  }
  else {
    v4 = &__NSDictionary0__struct;
  }
  return v4;
}

@end