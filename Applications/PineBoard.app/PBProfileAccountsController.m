@interface PBProfileAccountsController
- (PBProfileAccountsController)initWithProfileStoreSnapshotProvider:(id)a3 delegate:(id)a4;
- (void)_activateITunesAccountWithProfile:(id)a3;
- (void)_addUserWithITunesAltDSID:(id)a3 isPrimary:(BOOL)a4 personaUniqueString:(id)a5;
- (void)_assignITunesAltDSID:(id)a3 toProfile:(id)a4;
- (void)_deactivateCurrentlyActiveITunesAccount;
- (void)_didAddITunesAccountWithAccountIdentifier:(id)a3;
- (void)_didRemoveGameCenterAccountWithAltDSID:(id)a3;
- (void)_didRemoveICloudAccountWithAltDSID:(id)a3;
- (void)_didRemoveITunesAccountWithAltDSID:(id)a3;
- (void)_endIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)_handleProfileAccountNotification:(id)a3;
- (void)_lock_acquireSuppressAccountEventAssertion;
- (void)_notifyDelegateDidHandleAccountNotifications;
- (void)_processPendingAccountNotifications;
- (void)_removeOrphanAccountsWithProfileStoreSnapshot:(id)a3;
- (void)_removeOrphanPersonasWithProfileStoreSnapshot:(id)a3;
- (void)_removePersonaWithPersonaUniqueIdentifier:(id)a3 isActiveProfile:(BOOL)a4 completion:(id)a5;
- (void)_updateProfilesWithContexts:(id)a3;
- (void)_validateAndFixActiveITunesAccount;
- (void)activateITunesAccountWithProfile:(id)a3;
- (void)beginIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)deactivateCurrentlyActiveITunesAccount;
- (void)endAllIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)endIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)handleProfileAccountNotification:(id)a3;
- (void)removeOrphanAccountsAndPersonas;
- (void)validateAndFixActiveITunesAccount;
@end

@implementation PBProfileAccountsController

- (PBProfileAccountsController)initWithProfileStoreSnapshotProvider:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBProfileAccountsController;
  v8 = -[PBProfileAccountsController init](&v16, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v8->_lock;
    v8->_lock = v9;

    objc_storeWeak((id *)&v8->_snapshotProvider, v6);
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v8->_accountStore;
    v8->_accountStore = (ACAccountStore *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    lock_ignoringProfileAccountNotificationsReasons = v8->_lock_ignoringProfileAccountNotificationsReasons;
    v8->_lock_ignoringProfileAccountNotificationsReasons = v13;
  }

  return v8;
}

- (void)removeOrphanAccountsAndPersonas
{
  if ((_os_feature_enabled_impl("UserProfiles", "accountEventHandling") & 1) == 0)
  {
    id v3 = sub_1001D3A8C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[PBProfileAccountsController removeOrphanAccountsAndPersonas]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Starting async work to find and remove orphaned accounts and personas.",  (uint8_t *)&v7,  0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

    -[PBProfileAccountsController _removeOrphanAccountsWithProfileStoreSnapshot:]( self,  "_removeOrphanAccountsWithProfileStoreSnapshot:",  v6);
    -[PBProfileAccountsController _removeOrphanPersonasWithProfileStoreSnapshot:]( self,  "_removeOrphanPersonasWithProfileStoreSnapshot:",  v6);
  }

- (void)validateAndFixActiveITunesAccount
{
}

- (void)activateITunesAccountWithProfile:(id)a3
{
}

- (void)deactivateCurrentlyActiveITunesAccount
{
}

- (void)beginIgnoringProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Begin ignoring profile account notifications. {reason=%@}",  (uint8_t *)&v9,  0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSCountedSet addObject:](self->_lock_ignoringProfileAccountNotificationsReasons, "addObject:", v4);
  if (_os_feature_enabled_impl("UserProfiles", "accountEventHandling")
    && -[NSCountedSet count](self->_lock_ignoringProfileAccountNotificationsReasons, "count") == (id)1)
  {
    -[PBProfileAccountsController _lock_acquireSuppressAccountEventAssertion]( self,  "_lock_acquireSuppressAccountEventAssertion");
  }

  if (!self->_lock_pendingProfileAccountNotifications)
  {
    int v7 = objc_alloc_init(&OBJC_CLASS___PBAccountNotificationCoalescingQueue);
    lock_pendingProfileAccountNotifications = self->_lock_pendingProfileAccountNotifications;
    self->_lock_pendingProfileAccountNotifications = v7;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)endIgnoringProfileAccountNotificationsWithReason:(id)a3
{
}

- (void)endAllIgnoringProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Ending all ignoring profile account notifications. {reason=%@}",  (uint8_t *)&v9,  0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  NSUInteger v7 = -[NSCountedSet countForObject:](self->_lock_ignoringProfileAccountNotificationsReasons, "countForObject:", v4);
  if (v7)
  {
    NSUInteger v8 = v7;
    do
    {
      -[PBProfileAccountsController _endIgnoringProfileAccountNotificationsWithReason:]( self,  "_endIgnoringProfileAccountNotificationsWithReason:",  v4);
      --v8;
    }

    while (v8);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)handleProfileAccountNotification:(id)a3
{
  id v4 = (NSCountedSet *)a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received handle profile account notification request. {notification=%@}",  buf,  0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSCountedSet count](self->_lock_ignoringProfileAccountNotificationsReasons, "count"))
  {
    lock_pendingProfileAccountNotifications = self->_lock_pendingProfileAccountNotifications;
    if (!lock_pendingProfileAccountNotifications)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_lock_pendingProfileAccountNotifications != nil"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10028FE94();
      }
      _bs_set_crash_log_message([v11 UTF8String]);
      __break(0);
      JUMPOUT(0x1001D3EECLL);
    }

    -[PBAccountNotificationCoalescingQueue addNotification:]( lock_pendingProfileAccountNotifications,  "addNotification:",  v4);
    id v8 = sub_1001D3A8C();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      lock_ignoringProfileAccountNotificationsReasons = self->_lock_ignoringProfileAccountNotificationsReasons;
      *(_DWORD *)buf = 138412546;
      v13 = lock_ignoringProfileAccountNotificationsReasons;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring user profile account notification request, notification queued. {reasons=%@, notification=%@}",  buf,  0x16u);
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[PBProfileAccountsController _handleProfileAccountNotification:](self, "_handleProfileAccountNotification:", v4);
    -[PBProfileAccountsController _notifyDelegateDidHandleAccountNotifications]( self,  "_notifyDelegateDidHandleAccountNotifications");
  }
}

