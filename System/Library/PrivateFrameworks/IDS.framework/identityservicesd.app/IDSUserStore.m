@interface IDSUserStore
- (IDSPersistentMap)persistentMap;
- (IDSRegistrationKeychainManager)registrationKeychainManager;
- (IDSUserStore)initWithQueue:(id)a3;
- (IDSUserStore)initWithQueue:(id)a3 persister:(id)a4 registrationKeychainManager:(id)a5;
- (NSDictionary)dataProviderByRealm;
- (NSMapTable)realmByListener;
- (OS_dispatch_queue)queue;
- (id)_stringRepresentationOfUserRealm:(int64_t)a3;
- (id)authenticationCertificateForUser:(id)a3;
- (id)credentialForUser:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)propertiesForUser:(id)a3;
- (id)userWithUniqueIdentifier:(id)a3;
- (id)usersWithRealm:(int64_t)a3;
- (id)usersWithRealms:(id)a3;
- (void)_addUser:(id)a3;
- (void)_iterateByRealm:(int64_t)a3 block:(id)a4;
- (void)_removeUser:(id)a3;
- (void)_updateUsersForCurrentUsers:(id)a3 updatedUsers:(id)a4;
- (void)addActionListener:(id)a3;
- (void)addActionListener:(id)a3 forRealm:(int64_t)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)persistUsersImmediately;
- (void)reloadUsers;
- (void)reloadUsersForRealm:(int64_t)a3;
- (void)removeActionListener:(id)a3;
- (void)setAuthenticationCertificate:(id)a3 forUser:(id)a4;
- (void)setCredential:(id)a3 forUser:(id)a4;
- (void)setDataProvider:(id)a3 forRealm:(int64_t)a4;
- (void)setDataProviderByRealm:(id)a3;
- (void)setPersistentMap:(id)a3;
- (void)setProperties:(id)a3 forUser:(id)a4;
- (void)setQueue:(id)a3;
- (void)setRealmByListener:(id)a3;
- (void)setRegistrationKeychainManager:(id)a3;
- (void)silentlySetAuthenticationCertificate:(id)a3 forUser:(id)a4;
- (void)updateUser:(id)a3;
@end

@implementation IDSUserStore

- (IDSUserStore)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPersistentMap defaultPersisterForIdentifier:dataProtectionClass:]( &OBJC_CLASS___IDSPersistentMap,  "defaultPersisterForIdentifier:dataProtectionClass:",  @"com.apple.identityservices.userStore",  2LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
  v7 = -[IDSUserStore initWithQueue:persister:registrationKeychainManager:]( self,  "initWithQueue:persister:registrationKeychainManager:",  v4,  v5,  v6);

  return v7;
}

- (IDSUserStore)initWithQueue:(id)a3 persister:(id)a4 registrationKeychainManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___IDSUserStore;
    v12 = -[IDSUserStore init](&v39, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      v38 = -[IDSPersistentMapMergePolicy initWithPolicyBlock:]( objc_alloc(&OBJC_CLASS___IDSPersistentMapMergePolicy),  "initWithPolicyBlock:",  &stru_1008FDEC8);
      uint64_t v37 = objc_opt_class(&OBJC_CLASS___IDSPhoneUser, v14);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSAppleUser, v15);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___IDSTemporaryPhoneUser, v17);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
      id v22 = v9;
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___IDSUserDescription, v24);
      uint64_t v36 = v23;
      id v9 = v22;
      v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v37,  v16,  v18,  v20,  v36,  v25,  objc_opt_class(&OBJC_CLASS___IDSDeviceUser, v26),  0LL);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      LOBYTE(v35) = 1;
      v29 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:persister:migrationBlock:allowBackup:]( objc_alloc(&OBJC_CLASS___IDSPersistentMap),  "initWithIdentifier:versionNumber:decodableClasses:mergePolicy:writeCoalescingDelay:writeCoalescingLeeway:p ersister:migrationBlock:allowBackup:",  @"com.apple.identityservices.userStore",  2LL,  v28,  v38,  v10,  &stru_1008FDEE8,  5.0,  1.0,  v35);
      persistentMap = v13->_persistentMap;
      v13->_persistentMap = v29;

      objc_storeStrong((id *)&v13->_registrationKeychainManager, a5);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
      realmByListener = v13->_realmByListener;
      v13->_realmByListener = (NSMapTable *)v31;
    }

    self = v13;
    v33 = self;
  }

  else
  {
    v33 = 0LL;
  }

  return v33;
}

