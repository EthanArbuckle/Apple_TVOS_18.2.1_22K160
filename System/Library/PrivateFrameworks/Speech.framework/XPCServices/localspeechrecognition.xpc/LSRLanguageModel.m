@interface LSRLanguageModel
+ (BOOL)createAppLmLmeProfileWithLanguage:(id)a3 modelRoot:(id)a4 customPronsData:(id)a5 newOovs:(id)a6 writeToVocabFile:(id)a7;
+ (id)_userProfileWithModelRoot:(id)a3 language:(id)a4;
+ (void)initialize;
- (BOOL)addProns:(id)a3 forWord:(id)a4;
- (BOOL)appLmNeedsRebuild:(id)a3 language:(id)a4 error:(id *)a5;
- (LSRLanguageModel)initWithAssetPath:(id)a3;
- (LSRLanguageModel)initWithLocale:(id)a3 clientID:(id)a4;
- (id)createSpeechProfileFromOovs:(id)a3 customProns:(id)a4 language:(id)a5;
- (id)deserializeNgramCountsData:(id)a3;
- (id)metrics;
- (id)ngramCountsSerializeData;
- (id)oovWordsAndFrequenciesInNgramCount;
- (id)oovsFromSentenceAddedToNgramCounts:(id)a3;
- (int64_t)lmeThreshold;
- (void)addSentenceToNgramCounts:(id)a3;
- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 saveTo:(id)a4;
- (void)createPhraseCountArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 saveTo:(id)a6;
- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 appLmArtifact:(id *)a6 vocabFile:(id *)a7;
- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToAppLmDir:(id *)a6 vocabFile:(id *)a7;
- (void)trainAppLmFromPlainTextAndWriteToAppDirectory:(id *)a3 vocabFile:(id *)a4;
@end

@implementation LSRLanguageModel

- (LSRLanguageModel)initWithLocale:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSRLanguageModel;
  v8 = -[LSRLanguageModel init](&v16, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SFUtilities localeCodeForLocale:](&OBJC_CLASS___SFUtilities, "localeCodeForLocale:", v6));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[SFUtilities stringByReplacingHyphensWithUnderscores:]( &OBJC_CLASS___SFUtilities,  "stringByReplacingHyphensWithUnderscores:",  v9));
    localeCode = v8->_localeCode;
    v8->_localeCode = (NSString *)v10;

    id v12 = [[SFEntitledAssetConfig alloc] initWithLanguage:v8->_localeCode assetType:3];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 installedAssetWithConfig:v12 regionId:0 shouldSubscribe:1 subscriberId:v7 expiration:0]);

    if (v14) {
      v8 = -[LSRLanguageModel initWithAssetPath:](v8, "initWithAssetPath:", v14);
    }
  }

  return v8;
}

- (LSRLanguageModel)initWithAssetPath:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LSRLanguageModel;
  v5 = -[LSRLanguageModel init](&v20, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"mini.json"]);
    recognizerConfigFilePath = v5->_recognizerConfigFilePath;
    v5->_recognizerConfigFilePath = (NSString *)v6;

    v8 = -[_EARAppLmData initWithConfiguration:recognizerConfigPath:]( objc_alloc(&OBJC_CLASS____EARAppLmData),  "initWithConfiguration:recognizerConfigPath:",  v5->_recognizerConfigFilePath,  v5->_recognizerConfigFilePath);
    appLmData = v5->_appLmData;
    v5->_appLmData = v8;

    if (!v5->_appLmData)
    {
      v18 = 0LL;
      goto LABEL_6;
    }

    uint64_t v10 = -[_EARSpeechRecognizer initWithConfiguration:]( objc_alloc(&OBJC_CLASS____EARSpeechRecognizer),  "initWithConfiguration:",  v5->_recognizerConfigFilePath);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_EARSpeechRecognizer modelInfo](v10, "modelInfo"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 language]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SFUtilities stringByReplacingHyphensWithUnderscores:]( &OBJC_CLASS___SFUtilities,  "stringByReplacingHyphensWithUnderscores:",  v12));
    localeCode = v5->_localeCode;
    v5->_localeCode = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_EARSpeechRecognizer modelInfo](v10, "modelInfo"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 version]);
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v16;
  }

  v18 = v5;
