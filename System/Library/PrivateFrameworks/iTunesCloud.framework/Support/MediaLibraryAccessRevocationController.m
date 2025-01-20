@interface MediaLibraryAccessRevocationController
+ (MediaLibraryAccessRevocationController)sharedController;
+ (id)_identifiersOfApplicationsWithGrantedAccessToMediaLibrary;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_identifiersOfApplicationsWithExpiredAccessToMediaLibrary;
- (id)_init;
- (id)_storeRequestContextWithIdentity:(id)a3 applicationIdentifier:(id)a4;
- (id)_storeRequestContextWithIdentity:(id)a3 clientInfo:(id)a4;
- (void)_checkForRecentRevocations;
- (void)_displayNotificationForBuilder:(id)a3 withReplyBlock:(id)a4;
- (void)_registerFailureToRevokeMusicUserTokensForApplicationIdentifier:(id)a3 error:(id)a4;
- (void)_registerFailureToRevokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3 error:(id)a4;
- (void)_revokeMusicUserTokensForApplicationWithIdentifier:(id)a3 andUserIdentity:(id)a4 withCompletion:(id)a5;
- (void)_revokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3;
- (void)_startObservingRevocations;
- (void)_stopObservingRevocations;
- (void)dealloc;
- (void)revokeMusicKitUserTokensForUserIdentity:(id)a3 withCompletion:(id)a4;
- (void)startObservingRevocations;
- (void)stopObservingRevocations;
- (void)validateExpirationForBundleIdentifier:(id)a3 withReplyBlock:(id)a4;
@end

@implementation MediaLibraryAccessRevocationController

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MediaLibraryAccessRevocationController;
  v2 = -[MediaLibraryAccessRevocationController init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create( "com.apple.itunescloudd.MediaLibraryAccessRevocationController.accessQueue",  &_dispatch_queue_attr_concurrent);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.itunescloudd.tcchelper");
    listener = v2->_listener;
    v2->_listener = v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    replyBlocksForPID = v2->_replyBlocksForPID;
    v2->_replyBlocksForPID = (NSMutableDictionary *)v7;
  }

  return v2;
}

- (void)dealloc
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF9F8;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MediaLibraryAccessRevocationController;
  -[MediaLibraryAccessRevocationController dealloc](&v4, "dealloc");
}

- (void)startObservingRevocations
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF9F0;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)stopObservingRevocations
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF9E8;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    __int16 v18 = 2114;
    v19 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ connection from pid %i beginning for service %{public}@.",  buf,  0x1Cu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICMediaLibraryAccessPermissionsHelper));
  [v5 setExportedInterface:v8];
  [v5 setExportedObject:self];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BF840;
  v12[3] = &unk_1001A6D98;
  v12[4] = self;
  unsigned int v13 = v6;
  [v5 setInterruptionHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BF914;
  v10[3] = &unk_1001A6D98;
  v10[4] = self;
  unsigned int v11 = v6;
  [v5 setInvalidationHandler:v10];
  [v5 resume];

  return 1;
}

- (void)validateExpirationForBundleIdentifier:(id)a3 withReplyBlock:(id)a4
{
  id v33 = a3;
  id v5 = a4;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[MediaLibraryAccessRevocationController _identifiersOfApplicationsWithExpiredAccessToMediaLibrary]( self,  "_identifiersOfApplicationsWithExpiredAccessToMediaLibrary"));
  if ([v6 containsObject:v33])
  {
    v30 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
    if ([v30 containsObject:kTCCServiceMediaLibrary])
    {
      uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Can not present dialog for renewing applications, parental controls active",  buf,  2u);
      }

      (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
    }

    else
    {
      unsigned int v8 = [v31 processIdentifier];
      *(void *)buf = 0LL;
      v48 = buf;
      uint64_t v49 = 0x2020000000LL;
      char v50 = 0;
      accessQueue = (dispatch_queue_s *)self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000BF250;
      block[3] = &unk_1001A5048;
      unsigned int v28 = v8;
      unsigned int v46 = v8;
      block[4] = self;
      v45 = buf;
      id v44 = v5;
      dispatch_barrier_sync(accessQueue, block);
      if (v48[24])
      {
        id v29 = objc_alloc_init(&OBJC_CLASS___ICUserNotificationBuilder);
        if ([v6 count] == (id)1)
        {
          objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"TCC_EXPIRATION_SINGLE_APP_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);

          id v12 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v33 allowPlaceholder:0 error:0];
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedName]);

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v13));
          [v29 setTitle:v14];
        }

        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TCC_EXPIRATION_MULTIPLE_APPS_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);
          [v29 setTitle:v16];

          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v17 = v6;
          id v18 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v17);
                }
                id v21 = [[LSApplicationRecord alloc] initWithBundleIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * (void)i) allowPlaceholder:0 error:0];
                v22 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedName]);

                if (v22) {
                  [v11 addObject:v22];
                }
              }

              id v18 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }

            while (v18);
          }

          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@"\n"]);
          [v29 setMessage:v13];
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"TCC_EXPIRATION_ACCEPT_BUTTON_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);
        [v29 setDefaultButtonTitle:v24];

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
        v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"TCC_EXPIRATION_REJECT_BUTTON_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);
        [v29 setAlternateButtonTitle:v26];

        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_1000BF330;
        v34[3] = &unk_1001A54A0;
        v34[4] = self;
        id v35 = v29;
        id v36 = v6;
        id v37 = v33;
        unsigned int v38 = v28;
        id v27 = v29;
        dispatch_async(&_dispatch_main_q, v34);
      }

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1LL, 0LL);
  }
}

