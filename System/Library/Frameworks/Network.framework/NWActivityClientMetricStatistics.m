@interface NWActivityClientMetricStatistics
- (NSData)metricData;
- (NSDictionary)clientMetric;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleID;
- (NSString)clientMetricName;
- (NSString)clientMetricString;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NWActivityClientMetricStatistics)initWithData:(id)a3;
- (NWActivityClientMetricStatistics)initWithNWActivityClientMetricReport:(nw_activity_client_metric_report_s *)a3 length:(unint64_t)a4;
- (nw_activity_client_metric_report_s)report;
- (void)setActivityUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientMetricName:(id)a3;
- (void)setClientMetricString:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setExternallyVisibleActivityUUID:(id)a3;
- (void)setMetricData:(id)a3;
- (void)setReport:(nw_activity_client_metric_report_s *)a3;
@end

@implementation NWActivityClientMetricStatistics

- (NSUUID)activityUUID
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!self->_activityUUID)
  {
    -[NWActivityClientMetricStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      id v3 = objc_alloc(MEMORY[0x189607AB8]);
      -[NWActivityClientMetricStatistics report](self, "report");
      v4 = (NSUUID *)[v3 initWithUUIDBytes:v7];
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;
    }
  }

  return self->_activityUUID;
}

- (NSString)clientMetricName
{
  v4[657] = *MEMORY[0x1895F89C0];
  v2 = (void *)NSString;
  -[NWActivityClientMetricStatistics report](self, "report");
  [v2 stringWithCString:v4 encoding:134217984];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientMetricName:(id)a3
{
  id v3 = (void *)MEMORY[0x1895F8858](self);
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = v4;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v9 = "-[NWActivityClientMetricStatistics setClientMetricName:]";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_181A5C000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Set clientMetricName to %@ for %@", buf, 0x20u);
    }
  }

  [v3 report];
  strlcpy(v7, (const char *)[v5 UTF8String], 0x100uLL);
}

- (NSString)clientMetricString
{
  v2 = (void *)MEMORY[0x1895F8858](self);
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (gLogDatapath)
  {
    __nwlog_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [v2 report];
      *(_DWORD *)buf = 136446466;
      uint64_t v9 = "-[NWActivityClientMetricStatistics clientMetricString]";
      __int16 v10 = 2080;
      id v11 = &v7;
      _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Client metric C string: %s", buf, 0x16u);
    }
  }

  id v3 = (void *)NSString;
  [v2 report];
  [v3 stringWithCString:&v6 encoding:134217984];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientMetricString:(id)a3
{
  id v3 = (void *)MEMORY[0x1895F8858](self);
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = v4;
  if (gLogDatapath)
  {
    __nwlog_obj();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v9 = "-[NWActivityClientMetricStatistics setClientMetricString:]";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s Set clientMetricString to %@ for %@",  buf,  0x20u);
    }
  }

  [v3 report];
  strlcpy(v7, (const char *)[v5 UTF8String], 0x1388uLL);
}

- (NSDictionary)clientMetric
{
  v2 = (void *)MEMORY[0x1895F8858](self);
  v19[625] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(MEMORY[0x189603F48]);
  [v2 report];
  [v2 report];
  if (strlen(v18) >> 3 > 0x270)
  {
    size_t v4 = 5000LL;
  }

  else
  {
    [v2 report];
    size_t v4 = strlen(v17);
  }

  id v5 = (void *)[v3 initWithBytesNoCopy:v19 length:v4 freeWhenDone:0];
  if (v5)
  {
    id v12 = 0LL;
    [MEMORY[0x1896078D8] JSONObjectWithData:v5 options:0 error:&v12];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (os_log_s *)v12;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Client metric is valid JSON", buf, 0xCu);
      }

      id v6 = v6;
      uint64_t v9 = v6;
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      __int16 v10 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        __int16 v15 = 2112;
        v16 = v7;
        _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s Client metric is not valid JSON: %@",  buf,  0x16u);
      }

      uint64_t v9 = 0LL;
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v7 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = "-[NWActivityClientMetricStatistics clientMetric]";
      _os_log_impl(&dword_181A5C000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Failed to create clientMetric data", buf, 0xCu);
    }

    uint64_t v9 = 0LL;
  }

  return (NSDictionary *)v9;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  dictionaryRepresentation = self->_dictionaryRepresentation;
  if (!dictionaryRepresentation)
  {
    size_t v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    -[NWActivityClientMetricStatistics clientMetricName](self, "clientMetricName");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NWActivityClientMetricStatistics clientMetricName](self, "clientMetricName");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"name");
    }

    -[NWActivityClientMetricStatistics clientMetric](self, "clientMetric");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"metric");
    }
    uint64_t v8 = -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 length];

      if (v11)
      {
        -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"bundleID");
      }
    }
    v13 = -[NWActivityClientMetricStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
    if (v13)
    {
      -[NWActivityClientMetricStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 UUIDString];
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v15, @"activityUUID");
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136446466;
      v20 = "-[NWActivityClientMetricStatistics dictionaryRepresentation]";
      __int16 v21 = 2114;
      v22 = v4;
      _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s Generated nw_activity client metric report: %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    v17 = self->_dictionaryRepresentation;
    self->_dictionaryRepresentation = v4;

    dictionaryRepresentation = self->_dictionaryRepresentation;
  }

  return dictionaryRepresentation;
}