- (void)setDataProvider:(id)a3 forRealm:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  uint64_t v14 = v7;
  id v15 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  dataProviderByRealm = self->_dataProviderByRealm;
  if (dataProviderByRealm)
  {
    id v10 = (NSDictionary *)-[NSDictionary mutableCopy](dataProviderByRealm, "mutableCopy");
    -[NSDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v8);
    id v11 = (NSDictionary *)-[NSDictionary copy](v10, "copy");
    v12 = self->_dataProviderByRealm;
    self->_dataProviderByRealm = v11;
  }

  else
  {
    v13 = v8;
    id v10 = self->_dataProviderByRealm;
    self->_dataProviderByRealm = v13;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, dataProviderByRealm: %@, persistentMap: %@>",  objc_opt_class(self, a2),  self,  self->_dataProviderByRealm,  self->_persistentMap);
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  dataProviderByRealm = self->_dataProviderByRealm;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap debugDescription](self->_persistentMap, "debugDescription"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, dataProviderByRealm: %@, persistentMap: %@>",  v3,  self,  dataProviderByRealm,  v5));

  return v6;
}

- (id)usersWithRealm:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap allValues](self->_persistentMap, "allValues"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002017C4;
  v7[3] = &unk_1008FDF08;
  v7[4] = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "__imArrayByApplyingBlock:", v7));

  return v5;
}

- (id)usersWithRealms:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap allValues](self->_persistentMap, "allValues"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002018D4;
  v9[3] = &unk_1008FDF30;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imArrayByApplyingBlock:", v9));

  return v7;
}

- (id)userWithUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 user]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)persistUsersImmediately
{
}

- (void)reloadUsers
{
}

- (void)reloadUsersForRealm:(int64_t)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserStore _stringRepresentationOfUserRealm:](self, "_stringRepresentationOfUserRealm:", a3));
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "UserStore reloading {realm: %@}",  (uint8_t *)&v14,  0xCu);
  }

  dataProviderByRealm = self->_dataProviderByRealm;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](dataProviderByRealm, "objectForKeyedSubscript:", v8));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserStore usersWithRealm:](self, "usersWithRealm:", a3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 updatedUserSetForRealm:a3 currentUsers:v11]);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Provider created change set {current: %@, updated: %@, provider: %@}",  (uint8_t *)&v14,  0x20u);
    }

    -[IDSUserStore _updateUsersForCurrentUsers:updatedUsers:]( self,  "_updateUsersForCurrentUsers:updatedUsers:",  v11,  v12);
  }
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    dataProviderByRealm = self->_dataProviderByRealm;
    id v10 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 realm]));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](dataProviderByRealm, "objectForKeyedSubscript:", v8));

    if (v9) {
      [v9 forceRemoveUser:v10 silently:v4];
    }

    id v6 = v10;
  }
}

- (void)updateUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating user {user: %@}", buf, 0xCu);
    }

    persistentMap = self->_persistentMap;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", v7));

    if (v8)
    {
      id v9 = self->_persistentMap;
      id v10 = objc_alloc(&OBJC_CLASS___IDSUserDescription);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 properties]);
      v12 = -[IDSUserDescription initWithUser:properties:](v10, "initWithUser:properties:", v4, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
      -[IDSPersistentMap setObject:forKey:](v9, "setObject:forKey:", v12, v13);

      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Broadcasting update user {user: %@}",  buf,  0xCu);
      }

      id v15 = [v4 realm];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100201ED0;
      v17[3] = &unk_1008FDF58;
      v17[4] = self;
      id v18 = v4;
      -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v15, v17);
    }

    else
    {
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "User is not present -- not updating {user: %@}",  buf,  0xCu);
      }
    }
  }
}

- (void)_updateUsersForCurrentUsers:(id)a3 updatedUsers:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        persistentMap = self->_persistentMap;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
        int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", v13));

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 user]);
          unsigned __int8 v16 = [v11 isIdenticalToUser:v15];

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Silently updating user {user: %@}",  buf,  0xCu);
            }

            id v18 = self->_persistentMap;
            uint64_t v19 = objc_alloc(&OBJC_CLASS___IDSUserDescription);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 properties]);
            uint64_t v21 = -[IDSUserDescription initWithUser:properties:](v19, "initWithUser:properties:", v11, v20);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
            -[IDSPersistentMap setObject:forKey:](v18, "setObject:forKey:", v21, v22);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v8);
  }

  if (([v35 isEqualToSet:v6] & 1) == 0)
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v23 = v35;
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)j);
        }

        id v25 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }

      while (v25);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v29 = v6;
    id v30 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (k = 0LL; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)k);
        }

        id v31 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }

      while (v31);
    }
  }
}

