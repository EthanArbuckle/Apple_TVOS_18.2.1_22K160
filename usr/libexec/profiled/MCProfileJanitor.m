@interface MCProfileJanitor
- (id)earliestExpiryDate;
- (void)_removeExpiredProvisioningProfiles;
- (void)removeExpiredProfiles;
@end

@implementation MCProfileJanitor

- (void)removeExpiredProfiles
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Checking for configuration profiles to remove due to expired removal date.",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allInstalledProfileIdentifiers]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 installedProfileWithIdentifier:v10]);
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 removalDate]);
          v15 = v14;
          if (v14)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 earlierDate:v35]);

            if (v16 == v15)
            {
              v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = v10;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Profile “%{public}@” has expired and will be removed.",  buf,  0xCu);
              }

              else {
                uint64_t v18 = 1LL;
              }
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
              [v3 setObject:v19 forKey:v10];
            }
          }
        }

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }

    while (v7);
  }

  if ([v3 count])
  {
    os_log_t v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      unsigned int v22 = [v3 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Removing %d configuration profiles.",  buf,  8u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    v34 = v3;
    id v24 = v3;
    id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v38;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
          v30 = objc_autoreleasePoolPush();
          v31 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v29]);
          objc_msgSend( v23,  "removeProfileWithIdentifier:installationType:source:",  v29,  (int)objc_msgSend(v31, "intValue"),  @"Expired Profile Removal");

          objc_autoreleasePoolPop(v30);
        }

        id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v26);
    }

    v3 = v34;
  }

  -[MCProfileJanitor _removeExpiredProvisioningProfiles](self, "_removeExpiredProvisioningProfiles");
  v32 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Finished checking for profiles to remove.",  buf,  2u);
  }
}

- (void)_removeExpiredProvisioningProfiles
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Checking for provisioning profiles to remove due to expiry.",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t DeviceUUID = MCGestaltGetDeviceUUID();
  v5 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10006BDF0;
  v30[3] = &unk_1000C3EB0;
  id v7 = v3;
  id v31 = v7;
  id v8 = v6;
  id v32 = v8;
  id v9 = v5;
  id v33 = v9;
  unsigned int v10 = MISEnumerateInstalledProvisioningProfiles(0LL, v30);
  if (v10)
  {
    unsigned int v11 = v10;
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v36 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Cannot retrieve list of provisioning profiles with MIS error: %d",  buf,  8u);
    }
  }

  else if ([v8 count])
  {
    id v25 = v9;
    os_log_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      unsigned int v15 = [v8 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing %d provisioning profiles.", buf, 8u);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v16 = v8;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          unsigned int v22 = objc_autoreleasePoolPush();
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
          id v24 =  [v23 removeProvisioningProfileUUID:v21 sender:@"MCProfileJanitor._removeExpiredProvisioningProfiles"];

          objc_autoreleasePoolPop(v22);
        }

        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v18);
    }

    id v9 = v25;
  }
}

- (id)earliestExpiryDate
{
  uint64_t v27 = 0LL;
  __int128 v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10006C280;
  id v31 = sub_10006C290;
  id v32 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 allInstalledProfileIdentifiers]);
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v6);
        id v8 = objc_autoreleasePoolPush();
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 installedProfileWithIdentifier:v7]);
        unsigned int v10 = v9;
        if (v9)
        {
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 removalDate]);
          v12 = v11;
          os_log_t v13 = v28;
          if (!v28[5]) {
            goto LABEL_11;
          }
          if (v11)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:"));
            BOOL v15 = v14 == v12;

            if (v15)
            {
              os_log_t v13 = v28;
LABEL_11:
              objc_storeStrong(v13 + 5, v12);
            }
          }
        }

        objc_autoreleasePoolPop(v8);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }

    while (v4);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10006C298;
  v22[3] = &unk_1000C3ED8;
  v22[4] = &v27;
  int v16 = MISEnumerateInstalledProvisioningProfiles(0LL, v22);
  if (v16)
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Cannot retrieve list of provisioning profiles. Status: %d",  buf,  8u);
    }
  }

  id v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    id v19 = v28[5];
    *(_DWORD *)buf = 138543362;
    id v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Checking profiles for expiry. Earliest expiry date: %{public}@",  buf,  0xCu);
  }

  id v20 = v28[5];

  _Block_object_dispose(&v27, 8);
  return v20;
}

@end