- (void)revokeMusicKitUserTokensForUserIdentity:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BF208;
  v7[3] = &unk_1001A50C0;
  id v8 = a4;
  id v6 = v8;
  -[MediaLibraryAccessRevocationController _revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:]( self,  "_revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:",  0LL,  a3,  v7);
}

- (id)_identifiersOfApplicationsWithExpiredAccessToMediaLibrary
{
  id v18 = kTCCInfoBundle;
  id v2 = kTCCInfoExpiredAt;
  dispatch_queue_t v3 = (void *)TCCExpirationCopyInformationForService(kTCCServiceMediaLibrary);
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v2, v17));
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 earlierDate:v11]);

        if (v12 == v10)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v18]);

          CFStringRef Identifier = CFBundleGetIdentifier((CFBundleRef)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(Identifier);
          [v17 addObject:v15];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  return v17;
}

- (void)_checkForRecentRevocations
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  id v5 = v3;
  if (!self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates)
  {
    id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v3 mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates]);
    identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
    self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = v6;
  }

  id v8 = objc_msgSend((id)objc_opt_class(self, v4), "_identifiersOfApplicationsWithGrantedAccessToMediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates)
  {
    objc_super v10 = objc_alloc(&OBJC_CLASS___NSSet);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary allKeys]( self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates,  "allKeys"));
    id v12 = -[NSSet initWithArray:](v10, "initWithArray:", v11);

    if (-[NSSet isEqualToSet:](v12, "isEqualToSet:", v9))
    {

      id v13 = 0LL;
      goto LABEL_18;
    }

    id v27 = v5;
    id v14 = -[NSSet mutableCopy](v12, "mutableCopy");
    [v14 minusSet:v9];
    id v13 = [v14 copy];
  }

  else
  {
    id v27 = v5;
    id v13 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v26 = v9;
  id v17 = v9;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v23 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates,  "objectForKey:",  v22,  v26));
        if (!v23) {
          id v23 = v15;
        }
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v23, v22);
      }

      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v19);
  }

  v24 = (NSDictionary *)-[NSMutableDictionary copy](v16, "copy");
  v25 = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
  self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = v24;

  id v5 = v27;
  [v27 setMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates:self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates];

  v9 = v26;
LABEL_18:
  if (objc_msgSend(v13, "count", v26)) {
    -[MediaLibraryAccessRevocationController _revokeMusicUserTokensForApplicationsWithIdentifiers:]( self,  "_revokeMusicUserTokensForApplicationsWithIdentifiers:",  v13);
  }
}

- (void)_displayNotificationForBuilder:(id)a3 withReplyBlock:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = (__CFUserNotification *)[a3 createCFUserNotification];
  if (v6)
  {
    uint64_t v7 = v6;
    CFOptionFlags responseFlags = 0LL;
    SInt32 v8 = CFUserNotificationReceiveResponse(v6, 0.0, &responseFlags);
    CFRelease(v7);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  v8,  0LL));
      v5[2](v5, 0LL, v9);
    }

    else
    {
      ((void (**)(id, BOOL, void *))v5)[2](v5, responseFlags == 0, 0LL);
    }
  }

  else
  {
    objc_super v10 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create a CFUserNotification to renew media library access for TCC expiration",  buf,  2u);
    }

    v5[2](v5, 0LL, 0LL);
  }
}