- (void)_lock_acquireSuppressAccountEventAssertion
{
  if (!self->_lock_suppressAccountEventAssertion)
  {
    id v3 = sub_1001D3A8C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)NSUInteger v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Taking UserProfiles suppress account change event handling assertion",  v7,  2u);
    }

    id v5 = -[UPSuppressAccountChangeEventHandlingAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___UPSuppressAccountChangeEventHandlingAssertion),  "initWithReason:",  @"PineBoard");
    lock_suppressAccountEventAssertion = self->_lock_suppressAccountEventAssertion;
    self->_lock_suppressAccountEventAssertion = v5;
  }

- (void)_handleProfileAccountNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[PBProfileAccountsController _handleProfileAccountNotification:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Handling profile account notification. {notification=%@}",  (uint8_t *)&v17,  0x16u);
  }

  if ([v4 type] != (id)3)
  {
    if (_os_feature_enabled_impl("UserProfiles", "accountEventHandling"))
    {
      id v7 = sub_1001D3A8C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        v18 = "-[PBProfileAccountsController _handleProfileAccountNotification:]";
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Ignoring user profile account notification as UserProfiles is handling these events. {notification=%@}",  (uint8_t *)&v17,  0x16u);
      }

- (void)_didRemoveICloudAccountWithAltDSID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"iCloudAltDSID != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028FFB4();
    }
    _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D4680LL);
  }

  id v5 = v4;
  id v6 = sub_1001D3A8C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[PBProfileAccountsController _didRemoveICloudAccountWithAltDSID:]";
    __int16 v35 = 2160;
    uint64_t v36 = 1752392040LL;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Handling did remove iCloud account notification. {iCloudAltDSID=%{mask.hash}@}",  buf,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 profileForiCloudAltDSID:v5]);
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 iTunesAltDSID]);
    if (v12)
    {
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 gameCenterAltDSID]);

      if (!v16)
      {
        id v26 = sub_1001D3A8C();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pb_identityLogString"));
          *(_DWORD *)buf = 136315906;
          v34 = "-[PBProfileAccountsController _didRemoveICloudAccountWithAltDSID:]";
          __int16 v35 = 2114;
          uint64_t v36 = (uint64_t)v28;
          __int16 v37 = 2160;
          uint64_t v38 = 1752392040LL;
          __int16 v39 = 2112;
          v40 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: Profile does *not* contain an iTunes or game center account. Will remove the profile. {identity=%{public }@, iCloudAltDSID=%{mask.hash}@",  buf,  0x2Au);
        }

        v29 = objc_alloc(&OBJC_CLASS___UPRemoveProfileRequest);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
        v23 = -[UPRemoveProfileRequest initWithProfileIdentity:](v29, "initWithProfileIdentity:", v30);

        v24 = -[_PBProfileUpdateContext initWithProfile:removeRequest:]( objc_alloc(&OBJC_CLASS____PBProfileUpdateContext),  "initWithProfile:removeRequest:",  v11,  v23);
        goto LABEL_13;
      }
    }

    id v17 = sub_1001D3A8C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pb_identityLogString"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 iTunesAltDSID]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 gameCenterAltDSID]);
      *(_DWORD *)buf = 136316930;
      v34 = "-[PBProfileAccountsController _didRemoveICloudAccountWithAltDSID:]";
      __int16 v35 = 2114;
      uint64_t v36 = (uint64_t)v19;
      __int16 v37 = 2160;
      uint64_t v38 = 1752392040LL;
      __int16 v39 = 2112;
      v40 = v5;
      __int16 v41 = 2160;
      uint64_t v42 = 1752392040LL;
      __int16 v43 = 2112;
      v44 = v20;
      __int16 v45 = 2160;
      uint64_t v46 = 1752392040LL;
      __int16 v47 = 2112;
      v48 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Profile contains an iTunes and/or game center account. Will remove the iCloud AltDSID from the profile. {ide ntity=%{public}@, iCloudAltDSID=%{mask.hash}@, iTunesAltDSID=%{mask.hash}@, gameCenterAltDSID=%{mask.hash}@}",  buf,  0x52u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
    v23 = (UPRemoveProfileRequest *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest updateRequestForProfileIdentity:iCloudAltDSID:]( &OBJC_CLASS___UPUpdateProfileRequest,  "updateRequestForProfileIdentity:iCloudAltDSID:",  v22,  0LL));

    v24 = -[_PBProfileUpdateContext initWithProfile:updateRequest:]( objc_alloc(&OBJC_CLASS____PBProfileUpdateContext),  "initWithProfile:updateRequest:",  v11,  v23);
