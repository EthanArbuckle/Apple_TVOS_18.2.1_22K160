@interface MSDFileMetadata
+ (id)accessControlListWithPath:(id)a3;
+ (id)compareResultToNSString:(int)a3;
+ (id)extendedAttributeKeysWithPath:(id)a3;
+ (id)extendedAttributesWithPath:(id)a3;
+ (id)fileAttributesWithPath:(id)a3;
+ (id)fileHashWithPath:(id)a3;
+ (id)fileMetaDataWithMetadataDictionary:(id)a3;
+ (id)fileMetadatatWithPath:(id)a3;
+ (id)targetFileWithPath:(id)a3;
+ (id)valueForExtendedAttributesKey:(id)a3 forPath:(id)a4;
- (BOOL)removeAllExtendedAttributes:(id)a3;
- (BOOL)restoreAttribuesToPath:(id)a3;
- (MSDFileMetadata)initWithDictionary:(id)a3;
- (MSDFileMetadata)initWithPath:(id)a3;
- (NSData)getAccessControlList;
- (NSData)getHash;
- (NSDictionary)dict;
- (NSDictionary)getExtendedAttributes;
- (NSDictionary)getFileAttributes;
- (NSString)getFileType;
- (NSString)getTargetFile;
- (id)fileAttributesAllowSet:(id)a3;
- (int)compareWith:(id)a3;
- (int64_t)getFileSize;
- (void)dealloc;
@end

@implementation MSDFileMetadata

+ (id)fileHashWithPath:(id)a3
{
  id v3 = a3;
  char v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:&v13];

  if ((v5 & 1) != 0)
  {
    if (!v13)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](&OBJC_CLASS___NSURL, "fileURLWithString:", v3));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v7 fileHash]);

      if (v6) {
        goto LABEL_5;
      }
      id v9 = sub_10003A95C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Maybe it's an iCloud file (%{public}@)?",  buf,  0xCu);
      }
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }

  else
  {
    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100093C2C();
    }

    v6 = 0LL;
  }

+ (id)fileAttributesWithPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = 0LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v3 error:&v11]);
  id v6 = v11;
  id v7 = [v5 mutableCopy];

  if (v6)
  {
    id v10 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100093C8C((uint64_t)v3, v6);
    }
  }

  else
  {
    v12[0] = @"NSFileExtendedAttributes";
    v12[1] = NSFileReferenceCount;
    v12[2] = NSFileSystemNumber;
    v12[3] = NSFileSystemFileNumber;
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
    [v7 removeObjectsForKeys:v8];
  }

  return v7;
}

+ (id)extendedAttributeKeysWithPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  id v5 = v3;
  id v6 = (const char *)[v5 fileSystemRepresentation];
  ssize_t v7 = listxattr(v6, 0LL, 0LL, 1);
  if (v7 < 0)
  {
    id v19 = sub_10003A95C();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100093D10();
    }

    id v11 = 0LL;
    goto LABEL_14;
  }

  size_t v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v7));
  id v10 = v9;
  if (v8)
  {
    id v11 = v9;
    ssize_t v12 = listxattr(v6, (char *)[v11 mutableBytes], v8, 1);
    if (v12 > 0)
    {
      ssize_t v13 = v12;
      [v11 setLength:v12];
      ssize_t v14 = 0LL;
      do
      {
        id v15 = (char *)[v11 bytes] + v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
        [v4 addObject:v16];
        v14 += strlen(v15) + 1;
      }

      while (v14 < v13);
      goto LABEL_6;
    }

    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100093D7C();
    }

LABEL_14:
    v17 = 0LL;
    goto LABEL_7;
  }

