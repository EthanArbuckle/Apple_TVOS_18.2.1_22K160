@interface WhitelistChecker
- (BOOL)annotated:(id)a3;
- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4;
- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4;
- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4;
- (BOOL)file:(id)a3 blacklisted:(id)a4;
- (BOOL)file:(id)a3 whitelisted:(id)a4;
- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4;
- (BOOL)load;
- (BOOL)loadFromFile:(id)a3;
- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4;
- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4;
- (NSDictionary)domains;
- (NSSet)blackListedPaths;
- (NSString)domainsPlistFilePath;
- (WhitelistChecker)init;
- (id)checkManifest:(id)a3;
- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5;
- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4;
- (void)setBlackListedPaths:(id)a3;
- (void)setDomains:(id)a3;
- (void)setDomainsPlistFilePath:(id)a3;
@end

@implementation WhitelistChecker

- (WhitelistChecker)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WhitelistChecker;
  v2 = -[WhitelistChecker init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[WhitelistChecker setDomainsPlistFilePath:]( v2,  "setDomainsPlistFilePath:",  @"/System/Library/PrivateFrameworks/MobileBackup.framework/Domains.plist");
  }
  return v3;
}

- (BOOL)load
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v4 = [v3 macOS];

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByStandardizingPath]);
    v40[0] = v5;
    v40[1] = @"/Library/Apple";
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    -[WhitelistChecker setBlackListedPaths:](self, "setBlackListedPaths:", v7);

    return 1;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  if ([v8 iOS])
  {
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v10 = [v9 rOS];

    if (!v10)
    {
      id v17 = sub_10001A180();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[WhitelistChecker setDomains:](self, "setDomains:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
      if (v19) {
        return 1;
      }
      id v31 = sub_100021D84();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10002CCF4(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      return 0;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domainsPlistFilePath](self, "domainsPlistFilePath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDomainsPlistPatcher patchDomainsPlist:]( &OBJC_CLASS___MSDDomainsPlistPatcher,  "patchDomainsPlist:",  v11));
  if (v12 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"SystemDomains"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v14));
    -[WhitelistChecker setDomains:](self, "setDomains:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
    if (v16)
    {

      return 1;
    }

    id v23 = sub_100021D84();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002CCC0(v22, v24, v25, v26, v27, v28, v29, v30);
    }
  }

  else
  {
    id v21 = sub_100021D84();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002CC50((uint64_t)v11, v22);
    }
  }

  return 0;
}

- (BOOL)loadFromFile:(id)a3
{
  return -[WhitelistChecker load](self, "load");
}

- (id)checkManifest:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v6 = v4;
  id v26 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v26) {
    goto LABEL_20;
  }
  uint64_t v25 = *(void *)v28;
  v8 = &selRef_orPredicateWithSubpredicates_;
  *(void *)&__int128 v7 = 136315394LL;
  __int128 v23 = v7;
  id v24 = v6;
  do
  {
    for (i = 0LL; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v28 != v25) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10, v23));
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[WhitelistChecker getRealPathForFile:withMetaData:]( self,  "getRealPathForFile:withMetaData:",  v10,  v11));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 + 375 sharedInstance]);
      unsigned int v14 = [v13 macOS];

      if (v14)
      {
        if (-[WhitelistChecker checkFile_macOS:withMetaData:](self, "checkFile_macOS:withMetaData:", v12, v11)) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 + 375 sharedInstance]);
      if ([v15 iOS])
      {

LABEL_12:
        unsigned __int8 v18 = -[WhitelistChecker checkFile_iOS:withMetaData:](self, "checkFile_iOS:withMetaData:", v12, v11);
        goto LABEL_14;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 + 375 sharedInstance]);
      unsigned int v17 = [v16 rOS];

      if (v17) {
        goto LABEL_12;
      }
      unsigned __int8 v18 = -[WhitelistChecker checkFile_WatchAndTV:withMetaData:](self, "checkFile_WatchAndTV:withMetaData:", v12, v11);
LABEL_14:
      id v6 = v24;
      v8 = &selRef_orPredicateWithSubpredicates_;
      if ((v18 & 1) != 0) {
        goto LABEL_18;
      }
LABEL_15:
      id v19 = sub_100021D84();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v23;
        v32 = "-[WhitelistChecker checkManifest:]";
        __int16 v33 = 2114;
        uint64_t v34 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s:%{public}@ failed the check.",  buf,  0x16u);
      }

      -[NSMutableArray addObject:](v5, "addObject:", v10);
LABEL_18:
    }

    id v26 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  }

  while (v26);
LABEL_20:

  if (-[NSMutableArray count](v5, "count")) {
    id v21 = -[NSMutableArray copy](v5, "copy");
  }
  else {
    id v21 = 0LL;
  }

  return v21;
}

- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker blackListedPaths](self, "blackListedPaths"));
  unsigned __int8 v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Media",  @"/var/mobile/Library/Backup/SystemContainers/",  @"/var/mobile/Library/IdentityServices/Persistence/DoNotBackup",  @"/var/root/Library/Backup/SystemContainers/",  @"/var/wireless/Library/Preferences/com.apple.awdd.persistent.plist",  @"/var/wireless/Library/Preferences/com.apple.awdd.plist",  @"/var/MobileSoftwareUpdate/.MAAMigrated.plist",  @"/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs",  0LL));
  if (!-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v8)
    && !-[WhitelistChecker annotated:](self, "annotated:", v7))
  {
    uint64_t v34 = v8;
    id v35 = v7;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
    id v40 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (!v40)
    {
      v41 = 0LL;
      uint64_t v10 = 0LL;
      char v42 = 0;
      goto LABEL_33;
    }

    char v42 = 0;
    v41 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v39 = *(void *)v45;
    id v38 = v6;
    uint64_t v36 = self;
    while (1)
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_autoreleasePoolPush();
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RootPath"]);
        if (!v16)
        {
          id v30 = sub_100021D84();
          __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v49 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "No root path find in domain %{public}@",  buf,  0xCu);
          }

          id v18 = 0LL;
          char v27 = 0;
          goto LABEL_16;
        }

        v43 = v13;
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RelativePathsToBackupAndRestore"]);
        id v18 = [v17 mutableCopy];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RelativePathsToOnlyBackupEncrypted"]);
        [v18 addObjectsFromArray:v19];

        v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RelativePathsToRestoreOnly"]);
        [v18 addObjectsFromArray:v20];

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"]);
        [v18 addObjectsFromArray:v21];

        uint64_t v22 = objc_claimAutoreleasedReturnValue( -[WhitelistChecker createFullPathList:rootPath:isAllowList:]( self,  "createFullPathList:rootPath:isAllowList:",  v18,  v16,  1LL));
        if (!v22)
        {
          id v31 = sub_100021D84();
          __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v49 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Cannot create allow list for domain %{public}@",  buf,  0xCu);
          }

          char v27 = 0;
          uint64_t v10 = 0LL;
          uint64_t v13 = v43;
          goto LABEL_16;
        }

        if (-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v22))
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue([v15 objectForKey:@"RelativePathsNotToRestore"]);

          uint64_t v24 = objc_claimAutoreleasedReturnValue( -[WhitelistChecker createFullPathList:rootPath:isAllowList:]( self,  "createFullPathList:rootPath:isAllowList:",  v23,  v16,  0LL));
          if (-[WhitelistChecker file:blacklisted:](self, "file:blacklisted:", v6, v24))
          {
            id v25 = sub_100021D84();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v49 = v6;
              __int16 v50 = 2114;
              v51 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is black listed in %{public}@",  buf,  0x16u);
            }

            char v42 = 1;
            id v18 = (id)v23;
            char v27 = 1;
            v41 = (void *)v24;
            uint64_t v10 = (void *)v22;
            uint64_t v13 = v43;
            __int128 v28 = v26;
            self = v36;
LABEL_16:

            int v29 = 0;
            goto LABEL_20;
          }

          int v29 = 0;
          char v42 = 1;
          id v18 = (id)v23;
          char v27 = 1;
          v41 = (void *)v24;
        }

        else
        {
          int v29 = 1;
          char v27 = v42;
        }

        uint64_t v10 = (void *)v22;
        uint64_t v13 = v43;
LABEL_20:

        objc_autoreleasePoolPop(v13);
        if (!v29)
        {
          char v42 = v27;
          id v6 = v38;
          goto LABEL_33;
        }

        v11 = (char *)v11 + 1;
        id v6 = v38;
      }

      while (v40 != v11);
      id v32 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      id v40 = v32;
      if (!v32)
      {
LABEL_33:

        v8 = v34;
        id v7 = v35;
        v9 = v41;
        goto LABEL_34;
      }
    }
  }

  v9 = 0LL;
  uint64_t v10 = 0LL;
  char v42 = 1;
LABEL_34:

  return v42 & 1;
}

- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ContentRootDomain"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Media",  @"/var/containers/",  0LL));
  [v10 addObject:@"/var/mobile/Library/"];
  if (-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v11)
    || -[WhitelistChecker annotated:](self, "annotated:", v7))
  {
    BOOL v12 = 1;
  }

  else
  {
    BOOL v12 = -[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v10);
  }

  return v12;
}