- (void)_addUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding user {user: %@}", buf, 0xCu);
    }

    persistentMap = self->_persistentMap;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", v7));

    uint64_t v9 = objc_alloc(&OBJC_CLASS___IDSUserDescription);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 properties]);
    id v11 = -[IDSUserDescription initWithUser:properties:](v9, "initWithUser:properties:", v4, v10);

    v12 = self->_persistentMap;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    -[IDSPersistentMap setObject:forKey:](v12, "setObject:forKey:", v11, v13);

    if (!v8)
    {
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Broadcasting new user {user: %@}",  buf,  0xCu);
      }

      id v15 = [v4 realm];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100202470;
      v16[3] = &unk_1008FDF58;
      v16[4] = self;
      id v17 = v4;
      -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v15, v16);
    }
  }
}

- (void)_removeUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing user {user: %@}", buf, 0xCu);
    }

    -[IDSUserStore setCredential:forUser:](self, "setCredential:forUser:", 0LL, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserStore authenticationCertificateForUser:](self, "authenticationCertificateForUser:", v4));
    if (![v4 realm])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
      [v7 notePhoneAuthCertLost:9];
    }

    -[IDSUserStore silentlySetAuthenticationCertificate:forUser:]( self,  "silentlySetAuthenticationCertificate:forUser:",  0LL,  v4);
    persistentMap = self->_persistentMap;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    -[IDSPersistentMap removeObjectForKey:](persistentMap, "removeObjectForKey:", v9);

    id v10 = [v4 realm];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100202638;
    v12[3] = &unk_1008FDF80;
    v12[4] = self;
    id v13 = v4;
    id v14 = v6;
    id v11 = v6;
    -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v10, v12);
  }
}

- (id)_stringRepresentationOfUserRealm:(int64_t)a3
{
  else {
    return *(&off_1008FDFA0 + a3 - 1);
  }
}

- (id)credentialForUser:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  id v6 = [v4 realm];
  if (v6 == (id)2)
  {
    registrationKeychainManager = self->_registrationKeychainManager;
    id v14 = v5;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 phoneNumber]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeychainManager tempPhoneCredentialForID:]( registrationKeychainManager,  "tempPhoneCredentialForID:",  v15));

    id v16 = objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserCredential);
    v12 = -[IDSTemporaryPhoneUserCredential initWithDataRepresentation:](v16, "initWithDataRepresentation:", v10);
    goto LABEL_7;
  }

  if (v6 == (id)1)
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1006A397C((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_11;
  }

  if (v6)
  {
LABEL_11:
    id v17 = 0LL;
    goto LABEL_12;
  }

  id v7 = self->_registrationKeychainManager;
  id v8 = v5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 phoneNumber]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeychainManager smsSignatureForID:](v7, "smsSignatureForID:", v9));

  id v11 = objc_alloc(&OBJC_CLASS___IDSPhoneUserCredential);
  v12 = -[IDSPhoneUserCredential initWithSMSSignature:](v11, "initWithSMSSignature:", v10);
LABEL_7:
  id v17 = v12;

LABEL_12:
  return v17;
}

- (void)setCredential:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_16;
  }
  if (v6)
  {
    id v8 = [v6 realm];
    if (v8 != [v7 realm])
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_1006A39E0((uint64_t)v6, (uint64_t)v7, v16);
      }
      goto LABEL_15;
    }
  }

  id v9 = [v7 realm];
  if (v9 == (id)2)
  {
    registrationKeychainManager = self->_registrationKeychainManager;
    id v18 = v6;
    id v19 = v7;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dataRepresentation]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 phoneNumber]);
    -[IDSRegistrationKeychainManager setTempPhoneCredential:forID:]( registrationKeychainManager,  "setTempPhoneCredential:forID:",  v20,  v21);

    goto LABEL_16;
  }

  if (v9 == (id)1)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1006A397C((uint64_t)v7, v16, v22, v23, v24, v25, v26, v27);
    }
