@interface AFSiriAnnouncementRequestCapabilityManager
+ (BOOL)_supportsAnnouncementType:(int64_t)a3 forSupportedIntents:(id)a4 forBundleId:(id)a5 onPlatform:(int64_t)a6;
+ (Class)_classForPlatform:(int64_t)a3;
+ (id)_candidateAnnounceNotificationTypesFromApp:(id)a3 withIntentIDs:(id)a4 notificationContentType:(id)a5 onPlatform:(int64_t)a6;
+ (id)_requiredBundleIDsForNotificationAnnouncementType:(int64_t)a3;
+ (id)_requiredPlatformsForNotificationAnnouncementType:(int64_t)a3;
+ (id)supportedAnnouncementTypesForBundleId:(id)a3 onPlatform:(int64_t)a4;
+ (int64_t)notificationAnnouncementTypeForNotificationFromApp:(id)a3 withIntentIDs:(id)a4 notificationContent:(id)a5 onPlatform:(int64_t)a6;
- (AFSiriAnnouncementRequestCapabilityManager)initWithPlatform:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation AFSiriAnnouncementRequestCapabilityManager

- (AFSiriAnnouncementRequestCapabilityManager)initWithPlatform:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AFSiriAnnouncementRequestCapabilityManager;
  v4 = -[AFSiriAnnouncementRequestCapabilityManager init](&v13, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("AFSiriAnnouncementRequestCapabilityManager", 0LL);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v7;

    id v9 = [(id)objc_opt_class(v4) _classForPlatform:a3];
    v4->_platform = (int64_t)[v9 platform];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 provider]);
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v10;

    -[AFAnnouncementRequestCapabilityProviding addDelegate:](v4->_capabilityProvider, "addDelegate:", v4);
  }

  return v4;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3) {
    -[AFAnnouncementRequestCapabilityProviding fetchEligibleAnnouncementRequestTypesWithCompletion:]( self->_capabilityProvider,  "fetchEligibleAnnouncementRequestTypesWithCompletion:");
  }
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3) {
    -[AFAnnouncementRequestCapabilityProviding fetchAvailableAnnouncementRequestTypesWithCompletion:]( self->_capabilityProvider,  "fetchAvailableAnnouncementRequestTypesWithCompletion:");
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FC5C8;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FC584;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 136315394;
    *(void *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:eligibleAnnouncementRequestTypesChanged:]";
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Notifying observers eligible announcement request types changed: %lu",  location,  0x16u);
  }

  objc_initWeak((id *)location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FC458;
  block[3] = &unk_1004FB658;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 136315394;
    *(void *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:availableAnnouncementRequestTypesChanged:]";
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Notifying observers available announcement request types changed: %lu",  location,  0x16u);
  }

  objc_initWeak((id *)location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FC32C;
  block[3] = &unk_1004FB658;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

- (void).cxx_destruct
{
}

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t IsValid = AFSiriAnnouncementPlatformGetIsValid(a3, a2);
  if ((IsValid & 1) != 0)
  {
    if (((1LL << a3) & 0x1A) == 0)
    {
      if (((1LL << a3) & 0x21) == 0)
      {
        id v6 = &off_1004E5568;
        goto LABEL_9;
      }

      dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      int v9 = 136315394;
      uint64_t v10 = "+[AFSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s platform %li is not valid, using headphones provider.",  (uint8_t *)&v9,  0x16u);
    }
  }

  id v6 = &off_1004E5678;
LABEL_9:
  uint64_t v7 = objc_opt_class(*v6);
  uint64_t IsValid = objc_claimAutoreleasedReturnValue(v7);
  return (Class)(id)IsValid;
}

+ (id)supportedAnnouncementTypesForBundleId:(id)a3 onPlatform:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v7, "addObject:", &off_100513810);
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2050000000LL;
  id v8 = (void *)qword_1005785B0;
  uint64_t v27 = qword_1005785B0;
  if (!qword_1005785B0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1002FD2E8;
    v29 = (NSMutableSet *)&unk_1004FDB20;
    v30 = &v24;
    sub_1002FD2E8((uint64_t)buf);
    id v8 = (void *)v25[3];
  }

  int v9 = v8;
  _Block_object_dispose(&v24, 8);
  id v23 = 0LL;
  id v10 = [[v9 alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v23];
  __int16 v11 = (NSMutableSet *)v23;
  if (v11)
  {
    int64_t v12 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v29 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to retrieve LSApplicationRecord for bundle identifier %@: %@",  buf,  0x20u);
    }

    objc_super v13 = v7;
  }

  else
  {
    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x2050000000LL;
    __int16 v14 = (void *)qword_1005785C0;
    uint64_t v27 = qword_1005785C0;
    if (!qword_1005785C0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1002FD484;
      v29 = (NSMutableSet *)&unk_1004FDB20;
      v30 = &v24;
      sub_1002FD484((uint64_t)buf);
      __int16 v14 = (void *)v25[3];
    }

    id v15 = v14;
    _Block_object_dispose(&v24, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v15 appInfoWithApplicationRecord:v10]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v22 supportedIntents]);
    for (uint64_t i = 0LL; i != 8; ++i)
    {
      if ([a1 _supportsAnnouncementType:i forSupportedIntents:v16 forBundleId:v6 onPlatform:a4])
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", i));
        -[NSMutableSet addObject:](v7, "addObject:", v18);
      }
    }

    v19 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v29 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s application: %@ supports %@",  buf,  0x20u);
    }

    v20 = v7;
  }

  return v7;
}

