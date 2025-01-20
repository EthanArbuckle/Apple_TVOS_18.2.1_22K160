@interface ESSpeechProfileBuilderConnection
+ (BOOL)_isProfileValidFromVersionsMap:(id)a3;
+ (id)userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8;
+ (void)_addContactWords:(id)a3 toSpeechProfile:(id)a4 forSpeechCategory:(id)a5;
+ (void)_addUserData:(id)a3 toSpeechProfile:(id)a4 addedCategoriesOut:(id)a5;
- (ESSpeechProfileBuilderConnection)initWithXPCConnection:(id)a3;
- (id)_speechProfileWithError:(id *)a3;
- (void)addCodepathId:(id)a3 completion:(id)a4;
- (void)addVocabularyItems:(id)a3 isBoosted:(id)a4 completion:(id)a5;
- (void)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)cancelWithCompletion:(id)a3;
- (void)dealloc;
- (void)finishAndSaveProfile:(BOOL)a3 completion:(id)a4;
- (void)getCodepathIdsWithCompletion:(id)a3;
- (void)getVersionForCategory:(id)a3 completion:(id)a4;
- (void)removeCodepathId:(id)a3 completion:(id)a4;
- (void)setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6 completion:(id)a7;
@end

@implementation ESSpeechProfileBuilderConnection

- (ESSpeechProfileBuilderConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ESSpeechProfileBuilderConnection;
  v6 = -[ESSpeechProfileBuilderConnection init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = os_transaction_create("com.apple.siri.embeddedspeech.speechprofilegeneration");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    stagedItems = v7->_stagedItems;
    v7->_stagedItems = 0LL;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    committedItems = v7->_committedItems;
    v7->_committedItems = v11;

    stagedCategoryToVersion = v7->_stagedCategoryToVersion;
    v7->_stagedCategoryToVersion = 0LL;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    committedCategoryToVersion = v7->_committedCategoryToVersion;
    v7->_committedCategoryToVersion = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    seenCategories = v7->_seenCategories;
    v7->_seenCategories = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    codepathIds = v7->_codepathIds;
    v7->_codepathIds = v18;

    objc_initWeak(&location, v7);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    v24 = sub_10000B47C;
    v25 = &unk_100040C48;
    objc_copyWeak(&v26, &location);
    v20 = objc_retainBlock(&v22);
    objc_msgSend(v5, "setInterruptionHandler:", v20, v22, v23, v24, v25);
    [v5 setInvalidationHandler:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ESSpeechProfileBuilderConnection;
  -[ESSpeechProfileBuilderConnection dealloc](&v3, "dealloc");
}

- (void)setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6 completion:(id)a7
{
  v12 = (NSString *)a3;
  v13 = (NSString *)a4;
  v14 = (NSString *)a5;
  language = self->_language;
  self->_language = v12;
  v16 = v12;
  uint64_t v23 = (void (**)(id, uint64_t, void))a7;

  baseDirectory = self->_baseDirectory;
  self->_baseDirectory = v13;
  v18 = v13;

  userId = self->_userId;
  self->_userId = v14;
  v20 = v14;

  self->_dataProtectionClass = a6;
  v21 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  self->_language,  3LL);
  assetConfig = self->_assetConfig;
  self->_assetConfig = v21;

  v23[2](v23, 1LL, 0LL);
}

- (void)removeCodepathId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v11 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v11));
  id v9 = v11;
  v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0LL, v9);
  }

  else
  {
    -[NSMutableSet removeObject:](self->_codepathIds, "removeObject:", v6);
    v7[2](v7, 1LL, 0LL);
  }
}

- (void)addCodepathId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v11 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v11));
  id v9 = v11;
  v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0LL, v9);
  }

  else
  {
    -[NSMutableSet addObject:](self->_codepathIds, "addObject:", v6);
    v7[2](v7, 1LL, 0LL);
  }
}

- (void)getCodepathIdsWithCompletion:(id)a3
{
  id v8 = 0LL;
  v4 = (void (**)(id, void, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v8));
  id v6 = v8;
  v7 = v6;
  if (!v5 || v6) {
    v4[2](v4, 0LL, v6);
  }
  else {
    ((void (**)(id, NSMutableSet *, id))v4)[2](v4, self->_codepathIds, 0LL);
  }
}

