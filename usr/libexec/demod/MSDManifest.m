@interface MSDManifest
- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5;
- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6;
- (BOOL)addFilesUsingSourceManifest:(id)a3;
- (BOOL)enumerateAndCollectMetaData:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6 handler:(id)a7;
- (BOOL)folder:(id)a3 contains:(id)a4;
- (BOOL)path:(id)a3 inSuperSet:(id)a4;
- (MSDManifest)init;
- (MSDManifest)initWithDictionary:(id)a3;
- (MSDManifest)initWithDictionary:(id)a3 andUserHomePath:(id)a4;
- (NSDictionary)dict;
- (NSSet)pathSet;
- (NSString)rootPath;
- (id)metadataForFile:(id)a3;
- (void)dealloc;
- (void)setDict:(id)a3;
- (void)setMetadata:(id)a3 forFile:(id)a4;
- (void)setRootPath:(id)a3;
@end

@implementation MSDManifest

- (MSDManifest)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDManifest;
  v2 = -[MSDManifest init](&v7, "init");
  if (v2)
  {
    v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    dict = v2->_dict;
    v2->_dict = v3;

    rootPath = v2->_rootPath;
    v2->_rootPath = 0LL;
  }

  return v2;
}

- (MSDManifest)initWithDictionary:(id)a3
{
  return -[MSDManifest initWithDictionary:andUserHomePath:](self, "initWithDictionary:andUserHomePath:", a3, 0LL);
}

- (MSDManifest)initWithDictionary:(id)a3 andUserHomePath:(id)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDManifest;
  v6 = -[MSDManifest init](&v12, "init");
  objc_super v7 = v6;
  if (v6)
  {
    rootPath = v6->_rootPath;
    v6->_rootPath = 0LL;

    v9 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v5);
    dict = v7->_dict;
    v7->_dict = v9;
  }

  return v7;
}

- (void)dealloc
{
  dict = self->_dict;
  self->_dict = 0LL;

  rootPath = self->_rootPath;
  self->_rootPath = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDManifest;
  -[MSDManifest dealloc](&v5, "dealloc");
}

- (id)metadataForFile:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata fileMetaDataWithMetadataDictionary:]( &OBJC_CLASS___MSDFileMetadata,  "fileMetaDataWithMetadataDictionary:",  v3));
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

- (void)setMetadata:(id)a3 forFile:(id)a4
{
  dict = self->_dict;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 dict]);
  -[NSMutableDictionary setObject:forKey:](dict, "setObject:forKey:", v7, v6);
}

- (BOOL)folder:(id)a3 contains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v6, "rangeOfString:", v11, (void)v17))
        {
          v13 = v12;
          if (v12 == [v6 length]
            || (uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:v13]),
                v15 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v14]),
                (id)v14,
                LOBYTE(v14) = [v15 isEqualToString:v6],
                v15,
                (v14 & 1) != 0))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)addFilesUsingSourceManifest:(id)a3
{
  id v4 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 rootPath]);
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 rootPath]);
      unsigned __int8 v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) != 0)
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v4 dict]);
        id v12 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v12)
        {
          id v13 = v12;
          id v32 = v4;
          uint64_t v35 = *(void *)v38;
          char v33 = 1;
          do
          {
            uint64_t v14 = 0LL;
            do
            {
              if (*(void *)v38 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v14);
              v16 = objc_autoreleasePoolPush();
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v15]);

              if ([v36 fileExistsAtPath:v18])
              {
                __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata fileMetadatatWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "fileMetadatatWithPath:",  v18));
                if (v19)
                {
                  __int128 v20 = v19;
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s getFileType](v19, "getFileType"));
                  unsigned int v22 = [v21 isEqualToString:NSFileTypeSymbolicLink];

                  if (v22)
                  {
                    id v24 = sub_10003A95C();
                    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v42 = "-[MSDManifest addFilesUsingSourceManifest:]";
                      __int16 v43 = 2114;
                      v44 = v18;
                      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: %{public}@ is a symlink. Skipping.",  buf,  0x16u);
                    }
                  }

                  else
                  {
                    -[MSDManifest setMetadata:forFile:](self, "setMetadata:forFile:", v20, v15);
                  }
                }

                else
                {
                  id v23 = sub_10003A95C();
                  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v42 = "-[MSDManifest addFilesUsingSourceManifest:]";
                    __int16 v43 = 2114;
                    v44 = v18;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to get metadata for file: %{public}@. Skipping.",  buf,  0x16u);
                  }

                  char v33 = 0;
                }
              }

              objc_autoreleasePoolPop(v16);
              uint64_t v14 = (char *)v14 + 1;
            }

            while (v13 != v14);
            id v26 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
            id v13 = v26;
          }

          while (v26);
          id v4 = v32;
          char v27 = v33;
        }

        else
        {
          char v27 = 1;
        }

        goto LABEL_29;
      }
    }

    else
    {
    }
  }

  id v28 = sub_10003A95C();
  id obj = (id)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR)) {
    sub_1000975B0((os_log_s *)obj, v29, v30);
  }
  char v27 = 0;
