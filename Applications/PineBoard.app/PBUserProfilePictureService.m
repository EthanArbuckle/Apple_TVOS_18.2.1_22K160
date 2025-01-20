@interface PBUserProfilePictureService
- (NSMutableSet)altDSIDsBeingObserved;
- (NSMutableSet)userIdentifiersBeingObserved;
- (PBSUserProfilePictureServiceClientInterface)observer;
- (PBUserProfilePictureService)initWithProfilePictureStore:(id)a3;
- (_TtC9PineBoard25PBUserProfilePictureStore)pictureStore;
- (id)_altDSIDForUserIdentifier:(id)a3;
- (id)_dataWithCachedFileURL:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_notifyObserverWithAltDSID:(id)a3 imageFile:(id)a4 cropRect:(CGRect)a5;
- (void)_notifyObserverWithUserIdentifier:(id)a3 imageFile:(id)a4 cropRect:(CGRect)a5;
- (void)resumeObservingUsersWithAltDSIDs:(id)a3;
- (void)resumeObservingUsersWithIdentifiers:(id)a3;
- (void)setAltDSIDsBeingObserved:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setObserver:(id)a3;
- (void)setPictureStore:(id)a3;
- (void)setUserIdentifiersBeingObserved:(id)a3;
- (void)startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4;
- (void)startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)stopObservingUserWithAltDSID:(id)a3;
- (void)stopObservingUserWithIdentifier:(id)a3;
- (void)userProfilePictureStore:(id)a3 didUpdateProfilePictureForAltDSID:(id)a4 imageFileURL:(id)a5 cropRect:(CGRect)a6;
- (void)userProfilePictureStore:(id)a3 didUpdateProfilePictureForUserIdentifier:(id)a4 imageFileURL:(id)a5 cropRect:(CGRect)a6;
@end

@implementation PBUserProfilePictureService

- (PBUserProfilePictureService)initWithProfilePictureStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBUserProfilePictureService;
  v6 = -[PBUserProfilePictureService init](&v12, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    userIdentifiersBeingObserved = v6->_userIdentifiersBeingObserved;
    v6->_userIdentifiersBeingObserved = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    altDSIDsBeingObserved = v6->_altDSIDsBeingObserved;
    v6->_altDSIDsBeingObserved = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pictureStore, a3);
    [v5 addObserver:v6];
  }

  return v6;
}

- (id)_altDSIDForUserIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfilesSnapshot]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfileWithIdentifier:v3]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesAltDSID]);
  return v7;
}

- (void)startObservingUserWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_userIdentifiersBeingObserved, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userProfilesSnapshot]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userProfileWithIdentifier:v6]);

  objc_initWeak(&location, self);
  pictureStore = self->_pictureStore;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000574B8;
  v13[3] = &unk_1003D21E8;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  -[PBUserProfilePictureStore profilePictureFileForUserProfile:completionHandler:]( pictureStore,  "profilePictureFileForUserProfile:completionHandler:",  v10,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)stopObservingUserWithIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_userIdentifiersBeingObserved, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)resumeObservingUsersWithIdentifiers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_userIdentifiersBeingObserved, "removeAllObjects");
  -[NSMutableSet unionSet:](self->_userIdentifiersBeingObserved, "unionSet:", v4);
  os_unfair_lock_unlock(&self->_lock);
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Resumed observing users, client will be called back with up to date profile pictures for these users: {userIDs=%{public}@}",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfilesSnapshot]);

  objc_initWeak((id *)buf, self);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 userProfileWithIdentifier:v12]);
        pictureStore = self->_pictureStore;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10005786C;
        v16[3] = &unk_1003D2210;
        objc_copyWeak(&v17, (id *)buf);
        v16[4] = v12;
        -[PBUserProfilePictureStore profilePictureFileForUserProfile:completionHandler:]( pictureStore,  "profilePictureFileForUserProfile:completionHandler:",  v13,  v16);
        objc_destroyWeak(&v17);
      }

      id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  objc_destroyWeak((id *)buf);
}

- (void)startObservingUserWithAltDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_altDSIDsBeingObserved, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  pictureStore = self->_pictureStore;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000579FC;
  v10[3] = &unk_1003D21E8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  -[PBUserProfilePictureStore profilePictureFileForAltDSID:completionHandler:]( pictureStore,  "profilePictureFileForAltDSID:completionHandler:",  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)stopObservingUserWithAltDSID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_altDSIDsBeingObserved, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)resumeObservingUsersWithAltDSIDs:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_altDSIDsBeingObserved, "removeAllObjects");
  -[NSMutableSet unionSet:](self->_altDSIDsBeingObserved, "unionSet:", v4);
  os_unfair_lock_unlock(&self->_lock);
  id v5 = sub_1000846F8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Resumed observing users, client will be called back with up to date profile pictures for these altDSIDs: {altDSID=%{private}@}",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
        pictureStore = self->_pictureStore;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100057D68;
        v13[3] = &unk_1003D2210;
        objc_copyWeak(&v14, (id *)buf);
        void v13[4] = v10;
        -[PBUserProfilePictureStore profilePictureFileForAltDSID:completionHandler:]( pictureStore,  "profilePictureFileForAltDSID:completionHandler:",  v10,  v13);
        objc_destroyWeak(&v14);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  objc_destroyWeak((id *)buf);
}

- (PBSUserProfilePictureServiceClientInterface)observer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  os_unfair_lock_unlock(p_lock);
  return (PBSUserProfilePictureServiceClientInterface *)WeakRetained;
}