- (void)getVersionForCategory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v13));
  id v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, -1LL, v9);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_committedCategoryToVersion, "objectForKey:", v6));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_committedCategoryToVersion, "objectForKey:", v6));
      v7[2](v7, (uint64_t)[v12 longLongValue], 0);
    }

    else
    {
      v7[2](v7, -1LL, 0LL);
    }
  }
}

- (void)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v35 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v35));
  id v10 = v35;
  id v11 = v10;
  if (!v9 || v10)
  {
    v8[2](v8, 0LL, v10);
    goto LABEL_10;
  }

  if (self->_stagedItems || self->_stagedCategoryToVersion)
  {
    v12 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
      __int16 v45 = 2112;
      v46 = @"Begin called while there are already active categories.";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    v42 = @"Begin called while there are already active categories.";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CESRProfileErrorDomain",  3LL,  v13));
    v8[2](v8, 0LL, v14);

    goto LABEL_8;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileBuilder supportedCategories]( &OBJC_CLASS___CESRSpeechProfileBuilder,  "supportedCategories"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v15 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v15) {
    goto LABEL_20;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v32;
  while (2)
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
      if (-[NSMutableSet containsObject:](self->_seenCategories, "containsObject:", v19))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Speech category %@ has already been committed with a call to Begin followed by Finish",  v19));
        v25 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
          __int16 v45 = 2112;
          v46 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
        }

        NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
        v39 = v24;
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
        uint64_t v27 = 3LL;
        goto LABEL_27;
      }

      if (([v13 containsObject:v19] & 1) == 0)
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Speech category %@ is unsupported",  v19));
        objc_super v28 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
          __int16 v45 = 2112;
          v46 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
        }

        NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
        v37 = v24;
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        uint64_t v27 = 5LL;
LABEL_27:
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CESRProfileErrorDomain",  v27,  v26));
        v8[2](v8, 0LL, v29);

        goto LABEL_8;
      }
    }

    id v16 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v16) {
      continue;
    }
    break;
  }

- (void)addVocabularyItems:(id)a3 isBoosted:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if (self->_stagedItems && self->_stagedCategoryToVersion)
  {
    id v11 = [v8 count];
    if (v11 == [v9 count])
    {
      v12 = (char *)[v8 count];
      if (v12)
      {
        id v13 = v12;
        for (i = 0LL; i != v13; ++i)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:i]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:i]);
          objc_msgSend(v15, "setIsBoosted:", objc_msgSend(v16, "BOOLValue"));
        }
      }
    }

    else
    {
      v20 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ESSpeechProfileBuilderConnection addVocabularyItems:isBoosted:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Internal inconsistency error: CCSharedItems list and corresponding isBoosted BOOLeans list are out of sync. This batch of items will not be boosted.",  buf,  0xCu);
      }

      id v9 = 0LL;
    }

    -[NSMutableArray addObjectsFromArray:](self->_stagedItems, "addObjectsFromArray:", v8);
    v10[2](v10, 1LL, 0LL);
  }

  else
  {
    uint64_t v17 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ESSpeechProfileBuilderConnection addVocabularyItems:isBoosted:completion:]";
      __int16 v25 = 2112;
      id v26 = @"Add called before categories have been set with Begin";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
    }

    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    v22 = @"Add called before categories have been set with Begin";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CESRProfileErrorDomain",  3LL,  v18));
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0LL, v19);
  }
}

- (void)cancelWithCompletion:(id)a3
{
  stagedItems = self->_stagedItems;
  self->_stagedItems = 0LL;
  id v6 = (void (**)(id, uint64_t, void))a3;

  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = 0LL;

  v6[2](v6, 1LL, 0LL);
}

