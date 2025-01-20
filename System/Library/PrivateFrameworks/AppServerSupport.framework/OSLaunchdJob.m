@interface OSLaunchdJob
+ (BOOL)disableLogging_4watchdogd;
+ (BOOL)submitAll:(id)a3 error:(id *)a4;
+ (id)_createJobFromReplyHandle:(id)a3;
+ (id)copyJobWithHandle:(id)a3;
+ (id)copyJobWithLabel:(id)a3 domain:(id)a4;
+ (id)copyJobWithPid:(int)a3;
+ (id)copyJobsManagedBy:(id)a3 error:(id *)a4;
+ (id)jobInfoFromMessage:(id)a3;
+ (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6;
+ (int)_monitorNormalizeError:(int)a3;
+ (int64_t)jobStateFromMessage:(id)a3;
+ (void)setDisableLogging_4watchdogd:(BOOL)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)submit:(id *)a3;
- (NSUUID)handle;
- (OSLaunchdJob)initWithPlist:(id)a3;
- (OSLaunchdJob)initWithPlist:(id)a3 domain:(id)a4;
- (id)_initWithHandle:(id)a3;
- (id)_newCreateInstanceRequest:(unsigned __int8)a3[16] properties:(id)a4;
- (id)_newRequest;
- (id)_newSubmitRequest;
- (id)createInstance:(unsigned __int8)a3[16] error:(id *)a4;
- (id)createInstance:(unsigned __int8)a3[16] properties:(id)a4 error:(id *)a5;
- (id)description;
- (id)getCurrentJobInfo;
- (id)start:(id *)a3;
- (id)submitAndStart:(id *)a3;
- (void)_newSubmitRequest;
- (void)_populateHandle:(id)a3;
- (void)_setupMonitorSourceWithPort:(unsigned int)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)_startMonitoringAfterSubmit:(id)a3;
- (void)cancelMonitor;
- (void)monitorOnQueue:(id)a3 withHandler:(id)a4;
- (void)processSubmitReply:(id)a3;
- (void)setupMonitorOnQueue:(id)a3 withHandler:(id)a4 reply:(id)a5;
@end

@implementation OSLaunchdJob

- (id)_newSubmitRequest
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (!self->_plist) {
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v5, v6);
  }
  if (!self->_domain) {
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v5, v6);
  }
  id v3 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  xpc_dictionary_set_uint64(v3, "type", self->_domain->_type);
  xpc_dictionary_set_uint64(v3, "handle", self->_domain->_handle);
  xpc_dictionary_set_value(v3, "plist", self->_plist);
  xpc_dictionary_set_BOOL(v3, "monitor", self->_monitor_handler != 0LL);
  return v3;
}

- (void)_populateHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:].cold.2(&v9, v10);
  }
  id v8 = v4;
  uuid = xpc_dictionary_get_uuid(v4, "job-handle");
  if (!uuid) {
    -[OSLaunchdJob _populateHandle:].cold.1(&v9, v10);
  }
  v6 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
  handle = self->_handle;
  self->_handle = v6;
}

- (void)_startMonitoringAfterSubmit:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!self->_monitor_handler) {
    -[OSLaunchdJob _startMonitoringAfterSubmit:].cold.1(&v8, v9);
  }
  id v7 = v4;
  -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:]( self,  "_setupMonitorSourceWithPort:onQueue:withHandler:",  xpc_dictionary_extract_mach_recv(),  self->_monitor_queue,  self->_monitor_handler);
  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = 0LL;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0LL;
}

- (void)processSubmitReply:(id)a3
{
  id v4 = a3;
  -[OSLaunchdJob _populateHandle:](self, "_populateHandle:");
  if (self->_monitor_handler) {
    -[OSLaunchdJob _startMonitoringAfterSubmit:](self, "_startMonitoringAfterSubmit:", v4);
  }
}