LABEL_13:
    __int16 v14 = (os_log_s *)v24;

    v32 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    -[PBProfileAccountsController _updateProfilesWithContexts:](self, "_updateProfilesWithContexts:", v25);

    goto LABEL_14;
  }

  id v13 = sub_1001D3A8C();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10029005C((uint64_t)v5, v14, v15);
  }
LABEL_14:
}

- (void)_didRemoveGameCenterAccountWithAltDSID:(id)a3
{
  id v56 = a3;
  if (!v56)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"gameCenterAltDSID != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002900F0();
    }
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D4C28LL);
  }

  id v4 = sub_1001D3A8C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v62 = "-[PBProfileAccountsController _didRemoveGameCenterAccountWithAltDSID:]";
    __int16 v63 = 2160;
    uint64_t v64 = 1752392040LL;
    __int16 v65 = 2112;
    uint64_t v66 = (uint64_t)v56;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Handling did remove game center account notification. {gameCenterAltDSID=%{mask.hash}@}",  buf,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

  if (v7)
  {
    v52 = v7;
    v53 = self;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 profilesForGameCenterAltDSID:v56]);
    id v9 = sub_1001D3A8C();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 count];
      *(_DWORD *)buf = 136315906;
      v62 = "-[PBProfileAccountsController _didRemoveGameCenterAccountWithAltDSID:]";
      __int16 v63 = 2048;
      uint64_t v64 = (uint64_t)v11;
      __int16 v65 = 2160;
      uint64_t v66 = 1752392040LL;
      __int16 v67 = 2112;
      id v68 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Found %lu profiles containing the game center AltDSID. {gameCenterAltDSID=%{mask.hash}@}",  buf,  0x2Au);
    }

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v57 objects:v77 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v58;
      p_cache = (objc_class *)&OBJC_CLASS___PBSuggestedUserProfileManagerServiceListener.cache;
      v18 = &OBJC_CLASS___TVSUIGradientView_ptr;
      uint64_t v54 = *(void *)v58;
      do
      {
        __int16 v19 = 0LL;
        id v55 = v15;
        do
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v13);
          }
          id v20 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 iTunesAltDSID]);
          if (v21)
          {

LABEL_15:
            id v23 = sub_1001D3A8C();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pb_identityLogString"));
              id v26 = v12;
              v27 = p_cache;
              id v28 = v13;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v20 iCloudAltDSID]);
              v30 = v18;
              v31 = (void *)objc_claimAutoreleasedReturnValue([v20 iTunesAltDSID]);
              *(_DWORD *)buf = 136316930;
              v62 = "-[PBProfileAccountsController _didRemoveGameCenterAccountWithAltDSID:]";
              __int16 v63 = 2114;
              uint64_t v64 = (uint64_t)v25;
              __int16 v65 = 2160;
              uint64_t v66 = 1752392040LL;
              __int16 v67 = 2112;
              id v68 = v56;
              __int16 v69 = 2160;
              uint64_t v70 = 1752392040LL;
              __int16 v71 = 2112;
              v72 = v29;
              __int16 v73 = 2160;
              uint64_t v74 = 1752392040LL;
              __int16 v75 = 2112;
              v76 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Profile contains an iCloud and/or iTunes account. Will remove the game center AltDSID from the profi le. {identity=%{public}@, gameCenterAltDSID=%{mask.hash}@, iCloudAltDSID=%{mask.hash}@, iTunesAltDSID=%{mask.hash}@}",  buf,  0x52u);

              v18 = v30;
              id v13 = v28;
              p_cache = v27;
              v12 = v26;
              uint64_t v16 = v54;
              id v15 = v55;
            }

            v32 = v18[108];
            v33 = (void *)objc_claimAutoreleasedReturnValue([v20 identity]);
            v34 = (UPRemoveProfileRequest *)objc_claimAutoreleasedReturnValue( [v32 updateRequestForProfileIdentity:v33 gameCenterAltDSID:0]);

            id v35 = [objc_alloc(p_cache + 408) initWithProfile:v20 updateRequest:v34];
            goto LABEL_18;
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue([v20 iCloudAltDSID]);

          if (v22) {
            goto LABEL_15;
          }
          id v37 = sub_1001D3A8C();
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pb_identityLogString"));
            *(_DWORD *)buf = 136315906;
            v62 = "-[PBProfileAccountsController _didRemoveGameCenterAccountWithAltDSID:]";
            __int16 v63 = 2114;
            uint64_t v64 = (uint64_t)v39;
            __int16 v65 = 2160;
            uint64_t v66 = 1752392040LL;
            __int16 v67 = 2112;
            id v68 = v56;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s: Profile does *not* contain an iCloud or iTunes account. Will remove the profile. {identity=%{public}@, gameCenterAltDSID=%{mask.hash}@",  buf,  0x2Au);
          }

          v40 = objc_alloc(&OBJC_CLASS___UPRemoveProfileRequest);
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v20 identity]);
          v34 = -[UPRemoveProfileRequest initWithProfileIdentity:](v40, "initWithProfileIdentity:", v41);

          id v35 = [objc_alloc(p_cache + 408) initWithProfile:v20 removeRequest:v34];
