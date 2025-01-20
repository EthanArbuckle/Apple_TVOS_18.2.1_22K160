@interface PBLoretoUserProfilePicturesClient
- (BOOL)_queue_isActive;
- (NSString)description;
- (PBLoretoUserProfilePicturesClient)initWithRecord:(id)a3;
- (PBLoretoUserProfilePicturesClientRecord)record;
- (PBSUserProfilePictureServiceClientInterface)delegate;
- (id)_queue_profileIdentityForIdentifier:(id)a3;
- (void)_handleProfilePictureResponse:(id)a3 forSource:(id)a4;
- (void)_handleProfilePictureStoreUpdate;
- (void)_notifyDelegateWithSource:(id)a3 response:(id)a4;
- (void)_queue_addProfilePictureSource:(id)a3;
- (void)_queue_checkForProfilePictureChanges;
- (void)_queue_checkForProfilePictureChangesIfNeededWithContext:(id)a3;
- (void)_queue_checkForProfilePictureChangesWithSources:(id)a3 cacheTagBySource:(id)a4;
- (void)_queue_handleChangesOperationCompletionWithResponses:(id)a3 context:(id)a4;
- (void)_queue_handleProfilePictureStoreUpdate;
- (void)_queue_invalidate;
- (void)_queue_resumeObservingUsersWithAltDSIDs:(id)a3;
- (void)_queue_resumeObservingUsersWithIdentifiers:(id)a3;
- (void)_queue_resumeObservingUsersWithSources:(id)a3;
- (void)_queue_startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4;
- (void)_queue_startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_queue_startObservingWithSource:(id)a3 completionHandler:(id)a4;
- (void)_queue_stopObservingUserWithAltDSID:(id)a3;
- (void)_queue_stopObservingUserWithIdentifier:(id)a3;
- (void)_queue_updateCacheTagDictionaryWithProfilePictureResponse:(id)a3 forSource:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)resumeObservingUsersWithAltDSIDs:(id)a3;
- (void)resumeObservingUsersWithIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4;
- (void)startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)stopObservingUserWithAltDSID:(id)a3;
- (void)stopObservingUserWithIdentifier:(id)a3;
@end

@implementation PBLoretoUserProfilePicturesClient

- (PBLoretoUserProfilePicturesClient)initWithRecord:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"PBLoretoUserProfilePicturesClientRecord");
  if (!v4)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289D88();
    }
LABEL_15:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100196AFCLL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBLoretoUserProfilePicturesClientRecordClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289EE8();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100196B60LL);
  }

  if (([v4 isEntitled] & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[record isEntitled]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289E3C();
    }
    goto LABEL_15;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfilePicturesClient;
  v6 = -[PBLoretoUserProfilePicturesClient init](&v26, "init");
  if (v6)
  {
    v7 = (PBLoretoUserProfilePicturesClientRecord *)[v4 copy];
    record = v6->_record;
    v6->_record = v7;

    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLoretoUserProfilePicturesClient.queue");
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)Serial;

    v11 = objc_alloc_init(&OBJC_CLASS___UPProfilePictureStore);
    queue_profilePictureStore = v6->_queue_profilePictureStore;
    v6->_queue_profilePictureStore = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    queue_profilePictureStoreContext = v6->_queue_profilePictureStoreContext;
    v6->_queue_profilePictureStoreContext = (NSUUID *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue_cacheTagBySource = v6->_queue_cacheTagBySource;
    v6->_queue_cacheTagBySource = v15;

    objc_initWeak(&location, v6);
    v17 = v6->_queue_profilePictureStore;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100196BE4;
    v23[3] = &unk_1003D0890;
    objc_copyWeak(&v24, &location);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[UPProfilePictureStore observeUpdatesUsingHandler:](v17, "observeUpdatesUsingHandler:", v23));
    queue_observerToken = v6->_queue_observerToken;
    v6->_queue_observerToken = (BSInvalidatable *)v18;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  if (self->_queue_profilePictureStore)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_queue_profilePictureStore == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289F9C();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

  else
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfilePicturesClient;
    -[PBLoretoUserProfilePicturesClient dealloc](&v3, "dealloc");
  }

