@interface PDFamilyCircleManager
- (PDFamilyCircleManager)init;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addFamilyCircleRequest:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_familyMembersWithCachePolicy:(unint64_t)a3 pendingMembers:(BOOL)a4 completion:(id)a5;
- (void)_handleFamilyUpdatedNotification:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)familyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)memberTypeForCurrentUserWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)pendingFamilyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation PDFamilyCircleManager

- (PDFamilyCircleManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDFamilyCircleManager;
  v2 = -[PDFamilyCircleManager init](&v9, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fetchRequests = v2->_fetchRequests;
    v2->_fetchRequests = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v7 addObserver:v2 selector:"_handleFamilyUpdatedNotification:" name:FAFamilyUpdateNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDFamilyCircleManager;
  -[PDFamilyCircleManager dealloc](&v4, "dealloc");
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }

- (void)familyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
}

- (void)pendingFamilyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
}

- (void)_familyMembersWithCachePolicy:(unint64_t)a3 pendingMembers:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002D3A60;
  v17[3] = &unk_1006415E8;
  id v18 = a5;
  id v8 = v18;
  objc_super v9 = objc_retainBlock(v17);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"default";
    if (a3 == 1) {
      v12 = @"ignoreCache";
    }
    if (a3 == 2) {
      v12 = @"dontLoad";
    }
    v13 = v12;
    v14 = v13;
    v15 = @"NO";
    if (v5) {
      v15 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v20 = v13;
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Family members request cache policy: %@, pendingMembers: %@",  buf,  0x16u);
  }

  v16 = objc_alloc_init(&OBJC_CLASS___PDFamilyCircleMembersRequest);
  -[PDFamilyCircleMembersRequest addCompletion:](v16, "addCompletion:", v9);
  -[PDFamilyCircleMembersRequest setCachePolicy:](v16, "setCachePolicy:", a3);
  -[PDFamilyCircleMembersRequest setPendingMembers:](v16, "setPendingMembers:", v5);
  -[PDFamilyCircleManager _addFamilyCircleRequest:](self, "_addFamilyCircleRequest:", v16);
  -[PDFamilyCircleManager _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  v7 = dispatch_group_create();
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v12);
        dispatch_group_enter(v7);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1002D3D7C;
        v25[3] = &unk_100653A50;
        v26 = v8;
        uint64_t v27 = v13;
        v28 = v7;
        v14 = objc_retainBlock(v25);
        v15 = -[PDFamilyCircleMemberPhotoRequest initWithDSID:]( objc_alloc(&OBJC_CLASS___PDFamilyCircleMemberPhotoRequest),  "initWithDSID:",  v13);
        -[PDFamilyCircleMemberPhotoRequest addCompletion:](v15, "addCompletion:", v14);
        -[PDFamilyCircleManager _addFamilyCircleRequest:](self, "_addFamilyCircleRequest:", v15);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v10);
  }

  -[PDFamilyCircleManager _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
  id v16 = PDDefaultQueue();
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D3DAC;
  block[3] = &unk_1006396B0;
  v23 = v8;
  id v24 = v20;
  id v18 = v8;
  id v19 = v20;
  dispatch_group_notify(v7, v17, block);
}

- (void)memberTypeForCurrentUserWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002D3F80;
  v13[3] = &unk_10063C9A0;
  id v14 = a4;
  id v6 = v14;
  v7 = objc_retainBlock(v13);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"default";
    if (a3 == 1) {
      id v10 = @"ignoreCache";
    }
    if (a3 == 2) {
      id v10 = @"dontLoad";
    }
    uint64_t v11 = v10;
    *(_DWORD *)buf = 138412290;
    id v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Family members type request incoming with cache policy: %@",  buf,  0xCu);
  }

  v12 = -[PDFamilyCircleMemberTypeRequest initWithCachePolicy:]( objc_alloc(&OBJC_CLASS___PDFamilyCircleMemberTypeRequest),  "initWithCachePolicy:",  a3);
  -[PDFamilyCircleMemberTypeRequest addCompletion:](v12, "addCompletion:", v7);
  -[PDFamilyCircleManager _addFamilyCircleRequest:](self, "_addFamilyCircleRequest:", v12);
  -[PDFamilyCircleManager _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
}

- (void)_handleFamilyUpdatedNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002D40A8;
  v3[3] = &unk_100653A78;
  v3[4] = self;
  -[PDFamilyCircleManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v3);
}

- (void)_accessObserversWithHandler:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(p_lock);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }
  }
}

- (void)_addFamilyCircleRequest:(id)a3
{
  objc_super v4 = (os_log_s *)a3;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Family request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = self->_fetchRequests;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "coalesceWithRequest:", v4, (void)v13))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v18 = v4;
            __int16 v19 = 2112;
            id v20 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Family member request request coalesced %@ onto existing request %@",  buf,  0x16u);
          }

          id v6 = v4;
          goto LABEL_18;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    -[NSMutableArray addObject:](self->_fetchRequests, "addObject:", v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Family member request queued %@", buf, 0xCu);
    }

    id v7 = (NSMutableArray *)v4;
LABEL_18:
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_executeNextRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    objc_super v4 = (PDFamilyCircleRequest *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_fetchRequests, "firstObject"));
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    id v6 = self->_currentRequest;
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_fetchRequests, "removeObjectAtIndex:", 0LL);
      id v6 = self->_currentRequest;
    }

    id v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1002D44F0;
      v8[3] = &unk_100639300;
      v8[4] = self;
      -[PDFamilyCircleRequest executeRequestWithManager:completion:]( v7,  "executeRequestWithManager:completion:",  self,  v8);
    }
  }

- (void).cxx_destruct
{
}

@end