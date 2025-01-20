@interface MSDDomainsPlistPatcher
+ (id)patchDomainsPlist:(id)a3;
@end

@implementation MSDDomainsPlistPatcher

+ (id)patchDomainsPlist:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v3));
  v5 = v4;
  if (!v4)
  {
    id v47 = sub_100021D84();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000296B4((uint64_t)v3, v6);
    }
    goto LABEL_40;
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"SystemDomains"]);
  if (!v6 || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
  {
    id v44 = sub_100021D84();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", buf, 2u);
    }

    goto LABEL_62;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"CameraRollDomain"));
  if (!v8 || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    id v31 = sub_100021D84();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029728();
    }
    goto LABEL_38;
  }

  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToBackup"]);
  if (!v10 || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v10, v11) & 1) == 0))
  {
    id v32 = sub_100021D84();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100029754();
    }
    goto LABEL_37;
  }

  -[os_log_s removeObject:](v10, "removeObject:", @"Media/PhotoData/Sync");
  [v8 setObject:v10 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"CameraRollDomain");
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToRemoveOnRestore"]);

  if (!v12 || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v13) & 1) == 0))
  {
    id v36 = sub_100021D84();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100029780();
    }
    goto LABEL_44;
  }

  -[NSMutableArray removeObject:](v12, "removeObject:", @"Media/PhotoData/Sync");
  -[NSMutableArray removeObject:](v12, "removeObject:", @"Media/PhotoData/Metadata/PhotoData/Sync");
  [v8 setObject:v12 forKey:@"RelativePathsToRemoveOnRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"CameraRollDomain");
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"HomeKitDomain"));

  if (v14)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v14, "objectForKey:", @"RelativePathsToRemoveOnRestore"));

      if ((v16 || (v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) != 0LL)
        && (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v16, v17) & 1) != 0))
      {
        -[NSMutableArray addObject:](v16, "addObject:", @"Library/homed/protected-home.config");
        -[NSMutableArray addObject:](v16, "addObject:", @"Library/homed/datastore.sqlite");
        -[NSMutableArray addObject:](v16, "addObject:", @"Library/homed/datastore.sqlite-shm");
        -[NSMutableArray addObject:](v16, "addObject:", @"Library/homed/datastore.sqlite-wal");
        -[os_log_s setObject:forKey:](v14, "setObject:forKey:", v16, @"RelativePathsToRemoveOnRestore");
        -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v14, @"HomeKitDomain");
        v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKey:]( v14,  "objectForKey:",  @"RelativePathsNotToBackupToService"));

        if (!v12 || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v18) & 1) == 0))
        {
          id v41 = sub_100021D84();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_100029B74();
          }
LABEL_54:

          goto LABEL_62;
        }

        -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite");
        -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite-shm");
        -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite-wal");
        -[os_log_s setObject:forKey:](v14, "setObject:forKey:", v12, @"RelativePathsNotToBackupToService");
        -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v14, @"HomeKitDomain");
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v14, "objectForKey:", @"RelativePathsNotToBackupInMegaBackup"));

        if (!v19 || (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v19, v20) & 1) == 0))
        {
          id v45 = sub_100021D84();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_100029BA0();
          }

          goto LABEL_62;
        }

        [v19 removeObject:@"Library/homed/datastore.sqlite"];
        [v19 removeObject:@"Library/homed/datastore.sqlite-shm"];
        [v19 removeObject:@"Library/homed/datastore.sqlite-wal"];
        -[os_log_s setObject:forKey:](v14, "setObject:forKey:", v19, @"RelativePathsNotToBackupInMegaBackup");
        -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v14, @"HomeKitDomain");
        v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v14, "objectForKey:", @"RelativePathsToRestoreOnly"));

        if (v16)
        {
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
          if ((objc_opt_isKindOfClass(v16, v21) & 1) != 0)
          {
            -[NSMutableArray removeObject:](v16, "removeObject:", @"Library/homed/protected-home.config");
            -[NSMutableArray removeObject:](v16, "removeObject:", @"Library/homed/datastore.sqlite");
            -[NSMutableArray removeObject:](v16, "removeObject:", @"Library/homed/datastore.sqlite-shm");
            -[NSMutableArray removeObject:](v16, "removeObject:", @"Library/homed/datastore.sqlite-wal");
            -[os_log_s setObject:forKey:](v14, "setObject:forKey:", v16, @"RelativePathsToRestoreOnly");
            -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v14, @"HomeKitDomain");
            v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKey:]( v14,  "objectForKey:",  @"RelativePathsToOnlyBackupEncrypted"));

            if (v12)
            {
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
              if ((objc_opt_isKindOfClass(v12, v22) & 1) != 0)
              {
                -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/protected-home.config");
                -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite");
                -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite-shm");
                -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/homed/datastore.sqlite-wal");
                -[os_log_s setObject:forKey:]( v14,  "setObject:forKey:",  v12,  @"RelativePathsToOnlyBackupEncrypted");
                -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v14, @"HomeKitDomain");
                goto LABEL_24;
              }
            }

            id v86 = sub_100021D84();
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_100029BF8();
            }
            goto LABEL_54;
          }
        }

        id v83 = sub_100021D84();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_100029BCC();
        }
      }

      else
      {
        id v38 = sub_100021D84();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_100029B48();
        }
      }

LABEL_62:
      goto LABEL_40;
    }
  }

@end