LABEL_29:

  return v27 & 1;
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5
{
  return -[MSDManifest addFilesFromPath:relativeTo:skip:superSet:]( self,  "addFilesFromPath:relativeTo:skip:superSet:",  a3,  a4,  a5,  0LL);
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003DC00;
  v7[3] = &unk_1000F9DC0;
  v7[4] = self;
  return -[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]( self,  "enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:",  a3,  a4,  a5,  a6,  v7);
}

- (BOOL)path:(id)a3 inSuperSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:@"/private"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(@"/private", "length")));

    id v5 = (id)v7;
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "hasPrefix:",  v5,  (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (BOOL)enumerateAndCollectMetaData:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int128 v17 = v16;
  if (self->_rootPath)
  {
    id v18 = sub_10003A95C();
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100097728(v19);
    }
    BOOL v20 = 0;
    goto LABEL_55;
  }

  v77 = self;
  p_rootPath = &self->_rootPath;
  v73 = (uint64_t (**)(void, void *, __CFString *))v16;
  id v69 = v13;
  objc_storeStrong((id *)&self->_rootPath, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v75 = v12;
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLIsRegularFileKey,  NSURLIsSymbolicLinkKey,  0LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( [v21 enumeratorAtURL:v22 includingPropertiesForKeys:v23 options:0 errorHandler:&stru_1000F9E00]);

  v79 = v24;
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 nextObject]);
  id v26 = 0LL;
  id v27 = 0LL;
  id v28 = 0LL;
  id v29 = 0LL;
  v74 = 0LL;
  char v78 = 0;
  BOOL v30 = v25 == 0;
  id v76 = v15;
  while (1)
  {
    id v31 = v14;
    id v32 = v28;
    char v33 = v27;
    v34 = v26;
    context = objc_autoreleasePoolPush();
    __int128 v19 = (os_log_s *)v25;
    if (v30)
    {
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v75));
      char v78 = 1;
    }

    id v85 = 0LL;
    id v86 = 0LL;
    unsigned __int8 v35 = -[os_log_s getResourceValue:forKey:error:]( v19,  "getResourceValue:forKey:error:",  &v86,  NSURLIsRegularFileKey,  &v85);
    id v27 = v86;

    id v36 = v85;
    if ((v35 & 1) == 0)
    {
      id v58 = sub_10003A95C();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
        *(_DWORD *)buf = 138543618;
        NSURLResourceKey v90 = NSURLIsRegularFileKey;
        __int16 v91 = 2114;
        v92 = v62;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Could not get resource for key %{public}@ for %{public}@",  buf,  0x16u);
      }

      v71 = 0LL;
      goto LABEL_42;
    }

    id v83 = 0LL;
    id v84 = 0LL;
    unsigned __int8 v37 = -[os_log_s getResourceValue:forKey:error:]( v19,  "getResourceValue:forKey:error:",  &v84,  NSURLIsDirectoryKey,  &v83);
    id v26 = v84;

    id v38 = v83;
    if ((v37 & 1) == 0)
    {
      id v59 = sub_10003A95C();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v71 = 0LL;
        id v36 = v38;
        v34 = v26;
        v56 = v60;
        goto LABEL_42;
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
      *(_DWORD *)buf = 138543618;
      NSURLResourceKey v90 = NSURLIsDirectoryKey;
      __int16 v91 = 2114;
      v92 = v63;
      _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Could not get resource for key %{public}@ for %{public}@",  buf,  0x16u);

      v71 = 0LL;
      id v36 = v38;
      v56 = v60;
LABEL_41:
      v34 = v26;
LABEL_42:

      id v29 = v36;
      id v28 = v32;
      id v26 = v34;
      id v14 = v31;
      id v15 = v76;
      v54 = context;
      v53 = v71;
      goto LABEL_35;
    }

    id v82 = 0LL;
    id v81 = 0LL;
    unsigned __int8 v39 = -[os_log_s getResourceValue:forKey:error:]( v19,  "getResourceValue:forKey:error:",  &v82,  NSURLIsSymbolicLinkKey,  &v81);
    id v28 = v82;

    id v29 = v81;
    if ((v39 & 1) == 0)
    {
      id v61 = sub_10003A95C();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
        *(_DWORD *)buf = 138543618;
        NSURLResourceKey v90 = NSURLIsSymbolicLinkKey;
        __int16 v91 = 2114;
        v92 = v57;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Could not get resource for key %{public}@ for %{public}@",  buf,  0x16u);
LABEL_38:
      }

- (NSSet)pathSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_dict, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRootPath:(id)a3
{
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end