- (void)finishAndSaveProfile:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, id))a4;
  seenCategories = self->_seenCategories;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_stagedCategoryToVersion, "allKeys"));
  -[NSMutableSet addObjectsFromArray:](seenCategories, "addObjectsFromArray:", v8);

  stagedItems = self->_stagedItems;
  committedItems = self->_committedItems;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_stagedCategoryToVersion, "allKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  -[NSMutableDictionary setObject:forKey:](committedItems, "setObject:forKey:", stagedItems, v12);

  -[NSMutableDictionary addEntriesFromDictionary:]( self->_committedCategoryToVersion,  "addEntriesFromDictionary:",  self->_stagedCategoryToVersion);
  id v13 = self->_stagedItems;
  self->_stagedItems = 0LL;

  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = 0LL;

  if (!v4) {
    goto LABEL_38;
  }
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = sub_10000B334;
  v57 = sub_10000B344;
  id v58 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v15 = self->_committedItems;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10000B34C;
  v52[3] = &unk_100040A08;
  v52[4] = &v53;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v52);
  -[NSMutableDictionary removeAllObjects](self->_committedItems, "removeAllObjects");
  id v51 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ESSpeechProfileBuilderConnection _speechProfileWithError:](self, "_speechProfileWithError:", &v51));
  id v17 = v51;
  v18 = v17;
  if (!v16 || v17)
  {
    v6[2](v6, 0LL, v17);
    int v19 = 1;
  }

  else
  {
    [v16 setTemplateToVersion:self->_committedCategoryToVersion];
    [v16 setExperimentIds:self->_codepathIds];
    if (self->_dataProtectionClass == 6) {
      [v16 setUserId:self->_userId];
    }
    else {
      [v16 setUserId:&stru_1000415D8];
    }
    [v16 removeAllWords];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v21 = (id)v54[5];
    id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          +[ESSpeechProfileBuilderConnection _addUserData:toSpeechProfile:addedCategoriesOut:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "_addUserData:toSpeechProfile:addedCategoriesOut:",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)i),  v16,  v20);
        }

        id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
      }

      while (v22);
    }

    [v16 signalEndOfUserData];
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int16 v25 = self->_seenCategories;
    id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v43,  v65,  16LL);
    if (v26)
    {
      uint64_t v27 = *(void *)v44;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)j);
        }

        id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v43,  v65,  16LL);
      }

      while (v26);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileBuilder profileFilePathFromBasePath:language:userId:]( &OBJC_CLASS___CESRSpeechProfileBuilder,  "profileFilePathFromBasePath:language:userId:",  self->_baseDirectory,  self->_language,  self->_userId));
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByDeletingLastPathComponent]);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v32 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:0];

    int64_t dataProtectionClass = self->_dataProtectionClass;
    id v41 = 0LL;
    unsigned __int8 v34 = [v16 writeProfileToFile:v30 protectionClass:dataProtectionClass length:&v42 error:&v41];
    id v35 = v41;
    unsigned __int8 v36 = v35 ? 0 : v34;
    v37 = (os_log_s *)AFSiriLogContextSpeech;
    if ((v36 & 1) != 0)
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v60 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]";
        __int16 v61 = 2048;
        v62 = v42;
        __int16 v63 = 2112;
        id v64 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s Speech profile updated successfully. Wrote %lu bytes to %@",  buf,  0x20u);
      }

      -[NSMutableSet removeAllObjects](self->_seenCategories, "removeAllObjects");
      int v19 = 0;
      transaction = self->_transaction;
      self->_transaction = 0LL;
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v60 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]";
        __int16 v61 = 2112;
        v62 = @"Failed to write profile";
        __int16 v63 = 2112;
        id v64 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s %@: %@", buf, 0x20u);
      }

      v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      transaction = (OS_os_transaction *)v39;
      if (v35) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v35,  NSUnderlyingErrorKey);
      }
      -[OS_os_transaction setObject:forKeyedSubscript:]( transaction,  "setObject:forKeyedSubscript:",  @"Failed to write profile",  NSLocalizedFailureReasonErrorKey);
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CESRProfileErrorDomain",  7LL,  transaction));
      v6[2](v6, 0LL, v40);

      int v19 = 1;
    }
  }

  _Block_object_dispose(&v53, 8);
  if (!v19) {
LABEL_38:
  }
    v6[2](v6, 1LL, 0LL);
}