+ (id)accessControlListWithPath:(id)a3
{
  id v3 = a3;
  file = acl_get_file((const char *)[v3 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (!file)
  {
    if (*__error() == 2)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
      goto LABEL_9;
    }

    id v17 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100093DE8();
    }

LABEL_21:
    id v10 = 0LL;
    goto LABEL_9;
  }

  id v5 = file;
  if (acl_valid(file))
  {
    id v12 = sub_10003A95C();
    ssize_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100093EEC();
    }
    goto LABEL_14;
  }

  ssize_t v6 = acl_size(v5);
  ssize_t v7 = malloc(v6);
  if (!v7)
  {
    id v14 = sub_10003A95C();
    ssize_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100093E54();
    }
LABEL_14:

    acl_free(v5);
    goto LABEL_21;
  }

  size_t v8 = v7;
  ssize_t v9 = acl_copy_ext(v7, v5, v6);
  if (v9 < 0)
  {
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100093E80();
    }

    id v10 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v9));
  }

  acl_free(v5);
  free(v8);
LABEL_9:

  return v10;
}

+ (id)valueForExtendedAttributesKey:(id)a3 forPath:(id)a4
{
  id v5 = a4;
  ssize_t v6 = (const char *)[a3 UTF8String];
  id v7 = v5;
  size_t v8 = (const char *)[v7 fileSystemRepresentation];
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  ssize_t v10 = getxattr(v8, v6, 0LL, 0LL, 0, 1);
  if (v10 < 0)
  {
    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100093F58();
    }
    goto LABEL_9;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v10));

  id v9 = v11;
  ssize_t v12 = getxattr(v8, v6, [v9 mutableBytes], v10, 0, 1);
  if (v12 < 0)
  {
    id v16 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100093FCC();
    }
LABEL_9:

    goto LABEL_4;
  }

  [v9 setLength:v12];
LABEL_4:

  return v9;
}

+ (id)extendedAttributesWithPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata extendedAttributeKeysWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "extendedAttributeKeysWithPath:",  v3));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    if ([v4 count])
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v19 = v4;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        id v8 = v7;
        id v9 = 0LL;
        uint64_t v10 = *(void *)v21;
        do
        {
          id v11 = 0LL;
          ssize_t v12 = v9;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v11);
            id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata valueForExtendedAttributesKey:forPath:]( &OBJC_CLASS___MSDFileMetadata,  "valueForExtendedAttributesKey:forPath:",  v13,  v3));

            [v5 setObject:v9 forKey:v13];
            id v11 = (char *)v11 + 1;
            ssize_t v12 = v9;
          }

          while (v8 != v11);
          id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v8);
      }

      else
      {
        id v9 = 0LL;
      }

      v4 = v19;
    }

    else
    {
      id v9 = 0LL;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v5));
  }

  else
  {
    id v17 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10009402C();
    }

    id v9 = 0LL;
    id v5 = 0LL;
    id v14 = 0LL;
  }

  id v15 = v14;

  return v15;
}

+ (id)targetFileWithPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationOfSymbolicLinkAtPath:v3 error:&v10]);
  id v6 = v10;

  if (v6)
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009408C((uint64_t)v3, v6);
    }
  }

  return v5;
}

- (MSDFileMetadata)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDFileMetadata;
  id v6 = -[MSDFileMetadata init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dict, a3);
  }

  return v7;
}

- (MSDFileMetadata)initWithPath:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MSDFileMetadata;
  id v5 = -[MSDFileMetadata init](&v21, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata fileAttributesWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "fileAttributesWithPath:",  v4));
    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[MSDFileMetadata extendedAttributesWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "extendedAttributesWithPath:",  v4));
      if (v8)
      {
        objc_super v9 = (void *)v8;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileType]);
        unsigned int v11 = [v10 isEqualToString:NSFileTypeSymbolicLink];

        if (v11)
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata targetFileWithPath:](&OBJC_CLASS___MSDFileMetadata, "targetFileWithPath:", v4));
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            [v6 setObject:v12 forKey:@"MSDManifestSymbolicLinkTargetFile"];

            [v6 setObject:v7 forKey:@"MSDManifestFileAttributes"];
            id v14 = 0LL;
            id v15 = 0LL;
