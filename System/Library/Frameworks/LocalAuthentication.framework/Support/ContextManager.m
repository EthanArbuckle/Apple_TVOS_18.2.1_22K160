@interface ContextManager
+ (id)sharedInstance;
- (ContextManager)init;
- (id)_pathForModule:(int64_t)a3 error:(id *)a4;
- (id)_proxiesForContext:(id)a3;
- (id)contextForUUID:(id)a3;
- (id)dumpStatus;
- (id)findContextForExternalizedContext:(id)a3;
- (id)loadModule:(int64_t)a3 error:(id *)a4;
- (void)_logClass:(Class)a3 tag:(id)a4;
- (void)_logClass:(Class)a3 tag:(id)a4 level:(int)a5;
- (void)addContext:(id)a3;
- (void)addContextProxy:(id)a3;
- (void)registerExternalizedContext:(id)a3 forContext:(id)a4;
@end

@implementation ContextManager

+ (id)sharedInstance
{
  if (qword_10003E258 != -1) {
    dispatch_once(&qword_10003E258, &stru_100031180);
  }
  return (id)qword_10003E250;
}

- (ContextManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ContextManager;
  v2 = -[ContextManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    contextMap = v2->_contextMap;
    v2->_contextMap = (NSMapTable *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    contextProxyMap = v2->_contextProxyMap;
    v2->_contextProxyMap = (NSMapTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    contextByExternalizedContextMap = v2->_contextByExternalizedContextMap;
    v2->_contextByExternalizedContextMap = (NSMapTable *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    modules = v2->_modules;
    v2->_modules = v9;
  }

  return v2;
}

- (id)contextForUUID:(id)a3
{
  return -[NSMapTable objectForKey:](self->_contextMap, "objectForKey:", a3);
}

- (id)findContextForExternalizedContext:(id)a3
{
  return -[NSMapTable objectForKey:](self->_contextByExternalizedContextMap, "objectForKey:", a3);
}

- (void)addContextProxy:(id)a3
{
  contextProxyMap = self->_contextProxyMap;
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSUUID);
  -[NSMapTable setObject:forKey:](contextProxyMap, "setObject:forKey:", v4, v5);
}

- (void)addContext:(id)a3
{
  contextMap = self->_contextMap;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 uuid]);
  -[NSMapTable setObject:forKey:](contextMap, "setObject:forKey:", v4, v5);
}

- (void)registerExternalizedContext:(id)a3 forContext:(id)a4
{
}

- (id)_pathForModule:(int64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/System/Library/Frameworks/LocalAuthentication.framework/Support/ModulePlugins/%@.bundle",  @"ModuleACM"));
    v6 = 0LL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown module: %@",  v7));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v8));

  id v5 = 0LL;
  if (a4) {
LABEL_5:
  }
    *a4 = v6;
LABEL_6:

  return v5;
}

- (void)_logClass:(Class)a3 tag:(id)a4
{
  id v10 = a4;
  -[ContextManager _logClass:tag:level:](self, "_logClass:tag:level:", a3);
  Class Superclass = class_getSuperclass(a3);
  if (Superclass)
  {
    uint64_t v7 = Superclass;
    int v8 = 1;
    do
    {
      int v9 = v8 + 1;
      -[ContextManager _logClass:tag:level:](self, "_logClass:tag:level:", v7, v10);
      uint64_t v7 = class_getSuperclass(v7);
      int v8 = v9;
    }

    while (v7);
  }
}