LABEL_6:

  return v18;
}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  -[_EARAppLmData addSentenceWithType:uuid:content:](self->_appLmData, "addSentenceWithType:uuid:content:", 0LL, v6, v4);
}

- (BOOL)addProns:(id)a3 forWord:(id)a4
{
  return -[_EARAppLmData setXsampaProns:forWord:](self->_appLmData, "setXsampaProns:forWord:", a3, a4);
}

- (id)oovsFromSentenceAddedToNgramCounts:(id)a3
{
  return -[_EARAppLmData addOovTokensFromSentence:](self->_appLmData, "addOovTokensFromSentence:", a3);
}

- (id)oovWordsAndFrequenciesInNgramCount
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_EARAppLmData orderedOovs](self->_appLmData, "orderedOovs", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 frequency]));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 orthography]);
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, v11);
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  id v12 = -[NSMutableDictionary copy](v3, "copy");
  return v12;
}

- (void)trainAppLmFromPlainTextAndWriteToAppDirectory:(id *)a3 vocabFile:(id *)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[_EARLmBuilder buildLmWithConfig:root:data:dir:shouldStop:]( &OBJC_CLASS____EARLmBuilder,  "buildLmWithConfig:root:data:dir:shouldStop:",  self->_recognizerConfigFilePath,  @"app-lm.NGRAM",  self->_appLmData,  &stru_100052290,  0LL));
  v8 = (os_log_s *)SFLogConnection;
  if (!v7)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      __int128 v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Failed to train model successfully",  (uint8_t *)&v15,  0xCu);
      if (!a3) {
        goto LABEL_13;
      }
    }

    else if (!a3)
    {
      goto LABEL_13;
    }

    *a3 = 0LL;
    goto LABEL_13;
  }

  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    __int128 v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Model trained successfully!",  (uint8_t *)&v15,  0xCu);
    v8 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = *a3;
    uint64_t v13 = v8;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    int v15 = 136315394;
    __int128 v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Writing to: %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([*a3 path]);
  unsigned __int8 v10 = [v7 writeToDirectory:v9];

  if ((v10 & 1) == 0)
  {
    v11 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      __int128 v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Write process failed",  (uint8_t *)&v15,  0xCu);
    }

    a4 = a3;
    goto LABEL_14;
  }

- (id)ngramCountsSerializeData
{
  id v3 = [[_EARSpeechModelInfo alloc] initWithConfig:self->_recognizerConfigFilePath];
  -[_EARAppLmData setInputFormat:](self->_appLmData, "setInputFormat:", 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_EARLmBuilder generateNgramCountsWithConfig:root:data:]( &OBJC_CLASS____EARLmBuilder,  "generateNgramCountsWithConfig:root:data:",  self->_recognizerConfigFilePath,  @"app-lm.NGRAM",  self->_appLmData));
  id v5 = [[_EARNgramLmModel alloc] initWithConfiguration:self->_recognizerConfigFilePath root:@"app-lm.NGRAM"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 language]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[LSRLanguageModel oovWordsAndFrequenciesInNgramCount](self, "oovWordsAndFrequenciesInNgramCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 serializedModelWithLanguage:v6 modelData:v4 oovs:v8]);

  unsigned __int8 v10 = (os_log_s *)SFLogConnection;
  if (v9)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[LSRLanguageModel ngramCountsSerializeData]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Successfully serialized ngram counts and OOVs",  (uint8_t *)&v12,  0xCu);
    }
  }

  else if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[LSRLanguageModel ngramCountsSerializeData]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize ngram counts data",  (uint8_t *)&v12,  0xCu);
  }

  return v9;
}

