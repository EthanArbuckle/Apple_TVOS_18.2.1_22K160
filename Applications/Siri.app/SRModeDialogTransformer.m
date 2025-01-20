@interface SRModeDialogTransformer
+ (BOOL)_alwaysPrintSiriResponse;
+ (BOOL)_shouldTransformLegacyAddViews;
+ (BOOL)supportsTransformationForAceCommand:(id)a3;
+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4;
+ (id)_analytics;
+ (id)_configurationDictionary;
+ (id)_firstSnippetInViews:(id)a3;
+ (id)_instrumentation;
+ (id)_redundantDUCIds;
+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_sayItForDialog:(id)a3;
+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4;
+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5;
+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4;
+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4;
+ (unint64_t)_typeOfAddViews:(id)a3;
+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4;
@end

@implementation SRModeDialogTransformer

+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v7 = a3;
  [a1 _logModeComputationForAceCommand:v7 mode:a4];
  id v8 = [a1 _typeOfAddViews:v7];
  if (v8 == (id)2)
  {
    v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C8E8(v13, v7);
    }
    id v4 = [v7 copy];
    [v4 setViews:&__NSArray0__struct];
  }

  else
  {
    if (v8 == (id)1)
    {
      v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
        int v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s #modes Found dialog AddViews (aceId = %@)",  (uint8_t *)&v18,  0x16u);
      }

      uint64_t v12 = objc_claimAutoreleasedReturnValue([a1 _transformDialogAddViews:v7 forMode:a4]);
      goto LABEL_13;
    }

    if (!v8)
    {
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
        int v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #modes Found legacy AddViews (aceId = %@)",  (uint8_t *)&v18,  0x16u);
      }

      uint64_t v12 = objc_claimAutoreleasedReturnValue([a1 _transformLegacyAddViews:v7 forMode:a4]);
LABEL_13:
      id v4 = (id)v12;
    }
  }

  return v4;
}

+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  [a1 _logModeComputationForAceCommand:v6 mode:a4];
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dialogs]);
    *(_DWORD *)buf = 136315650;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    __int16 v40 = 2112;
    v41 = v9;
    __int16 v42 = 2048;
    id v43 = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #modes AddDialogs (aceId = %@) contains %lu dialogs",  buf,  0x20u);
  }

  v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v12 = [a1 _alwaysPrintSiriResponse];
  if (v12)
  {
    v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #modes alwaysPrintSiriResponse = YES",  buf,  0xCu);
    }
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogs", v6));
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ((v12 | [v19 spokenOnly] ^ 1) == 1)
        {
          __int16 v20 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _utteranceViewForDialog:v19 mode:a4 printedOnly:1]);
          -[NSMutableArray addObject:](v33, "addObject:", v21);

          v11 = v20;
        }

        unsigned __int8 v22 = [v19 printedOnly];
        if (a4 <= 1 && (v22 & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _sayItForDialog:v19]);
          -[NSMutableArray addObject:](v11, "addObject:", v23);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }

    while (v16);
  }

  v24 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v32 aceId]);
    id v27 = -[NSMutableArray count](v33, "count");
    id v28 = -[NSMutableArray count](v11, "count");
    *(_DWORD *)buf = 136315906;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    __int16 v40 = 2112;
    v41 = v26;
    __int16 v42 = 2048;
    id v43 = v27;
    __int16 v44 = 2048;
    id v45 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #modes AddDialogs (aceId = %@) transformed into %lu utterance views and %lu sayIts.",  buf,  0x2Au);
  }

  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](v33, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([a1 _addViewsForAddDialogs:v32 views:v33]);
    -[NSMutableArray addObject:](v29, "addObject:", v30);
  }

  if (-[NSMutableArray count](v11, "count")) {
    -[NSMutableArray addObjectsFromArray:](v29, "addObjectsFromArray:", v11);
  }

  return v29;
}