- (void)_revokeMusicUserTokensForApplicationWithIdentifier:(id)a3 andUserIdentity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Revoking music kit user tokens for application '%{public}@' and user identity %{public}@",  buf,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MediaLibraryAccessRevocationController _storeRequestContextWithIdentity:applicationIdentifier:]( self,  "_storeRequestContextWithIdentity:applicationIdentifier:",  v9,  v8));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000BEDA8;
  v18[3] = &unk_1001A50E8;
  v18[4] = self;
  id v19 = v8;
  id v21 = v9;
  id v22 = v10;
  id v20 = v12;
  id v14 = v9;
  id v15 = v12;
  id v16 = v10;
  id v17 = v8;
  [v13 getBagForRequestContext:v15 withCompletionHandler:v18];
}

- (void)_revokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v6 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v4;
    __int16 v19 = 2114;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Revoking Music User Tokens for applications %{public}@ using identity %{public}@.",  buf,  0x16u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      unsigned int v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MediaLibraryAccessRevocationController _revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:]( self,  "_revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:",  _NSConcreteStackBlock,  3221225472LL,  sub_1000BED38,  &unk_1001A7108,  self,  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  (void)v12);
        unsigned int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (id)_storeRequestContextWithIdentity:(id)a3 applicationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BEC10;
  v12[3] = &unk_1001A6AA8;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = -[ICStoreRequestContext initWithBlock:](v7, "initWithBlock:", v12);

  return v10;
}

- (void)_registerFailureToRevokeMusicUserTokensForApplicationIdentifier:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to revoke Music User Tokens for application %{public}@ with error %{public}@.",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)_registerFailureToRevokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to revoke Music User Tokens for applications %{public}@ with error %{public}@.",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)_startObservingRevocations
{
  if (!self->_isObservingTCCAccessChangedNotification)
  {
    objc_initWeak(&location, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    int v8 = sub_1000BEB98;
    id v9 = &unk_1001A5110;
    objc_copyWeak(&v10, &location);
    uint32_t v5 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccAccessChangedNotificationToken, v4, &v6);

    self->_isObservingTCCAccessChangedNotification = v5 == 0;
    if (!v5) {
      -[MediaLibraryAccessRevocationController _checkForRecentRevocations]( self,  "_checkForRecentRevocations",  v6,  v7,  v8,  v9);
    }
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)_stopObservingRevocations
{
  if (self->_isObservingTCCAccessChangedNotification)
  {
    notify_cancel(self->_tccAccessChangedNotificationToken);
    self->_tccAccessChangedNotificationToken = 0;
    self->_isObservingTCCAccessChangedNotification = 0;
    identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
    self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = 0LL;
  }

- (id)_storeRequestContextWithIdentity:(id)a3 clientInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BEAC8;
  v12[3] = &unk_1001A6AA8;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = -[ICStoreRequestContext initWithBlock:](v7, "initWithBlock:", v12);

  return v10;
}

- (void).cxx_destruct
{
}

+ (MediaLibraryAccessRevocationController)sharedController
{
  if (qword_1001DB780 != -1) {
    dispatch_once(&qword_1001DB780, &stru_1001A5020);
  }
  return (MediaLibraryAccessRevocationController *)(id)qword_1001DB778;
}

+ (id)_identifiersOfApplicationsWithGrantedAccessToMediaLibrary
{
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v2 = (id)TCCAccessCopyInformation(kTCCServiceMediaLibrary);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (_NSIsNSDictionary(v7))
        {
          id v8 = v7;
          id v9 = (__CFBundle *)[v8 objectForKey:kTCCInfoBundle];
          id v10 = v9;
          if (v9)
          {
            CFTypeID v11 = CFGetTypeID(v9);
            if (v11 != CFBundleGetTypeID()) {
              id v10 = 0LL;
            }
          }

          __int128 v12 = (const __CFBoolean *)[v8 objectForKey:kTCCInfoGranted];
          if (v12)
          {
            id v13 = v12;
            CFTypeID v14 = CFGetTypeID(v12);
            CFTypeID TypeID = CFBooleanGetTypeID();
            if (v10)
            {
              if (v14 == TypeID)
              {
                id v16 = -[__CFString copy]((id)CFBundleGetIdentifier(v10), "copy");
                int Value = CFBooleanGetValue(v13);
                if (v16 && Value) {
                  -[NSMutableSet addObject:](v20, "addObject:", v16);
                }
              }
            }
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v4);
  }

  id v18 = -[NSMutableSet copy](v20, "copy");
  return v18;
}

@end