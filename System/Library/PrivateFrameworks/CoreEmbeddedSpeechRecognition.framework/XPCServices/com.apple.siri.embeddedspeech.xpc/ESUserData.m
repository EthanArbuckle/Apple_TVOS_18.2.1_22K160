@interface ESUserData
+ (id)_vocabularyLabelsForFieldType:(unsigned __int16)a3;
+ (void)_addVocabWord:(id)a3 vocabularyLabels:(id)a4 toVocabularyWords:(id)a5;
+ (void)_applyContactLimitsToFirstPartyContacts:(id)a3 thirdPartyContacts:(id)a4 groupNames:(id)a5;
+ (void)_limitVocabularyWords:(id)a3 toApplicableSpeechCategories:(id)a4;
+ (void)_processContactItem:(id)a3 contactWords:(id)a4;
+ (void)_processRadioItem:(id)a3 radioWords:(id)a4;
+ (void)_processVocabularyItem:(id)a3 vocabularyWords:(id)a4;
- (ESUserData)initWithItems:(id)a3 applicableSpeechCategories:(id)a4;
- (NSDictionary)vocabularyWords;
- (NSOrderedSet)firstPartyContactWords;
- (NSOrderedSet)groupNameWords;
- (NSOrderedSet)radioWords;
- (NSOrderedSet)thirdPartyContactWords;
- (void)_populateUserDataFromItems:(id)a3 applicableSpeechCategories:(id)a4;
@end

@implementation ESUserData

- (ESUserData)initWithItems:(id)a3 applicableSpeechCategories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ESUserData;
  v8 = -[ESUserData init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    -[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]( v8,  "_populateUserDataFromItems:applicableSpeechCategories:",  v6,  v7);
    v10 = v9;
  }

  return v9;
}

- (void)_populateUserDataFromItems:(id)a3 applicableSpeechCategories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v33 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v31 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v32 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v29 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 136315650;
    v41 = "-[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]";
    __int16 v42 = 2048;
    id v43 = [v5 count];
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Processing %tu items for speech categories: %@.",  buf,  0x20u);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 content]);
        int v17 = [(id)objc_opt_class(v16) itemType];

        if (v17 <= 61351)
        {
          if (v17 != 19668)
          {
            if (v17 == 49066) {
              goto LABEL_23;
            }
LABEL_15:
            +[ESUserData _processVocabularyItem:vocabularyWords:]( &OBJC_CLASS___ESUserData,  "_processVocabularyItem:vocabularyWords:",  v14,  v34);
            goto LABEL_23;
          }

          goto LABEL_16;
        }

        if (v17 == 61352)
        {
          v18 = v14;
          v19 = v31;
          goto LABEL_22;
        }

        if (v17 != 63369)
        {
          if (v17 != 61509) {
            goto LABEL_15;
          }
LABEL_16:
          v18 = v14;
          v19 = v33;
          goto LABEL_22;
        }

        v18 = v14;
        v19 = v32;
LABEL_22:
        +[ESUserData _processContactItem:contactWords:]( &OBJC_CLASS___ESUserData,  "_processContactItem:contactWords:",  v18,  v19);
LABEL_23:
        objc_autoreleasePoolPop(v15);
      }

      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v11);
  }

  +[ESUserData _limitVocabularyWords:toApplicableSpeechCategories:]( &OBJC_CLASS___ESUserData,  "_limitVocabularyWords:toApplicableSpeechCategories:",  v34,  v6);
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v34, "enumerateKeysAndObjectsUsingBlock:", &stru_100040AB8);
  +[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]( &OBJC_CLASS___ESUserData,  "_applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:",  v33,  v31,  v32);
  firstPartyContactWords = self->_firstPartyContactWords;
  self->_firstPartyContactWords = v33;
  v21 = v33;

  thirdPartyContactWords = self->_thirdPartyContactWords;
  self->_thirdPartyContactWords = v31;
  v23 = v31;

  groupNameWords = self->_groupNameWords;
  self->_groupNameWords = v32;
  v25 = v32;

  radioWords = self->_radioWords;
  self->_radioWords = v29;
  v27 = v29;

  vocabularyWords = self->_vocabularyWords;
  self->_vocabularyWords = v34;
}

- (NSOrderedSet)firstPartyContactWords
{
  return self->_firstPartyContactWords;
}

- (NSOrderedSet)thirdPartyContactWords
{
  return self->_thirdPartyContactWords;
}

- (NSOrderedSet)groupNameWords
{
  return self->_groupNameWords;
}

- (NSDictionary)vocabularyWords
{
  return self->_vocabularyWords;
}

- (NSOrderedSet)radioWords
{
  return self->_radioWords;
}

- (void).cxx_destruct
{
}