LABEL_18:
          uint64_t v36 = v35;
          -[NSMutableArray addObject:](v12, "addObject:", v35);

          __int16 v19 = (char *)v19 + 1;
        }

        while (v15 != v19);
        id v42 = [v13 countByEnumeratingWithState:&v57 objects:v77 count:16];
        id v15 = v42;
      }

      while (v42);
    }

    -[PBProfileAccountsController _updateProfilesWithContexts:](v53, "_updateProfilesWithContexts:", v12);
    id v7 = v52;
  }

  else
  {
    id v43 = sub_1001D3A8C();
    id v13 = (id)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_100290198((os_log_s *)v13, v44, v45, v46, v47, v48, v49, v50);
    }
  }
}

- (void)_didRemoveITunesAccountWithAltDSID:(id)a3
{
  id v56 = a3;
  if (!v56)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"iTunesAltDSID != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100290208();
    }
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D51D0LL);
  }

  id v4 = sub_1001D3A8C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v62 = "-[PBProfileAccountsController _didRemoveITunesAccountWithAltDSID:]";
    __int16 v63 = 2160;
    uint64_t v64 = 1752392040LL;
    __int16 v65 = 2112;
    uint64_t v66 = (uint64_t)v56;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Handling did remove iTunes account notification. {iTunesAltDSID=%{mask.hash}@}",  buf,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

  if (v7)
  {
    v52 = v7;
    v53 = self;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 profilesForiTunesAltDSID:v56]);
    id v9 = sub_1001D3A8C();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 count];
      *(_DWORD *)buf = 136315906;
      v62 = "-[PBProfileAccountsController _didRemoveITunesAccountWithAltDSID:]";
      __int16 v63 = 2048;
      uint64_t v64 = (uint64_t)v11;
      __int16 v65 = 2160;
      uint64_t v66 = 1752392040LL;
      __int16 v67 = 2112;
      id v68 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Found %lu profiles containing the iTunes AltDSID. {iTunesAltDSID=%{mask.hash}@}",  buf,  0x2Au);
    }

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v57 objects:v77 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v58;
      p_cache = (objc_class *)&OBJC_CLASS___PBSuggestedUserProfileManagerServiceListener.cache;
      v18 = &OBJC_CLASS___TVSUIGradientView_ptr;
      uint64_t v54 = *(void *)v58;
      do
      {
        __int16 v19 = 0LL;
        id v55 = v15;
        do
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v13);
          }
          id v20 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 iCloudAltDSID]);
          if (v21)
          {

LABEL_15:
            id v23 = sub_1001D3A8C();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pb_identityLogString"));
              id v26 = v12;
              v27 = p_cache;
              id v28 = v13;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v20 iCloudAltDSID]);
              v30 = v18;
              v31 = (void *)objc_claimAutoreleasedReturnValue([v20 gameCenterAltDSID]);
              *(_DWORD *)buf = 136316930;
              v62 = "-[PBProfileAccountsController _didRemoveITunesAccountWithAltDSID:]";
              __int16 v63 = 2114;
              uint64_t v64 = (uint64_t)v25;
              __int16 v65 = 2160;
              uint64_t v66 = 1752392040LL;
              __int16 v67 = 2112;
              id v68 = v56;
              __int16 v69 = 2160;
              uint64_t v70 = 1752392040LL;
              __int16 v71 = 2112;
              v72 = v29;
              __int16 v73 = 2160;
              uint64_t v74 = 1752392040LL;
              __int16 v75 = 2112;
              v76 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Profile contains an iCloud and/or game center account. Will remove the iTunes AltDSID from the profi le. {identity=%{public}@, iTunesAltDSID=%{mask.hash}@, iCloudAltDSID=%{mask.hash}@, gameCenterAltDSID=%{mask.hash}@}",  buf,  0x52u);

              v18 = v30;
              id v13 = v28;
              p_cache = v27;
              v12 = v26;
              uint64_t v16 = v54;
              id v15 = v55;
            }

            v32 = v18[108];
            v33 = (void *)objc_claimAutoreleasedReturnValue([v20 identity]);
            v34 = (UPRemoveProfileRequest *)objc_claimAutoreleasedReturnValue( [v32 updateRequestForProfileIdentity:v33 iTunesAltDSID:0]);

            id v35 = [objc_alloc(p_cache + 408) initWithProfile:v20 updateRequest:v34];
            goto LABEL_18;
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue([v20 gameCenterAltDSID]);

          if (v22) {
            goto LABEL_15;
          }
          id v37 = sub_1001D3A8C();
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pb_identityLogString"));
            *(_DWORD *)buf = 136315906;
            v62 = "-[PBProfileAccountsController _didRemoveITunesAccountWithAltDSID:]";
            __int16 v63 = 2114;
            uint64_t v64 = (uint64_t)v39;
            __int16 v65 = 2160;
            uint64_t v66 = 1752392040LL;
            __int16 v67 = 2112;
            id v68 = v56;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s: Profile does *not* contain an iCloud or game center account. Will remove the profile. {identity=%{publ ic}@, iTunesAltDSID=%{mask.hash}@",  buf,  0x2Au);
          }

          v40 = objc_alloc(&OBJC_CLASS___UPRemoveProfileRequest);
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v20 identity]);
          v34 = -[UPRemoveProfileRequest initWithProfileIdentity:](v40, "initWithProfileIdentity:", v41);

          id v35 = [objc_alloc(p_cache + 408) initWithProfile:v20 removeRequest:v34];
