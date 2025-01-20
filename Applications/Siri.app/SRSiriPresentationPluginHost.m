@interface SRSiriPresentationPluginHost
+ (id)_defaultURL;
+ (id)sharedSiriPresentationPluginHost;
- (BOOL)_isLoaded;
- (NSMutableDictionary)_bundleURLsByBundleIdentifier;
- (NSURL)_URL;
- (SRSiriPresentationPluginHost)init;
- (SRSiriPresentationPluginHost)initWithURL:(id)a3;
- (id)_builtInPresentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (id)_cachedURLForBundleWithIdentifier:(id)a3;
- (id)_classNameForBuiltInPresentationWithIdentifier:(id)a3;
- (id)_propertyListRepresentation;
- (id)_siriPresentationPluginBundleWithIdentifier:(id)a3;
- (id)presentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (void)_load;
- (void)_loadFromPropertyListRepresentation:(id)a3;
- (void)_rescanBundles;
- (void)_save;
- (void)_setLoaded:(BOOL)a3;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
@end

@implementation SRSiriPresentationPluginHost

+ (id)_defaultURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingPathComponent:@"com.apple.siri.PresentationPluginCache.plist"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 0LL));

  return v6;
}

+ (id)sharedSiriPresentationPluginHost
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033948;
  block[3] = &unk_1000BADA0;
  block[4] = a1;
  if (qword_1000D9B20 != -1) {
    dispatch_once(&qword_1000D9B20, block);
  }
  return (id)qword_1000D9B18;
}

- (SRSiriPresentationPluginHost)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SRSiriPresentationPluginHost;
  v5 = -[SRSiriPresentationPluginHost init](&v11, "init");
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    bundleURLsByBundleIdentifier = v5->_bundleURLsByBundleIdentifier;
    v5->_bundleURLsByBundleIdentifier = (NSMutableDictionary *)v8;
  }

  return v5;
}

- (SRSiriPresentationPluginHost)init
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_defaultURL", v3));
  v6 = -[SRSiriPresentationPluginHost initWithURL:](self, "initWithURL:", v5);

  return v6;
}

- (id)_classNameForBuiltInPresentationWithIdentifier:(id)a3
{
  uint64_t v3 = qword_1000D9B30;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000D9B30, &stru_1000BADC0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000D9B28 objectForKey:v4]);

  return v5;
}

- (id)_builtInPresentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (NSString *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _classNameForBuiltInPresentationWithIdentifier:]( self,  "_classNameForBuiltInPresentationWithIdentifier:",  a3));
  id v11 = objc_alloc(NSClassFromString(v10));

  id v12 = v11;
  if ((objc_opt_respondsToSelector(v12, "initWithDelegate:dataSource:") & 1) == 0)
  {

LABEL_5:
    id v13 = [v11 init];
    goto LABEL_6;
  }

  id v13 = [v12 initWithDelegate:v8 dataSource:v9];
LABEL_6:
  v14 = v13;

  return v14;
}

- (void)_rescanBundles
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  [v3 removeAllObjects];

  uint64_t v4 = AFPresentationPluginsURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  NSURLResourceKey v31 = NSURLNameKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_100033E00;
  v28 = &unk_1000BADE8;
  id v29 = v5;
  id v20 = v29;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v6,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:"));

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
        unsigned int v16 = [v15 isEqualToString:@"siriUIPresentationBundle"];

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v14));
          v18 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier]( self,  "_bundleURLsByBundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
          [v18 setObject:v14 forKey:v19];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }

    while (v11);
  }

  -[SRSiriPresentationPluginHost _save](self, "_save");
}

- (id)_cachedURLForBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  -[SRSiriPresentationPluginHost _load](self, "_load");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    -[SRSiriPresentationPluginHost _rescanBundles](self, "_rescanBundles");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);
  }

  return v6;
}

- (id)_siriPresentationPluginBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _cachedURLForBundleWithIdentifier:]( self,  "_cachedURLForBundleWithIdentifier:",  v4));
  if (v5) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v5));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", v4));
  }
  v7 = (void *)v6;

  return v7;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SRSiriPresentationPluginHost preloadPresentationBundleWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _siriPresentationPluginBundleWithIdentifier:]( self,  "_siriPresentationPluginBundleWithIdentifier:",  v4));
}

- (id)presentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _builtInPresentationWithIdentifier:delegate:dataSource:]( self,  "_builtInPresentationWithIdentifier:delegate:dataSource:",  v8,  v9,  v10));
  if (!v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriPresentationPluginHost _siriPresentationPluginBundleWithIdentifier:]( self,  "_siriPresentationPluginBundleWithIdentifier:",  v8));
    id v13 = objc_alloc((Class)[v12 principalClass]);
    if ((objc_opt_respondsToSelector(v13, "initWithDelegate:dataSource:") & 1) != 0) {
      id v14 = [v13 initWithDelegate:v9 dataSource:v10];
    }
    else {
      id v14 = [v13 init];
    }
    id v11 = v14;
  }

  return v11;
}

- (id)_propertyListRepresentation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003427C;
  v8[3] = &unk_1000BAE10;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (void)_loadFromPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003439C;
  v7[3] = &unk_1000BAE38;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  id v6 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  [v5 setDictionary:v6];
}

- (void)_load
{
  if (!-[SRSiriPresentationPluginHost _isLoaded](self, "_isLoaded"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _URL](self, "_URL"));
    id v13 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  1LL,  &v13));
    id v5 = v13;

    if (v4)
    {
      id v12 = 0LL;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v12));
      id v7 = v12;

      if (v6)
      {
        -[SRSiriPresentationPluginHost _loadFromPropertyListRepresentation:]( self,  "_loadFromPropertyListRepresentation:",  v6);
      }

      else
      {
        id v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_10006BEEC(self, v10);
        }
      }

      goto LABEL_15;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v8 isEqualToString:NSCocoaErrorDomain])
    {
      id v9 = [v5 code];

      if (v9 == (id)260)
      {
LABEL_14:
        id v7 = v5;
LABEL_15:
        -[SRSiriPresentationPluginHost _setLoaded:](self, "_setLoaded:", 1LL);

        return;
      }
    }

    else
    {
    }

    id v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006BE50(self, v11);
    }
    goto LABEL_14;
  }

- (void)_save
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _propertyListRepresentation](self, "_propertyListRepresentation"));
  id v12 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  &v12));
  id v5 = v12;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _URL](self, "_URL"));
    id v11 = v5;
    unsigned __int8 v7 = [v4 writeToURL:v6 options:1 error:&v11];
    id v8 = v11;

    if ((v7 & 1) == 0)
    {
      id v9 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        id v14 = "-[SRSiriPresentationPluginHost _save]";
        __int16 v15 = 2112;
        unsigned int v16 = self;
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s %@ unable to write property list representation data to %@: %@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v14 = "-[SRSiriPresentationPluginHost _save]";
      __int16 v15 = 2114;
      unsigned int v16 = self;
      __int16 v17 = 2112;
      v18 = v3;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %{public}@ unable to create property list data from property list representation %@: %{public}@",  buf,  0x2Au);
    }

    id v8 = v5;
  }
}

- (NSURL)_URL
{
  return self->_URL;
}

- (BOOL)_isLoaded
{
  return self->_loaded;
}

- (void)_setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (NSMutableDictionary)_bundleURLsByBundleIdentifier
{
  return self->_bundleURLsByBundleIdentifier;
}

- (void).cxx_destruct
{
}

  ;
}

@end