LABEL_15:

    goto LABEL_16;
  }

  if (!v9)
  {
    id v10 = v7;
    id v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 phoneNumber]);

    if (v12)
    {
      id v13 = self->_registrationKeychainManager;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 smsSignature]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 phoneNumber]);
      -[IDSRegistrationKeychainManager setSMSSignature:mainID:](v13, "setSMSSignature:mainID:", v14, v15);
    }
  }

- (id)authenticationCertificateForUser:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = (IDSAuthenticationCertificate *)objc_claimAutoreleasedReturnValue([v4 storageIdentifier]);

    if (v6)
    {
      registrationKeychainManager = self->_registrationKeychainManager;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 storageIdentifier]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeychainManager authenticationCertForID:]( registrationKeychainManager,  "authenticationCertForID:",  v8));

      if (v9) {
        id v6 = -[IDSAuthenticationCertificate initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___IDSAuthenticationCertificate),  "initWithDataRepresentation:",  v9);
      }
      else {
        id v6 = 0LL;
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setAuthenticationCertificate:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[IDSUserStore silentlySetAuthenticationCertificate:forUser:]( self,  "silentlySetAuthenticationCertificate:forUser:",  v6,  v7);
  id v8 = [v7 realm];
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100202B48;
    v12[3] = &unk_1008FDF80;
    v12[4] = self;
    id v9 = &v13;
    id v13 = v6;
    id v14 = v7;
    id v10 = v7;
    -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v8, v12);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100202B3C;
    v15[3] = &unk_1008FDF58;
    id v9 = &v16;
    v15[4] = self;
    id v16 = v7;
    id v11 = v7;
    -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v8, v15);
  }
}

- (void)silentlySetAuthenticationCertificate:(id)a3 forUser:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storageIdentifier]);

  if (v7)
  {
    registrationKeychainManager = self->_registrationKeychainManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 dataRepresentation]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 storageIdentifier]);
    -[IDSRegistrationKeychainManager setAuthenticationCert:forID:]( registrationKeychainManager,  "setAuthenticationCert:forID:",  v9,  v10);
  }
}

- (id)propertiesForUser:(id)a3
{
  if (a3)
  {
    persistentMap = self->_persistentMap;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 uniqueIdentifier]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setProperties:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating user properties {user: %@, props: %@}",  buf,  0x16u);
    }

    persistentMap = self->_persistentMap;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", v11));

    if (v12)
    {
      id v13 = self->_persistentMap;
      id v14 = -[IDSUserDescription initWithUser:properties:]( objc_alloc(&OBJC_CLASS___IDSUserDescription),  "initWithUser:properties:",  v8,  v6);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
      -[IDSPersistentMap setObject:forKey:](v13, "setObject:forKey:", v14, v15);

      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Broadcasting update user props {user: %@}",  buf,  0xCu);
      }

      id v17 = [v8 realm];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100202ED0;
      v19[3] = &unk_1008FDF58;
      v19[4] = self;
      id v20 = v8;
      -[IDSUserStore _iterateByRealm:block:](self, "_iterateByRealm:block:", v17, v19);
    }

    else
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "User is not present -- not updating props {user: %@}",  buf,  0xCu);
      }
    }
  }
}

- (void)_iterateByRealm:(int64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = self->_realmByListener;
  id v8 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_realmByListener, "objectForKey:", v12, (void)v15));
        id v14 = [v13 integerValue];

        if (v14 == (id)a3 || v14 == (id)-42LL) {
          v6[2](v6, v12);
        }
      }

      id v9 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }
}

- (void)addActionListener:(id)a3
{
}

- (void)addActionListener:(id)a3 forRealm:(int64_t)a4
{
  realmByListener = self->_realmByListener;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMapTable setObject:forKey:](realmByListener, "setObject:forKey:", v7, v6);
}

- (void)removeActionListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (IDSRegistrationKeychainManager)registrationKeychainManager
{
  return self->_registrationKeychainManager;
}

- (void)setRegistrationKeychainManager:(id)a3
{
}

- (NSMapTable)realmByListener
{
  return self->_realmByListener;
}

- (void)setRealmByListener:(id)a3
{
}

- (NSDictionary)dataProviderByRealm
{
  return self->_dataProviderByRealm;
}

- (void)setDataProviderByRealm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end