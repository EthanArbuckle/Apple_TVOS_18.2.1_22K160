@interface RPHomeKitManager
- (BOOL)invalidateCalled;
- (BOOL)personalRequestsStateForAccessory:(id)a3;
- (HMHome)currentHome;
- (HMHomeManager)homeManager;
- (HMUser)currentUser;
- (NSArray)homeKitCurrentUserIDs;
- (OS_dispatch_queue)dispatchQueue;
- (RPHomeKitManager)initWithQueue:(id)a3;
- (id)filterHomeKitUserIdentifiers:(id)a3;
- (id)homeHubDeviceWithIdentifier:(id)a3;
- (id)homeKitUserIdentifiers;
- (id)mediaGroupsChangedHandler;
- (id)personalRequestsStateChangedHandler;
- (id)roomUpdatedHandler;
- (void)_setupHome;
- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completionHandler:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)invalidate;
- (void)resetHomeKitUserIdentifiers;
- (void)setCurrentHome:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitCurrentUserIDs:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setMediaGroupsChangedHandler:(id)a3;
- (void)setPersonalRequestsStateChangedHandler:(id)a3;
- (void)setRoomUpdatedHandler:(id)a3;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation RPHomeKitManager

- (RPHomeKitManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPHomeKitManager;
  v6 = -[RPHomeKitManager init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    id v8 = [objc_alloc(off_100131EA0()) initWithOptions:32780 cachePolicy:2];
    v9 = (HMHomeManager *)[objc_alloc(off_100131EA8()) initWithHomeMangerConfiguration:v8];
    homeManager = v7->_homeManager;
    v7->_homeManager = v9;
  }

  return v7;
}

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", 0LL);
    homeManager = self->_homeManager;
    self->_homeManager = 0LL;

    -[HMUser setDelegate:](self->_currentUser, "setDelegate:", 0LL);
    currentUser = self->_currentUser;
    self->_currentUser = 0LL;

    -[HMHome setDelegate:](self->_currentHome, "setDelegate:", 0LL);
    currentHome = self->_currentHome;
    self->_currentHome = 0LL;

    id mediaGroupsChangedHandler = self->_mediaGroupsChangedHandler;
    self->_id mediaGroupsChangedHandler = 0LL;

    id personalRequestsStateChangedHandler = self->_personalRequestsStateChangedHandler;
    self->_id personalRequestsStateChangedHandler = 0LL;

    id roomUpdatedHandler = self->_roomUpdatedHandler;
    self->_id roomUpdatedHandler = 0LL;

    if (dword_100131E30 <= 30
      && (dword_100131E30 != -1 || _LogCategory_Initialize(&dword_100131E30, 30LL)))
    {
      LogPrintF(&dword_100131E30, "-[RPHomeKitManager invalidate]", 30LL, "Invalidated\n");
    }
  }

- (id)homeKitUserIdentifiers
{
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  if (homeKitCurrentUserIDs) {
    return homeKitCurrentUserIDs;
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v21 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 currentUser]);
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUser]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);

          if (v15)
          {
            if (!v8) {
              id v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUser]);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
            -[NSArray addObject:](v8, "addObject:", v17);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  v18 = v21->_homeKitCurrentUserIDs;
  v21->_homeKitCurrentUserIDs = v8;
  v19 = v8;

  v20 = v21->_homeKitCurrentUserIDs;
  return v20;
}

- (id)filterHomeKitUserIdentifiers:(id)a3
{
  id v4 = a3;
  v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v6 = v4;
  id v30 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v30)
  {
    uint64_t v26 = *(void *)v43;
    v27 = v6;
    v28 = v5;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v6);
        }
        uint64_t v31 = v7;
        uint64_t v33 = *(void *)(*((void *)&v42 + 1) + 8 * v7);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](v29->_homeManager, "homes", v26));
        id v8 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          while (2)
          {
            v11 = 0LL;
            do
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              v14 = (void *)objc_claimAutoreleasedReturnValue([v12 users]);
              id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v35;
                do
                {
                  v18 = 0LL;
                  do
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    [v13 addObject:v19];

                    v18 = (char *)v18 + 1;
                  }

                  while (v16 != v18);
                  id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }

                while (v16);
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue([v12 currentUser]);
              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue([v12 currentUser]);
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueIdentifier]);
                [v13 addObject:v22];
              }

              unsigned __int8 v23 = [v13 containsObject:v33];

              if ((v23 & 1) != 0)
              {

                id v5 = v28;
                goto LABEL_25;
              }

              v11 = (char *)v11 + 1;
            }

            while (v11 != v9);
            id v9 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v5 = v28;
        [v28 addObject:v33];