- (void)invalidate
{
  id v3 = sub_1000846F8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client(%p): Invalidating", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100196DA4;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfilePicturesClientRecord succinctDescription](self->_record, "succinctDescription"));
  id v5 = [v3 appendObject:v4 withName:@"record"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (void)startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100196F14;
  v11[3] = &unk_1003DAC80;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)resumeObservingUsersWithIdentifiers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100197000;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopObservingUserWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001970EC;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001971F8;
  v11[3] = &unk_1003DAC80;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)resumeObservingUsersWithAltDSIDs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001972E4;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopObservingUserWithAltDSID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001973D0;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_queue_startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10019762C;
  v21[3] = &unk_1003DACA8;
  id v8 = v7;
  id v23 = v8;
  v21[4] = self;
  id v9 = v6;
  id v22 = v9;
  id v10 = objc_retainBlock(v21);
  id v11 = sub_1000846F8();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to start observing user. userIdentifier=%{public}@",  buf,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfilePicturesClient _queue_profileIdentityForIdentifier:]( self,  "_queue_profileIdentityForIdentifier:",  v9));
  if (!v13)
  {
    id v15 = sub_1000846F8();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10028A044();
    }

    uint64_t v17 = 200LL;
    goto LABEL_12;
  }

  if (!self->_queue_profilePictureStore)
  {
    id v18 = sub_1000846F8();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10028A0B0();
    }

    uint64_t v17 = 103LL;
LABEL_12:
    uint64_t v20 = PBSUserProfileServiceErrorForCode(v17);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v14);
    goto LABEL_13;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfilePictureSource sourceForProfileIdentity:userIdentifier:]( &OBJC_CLASS___PBUserProfilePictureSource,  "sourceForProfileIdentity:userIdentifier:",  v13,  v9));
  -[PBLoretoUserProfilePicturesClient _queue_startObservingWithSource:completionHandler:]( self,  "_queue_startObservingWithSource:completionHandler:",  v14,  v10);
LABEL_13:
}

- (void)_queue_stopObservingUserWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to stop observing user. userIdentifier=%{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfilePicturesClient _queue_profileIdentityForIdentifier:]( self,  "_queue_profileIdentityForIdentifier:",  v4));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfilePictureSource sourceForProfileIdentity:userIdentifier:]( &OBJC_CLASS___PBUserProfilePictureSource,  "sourceForProfileIdentity:userIdentifier:",  v7,  v4));
    -[NSMutableDictionary removeObjectForKey:](self->_queue_cacheTagBySource, "removeObjectForKey:", v8);
  }
}

- (void)_queue_resumeObservingUsersWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to resume observing users. userIdentifiers=%{public}@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary bs_filter:](self->_queue_cacheTagBySource, "bs_filter:", &stru_1003DACE8));
  id v8 = (NSMutableDictionary *)[v7 mutableCopy];
  queue_cacheTagBySource = self->_queue_cacheTagBySource;
  self->_queue_cacheTagBySource = v8;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100197A1C;
  v11[3] = &unk_1003DAD10;
  void v11[4] = self;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", v11));
  -[PBLoretoUserProfilePicturesClient _queue_resumeObservingUsersWithSources:]( self,  "_queue_resumeObservingUsersWithSources:",  v10);
}

- (void)_queue_startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000846F8();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v21 = self;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040LL;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to start observing altDSID. altDSID=%{mask.hash}@",  buf,  0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100197CA8;
  v17[3] = &unk_1003DACA8;
  id v10 = v7;
  id v19 = v10;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  id v12 = objc_retainBlock(v17);
  if (self->_queue_profilePictureStore)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfilePictureSource sourceForAltDSID:]( &OBJC_CLASS___PBUserProfilePictureSource,  "sourceForAltDSID:",  v11));
    -[PBLoretoUserProfilePicturesClient _queue_startObservingWithSource:completionHandler:]( self,  "_queue_startObservingWithSource:completionHandler:",  v13,  v12);
  }

  else
  {
    id v14 = sub_1000846F8();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10028A0B0();
    }

    uint64_t v16 = PBSUserProfileServiceErrorForCode(103LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (*)(void *, void, void *))v12[2])(v12, 0LL, v13);
  }
}