- (id)submitAndStart:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:].cold.2(&v17, buf);
  }
  if (!self->_plist) {
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v17, buf);
  }
  if (!self->_domain) {
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v17, buf);
  }
  id v5 = -[OSLaunchdJob _newSubmitRequest](self, "_newSubmitRequest");
  id v17 = 0LL;
  uint64_t v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v19 = v7;
        *(_WORD *)&v19[4] = 2080;
        *(void *)&v19[6] = xpc_strerror();
        _os_log_impl(&dword_186C88000, v8, OS_LOG_TYPE_DEFAULT, "submitAndStart failed with error %d: %s", buf, 0x12u);
      }
    }

    if (a3)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v7);
      uint64_t v9 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    -[OSLaunchdJob processSubmitReply:](self, "processSubmitReply:", v17);
    +[OSLaunchdJob jobInfoFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobInfoFromMessage:", v17);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 state];
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)v19 = self;
        *(_WORD *)&v19[8] = 2114;
        *(void *)&v19[10] = v9;
        _os_log_impl( &dword_186C88000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: submitAndStart completed, info=%{public}@",  buf,  0x16u);
      }
    }

    if (v10 == 3)
    {
      v12 = (void *)xpc_copy_short_description();
      if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[OSLaunchdJob submitAndStart:].cold.4((uint64_t)self, (uint64_t)v12, v13);
        }
      }

      free(v12);
    }

    plist = self->_plist;
    self->_plist = 0LL;
  }

  return v9;
}

- (BOOL)submit:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:].cold.2(&v10, buf);
  }
  if (!self->_plist) {
    -[OSLaunchdJob _newSubmitRequest].cold.1(&v10, buf);
  }
  if (!self->_domain) {
    -[OSLaunchdJob _newSubmitRequest].cold.2(&v10, buf);
  }
  id v5 = -[OSLaunchdJob _newSubmitRequest](self, "_newSubmitRequest");
  id v10 = 0LL;
  uint64_t v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v12 = v6;
        __int16 v13 = 2080;
        uint64_t v14 = xpc_strerror();
        _os_log_impl(&dword_186C88000, v7, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }
    }

    if (a3)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    plist = self->_plist;
    self->_plist = 0LL;

    -[OSLaunchdJob processSubmitReply:](self, "processSubmitReply:", v10);
  }

  return (_DWORD)v6 == 0;
}

+ (BOOL)submitAll:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) _newSubmitRequest];
        xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v12);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v9);
  }

  xpc_object_t v13 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v13, "all-jobs", empty);
  xpc_object_t xdict = 0LL;
  uint64_t v14 = _launch_job_routine();
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = xpc_strerror();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v42 = v15;
        *(_WORD *)&v42[4] = 2080;
        *(void *)&v42[6] = v17;
        _os_log_impl(&dword_186C88000, v16, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }
    }

    if (a4)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v15);
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v18 = 0;
    }
  }

  else
  {
    xpc_dictionary_get_array(xdict, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    size_t count = xpc_array_get_count(v19);
    if (count != [v7 count]) {
      +[OSLaunchdJob submitAll:error:].cold.1(&v35, buf);
    }
    if (xpc_array_get_count(v19))
    {
      xpc_object_t v33 = v13;
      v34 = a4;
      size_t v21 = 0LL;
      id v22 = 0LL;
      unint64_t v23 = 0x189F5E000uLL;
      do
      {
        xpc_array_get_dictionary(v19, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int64_t int64 = xpc_dictionary_get_int64(v24, "error");
        if ((_DWORD)int64)
        {
          if ((objc_msgSend(*(id *)(v23 + 3496), "disableLogging_4watchdogd") & 1) == 0)
          {
            _os_launch_job_log();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              [v7 objectAtIndexedSubscript:v21];
              unint64_t v27 = v23;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v29 = xpc_strerror();
              *(_DWORD *)buf = 138412802;
              *(void *)v42 = v28;
              *(_WORD *)&v42[8] = 1024;
              *(_DWORD *)&v42[10] = int64;
              __int16 v43 = 2080;
              uint64_t v44 = v29;
              _os_log_impl( &dword_186C88000,  v26,  OS_LOG_TYPE_DEFAULT,  "submit (%@) failed with error %d: %s",  buf,  0x1Cu);

              unint64_t v23 = v27;
            }
          }

          if (v22)
          {
            uint64_t v30 = +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", 133LL);

            id v22 = (id)v30;
          }

          else
          {
            +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", int64);
            id v22 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        else
        {
          [v7 objectAtIndexedSubscript:v21];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 processSubmitReply:v24];
        }

        ++v21;
      }

      while (v21 < xpc_array_get_count(v19));
      xpc_object_t v13 = v33;
      if (v34 && v22)
      {
        id v22 = v22;
        id *v34 = v22;
      }
    }

    else
    {
      id v22 = 0LL;
    }

    BOOL v18 = v22 == 0LL;
  }

  return v18;
}

- (id)start:(id *)a3
{
  *(void *)&v16[37] = *MEMORY[0x1895F89C0];
  id v5 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  id v12 = 0LL;
  uint64_t v6 = _launch_job_routine();
  if ((_DWORD)v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = self;
        __int16 v15 = 1024;
        *(_DWORD *)uint64_t v16 = v6;
        v16[2] = 2080;
        *(void *)&v16[3] = xpc_strerror();
        _os_log_impl( &dword_186C88000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: start failed with error %d: %s",  buf,  0x1Cu);
      }
    }

    if (a3)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v6);
      uint64_t v8 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    +[OSLaunchdJob jobInfoFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobInfoFromMessage:", v12);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = self;
        __int16 v15 = 2114;
        *(void *)uint64_t v16 = v8;
        _os_log_impl( &dword_186C88000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: start succeeded, info=%{public}@",  buf,  0x16u);
      }
    }
  }

  return v8;
}