- (id)deserializeNgramCountsData:(id)a3
{
  return +[_EARLmModel2 deserializeModelData:](&OBJC_CLASS____EARLmModel2, "deserializeModelData:", a3);
}

- (int64_t)lmeThreshold
{
  return (int64_t)-[_EARAppLmData lmeThreshold](self->_appLmData, "lmeThreshold");
}

- (id)metrics
{
  return -[_EARAppLmData metrics](self->_appLmData, "metrics");
}

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToAppLmDir:(id *)a6 vocabFile:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[_EARLmModel2 deserializeModelData:](&OBJC_CLASS____EARLmModel2, "deserializeModelData:", v12));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:EARModelOovsKey]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:EARModelTrainingDataKey]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsSeparatedByCharactersInSet:v17]);

  if (!a7)
  {
LABEL_5:
    objc_super v20 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s No oovs in training data", buf, 0xCu);
    }

    goto LABEL_11;
  }

  id v19 = [v15 count];
  if (!v13 && !v19)
  {
    *a7 = 0LL;
    goto LABEL_5;
  }

  id v21 = *a7;
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByDeletingLastPathComponent]( self->_recognizerConfigFilePath,  "stringByDeletingLastPathComponent"));
  unsigned __int8 v23 = +[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]( &OBJC_CLASS___LSRLanguageModel,  "createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:",  v39,  v22,  v13,  v15,  v21);

  if ((v23 & 1) == 0)
  {

    v38 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s Failed to write LME", buf, 0xCu);
    }

    goto LABEL_33;
  }

  v24 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
    *(_DWORD *)buf = 136315394;
    v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
    __int16 v47 = 2112;
    id v48 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Successfully wrote LME: %@", buf, 0x16u);
  }

LABEL_11:
  -[_EARAppLmData setInputFormat:](self->_appLmData, "setInputFormat:", 2LL);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v26 = v18;
  id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v26);
        }
        -[_EARAppLmData addNgramCountWithType:content:]( self->_appLmData,  "addNgramCountWithType:content:",  0LL,  *(void *)(*((void *)&v40 + 1) + 8LL * (void)i));
      }

      id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v27);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[_EARLmBuilder buildLmWithConfig:root:data:dir:shouldStop:]( &OBJC_CLASS____EARLmBuilder,  "buildLmWithConfig:root:data:dir:shouldStop:",  self->_recognizerConfigFilePath,  @"app-lm.NGRAM",  self->_appLmData,  &stru_100052290,  0LL));
  if (v30)
  {
    if (!a6)
    {
LABEL_24:

      appLmData = self->_appLmData;
      self->_appLmData = 0LL;

      goto LABEL_33;
    }

    id v31 = *a6;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 path]);
    unsigned __int8 v33 = [v30 writeToDirectory:v32];

    if ((v33 & 1) != 0)
    {
      v34 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
        __int16 v47 = 2112;
        id v48 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Successfully wrote app-lm to path=%@",  buf,  0x16u);
      }

      goto LABEL_24;
    }

    v37 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s Failed to write trained AppLm",  buf,  0xCu);
    }
  }

  else
  {
    v36 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s Failed to train from ngram counts",  buf,  0xCu);
    }
  }

- (void)createPhraseCountArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 saveTo:(id)a6
{
  localeCode = self->_localeCode;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue([a4 path]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  +[_EARAppLmArtifact createPhraseCountsArtifact:version:locale:rawPhraseCountsPath:customPronunciationsPath:saveTo:]( &OBJC_CLASS____EARAppLmArtifact,  "createPhraseCountsArtifact:version:locale:rawPhraseCountsPath:customPronunciationsPath:saveTo:",  v12,  @"1.0",  localeCode,  v15,  v13,  v14);
}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 saveTo:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 path]);
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  +[_EARAppLmArtifact transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:]( &OBJC_CLASS____EARAppLmArtifact,  "transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:",  v9,  4LL,  recognizerConfigFilePath,  0LL,  0LL,  1LL,  v8);
}

