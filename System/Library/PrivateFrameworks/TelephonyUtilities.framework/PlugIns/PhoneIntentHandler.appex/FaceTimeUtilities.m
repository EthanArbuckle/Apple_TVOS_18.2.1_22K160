@interface FaceTimeUtilities
+ (FaceTimeUtilities)sharedInstance;
- (BOOL)isFaceTimeEnabledInSettings;
- (BOOL)isFaceTimeable:(id)a3;
- (FaceTimeUtilities)init;
- (IDSSignInController)signInController;
- (id)canonicalAddressesForAddresses:(id)a3;
- (id)fetchFaceTimeAccountAliases;
- (id)generateFaceTimeLink:(id)a3;
- (void)runIDSQueryForStartCallIntent:(id)a3;
@end

@implementation FaceTimeUtilities

+ (FaceTimeUtilities)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DDA4;
  block[3] = &unk_100034610;
  block[4] = a1;
  if (qword_10003E5A8 != -1) {
    dispatch_once(&qword_10003E5A8, block);
  }
  return (FaceTimeUtilities *)(id)qword_10003E5A0;
}

- (FaceTimeUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FaceTimeUtilities;
  v2 = -[FaceTimeUtilities init](&v6, "init");
  if (v2)
  {
    v3 = -[IDSSignInController initWithQueue:]( objc_alloc(&OBJC_CLASS___IDSSignInController),  "initWithQueue:",  &_dispatch_main_q);
    signInController = v2->_signInController;
    v2->_signInController = v3;
  }

  return v2;
}

- (void)runIDSQueryForStartCallIntent:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceTimeUtilities canonicalAddressesForAddresses:](self, "canonicalAddressesForAddresses:", a3));
  id v4 = IntentHandlerDefaultLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "starting dispatch semaphore for TUIDSLookupManagerStatusChangedNotification",  buf,  2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v8 = TUIDSLookupManagerStatusChangedNotification;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001E008;
  v17[3] = &unk_100034960;
  v10 = v6;
  v18 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 addObserverForName:v8 object:0 queue:v9 usingBlock:v17]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
  [v12 beginQueryWithDestinations:v3];

  dispatch_time_t v13 = dispatch_time(0LL, 3000000000LL);
  dispatch_semaphore_wait(v10, v13);
  id v14 = IntentHandlerDefaultLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ending dispatch semaphore for TUIDSLookupManagerStatusChangedNotification",  buf,  2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v16 removeObserver:v11];
}

- (id)canonicalAddressesForAddresses:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v11 = TUCopyIDSCanonicalAddressForDestinationID(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[NSMutableSet addObject:](v4, "addObject:", v12);

        id v13 = IntentHandlerDefaultLog();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = TUCopyIDSCanonicalAddressForDestinationID(v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "canonical address: %@", buf, 0xCu);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v7);
  }

  id v17 = -[NSMutableSet copy](v4, "copy");
  return v17;
}

- (BOOL)isFaceTimeable:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceTimeUtilities canonicalAddressesForAddresses:](self, "canonicalAddressesForAddresses:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
  if ([v5 isFaceTimeAudioAvailableForAnyDestinationInDestinations:v4])
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
    if ([v7 isFaceTimeVideoAvailableForAnyDestinationInDestinations:v4])
    {
      unsigned __int8 v6 = 1;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
      unsigned __int8 v6 = [v8 isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:v4];
    }
  }

  return v6;
}

- (id)generateFaceTimeLink:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  __int128 v20 = sub_10001E3D4;
  __int128 v21 = sub_10001E3E4;
  id v22 = 0LL;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationManager]);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10001E3EC;
  id v14 = &unk_100034988;
  v16 = &v17;
  id v7 = v4;
  uint64_t v15 = v7;
  [v6 generateLinkWithInvitedMemberHandles:v3 completionHandler:&v11];

  dispatch_time_t v8 = dispatch_time(0LL, 10000000000LL);
  dispatch_semaphore_wait(v7, v8);
  id v9 = objc_msgSend((id)v18[5], "copy", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)isFaceTimeEnabledInSettings
{
  return -[IDSSignInController isFaceTimeEnabled](self->_signInController, "isFaceTimeEnabled");
}

- (id)fetchFaceTimeAccountAliases
{
  id v2 = objc_alloc(&OBJC_CLASS___IDSService);
  id v3 = [v2 initWithService:IDSServiceNameFaceTime];
  dispatch_semaphore_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accounts", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) vettedAliases]);
        -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v11 = IntentHandlerDefaultLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100020B74((uint64_t)v4, v12);
  }

  return v4;
}

- (IDSSignInController)signInController
{
  return self->_signInController;
}

- (void).cxx_destruct
{
}

@end