+ (BOOL)supportsTransformationForAceCommand:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAUIAddViews, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    char isKindOfClass = 1;
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___SAUIAddDialogs, v6);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v8);
  }

  return isKindOfClass & 1;
}

+ (unint64_t)_typeOfAddViews:(id)a3
{
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v7 = v5;
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v4);
        }
        unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView, v6);
        v8 |= objc_opt_isKindOfClass(v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 dialog]);
        LODWORD(v12) = v14 != 0LL;

        v9 |= v12;
      }

      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);

    if ((v8 & v9 & 1) != 0) {
      unint64_t v15 = 2LL;
    }
    else {
      unint64_t v15 = v9 & 1;
    }
  }

  else
  {

    unint64_t v15 = 0LL;
  }

  return v15;
}

+ (BOOL)_shouldTransformLegacyAddViews
{
  return 0;
}

+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    if (![a1 _alwaysPrintSiriResponse])
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _removeUtteranceViewsFromAddViews:v6 forMode:a4]);
      goto LABEL_7;
    }

    id v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #modes alwaysPrintSiriResponse = YES",  (uint8_t *)&v13,  0xCu);
    }

+ (id)_configurationDictionary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000473F4;
  block[3] = &unk_1000BADA0;
  block[4] = a1;
  if (qword_1000D9B58 != -1) {
    dispatch_once(&qword_1000D9B58, block);
  }
  return (id)qword_1000D9B60;
}

+ (id)_redundantDUCIds
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004753C;
  block[3] = &unk_1000BADA0;
  block[4] = a1;
  if (qword_1000D9B68 != -1) {
    dispatch_once(&qword_1000D9B68, block);
  }
  return (id)qword_1000D9B70;
}

+ (BOOL)_alwaysPrintSiriResponse
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrint];

  return v3;
}

+ (id)_firstSnippetInViews:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = a3;
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___SAUISnippet, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 views]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _firstSnippetInViews:v6]);

  if (v7)
  {
    v30 = v7;
    v32 = (void *)objc_claimAutoreleasedReturnValue([a1 _redundantDUCIds]);
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 views]);
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v9);
          }
          unint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView, v11);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            id v17 = v15;
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 dialogIdentifier]);
            __int128 v19 = (void *)v18;
            __int128 v20 = &stru_1000BC638;
            if (v18) {
              __int128 v20 = (__CFString *)v18;
            }
            v21 = v20;

            unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v21, "lowercaseString"));
            unsigned int v23 = [v32 containsObject:v22];

            if (v23)
            {
              v24 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                v25 = v24;
                id v26 = sub_100013CE0(a4);
                id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                *(_DWORD *)buf = 136315650;
                v38 = "+[SRModeDialogTransformer _removeRedundantUtteranceViewsFromAddViews:forMode:]";
                __int16 v39 = 2112;
                __int16 v40 = v21;
                __int16 v41 = 2112;
                __int16 v42 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing redundant AssistantUtteranceView (%@) for current mode: %@",  buf,  0x20u);
              }
            }

            else
            {
              -[NSMutableArray addObject:](v8, "addObject:", v17);
            }
          }

          else
          {
            -[NSMutableArray addObject:](v8, "addObject:", v15);
          }
        }

        id v12 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }

      while (v12);
    }

    id v28 = [v5 copy];
    [v28 setViews:v8];

    id v7 = v30;
  }

  else
  {
    id v28 = v5;
  }

  return v28;
}

