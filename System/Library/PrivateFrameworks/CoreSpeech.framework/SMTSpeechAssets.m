@interface SMTSpeechAssets
+ (void)initialize;
- (id)fetchAssetPathForAssetConfig:(id)a3 outError:(id *)a4;
- (id)fetchAssetPathForInstalledLanguage:(id)a3 outError:(id *)a4;
@end

@implementation SMTSpeechAssets

- (id)fetchAssetPathForInstalledLanguage:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [[SFEntitledAssetConfig alloc] initWithLanguage:v6 assetType:3];

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SMTSpeechAssets fetchAssetPathForAssetConfig:outError:]( self,  "fetchAssetPathForAssetConfig:outError:",  v7,  a4));
  return v8;
}

- (id)fetchAssetPathForAssetConfig:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 language]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 installedAssetWithConfig:v5]);

  if (v8 && [v8 length])
  {
    v9 = v8;
  }

  else
  {
    if (a4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No asset found for language=%@",  v6,  NSLocalizedDescriptionKey));
      v14 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  102LL,  v11));
    }

    v9 = &stru_100010778;
  }

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SMTSpeechAssets, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SMTSpeechAssets");
    v3 = (void *)qword_100016008;
    qword_100016008 = (uint64_t)v2;
  }

@end