- (void)_queue_stopObservingUserWithAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    int v9 = self;
    __int16 v10 = 2160;
    uint64_t v11 = 1752392040LL;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to stop observing altDSID. altDSID=%{mask.hash}@",  (uint8_t *)&v8,  0x20u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfilePictureSource sourceForAltDSID:]( &OBJC_CLASS___PBUserProfilePictureSource,  "sourceForAltDSID:",  v4));
  -[NSMutableDictionary removeObjectForKey:](self->_queue_cacheTagBySource, "removeObjectForKey:", v7);
}

- (void)_queue_resumeObservingUsersWithAltDSIDs:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218498;
    __int16 v12 = self;
    __int16 v13 = 2160;
    uint64_t v14 = 1752392040LL;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Received request to resume observing altDSIDs. altDSIDs=%{mask.hash}@",  (uint8_t *)&v11,  0x20u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary bs_filter:](self->_queue_cacheTagBySource, "bs_filter:", &stru_1003DAD30));
  int v8 = (NSMutableDictionary *)[v7 mutableCopy];
  queue_cacheTagBySource = self->_queue_cacheTagBySource;
  self->_queue_cacheTagBySource = v8;

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1003DAD70));
  -[PBLoretoUserProfilePicturesClient _queue_resumeObservingUsersWithSources:]( self,  "_queue_resumeObservingUsersWithSources:",  v10);
}

- (void)_queue_startObservingWithSource:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = sub_1000846F8();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10028A184((uint64_t)self, v6, v9);
  }

  -[PBLoretoUserProfilePicturesClient _queue_addProfilePictureSource:](self, "_queue_addProfilePictureSource:", v6);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 profilePictureRequest]);
  objc_initWeak(&location, self);
  queue_profilePictureStore = self->_queue_profilePictureStore;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100198210;
  v14[3] = &unk_1003DAD98;
  v14[4] = self;
  id v12 = v6;
  id v15 = v12;
  objc_copyWeak(&v17, &location);
  id v13 = v7;
  id v16 = v13;
  -[UPProfilePictureStore fetchProfilePictureForRequest:completion:]( queue_profilePictureStore,  "fetchProfilePictureForRequest:completion:",  v10,  v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_queue_resumeObservingUsersWithSources:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = self;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040LL;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Resuming observations of sources. sources=%{mask.hash}@",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      __int16 v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1001984F8;
        v12[3] = &unk_1003DADC0;
        objc_copyWeak(&v13, (id *)buf);
        v12[4] = v11;
        v12[5] = self;
        -[PBLoretoUserProfilePicturesClient _queue_startObservingWithSource:completionHandler:]( self,  "_queue_startObservingWithSource:completionHandler:",  v11,  v12);
        objc_destroyWeak(&v13);
        __int16 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  objc_destroyWeak((id *)buf);
}

- (void)_queue_updateCacheTagDictionaryWithProfilePictureResponse:(id)a3 forSource:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cacheTag]);

  id v10 = sub_1000846F8();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 succinctDescription]);
      int v15 = 134218754;
      __int128 v16 = self;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040LL;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Updating cache tag dictionary. source=%{mask.hash}@, cacheTag=%{public}@",  (uint8_t *)&v15,  0x2Au);
    }

    -[NSMutableDictionary setObject:forKey:](self->_queue_cacheTagBySource, "setObject:forKey:", v9, v6);
  }

  else
  {
    if (v12)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 succinctDescription]);
      int v15 = 134218498;
      __int128 v16 = self;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040LL;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Response had no cache tag. Will ignore. source=%{mask.hash}@",  (uint8_t *)&v15,  0x20u);
    }
  }
}

- (void)_queue_handleProfilePictureStoreUpdate
{
  id v3 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  queue_profilePictureStoreContext = self->_queue_profilePictureStoreContext;
  self->_queue_profilePictureStoreContext = v3;

  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = self->_queue_profilePictureStoreContext;
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Profile picture store has changed. New context has been created. context=%{public}@",  (uint8_t *)&v8,  0x16u);
  }

  -[PBLoretoUserProfilePicturesClient _queue_checkForProfilePictureChanges]( self,  "_queue_checkForProfilePictureChanges");
}

