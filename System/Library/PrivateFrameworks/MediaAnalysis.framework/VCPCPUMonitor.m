@interface VCPCPUMonitor
+ (id)sharedCPUMonitor;
- (VCPCPUMonitor)init;
- (int)disableWithTimeoutSeconds:(int)a3;
- (void)cancelRequest:(int)a3;
- (void)dealloc;
@end

@implementation VCPCPUMonitor

- (VCPCPUMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VCPCPUMonitor;
  v2 = -[VCPCPUMonitor init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;

    v2->_requestID = 0;
  }

  return v2;
}

+ (id)sharedCPUMonitor
{
  if (qword_1001E63B0 != -1) {
    dispatch_once(&qword_1001E63B0, &stru_1001B9F48);
  }
  return (id)qword_1001E63A8;
}

- (void)dealloc
{
  uint64_t v3 = getpid();
  if (proc_set_cpumon_defaults(v3) && (int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    os_log_type_t v6 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to restore default CPU limits", buf, 2u);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VCPCPUMonitor;
  -[VCPCPUMonitor dealloc](&v7, "dealloc");
}

- (int)disableWithTimeoutSeconds:(int)a3
{
  if (a3 <= 0)
  {
    LODWORD(requestID) = -1;
  }

  else
  {
    uint64_t v3 = *(void *)&a3;
    v5 = self->_requests;
    objc_sync_enter(v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue([v31 dateByAddingTimeInterval:(double)(int)v3]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requests, "allValues"));
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        v11 = 0LL;
        v12 = v7;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v12 laterDate:*(void *)(*((void *)&v32 + 1) + 8 * (void)v11)]);

          v11 = (char *)v11 + 1;
          v12 = v7;
        }

        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }

      while (v9);
    }

    if ([v7 compare:v6] != (id)-1) {
      goto LABEL_10;
    }
    uint64_t v17 = MediaAnalysisLogLevel(-1LL, v13);
    if ((int)v17 >= 6)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Increasing CPU limits until %@", buf, 0xCu);
      }
    }

    uint64_t v22 = getpid();
    uint64_t v23 = proc_set_cpumon_params(v22, 100LL, v3);
    if ((_DWORD)v23)
    {
      uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
      if ((int)v25 >= 4)
      {
        uint64_t v27 = VCPLogInstance(v25, v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        os_log_type_t v29 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v28, v29))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to increase CPU limits", buf, 2u);
        }
      }

      LODWORD(requestID) = -1;
    }

    else
    {
LABEL_10:
      uint64_t requestID = self->_requestID;
      self->_uint64_t requestID = requestID + 1;
      requests = self->_requests;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", requestID));
      -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v6, v16);
    }

    objc_sync_exit(v5);
  }

  return requestID;
}

- (void)cancelRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = self->_requests;
  objc_sync_enter(v5);
  requests = self->_requests;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](requests, "objectForKey:", v7));

  if (v8)
  {
    v11 = self->_requests;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requests, "allValues", 0LL));
    id v15 = [v14 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v54;
      do
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = v13;
        do
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 laterDate:*(void *)(*((void *)&v53 + 1) + 8 * (void)v17)]);

          uint64_t v17 = (char *)v17 + 1;
          uint64_t v18 = v13;
        }

        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }

      while (v15);
    }

    if ([v13 compare:v8] != (id)-1) {
      goto LABEL_33;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v20 = [v19 compare:v13];
    if (v20 == (id)-1LL)
    {
      uint64_t v40 = MediaAnalysisLogLevel(-1LL, v21);
      if ((int)v40 >= 6)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v44 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v43, v44))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v13;
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "Updating CPU limits timeout to %@", buf, 0xCu);
        }
      }

      [v13 timeIntervalSinceDate:v19];
      double v46 = v45;
      uint64_t v47 = getpid();
      uint64_t v48 = proc_set_cpumon_params(v47, 100LL, (int)v46);
      if (!(_DWORD)v48) {
        goto LABEL_32;
      }
      uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
      uint64_t v52 = VCPLogInstance(v50, v51);
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      os_log_type_t v34 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v33, v34)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      __int128 v35 = "Failed to update CPU limits timeout";
    }

    else
    {
      uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v22 >= 6)
      {
        uint64_t v24 = VCPLogInstance(v22, v23);
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "Restoring default CPU limits", buf, 2u);
        }
      }

      uint64_t v27 = getpid();
      uint64_t v28 = proc_set_cpumon_defaults(v27);
      if (!(_DWORD)v28) {
        goto LABEL_32;
      }
      uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
      uint64_t v32 = VCPLogInstance(v30, v31);
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v33, v34))
      {
LABEL_31:

LABEL_32:
LABEL_33:

        goto LABEL_34;
      }

      *(_WORD *)buf = 0;
      __int128 v35 = "Failed to restore default CPU limits";
    }

    _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, buf, 2u);
    goto LABEL_31;
  }

  uint64_t v36 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v36 >= 4)
  {
    uint64_t v38 = VCPLogInstance(v36, v37);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v38);
    os_log_type_t v39 = VCPLogToOSLogType[4];
    if (os_log_type_enabled((os_log_t)v13, v39))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v39,  "Invalid CPU monitor request specified (%d)",  buf,  8u);
    }

    goto LABEL_33;
  }

- (void).cxx_destruct
{
}

@end