- (id)_speechProfileWithError:(id *)a3
{
  p_profile = (id *)&self->_profile;
  profile = self->_profile;
  if (profile) {
    return profile;
  }
  assetConfig = self->_assetConfig;
  id v32 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:",  assetConfig,  0LL,  0LL,  0LL,  0LL,  &v32));
  id v10 = v32;
  id v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    id v13 = *p_profile;
    id *p_profile = 0LL;

    if (a3)
    {
      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  @"Failed to load speech assets",  NSLocalizedFailureReasonErrorKey);
      if (v11) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v11,  NSUnderlyingErrorKey);
      }
      id v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", @"CESRProfileErrorDomain", 9LL, v14));
      *a3 = v15;
    }

    id v16 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
      __int16 v37 = 2112;
      NSErrorUserInfoKey v38 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Could not create EAR profile builder: %@",  buf,  0x16u);
    }

    id v17 = 0LL;
    goto LABEL_29;
  }

  v18 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Created _EARProfileBuilder from asset config.",  buf,  0xCu);
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileBuilder profileFilePathFromBasePath:language:userId:]( &OBJC_CLASS___CESRSpeechProfileBuilder,  "profileFilePathFromBasePath:language:userId:",  self->_baseDirectory,  self->_language,  self->_userId));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v21 = [v20 fileExistsAtPath:v19];

  if (v21)
  {
    [v9 readUserProfileWithPath:v19 reuseProfile:1];
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 templateToVersion]);
    id v23 = [v22 mutableCopy];

    if (!+[ESSpeechProfileBuilderConnection _isProfileValidFromVersionsMap:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "_isProfileValidFromVersionsMap:",  v23))
    {
      if (a3)
      {
        NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
        unsigned __int8 v34 = @"Failed to read the existing speech profile";
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
        id v30 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", @"CESRProfileErrorDomain", 6LL, v29));
        *a3 = v30;
      }

      id v17 = 0LL;
      goto LABEL_28;
    }

    v24 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
      __int16 v37 = 2112;
      NSErrorUserInfoKey v38 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%s Existing profile found at %@",  buf,  0x16u);
    }

    [v23 addEntriesFromDictionary:self->_committedCategoryToVersion];
    objc_storeStrong((id *)&self->_committedCategoryToVersion, v23);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 experimentIds]);
    if (v25)
    {
      id v26 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v9 experimentIds]);
      uint64_t v27 = (NSMutableSet *)-[NSMutableSet mutableCopy](v26, "mutableCopy");
      codepathIds = self->_codepathIds;
      self->_codepathIds = v27;
    }

    else
    {
      __int128 v31 = self->_codepathIds;
      id v26 = self->_codepathIds;
      self->_codepathIds = v31;
    }
  }

  objc_storeStrong(p_profile, v9);
  id v17 = *p_profile;
LABEL_28:

LABEL_29:
  return v17;
}

- (void).cxx_destruct
{
}

+ (BOOL)_isProfileValidFromVersionsMap:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues", 0));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (((unint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * (void)i) longLongValue] & 0x8000000000000000) == 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

+ (id)userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v44 = a5;
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v12 language]);
  if (v13 && AFIsInternalInstall())
  {
    v14 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v53 = "+[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]";
      __int16 v54 = 2112;
      id v55 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Set model root to %@", buf, 0x16u);
    }

    id v15 = v13;
    id v16 = 0LL;
    id v17 = (SFEntitledAssetConfig *)v12;
    goto LABEL_11;
  }

  v18 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v53 = "+[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Use currently installed asset.", buf, 0xCu);
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  objc_msgSend(v19, "switchToNewAssetsForAssetType:", objc_msgSend(v12, "assetType"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  id v47 = 0LL;
  id v15 = (id)objc_claimAutoreleasedReturnValue( [v20 installedQuasarModelPathForAssetConfig:v12 error:&v47 triggerDownload:0 ignoreSpellingModel:1]);
  id v21 = v47;

  if (v15)
  {
    id v17 = (SFEntitledAssetConfig *)v12;
    id v16 = v21;
LABEL_11:
    id v43 = v16;
    if (a7) {
      *a7 = v15;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:@"mini.json"]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:@"ncs"]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:@"en_US_napg.json"]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:@"vocdelta.voc"]);
    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:@"pg.voc"]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:@"mrec.psh"]);
    LOBYTE(v39) = a6;
    id v30 = -[_EARUserProfile initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:]( objc_alloc(&OBJC_CLASS____EARUserProfile),  "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:",  v24,  v45,  v44,  v26,  v27,  v28,  v29,  v39);
    __int128 v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }

    else if (a8)
    {
      uint64_t v40 = kAFAssistantErrorDomain;
      NSErrorUserInfoKey v48 = NSLocalizedFailureReasonErrorKey;
      __int128 v49 = @"Error during _EARUserProfile initialization";
      id v41 = v13;
      NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v40,  600LL,  v33));

      id v13 = v41;
    }

    id v16 = v43;