LABEL_11:
            if ([v9 count]) {
              [v6 setObject:v9 forKey:@"MSDManifestFileExtendedAttributes"];
            }
            if (v14 && [v14 length]) {
              [v6 setObject:v14 forKey:@"MSDManifestFileACL"];
            }
            objc_storeStrong((id *)&v5->_dict, v6);

            goto LABEL_17;
          }

          goto LABEL_24;
        }

        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[MSDFileMetadata accessControlListWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "accessControlListWithPath:",  v4));
        if (!v16)
        {
LABEL_24:
          id v14 = v5;
          goto LABEL_26;
        }

        id v14 = (void *)v16;
        uint64_t v17 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](&OBJC_CLASS___MSDFileMetadata, "fileHashWithPath:", v4));
        if (v17)
        {
          id v15 = (void *)v17;
          [v6 setObject:v7 forKey:@"MSDManifestFileAttributes"];
          if ([v15 length]) {
            [v6 setObject:v15 forKey:@"MSDManifestFileHash"];
          }
          goto LABEL_11;
        }

LABEL_26:
        id v5 = 0LL;
LABEL_17:

        goto LABEL_18;
      }

      id v20 = sub_10003A95C();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100094170();
      }
    }

    else
    {
      id v19 = sub_10003A95C();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100094110();
      }
    }

    objc_super v9 = v5;
    goto LABEL_26;
  }

+ (id)fileMetadatatWithPath:(id)a3
{
  id v3 = a3;
  id v4 = -[MSDFileMetadata initWithPath:](objc_alloc(&OBJC_CLASS___MSDFileMetadata), "initWithPath:", v3);

  return v4;
}

+ (id)fileMetaDataWithMetadataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = -[MSDFileMetadata initWithDictionary:](objc_alloc(&OBJC_CLASS___MSDFileMetadata), "initWithDictionary:", v3);

  return v4;
}

- (void)dealloc
{
  dict = self->_dict;
  self->_dict = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSDFileMetadata;
  -[MSDFileMetadata dealloc](&v4, "dealloc");
}