- (BOOL)remove:(id *)a3
{
  *(void *)&v17[13] = *MEMORY[0x1895F89C0];
  if (self->_handle)
  {
    id v5 = -[OSLaunchdJob _newRequest](self, "_newRequest");
    uint64_t v6 = _launch_job_routine();
    uint64_t v7 = v6;
    if ((_DWORD)v6 != 36 && (_DWORD)v6)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          __int16 v15 = self;
          __int16 v16 = 1024;
          *(_DWORD *)uint64_t v17 = v7;
          v17[2] = 2080;
          *(void *)&v17[3] = xpc_strerror();
          uint64_t v10 = "%{public}@: remove failed with error %d %s";
          uint64_t v11 = v8;
          uint32_t v12 = 28;
LABEL_15:
          _os_log_impl(&dword_186C88000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }

- (void)setupMonitorOnQueue:(id)a3 withHandler:(id)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  +[OSLaunchdJob jobInfoFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobInfoFromMessage:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl( &dword_186C88000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: monitor initial info is %{public}@",  (uint8_t *)&v16,  0x16u);
    }
  }

  xpc_object_t v13 = (void *)MEMORY[0x186E46D74](v9);
  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = v13;

  v9[2](v9, v11, 0LL);
  id v15 = self->_monitor_handler;
  if (v15)
  {
    self->_id monitor_handler = 0LL;

    -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:]( self,  "_setupMonitorSourceWithPort:onQueue:withHandler:",  xpc_dictionary_extract_mach_recv(),  v8,  v9);
  }
}

- (void)monitorOnQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.1(&v17, buf);
  }
  if (self->_monitor_handler) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.4(&v17, buf);
  }
  if (self->_monitor_source) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.3(&v17, buf);
  }
  id v8 = (void (**)(void, void, void))v7;
  if (self->_handle)
  {
    monitor_queue = -[OSLaunchdJob _newRequest](self, "_newRequest");
    id v17 = 0LL;
    uint64_t v10 = _launch_job_routine();
    if ((_DWORD)v10)
    {
      uint64_t v11 = v10;
      if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v19 = self;
          __int16 v20 = 1024;
          int v21 = v11;
          __int16 v22 = 2080;
          uint64_t v23 = xpc_strerror();
          _os_log_impl( &dword_186C88000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: error creating monitor %d: %s",  buf,  0x1Cu);
        }
      }

      v8[2]( v8,  0LL,  +[OSLaunchdJob _monitorNormalizeError:](&OBJC_CLASS___OSLaunchdJob, "_monitorNormalizeError:", v11));
    }

    else
    {
      -[OSLaunchdJob setupMonitorOnQueue:withHandler:reply:]( self,  "setupMonitorOnQueue:withHandler:reply:",  v6,  v8,  v17);
    }
  }

  else
  {
    if (!self->_plist) {
      -[OSLaunchdJob _newSubmitRequest].cold.1(&v17, buf);
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      xpc_object_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_186C88000,  v13,  OS_LOG_TYPE_DEFAULT,  "monitoring will start once the job is submitted",  buf,  2u);
      }
    }

    uint64_t v14 = (void *)MEMORY[0x186E46D74](v8);
    id monitor_handler = self->_monitor_handler;
    self->_id monitor_handler = v14;

    int v16 = (OS_dispatch_queue *)v6;
    monitor_queue = self->_monitor_queue;
    self->_monitor_queue = v16;
  }
}