+ (void)_limitVocabularyWords:(id)a3 toApplicableSpeechCategories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys", 0));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 speechCategoryName]);
        unsigned __int8 v14 = [v6 containsObject:v13];

        if ((v14 & 1) == 0) {
          [v5 removeObjectForKey:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

+ (void)_processContactItem:(id)a3 contactWords:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 content]);
  id v19 = 0LL;
  unsigned __int8 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  __int128 v16 = sub_10000E22C;
  __int128 v17 = &unk_100040AE0;
  id v9 = v7;
  id v18 = v9;
  [v8 recursivelyEnumerateFieldsWithError:&v19 usingBlock:&v14];
  id v10 = v19;

  LODWORD(v8) = objc_msgSend(v6, "isBoosted", v14, v15, v16, v17);
  id v11 = objc_alloc(&OBJC_CLASS___ESUserDataContactWord);
  if ((_DWORD)v8)
  {
    uint64_t v12 = -[ESUserDataContactWord initWithComponents:frequency:](v11, "initWithComponents:frequency:", v9, 2LL);
    [v5 insertObject:v12 atIndex:0];
  }

  else
  {
    uint64_t v12 = -[ESUserDataContactWord initWithComponents:frequency:](v11, "initWithComponents:frequency:", v9, 1LL);
    [v5 addObject:v12];
  }

  if (v10)
  {
    v13 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[ESUserData _processContactItem:contactWords:]";
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Error enumerating CCItemFields: %@",  buf,  0x16u);
    }
  }
}

+ (void)_applyContactLimitsToFirstPartyContacts:(id)a3 thirdPartyContacts:(id)a4 groupNames:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  if ([v9 count])
  {
    unint64_t v13 = 0LL;
    do
    {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v13]);
      [v11 addObject:v14];

      unint64_t v15 = v13 + 1;
      id v16 = [v9 count];
      if (v13 > 0x62) {
        break;
      }
      ++v13;
    }

    while (v15 < (unint64_t)v16);
    uint64_t v17 = 5000 - v15;
  }

  else
  {
    uint64_t v17 = 5000LL;
  }

  if ([v7 count])
  {
    uint64_t v18 = 0LL;
    while (v17)
    {
      --v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v18]);
      [v10 addObject:v19];
    }

    uint64_t v17 = -1LL;
  }

+ (void)_processRadioItem:(id)a3 radioWords:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 content]);
  id v12 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E1C8;
  v10[3] = &unk_100040AE0;
  id v7 = v5;
  id v11 = v7;
  [v6 recursivelyEnumerateFieldsWithError:&v12 usingBlock:v10];
  id v8 = v12;

  if (v8)
  {
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v14 = "+[ESUserData _processRadioItem:radioWords:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Error enumerating CCItemFields: %@",  buf,  0x16u);
    }
  }
}

+ (void)_processVocabularyItem:(id)a3 vocabularyWords:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 content]);
  id v12 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E044;
  v10[3] = &unk_100040AE0;
  id v7 = v5;
  id v11 = v7;
  [v6 recursivelyEnumerateFieldsWithError:&v12 usingBlock:v10];
  id v8 = v12;
  if (v8)
  {
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v14 = "+[ESUserData _processVocabularyItem:vocabularyWords:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Error enumerating CCItemFields: %@",  buf,  0x16u);
    }
  }
}

+ (void)_addVocabWord:(id)a3 vocabularyLabels:(id)a4 toVocabularyWords:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
      [v11 addObject:v12];
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithObject:",  v12));
      [v9 setObject:v11 forKeyedSubscript:v7];
    }
  }
}

+ (id)_vocabularyLabelsForFieldType:(unsigned __int16)a3
{
  v3 = 0LL;
  if ((int)a3 <= 17040)
  {
    if ((int)a3 <= 7721)
    {
      switch(a3)
      {
        case 0x1E15u:
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-house";
          id v6 = @"\\house-first";
          goto LABEL_63;
        case 0x1E16u:
        case 0x1E1Au:
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-device";
          id v6 = @"\\device-first";
          goto LABEL_63;
        case 0x1E17u:
        case 0x1E1Bu:
        case 0x1E1Du:
          return v3;
        case 0x1E18u:
          goto LABEL_46;
        case 0x1E19u:
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-scene";
          id v6 = @"\\scene-first";
          goto LABEL_63;
        case 0x1E1Cu:
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-group";
          id v6 = @"\\group-first";
          goto LABEL_63;
        case 0x1E1Eu:
          goto LABEL_11;
        default:
          if (a3 == 803)
          {
            v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
            id v5 = @"\\NT-device";
            id v6 = @"\\carName-first";
          }

          else
          {
            if (a3 != 5598) {
              return v3;
            }
            v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
            id v5 = @"\\NT-notefolder";
            id v6 = @"\\notebookFolderTitle-first";
          }

          break;
      }

      goto LABEL_63;
    }

    if ((int)a3 > 14708)
    {
      if ((int)a3 > 16253)
      {
        if (a3 == 16254)
        {
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-payaccount";
          id v6 = @"\\paymentsOrganizationName-first";
          goto LABEL_63;
        }

        if (a3 == 17037)
        {
LABEL_46:
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-room";
          id v6 = @"\\room-first";
          goto LABEL_63;
        }
      }

      else
      {
        if (a3 == 14709)
        {
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-playlist";
          id v6 = @"\\appAudiobookTitle-first";
          goto LABEL_63;
        }

        if (a3 == 15575)
        {
          v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-playlist";
          id v6 = @"\\appShowTitle-first";
          goto LABEL_63;
        }
      }

      return v3;
    }

    if ((int)a3 > 12998)
    {
      if ((a3 - 12999) < 2)
      {
        v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
        id v5 = @"\\NT-appvocab";
        id v6 = @"\\unknown-first";
        goto LABEL_63;
      }

      if (a3 == 13887)
      {
        v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
        id v5 = @"\\NT-phototag";
        id v6 = @"\\photoTags-first";
        goto LABEL_63;
      }

      return v3;
    }

    if (a3 != 7722)
    {
      int v8 = 12013;
      goto LABEL_39;
    }

@end