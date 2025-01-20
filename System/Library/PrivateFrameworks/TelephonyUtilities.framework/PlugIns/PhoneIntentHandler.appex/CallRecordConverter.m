@interface CallRecordConverter
+ (id)sharedInstance;
- (CallRecordConverter)init;
- (NSCache)handleToPersonCache;
- (NSCache)recentCallIdToCallRecordCache;
- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (int64_t)callCapabilityFromRecentCall:(id)a3;
- (int64_t)preferredCallProviderFromRecentCall:(id)a3;
- (void)setHandleToPersonCache:(id)a3;
- (void)setRecentCallIdToCallRecordCache:(id)a3;
@end

@implementation CallRecordConverter

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EDD4;
  block[3] = &unk_100034610;
  block[4] = a1;
  if (qword_10003E5C8 != -1) {
    dispatch_once(&qword_10003E5C8, block);
  }
  return (id)qword_10003E5C0;
}

- (CallRecordConverter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CallRecordConverter;
  v2 = -[CallRecordConverter init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCache);
    recentCallIdToCallRecordCache = v2->_recentCallIdToCallRecordCache;
    v2->_recentCallIdToCallRecordCache = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSCache);
    handleToPersonCache = v2->_handleToPersonCache;
    v2->_handleToPersonCache = v5;
  }

  return v2;
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5
{
  return -[CallRecordConverter callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:]( self,  "callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:",  a3,  a4,  a5,  &__NSArray0__struct);
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  id v10 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CallRecordConverter recentCallIdToCallRecordCache](self, "recentCallIdToCallRecordCache"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueId]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v19]);

        id v21 = IntentHandlerDefaultLog();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v23) {
            sub_100020C5C(&v30, v31, v22);
          }
        }

        else
        {
          if (v23) {
            sub_100020BE8(v36, v17, &v37, v22);
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue( -[CallRecordConverter callRecordForRecentCall:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:]( self,  "callRecordForRecentCall:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:",  v17,  v29,  v28,  v27));
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CallRecordConverter recentCallIdToCallRecordCache]( self,  "recentCallIdToCallRecordCache"));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueId]);
          -[os_log_s setObject:forKey:](v22, "setObject:forKey:", v20, v24);
        }

        [v11 addObject:v20];
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v14);
  }

  id v25 = [v11 copy];
  return v25;
}

- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  id v10 = a3;
  id v54 = a4;
  id v11 = a5;
  id v53 = a6;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v55 = v10;
  v52 = v11;
  if ([v10 callerIdIsBlocked])
  {
    id v12 = IntentHandlerDefaultLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Caller ID is blocked", buf, 2u);
    }

    goto LABEL_35;
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 remoteParticipantHandles]);
  id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v68,  16LL);
  if (v14)
  {
    id v15 = v14;
    v16 = 0LL;
    uint64_t v17 = *(void *)v62;
    v58 = v13;
    while (1)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * (void)i), "tu_tuHandle"));
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CallRecordConverter handleToPersonCache](self, "handleToPersonCache"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v19]);

          uint64_t v22 = objc_opt_class(&OBJC_CLASS___INPerson);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
          {
            id v23 = v21;
            id v24 = v16;
            goto LABEL_25;
          }

          if (v21)
          {
            id v26 = IntentHandlerDefaultLog();
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[WARN] Found an entry of unknown type in handleToPerson cache",  buf,  2u);
            }

            v16 = 0LL;
          }

          else
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 isoCountryCode]);
            if (v28)
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 isoCountryCode]);
              v67 = v29;
              id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v67,  1LL));
            }

            else
            {
              id v24 = v53;
            }

            id v23 = (id)objc_claimAutoreleasedReturnValue( +[INPerson tu_personMatchingHandle:contactsDataSource:isoCountryCodes:]( &OBJC_CLASS___INPerson,  "tu_personMatchingHandle:contactsDataSource:isoCountryCodes:",  v19,  v54,  v24));
            if (v23) {
              id v30 = v23;
            }
            else {
              id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            }
            v31 = v30;
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CallRecordConverter handleToPersonCache](self, "handleToPersonCache"));
            [v32 setObject:v31 forKey:v19];

            id v10 = v55;
LABEL_25:

            if (v23)
            {
              [v56 addObject:v23];
              v16 = v23;
            }

            else
            {
              v16 = 0LL;
            }

            id v13 = v58;
          }

          id v33 = IntentHandlerDefaultLog();
          __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v66 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "person added to particpants in callrecord: %@",  buf,  0xCu);
          }

          goto LABEL_32;
        }

        id v25 = IntentHandlerDefaultLog();
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not determine remoteParticipantHandle for CHRecentCall",  buf,  2u);
        }

- (int64_t)preferredCallProviderFromRecentCall:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 serviceProvider]);
  if ([v3 isEqualToString:kCHServiceProviderFaceTime])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:kCHServiceProviderTelephony])
  {
    int64_t v4 = 1LL;
  }

  else
  {
    id v5 = [v3 length];
    id v6 = IntentHandlerDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100020CD0(v8, v9, v10);
      }
      int64_t v4 = 3LL;
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100020C90(v8);
      }
      int64_t v4 = 0LL;
    }
  }

  return v4;
}

- (int64_t)callCapabilityFromRecentCall:(id)a3
{
  id v3 = [a3 mediaType];
  int64_t v4 = (int64_t)v3;
  if (v3)
  {
    if (v3 == (id)2)
    {
      id v10 = IntentHandlerDefaultLog();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Inferring video call capability from call to redial";
        objc_super v8 = buf;
        goto LABEL_10;
      }
    }

    else
    {
      if (v3 != (id)1) {
        return 0LL;
      }
      id v5 = IntentHandlerDefaultLog();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        v7 = "Inferring audio call capability from call to redial";
        objc_super v8 = (uint8_t *)&v14;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
  }

  else
  {
    id v9 = IntentHandlerDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v7 = "[WARN] Unable to infer callCapability from call to redial because media type of that call was unknown.";
      objc_super v8 = (uint8_t *)&v12;
      goto LABEL_10;
    }
  }

  return v4;
}

- (NSCache)recentCallIdToCallRecordCache
{
  return self->_recentCallIdToCallRecordCache;
}

- (void)setRecentCallIdToCallRecordCache:(id)a3
{
}

- (NSCache)handleToPersonCache
{
  return self->_handleToPersonCache;
}

- (void)setHandleToPersonCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end