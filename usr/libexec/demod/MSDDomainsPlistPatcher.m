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
    id v61 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100094570((uint64_t)v3, v7);
    }
    goto LABEL_40;
  }

  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"SystemDomains"]);
  if (!v7 || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v6), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    id v58 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", buf, 2u);
    }

    goto LABEL_62;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"CameraRollDomain"));
  if (!v10
    || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v9), (objc_opt_isKindOfClass(v10, v11) & 1) == 0))
  {
    id v45 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000945E4();
    }
    goto LABEL_38;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToBackup"]);
  if (!v13 || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v12), (objc_opt_isKindOfClass(v13, v14) & 1) == 0))
  {
    id v46 = sub_10003A95C();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100094610();
    }
    goto LABEL_37;
  }

  -[os_log_s removeObject:](v13, "removeObject:", @"Media/PhotoData/Sync");
  [v10 setObject:v13 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"CameraRollDomain");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToRemoveOnRestore"]);

  if (!v15 || (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v16), (objc_opt_isKindOfClass(v15, v17) & 1) == 0))
  {
    id v50 = sub_10003A95C();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10009463C();
    }
    goto LABEL_44;
  }

  -[NSMutableArray removeObject:](v15, "removeObject:", @"Media/PhotoData/Sync");
  -[NSMutableArray removeObject:](v15, "removeObject:", @"Media/PhotoData/Metadata/PhotoData/Sync");
  [v10 setObject:v15 forKey:@"RelativePathsToRemoveOnRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"CameraRollDomain");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"HomeKitDomain"));

  if (v18)
  {
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v19);
    if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
    {
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v18, "objectForKey:", @"RelativePathsToRemoveOnRestore"));

      if ((v21 || (v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) != 0LL)
        && (uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v22), (objc_opt_isKindOfClass(v21, v23) & 1) != 0))
      {
        -[NSMutableArray addObject:](v21, "addObject:", @"Library/homed/protected-home.config");
        -[NSMutableArray addObject:](v21, "addObject:", @"Library/homed/datastore.sqlite");
        -[NSMutableArray addObject:](v21, "addObject:", @"Library/homed/datastore.sqlite-shm");
        -[NSMutableArray addObject:](v21, "addObject:", @"Library/homed/datastore.sqlite-wal");
        -[os_log_s setObject:forKey:](v18, "setObject:forKey:", v21, @"RelativePathsToRemoveOnRestore");
        -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v18, @"HomeKitDomain");
        v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKey:]( v18,  "objectForKey:",  @"RelativePathsNotToBackupToService"));

        if (!v15
          || (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v24), (objc_opt_isKindOfClass(v15, v25) & 1) == 0))
        {
          id v55 = sub_10003A95C();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            sub_100094A30();
          }
LABEL_54:

          goto LABEL_62;
        }

        -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite");
        -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite-shm");
        -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite-wal");
        -[os_log_s setObject:forKey:](v18, "setObject:forKey:", v15, @"RelativePathsNotToBackupToService");
        -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v18, @"HomeKitDomain");
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v18, "objectForKey:", @"RelativePathsNotToBackupInMegaBackup"));

        if (!v26
          || (uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v27), (objc_opt_isKindOfClass(v26, v28) & 1) == 0))
        {
          id v59 = sub_10003A95C();
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            sub_100094A5C();
          }

          goto LABEL_62;
        }

        [v26 removeObject:@"Library/homed/datastore.sqlite"];
        [v26 removeObject:@"Library/homed/datastore.sqlite-shm"];
        [v26 removeObject:@"Library/homed/datastore.sqlite-wal"];
        -[os_log_s setObject:forKey:](v18, "setObject:forKey:", v26, @"RelativePathsNotToBackupInMegaBackup");
        -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v18, @"HomeKitDomain");
        v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v18, "objectForKey:", @"RelativePathsToRestoreOnly"));

        if (v21)
        {
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v29);
          if ((objc_opt_isKindOfClass(v21, v30) & 1) != 0)
          {
            -[NSMutableArray removeObject:](v21, "removeObject:", @"Library/homed/protected-home.config");
            -[NSMutableArray removeObject:](v21, "removeObject:", @"Library/homed/datastore.sqlite");
            -[NSMutableArray removeObject:](v21, "removeObject:", @"Library/homed/datastore.sqlite-shm");
            -[NSMutableArray removeObject:](v21, "removeObject:", @"Library/homed/datastore.sqlite-wal");
            -[os_log_s setObject:forKey:](v18, "setObject:forKey:", v21, @"RelativePathsToRestoreOnly");
            -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v18, @"HomeKitDomain");
            v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKey:]( v18,  "objectForKey:",  @"RelativePathsToOnlyBackupEncrypted"));

            if (v15)
            {
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v31);
              if ((objc_opt_isKindOfClass(v15, v32) & 1) != 0)
              {
                -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/protected-home.config");
                -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite");
                -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite-shm");
                -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/homed/datastore.sqlite-wal");
                -[os_log_s setObject:forKey:]( v18,  "setObject:forKey:",  v15,  @"RelativePathsToOnlyBackupEncrypted");
                -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v18, @"HomeKitDomain");
                goto LABEL_24;
              }
            }

            id v119 = sub_10003A95C();
            v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              sub_100094AB4();
            }
            goto LABEL_54;
          }
        }

        id v116 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100094A88();
        }
      }

      else
      {
        id v52 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100094A04();
        }
      }

LABEL_62:
      goto LABEL_40;
    }
  }

@end