- (BOOL)removeAllExtendedAttributes:(id)a3
{
  id v3 = a3;
  objc_super v4 = (const char *)[v3 fileSystemRepresentation];
  BOOL v5 = 1;
  ssize_t v6 = listxattr(v4, 0LL, 0LL, 1);
  if (v6 >= 1)
  {
    size_t v7 = v6;
    uint64_t v8 = (char *)malloc(v6);
    if (v8)
    {
      objc_super v9 = v8;
      ssize_t v10 = listxattr(v4, v8, v7, 1);
      if (v10 < 1)
      {
        id v18 = sub_10003A95C();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000941FC();
        }
      }

      else
      {
        unsigned int v11 = &v9[v10];
        uint64_t v12 = v9;
        while (!removexattr(v4, v12, 1))
        {
          v12 += strlen(v12) + 1;
          if (v12 >= v11)
          {
            BOOL v5 = 1;
            goto LABEL_8;
          }
        }

        id v14 = sub_10003A95C();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100094228();
        }
      }

      BOOL v5 = 0;
LABEL_8:
      free(v9);
    }

    else
    {
      id v16 = sub_10003A95C();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000941D0();
      }

      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)restoreAttribuesToPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  ssize_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
  unsigned int v7 = [v6 isEqualToString:NSFileTypeSymbolicLink];

  v77 = v5;
  if (v7)
  {
    id v8 = v4;
    objc_super v9 = (const char *)[v8 UTF8String];
    ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fileOwnerAccountID]);
    uid_t v12 = [v11 intValue];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fileGroupOwnerAccountID]);
    LODWORD(v9) = lchown(v9, v12, (gid_t)[v14 intValue]);

    if ((_DWORD)v9)
    {
      id v58 = sub_10003A95C();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100094504();
      }
    }

    else
    {
      id v15 = (const char *)[v8 UTF8String];
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      LODWORD(v15) = lchmod(v15, (mode_t)[v16 filePosixPermissions]);

      if (!(_DWORD)v15)
      {
        id v17 = 0LL;
        goto LABEL_8;
      }

      id v62 = sub_10003A95C();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_100094498();
      }
    }

    BOOL v56 = 0;
    id v17 = 0LL;
    goto LABEL_53;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata fileAttributesAllowSet:](self, "fileAttributesAllowSet:", v18));
  id v86 = 0LL;
  unsigned __int8 v20 = [v5 setAttributes:v19 ofItemAtPath:v4 error:&v86];
  id v17 = v86;

  if ((v20 & 1) == 0)
  {
    id v60 = sub_10003A95C();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata fileAttributesAllowSet:](self, "fileAttributesAllowSet:", v71));
      *(_DWORD *)buf = 138543874;
      id v89 = v4;
      __int16 v90 = 2114;
      v91 = v70;
      __int16 v92 = 2114;
      v93 = v72;
      _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "Could not set file attributes at %{public}@ with error - %{public}@, attributes = %{public}@",  buf,  0x20u);
    }

    BOOL v56 = 0;
    id v33 = 0LL;
    id v30 = 0LL;
    goto LABEL_41;
  }

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:NSFileProtectionKey]);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v22,  NSFileProtectionKey,  0LL));
  id v85 = v17;
  unsigned __int8 v24 = [v5 setAttributes:v23 ofItemAtPath:v4 error:&v85];
  id v25 = v85;

  if ((v24 & 1) == 0)
  {
    id v64 = sub_10003A95C();
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKey:NSFileProtectionKey]);
      *(_DWORD *)buf = 138543874;
      id v89 = v4;
      __int16 v90 = 2114;
      v91 = v73;
      __int16 v92 = 2114;
      v93 = v75;
      _os_log_error_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "Could not set file protection key at %{public}@ with error - %{public}@, attributes = %{public}@",  buf,  0x20u);
    }

    BOOL v56 = 0;
    id v33 = 0LL;
    id v30 = 0LL;
    id v17 = v25;
    goto LABEL_57;
  }

  id v17 = v25;
LABEL_8:
  if (!-[MSDFileMetadata removeAllExtendedAttributes:](self, "removeAllExtendedAttributes:", v4))
  {
    BOOL v56 = 0;
LABEL_53:
    id v33 = 0LL;
    id v30 = 0LL;
LABEL_57:
    BOOL v5 = v77;
    goto LABEL_41;
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](self, "getExtendedAttributes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);

  id obj = v27;
  id v28 = [v27 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (!v28)
  {
    id v30 = 0LL;
    goto LABEL_21;
  }

  id v29 = v28;
  id v76 = v17;
  id v30 = 0LL;
  id v31 = 0LL;
  uint64_t v79 = *(void *)v82;
  v80 = self;
  while (2)
  {
    for (i = 0LL; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v82 != v79) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(id *)(*((void *)&v81 + 1) + 8LL * (void)i);

      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString, v34);
      if ((objc_opt_isKindOfClass(v33, v35) & 1) == 0)
      {
        id v52 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_10009446C();
        }
        goto LABEL_34;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](v80, "getExtendedAttributes"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v33]);

      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSData, v38);
      if ((objc_opt_isKindOfClass(v37, v39) & 1) == 0)
      {
        id v54 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100094440();
        }
        id v30 = v37;
        goto LABEL_34;
      }

      id v40 = v4;
      v41 = (const char *)[v4 fileSystemRepresentation];
      id v31 = v33;
      v42 = (const char *)[v31 UTF8String];
      id v30 = v37;
      if (setxattr(v41, v42, [v30 bytes], (size_t)objc_msgSend(v30, "length"), 0, 1))
      {
        id v55 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_1000943E0();
        }
        id v4 = v40;
