LABEL_12:
  if ([v7 compare:v5] == (id)-1) {
    v8 = 0LL;
  }
  else {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartInDateRangeFrom:to:",  v5,  v7));
  }
LABEL_15:

  return v8;
}
}

LABEL_22:
}

void sub_26E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:]( &OBJC_CLASS____DKQuery,  "predicateForObjectsWithMetadataKey:andStringValue:",  a2,  a3));
  if (v4)
  {
    v5 = v4;
    [*(id *)(a1 + 32) addObject:v4];
    v4 = v5;
  }
}

id sub_2BF4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier type](&OBJC_CLASS____DKAnyStringIdentifier, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:valueType:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:valueType:",  v2,  v3));

  return v4;
}

void sub_2C60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ error. %@",  v8,  v9));

    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_7834();
    }
    id v11 = [[SACommandFailed alloc] initWithReason:v10];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
  }

  else
  {
    id v10 = v5;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0 && [v10 count])
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v10 = v10;
      id v14 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v14)
      {
        id v15 = v14;
        id v44 = v5;
        uint64_t v45 = *(void *)v48;
        while (2)
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v48 != v45) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
            uint64_t v18 = objc_opt_class(&OBJC_CLASS____DKEvent);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0
              || (v19 = (void *)objc_claimAutoreleasedReturnValue([v17 value]),
                  uint64_t v20 = objc_opt_class(&OBJC_CLASS____DKIdentifier),
                  char isKindOfClass = objc_opt_isKindOfClass(v19, v20),
                  v19,
                  (isKindOfClass & 1) == 0))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not create activity from stored value: %@",  v17));
              if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
                sub_7834();
              }
              id v31 = [[SACommandFailed alloc] initWithReason:v30];
              v32 = (void *)objc_claimAutoreleasedReturnValue([v31 dictionary]);

              id v5 = v44;
              goto LABEL_21;
            }

            v22 = (void *)objc_claimAutoreleasedReturnValue([v17 value]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);

            v24 = (void *)objc_claimAutoreleasedReturnValue(+[SAActivityObject activityObject](&OBJC_CLASS___SAActivityObject, "activityObject"));
            v25 = (void *)objc_claimAutoreleasedReturnValue([v17 stream]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 name]);
            [v24 setStreamType:v26];

            [v24 setType:v23];
            v27 = (void *)objc_claimAutoreleasedReturnValue([v17 startDate]);
            [v24 setStartDate:v27];

            v28 = (void *)objc_claimAutoreleasedReturnValue([v17 endDate]);
            [v24 setEndDate:v28];

            v29 = (void *)objc_claimAutoreleasedReturnValue([v17 metadata]);
            [v24 setMetadata:v29];

            [v46 addObject:v24];
          }

          id v15 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
          id v5 = v44;
          if (v15) {
            continue;
          }
          break;
        }
      }

LABEL_21:
      v33 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]_block_invoke";
        __int16 v53 = 2112;
        v54 = v46;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%s activities retrieved: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 40) setActivities:v46];
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dictionary]);
    }

    else
    {
      [*(id *)(a1 + 40) setActivities:&__NSArray0__struct];
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dictionary]);
    }
  }

  uint64_t v34 = *(void *)(a1 + 48);
  if (v34)
  {
    if (!v12)
    {
      v35 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
        sub_77B0(v35, v36, v37, v38, v39, v40, v41, v42);
      }
      id v43 = [[SACommandFailed alloc] initWithReason:@"FATAL: Response not constructed!"];
      v12 = (void *)objc_claimAutoreleasedReturnValue([v43 dictionary]);

      uint64_t v34 = *(void *)(a1 + 48);
    }

    (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v12);
  }
}

void sub_3138( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_4:
}
}

LABEL_18:
  return result;
}

void sub_44A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ error. %@", v7, v8));

    id v10 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = [[SACommandFailed alloc] initWithReason:v9];
LABEL_15:
      v17 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionary]);
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v19);

LABEL_16:
    }
  }

  else
  {
    id v9 = v5;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0 && [v9 count])
    {
      id v14 = (void *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v14;
        *(_DWORD *)buf = 136315394;
        v25 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
        __int16 v26 = 2048;
        id v27 = [v9 count];
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%s asking CoreDuet to remove %zd intents", buf, 0x16u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_4790;
      v20[3] = &unk_C3F8;
      v16 = *(void **)(a1 + 40);
      id v21 = *(id *)(a1 + 32);
      id v23 = *(id *)(a1 + 48);
      id v9 = v9;
      id v22 = v9;
      [v16 deleteObjects:v9 responseQueue:0 withCompletion:v20];

      v17 = v21;
      goto LABEL_16;
    }

    uint64_t v18 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%s no activities to delete. Returning success", buf, 0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
      goto LABEL_15;
    }
  }
}

void sub_4790(void *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ error. %@",  v12,  v13));

    id v14 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    uint64_t v15 = a1[6];
    if (!v15) {
      goto LABEL_11;
    }
    id v11 = [[SACommandFailed alloc] initWithReason:v10];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }

  uint64_t v7 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)a1[5];
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%s the following activities were deleted successfully: %@",  buf,  0x16u);
  }

  uint64_t v9 = a1[6];
  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 dictionary]);
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
    goto LABEL_10;
  }