- (void)cancelMonitor
{
  monitor_source = self->_monitor_source;
  if (monitor_source)
  {
    dispatch_source_cancel((dispatch_source_t)monitor_source);
    id v4 = self->_monitor_source;
    self->_monitor_source = 0LL;
  }

  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = 0LL;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0LL;
}

- (id)getCurrentJobInfo
{
  id v2 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  id v3 = 0LL;
  if (!_launch_job_routine())
  {
    +[OSLaunchdJob jobInfoFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobInfoFromMessage:", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

+ (id)_createJobFromReplyHandle:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uuid = xpc_dictionary_get_uuid(v3, "job-handle");
  if (!uuid) {
    -[OSLaunchdJob _populateHandle:].cold.1(&v8, v9);
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
  id v6 = -[OSLaunchdJob _initWithHandle:](objc_alloc(&OBJC_CLASS___OSLaunchdJob), "_initWithHandle:", v5);

  return v6;
}

- (id)_newCreateInstanceRequest:(unsigned __int8)a3[16] properties:(id)a4
{
  id v6 = a4;
  id v7 = -[OSLaunchdJob _newRequest](self, "_newRequest");
  xpc_dictionary_set_uuid(v7, "instance-uuid", a3);
  [v6 sandboxProfile];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = [v6 sandboxProfile];
    xpc_dictionary_set_string(v7, "sandbox-profile", (const char *)[v9 UTF8String]);
  }

  [v6 environmentVariables];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v6 environmentVariables];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint32_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    xpc_dictionary_set_value(v7, "envvars", v12);
  }

  return v7;
}

- (id)createInstance:(unsigned __int8)a3[16] properties:(id)a4 error:(id *)a5
{
  *(void *)&v17[13] = *MEMORY[0x1895F89C0];
  if (self->_handle)
  {
    id v7 = -[OSLaunchdJob _newCreateInstanceRequest:properties:](self, "_newCreateInstanceRequest:properties:", a3, a4);
    uint64_t v8 = _launch_job_routine();
    if ((_DWORD)v8)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v15 = self;
          __int16 v16 = 1024;
          *(_DWORD *)id v17 = v8;
          v17[2] = 2080;
          *(void *)&v17[3] = xpc_strerror();
          _os_log_impl( &dword_186C88000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: createInstance failed with error %d: %s",  buf,  0x1Cu);
        }
      }

      if (a5)
      {
        +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v8);
        uint64_t v10 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v10 = 0LL;
      }
    }

    else
    {
      +[OSLaunchdJob _createJobFromReplyHandle:](&OBJC_CLASS___OSLaunchdJob, "_createJobFromReplyHandle:", 0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
      {
        _os_launch_job_log();
        xpc_object_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v15 = self;
          __int16 v16 = 2114;
          *(void *)id v17 = v10;
          _os_log_impl( &dword_186C88000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: createInstance created a job %{public}@",  buf,  0x16u);
        }
      }
    }

    return v10;
  }

  else
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd", a3, a4))
    {
      _os_launch_job_log();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = self;
        _os_log_impl( &dword_186C88000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: createInstance on a job with no handle (ESRCH)",  buf,  0xCu);
      }
    }

    if (a5)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", 3LL);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