LABEL_34:
        BOOL v5 = v77;
        id v17 = v76;

        goto LABEL_40;
      }

      id v4 = v40;
    }

    id v29 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v29) {
      continue;
    }
    break;
  }

  id v17 = v76;
  self = v80;
LABEL_21:

  v43 = self;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
  unsigned __int8 v45 = [v44 isEqualToString:NSFileTypeSymbolicLink];

  BOOL v5 = v77;
  if ((v45 & 1) == 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v43, "getAccessControlList"));
    id v47 = [v46 length];

    if (v47)
    {
      id v48 = objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v43, "getAccessControlList"));
      v49 = acl_copy_int([v48 bytes]);

      if (!v49)
      {
        id v50 = sub_10003A95C();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_100094374();
        }
        goto LABEL_65;
      }

- (int)compareWith:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
    ssize_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 getFileType]);
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
      unsigned int v9 = [v8 isEqualToString:NSFileTypeRegular];

      if (v9
        && (ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getHash](self, "getHash")),
            unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 getHash]),
            unsigned int v12 = [v10 isEqualToData:v11],
            v11,
            v10,
            !v12))
      {
        int v47 = 2;
      }

      else
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
        unsigned int v14 = [v13 isEqualToString:NSFileTypeSymbolicLink];

        if (!v14
          || (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getTargetFile](self, "getTargetFile")),
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 getTargetFile]),
              unsigned int v17 = [v15 isEqualToString:v16],
              v16,
              v15,
              v17))
        {
          BOOL v56 = self;
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
          v57 = v4;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 getFileAttributes]);
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          id v20 = v18;
          id v21 = [v20 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v58 = *(void *)v64;
            while (2)
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v64 != v58) {
                  objc_enumerationMutation(v20);
                }
                unsigned __int8 v24 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
                if (([v24 isEqualToString:NSFileGroupOwnerAccountID] & 1) != 0
                  || ([v24 isEqualToString:NSFileOwnerAccountID] & 1) != 0
                  || [v24 isEqualToString:NSFilePosixPermissions])
                {
                  id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v24]);
                  id v26 = v20;
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v24]);
                  unsigned int v28 = [v25 isEqual:v27];

                  id v20 = v26;
                  if (!v28)
                  {
                    int v47 = 4;
                    uint64_t v34 = v26;
                    uint64_t v35 = v19;
                    id v4 = v57;
                    goto LABEL_54;
                  }
                }

                if ([v24 isEqualToString:NSFileProtectionKey])
                {
                  id v29 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v24]);
                  id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v24]);
                  if (([v29 isEqualToString:v30] & 1) == 0)
                  {
                    unsigned __int8 v31 = [v29 isEqualToString:NSFileProtectionNone];
                    unsigned __int8 v32 = v30 ? 0 : v31;
                    if ((v32 & 1) == 0
                      && !v29
                      && ([v30 isEqualToString:NSFileProtectionNone] & 1) != 0)
                    {
                      int v47 = 4;
                      uint64_t v35 = v19;
                      uint64_t v34 = v20;
LABEL_52:
                      id v4 = v57;
                      goto LABEL_53;
                    }
                  }
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v63 objects:v68 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          id v33 = v56;
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](v56, "getExtendedAttributes"));

          id v4 = v57;
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v57 getExtendedAttributes]);

          if (v34)
          {
            if (v35)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v34));
              id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v35));
              [v36 removeObjectForKey:@"com.apple.assetsd.dbRebuildUuid"];
              [v30 removeObjectForKey:@"com.apple.assetsd.dbRebuildUuid"];
              id v37 = [v36 count];
              if (v37 != [v30 count])
              {
                int v47 = 4;
                id v20 = v36;
                goto LABEL_53;
              }

              __int128 v61 = 0u;
              __int128 v62 = 0u;
              __int128 v59 = 0u;
              __int128 v60 = 0u;
              id v38 = v36;
              id v39 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
              if (v39)
              {
                id v40 = v39;
                uint64_t v41 = *(void *)v60;
                while (2)
                {
                  for (j = 0LL; j != v40; j = (char *)j + 1)
                  {
                    if (*(void *)v60 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)j);
                    v44 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:v43]);
                    unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v43]);
                    unsigned int v46 = [v44 isEqualToData:v45];

                    if (!v46)
                    {
                      id v20 = v38;

                      int v47 = 4;
                      goto LABEL_52;
                    }
                  }

                  id v40 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
                  if (v40) {
                    continue;
                  }
                  break;
                }
              }

              id v33 = v56;
              id v4 = v57;
