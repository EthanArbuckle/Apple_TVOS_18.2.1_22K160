@interface NWActivityStatistics
+ (id)createActivityReportDictionary:(nw_activity_report_s *)a3 uuidString:(id)a4 parentUUIDString:(id)a5;
- (BOOL)retry;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWActivityStatistics)initWithJSONData:(id)a3;
- (NWActivityStatistics)initWithNWActivityReport:(nw_activity_report_s *)a3 length:(unint64_t)a4;
- (nw_activity_report_s)report;
- (unint64_t)investigation_identifier;
- (unsigned)domain;
- (unsigned)label;
- (unsigned)metricType;
- (void)setActivityUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDictionaryReport:(id)a3;
- (void)setExternallyVisibleActivityUUID:(id)a3;
- (void)setExternallyVisibleParentUUID:(id)a3;
- (void)setLayer2Report:(id)a3;
- (void)setMetricType:(unsigned __int8)a3;
- (void)setParentUUID:(id)a3;
- (void)setReport:(nw_activity_report_s *)a3;
@end

@implementation NWActivityStatistics

- (unsigned)domain
{
  return v3;
}

- (unsigned)label
{
  return v3;
}

- (BOOL)retry
{
  return v3 & 1;
}

- (NSUUID)activityUUID
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!self->_activityUUID)
  {
    -[NWActivityStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      id v3 = objc_alloc(MEMORY[0x189607AB8]);
      -[NWActivityStatistics report](self, "report");
      v4 = (NSUUID *)[v3 initWithUUIDBytes:&v7];
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;
    }
  }

  return self->_activityUUID;
}

- (NSUUID)parentUUID
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!self->_parentUUID)
  {
    -[NWActivityStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      id v3 = objc_alloc(MEMORY[0x189607AB8]);
      -[NWActivityStatistics report](self, "report");
      v4 = (NSUUID *)[v3 initWithUUIDBytes:&v7];
      parentUUID = self->_parentUUID;
      self->_parentUUID = v4;
    }
  }

  return self->_parentUUID;
}

- (unint64_t)investigation_identifier
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NWActivityStatistics report](self, "report");
  return v3;
}

- (NSString)bundleID
{
  v4[33] = *MEMORY[0x1895F89C0];
  v2 = (void *)NSString;
  -[NWActivityStatistics report](self, "report");
  [v2 stringWithCString:v4 encoding:134217984];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v8 = "-[NWActivityStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }

  -[NWActivityStatistics report](self, "report");
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (unsigned)metricType
{
  if (self->_metricType) {
    return self->_metricType;
  }
  else {
    return 3;
  }
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  p_dictionaryReport = &self->_dictionaryReport;
  dictionaryReport = self->_dictionaryReport;
  if (!dictionaryReport)
  {
    v5 = -[NWActivityStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
    if (v5)
    {
      v6 = -[NWActivityStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
      [v6 UUIDString];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[NWActivityStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[NWActivityStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
      [v8 UUIDString];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[NWActivityStatistics report](self, "report");
    uint64_t v9 = +[NWActivityStatistics createActivityReportDictionary:uuidString:parentUUIDString:]( &OBJC_CLASS___NWActivityStatistics,  "createActivityReportDictionary:uuidString:parentUUIDString:",  v22,  v5,  v7);
    if (!v9)
    {

      return (NSMutableDictionary *)0LL;
    }

    id v10 = (void *)v9;
    -[NWActivityStatistics layer2Report](self, "layer2Report");
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[NWActivityStatistics layer2Report](self, "layer2Report");
      [v10 setObject:v12 forKeyedSubscript:@"l2Report"];
    }

    -[NWActivityStatistics deviceReport](self, "deviceReport");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[NWActivityStatistics deviceReport](self, "deviceReport");
      [v10 setObject:v14 forKeyedSubscript:@"deviceReport"];
    }

    -[NWActivityStatistics setMetricType:](self, "setMetricType:", 3LL);
    objc_storeStrong((id *)p_dictionaryReport, v10);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *p_dictionaryReport;
      int v18 = 136446466;
      v19 = "-[NWActivityStatistics dictionaryReport]";
      __int16 v20 = 2114;
      v21 = v16;
      _os_log_impl( &dword_181A5C000,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s Generated nw_activity report: %{public}@",  (uint8_t *)&v18,  0x16u);
    }

    dictionaryReport = *p_dictionaryReport;
  }

  return dictionaryReport;
}

- (NWActivityStatistics)initWithNWActivityReport:(nw_activity_report_s *)a3 length:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a4 == 312)
  {
    memcpy(__dst, a3, sizeof(__dst));
    -[NWActivityStatistics setReport:](self, "setReport:", __dst);
    v5 = self;
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v7 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "-[NWActivityStatistics initWithNWActivityReport:length:]";
      __int16 v11 = 2048;
      uint64_t v12 = 312LL;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s failure to initialize statistics object from nw_activity report, expected size %zd actual size %zd",  (uint8_t *)&v9,  0x20u);
    }

    v5 = 0LL;
  }

  return v5;
}

- (NWActivityStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NWActivityStatistics;
  v5 = -[NWActivityStatistics init](&v22, sel_init);
  if (v5)
  {
    if (v4 && [v4 length])
    {
      id v19 = 0LL;
      uint64_t v6 = [MEMORY[0x1896078D8] JSONObjectWithData:v4 options:1 error:&v19];
      id v7 = v19;
      dictionaryReport = v5->_dictionaryReport;
      v5->_dictionaryReport = (NSMutableDictionary *)v6;
    }

    int v9 = v5;
    goto LABEL_6;
  }

  __nwlog_obj();
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityStatistics initWithJSONData:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityStatistics initWithJSONData:]";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v13,  v16,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }

      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
}

- (void)setActivityUUID:(id)a3
{
}

- (void)setParentUUID:(id)a3
{
}

- (NSDictionary)layer2Report
{
  return self->_layer2Report;
}

- (void)setLayer2Report:(id)a3
{
}

- (NSDictionary)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
}

- (void)setMetricType:(unsigned __int8)a3
{
  self->_metricType = a3;
}

- (void)setDictionaryReport:(id)a3
{
}

- (nw_activity_report_s)report
{
  return (nw_activity_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_report_s));
}

- (void)setReport:(nw_activity_report_s *)a3
{
}

- (void).cxx_destruct
{
}

+ (id)createActivityReportDictionary:(nw_activity_report_s *)a3 uuidString:(id)a4 parentUUIDString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v9)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:a3->domain];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v10 forKeyedSubscript:@"activityDomain"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->label];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKeyedSubscript:@"activityLabel"];

    [MEMORY[0x189607968] numberWithInt:*((_BYTE *)a3 + 304) & 1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKeyedSubscript:@"isRetry"];

    [v9 setObject:v7 forKeyedSubscript:@"activityUUID"];
    [v9 setObject:v8 forKeyedSubscript:@"parentActivityUUID"];
    [NSString stringWithCString:a3->bundle_id encoding:134217984];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKeyedSubscript:@"bundleID"];

    if (os_variant_has_internal_diagnostics())
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->investigation_identifier];
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v14 forKeyedSubscript:@"investigationID"];
    }

    id v15 = v9;
  }

  return v9;
}

@end