- (BOOL)annotated:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  if ([v4 iOS])
  {

    id v5 = @"MBRestoreAnnotation";
    id v6 = &off_100049C18;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v8 = [v7 rOS];

    if (v8) {
      id v6 = &off_100049C18;
    }
    else {
      id v6 = &off_100049C30;
    }
    if (v8) {
      id v5 = @"MBRestoreAnnotation";
    }
    else {
      id v5 = @"MSDAnnotation";
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"MSDManifestFileExtendedAttributes"]);

  BOOL v13 = 0;
  if (v9)
  {
    if ([v9 count])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
      v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v10, 4LL);
      unsigned __int8 v12 = [v6 containsObject:v11];

      if ((v12 & 1) != 0) {
        BOOL v13 = 1;
      }
    }
  }

  return v13;
}

- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5
{
  BOOL v19 = a5;
  id v6 = a3;
  id v21 = a4;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = objc_autoreleasePoolPush();
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@"#"]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByTrimmingCharactersInSet:v15]);

        if ([v16 length])
        {
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v16]);
          [v22 addObject:v17];
        }

        objc_autoreleasePoolPop(v12);
      }

      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }

  if (v19 && ![v22 count]) {
    [v22 addObject:v21];
  }

  return v22;
}

- (BOOL)file:(id)a3 whitelisted:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v14) || !objc_msgSend(v11, "rangeOfString:", v5))
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)file:(id)a3 blacklisted:(id)a4
{
  id v5 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v20))
        {
          uint64_t v13 = v12;
          id v14 = [v5 length];
          if (v14 == [v11 length])
          {
            BOOL v16 = 1;
            goto LABEL_14;
          }

          id v15 = [v5 length];
          if (v15 > [v11 length])
          {
            BOOL v16 = 1;
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v13, 1));
            unsigned __int8 v18 = [v17 isEqualToString:@"/"];

            if ((v18 & 1) != 0) {
              goto LABEL_14;
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 valueForKey:@"MSDManifestFileAttributes"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"NSFileType"]);
  if (([v7 isEqualToString:@"NSFileTypeRegular"] & 1) != 0
    || [v7 isEqualToString:@"NSFileTypeDirectory"])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 stringByStandardizingPath]);
    if (([v5 isEqualToString:v8] & 1) == 0)
    {
      id v9 = sub_100021D84();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10002CD28((uint64_t)v5, (uint64_t)v8, v10);
      }
    }
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    uint64_t v6 = 13LL;
  }
  else {
    uint64_t v6 = 12LL;
  }
  id v7 = v5;
  uint64_t v8 = container_create_or_lookup_path_for_current_user( v6,  [v7 cStringUsingEncoding:4],  0,  0,  &v21,  v22);
  if (v8) {
    BOOL v9 = v21 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v10 = 0LL;
    id v14 = 0LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"file://%s", v8));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](&OBJC_CLASS___NSURL, "fileURLWithString:", v11));
    id v20 = 0LL;
    id v19 = 0LL;
    unsigned int v13 = [v12 getResourceValue:&v20 forKey:NSURLIsExcludedFromBackupKey error:&v19];
    id v14 = v20;
    id v15 = v19;
    uint64_t v10 = v15;
    if (v13 && [v14 BOOLValue])
    {
      id v16 = sub_100021D84();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v24 = "-[WhitelistChecker shouldRestoreSystemContainer_iOS:shared:]";
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s:Container check failed for %{public}@. But still restoring.",  buf,  0x16u);
      }
    }
  }

  return 1;
}

- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SystemContainerDomain"]);

  LOBYTE(v6) = [v7 containsObject:v5];
  return (char)v6;
}

- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v8 = [v7 iOS];

  BOOL v9 = v8 == 0;
  if (v8) {
    uint64_t v10 = &off_100049C60;
  }
  else {
    uint64_t v10 = &off_100049C90;
  }
  if (v9) {
    v11 = &off_100049C78;
  }
  else {
    v11 = &off_100049C48;
  }
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  if (v9) {
    uint64_t v12 = 6LL;
  }
  else {
    uint64_t v12 = 8LL;
  }
  id v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16, self);
  id v36 = (id)v12;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        if ([v5 rangeOfString:v17] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned __int8 v18 = v6;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:v17 withString:&stru_1000457D8]);
          int v20 = 1;
          goto LABEL_20;
        }
      }

      id v14 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  unsigned __int8 v18 = v6;
  id v19 = 0LL;
  int v20 = 0;
LABEL_20:
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v21 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    while (2)
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v10);
        }
        uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
        if ([v5 rangeOfString:v25] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:v25 withString:&stru_1000457D8]);

          BOOL v26 = 0LL;
          id v19 = (void *)v28;
          goto LABEL_31;
        }
      }

      id v22 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  BOOL v26 = 1LL;
  if (!v20)
  {
    char v27 = 0LL;
    goto LABEL_36;
  }

- (NSSet)blackListedPaths
{
  return self->_blackListedPaths;
}

- (void)setBlackListedPaths:(id)a3
{
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSString)domainsPlistFilePath
{
  return self->_domainsPlistFilePath;
}

- (void)setDomainsPlistFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end