@interface HTMonitorPidHangEvent
+ (void)checkHangForPid:(int)a3;
- ($B85CD19390181E9181518CF36663BB03)shmem_region;
- (id)initHTMonitorPidHangEvent:(id *)a3 shmem_size:(unint64_t)a4;
- (unint64_t)shmem_size;
- (void)dealloc;
@end

@implementation HTMonitorPidHangEvent

- (id)initHTMonitorPidHangEvent:(id *)a3 shmem_size:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HTMonitorPidHangEvent;
  id result = -[HTMonitorPidHangEvent init](&v7, "init");
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
  }

  return result;
}

- (void)dealloc
{
  self->_shmem_region = 0LL;
  self->_shmem_size = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HTMonitorPidHangEvent;
  -[HTMonitorPidHangEvent dealloc](&v3, "dealloc");
}

+ (void)checkHangForPid:(int)a3
{
  v4 = (void *)pidHangEventDict;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  id v7 = shared_ht_log_handle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = pidHangEventDict;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "HangTracerMonitor:checkHangForPid pidHangEventDict  %@",  buf,  0xCu);
  }

  if (v6)
  {
    int v9 = *(_DWORD *)(v6[1] + 4LL);
    id v10 = shared_ht_log_handle();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (!v12) {
        goto LABEL_13;
      }
      int v13 = *(_DWORD *)(v6[1] + 4LL);
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v13;
      v14 = "HangTracerMonitor:checkHangForPid number of hang Events =  %d";
      v15 = v11;
      uint32_t v16 = 8;
    }

    else
    {
      if (!v12) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v14 = "HangTracerMonitor:checkHangForPid number of hang Events is 0";
      v15 = v11;
      uint32_t v16 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
LABEL_13:

    uint64_t v19 = v6[1];
    if (*(_DWORD *)(v19 + 4))
    {
      unint64_t v20 = 0LL;
      uint64_t v21 = 32LL;
      do
      {
        v22 = (unsigned int *)(v19 + v21);
        if (atomic_load(v22))
        {
          id v24 = shared_ht_log_handle();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v27) = a3;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "HangTracerMonitor:checkHangForPid hang event suspend count is not 0 for pid=%u ",  buf,  8u);
          }
        }

        else
        {
          HTCheckForHangForHTMonitor((uint64_t)(v22 - 6), v6[1] + 3016LL);
        }

        ++v20;
        uint64_t v19 = v6[1];
        v21 += 376LL;
      }

      while (v20 < *(unsigned int *)(v19 + 4));
    }

    goto LABEL_21;
  }

  id v17 = shared_ht_log_handle();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "HangTracerMonitor:checkHangForPid(pid=%u) is not present in pidHangEventDict ",  buf,  8u);
  }

LABEL_21:
}

- ($B85CD19390181E9181518CF36663BB03)shmem_region
{
  return self->_shmem_region;
}

- (unint64_t)shmem_size
{
  return self->_shmem_size;
}

@end