- (id)createInstance:(unsigned __int8)a3[16] error:(id *)a4
{
  id v7 = (void *)objc_opt_new();
  -[OSLaunchdJob createInstance:properties:error:](self, "createInstance:properties:error:", a3, v7, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (OSLaunchdJob)initWithPlist:(id)a3
{
  id v4 = a3;
  +[OSLaunchdDomain currentDomain](&OBJC_CLASS___OSLaunchdDomain, "currentDomain");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = -[OSLaunchdJob initWithPlist:domain:](self, "initWithPlist:domain:", v4, v5);

  return v6;
}

- (OSLaunchdJob)initWithPlist:(id)a3 domain:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    -[OSLaunchdJob initWithPlist:domain:].cold.1(&v15, v16);
  }
  id v9 = v8;
  if (MEMORY[0x186E46F30](v7) != MEMORY[0x1895F9250]) {
    -[OSLaunchdJob initWithPlist:domain:].cold.2(&v15, v16);
  }
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSLaunchdJob;
  uint64_t v10 = -[OSLaunchdJob init](&v14, sel_init);
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_plist, a3);
    objc_storeStrong((id *)&v11->_domain, a4);
    uint32_t v12 = v11;
  }

  return v11;
}

- (id)_initWithHandle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5) {
    -[OSLaunchdJob _initWithHandle:].cold.1(&v12, v13);
  }
  id v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSLaunchdJob;
  id v7 = -[OSLaunchdJob init](&v11, sel_init);
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_handle, a3);
    id v9 = v8;
  }

  return v8;
}

- (id)_newRequest
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  handle = self->_handle;
  if (handle)
  {
    *(void *)uuid = 0LL;
    uint64_t v7 = 0LL;
    -[NSUUID getUUIDBytes:](handle, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v3, "job-handle", uuid);
  }

  return v3;
}

+ (int64_t)jobStateFromMessage:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t int64 = xpc_dictionary_get_uint64(v3, "job-state");

  return uint64 + 1LL;
}

+ (id)jobInfoFromMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  int64_t v27 = +[OSLaunchdJob jobStateFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobStateFromMessage:", v3);
  int64_t int64 = xpc_dictionary_get_int64(v3, "pid");
  int64_t v5 = xpc_dictionary_get_int64(v3, "spawn-error");
  xpc_dictionary_get_value(v3, "wait4-status");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-ns");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-code");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, "os-reason-flags");
  id v9 = (OSLaunchdJobExitStatus *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = xpc_dictionary_get_value(v3, "additional-properties");
  BOOL v28 = xpc_dictionary_get_BOOL(v3, "removing");
  uuid = xpc_dictionary_get_uuid(v3, "instance");
  uint64_t v29 = (void *)v10;
  uint64_t v30 = v9;
  if (v6 || v7 || v8 || v9)
  {
    if (!v6) {
      +[OSLaunchdJob jobInfoFromMessage:].cold.4(&v31, v32);
    }
    if (!v7) {
      +[OSLaunchdJob jobInfoFromMessage:].cold.3(&v31, v32);
    }
    if (!v8) {
      +[OSLaunchdJob jobInfoFromMessage:].cold.2(&v31, v32);
    }
    if (!v9) {
      +[OSLaunchdJob jobInfoFromMessage:].cold.1(&v31, v32);
    }
    v26 = objc_alloc(&OBJC_CLASS___OSLaunchdJobExitStatus);
    int64_t value = xpc_int64_get_value(v6);
    int64_t v12 = v5;
    uint64_t v13 = xpc_uint64_get_value(v7);
    uint64_t v14 = xpc_uint64_get_value(v8);
    unsigned int v15 = xpc_uint64_get_value(v9);
    uint64_t v16 = v13;
    int64_t v5 = v12;
    id v9 = -[OSLaunchdJobExitStatus initWithWait4Status:os_reason_namespace:os_reason_code:os_reason_flags:]( v26,  "initWithWait4Status:os_reason_namespace:os_reason_code:os_reason_flags:",  value,  v16,  v14,  v15);
  }

  uint64_t v17 = objc_alloc(&OBJC_CLASS___OSLaunchdJobInfo);
  __int16 v18 = v17;
  if (uuid)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
    int64_t v20 = int64;
    int v21 = v29;
    __int16 v22 = -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:]( v18,  "initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:",  v27,  v20,  v5,  v9,  v29,  v28,  v19);
  }

  else
  {
    int64_t v23 = int64;
    int v21 = v29;
    __int16 v22 = -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:]( v17,  "initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:",  v27,  v23,  v5,  v9,  v29,  v28,  0LL);
  }

  return v22;
}

