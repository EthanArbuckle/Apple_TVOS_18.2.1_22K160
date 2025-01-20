@interface IDSPinnedIdentityController
+ (IDSPinnedIdentityController)sharedInstance;
- (BOOL)foundPersistedIdentityForEndpoint:(id)a3 forService:(id)a4;
- (IDSPersistentMap)identityPersister;
- (IDSPinnedIdentityController)init;
- (IDSPinnedIdentityController)initWithPersister:(id)a3;
- (NSData)identity;
- (id)pushHandler;
- (id)registrationKeyManager;
- (id)serviceController;
- (id)systemMonitor;
- (void)_persistIdentity:(id)a3;
- (void)clearAllPinnedIdentities;
- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3;
- (void)fetchIdentityForPinningWithCompletion:(id)a3;
- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4;
- (void)setIdentity:(id)a3;
- (void)setIdentityPersister:(id)a3;
@end

@implementation IDSPinnedIdentityController

+ (IDSPinnedIdentityController)sharedInstance
{
  if (qword_1009C0C30 != -1) {
    dispatch_once(&qword_1009C0C30, &stru_100902AC0);
  }
  return (IDSPinnedIdentityController *)(id)qword_1009C0C38;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (id)pushHandler
{
  return +[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance");
}

- (id)registrationKeyManager
{
  return +[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance");
}

- (id)systemMonitor
{
  return +[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance");
}

- (IDSPinnedIdentityController)init
{
  v3 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSPinnedIdentityMetadata, v8);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v7,  v9,  objc_opt_class(&OBJC_CLASS___NSString, v10),  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( v3,  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  @"com.apple.identityservicesd.pinned-identity",  0LL,  v12,  0LL);
  v14 = -[IDSPinnedIdentityController initWithPersister:](self, "initWithPersister:", v13);

  return v14;
}

- (IDSPinnedIdentityController)initWithPersister:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSPinnedIdentityController;
  uint64_t v6 = -[IDSPinnedIdentityController init](&v9, "init");
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identityPersister, a3);
  }

  return v7;
}

- (void)fetchIdentityForPinningWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPinnedIdentityController systemMonitor](self, "systemMonitor"));
  unsigned int v6 = [v5 isUnderFirstDataProtectionLock];

  if (!v6)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPinnedIdentityController serviceController](self, "serviceController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 allPinningEnforcedServices]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPinnedIdentityController pushHandler](self, "pushHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPinnedIdentityController registrationKeyManager](self, "registrationKeyManager"));
    id v45 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 publicMessageProtectionIdentityDataToRegisterWithError:&v45]);
    id v14 = v45;

    if (v14)
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1006A90D8();
      }

      if (v4) {
        v4[2](v4, 0LL, v14);
      }
      goto LABEL_44;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 publicNGMIdentityData]);
    if (!v16)
    {
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1006A8FB0();
      }

      if (!v4) {
        goto LABEL_43;
      }
      v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPinnedIdentityError",  1LL,  0LL));
      v4[2](v4, 0LL, v17);
LABEL_42:

LABEL_43:
LABEL_44:

      goto LABEL_45;
    }

    v37 = v13;
    v39 = v11;
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v38 = v8;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v24 = objc_alloc_init(&OBJC_CLASS___IDSPinnedIdentityMetadata);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
          [v24 setService:v25];

          [v24 setIdentity:v16];
          -[NSMutableArray addObject:](v17, "addObject:", v24);
        }

        id v20 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }

      while (v20);
    }

    id v26 = objc_alloc_init(&OBJC_CLASS___IDSPinnedIdentities);
    v11 = v39;
    [v26 setPushToken:v39];
    [v26 setPinnedIdentityMetadatas:v17];
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 pushToken]);
    if (v27
      && (v28 = (void *)v27,
          v29 = (void *)objc_claimAutoreleasedReturnValue([v26 pinnedIdentityMetadatas]),
          v29,
          v28,
          v29))
    {
      id v40 = 0LL;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  &v40));
      id v31 = v40;
      if (v31)
      {
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_1006A9078();
        }

        uint64_t v8 = v38;
        v11 = v39;
        id v14 = 0LL;
        v13 = v37;
        if (v4) {
          v4[2](v4, 0LL, v31);
        }
      }

      else
      {
        id v35 = [[IDSPinnedIdentity alloc] initWithIdentityBlob:v30];
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Successfully created identity to pin. { pinnedIdentity: %@ }",  buf,  0xCu);
        }

        uint64_t v8 = v38;
        id v14 = 0LL;
        if (v4) {
          ((void (**)(id, id, id))v4)[2](v4, v35, 0LL);
        }

        v11 = v39;
        v13 = v37;
      }
    }

    else
    {
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1006A8FDC(v26, v33);
      }

      v13 = v37;
      uint64_t v8 = v38;
      id v14 = 0LL;
      if (!v4) {
        goto LABEL_41;
      }
      id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPinnedIdentityError",  1LL,  0LL));
      v4[2](v4, 0LL, v31);
    }