- (void)setObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_observer, v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_dataWithCachedFileURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v9 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  8LL,  &v9));
    id v5 = v9;
    if (!v4)
    {
      id v6 = sub_1000846F8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100274BFC((uint64_t)v3, (uint64_t)v5, v7);
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)_notifyObserverWithUserIdentifier:(id)a3 imageFile:(id)a4 cropRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfilePictureService _dataWithCachedFileURL:](self, "_dataWithCachedFileURL:", v12));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", x, y, width, height));
    id v16 = sub_1000846F8();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    __int128 v18 = v17;
    if (!v12 || v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        id v21 = NSStringFromCGRect(v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        int v23 = 134219010;
        id v24 = WeakRetained;
        __int16 v25 = 2114;
        id v26 = v11;
        __int16 v27 = 2048;
        id v28 = v12;
        __int16 v29 = 2114;
        v30 = v14;
        __int16 v31 = 2114;
        v32 = v22;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Notifying observer user profile picture changed. {observer=%p, userIdentifier=%{public}@, imageData_ptr=%p, im ageFileURL=%{public}@, cropRect=%{public}@}",  (uint8_t *)&v23,  0x34u);
      }

      [WeakRetained userProfilePictureDidUpdateForUserWithIdentifier:v11 imageData:v14 cropRect:v15];
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v33.origin.double x = x;
        v33.origin.double y = y;
        v33.size.double width = width;
        v33.size.double height = height;
        __int128 v19 = NSStringFromCGRect(v33);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        int v23 = 134219010;
        id v24 = WeakRetained;
        __int16 v25 = 2114;
        id v26 = v11;
        __int16 v27 = 2048;
        id v28 = v12;
        __int16 v29 = 2114;
        v30 = 0LL;
        __int16 v31 = 2114;
        v32 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Bogus user profile picture received to notify clients, ignoring it. {observer=%p, userIdentifier=%{public}@, i mageData_ptr=%p, imageFileURL=%{public}@, cropRect=%{public}@}",  (uint8_t *)&v23,  0x34u);
      }
    }
  }
}

- (void)_notifyObserverWithAltDSID:(id)a3 imageFile:(id)a4 cropRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfilePictureService _dataWithCachedFileURL:](self, "_dataWithCachedFileURL:", v12));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", x, y, width, height));
    id v16 = sub_1000846F8();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    __int128 v18 = v17;
    if (!v12 || v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        id v21 = NSStringFromCGRect(v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        int v23 = 134219011;
        id v24 = WeakRetained;
        __int16 v25 = 2113;
        id v26 = v11;
        __int16 v27 = 2048;
        id v28 = v12;
        __int16 v29 = 2114;
        v30 = v14;
        __int16 v31 = 2114;
        v32 = v22;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Notifying observer altDSID profile picture changed. {observer=%p, altDSID=%{private}@, imageData_ptr=%p, image FileURL=%{public}@, cropRect=%{public}@}",  (uint8_t *)&v23,  0x34u);
      }

      [WeakRetained userProfilePictureDidUpdateForAccountWithAltDSID:v11 imageData:v14 cropRect:v15];
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v33.origin.double x = x;
        v33.origin.double y = y;
        v33.size.double width = width;
        v33.size.double height = height;
        __int128 v19 = NSStringFromCGRect(v33);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        int v23 = 134219011;
        id v24 = WeakRetained;
        __int16 v25 = 2113;
        id v26 = v11;
        __int16 v27 = 2048;
        id v28 = v12;
        __int16 v29 = 2114;
        v30 = 0LL;
        __int16 v31 = 2114;
        v32 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Bogus altDSID profile picture received to notify clients, ignoring it. {observer=%p, altDSID=%{private}@, imag eData_ptr=%p, imageFileURL=%{public}@, cropRect=%{public}@}",  (uint8_t *)&v23,  0x34u);
      }
    }
  }
}

- (void)userProfilePictureStore:(id)a3 didUpdateProfilePictureForUserIdentifier:(id)a4 imageFileURL:(id)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a4;
  id v13 = a5;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v14 = -[NSMutableSet containsObject:](self->_userIdentifiersBeingObserved, "containsObject:", v12);
  os_unfair_lock_unlock(&self->_lock);
  if (v14) {
    -[PBUserProfilePictureService _notifyObserverWithUserIdentifier:imageFile:cropRect:]( self,  "_notifyObserverWithUserIdentifier:imageFile:cropRect:",  v12,  v13,  x,  y,  width,  height);
  }
}

- (void)userProfilePictureStore:(id)a3 didUpdateProfilePictureForAltDSID:(id)a4 imageFileURL:(id)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a4;
  id v13 = a5;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v14 = -[NSMutableSet containsObject:](self->_altDSIDsBeingObserved, "containsObject:", v12);
  os_unfair_lock_unlock(&self->_lock);
  if (v14) {
    -[PBUserProfilePictureService _notifyObserverWithAltDSID:imageFile:cropRect:]( self,  "_notifyObserverWithAltDSID:imageFile:cropRect:",  v12,  v13,  x,  y,  width,  height);
  }
}

- (_TtC9PineBoard25PBUserProfilePictureStore)pictureStore
{
  return self->_pictureStore;
}

- (void)setPictureStore:(id)a3
{
}

- (NSMutableSet)userIdentifiersBeingObserved
{
  return self->_userIdentifiersBeingObserved;
}

- (void)setUserIdentifiersBeingObserved:(id)a3
{
}

- (NSMutableSet)altDSIDsBeingObserved
{
  return self->_altDSIDsBeingObserved;
}

- (void)setAltDSIDsBeingObserved:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end