+ (id)_candidateAnnounceNotificationTypesFromApp:(id)a3 withIntentIDs:(id)a4 notificationContentType:(id)a5 onPlatform:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v30 = a5;
  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v12 = [a1 _classForPlatform:a6];
  v31 = v10;
  id v13 = [(id)objc_opt_class(a1) supportedAnnouncementTypesForBundleId:v10 onPlatform:a6];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v13);
  id v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      v17 = 0LL;
      id v32 = v15;
      do
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v17) integerValue];
        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 announceableIntentIdentifiersForUserNotificationAnnouncementType:v18]);
        v20 = v19;
        if (v19 && ![v19 count])
        {
          id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
          -[NSMutableSet addObject:](v34, "addObject:", v21);
        }

        else
        {
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v21 = v20;
          id v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v22)
          {
            id v23 = v22;
            id v24 = v12;
            uint64_t v25 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0LL; i != v23; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v21);
                }
                if ([v11 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)i)])
                {
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
                  -[NSMutableSet addObject:](v34, "addObject:", v27);

                  goto LABEL_18;
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v23) {
                continue;
              }
              break;
            }

+ (int64_t)notificationAnnouncementTypeForNotificationFromApp:(id)a3 withIntentIDs:(id)a4 notificationContent:(id)a5 onPlatform:(int64_t)a6
{
  if (!a3) {
    return 0LL;
  }
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a5 contentType]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 _candidateAnnounceNotificationTypesFromApp:v11 withIntentIDs:v10 notificationContentType:v12 onPlatform:a6]);

  if ([v13 containsObject:&off_100513828])
  {
    int64_t v14 = 1LL;
  }

  else if ([v13 containsObject:&off_100513840])
  {
    int64_t v14 = 2LL;
  }

  else if ([v13 containsObject:&off_100513888])
  {
    int64_t v14 = 4LL;
  }

  else if ([v13 containsObject:&off_100513858])
  {
    int64_t v14 = 5LL;
  }

  else if ([v13 containsObject:&off_1005138A0])
  {
    int64_t v14 = 6LL;
  }

  else if ([v13 containsObject:&off_100513870])
  {
    int64_t v14 = 7LL;
  }

  else if ([v13 containsObject:&off_100513810])
  {
    int64_t v14 = 3LL;
  }

  else
  {
    int64_t v14 = 0LL;
  }

  return v14;
}

+ (id)_requiredBundleIDsForNotificationAnnouncementType:(int64_t)a3
{
  else {
    return 0LL;
  }
}

+ (id)_requiredPlatformsForNotificationAnnouncementType:(int64_t)a3
{
  int IsValid = AFSiriUserNotificationAnnouncementTypeGetIsValid(a3, a2);
  dispatch_queue_t v5 = 0LL;
  if (a3 == 7 && IsValid) {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_100513828, 0LL));
  }
  return v5;
}

+ (BOOL)_supportsAnnouncementType:(int64_t)a3 forSupportedIntents:(id)a4 forBundleId:(id)a5 onPlatform:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( objc_msgSend(a1, "_classForPlatform:", a6),  "requiredIntentIdentifiersForUserNotificationAnnouncementType:",  a3));
  if (v12)
  {
    id v13 = [(id)objc_opt_class(a1) _requiredBundleIDsForNotificationAnnouncementType:a3];
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ([v14 count] && !objc_msgSend(v14, "containsObject:", v11))
    {
      BOOL v23 = 0;
LABEL_21:

      goto LABEL_22;
    }

    id v31 = v11;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
LABEL_6:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v17) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:

      id v20 = [(id)objc_opt_class(a1) _requiredPlatformsForNotificationAnnouncementType:a3];
      id v15 = (id)objc_claimAutoreleasedReturnValue(v20);
      if (![v15 count]
        || (id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6)),
            unsigned __int8 v22 = [v15 containsObject:v21],
            v21,
            (v22 & 1) != 0))
      {
        BOOL v23 = 1;
LABEL_20:
        id v11 = v31;

        goto LABEL_21;
      }

      id v24 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = v24;
        uint64_t Name = AFSiriUserNotificationAnnouncementTypeGetName(a3);
        v28 = (void *)objc_claimAutoreleasedReturnValue(Name);
        uint64_t v29 = AFSiriAnnouncementPlatformGetName(a6);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 136315650;
        __int128 v37 = "+[AFSiriAnnouncementRequestCapabilityManager _supportsAnnouncementType:forSupportedIntents:forBundleId:onPlatform:]";
        __int16 v38 = 2112;
        __int128 v39 = v28;
        __int16 v40 = 2112;
        __int128 v41 = v30;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s rejecting announcementType %@ by platform %@",  buf,  0x20u);
      }
    }

    BOOL v23 = 0;
    goto LABEL_20;
  }

  BOOL v23 = 0;
LABEL_22:

  return v23;
}

@end