+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v62 = a3;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v62 views]);
  id v4 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v74;
    id v7 = &OBJC_CLASS___SASSystemState_ptr;
    uint64_t v63 = *(void *)v74;
    do
    {
      id v8 = 0LL;
      id v64 = v5;
      do
      {
        if (*(void *)v74 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 speakableText]);

        if (v10)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 speakableText]);
          id v13 = [v12 length];

          if (v13)
          {
            __int128 v14 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v15 = v14;
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 speakableText]);
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 aceId]);
              id v18 = sub_100013CE0(a4);
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v80 = 2112;
              v81 = v16;
              __int16 v82 = 2112;
              v83 = v17;
              __int16 v84 = 2112;
              v85 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing speakableText '%@' from view %@ for current mode: %@",  buf,  0x2Au);
            }
          }

          [v9 setSpeakableText:0];
        }

        objc_opt_class(v7[16], v11);
        if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
        {
          id v21 = v9;
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableSuffix]);
          id v23 = [v22 length];

          if (v23)
          {
            v24 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableSuffix]);
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v21 aceId]);
              id v28 = sub_100013CE0(a4);
              v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v80 = 2112;
              v81 = v26;
              __int16 v82 = 2112;
              v83 = v27;
              __int16 v84 = 2112;
              v85 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing speakableSuffix '%@' from SAUIDisambiguationList %@ for current mode: %@",  buf,  0x2Au);
            }
          }

          [v21 setSpeakableSuffix:0];
          v30 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableDelimiter]);
          id v31 = [v30 length];

          if (v31)
          {
            v32 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v33 = v32;
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableDelimiter]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v21 aceId]);
              id v36 = sub_100013CE0(a4);
              __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v80 = 2112;
              v81 = v34;
              __int16 v82 = 2112;
              v83 = v35;
              __int16 v84 = 2112;
              v85 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing speakableDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@",  buf,  0x2Au);
            }
          }

          v67 = v8;
          [v21 setSpeakableDelimiter:0];
          v38 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableFinalDelimiter]);
          id v39 = [v38 length];

          if (v39)
          {
            __int16 v40 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v41 = v40;
              __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableFinalDelimiter]);
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v21 aceId]);
              id v44 = sub_100013CE0(a4);
              id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v80 = 2112;
              v81 = v42;
              __int16 v82 = 2112;
              v83 = v43;
              __int16 v84 = 2112;
              v85 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing speakableFinalDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@",  buf,  0x2Au);
            }
          }

          [v21 setSpeakableFinalDelimiter:0];
          v66 = v21;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v21 items]);
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          id v47 = [v46 countByEnumeratingWithState:&v69 objects:v77 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v70;
            do
            {
              for (i = 0LL; i != v48; i = (char *)i + 1)
              {
                if (*(void *)v70 != v49) {
                  objc_enumerationMutation(v46);
                }
                v51 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
                v52 = (void *)objc_claimAutoreleasedReturnValue([v51 speakableText]);
                id v53 = [v52 length];

                if (v53)
                {
                  v54 = (void *)AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    v55 = v54;
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v51 speakableText]);
                    v57 = (void *)objc_claimAutoreleasedReturnValue([v51 aceId]);
                    id v58 = sub_100013CE0(a4);
                    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
                    *(_DWORD *)buf = 136315906;
                    v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
                    __int16 v80 = 2112;
                    v81 = v56;
                    __int16 v82 = 2112;
                    v83 = v57;
                    __int16 v84 = 2112;
                    v85 = v59;
                    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing speakableText '%@' from SAUIListItem %@ for current mode: %@",  buf,  0x2Au);
                  }
                }

                [v51 setSpeakableText:0];
              }

              id v48 = [v46 countByEnumeratingWithState:&v69 objects:v77 count:16];
            }

            while (v48);
          }

          [v66 setItems:v46];

          uint64_t v6 = v63;
          id v5 = v64;
          id v7 = &OBJC_CLASS___SASSystemState_ptr;
          id v8 = v67;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v8 != v5);
      id v5 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
    }

    while (v5);
  }

  id v60 = [v62 copy];
  [v60 setViews:obj];

  return v60;
}