+ (int)_monitorNormalizeError:(int)a3
{
  if (a3 == 3) {
    return 113;
  }
  else {
    return a3;
  }
}

- (void)_setupMonitorSourceWithPort:(unsigned int)a3 onQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (dispatch_queue_s *)a4;
  id v9 = a5;
  if (!a3) {
    -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:].cold.1(&v29, buf);
  }
  uint64_t v10 = v9;
  if (!v9) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.1(&v29, buf);
  }
  if (self->_monitor_source) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.3(&v29, buf);
  }
  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_186C88000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: starting monitoring", buf, 0xCu);
    }
  }

  int64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B40], a3, 0LL, v8);
  monitor_source = self->_monitor_source;
  self->_monitor_source = v12;

  uint64_t v14 = MEMORY[0x1895F87A8];
  uint64_t v24 = MEMORY[0x1895F87A8];
  uint64_t v25 = 3221225472LL;
  v26 = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke;
  int64_t v27 = &__block_descriptor_36_e5_v8__0l;
  unsigned int v28 = a3;
  dispatch_source_set_mandatory_cancel_handler();
  -[OSLaunchdJob handle](self, "handle");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = self->_monitor_source;
  v19[0] = v14;
  v19[1] = 3221225472LL;
  v19[2] = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30;
  v19[3] = &unk_189F5F0D8;
  unsigned int v23 = a3;
  int v21 = self;
  id v22 = v10;
  id v20 = v15;
  id v17 = v10;
  id v18 = v15;
  dispatch_source_set_event_handler((dispatch_source_t)v16, v19);
  dispatch_activate((dispatch_object_t)self->_monitor_source);
}

uint64_t __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t result = _xpc_mach_port_close_recv(*(_DWORD *)(a1 + 32), 0, 0LL);
  if ((_DWORD)result) {
    __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1(&v2, v3);
  }
  return result;
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30(uint64_t a1)
{
  *(void *)&v19[13] = *MEMORY[0x1895F89C0];
  uint64_t v2 = xpc_pipe_receive();
  int64_t int64 = v2;
  if ((v2 | 0x20) != 0x20)
  {
    _os_assumes_log();
LABEL_4:
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v5;
        __int16 v18 = 1024;
        *(_DWORD *)v19 = int64;
        v19[2] = 2080;
        *(void *)&v19[3] = xpc_strerror();
        _os_log_impl(&dword_186C88000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: got error %d: %s", buf, 0x1Cu);
      }
    }

    (*(void (**)(void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  0LL,  +[OSLaunchdJob _monitorNormalizeError:](&OBJC_CLASS___OSLaunchdJob, "_monitorNormalizeError:", int64));
    goto LABEL_9;
  }

  if ((_DWORD)v2) {
    goto LABEL_4;
  }
  int64_t int64 = xpc_dictionary_get_int64(0LL, "error");
  +[OSLaunchdJob jobInfoFromMessage:](&OBJC_CLASS___OSLaunchdJob, "jobInfoFromMessage:", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      *(void *)v19 = v6;
      _os_log_impl( &dword_186C88000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ monitor: got an update with info %{public}@",  buf,  0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  id v9 = (void *)[*(id *)(a1 + 40) _newRequest];
  uint64_t v10 = (void *)xpc_mach_send_create_with_disposition();
  xpc_dictionary_set_value(v9, "client-port", v10);
  uint64_t v11 = MEMORY[0x186E46B94](1002LL, v9, *(unsigned int *)(a1 + 56));
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v14;
        __int16 v18 = 1024;
        *(_DWORD *)v19 = v12;
        v19[2] = 2080;
        *(void *)&v19[3] = v15;
        _os_log_impl( &dword_186C88000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ monitor: failed to re-arm monitor poll, error %d: %s",  buf,  0x1Cu);
      }
    }

    (*(void (**)(void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  0LL,  +[OSLaunchdJob _monitorNormalizeError:](&OBJC_CLASS___OSLaunchdJob, "_monitorNormalizeError:", v12));
  }

LABEL_9:
}

- (id)description
{
  if (self->_handle)
  {
    id v3 = objc_alloc(NSString);
    [(id)objc_opt_class() description];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ | handle=%@>", v4, self->_handle];

    return v5;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___OSLaunchdJob;
    -[OSLaunchdJob description](&v7, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }

+ (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5) {
    +[OSLaunchdJob copyJobsManagedBy:error:].cold.1(&xdict, buf);
  }
  uint64_t v6 = v5;
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v6;
  xpc_dictionary_set_string(v7, "manager", (const char *)[v8 UTF8String]);
  xpc_object_t xdict = 0LL;
  uint64_t v9 = _launch_job_routine();
  if ((_DWORD)v9)
  {
    uint64_t v10 = v9;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v22 = v10;
        __int16 v23 = 2080;
        uint64_t v24 = xpc_strerror();
        _os_log_impl( &dword_186C88000,  v11,  OS_LOG_TYPE_DEFAULT,  "copyJobsManagedBy failed with error %d: %s",  buf,  0x12u);
      }
    }

    if (a4)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v10);
      uint64_t v12 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    xpc_dictionary_get_array(xdict, "handles");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] arrayWithCapacity:xpc_array_get_count(v13)];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (xpc_array_get_count(v13))
    {
      size_t v14 = 0LL;
      do
      {
        uuid = xpc_array_get_uuid(v13, v14);
        if (!uuid) {
          -[OSLaunchdJob _populateHandle:].cold.1(&v19, buf);
        }
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
        id v17 = -[OSLaunchdJob _initWithHandle:](objc_alloc(&OBJC_CLASS___OSLaunchdJob), "_initWithHandle:", v16);
        [v12 addObject:v17];

        ++v14;
      }

      while (v14 < xpc_array_get_count(v13));
    }
  }

  return v12;
}