- (id)createSpeechProfileFromOovs:(id)a3 customProns:(id)a4 language:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByDeletingLastPathComponent]( recognizerConfigFilePath,  "stringByDeletingLastPathComponent"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSRLanguageModel _userProfileWithModelRoot:language:]( &OBJC_CLASS___LSRLanguageModel,  "_userProfileWithModelRoot:language:",  v12,  v11));

  if (v13)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002B430;
    v27[3] = &unk_100051A00;
    __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v28 = v14;
    [v8 enumerateObjectsUsingBlock:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10002B494;
    v25[3] = &unk_100051A78;
    id v15 = v14;
    id v26 = v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10002B4A0;
    v23[3] = &unk_100051A78;
    id v16 = v13;
    id v24 = v16;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v23);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataProfile]);
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }

    else
    {
      id v21 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[LSRLanguageModel createSpeechProfileFromOovs:customProns:language:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Failed to create user profile",  buf,  0xCu);
      }
    }
  }

  else
  {
    objc_super v20 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[LSRLanguageModel createSpeechProfileFromOovs:customProns:language:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Failed to create user profile object",  buf,  0xCu);
    }

    v18 = 0LL;
  }

  return v18;
}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 appLmArtifact:(id *)a6 vocabFile:(id *)a7
{
  id v75 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  v103[0] = kSFCoreAnalyticsLanguageKey;
  v103[1] = kSFCoreAnalyticsAppnameKey;
  modelVersion = @"<unknown>";
  if (v11) {
    __int128 v14 = v11;
  }
  else {
    __int128 v14 = @"<unknown>";
  }
  v74 = v12;
  v104[0] = v12;
  v104[1] = v14;
  v103[2] = kSFCoreAnalyticsModelVersionKey;
  if (self->_modelVersion) {
    modelVersion = (const __CFString *)self->_modelVersion;
  }
  v104[2] = modelVersion;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  3LL));
  uint64_t Name = SFAnalyticsEventTypeGetName(301LL);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472LL;
  v93[2] = sub_10002AAE0;
  v93[3] = &unk_100051CD0;
  id v18 = v15;
  id v94 = v18;
  AnalyticsSendEventLazy(v17, v93);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v19 systemUptime];
  double v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue([v75 path]);
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([*a6 path]);
  unsigned __int8 v25 = +[_EARAppLmArtifact transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:]( &OBJC_CLASS____EARAppLmArtifact,  "transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:",  v22,  5LL,  recognizerConfigFilePath,  0LL,  0LL,  1LL,  v24);

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v26 systemUptime];
  double v28 = v27;

  double v29 = v28 - v21;
  if ((v25 & 1) != 0)
  {
    id v30 = objc_alloc(&OBJC_CLASS____EARAppLmArtifact);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v75 path]);
    id v32 = [v30 initWithPath:v31];

    if (v32)
    {
      unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v33 systemUptime];
      double v35 = v34;

      v36 = (void *)objc_claimAutoreleasedReturnValue([v32 loadCustomPronData:self->_recognizerConfigFilePath dataRoot:0]);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v37 systemUptime];
      double v39 = v38;

      if (v36)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v100 = sub_10002AE50;
        v101 = sub_10002AE60;
        v102 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if ([v36 isValid])
        {
          id v40 = (id)objc_claimAutoreleasedReturnValue([v36 getProns]);
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472LL;
          v82[2] = sub_10002AE68;
          v82[3] = &unk_100051AF0;
          v82[4] = buf;
          [v40 enumerateObjectsUsingBlock:v82];
        }

        else
        {
          id v40 = SFLogConnection;
          if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_INFO))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue([v36 validationError]);
            *(_DWORD *)v95 = 136315394;
            v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
            __int16 v97 = 2112;
            id v98 = v50;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v40,  OS_LOG_TYPE_INFO,  "%s Artifact contained invalid custom prons; skipping. %@",
              v95,
              0x16u);
          }
        }

        id v51 = objc_alloc(&OBJC_CLASS____EARAppLmArtifact);
        v52 = (void *)objc_claimAutoreleasedReturnValue([*a6 path]);
        id v72 = [v51 initWithPath:v52];

        if (v72)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue([v72 loadOovs]);
          if (!v53)
          {
            v54 = (os_log_s *)SFLogConnection;
            if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v95 = 136315138;
              v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s Could not get OOVs from artifact",  v95,  0xCu);
            }

            v53 = &__NSArray0__struct;
          }

          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
          [v55 systemUptime];
          double v57 = v56;

          v58 = (void *)objc_claimAutoreleasedReturnValue( -[LSRLanguageModel createSpeechProfileFromOovs:customProns:language:]( self,  "createSpeechProfileFromOovs:customProns:language:",  v53,  *(void *)(*(void *)&buf[8] + 40LL),  v74));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
          [v59 systemUptime];
          double v61 = v60;

          if (v58)
          {
            [v58 writeToURL:*a7 atomically:0];
            v62 = (os_log_s *)SFLogConnection;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue([*a7 path]);
              *(_DWORD *)v95 = 136315394;
              v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
              __int16 v97 = 2112;
              id v98 = v63;
              _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_INFO,  "%s Wrote profile data to file:%@",  v95,  0x16u);
            }

            uint64_t v64 = SFAnalyticsEventTypeGetName(302LL);
            v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472LL;
            v76[2] = sub_10002B154;
            v76[3] = &unk_100051B18;
            v66 = v76;
            v76[4] = v18;
            v76[5] = v32;
            *(double *)&v76[6] = v29;
            *(double *)&v76[7] = v39 - v35;
            *(double *)&v76[8] = v61 - v57;
            *(double *)&v76[9] = v21;
            AnalyticsSendEventLazy(v65, v76);
          }

          else
          {
            *a7 = 0LL;
            uint64_t v71 = SFAnalyticsEventTypeGetName(303LL);
            v65 = (void *)objc_claimAutoreleasedReturnValue(v71);
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472LL;
            v77[2] = sub_10002B018;
            v77[3] = &unk_100051AC8;
            v66 = v77;
            v77[4] = v18;
            v77[5] = v32;
            *(double *)&v77[6] = v21;
            AnalyticsSendEventLazy(v65, v77);
          }
        }

        else
        {
          v67 = (os_log_s *)SFLogConnection;
          if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
          {
            id v68 = *a6;
            *(_DWORD *)v95 = 136315394;
            v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
            __int16 v97 = 2112;
            id v98 = v68;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_INFO,  "%s Failed to load language model artifact at: %@",  v95,  0x16u);
          }

          *a7 = 0LL;
          uint64_t v69 = SFAnalyticsEventTypeGetName(303LL);
          v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472LL;
          v78[2] = sub_10002AEDC;
          v78[3] = &unk_100051AC8;
          id v79 = v18;
          id v80 = v32;
          double v81 = v21;
          AnalyticsSendEventLazy(v70, v78);

          v53 = v79;
        }

        _Block_object_dispose(buf, 8);
      }

      else
      {
        __int16 v47 = (os_log_s *)SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "%s Failed to load custom prons from artifact",  buf,  0xCu);
        }

        *a7 = 0LL;
        uint64_t v48 = SFAnalyticsEventTypeGetName(303LL);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472LL;
        v83[2] = sub_10002AD14;
        v83[3] = &unk_100051AC8;
        id v84 = v18;
        id v85 = v32;
        double v86 = v21;
        AnalyticsSendEventLazy(v49, v83);

        v36 = 0LL;
      }
    }

    else
    {
      v44 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v75;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "%s Failed to read ngram counts artifact at: %@",  buf,  0x16u);
      }

      *a7 = 0LL;
      uint64_t v45 = SFAnalyticsEventTypeGetName(303LL);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472LL;
      v87[2] = sub_10002ABEC;
      v87[3] = &unk_100051AA0;
      id v88 = v18;
      double v89 = v21;
      AnalyticsSendEventLazy(v46, v87);

      v36 = v88;
    }
  }

  else
  {
    __int128 v41 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Failed to train app-specific LM", buf, 0xCu);
    }

    *a7 = 0LL;
    *a6 = 0LL;
    uint64_t v42 = SFAnalyticsEventTypeGetName(303LL);
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_10002AAE8;
    v90[3] = &unk_100051AA0;
    id v91 = v18;
    double v92 = v28 - v21;
    AnalyticsSendEventLazy(v43, v90);
  }
}