LABEL_25:
        uint64_t v7 = v31 + 1;
        id v6 = v27;
      }

      while ((id)(v31 + 1) != v30);
      id v30 = [v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v30);
  }

  if ([v5 count])
  {
    id v24 = [v6 mutableCopy];
    [v24 removeObjectsInArray:v5];
  }

  else
  {
    id v24 = v6;
  }

  return v24;
}

- (void)resetHomeKitUserIdentifiers
{
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  self->_homeKitCurrentUserIDs = 0LL;
}

- (id)homeHubDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  -[RPHomeKitManager _setupHome](self, "_setupHome");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager currentHome](self, "currentHome"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryWithSiriEndpointIdentifier:v4]);

  return v6;
}

- (BOOL)personalRequestsStateForAccessory:(id)a3
{
  id v4 = a3;
  -[RPHomeKitManager _setupHome](self, "_setupHome");
  currentUser = self->_currentUser;
  if (currentUser)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[HMUser assistantAccessControlForHome:]( currentUser,  "assistantAccessControlForHome:",  self->_currentHome));
    if ([v6 isEnabled])
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessories", 0));
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) siriEndpointIdentifier]);
            unsigned __int8 v12 = [v11 isEqual:v4];

            if ((v12 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_15;
            }
          }

          id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

- (void)setCurrentUser:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  p_currentUser = &self->_currentUser;
  if (!self->_currentUser
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMUser uniqueIdentifier](*p_currentUser, "uniqueIdentifier")),
        unsigned __int8 v8 = [v6 isEqual:v7],
        v7,
        v6,
        uint64_t v9 = v11,
        (v8 & 1) == 0))
  {
    if (dword_100131E30 <= 30
      && (dword_100131E30 != -1 || _LogCategory_Initialize(&dword_100131E30, 30LL)))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
      LogPrintF(&dword_100131E30, "-[RPHomeKitManager setCurrentUser:]", 30LL, "Set current HomeKit user to %@", v10);
    }

    if (*p_currentUser) {
      -[HMUser setDelegate:](*p_currentUser, "setDelegate:", 0LL);
    }
    objc_storeStrong((id *)&self->_currentUser, a3);
    -[HMUser setDelegate:](self->_currentUser, "setDelegate:", self);
    uint64_t v9 = v11;
  }
}

- (void)setCurrentHome:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = v7;
  if (!self->_currentHome)
  {
    if (dword_100131E30 <= 30
      && (dword_100131E30 != -1 || _LogCategory_Initialize(&dword_100131E30, 30LL)))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      LogPrintF(&dword_100131E30, "-[RPHomeKitManager setCurrentHome:]", 30LL, "Set current HomeKit Home to '%@'\n", v6);
    }

    objc_storeStrong((id *)&self->_currentHome, a3);
    -[HMHome setDelegate:](self->_currentHome, "setDelegate:", self);
    id v5 = v7;
  }
}

- (void)_setupHome
{
  if (!self->_currentUser || !self->_currentHome)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned __int8 v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentUser]);

          if (v9)
          {
            -[RPHomeKitManager setCurrentHome:](self, "setCurrentHome:", v8);
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 currentUser]);
            -[RPHomeKitManager setCurrentUser:](self, "setCurrentUser:", v10);

            goto LABEL_13;
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  homeManager = self->_homeManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100052D64;
  v9[3] = &unk_100112D80;
  id v10 = v6;
  id v8 = v6;
  -[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:]( homeManager,  "currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:",  a3,  v9);
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052F5C;
  block[3] = &unk_100111708;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siriEndpointProfile]);

  if (v9)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000530E8;
    block[3] = &unk_100111708;
    block[4] = self;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(dispatchQueue, block);
  }
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)mediaGroupsChangedHandler
{
  return self->_mediaGroupsChangedHandler;
}

- (void)setMediaGroupsChangedHandler:(id)a3
{
}

- (id)personalRequestsStateChangedHandler
{
  return self->_personalRequestsStateChangedHandler;
}

- (void)setPersonalRequestsStateChangedHandler:(id)a3
{
}

- (id)roomUpdatedHandler
{
  return self->_roomUpdatedHandler;
}

- (void)setRoomUpdatedHandler:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (NSArray)homeKitCurrentUserIDs
{
  return self->_homeKitCurrentUserIDs;
}

- (void)setHomeKitCurrentUserIDs:(id)a3
{
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (void).cxx_destruct
{
}

@end