+ (id)copyJobWithHandle:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (!v3) {
    +[OSLaunchdJob copyJobWithHandle:].cold.1(&xdict, buf);
  }
  uint64_t v4 = v3;

  id v5 = -[OSLaunchdJob _initWithHandle:](objc_alloc(&OBJC_CLASS___OSLaunchdJob), "_initWithHandle:", v4);
  uint64_t v6 = (void *)[v5 _newRequest];
  xpc_object_t xdict = 0LL;
  int v7 = _launch_job_routine();
  if (v7)
  {
    int v8 = v7;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = v4;
        __int16 v21 = 1024;
        int v22 = v8;
        __int16 v23 = 2080;
        uint64_t v24 = xpc_strerror();
        _os_log_impl( &dword_186C88000,  v9,  OS_LOG_TYPE_DEFAULT,  "copyJobWithHandle:%{public}@ failed with error %d: %s",  buf,  0x1Cu);
      }
    }

    id v10 = 0LL;
  }

  else
  {
    uuid = xpc_dictionary_get_uuid(xdict, "job-handle");
    if (!uuid) {
      -[OSLaunchdJob _populateHandle:].cold.1(&v17, buf);
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];

    [v5 handle];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      +[OSLaunchdJob copyJobWithHandle:].cold.3(&v17, buf);
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v5;
        _os_log_impl( &dword_186C88000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: copyJobWithHandle: created a job",  buf,  0xCu);
      }
    }

    id v10 = v5;
    uint64_t v4 = (void *)v12;
  }

  return v10;
}

