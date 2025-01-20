@interface MXMSysmonRequest
+ (id)requestWithType:(unint64_t)a3 handler:(id)a4;
- (OS_dispatch_semaphore)wait_sema;
- (OS_sysmon_request)request;
- (double)convertToPercent:(double)a3 ncpus:(int)a4;
- (double)interval;
- (double)ncpus;
- (void)addAttributes:(unsigned int)a3;
- (void)cancel;
- (void)execute;
- (void)logTopUsageProcesses:(id)a3;
- (void)setInterval:(double)a3;
- (void)setNcpus:(double)a3;
- (void)setRequest:(id)a3;
- (void)setWait_sema:(id)a3;
- (void)wait;
@end

@implementation MXMSysmonRequest

+ (id)requestWithType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)a1);
  if (v7)
  {
    int v23 = 0;
    size_t v22 = 4LL;
    if (sysctlbyname("hw.logicalcpu", &v23, &v22, 0LL, 0LL) < 0)
    {
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      v25 = @"Error while deterimining number of logical CPU cores.";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"InstrumentErrorDomain",  0LL,  v9));
    }

    else
    {
      v8 = 0LL;
    }

    objc_initWeak(&location, v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100007244;
    v15[3] = &unk_10000C540;
    id v10 = v7;
    id v16 = v10;
    int v20 = v23;
    id v18 = v6;
    objc_copyWeak(&v19, &location);
    id v11 = v8;
    id v17 = v11;
    v12 = (void *)sysmon_request_create(a3, v15);
    [v10 setRequest:v12];

    [v10 setInterval:0.0];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
    id v13 = v10;
  }

  return v7;
}

- (double)convertToPercent:(double)a3 ncpus:(int)a4
{
  return a3 / (double)(100 * a4) * 100.0;
}

- (void)logTopUsageProcesses:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysSortedByValueUsingComparator:&stru_10000C580]);
  else {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v13, (void)v17));
        [v7 setValue:v14 forKey:v13];
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v10);
  }

  uint64_t v15 = _MXMGetLog();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    size_t v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Top five processes: %@", buf, 0xCu);
  }
}

- (void)addAttributes:(unsigned int)a3
{
  id v7 = &v8;
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    do
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest request](self, "request"));
      sysmon_request_add_attribute(v5, v3);

      id v6 = (unsigned int *)v7++;
      uint64_t v3 = *v6;
    }

    while ((_DWORD)v3);
  }

- (void)execute
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  -[MXMSysmonRequest setWait_sema:](self, "setWait_sema:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest request](self, "request"));
  sysmon_request_execute();
}

- (void)wait
{
  v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest wait_sema](self, "wait_sema"));
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)cancel
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest request](self, "request"));
  sysmon_request_cancel();

  id v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest wait_sema](self, "wait_sema"));
  dispatch_semaphore_signal(v4);
}

- (void)setInterval:(double)a3
{
  self->_interval = round(a3 + a3) * 0.5;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MXMSysmonRequest request](self, "request"));
  sysmon_request_set_interval(v4, (unint64_t)(self->_interval * 1000.0));
}

- (double)interval
{
  return self->_interval;
}

- (OS_sysmon_request)request
{
  return (OS_sysmon_request *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (OS_dispatch_semaphore)wait_sema
{
  return self->_wait_sema;
}

- (void)setWait_sema:(id)a3
{
}

- (double)ncpus
{
  return self->_ncpus;
}

- (void)setNcpus:(double)a3
{
  self->_ncpus = a3;
}

- (void).cxx_destruct
{
}

@end