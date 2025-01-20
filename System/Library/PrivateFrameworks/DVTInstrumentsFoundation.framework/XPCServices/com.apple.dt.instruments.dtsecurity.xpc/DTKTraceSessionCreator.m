@interface DTKTraceSessionCreator
+ (id)getDefaultedRemotePath:(int *)a3;
- (BOOL)stopWithError:(id *)a3;
- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5;
- (id)_providerTopErrors;
@end

@implementation DTKTraceSessionCreator

- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___DTKTraceSessionCreator;
  v9 = -[DTKTraceSessionCreator init](&v55, "init");
  if (!v9) {
    goto LABEL_41;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bitmap]);
  if (!v10)
  {
    BOOL v13 = a5 == 0LL;
LABEL_9:
    uint64_t v16 = ktrace_session_create();
    ktrace_session_set_event_names_enabled(v16, 0LL);
    ktrace_session_set_default_event_names_enabled(v16, 0LL);
    ktrace_set_only_do_time_sensitive_postprocess(v16, 1LL);
    if ([v8 collectionInterval]) {
      uint64_t v17 = (uint64_t)[v8 collectionInterval];
    }
    else {
      uint64_t v17 = 100LL;
    }
    ktrace_set_collection_interval(v16, v17);
    if (!v16) {
      goto LABEL_20;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 bitmap]);
    if (v18)
    {
      id v19 = objc_claimAutoreleasedReturnValue([v8 bitmap]);
      uint64_t v20 = ktrace_events_filter_bitmap(v16, [v19 bytes], &stru_100014AB8);
    }

    else
    {
      uint64_t v20 = ktrace_events_all(v16, &stru_100014AD8);
    }

    if ((_DWORD)v20)
    {
      if (!v13)
      {
        NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"error: %d",  v20));
        v63 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTKTraceSessionCreator",  -1LL,  v22));
      }

- (id)_providerTopErrors
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_providerLoggers;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "errors", (void)v12));
        if ([v9 count])
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (BOOL)stopWithError:(id *)a3
{
  if (!self->_ktraceSession) {
    return 1;
  }
  if (!self->_stoppingSemaphore) {
    sub_10000E474();
  }
  ktrace_end();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_stoppingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ktrace_session_destroy(self->_ktraceSession);
  self->_ktraceSession = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DTKTraceSessionCreator _providerTopErrors](self, "_providerTopErrors"));
  if (![v5 count])
  {

    return 1;
  }

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) userInfo]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"DVTKtraceSessionProviderName"]);

        if (v13) {
          -[NSMutableSet addObject:](v6, "addObject:", v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v9);
  }

  v24[0] = NSLocalizedDescriptionKey;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v6, "allObjects"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Data Providers emitted errors: %@",  v15));
  v24[1] = @"DVTKtraceSessionProviderErrorsArrayKey";
  v25[0] = v16;
  v25[1] = v7;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ktrace_recording.provider",  2LL,  v17));

  if (a3) {
    *a3 = v18;
  }

  return 0;
}

+ (id)getDefaultedRemotePath:(int *)a3
{
  if (!a3)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, a1, @"DTKTraceHelpers.m", 272, @"Invalid parameter not satisfying: %@", @"outFD != nil" object file lineNumber description];
  }

  v4 = NSTemporaryDirectory();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"instrumentsXXXXXX.ktrace"]);

  id v7 = v6;
  id v8 = strdup((const char *)[v7 fileSystemRepresentation]);
  *a3 = mkstemps(v8, 7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  free(v8);
  return v10;
}

- (void).cxx_destruct
{
}

@end