+ (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  *(void *)&v19[13] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v9 = v6;
  xpc_dictionary_set_string(v8, "label", (const char *)[v9 UTF8String]);
  xpc_dictionary_set_uint64(v8, "type", *((int *)v7 + 2));
  uint64_t v10 = v7[2];

  xpc_dictionary_set_uint64(v8, "handle", v10);
  int v11 = _launch_job_routine();
  if (!v11)
  {
    [a1 _createJobFromReplyHandle:0];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd")) {
      goto LABEL_11;
    }
    _os_launch_job_log();
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2114;
      *(void *)uint64_t v19 = v9;
      _os_log_impl( &dword_186C88000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: copyJobWithLabel for label %{public}@ created a job",  buf,  0x16u);
    }

+ (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  *(void *)&v24[21] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  int v12 = a5;
  if (!v10) {
    +[OSLaunchdJob submitExtension:overlay:domain:error:].cold.1(&v22, buf);
  }
  uint64_t v13 = v12;
  if (!v12) {
    +[OSLaunchdJob submitExtension:overlay:domain:error:].cold.2(&v22, buf);
  }
  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v14, "type", *((int *)v13 + 2));
  xpc_dictionary_set_uint64(v14, "handle", v13[2]);
  id v15 = v10;
  xpc_dictionary_set_string(v14, "path", (const char *)[v15 UTF8String]);
  xpc_dictionary_set_value(v14, "overlay", v11);
  id v22 = 0LL;
  uint64_t v16 = _launch_job_routine();
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v24[0] = v17;
        LOWORD(v24[1]) = 2080;
        *(void *)((char *)&v24[1] + 2) = xpc_strerror();
        _os_log_impl(&dword_186C88000, v18, OS_LOG_TYPE_DEFAULT, "submitExtension failed with error %d: %s", buf, 0x12u);
      }
    }

    if (a6)
    {
      +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v17);
      uint64_t v19 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    [a1 _createJobFromReplyHandle:v22];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)uint64_t v24 = v19;
        _os_log_impl(&dword_186C88000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: submitExtension created a job", buf, 0xCu);
      }
    }
  }

  return v19;
}

+ (id)copyJobWithPid:(int)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 <= 0) {
    +[OSLaunchdJob copyJobWithPid:].cold.1(&v11, buf);
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v5, "pid", a3);
  id v11 = 0LL;
  int v6 = _launch_job_routine();
  if (!v6)
  {
    [a1 _createJobFromReplyHandle:v11];
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd")) {
      goto LABEL_12;
    }
    _os_launch_job_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)uint64_t v13 = v8;
      *(_WORD *)&v13[8] = 1024;
      v14[0] = a3;
      _os_log_impl(&dword_186C88000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithPid:%d created a job", buf, 0x12u);
    }

+ (void)setDisableLogging_4watchdogd:(BOOL)a3
{
  _OSLaunchdJobLoggingDisabled = a3;
}

+ (BOOL)disableLogging_4watchdogd
{
  return _OSLaunchdJobLoggingDisabled;
}

- (NSUUID)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

- (void)_newSubmitRequest
{
}

- (void)_populateHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)_populateHandle:(void *)a1 .cold.2(void *a1, _OWORD *a2)
{
}

- (void)_startMonitoringAfterSubmit:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)submitAndStart:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
}

- (void)submitAndStart:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2082;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_186C88000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@: job failed to spawn, plist=%{public}s",  (uint8_t *)&v3,  0x16u);
}

+ (void)submitAll:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)start:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.3(void *a1, _OWORD *a2)
{
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.4(void *a1, _OWORD *a2)
{
}

- (void)initWithPlist:(void *)a1 domain:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)initWithPlist:(void *)a1 domain:(_OWORD *)a2 .cold.2(void *a1, _OWORD *a2)
{
}

- (void)_initWithHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

+ (void)jobStateFromMessage:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.2(void *a1, _OWORD *a2)
{
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.4(void *a1, _OWORD *a2)
{
}

- (void)_setupMonitorSourceWithPort:(void *)a1 onQueue:(_OWORD *)a2 withHandler:.cold.1( void *a1,  _OWORD *a2)
{
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1( void *a1,  _OWORD *a2)
{
}

+ (void)copyJobsManagedBy:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

+ (void)copyJobWithHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

+ (void)copyJobWithHandle:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
}

+ (void)submitExtension:(void *)a1 overlay:(_OWORD *)a2 domain:error:.cold.1(void *a1, _OWORD *a2)
{
}

+ (void)submitExtension:(void *)a1 overlay:(_OWORD *)a2 domain:error:.cold.2(void *a1, _OWORD *a2)
{
}

+ (void)copyJobWithPid:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

@end