+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 views]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 _firstSnippetInViews:v6]);
  id v8 = (void *)v7;
  if (v7)
  {
    id v43 = a1;
    id v45 = (void *)v7;
    id v47 = v5;
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    v46 = v6;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = *(void *)v52;
      uint64_t v16 = 1LL;
      id v17 = &OBJC_CLASS___SASSystemState_ptr;
      id v48 = v10;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v11);
          }
          __int128 v19 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          objc_opt_class(v17[10], v13);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          {
            id v21 = v19;
            unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableText]);

            if (v22)
            {
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableText]);
              -[NSMutableArray addObject:](v9, "addObject:", v23);

              uint64_t v16 = v16 & [v21 canUseServerTTS];
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dialogIdentifier", v43));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v21 dialogIdentifier]);
              -[NSMutableArray addObject:](v50, "addObject:", v25);
            }

            id v26 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = v26;
              id v28 = v9;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v21 dialogIdentifier]);
              id v30 = sub_100013CE0(a4);
              id v31 = v14;
              uint64_t v32 = v15;
              uint64_t v33 = v16;
              id v34 = v11;
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v30);
              *(_DWORD *)buf = 136315650;
              v56 = "+[SRModeDialogTransformer _removeUtteranceViewsFromAddViews:forMode:]";
              __int16 v57 = 2112;
              id v58 = v29;
              __int16 v59 = 2112;
              id v60 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing AssistantUtteranceView (%@) for current mode: %@",  buf,  0x20u);

              id v11 = v34;
              uint64_t v16 = v33;
              uint64_t v15 = v32;
              id v14 = v31;

              uint64_t v9 = v28;
              id v10 = v48;
              id v17 = &OBJC_CLASS___SASSystemState_ptr;
            }
          }

          else
          {
            -[NSMutableArray addObject:](v10, "addObject:", v19);
          }
        }

        id v14 = [v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }

      while (v14);
    }

    else
    {
      LOBYTE(v16) = 1;
    }

    id v8 = v45;
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v45 speakableText]);

    id v5 = v47;
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v45 speakableText]);
      -[NSMutableArray addObject:](v9, "addObject:", v38);
    }

    uint64_t v6 = v46;
    if (-[NSMutableArray count](v9, "count", v43))
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v9, "componentsJoinedByString:", @"\n"));
      [v45 setSpeakableText:v39];
      [v45 setCanUseServerTTS:v16 & 1];
    }

    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v44 _instrumentation]);
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v45 aceId]);
    [v40 setDialogIdentifiers:v50 forAceViewSpeakableTextWithIdentifier:v41];

    id v36 = [v47 copy];
    [v36 setViews:v10];
  }

  else
  {
    id v36 = v5;
  }

  return v36;
}

+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v34 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 views]);
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v39;
    __int128 v35 = v8;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dialog]);
        if (!v14)
        {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
          goto LABEL_16;
        }

        if ([a1 _alwaysPrintSiriResponse])
        {
          uint64_t v16 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v44 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s #modes alwaysPrintSiriResponse = YES",  buf,  0xCu);
          }

          id v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_utteranceViewForDialog:mode:printedOnly:",  v14,  a4,  objc_msgSend(v14, "printedOnly")));
          v48[0] = v17;
          v48[1] = v13;
          id v18 = v48;
          goto LABEL_15;
        }

        objc_opt_class(&OBJC_CLASS___SAUIButton, v15);
        if ((objc_opt_isKindOfClass(v13, v19) & 1) != 0
          || (objc_opt_class(&OBJC_CLASS___SAUIConfirmationView, v20), (objc_opt_isKindOfClass(v13, v21) & 1) != 0))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:0]);
          v47[0] = v17;
          v47[1] = v13;
          id v18 = v47;