LABEL_18:
          uint64_t v36 = v35;
          -[NSMutableArray addObject:](v12, "addObject:", v35);

          __int16 v19 = (char *)v19 + 1;
        }

        while (v15 != v19);
        id v42 = [v13 countByEnumeratingWithState:&v57 objects:v77 count:16];
        id v15 = v42;
      }

      while (v42);
    }

    -[PBProfileAccountsController _updateProfilesWithContexts:](v53, "_updateProfilesWithContexts:", v12);
    id v7 = v52;
  }

  else
  {
    id v43 = sub_1001D3A8C();
    id v13 = (id)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_1002902B0((os_log_s *)v13, v44, v45, v46, v47, v48, v49, v50);
    }
  }
}

- (void)_didAddITunesAccountWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = 138543362;
    id v52 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling did add iTunes account notification. {accountIdentifier=%{public}@}",  (uint8_t *)&v51,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", v4));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_altDSID"));
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_homeUserAllIdentifiers"));
    id v11 = [v10 count];

    if (v11)
    {
      id v12 = sub_100084680();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = 138543874;
        id v52 = v4;
        __int16 v53 = 2160;
        uint64_t v54 = 1752392040LL;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v9;
        id v14 = "Skipping did add iTunes account notification, hidden/home account. {accountIdentifier=%{public}@, iTunesAl"
              "tDSID=%{mask.hash}@}";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v51, 0x20u);
        goto LABEL_34;
      }

      goto LABEL_34;
    }

    id v16 = sub_1001D3A8C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v51 = 138543874;
      id v52 = v4;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040LL;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Found added iTunes account. {accountIdentifier=%{public}@, iTunesAltDSID=%{mask.hash}@}",  (uint8_t *)&v51,  0x20u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

    if (v13)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s profiles](v13, "profiles"));
      id v20 = [v19 count];

      if (!v20)
      {
        id v39 = sub_1001D3A8C();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          int v51 = 138543874;
          id v52 = v4;
          __int16 v53 = 2160;
          uint64_t v54 = 1752392040LL;
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Creating new primary user for added iTunes account. {accountIdentifier=%{public}@, iTunesAltDSID=%{mask.hash}@}",  (uint8_t *)&v51,  0x20u);
        }

        -[PBProfileAccountsController _addUserWithITunesAltDSID:isPrimary:personaUniqueString:]( self,  "_addUserWithITunesAltDSID:isPrimary:personaUniqueString:",  v9,  1LL,  0LL);
        goto LABEL_34;
      }

      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[os_log_s activeProfile](v13, "activeProfile"));
      if (v21
        && (v22 = (void *)v21,
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeProfile](v13, "activeProfile")),
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 iTunesAltDSID]),
            v24,
            v23,
            v22,
            !v24))
      {
        id v41 = sub_1001D3A8C();
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeProfile](v13, "activeProfile"));
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pb_identityLogString"));
          int v51 = 138544130;
          id v52 = v44;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v4;
          __int16 v55 = 2160;
          uint64_t v56 = 1752392040LL;
          __int16 v57 = 2112;
          __int128 v58 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Assigning added iTunes account to the current user. {identity=%{public}@, accountIdentifier=%{public}@, iTun esAltDSID=%{mask.hash}@}",  (uint8_t *)&v51,  0x2Au);
        }

        uint64_t v45 = objc_claimAutoreleasedReturnValue(-[os_log_s activeProfile](v13, "activeProfile"));
      }

      else
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue(-[os_log_s primaryProfile](v13, "primaryProfile"));
        if (!v25
          || (id v26 = (void *)v25,
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s primaryProfile](v13, "primaryProfile")),
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 iTunesAltDSID]),
              v28,
              v27,
              v26,
              v28))
        {
          id v29 = sub_1001D3A8C();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            int v51 = 138543874;
            id v52 = v4;
            __int16 v53 = 2160;
            uint64_t v54 = 1752392040LL;
            __int16 v55 = 2112;
            uint64_t v56 = (uint64_t)v9;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Nothing to do with added iTunes account. {accountIdentifier=%{public}@, iTunesAltDSID=%{mask.hash}@}",  (uint8_t *)&v51,  0x20u);
          }