LABEL_41:
    goto LABEL_42;
  }

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1006A8F84();
  }

  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPinnedIdentityError",  5LL,  0LL));
    v4[2](v4, 0LL, v8);
LABEL_45:
  }
}

- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4
{
  unsigned int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v21 = 0LL;
  id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___IDSPinnedIdentities, v8),  v7,  &v21);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = v21;
  if (v11)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A9188();
    }

    if (v6) {
      v6[2](v6, v11);
    }
    goto LABEL_25;
  }

  if (!v10)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1006A9104();
    }

    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v18 = 2LL;
LABEL_24:
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPinnedIdentityError",  v18,  0LL));
    v6[2](v6, v20);

    goto LABEL_25;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);

  if (!v13)
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1006A9130();
    }

    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v18 = 3LL;
    goto LABEL_24;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pinnedIdentityMetadatas]);

  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Identities to pin: %@", buf, 0xCu);
    }

    -[IDSPinnedIdentityController _persistIdentity:](self, "_persistIdentity:", v10);
    v6[2](v6, 0LL);
    goto LABEL_25;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1006A915C();
  }

  if (v6)
  {
    uint64_t v18 = 4LL;
    goto LABEL_24;
  }

- (void)_persistIdentity:(id)a3
{
  identityPersister = self->_identityPersister;
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 pinnedIdentityMetadatas]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);

  -[IDSPersistentMap setObject:forKey:](identityPersister, "setObject:forKey:", v6, v5);
}

- (BOOL)foundPersistedIdentityForEndpoint:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_identityPersister, "objectForKey:", v8));
  uint64_t v10 = v9;
  if (v9)
  {
    v38 = v8;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v40;
LABEL_4:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 service]);
        unsigned __int8 v18 = [v17 isEqualToString:v7];

        if ((v18 & 1) != 0) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v19 = v16;

      if (!v19) {
        goto LABEL_19;
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 publicDeviceIdentityContainer]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 ngmPublicDeviceIdentity]);
      char v22 = objc_opt_respondsToSelector(v21, "isIdenticalIdentityTo:");

      if ((v22 & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 publicDeviceIdentityContainer]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 ngmPublicDeviceIdentity]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v19 identity]);
        unsigned __int8 v26 = [v24 isIdenticalIdentityTo:v25];

        if ((v26 & 1) == 0) {
          goto LABEL_14;
        }
      }

      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v6 serializedNGMDeviceIdentity]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v19 identity]);
        unsigned __int8 v34 = [v32 isEqualToData:v33];

        if ((v34 & 1) == 0)
        {
LABEL_14:
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
          uint64_t v8 = v38;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_1006A92BC(v19, v6, v27);
          }

          if ((_os_feature_enabled_impl("IDS", "PinnedIdentityEnforcement") & 1) == 0)
          {
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSPinnedIdentity]( &OBJC_CLASS___IDSFoundationLog,  "IDSPinnedIdentity"));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Hit failure, but enforcement FF is disabled. Returning YES.",  buf,  2u);
            }

            goto LABEL_37;
          }

          goto LABEL_23;
        }
      }

      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSPinnedIdentity](&OBJC_CLASS___IDSFoundationLog, "IDSPinnedIdentity"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v19 identity]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v6 serializedNGMDeviceIdentity]);
        *(_DWORD *)buf = 138412546;
        __int128 v44 = v35;
        __int16 v45 = 2112;
        v46 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Pinned identity matches endpoint identity. { pinnedIdentity: %@, endointIdentity: %@ }",  buf,  0x16u);
      }

      uint64_t v8 = v38;
      goto LABEL_37;
    }

- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, NSMutableArray *, void))a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap allKeys](self->_identityPersister, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc_init(&OBJC_CLASS___IDSPinnedIdentities);
        [v12 setPushToken:v11];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_identityPersister, "objectForKey:", v11));
        [v12 setPinnedIdentityMetadatas:v13];

        -[NSMutableArray addObject:](v5, "addObject:", v12);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  v4[2](v4, v5, 0LL);
}

- (void)clearAllPinnedIdentities
{
}

- (NSData)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (IDSPersistentMap)identityPersister
{
  return self->_identityPersister;
}

- (void)setIdentityPersister:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end