void sub_51E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = v5;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && [v8 count])
    {
      id v10 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        id v14 = "-[ASRecordActivity deleteActivitiesOlderThanDays:withCompletion:]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s activities to delete: %@", (uint8_t *)&v13, 0x16u);
      }

      if ([v8 count])
      {
        [*(id *)(a1 + 32) deleteObjects:v8 responseQueue:0 withCompletion:*(void *)(a1 + 40)];
LABEL_16:

        goto LABEL_17;
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (!v12) {
        goto LABEL_16;
      }
    }

    else
    {
      id v11 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        id v14 = "-[ASRecordActivity deleteActivitiesOlderThanDays:withCompletion:]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v12 = *(void *)(a1 + 40);
    }

    (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1LL, 0LL);
    goto LABEL_16;
  }

  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
    sub_7A28();
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0LL, v6);
  }
LABEL_17:
}

void sub_555C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_7A94();
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0LL, v6);
    }
  }

  else
  {
    id v8 = v5;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && [v8 count])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_57C0;
      v14[3] = &unk_C470;
      id v15 = *(id *)(a1 + 32);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 indexesOfObjectsPassingTest:v14]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectsAtIndexes:v10]);
      uint64_t v12 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[ASRecordActivity deleteOlderSessionActivities:withCompletion:]_block_invoke_2";
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s activities to delete: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 40) deleteObjects:v11 responseQueue:0 withCompletion:*(void *)(a1 + 48)];
    }

    else
    {
      int v13 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[ASRecordActivity deleteOlderSessionActivities:withCompletion:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }
}

uint64_t sub_57C0(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 metadata]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"sessionId"]);

  if ([v4 length]) {
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)] ^ 1;
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

void sub_5A70(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v12 = 136315394;
    int v13 = "-[ASRecordActivity recordActivityWithCompletion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s activities deleted -> %@", (uint8_t *)&v12, 0x16u);
  }

  id v8 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = v8;
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 activity]);
    int v12 = 136315394;
    int v13 = "-[ASRecordActivity recordActivityWithCompletion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s recording %@", (uint8_t *)&v12, 0x16u);
  }

  [*(id *)(a1 + 32) _recordActivityWithCompletion:*(void *)(a1 + 40)];
}

LABEL_9:
}

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet stateOrProvince](self, "stateOrProvince"));

  if (v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet city](self, "city"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, CNPostalAddressStateKey);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet city](self, "city"));

  if (v13)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet city](self, "city"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, CNPostalAddressCityKey);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet stateOrProvince](self, "stateOrProvince"));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet stateOrProvince](self, "stateOrProvince"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v16, CNPostalAddressStateKey);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet postalCode](self, "postalCode"));

  if (v17)
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet postalCode](self, "postalCode"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, CNPostalAddressPostalCodeKey);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet country](self, "country"));

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet country](self, "country"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v20, CNPostalAddressCountryKey);
  }

  return v3;
}

void sub_5DBC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0)
  {
    uint64_t v7 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[ASRecordActivity _recordActivityWithCompletion:]_block_invoke";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s success -> YES", (uint8_t *)&v12, 0xCu);
    }

    id v8 = (__CFString *)objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dictionary](v8, "dictionary"));
  }

  else
  {
    if (v5) {
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    }
    else {
      id v8 = @"can't record event";
    }
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_7B84();
    }
    id v10 = [[SACommandFailed alloc] initWithReason:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }
}

LABEL_13:
  return v5;
}

void sub_6614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _fetchUserActivityForUUID:a2 withCompletion:*(void *)(a1 + 40)];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error getting current user activity Error: %@",  a4));
    id v6 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[ASFetchUserActivity fetchUserActivityWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      int v13 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    if (*(void *)(a1 + 40))
    {
      id v7 = [[SACommandFailed alloc] initWithReason:v5];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionary]);
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void sub_689C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      sub_7CF4();
    }
    id v7 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedFailureReason]);
    id v9 = [v7 initWithReason:v8];
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 clientUserActivity]);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void sub_69CC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  id v2 = (void *)qword_12BF8;
  qword_12BF8 = v1;
}

void sub_6A38(id a1)
{
  uint64_t v1 = AFSharedResourcesDirectory(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"Library/Assistant"]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DKKnowledgeStorage storageWithDirectory:readOnly:localOnly:]( &OBJC_CLASS____DKKnowledgeStorage,  "storageWithDirectory:readOnly:localOnly:",  v5,  0LL,  1LL));
  v4 = (void *)qword_12C08;
  qword_12C08 = v3;
}

BOOL sub_748C(id a1, NSString *a2, id a3, BOOL *a4)
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  return v5 == v4;
}

void sub_7744()
{
}

void sub_77B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7834()
{
}

void sub_78A0(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[ASDonateSiriQueryToPortrait performWithCompletion:]";
  __int16 v3 = 2112;
  uint64_t v4 = @"Not supported on this platform";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v1, 0x16u);
}

void sub_7934(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  __int16 v3 = "-[ASStartNavigation startNavigationWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_79BC()
{
}

void sub_7A28()
{
}

void sub_7A94()
{
}

void sub_7B00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7B84()
{
}

void sub_7BF0(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[ASDonateRankedQueriesToPortrait performWithCompletion:]";
  __int16 v3 = 2112;
  uint64_t v4 = @"Not supported on this platform";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v1, 0x16u);
}

void sub_7C84()
{
}

void sub_7CF4()
{
}

void sub_7D64(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ASRecordLocationActivity recordLocationActivityWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_7DEC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[ASRecordLocationActivity recordLocationActivityWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_withValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withValue:");
}