LABEL_18:

    unsigned __int8 v34 = v16;
    id v35 = v31;
    goto LABEL_19;
  }

  id v17 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v45,  3LL);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  objc_msgSend(v22, "switchToNewAssetsForAssetType:", -[SFEntitledAssetConfig assetType](v17, "assetType"));

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  id v46 = v21;
  id v15 = (id)objc_claimAutoreleasedReturnValue( [v23 installedQuasarModelPathForAssetConfig:v17 error:&v46 triggerDownload:0 ignoreSpellingModel:1]);
  id v16 = v46;

  if (v15) {
    goto LABEL_11;
  }
  if (!a8)
  {
    id v35 = 0LL;
    unsigned __int8 v34 = v16;
    goto LABEL_19;
  }

  uint64_t v37 = kAFAssistantErrorDomain;
  if (v16)
  {
    NSErrorUserInfoKey v50 = NSUnderlyingErrorKey;
    id v51 = v16;
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
  }

  else
  {
    id v15 = 0LL;
  }

  id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v37,  600LL,  v15));
  __int128 v31 = 0LL;
  unsigned __int8 v34 = 0LL;
  id v35 = 0LL;
  *a8 = v38;
  if (v16) {
    goto LABEL_18;
  }
LABEL_19:

  return v35;
}

+ (void)_addUserData:(id)a3 toSpeechProfile:(id)a4 addedCategoriesOut:(id)a5
{
  id v21 = a3;
  id v7 = a4;
  id v8 = a5;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v21 groupNameWords]);
  id v10 = [v9 count];

  if (v10)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v21 groupNameWords]);
    +[ESSpeechProfileBuilderConnection _addContactWords:toSpeechProfile:forSpeechCategory:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "_addContactWords:toSpeechProfile:forSpeechCategory:",  v11,  v7,  @"\\NT-appcontact");

    [v8 addObject:@"\\NT-appcontact"];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v21 firstPartyContactWords]);
  id v13 = [v12 count];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v21 firstPartyContactWords]);
    +[ESSpeechProfileBuilderConnection _addContactWords:toSpeechProfile:forSpeechCategory:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "_addContactWords:toSpeechProfile:forSpeechCategory:",  v14,  v7,  @"\\NT-contact");

    [v8 addObject:@"\\NT-contact"];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v21 thirdPartyContactWords]);
  id v16 = [v15 count];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v21 thirdPartyContactWords]);
    +[ESSpeechProfileBuilderConnection _addContactWords:toSpeechProfile:forSpeechCategory:]( &OBJC_CLASS___ESSpeechProfileBuilderConnection,  "_addContactWords:toSpeechProfile:forSpeechCategory:",  v17,  v7,  @"\\NT-appcontact");

    [v8 addObject:@"\\NT-appcontact"];
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v21 vocabularyWords]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000C100;
  v22[3] = &unk_100040A30;
  id v23 = v8;
  id v24 = v7;
  id v19 = v7;
  id v20 = v8;
  [v18 enumerateKeysAndObjectsUsingBlock:v22];
}

+ (void)_addContactWords:(id)a3 toSpeechProfile:(id)a4 forSpeechCategory:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v24 = a5;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v23 = *(void *)v33;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        __int128 v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 components]);
        id v14 = [v13 mutableCopy];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"\\contact-first-phonetic"]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"\\contact-last-phonetic"]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"\\contact-middle-phonetic"]);
        if (v15) {
          [v14 removeObjectForKey:@"\\contact-first-phonetic"];
        }
        if (v16) {
          [v14 removeObjectForKey:@"\\contact-last-phonetic"];
        }
        if (v17) {
          [v14 removeObjectForKey:@"\\contact-middle-phonetic"];
        }
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10000BFEC;
        v26[3] = &unk_100040A58;
        id v27 = v15;
        id v28 = v16;
        id v29 = v17;
        id v30 = v11;
        id v31 = v12;
        id v18 = v15;
        id v19 = v16;
        id v20 = v17;
        id v21 = v12;
        [v14 enumerateKeysAndObjectsUsingBlock:v26];
        [v25 addWordWithParts:v21 templateName:v24];

        id v10 = (char *)v10 + 1;
      }

      while (v9 != v10);
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v9);
  }
}

@end