LABEL_15:
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
          -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v22);

          goto LABEL_16;
        }

        if (a4 < 2)
        {
          if ([v14 printedOnly])
          {
            id v23 = v13;
            v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:1]);
            -[NSMutableArray addObject:](v7, "addObject:", v24);
          }

          else
          {
            id v23 = [v13 copy];
            id v28 = (void *)objc_claimAutoreleasedReturnValue([a1 _speakableTextForDialog:v14 mode:a4]);
            [v23 setSpeakableText:v28];

            __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([a1 _instrumentation]);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 dialogIdentifier]);
            __int16 v42 = v36;
            v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v42,  1LL));
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v23 aceId]);
            [v37 setDialogIdentifiers:v29 forAceViewSpeakableTextWithIdentifier:v30];

            id v8 = v35;
          }

          goto LABEL_30;
        }

        if (a4 == 2)
        {
          if ([v14 spokenOnly])
          {
            v25 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = v25;
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 dialogIdentifier]);
              *(_DWORD *)buf = 136315394;
              id v44 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
              __int16 v45 = 2112;
              v46 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s #modes IGNORING Dialog (%@) for Silent Mode since it is Spoken Only",  buf,  0x16u);

              id v8 = v35;
              goto LABEL_28;
            }
          }

          else
          {
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _utteranceViewForDialog:v14 mode:2 printedOnly:0]);
            -[NSMutableArray addObject:](v7, "addObject:", v26);
LABEL_28:
          }

          id v23 = v13;
          goto LABEL_30;
        }

        id v23 = 0LL;
LABEL_30:
        -[NSMutableArray addObject:](v7, "addObject:", v23);

LABEL_16:
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v31 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
      id v10 = v31;
    }

    while (v31);
  }

  id v32 = [v34 copy];
  [v32 setViews:v7];

  return v32;
}

+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogIdentifier]);
    id v12 = sub_100013CE0(a4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v52 = 136315650;
    __int128 v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    __int16 v54 = 2112;
    v55 = v11;
    __int16 v56 = 2112;
    __int16 v57 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming Dialog (%@) into an Utterance View for current mode: %@",  (uint8_t *)&v52,  0x20u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___SAUIAssistantUtteranceView);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 aceId]);
  [v14 setAceId:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  [v14 setRefId:v16];

  objc_msgSend(v14, "setCanUseServerTTS:", objc_msgSend(v8, "canUseServerTTS"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);
  [v14 setContext:v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogIdentifier]);
  [v14 setDialogIdentifier:v19];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 metricsContext]);
  [v14 setMetricsContext:v20];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](&OBJC_CLASS___AFAccessibilityObserver, "sharedObserver"));
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 state]);
  id v23 = [v22 isVoiceOverTouchEnabled];

  if (a4 != 2 || v23 != (id)2)
  {
    if (v5)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
      id v27 = (id)objc_claimAutoreleasedReturnValue([v28 text]);

      v29 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        id v37 = 0LL;
        goto LABEL_31;
      }

      id v30 = v29;
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogIdentifier]);
      int v52 = 136315394;
      __int128 v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
      __int16 v54 = 2112;
      v55 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming Dialog (%@) when printedOnly is true",  (uint8_t *)&v52,  0x16u);
LABEL_26:

      goto LABEL_27;
    }

    if (a4)
    {
      if (a4 != 1)
      {
        if (a4 != 2)
        {
          id v37 = 0LL;
          id v27 = 0LL;
          goto LABEL_31;
        }

        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 caption]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s text](v30, "text"));
        id v31 = v32;
        if (v32)
        {
          id v27 = v32;
        }

        else
        {
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
          id v27 = (id)objc_claimAutoreleasedReturnValue([v49 text]);
        }

        goto LABEL_26;
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue([v8 caption]);
      id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 text]);
      id v48 = v47;
      if (v47)
      {
        id v27 = v47;
      }

      else
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
        id v27 = (id)objc_claimAutoreleasedReturnValue([v50 text]);
      }

      id v43 = a1;
      id v44 = v8;
      uint64_t v45 = 1LL;
    }

    else
    {
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
      id v27 = (id)objc_claimAutoreleasedReturnValue([v42 text]);

      id v43 = a1;
      id v44 = v8;
      uint64_t v45 = 0LL;
    }

    id v37 = (id)objc_claimAutoreleasedReturnValue([v43 _speakableTextForDialog:v44 mode:v45]);
    goto LABEL_31;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 caption]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 text]);
  id v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }

  else
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
    id v27 = (id)objc_claimAutoreleasedReturnValue([v33 text]);
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 speakableTextOverride]);
  id v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }

  else
  {
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
    id v37 = (id)objc_claimAutoreleasedReturnValue([v38 text]);
  }

  __int128 v39 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v40 = v39;
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogIdentifier]);
    int v52 = 136315394;
    __int128 v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    __int16 v54 = 2112;
    v55 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Over",  (uint8_t *)&v52,  0x16u);
  }

