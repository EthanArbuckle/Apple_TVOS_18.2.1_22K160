@interface INHService
- (BOOL)_checkServiceAccessWithError:(id *)a3;
- (INHService)initWithServingConnection:(id)a3;
- (NSXPCConnection)servingConnection;
- (void)fetchShareExtensionIntentForExtensionContextUUID:(id)a3 completion:(id)a4;
- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5;
- (void)loadBundleURLsForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)loadDataImageForImage:(id)a3 scaledWidth:(double)a4 scaledHeight:(double)a5 usingPortableImageLoader:(id)a6 completion:(id)a7;
- (void)loadSchemaURLsForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)loadSchemaURLsWithCompletion:(id)a3;
- (void)purgeExpiredImagesInEphemeralStore;
- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 completion:(id)a7;
- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation INHService

- (INHService)initWithServingConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___INHService;
  v5 = -[INHService init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_servingConnection, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___INImageFilePersistence);
    filePersistence = v6->_filePersistence;
    v6->_filePersistence = v7;
  }

  return v6;
}

- (void)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = (void (**)(id, void *, id))a7;
  v14 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[INHService storeImage:scaled:qualityOfService:storeType:completion:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Storing image %@ with INImageFilePersistence",  buf,  0x16u);
  }

  filePersistence = self->_filePersistence;
  id v18 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]( filePersistence,  "storeImage:scaled:qualityOfService:storeType:error:",  v12,  v10,  v9,  a6,  &v18));
  id v17 = v18;
  v13[2](v13, v16, v17);
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    BOOL v10 = "-[INHService retrieveImageWithIdentifier:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Retrieving image with identifier %@ with INImageFilePersistence",  (uint8_t *)&v9,  0x16u);
  }

  -[INImageFilePersistence retrieveImageWithIdentifier:completion:]( self->_filePersistence,  "retrieveImageWithIdentifier:completion:",  v6,  v7);
}

- (void)loadDataImageForImage:(id)a3 scaledWidth:(double)a4 scaledHeight:(double)a5 usingPortableImageLoader:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[INHService servingConnection](self, "servingConnection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForXPCConnection:]( &OBJC_CLASS___INHelperServiceAccessSpecifier,  "accessSpecifierAppropriateForXPCConnection:",  v15));

    id v17 = (os_log_s *)INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[INHService loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:]";
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Loading image %@ with portable image loader %@",  buf,  0x20u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100005EAC;
    v18[3] = &unk_1000082F0;
    id v19 = v14;
    double v20 = a4;
    double v21 = a5;
    [v13 loadImageDataFromImage:v12 accessSpecifier:v16 completion:v18];
  }
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    BOOL v10 = (os_log_s *)INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      id v12 = "-[INHService filePathForImage:usingPortableImageLoader:completion:]";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Loading image file path for %@ with portable image loader %@",  (uint8_t *)&v11,  0x20u);
    }

    [v8 filePathForImage:v7 completion:v9];
  }
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    BOOL v10 = "-[INHService purgeImageWithIdentifier:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Purging image %@ from INImageFilePersistence",  (uint8_t *)&v9,  0x16u);
  }

  -[INImageFilePersistence purgeImageWithIdentifier:completion:]( self->_filePersistence,  "purgeImageWithIdentifier:completion:",  v6,  v7);
}

- (void)purgeExpiredImagesInEphemeralStore
{
  v3 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[INHService purgeExpiredImagesInEphemeralStore]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Purging all expired ephemeral images in INImageFilePersistence",  (uint8_t *)&v4,  0xCu);
  }

  -[INImageFilePersistence purgeExpiredImagesInEphemeralStore]( self->_filePersistence,  "purgeExpiredImagesInEphemeralStore");
}

