@interface TVAirPlayUtilities
+ (BOOL)validateParameters:(id)a3 error:(id *)a4;
+ (BOOL)validateParametersWithPropertyKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (id)_containerWithAbbreviatedData:(id)a3;
+ (id)dataAbbreviatedDescription:(id)a3;
+ (id)errorToDictionary:(id)a3;
+ (id)timedMetadataFromAVTimedMetadata:(id)a3;
@end

@implementation TVAirPlayUtilities

+ (id)errorToDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 code]));
    [v4 setObject:v5 forKeyedSubscript:@"code"];

    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if (v6) {
      [v4 setObject:v6 forKeyedSubscript:@"domain"];
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedFailureReason]);
    if (v8) {
      [v4 setObject:v8 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedRecoverySuggestion]);
    if (v9) {
      [v4 setObject:v9 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)timedMetadataFromAVTimedMetadata:(id)a3
{
  id v3 = a3;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
        if (v10) {
          [v9 setObject:v10 forKeyedSubscript:@"key"];
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 keySpace]);
        if (v11) {
          [v9 setObject:v11 forKeyedSubscript:@"keyspace"];
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([v8 locale]);
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localeIdentifier]);
          if (v14) {
            [v9 setObject:v14 forKeyedSubscript:@"locale"];
          }
        }

        if (v8) {
          [v8 time];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        CFDictionaryRef v15 = CMTimeCopyAsDictionary(&time, kCFAllocatorDefault);
        if (v15)
        {
          CFDictionaryRef v16 = v15;
          [v9 setObject:v15 forKeyedSubscript:@"timestamp"];
          CFRelease(v16);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
        if (v17) {
          [v9 setObject:v17 forKeyedSubscript:@"value"];
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue([v8 extraAttributes]);
        if (v18) {
          [v9 addEntriesFromDictionary:v18];
        }
        [v21 addObject:v9];
      }

      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v5);
  }

  return v21;
}

+ (BOOL)validateParametersWithPropertyKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    id v16 = v8;
    id v17 = v9;
    v11 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    unsigned __int8 v12 = [a1 validateParameters:v11 error:a5];
  }

  else
  {
    id v13 = sub_1000042C0();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "### AirPlay nil property paramters received. key: %{public}@, value: %{public}@",  buf,  0x16u);
    }

    if (!a5)
    {
      unsigned __int8 v12 = 0;
      goto LABEL_9;
    }

    v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError), "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6756LL, 0LL);
    unsigned __int8 v12 = 0;
    *a5 = v11;
  }

LABEL_9:
  return v12;
}

+ (BOOL)validateParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = sub_100018700;
  v22[4] = sub_100018710;
  id v23 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018718;
  block[3] = &unk_1000310E8;
  block[4] = v22;
  if (qword_10003F7B0 != -1) {
    dispatch_once(&qword_10003F7B0, block);
  }
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100018700;
  id v19 = sub_100018710;
  id v20 = 0LL;
  if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    v7 = (void *)v16[5];
    v16[5] = (uint64_t)@"inParams";
  }

  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100018D1C;
    v14[3] = &unk_1000311C0;
    v14[4] = v22;
    v14[5] = &v15;
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
  }

  uint64_t v8 = v16[5];
  if (v8)
  {
    id v9 = sub_1000042C0();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v16[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "### AirPlay bad value for '%{public}@' in params:\n%{public}@",  buf,  0x16u);
    }

    if (a4)
    {
      unsigned __int8 v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError), "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6756LL, 0LL);
      *a4 = v12;
    }
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(v22, 8);
  return v8 == 0;
}

+ (id)dataAbbreviatedDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _containerWithAbbreviatedData:v4]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  }

  return v8;
}

+ (id)_containerWithAbbreviatedData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v19 = v3;
    if ((objc_opt_isKindOfClass(v3, v18) & 1) == 0) {
      goto LABEL_32;
    }
    id v5 = [v3 mutableCopy];
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v20 = v3;
    id v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (!v21) {
      goto LABEL_31;
    }
    id v22 = v21;
    id v33 = v3;
    uint64_t v23 = 0LL;
    uint64_t v24 = *(void *)v36;
LABEL_19:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v24) {
        objc_enumerationMutation(v20);
      }
      __int16 v26 = *(void **)(*((void *)&v35 + 1) + 8 * v25);
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<...> %lu bytes",  [v26 length]));
      }

      else
      {
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v26, v29) & 1) == 0)
        {
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v26, v30) & 1) == 0) {
            goto LABEL_28;
          }
        }

        uint64_t v28 = objc_claimAutoreleasedReturnValue([a1 _containerWithAbbreviatedData:v26]);
      }

      v31 = (void *)v28;
      [v5 setObject:v28 atIndexedSubscript:v23 + v25];

LABEL_28:
      if (v22 == (id)++v25)
      {
        id v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
        v23 += v25;
        if (!v22) {
          goto LABEL_30;
        }
        goto LABEL_19;
      }
    }
  }

  id v5 = [v3 mutableCopy];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v7) {
    goto LABEL_31;
  }
  id v8 = v7;
  id v33 = v3;
  uint64_t v9 = *(void *)v40;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<...> %lu bytes",  [v12 length]));
LABEL_12:
        uint64_t v17 = (void *)v14;
        [v5 setObject:v14 forKeyedSubscript:v11];

        goto LABEL_13;
      }

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0
        || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v12, v16) & 1) != 0))
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([a1 _containerWithAbbreviatedData:v12]);
        goto LABEL_12;
      }

@end