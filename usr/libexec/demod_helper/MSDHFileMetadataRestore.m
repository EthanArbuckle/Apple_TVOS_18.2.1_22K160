@interface MSDHFileMetadataRestore
- (BOOL)_gatherDeviceDemoUserAccountInfo;
- (BOOL)restoreAttributesUnder:(id)a3 fromManifestData:(id)a4;
- (MSDHFileMetadataRestore)initWithManifestUID:(id)a3 deviceUID:(id)a4;
- (NSMutableSet)pathsToSkip;
- (NSNumber)deviceGID;
- (NSNumber)deviceUID;
- (NSNumber)manifestUID;
- (NSString)deviceGroupName;
- (NSString)deviceUserName;
- (NSString)userHomePath;
- (id)_updateFile:(id)a3 withAttributes:(id)a4;
- (id)_updateFileAttributes:(id)a3;
- (id)_updateFileAttributesFromManifestData:(id)a3;
- (void)setDeviceGID:(id)a3;
- (void)setDeviceGroupName:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setDeviceUserName:(id)a3;
- (void)setManifestUID:(id)a3;
- (void)setPathsToSkip:(id)a3;
- (void)setUserHomePath:(id)a3;
@end

@implementation MSDHFileMetadataRestore

- (MSDHFileMetadataRestore)initWithManifestUID:(id)a3 deviceUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDHFileMetadataRestore;
  v8 = -[MSDHFileMetadataRestore init](&v12, "init");
  if (v8
    && (v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet),
        -[MSDHFileMetadataRestore setPathsToSkip:](v8, "setPathsToSkip:", v9),
        v9,
        -[MSDHFileMetadataRestore setManifestUID:](v8, "setManifestUID:", v6),
        -[MSDHFileMetadataRestore setDeviceUID:](v8, "setDeviceUID:", v7),
        -[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo](v8, "_gatherDeviceDemoUserAccountInfo")))
  {
    v10 = v8;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (BOOL)restoreAttributesUnder:(id)a3 fromManifestData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_autoreleasePoolPush();
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  id v9 = sub_100021D84();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]";
    __int16 v37 = 2114;
    id v38 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Restoring file attributes under: %{public}@",  buf,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore userHomePath](self, "userHomePath"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v11]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore pathsToSkip](self, "pathsToSkip"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
  [v13 addObject:v14];

  v15 = objc_alloc(&OBJC_CLASS___MSDManifest);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore userHomePath](self, "userHomePath"));
  v17 = -[MSDManifest initWithDictionary:andUserHomePath:](v15, "initWithDictionary:andUserHomePath:", v7, v16);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest pathSet](v17, "pathSet"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);

    id v20 = [v19 count];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001A5C4;
    block[3] = &unk_100044F08;
    v30 = &v31;
    v26 = (os_log_s *)v19;
    v27 = v17;
    id v28 = v6;
    v29 = self;
    dispatch_apply((size_t)v20, 0LL, block);
    BOOL v21 = *((_BYTE *)v32 + 24) != 0;

    v22 = v26;
  }

  else
  {
    id v23 = sub_100021D84();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002AD20(v22);
    }
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v31, 8);
  objc_autoreleasePoolPop(v8);

  return v21;
}

- (BOOL)_gatherDeviceDemoUserAccountInfo
{
  *__error() = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUID](self, "deviceUID"));
  v4 = getpwuid((uid_t)[v3 unsignedIntValue]);

  if (v4)
  {
    v5 = getgrgid(v4->pw_gid);
    if (v5)
    {
      id v6 = v5;
      id v7 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4->pw_name);
      -[MSDHFileMetadataRestore setDeviceUserName:](self, "setDeviceUserName:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4->pw_gid));
      -[MSDHFileMetadataRestore setDeviceGID:](self, "setDeviceGID:", v8);

      id v9 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v6->gr_name);
      -[MSDHFileMetadataRestore setDeviceGroupName:](self, "setDeviceGroupName:", v9);

      v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUserName](self, "deviceUserName"));
      v11 = NSHomeDirectoryForUser(v10);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[MSDHFileMetadataRestore setUserHomePath:](self, "setUserHomePath:", v12);

      return 1;
    }

    id v16 = sub_100021D84();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002AEA8(self, &v4->pw_gid, v15);
    }
  }

  else
  {
    id v14 = sub_100021D84();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002ADCC(self, v15);
    }
  }

  return 0;
}

- (id)_updateFileAttributesFromManifestData:(id)a3
{
  id v3 = a3;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  v4 = 0LL;
  v5 = 0LL;
  id v6 = 0LL;
  id v7 = 0LL;
  if (v25)
  {
    uint64_t v22 = *(void *)v29;
    while (2)
    {
      v8 = 0LL;
      id v9 = v4;
      v10 = v5;
      v11 = v6;
      objc_super v12 = v7;
      do
      {
        v27 = v9;
        v13 = obj;
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v8);
        v15 = objc_autoreleasePoolPush();
        v5 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v14]);

        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MSDManifestFileAttributes"]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MSDHFileMetadataRestore _updateFile:withAttributes:]( self,  "_updateFile:withAttributes:",  v14,  v6));

        if (!v7)
        {
          id v19 = sub_100021D84();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10002AF94();
          }

          objc_autoreleasePoolPop(v15);
          id v7 = 0LL;
          id v17 = 0LL;
          id v16 = v24;
          v18 = v27;
          goto LABEL_13;
        }

        v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

        [v4 setObject:v7 forKey:@"MSDManifestFileAttributes"];
        [v24 setObject:v4 forKey:v14];
        objc_autoreleasePoolPop(v15);
        v8 = (char *)v8 + 1;
        id v9 = v4;
        v10 = v5;
        v11 = v6;
        objc_super v12 = v7;
      }

      while (v25 != v8);
      id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v16 = v24;
  id v17 = v24;
  v18 = v4;
  v13 = obj;
LABEL_13:

  return v17;
}

- (id)_updateFile:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileOwnerAccountID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore manifestUID](self, "manifestUID"));
  unsigned __int8 v10 = [v8 isEqualToNumber:v9];

  if ((v10 & 1) != 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore _updateFileAttributes:](self, "_updateFileAttributes:", v7));
  }

  else
  {
    id v12 = sub_100021D84();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002B000((uint64_t)v6, (uint64_t)v8, v13);
    }

    id v11 = v7;
  }

  uint64_t v14 = v11;

  return v14;
}

- (id)_updateFileAttributes:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUserName](self, "deviceUserName"));
  [v4 setObject:v5 forKey:NSFileOwnerAccountName];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceGID](self, "deviceGID"));
  [v4 setObject:v6 forKey:NSFileGroupOwnerAccountID];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceGroupName](self, "deviceGroupName"));
  [v4 setObject:v7 forKey:NSFileGroupOwnerAccountName];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUID](self, "deviceUID"));
  [v4 setObject:v8 forKey:NSFileOwnerAccountID];

  return v4;
}

- (NSMutableSet)pathsToSkip
{
  return self->_pathsToSkip;
}

- (void)setPathsToSkip:(id)a3
{
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
}

- (NSNumber)manifestUID
{
  return self->_manifestUID;
}

- (void)setManifestUID:(id)a3
{
}

- (NSNumber)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
}

- (NSString)deviceUserName
{
  return self->_deviceUserName;
}

- (void)setDeviceUserName:(id)a3
{
}

- (NSNumber)deviceGID
{
  return self->_deviceGID;
}

- (void)setDeviceGID:(id)a3
{
}

- (NSString)deviceGroupName
{
  return self->_deviceGroupName;
}

- (void)setDeviceGroupName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end