- (void)loadSchemaURLsForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    goto LABEL_32;
  }

  id v45 = 0LL;
  unsigned __int8 v8 = -[INHService _checkServiceAccessWithError:](self, "_checkServiceAccessWithError:", &v45);
  id v9 = v45;
  BOOL v10 = v9;
  if ((v8 & 1) == 0)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
    goto LABEL_31;
  }

  id v28 = v9;
  id v29 = v7;
  v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v30 = v6;
  id obj = v6;
  id v34 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (!v34) {
    goto LABEL_25;
  }
  uint64_t v33 = *(void *)v42;
  do
  {
    __int16 v11 = 0LL;
    do
    {
      if (*(void *)v42 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v11);
      id v40 = 0LL;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v12,  0LL,  &v40));
      id v14 = v40;
      if (v14)
      {
        __int16 v15 = (os_log_s *)INSiriLogContextIntents;
        if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v48 = "-[INHService loadSchemaURLsForBundleIdentifiers:completion:]";
          __int16 v49 = 2112;
          uint64_t v50 = v12;
          __int16 v51 = 2112;
          id v52 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Error getting bundle record for bundle identifier %@: %@",  buf,  0x20u);
        }
      }

      if (v13)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 intentDefinitionURLs]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

        if (![v18 count]) {
          goto LABEL_23;
        }
      }

      else
      {
        id v19 = [(id)_INVCIntentDefinitionManagerClass() intentDefinitionURLsForBundleID:v12];
        double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));
      }

      id v35 = v14;
      double v21 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v18 = v18;
      id v22 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v18);
            }
            id v26 = [[NSSecurityScopedURLWrapper alloc] initWithURL:*(void *)(*((void *)&v36 + 1) + 8 * (void)i) readonly:1];
            -[NSMutableSet addObject:](v21, "addObject:", v26);
          }

          id v23 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }

        while (v23);
      }

      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v21, v12);
      id v14 = v35;
LABEL_23:

      __int16 v11 = (char *)v11 + 1;
    }

    while (v11 != v34);
    id v34 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  }

  while (v34);
LABEL_25:

  if (-[NSMutableDictionary count](v32, "count")) {
    id v27 = v32;
  }
  else {
    id v27 = 0LL;
  }
  id v7 = v29;
  (*((void (**)(id, NSMutableDictionary *, void))v29 + 2))(v29, v27, 0LL);

  id v6 = v30;
  BOOL v10 = v28;
LABEL_31:

LABEL_32:
}

- (void)loadSchemaURLsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100005DAC;
  v20[3] = &unk_100008318;
  id v7 = v5;
  double v21 = v7;
  [v6 enumerateBundlesOfType:1 block:v20];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  __int16 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100005DB8;
  id v18 = &unk_100008318;
  id v9 = v7;
  id v19 = v9;
  [v8 enumerateBundlesOfType:6 block:&v15];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray if_compactMap:](v9, "if_compactMap:", &stru_100008358, v15, v16, v17, v18));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
  id v12 = [v11 mutableCopy];

  id v13 = [(id)_INVCIntentDefinitionManagerClass() allBundleIdentifiers];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14) {
    [v12 addObjectsFromArray:v14];
  }
  -[INHService loadSchemaURLsForBundleIdentifiers:completion:]( self,  "loadSchemaURLsForBundleIdentifiers:completion:",  v12,  v4);
}