- (void)_addUserWithITunesAltDSID:(id)a3 isPrimary:(BOOL)a4 personaUniqueString:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"iTunesAltDSID != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100290390();
    }
    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D58E8LL);
  }

  unsigned int v10 = v9;
  id v11 = objc_alloc_init(&OBJC_CLASS___UPAddProfileRequest);
  -[UPAddProfileRequest setPrimary:](v11, "setPrimary:", v6);
  -[UPAddProfileRequest setITunesAltDSID:](v11, "setITunesAltDSID:", v8);
  -[UPAddProfileRequest setPersonaUniqueIdentifier:](v11, "setPersonaUniqueIdentifier:", v10);
  id v12 = -[_PBProfileUpdateContext initWithAddRequest:]( objc_alloc(&OBJC_CLASS____PBProfileUpdateContext),  "initWithAddRequest:",  v11);
  id v15 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  -[PBProfileAccountsController _updateProfilesWithContexts:](self, "_updateProfilesWithContexts:", v13);
}

- (void)_assignITunesAltDSID:(id)a3 toProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iTunesAltDSID]);

  if (v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[profile iTunesAltDSID] == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100290438();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D5A68LL);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest updateRequestForProfileIdentity:iTunesAltDSID:]( &OBJC_CLASS___UPUpdateProfileRequest,  "updateRequestForProfileIdentity:iTunesAltDSID:",  v9,  v6));

  id v11 = -[_PBProfileUpdateContext initWithProfile:updateRequest:]( objc_alloc(&OBJC_CLASS____PBProfileUpdateContext),  "initWithProfile:updateRequest:",  v7,  v10);
  id v14 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  -[PBProfileAccountsController _updateProfilesWithContexts:](self, "_updateProfilesWithContexts:", v12);
}

- (void)_updateProfilesWithContexts:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_compactMap:", &stru_1003DC088));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_compactMap:", &stru_1003DC0C8));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_compactMap:", &stru_1003DC108));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1003DC148));
    if (![v5 count] && !objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[addProfileRequests count] > 0 || [updateProfileRequests count] > 0 || [removeProfileRequests count] > 0"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002904E0();
      }
      _bs_set_crash_log_message([v28 UTF8String]);
      __break(0);
      JUMPOUT(0x1001D5E24LL);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
    id v37 = 0LL;
    unsigned int v10 = [WeakRetained updateWithAddProfileRequests:v5 updateProfileRequests:v6 removeProfileRequests:v7 error:&v37];
    id v11 = v37;

    id v12 = sub_1001D3A8C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v13;
    if (v10)
    {
      id v32 = v11;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v5 count];
        id v15 = [v6 count];
        id v16 = v7;
        id v17 = [v7 count];
        v18 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@","]);
        *(_DWORD *)buf = 136316162;
        v40 = "-[PBProfileAccountsController _updateProfilesWithContexts:]";
        __int16 v41 = 2048;
        id v42 = v30;
        __int16 v43 = 2048;
        id v44 = v15;
        __int16 v45 = 2048;
        id v46 = v17;
        id v7 = v16;
        __int16 v47 = 2114;
        uint64_t v48 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully added %lu, updated %lu, and removed %lu profiles. {identities=%{public}@}",  buf,  0x34u);

        id v11 = v32;
      }

      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v14 = (os_log_s *)v4;
      id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      if (v19)
      {
        id v20 = v19;
        id v29 = v8;
        id v31 = v7;
        uint64_t v21 = *(void *)v34;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v14);
            }
            id v23 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 removeRequest]);

            if (v24)
            {
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 profile]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 personaUniqueIdentifier]);

              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue([v25 personaUniqueIdentifier]);
                -[PBProfileAccountsController _removePersonaWithPersonaUniqueIdentifier:isActiveProfile:completion:]( self,  "_removePersonaWithPersonaUniqueIdentifier:isActiveProfile:completion:",  v27,  [v25 isActive],  0);
              }
            }
          }

          id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
        }

        while (v20);
        id v8 = v29;
        id v7 = v31;
        id v11 = v32;
      }
    }

    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_100290588(v8, (uint64_t)v11, v14);
    }
  }
}

