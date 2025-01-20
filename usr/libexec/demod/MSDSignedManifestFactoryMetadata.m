@interface MSDSignedManifestFactoryMetadata
+ (id)languageIdentifiersForMetadataList:(id)a3;
+ (id)loadManifestMetadata:(id)a3;
+ (id)metadataWithLanugageIdentifier:(id)a3 fromList:(id)a4;
- (BOOL)isPrimaryBundle;
- (MSDSignedManifestFactoryMetadata)initWithContentPlistFile:(id)a3;
- (NSArray)supportedRegions;
- (NSString)bundleID;
- (NSString)fileName;
- (NSString)languageIdentifier;
- (NSString)name;
- (NSString)regionCode;
- (id)description;
@end

@implementation MSDSignedManifestFactoryMetadata

+ (id)loadManifestMetadata:(id)a3
{
  uint64_t v33 = 0LL;
  v34[0] = &v33;
  v34[1] = 0x3032000000LL;
  v34[2] = sub_10008B460;
  v34[3] = sub_10008B470;
  id v3 = a3;
  id v35 = v3;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = sub_10008B460;
  v31[4] = sub_10008B470;
  id v32 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10008B460;
  v29 = sub_10008B470;
  id v30 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (([v5 fileExistsAtPath:*(void *)(v34[0] + 40) isDirectory:&v36] & 1) == 0)
  {
    id v9 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000A0268((uint64_t)v34, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_9;
  }

  if (!v36)
  {
    id v17 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000A01FC((uint64_t)v34, v10, v18, v19, v20, v21, v22, v23);
    }
LABEL_9:

    v6 = 0LL;
    goto LABEL_4;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:*(void *)(v34[0] + 40) error:0]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10008B478;
  v24[3] = &unk_1000FACA0;
  v24[4] = &v33;
  v24[5] = v31;
  v24[6] = &v25;
  [v6 enumerateObjectsUsingBlock:v24];
LABEL_4:
  id v7 = [(id)v26[5] copy];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v7;
}

+ (id)languageIdentifiersForMetadataList:(id)a3
{
  id v3 = a3;
  v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___MSDSignedManifestFactoryMetadata, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "languageIdentifier", (void)v17));
          if (v14) {
            [v5 addObject:v14];
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  id v15 = [v5 copy];
  return v15;
}

+ (id)metadataWithLanugageIdentifier:(id)a3 fromList:(id)a4
{
  id v5 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = a4;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___MSDSignedManifestFactoryMetadata, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "languageIdentifier", (void)v15));
          if ([v13 isEqualToString:v5])
          {
            id v8 = v11;

            goto LABEL_13;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (MSDSignedManifestFactoryMetadata)initWithContentPlistFile:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MSDSignedManifestFactoryMetadata;
  id v5 = -[MSDSignedManifestFactoryMetadata init](&v40, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if ([v6 fileExistsAtPath:v4])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v4));
      id v8 = sub_10003A95C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v42 = v4;
          __int16 v43 = 2114;
          v44 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Content.plist at path %{public}@: %{public}@",  buf,  0x16u);
        }

        uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Name"]);
        name = v5->_name;
        v5->_name = (NSString *)v11;

        uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ManifestBundleID"]);
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v13;

        uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ManifestFileName"]);
        fileName = v5->_fileName;
        v5->_fileName = (NSString *)v15;

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"IsPrimaryBundle"]);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ManifestLanguageCode"]);
        languageIdentifier = v5->_languageIdentifier;
        v5->_languageIdentifier = (NSString *)v18;

        uint64_t v20 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ManifestRegionCode"]);
        regionCode = v5->_regionCode;
        v5->_regionCode = (NSString *)v20;

        uint64_t v22 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"SupportRegionCodes"]);
        supportedRegions = v5->_supportedRegions;
        v5->_supportedRegions = (NSArray *)v22;

        if (v17) {
          unsigned __int8 v24 = [v17 BOOLValue];
        }
        else {
          unsigned __int8 v24 = 0;
        }
        v5->_isPrimaryBundle = v24;

        goto LABEL_10;
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000A0338((uint64_t)v4, v10, v34, v35, v36, v37, v38, v39);
      }
    }

    else
    {
      id v27 = sub_10003A95C();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000A039C((uint64_t)v4, v10, v28, v29, v30, v31, v32, v33);
      }
    }

    uint64_t v25 = 0LL;
    goto LABEL_11;
  }

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata name](self, "name"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata languageIdentifier](self, "languageIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata regionCode](self, "regionCode"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Name: %@; Language: %@; Region: %@>",
                   v5,
                   v6,
                   v7,
                   v8));

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (BOOL)isPrimaryBundle
{
  return self->_isPrimaryBundle;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSArray)supportedRegions
{
  return self->_supportedRegions;
}

- (void).cxx_destruct
{
}

@end