- (NSData)metricData
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  metricData = self->_metricData;
  if (!metricData)
  {
    -[NWActivityClientMetricStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
    size_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([MEMORY[0x1896078D8] isValidJSONObject:v4])
    {
      id v9 = 0LL;
      [MEMORY[0x1896078D8] dataWithJSONObject:v4 options:0 error:&v9];
      id v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      id v6 = v9;
      if (v6 || !v5)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (NSData *)(id)gLogObj;
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v11 = "-[NWActivityClientMetricStatistics metricData]";
          __int16 v12 = 2112;
          v13 = self;
          _os_log_impl( &dword_181A5C000,  (os_log_t)v7,  OS_LOG_TYPE_DEBUG,  "%{public}s Failed to serialize client metric %@",  buf,  0x16u);
        }
      }

      else
      {
        id v5 = v5;
        id v6 = 0LL;
        uint64_t v7 = self->_metricData;
        self->_metricData = v5;
      }
    }

    metricData = self->_metricData;
  }

  return metricData;
}

- (NWActivityClientMetricStatistics)initWithNWActivityClientMetricReport:(nw_activity_client_metric_report_s *)a3 length:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1895F8858](self);
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (v5 == 5272)
  {
    memcpy(__dst, v4, sizeof(__dst));
    [v6 setReport:__dst];
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v8 = v5;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      __int16 v12 = "-[NWActivityClientMetricStatistics initWithNWActivityClientMetricReport:length:]";
      __int16 v13 = 2048;
      uint64_t v14 = 5272LL;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s Failed to initialize statistics object from nw_activity client metrics report, expected size %zd actual size %zd",  (uint8_t *)&v11,  0x20u);
    }

    uint64_t v7 = 0LL;
  }

  return v7;
}

- (NWActivityClientMetricStatistics)initWithData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NWActivityClientMetricStatistics;
  uint64_t v5 = -[NWActivityClientMetricStatistics init](&v22, sel_init);
  if (v5)
  {
    if (v4 && [v4 length])
    {
      id v19 = 0LL;
      [MEMORY[0x1896078D8] JSONObjectWithData:v4 options:0 error:&v19];
      id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (os_log_s *)v19;
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v6 = v6;
        dictionaryRepresentation = (os_log_s *)v5->_dictionaryRepresentation;
        v5->_dictionaryRepresentation = v6;
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        dictionaryRepresentation = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(dictionaryRepresentation, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          __int16 v25 = 2112;
          v26 = v7;
          _os_log_impl( &dword_181A5C000,  dictionaryRepresentation,  OS_LOG_TYPE_ERROR,  "%{public}s Failed to decode client metric data, skipping (error %@)",  buf,  0x16u);
        }
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s Client metric data not present, skipping",  buf,  0xCu);
      }
    }

    v17 = v5;
    goto LABEL_31;
  }

  __nwlog_obj();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityClientMetricStatistics initWithData:]";
  __int16 v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v10, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_181A5C000, v11, v12, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v11, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v11,  v14,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_25;
      }

      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_181A5C000, v11, v14, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_181A5C000, v11, v16, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)setActivityUUID:(id)a3
{
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void)setMetricData:(id)a3
{
}

- (nw_activity_client_metric_report_s)report
{
  return (nw_activity_client_metric_report_s *)memcpy( retstr,  &self->_report,  sizeof(nw_activity_client_metric_report_s));
}

- (void)setReport:(nw_activity_client_metric_report_s *)a3
{
}

- (void).cxx_destruct
{
}

@end