- (void)_queue_checkForProfilePictureChanges
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_queue_cacheTagBySource, "allKeys"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary bs_filter:](self->_queue_cacheTagBySource, "bs_filter:", &stru_1003DADE0));
  -[PBLoretoUserProfilePicturesClient _queue_checkForProfilePictureChangesWithSources:cacheTagBySource:]( self,  "_queue_checkForProfilePictureChangesWithSources:cacheTagBySource:",  v4,  v5);
}

- (void)_queue_checkForProfilePictureChangesIfNeededWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028A3E0();
  }

  unsigned __int8 v7 = -[NSUUID isEqual:](self->_queue_profilePictureStoreContext, "isEqual:", v4);
  id v8 = sub_1000846F8();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      queue_profilePictureStoreContext = self->_queue_profilePictureStoreContext;
      int v13 = 134218242;
      __int128 v14 = self;
      __int16 v15 = 2114;
      __int128 v16 = queue_profilePictureStoreContext;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Profile picture store has *not* changed while operation was inflight. Another changes operation does *not* need to run. context=%{public}@",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
    if (v10)
    {
      BOOL v12 = self->_queue_profilePictureStoreContext;
      int v13 = 134218242;
      __int128 v14 = self;
      __int16 v15 = 2114;
      __int128 v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Store has changed while the last changes operations was in flight. Will start another operation. context=%{public}@",  (uint8_t *)&v13,  0x16u);
    }

    -[PBLoretoUserProfilePicturesClient _queue_checkForProfilePictureChanges]( self,  "_queue_checkForProfilePictureChanges");
  }
}

- (void)_queue_checkForProfilePictureChangesWithSources:(id)a3 cacheTagBySource:(id)a4
{
  id v6 = (NSUUID *)a3;
  id v7 = a4;
  id v8 = sub_1000846F8();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    queue_profilePictureStoreContext = self->_queue_profilePictureStoreContext;
    *(_DWORD *)buf = 134218754;
    __int16 v26 = self;
    __int16 v27 = 2114;
    v28 = queue_profilePictureStoreContext;
    __int16 v29 = 2112;
    v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Client(%p): Attempting to start profile picture changes operation. context=%{public}@, sources=%@, cacheTagBySource=%@",  buf,  0x2Au);
  }

  if (self->_queue_changesOperation)
  {
    id v10 = sub_1000846F8();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      queue_changesOperation = self->_queue_changesOperation;
      *(_DWORD *)buf = 134218240;
      __int16 v26 = self;
      __int16 v27 = 2048;
      v28 = queue_changesOperation;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Unable to start changes operation as one is already in flight. We will check again once the current update operation completes. inflightOperation=%p",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v11 = -[PBUserProfilePictureChangesOperation initWithSources:cacheTagBySource:profilePictureStore:context:]( objc_alloc(&OBJC_CLASS___PBUserProfilePictureChangesOperation),  "initWithSources:cacheTagBySource:profilePictureStore:context:",  v6,  v7,  self->_queue_profilePictureStore,  self->_queue_profilePictureStoreContext);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    __int16 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    __int16 v19 = sub_100198D1C;
    uint64_t v20 = &unk_1003DAE08;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    -[os_log_s setCompletionBlock:](v11, "setCompletionBlock:", &v17);
    objc_storeStrong((id *)&self->_queue_changesOperation, v11);
    id v13 = sub_1000846F8();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = self->_queue_profilePictureStoreContext;
      *(_DWORD *)buf = 134218498;
      __int16 v26 = self;
      __int16 v27 = 2048;
      v28 = v11;
      __int16 v29 = 2114;
      v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Starting changes operation. operation=%p, context=%{public}@",  buf,  0x20u);
    }

    -[PBUserProfilePictureChangesOperation start](self->_queue_changesOperation, "start", v17, v18, v19, v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_handleChangesOperationCompletionWithResponses:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000846F8();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v19 = self;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Handling finished profile picture changes operation. context=%{public}@, responseBySource=%@",  buf,  0x20u);
  }

  queue_changesOperation = self->_queue_changesOperation;
  self->_queue_changesOperation = 0LL;

  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  __int128 v14 = sub_100199038;
  __int16 v15 = &unk_1003DAE30;
  __int128 v16 = self;
  id v17 = v7;
  id v11 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];
  -[PBLoretoUserProfilePicturesClient _queue_checkForProfilePictureChangesIfNeededWithContext:]( self,  "_queue_checkForProfilePictureChangesIfNeededWithContext:",  v11,  v12,  v13,  v14,  v15,  v16);
}