- (void)_logClass:(Class)a3 tag:(id)a4 level:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  uint64_t v8 = LALogForCategory(256LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v17 = (_DWORD)v5
        ? (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"superclass[%d]",  v5))
        : @"class";
    *(_DWORD *)buf = 138544642;
    *(void *)v20 = v7;
    *(_WORD *)&v20[8] = 2114;
    *(void *)&v20[10] = v17;
    __int16 v21 = 2114;
    Class v22 = a3;
    __int16 v23 = 2048;
    Class v24 = a3;
    __int16 v25 = 1024;
    int Version = class_getVersion(a3);
    __int16 v27 = 2082;
    ImageName = class_getImageName(a3);
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%{public}@:%{public}@] %{public}@ (%p), version: %d, image: %{public}s",  buf,  0x3Au);
    if ((_DWORD)v5) {
  }
    }

  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___NSObject)) & 1) == 0)
  {
    id v10 = class_copyMethodList(a3, &outCount);
    if (v10)
    {
      v11 = v10;
      if (outCount)
      {
        for (unint64_t i = 0LL; i < outCount; ++i)
        {
          uint64_t v13 = LALogForCategory(256LL);
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            Name = method_getName(v11[i]);
            v16 = sel_getName(Name);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v20 = i;
            *(_WORD *)&v20[4] = 2082;
            *(void *)&v20[6] = v16;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "    method[%d]: %{public}s",  buf,  0x12u);
          }
        }
      }

      free(v11);
    }
  }
}

- (id)loadModule:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = LALogForCategory(256LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Loading module:%d", buf, 8u);
  }

  modules = self->_modules;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](modules, "objectForKeyedSubscript:", v10));

  if (!v11)
  {
    id v27 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContextManager _pathForModule:error:](self, "_pathForModule:error:", a3, &v27));
    id v12 = v27;
    if (!v14)
    {
      v16 = 0LL;
      id v11 = 0LL;
      goto LABEL_25;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v14));
    v16 = v15;
    if (v15)
    {
      id v26 = v12;
      unsigned int v17 = [v15 loadAndReturnError:&v26];
      id v18 = v26;

      if (!v17)
      {
        id v11 = 0LL;
LABEL_24:
        id v12 = v18;
LABEL_25:

        if (!a4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }

      id v11 = [v16 principalClass];
      if (v11)
      {
        if ([v11 isSubclassOfClass:objc_opt_class(Module)])
        {
          id v11 = (id)objc_opt_new(v11);
        }

        else
        {
          uint64_t v21 = LALogForCategory(256LL);
          Class v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            sub_100021474((uint64_t)v16, (uint64_t)v14, v22);
          }

          -[ContextManager _logClass:tag:](self, "_logClass:tag:", v11, @"cls");
          -[ContextManager _logClass:tag:]( self,  "_logClass:tag:",  [v16 principalClass],  @"bundle.principalClass");
          -[ContextManager _logClass:tag:]( self,  "_logClass:tag:",  objc_opt_class(&OBJC_CLASS___Module),  @"Module.class");
          id v11 = (id)objc_opt_new(v11);
          uint64_t v23 = LALogForCategory(256LL);
          Class v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100021400((uint64_t)v11, v24);
          }
        }

        __int16 v25 = self->_modules;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v11, v19);
      }

      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No principal class in bundle: %@",  v16));
        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v19));

        id v18 = (id)v20;
      }
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to load plugin: %@",  v14));
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v19));

      id v11 = 0LL;
    }

    goto LABEL_24;
  }

  id v12 = 0LL;
  if (a4) {
LABEL_5:
  }
    *a4 = v12;
LABEL_6:

  return v11;
}

- (id)dumpStatus
{
  uint64_t v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v19 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v19, "setDateFormat:", @"YYYY-MM-dd HH:mm:ss:SSS");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v18 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_contextMap, "objectEnumerator"));
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v6);
        v25[0] = @"object";
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
        v26[0] = v8;
        v25[1] = @"created";
        int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 plugin]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 creationTime]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v19, "stringFromDate:", v10));
        v26[1] = v11;
        v25[2] = @"proxies";
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContextManager _proxiesForContext:](v18, "_proxiesForContext:", v7));
        v26[2] = v12;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));

        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v13, v15);

        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v4);
  }

  return v20;
}

- (id)_proxiesForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_contextProxyMap, "objectEnumerator"));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (unint64_t i = 0LL; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v12 = (id)objc_claimAutoreleasedReturnValue([v11 managedContext]);

        if (v12 == v4)
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue(+[Caller pathFromPid:](Caller, "pathFromPid:", [v11 processId]));
          v14 = (void *)v13;
          if (v13) {
            v15 = (const __CFString *)v13;
          }
          else {
            v15 = @"PID";
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ held by %@[%d]",  v11,  v15,  [v11 processId]));

          -[NSMutableArray addObject:](v5, "addObject:", v16);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end