- (void)_processPendingAccountNotifications
{
  lock_pendingProfileAccountNotifications = self->_lock_pendingProfileAccountNotifications;
  if (!lock_pendingProfileAccountNotifications)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_lock_pendingProfileAccountNotifications != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10029063C();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D60ACLL);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBAccountNotificationCoalescingQueue coalescedNotifications]( lock_pendingProfileAccountNotifications,  "coalescedNotifications"));
  id v5 = self->_lock_pendingProfileAccountNotifications;
  self->_lock_pendingProfileAccountNotifications = 0LL;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  id v6 = sub_1001D3A8C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v20 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processing pending profile account notifications. {pendingCount=%ld}",  buf,  0xCu);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[PBProfileAccountsController _handleProfileAccountNotification:]( self,  "_handleProfileAccountNotification:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12));
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  -[PBProfileAccountsController _notifyDelegateDidHandleAccountNotifications]( self,  "_notifyDelegateDidHandleAccountNotifications");
}

- (void)_notifyDelegateDidHandleAccountNotifications
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "profileAccountsControllerDidHandleAllAccountNotifications:");

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 profileAccountsControllerDidHandleAllAccountNotifications:self];
  }

- (void)_endIgnoringProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001D3A8C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "End ignoring profile account notifications. {reason=%@}",  (uint8_t *)&v15,  0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  id v7 = -[NSCountedSet count](self->_lock_ignoringProfileAccountNotificationsReasons, "count");
  -[NSCountedSet removeObject:](self->_lock_ignoringProfileAccountNotificationsReasons, "removeObject:", v4);
  id v8 = -[NSCountedSet count](self->_lock_ignoringProfileAccountNotificationsReasons, "count");
  if (!v8 && self->_lock_suppressAccountEventAssertion)
  {
    id v9 = sub_1001D3A8C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Relinquishing UserProfiles suppress account change event handling assertion",  (uint8_t *)&v15,  2u);
    }

    -[UPSuppressAccountChangeEventHandlingAssertion invalidate](self->_lock_suppressAccountEventAssertion, "invalidate");
    lock_suppressAccountEventAssertion = self->_lock_suppressAccountEventAssertion;
    self->_lock_suppressAccountEventAssertion = 0LL;
  }

  id v12 = -[NSCountedSet copy](self->_lock_ignoringProfileAccountNotificationsReasons, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (!v7 || v8)
  {
    id v13 = sub_1001D3A8C();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1002906E4((uint64_t)v12, v14);
    }
  }

  else
  {
    -[PBProfileAccountsController _processPendingAccountNotifications](self, "_processPendingAccountNotifications");
    -[PBProfileAccountsController _validateAndFixActiveITunesAccount](self, "_validateAndFixActiveITunesAccount");
  }
}

- (void)_removePersonaWithPersonaUniqueIdentifier:(id)a3 isActiveProfile:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"personaUniqueIdentifier != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100290754();
    }
    _bs_set_crash_log_message([v26 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D657CLL);
  }

  id v10 = v9;
  id v11 = sub_100084680();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = sub_1001D3A8C();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "remove persona",  "",  buf,  2u);
  }

  id v17 = sub_1001D3A8C();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v34 = "-[PBProfileAccountsController _removePersonaWithPersonaUniqueIdentifier:isActiveProfile:completion:]";
    __int16 v35 = 2160;
    uint64_t v36 = 1752392040LL;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Removing persona. {personaUniqueIdentifier=%{mask.hash}@}",  buf,  0x20u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001D6584;
  v31[3] = &unk_1003D0048;
  id v32 = v10;
  id v19 = v10;
  id v20 = objc_retainBlock(v31);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001D65A4;
  v27[3] = &unk_1003D6090;
  id v21 = v8;
  id v28 = v21;
  id v29 = v20;
  os_signpost_id_t v30 = v13;
  v22 = v20;
  id v23 = objc_retainBlock(v27);
  v24 = v23;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained profileAccountsController:self quitApplicationsRunningWithPersonaUniqueString:v21 completion:v24];
  }

  else
  {
    ((void (*)(void *))v23[2])(v23);
  }
}