+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](&OBJC_CLASS___AFAccessibilityObserver, "sharedObserver"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
  id v8 = [v7 isVoiceOverTouchEnabled];

  switch(a4)
  {
    case 0uLL:
      id v12 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v12;
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogIdentifier]);
        *(_DWORD *)id v27 = 136315394;
        *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v14;
        uint64_t v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Mode";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, v27, 0x16u);
      }

+ (id)_sayItForDialog:(id)a3
{
  id v3 = a3;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dialogIdentifier]);
    int v23 = 136315394;
    v24 = "+[SRModeDialogTransformer _sayItForDialog:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming Dialog (%@) into a SayIt",  (uint8_t *)&v23,  0x16u);
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SAUISayIt);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 aceId]);
  -[SAUISayIt setAceId:](v7, "setAceId:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 refId]);
  -[SAUISayIt setRefId:](v7, "setRefId:", v9);

  -[SAUISayIt setCanUseServerTTS:](v7, "setCanUseServerTTS:", [v3 canUseServerTTS]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
  -[SAUISayIt setContext:](v7, "setContext:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 dialogIdentifier]);
  -[SAUISayIt setDialogIdentifier:](v7, "setDialogIdentifier:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 gender]);
  -[SAUISayIt setGender:](v7, "setGender:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 languageCode]);
  -[SAUISayIt setLanguageCode:](v7, "setLanguageCode:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 content]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 speakableTextOverride]);
  if (v18)
  {
    -[SAUISayIt setMessage:](v7, "setMessage:", v18);
  }

  else
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v3 content]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 text]);
    -[SAUISayIt setMessage:](v7, "setMessage:", v20);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 metricsContext]);
  -[SAUISayIt setMetricsContext:](v7, "setMetricsContext:", v21);

  return v7;
}

+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
    int v20 = 136315394;
    uint64_t v21 = "+[SRModeDialogTransformer _addViewsForAddDialogs:views:]";
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming AddDialog (aceId = %@) into an AddViews",  (uint8_t *)&v20,  0x16u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
  -[SAUIAddViews setAceId:](v10, "setAceId:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  -[SAUIAddViews setRefId:](v10, "setRefId:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 metricsContext]);
  -[SAUIAddViews setMetricsContext:](v10, "setMetricsContext:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 listenAfterSpeaking]);
  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 listenAfterSpeaking]);
    [v15 setListenAfterSpeaking:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 listenAfterSpeakingBehavior]);
    [v17 setListenAfterSpeakingBehavior:v18];
  }

  -[SAUIAddViews setViews:](v10, "setViews:", v6);

  return v10;
}

+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4
{
  id v13 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
    [v7 setObject:v8 forKey:@"aceId"];

    id v9 = sub_100014244(a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v7 setObject:v10 forKey:@"mode"];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedClassName]);
    [v7 setObject:v11 forKey:@"aceClass"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _analytics]);
    [v12 logEventWithType:5602 context:v7];
  }
}

+ (id)_analytics
{
  return +[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics");
}

+ (id)_instrumentation
{
  return +[SRUIFInstrumentationManager sharedManager](&OBJC_CLASS___SRUIFInstrumentationManager, "sharedManager");
}

@end