- (id)_queue_profileIdentityForIdentifier:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v6 = 0LL;
    goto LABEL_5;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfilesSnapshot]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfileWithIdentifier:v3]);

  if (!v6)
  {
LABEL_5:
    id v7 = 0LL;
    goto LABEL_6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
LABEL_6:

  return v7;
}

- (void)_queue_addProfilePictureSource:(id)a3
{
  queue_cacheTagBySource = self->_queue_cacheTagBySource;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[NSMutableDictionary setObject:forKey:](queue_cacheTagBySource, "setObject:forKey:", v5, v4);
}

- (void)_queue_invalidate
{
  queue_observerToken = self->_queue_observerToken;
  self->_queue_observerToken = 0LL;

  -[UPProfilePictureStore invalidate](self->_queue_profilePictureStore, "invalidate");
  queue_profilePictureStore = self->_queue_profilePictureStore;
  self->_queue_profilePictureStore = 0LL;
}

- (BOOL)_queue_isActive
{
  return self->_queue_profilePictureStore != 0LL;
}

- (void)_notifyDelegateWithSource:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfilePicturesClient delegate](self, "delegate"));
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 imageData]);
    if (v9)
    {
      [v7 cropRect];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:"));
      id v19 = sub_1000846F8();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 succinctDescription]);
        id v22 = [v9 length];
        v46.origin.x = v11;
        v46.origin.y = v13;
        v46.size.width = v15;
        v46.size.height = v17;
        id v23 = NSStringFromCGRect(v46);
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 134219266;
        v35 = self;
        __int16 v36 = 2048;
        v37 = v8;
        __int16 v38 = 2112;
        v39 = v21;
        __int16 v40 = 2048;
        v41 = v9;
        __int16 v42 = 2048;
        id v43 = v22;
        __int16 v44 = 2112;
        v45 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Notifying delegate user profile picture changed. {delegate=%p, source=%@, imageData_ptr=%p, imageL ength=%lu, cropRect=%@}",  buf,  0x3Eu);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentifier]);
      if (v25)
      {
        [v8 userProfilePictureDidUpdateForUserWithIdentifier:v25 imageData:v9 cropRect:v18];
      }

      else
      {
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v6 altDSID]);
        if (!v31)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"altDSID != nil"));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10028A464();
          }
          _bs_set_crash_log_message([v33 UTF8String]);
          __break(0);
          JUMPOUT(0x1001995FCLL);
        }

        id v32 = (void *)v31;
        [v8 userProfilePictureDidUpdateForAccountWithAltDSID:v31 imageData:v9 cropRect:v18];
      }
    }

    else
    {
      id v27 = sub_1000846F8();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v6 succinctDescription]);
        uint64_t v29 = UPProfilePictureResponseStatusDescription([v7 status]);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 134218754;
        v35 = self;
        __int16 v36 = 2048;
        v37 = v8;
        __int16 v38 = 2112;
        v39 = v28;
        __int16 v40 = 2112;
        v41 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Client(%p): No image data returned. Will ignore. {delegate=%p, source=%@, responseStatus=%@}",  buf,  0x2Au);
      }
    }
  }

  else
  {
    id v26 = sub_1000846F8();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Client(%p): Unable to inform delegate of profile picture change as delegate is nil.",  buf,  0xCu);
    }
  }
}

- (void)_handleProfilePictureResponse:(id)a3 forSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001996E4;
  v11[3] = &unk_1003D0378;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleProfilePictureStoreUpdate
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001997A8;
  v4[3] = &unk_1003D0890;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (PBSUserProfilePictureServiceClientInterface)delegate
{
  return (PBSUserProfilePictureServiceClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBLoretoUserProfilePicturesClientRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
}

  ;
}

@end