- (void)_activateITunesAccountWithProfile:(id)a3
{
  id v4 = a3;
  accountStore = self->_accountStore;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesAltDSID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_iTunesAccountWithAltDSID:](accountStore, "ams_iTunesAccountWithAltDSID:", v6));

  id v8 = sub_1001D3A8C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pb_identityLogString"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesAltDSID]);
      int v15 = 136315906;
      id v16 = "-[PBProfileAccountsController _activateITunesAccountWithProfile:]";
      __int16 v17 = 2114;
      v18 = v11;
      __int16 v19 = 2160;
      uint64_t v20 = 1752392040LL;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Saving iTunes account. {identity=%{public}@, iTunesAltDSID=%{mask.hash}@}",  (uint8_t *)&v15,  0x2Au);
    }

    [v7 setActive:1];
    os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_saveAccount:](self->_accountStore, "ams_saveAccount:", v7));
    [v13 addSuccessBlock:&stru_1003DC168];
    [v13 addErrorBlock:&stru_1003DC188];
  }

  else
  {
    if (v10)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pb_identityLogString"));
      int v15 = 136315394;
      id v16 = "-[PBProfileAccountsController _activateITunesAccountWithProfile:]";
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: No iTunes account for the profile, deactivating the active iTunes account. {identity=%{public}@}",  (uint8_t *)&v15,  0x16u);
    }

    -[PBProfileAccountsController _deactivateCurrentlyActiveITunesAccount]( self,  "_deactivateCurrentlyActiveITunesAccount");
  }
}

- (void)_deactivateCurrentlyActiveITunesAccount
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_activeiTunesAccount](self->_accountStore, "ams_activeiTunesAccount"));
  id v4 = sub_1001D3A8C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_altDSID"));
    int v9 = 141558274;
    uint64_t v10 = 1752392040LL;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Deactivating currently active iTunes account. {activeiTunesAltDSID=%{mask.hash}@}",  (uint8_t *)&v9,  0x16u);
  }

  if (v3)
  {
    [v3 setActive:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_saveAccount:](self->_accountStore, "ams_saveAccount:", v3));
    [v7 addFinishBlock:&stru_1003DC1A8];
  }

  else
  {
    id v8 = sub_1001D3A8C();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "No active iTunes account, nothing to do.",  (uint8_t *)&v9,  2u);
    }
  }
}

- (void)_validateAndFixActiveITunesAccount
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = [v3 BOOLForKey:@"DisableActiveiTunesValidation"];

  if (v4)
  {
    id v5 = sub_100084680();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Skipping active iTunes account validation.",  buf,  2u);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 activeProfile]);

    if (v6)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_activeiTunesAccount](self->_accountStore, "ams_activeiTunesAccount"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_altDSID"));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s iTunesAltDSID](v6, "iTunesAltDSID"));
      char v12 = BSEqualObjects(v10, v11);

      id v13 = sub_1001D3A8C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      int v15 = v14;
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v16 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Active iTunes account matches the active profile.",  v16,  2u);
        }
      }

      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100290980();
        }

        -[PBProfileAccountsController _activateITunesAccountWithProfile:]( self,  "_activateITunesAccountWithProfile:",  v6);
      }
    }
  }
}

- (void)_removeOrphanAccountsWithProfileStoreSnapshot:(id)a3
{
  id v20 = a3;
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v20 profiles]);
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        __int16 v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        char v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iCloudAltDSID", v20));
        -[NSMutableSet bs_safeAddObject:](v4, "bs_safeAddObject:", v12);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 iTunesAltDSID]);
        -[NSMutableSet bs_safeAddObject:](v5, "bs_safeAddObject:", v13);

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 gameCenterAltDSID]);
        -[NSMutableSet bs_safeAddObject:](v6, "bs_safeAddObject:", v14);
      }

      id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v8);
  }

  objc_initWeak(&location, self->_accountStore);
  accountStore = self->_accountStore;
  v31[0] = ACAccountTypeIdentifierAppleAccount;
  v31[1] = ACAccountTypeIdentifieriTunesStore;
  v31[2] = ACAccountTypeIdentifierGameCenter;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001D7174;
  v21[3] = &unk_1003D61E8;
  objc_copyWeak(&v25, &location);
  __int16 v17 = v4;
  v22 = v17;
  v18 = v5;
  id v23 = v18;
  __int16 v19 = v6;
  v24 = v19;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:completion:]( accountStore,  "accountsWithAccountTypeIdentifiers:completion:",  v16,  v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_removeOrphanPersonasWithProfileStoreSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D769C;
  v7[3] = &unk_1003DC210;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 fetchAllPersonasWithCompletionHandler:v7];
}

- (void).cxx_destruct
{
}

@end