- (void)loadBundleURLsForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([v6 count])
  {
    id v29 = 0LL;
    unsigned __int8 v8 = -[INHService _checkServiceAccessWithError:](self, "_checkServiceAccessWithError:", &v29);
    id v9 = v29;
    BOOL v10 = v9;
    if ((v8 & 1) != 0)
    {
      id v23 = v9;
      uint64_t v24 = v7;
      __int16 v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v12 = v6;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
            id v18 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleProxy bundleProxyForIdentifier:]( &OBJC_CLASS___LSBundleProxy,  "bundleProxyForIdentifier:",  v17));
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleURL]);

            if (v19)
            {
              id v20 = objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper);
              double v21 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleURL]);
              id v22 = [v20 initWithURL:v21 readonly:1];
              -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v22, v17);
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v14);
      }

      id v7 = v24;
      ((void (**)(id, NSMutableDictionary *, id))v24)[2](v24, v11, 0LL);

      BOOL v10 = v23;
    }

    else
    {
      v7[2](v7, 0LL, v9);
    }
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)fetchShareExtensionIntentForExtensionContextUUID:(id)a3 completion:(id)a4
{
  id v36 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[INHService servingConnection](self, "servingConnection"));
  unsigned __int8 v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v37, 0, sizeof(v37));
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleProxy bundleProxyWithAuditToken:error:]( &OBJC_CLASS___LSBundleProxy,  "bundleProxyWithAuditToken:error:",  v37,  0LL));
  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___LSPlugInKitProxy);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      __int16 v11 = v9;
    }
    else {
      __int16 v11 = 0LL;
    }
  }

  else
  {
    __int16 v11 = 0LL;
  }

  id v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  if (v12
    && (id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 protocol]),
        unsigned int v15 = [v14 isEqualToString:@"com.apple.share-services"],
        v14,
        v15))
  {
    id v42 = v12;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    uint64_t v17 = INSupportedIntentsByExtensions(v16, 0LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (![v18 count])
    {
      id v19 = [v12 objectForInfoDictionaryKey:@"ShareSheetSuggestionsSupported-Minimum-iOS13.5" ofClass:objc_opt_class(NSNumber) inScope:0];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v20)
      {
        double v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___INSendMessageIntent);
        id v22 = NSStringFromClass(v21);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v23, 0LL));

        id v18 = (void *)v24;
      }
    }

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 containingBundle]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
    __int128 v27 = 0LL;
    if ([v18 count] && v26)
    {
      id v34 = v26;
      id v35 = v13;
      id v28 = v36;
      id v29 = v18;
      uint64_t v38 = 0LL;
      __int128 v39 = &v38;
      uint64_t v40 = 0x2020000000LL;
      id v30 = (uint64_t (*)(id, id, id, id))off_10000CA48;
      __int128 v41 = off_10000CA48;
      if (!off_10000CA48)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_100005CBC;
        __int128 v44 = &unk_100008380;
        id v45 = &v38;
        sub_100005CBC((uint64_t)buf);
        id v30 = (uint64_t (*)(id, id, id, id))v39[3];
      }

      _Block_object_dispose(&v38, 8);
      if (!v30)
      {
        uint64_t v33 = dlerror();
        abort_report_np("%s", v33);
        __break(1u);
      }

      uint64_t v31 = v30(v34, v35, v28, v29);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v31);
    }
  }

  else
  {
    __int128 v27 = 0LL;
  }

  v32 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[INHService fetchShareExtensionIntentForExtensionContextUUID:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    __int128 v44 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s Fetched share extension intent %@ from people suggester for bundleID %@",  buf,  0x20u);
  }

  if (v6) {
    v6[2](v6, v27);
  }
}

- (BOOL)_checkServiceAccessWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[INHService servingConnection](self, "servingConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForXPCConnection:]( &OBJC_CLASS___INHelperServiceAccessSpecifier,  "accessSpecifierAppropriateForXPCConnection:",  v4));

  id v6 = [v5 accessLevel];
  id v7 = v6;
  if (a3 && v6 != (id)2)
  {
    unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    id v12 = @"Client does not have sufficient permissions to access bundle";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    *a3 =  -[NSError initWithDomain:code:userInfo:]( v8,  "initWithDomain:code:userInfo:",  INIntentErrorDomain,  6010LL,  v9);
  }

  return v7 == (id)2;
}

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[INHService storeUserContext:forBundleIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Within intents_helper, entitled-saving UserContext:%@ for bundle: %@",  (uint8_t *)&v9,  0x20u);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[INUserContextStore sharedStore](&OBJC_CLASS___INUserContextStore, "sharedStore"));
  [v8 storeUserContext:v5 forBundleIdentifier:v6];
}

- (NSXPCConnection)servingConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_servingConnection);
}

- (void).cxx_destruct
{
}

@end