- (BOOL)appLmNeedsRebuild:(id)a3 language:(id)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned int v8 = +[_EARArtifact isValid:](&OBJC_CLASS____EARArtifact, "isValid:", v7);

  if (v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS____EARAppLmArtifact);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v11 = [v9 initWithPath:v10];

    if (v11) {
      unsigned int v12 = [v11 isAdaptableToSpeechModelVersion:self->_modelVersion locale:self->_localeCode] ^ 1;
    }
    else {
      LOBYTE(v12) = 1;
    }
  }

  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___LSRLanguageModel, a2) == a1) {
    SFLogInitIfNeeded();
  }
}

+ (id)_userProfileWithModelRoot:(id)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"mini.json"]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"ncs"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"en_US_napg.json"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"vocdelta.voc"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"pg.voc"]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"mrec.psh"]);
  id v13 = [[_EARUserProfile alloc] initWithConfiguration:v7 language:v5 overrides:0 sdapiOverrides:v9 emptyVoc:v10 pgVoc:v11 paramsetHolder:v12];

  return v13;
}

+ (BOOL)createAppLmLmeProfileWithLanguage:(id)a3 modelRoot:(id)a4 customPronsData:(id)a5 newOovs:(id)a6 writeToVocabFile:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[LSRLanguageModel _userProfileWithModelRoot:language:]( &OBJC_CLASS___LSRLanguageModel,  "_userProfileWithModelRoot:language:",  a4,  v11));
  if (v15)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10002BAEC;
    v39[3] = &unk_100051A00;
    id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v40 = v16;
    [v13 enumerateObjectsUsingBlock:v39];
    if (v12)
    {
      id v33 = [[_EARPlsParser alloc] initWithData:v12];
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v33 lexemes]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v17));

      id v19 = objc_alloc(&OBJC_CLASS____EARPhonesetMapping);
      id v20 = v14;
      id v21 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[SFUtilities stringByReplacingHyphensWithUnderscores:]( &OBJC_CLASS___SFUtilities,  "stringByReplacingHyphensWithUnderscores:",  v11));
      id v23 = [v19 initWithLanguage:v22];

      id v13 = v21;
      id v14 = v20;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10002BB50;
      v36[3] = &unk_100051A50;
      id v37 = v23;
      double v38 = v16;
      id v24 = v23;
      [v18 enumerateKeysAndObjectsUsingBlock:v36];
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10002BC20;
    v34[3] = &unk_100051A78;
    id v25 = v15;
    id v35 = v25;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v34);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dataProfile]);
    double v27 = v26;
    BOOL v28 = v26 != 0LL;
    if (v26)
    {
      [v26 writeToURL:v14 atomically:0];
      double v29 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v42 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Wrote profile data to file:%@", buf, 0x16u);
      }
    }

    else
    {
      id v31 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v42 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Failed to create user profile",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v30 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v42 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Failed to create user profile object",  buf,  0xCu);
    }

    BOOL v28 = 0;
  }

  return v28;
}

@end