@interface MSDMigrator
- (BOOL)isVersionCurrent;
- (HMAccessory)device;
- (NSUUID)ownerUUID;
- (id)migrateDefaultAccountToPrimaryUser;
- (id)primaryUserWithHomeUsersForActiveAccount:(id)a3 homeOwner:(id)a4;
- (id)setPrimaryUserIdentifier:(id)a3;
- (unint64_t)currentVersion;
- (void)performMigrationIfNeeded:(id)a3;
- (void)setCurrentVersion:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setOwnerUUID:(id)a3;
@end

@implementation MSDMigrator

- (unint64_t)currentVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForDefault:@"version"]);

  if (v3 && (objc_opt_respondsToSelector(v3, "unsignedIntegerValue") & 1) != 0) {
    id v4 = [v3 unsignedIntegerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (void)setCurrentVersion:(unint64_t)a3
{
  id v4 = sub_10003E9DC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting version to %lu", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v6 setObject:v7 forDefault:@"version"];
}

- (BOOL)isVersionCurrent
{
  return (id)-[MSDMigrator currentVersion](self, "currentVersion") == (id)1;
}

- (void)performMigrationIfNeeded:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  unint64_t v5 = -[MSDMigrator currentVersion](self, "currentVersion");
  if (v5 == 1)
  {
    id v6 = sub_10003E9DC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Version is current", (uint8_t *)&v18, 2u);
    }

LABEL_13:
    v4[2](v4, 0LL);
    goto LABEL_16;
  }

  unint64_t v8 = v5;
  char v9 = DMGetUserDataDisposition();
  id v10 = sub_10003E9DC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v12)
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Detected erase install, skipping migration",  (uint8_t *)&v18,  2u);
    }

    -[MSDMigrator setCurrentVersion:](self, "setCurrentVersion:", 1LL);
    goto LABEL_13;
  }

  if (v12)
  {
    int v18 = 134218240;
    unint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = 1LL;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Migrating (from version %ld to %ld)",  (uint8_t *)&v18,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 homeOwnerUniqueIdentifier]);
  -[MSDMigrator setOwnerUUID:](self, "setOwnerUUID:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAccessory]);
  -[MSDMigrator setDevice:](self, "setDevice:", v16);

  if (v8) {
    v17 = 0LL;
  }
  else {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator migrateDefaultAccountToPrimaryUser](self, "migrateDefaultAccountToPrimaryUser"));
  }
  -[MSDMigrator setCurrentVersion:](self, "setCurrentVersion:", 1LL);
  ((void (**)(id, void *))v4)[2](v4, v17);

LABEL_16:
}

- (id)migrateDefaultAccountToPrimaryUser
{
  if ((+[MSDeviceInfo isDeviceAppleTV](&OBJC_CLASS___MSDeviceInfo, "isDeviceAppleTV") & 1) != 0)
  {
    id v3 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccount activeiTunesAccount](&OBJC_CLASS___MSDAccount, "activeiTunesAccount"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_homeUserIdentifiers"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator ownerUUID](self, "ownerUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[MSDMigrator primaryUserWithHomeUsersForActiveAccount:homeOwner:]( self,  "primaryUserWithHomeUsersForActiveAccount:homeOwner:",  v5,  v6));

    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator setPrimaryUserIdentifier:](self, "setPrimaryUserIdentifier:", v7));
    if (v8)
    {
      id v9 = sub_10003E9DC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002EB68((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    id v3 = v8;
  }

  return v3;
}

- (id)primaryUserWithHomeUsersForActiveAccount:(id)a3 homeOwner:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v5 count] == (id)1)
    {
      id v7 = sub_10003E9DC();
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        id v9 = "Found single home user for default account, make them the primary user";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v18, 2u);
      }
    }

    else
    {
      unsigned int v13 = [v5 containsObject:v6];
      id v14 = sub_10003E9DC();
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          int v18 = 138477827;
          id v19 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found multiple users including home owner, set primary user to owner, %{private}@",  (uint8_t *)&v18,  0xCu);
        }

        id v16 = v6;
        goto LABEL_16;
      }

      if (v15)
      {
        LOWORD(v18) = 0;
        id v9 = "Found multiple users excluding home owner, set primary user to one";
        goto LABEL_14;
      }
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
LABEL_16:
    uint64_t v12 = v16;
    goto LABEL_17;
  }

  id v10 = sub_10003E9DC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No home users found for default account, set primary user to automatic",  (uint8_t *)&v18,  2u);
  }

  uint64_t v12 = 0LL;
LABEL_17:

  return v12;
}

- (id)setPrimaryUserIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_10002E9D4;
  v35 = sub_10002E9E4;
  id v36 = 0LL;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator device](self, "device"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 home]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userWithIdentifier:v4]);

    if (v7) {
      goto LABEL_8;
    }
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002EC10((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  else
  {
    id v16 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No primary user identifier passed", buf, 2u);
    }
  }

  id v7 = 0LL;
LABEL_8:
  id v17 = sub_10003E9DC();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v38 = v7 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Setting primary user selection type : %ld",  buf,  0xCu);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator device](self, "device"));
  if (v19)
  {
    id v20 = sub_10003E9DC();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      BOOL v38 = (BOOL)v4;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Setting primary user to %{private}@",  buf,  0xCu);
    }

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMigrator device](self, "device"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10002E9EC;
    v28[3] = &unk_1000613C0;
    v30 = &v31;
    v28[4] = self;
    v24 = v22;
    v29 = v24;
    [v23 updatePreferredMediaUserSelectionType:v7 != 0 user:v7 completionHandler:v28];

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    id v25 = sub_10003E9DC();
    v24 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      sub_10002EBD0((os_log_t)v24);
    }
  }

  id v26 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (HMAccessory)device
{
  return (HMAccessory *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSUUID)ownerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOwnerUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end