LABEL_47:
              id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](v33, "getFileType"));
              unsigned __int8 v49 = [v48 isEqualToString:NSFileTypeSymbolicLink];

              if ((v49 & 1) != 0)
              {
                int v47 = 5;
                goto LABEL_55;
              }

              id v20 = (id)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v33, "getAccessControlList"));
              uint64_t v51 = objc_claimAutoreleasedReturnValue([v4 getAccessControlList]);
              id v30 = (void *)v51;
              if (v20)
              {
                if (v51)
                {
                  id v52 = v20;
                  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v56, "getAccessControlList"));
                  id v54 = (void *)objc_claimAutoreleasedReturnValue([v4 getAccessControlList]);
                  unsigned __int8 v55 = [v53 isEqualToData:v54];

                  id v20 = v52;
                  if ((v55 & 1) != 0) {
                    goto LABEL_60;
                  }
                }
              }

              else if (!v51)
              {
LABEL_60:
                int v47 = 5;
                goto LABEL_53;
              }

              int v47 = 4;
LABEL_53:

LABEL_54:
              goto LABEL_55;
            }
          }

          else
          {
            if (!v35) {
              goto LABEL_47;
            }
            uint64_t v34 = 0LL;
          }

          int v47 = 4;
LABEL_55:

          goto LABEL_56;
        }

        int v47 = 3;
      }
    }

    else
    {
      int v47 = 1;
    }
  }

  else
  {
    int v47 = 0;
  }

- (id)fileAttributesAllowSet:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSFileBusy,  NSFileHFSCreatorCode,  NSFileHFSTypeCode,  NSFileImmutable,  NSFileCreationDate,  NSFileExtensionHidden,  NSFileGroupOwnerAccountID,  NSFileGroupOwnerAccountName,  NSFileModificationDate,  NSFileOwnerAccountID,  NSFileOwnerAccountName,  NSFilePosixPermissions,  0LL));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  ssize_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));

  [v6 removeObjectsInArray:v4];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));

  [v7 removeObjectsForKeys:v6];
  return v7;
}

- (NSData)getHash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileHash"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0LL;
  }

  return (NSData *)v2;
}

- (NSDictionary)getFileAttributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileAttributes"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0LL;
  }

  return (NSDictionary *)v2;
}

- (NSDictionary)getExtendedAttributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileExtendedAttributes"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0LL;
  }

  return (NSDictionary *)v2;
}

- (NSData)getAccessControlList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileACL"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0LL;
  }

  return (NSData *)v2;
}

- (NSString)getFileType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileAttributes"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:NSFileType]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {

    uint64_t v3 = 0LL;
  }

  return (NSString *)v3;
}

- (NSString)getTargetFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestSymbolicLinkTargetFile"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0LL;
  }

  return (NSString *)v2;
}

- (int64_t)getFileSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"MSDManifestFileAttributes"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fileType]);
  unsigned int v4 = [v3 isEqualToString:@"NSFileTypeRegular"];

  if (v4) {
    id v5 = [v2 fileSize];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

+ (id)compareResultToNSString:(int)a3
{
  else {
    return off_1000F99D0[a3];
  }
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

@end