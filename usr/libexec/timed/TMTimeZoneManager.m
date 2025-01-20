@interface TMTimeZoneManager
- (BOOL)isSourceAvailable:(id)a3;
- (TMTimeZone)currentTimeZone;
- (TMTimeZoneManager)initWithRules:(id)a3;
- (TMTimeZoneManager)initWithRules:(id)a3 delegate:(id)a4;
- (TMTimeZoneManagerDelegate)delegate;
- (id)description;
- (void)dealloc;
- (void)reset:(id)a3;
- (void)sendStateAnalytics;
- (void)setCurrentTimeZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSourceAvailable:(id)a3;
- (void)setSourceTimeZone:(id)a3;
- (void)setSourceUnavailable:(id)a3;
@end

@implementation TMTimeZoneManager

- (void)setSourceTimeZone:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMTimeZoneManager.m",  67LL,  @"Invalid parameter not satisfying: %@",  @"tz");
  }
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v6 = (id *)[a3 source];
  v7 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 olsonName];
    *(_DWORD *)buf = 138412546;
    v11 = (TMTimeZoneManager *)v6;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TZ,setSourceTimeZone,src,%@,tz,%@", buf, 0x16u);
  }

  if (!-[TMTimeZoneManager isSourceAvailable:](self, "isSourceAvailable:", v6))
  {
    v9 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B67C((uint64_t)v6, v9);
    }
    -[NSMutableSet addObject:](self->availableSources, "addObject:", v6);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->inputs, "setObject:forKeyedSubscript:", a3, v6);
  sub_10000FBB4((id *)&self->super.isa, v6);
}

- (void)reset:(id)a3
{
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,reset,reason,%@", (uint8_t *)&v7, 0xCu);
  }

  -[TMTimeZoneManager setCurrentTimeZone:](self, "setCurrentTimeZone:", 0LL);
  -[NSMutableDictionary removeAllObjects](self->inputs, "removeAllObjects");
  -[TMTimeZoneManagerDelegate timeZoneManager:didReset:](self->_delegate, "timeZoneManager:didReset:", self, a3);
}

- (void)dealloc
{
  -[TMTimeZoneManager setCurrentTimeZone:](self, "setCurrentTimeZone:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMTimeZoneManager;
  -[TMTimeZoneManager dealloc](&v3, "dealloc");
}

- (TMTimeZoneManager)initWithRules:(id)a3
{
  return -[TMTimeZoneManager initWithRules:delegate:](self, "initWithRules:delegate:", a3, 0LL);
}

- (TMTimeZoneManager)initWithRules:(id)a3 delegate:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TMTimeZoneManager;
  v6 = -[TMTimeZoneManager init](&v12, "init");
  int v7 = v6;
  if (v6)
  {
    v6->_delegate = (TMTimeZoneManagerDelegate *)a4;
    id v8 = objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingFunction:context:", sub_100010300, a3);
    v7->rules = -[NSOrderedSet initWithArray:](objc_alloc(&OBJC_CLASS___NSOrderedSet), "initWithArray:", v8);
    id v9 = [v8 count];
    v7->availableSources = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  v9);
    v7->inputs = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v9);
    v10 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TZ,init,rules,%lu", buf, 0xCu);
    }

    -[TMTimeZoneManager reset:](v7, "reset:", @"init");
  }

  return v7;
}

- (void)setSourceAvailable:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMTimeZoneManager.m",  138LL,  @"Invalid parameter not satisfying: %@",  @"source");
  }
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceAvailable,src,%@", buf, 0xCu);
  }

  if ((-[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->availableSources, "addObject:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->inputs, "setObject:forKeyedSubscript:", 0LL, a3);
  }

- (void)setSourceUnavailable:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMTimeZoneManager.m",  154LL,  @"Invalid parameter not satisfying: %@",  @"source");
  }
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceUnavailable,src,%@", buf, 0xCu);
  }

  if (-[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3))
  {
    unsigned int v7 = [a3 isEqualToString:sub_10000FE24((uint64_t)self)];
    -[NSMutableSet removeObject:](self->availableSources, "removeObject:", a3);
    if (v7)
    {
      id v8 = (id *)sub_10000FE24((uint64_t)self);
      if (v8) {
        sub_10000FAA8((id *)&self->super.isa, v8);
      }
    }
  }

- (BOOL)isSourceAvailable:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMTimeZoneManager.m",  175LL,  @"Invalid parameter not satisfying: %@",  @"source");
  }
  unsigned int v5 = -[NSMutableSet containsObject:](self->availableSources, "containsObject:", a3);
  v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = a3;
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TZ,isSourceAvailable,src,%@,result,%d",  buf,  0x12u);
  }

  return v5;
}

- (id)description
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  unsigned int v5 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %p {\n", NSStringFromClass(v4), self);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  rules = self->rules;
  id v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( rules,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(rules);
        }
        unsigned int v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v11),  "olsonName");
        id v13 = -[NSMutableSet containsObject:](self->availableSources, "containsObject:", v11);
        id v14 = [v11 UTF8String];
        if (v12) {
          v15 = (const char *)[v12 UTF8String];
        }
        else {
          v15 = "--";
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%18s %d %s,\n", v14, v13, v15);
      }

      id v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( rules,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"} = %@>",  -[TMTimeZoneManager currentTimeZone](self, "currentTimeZone"));
  return v5;
}

- (void)sendStateAnalytics
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  obj = self->rules;
  id v4 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v8),  "olsonName");
        id v10 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        if (v9) {
          unsigned int v11 = (const char *)[v9 UTF8String];
        }
        else {
          unsigned int v11 = "--";
        }
        objc_msgSend( v3,  "setValue:forKey:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11),  v10);
      }

      id v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v5);
  }

  id v12 = -[TMTimeZone olsonName](-[TMTimeZoneManager currentTimeZone](self, "currentTimeZone"), "olsonName");
  if (v12) {
    id v13 = (const __CFString *)v12;
  }
  else {
    id v13 = @"--";
  }
  [v3 setValue:v13 forKey:@"TMComputed"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100010CD4;
  v15[3] = &unk_100028F70;
  v15[4] = v3;
  AnalyticsSendEventLazy(@"com.apple.timed.tzSourceInputsAvailability", v15);
}

- (TMTimeZone)currentTimeZone
{
  return (TMTimeZone *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCurrentTimeZone:(id)a3
{
}

- (TMTimeZoneManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TMTimeZoneManagerDelegate *)a3;
}

@end