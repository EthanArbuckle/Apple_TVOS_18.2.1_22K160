@interface NWActivityEpilogueStatistics
+ (id)createActivityEpilogueDictionary:(nw_activity_epilogue_report_s *)a3;
- (BOOL)retry;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSUUID)activityUUID;
- (NSUUID)externallyVisibleActivityUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWActivityEpilogueStatistics)initWithJSONData:(id)a3;
- (NWActivityEpilogueStatistics)initWithNWActivityEpilogueReport:(nw_activity_epilogue_report_s *)a3 length:(unint64_t)a4;
- (const)underlyingErrorDomainString;
- (int)completionReason;
- (int)underlyingErrorCode;
- (int)underlyingErrorDomain;
- (nw_activity_epilogue_report_s)report;
- (unint64_t)durationMsecs;
- (unint64_t)investigation_identifier;
- (unsigned)domain;
- (unsigned)fragmentsQuenched;
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
- (void)setReport:(nw_activity_epilogue_report_s *)a3;
@end

@implementation NWActivityEpilogueStatistics

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

- (int)completionReason
{
  return v3;
}

- (const)underlyingErrorDomainString
{
  v3[32] = *MEMORY[0x1895F89C0];
  -[NWActivityEpilogueStatistics report](self, "report");
  return (const char *)v3;
}

- (int)underlyingErrorDomain
{
  return v3;
}

- (int)underlyingErrorCode
{
  return v3;
}

- (NSUUID)activityUUID
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!self->_activityUUID)
  {
    -[NWActivityEpilogueStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      id v3 = objc_alloc(MEMORY[0x189607AB8]);
      -[NWActivityEpilogueStatistics report](self, "report");
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
    -[NWActivityEpilogueStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      id v3 = objc_alloc(MEMORY[0x189607AB8]);
      -[NWActivityEpilogueStatistics report](self, "report");
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
  -[NWActivityEpilogueStatistics report](self, "report");
  return v3;
}

- (unint64_t)durationMsecs
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NWActivityEpilogueStatistics report](self, "report");
  return v3;
}

- (unsigned)fragmentsQuenched
{
  return v3;
}

- (NSString)bundleID
{
  v4[67] = *MEMORY[0x1895F89C0];
  v2 = (void *)NSString;
  -[NWActivityEpilogueStatistics report](self, "report");
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
      v8 = "-[NWActivityEpilogueStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }

  -[NWActivityEpilogueStatistics report](self, "report");
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (unsigned)metricType
{
  if (self->_metricType) {
    return self->_metricType;
  }
  else {
    return 4;
  }
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  p_dictionaryReport = &self->_dictionaryReport;
  dictionaryReport = self->_dictionaryReport;
  if (!dictionaryReport)
  {
    -[NWActivityEpilogueStatistics report](self, "report");
    +[NWActivityEpilogueStatistics createActivityEpilogueDictionary:]( &OBJC_CLASS___NWActivityEpilogueStatistics,  "createActivityEpilogueDictionary:",  v26);
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      return v4;
    }
    uint64_t v7 = v4;
    v8 = -[NWActivityEpilogueStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
    if (v8)
    {
      -[NWActivityEpilogueStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
      __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 UUIDString];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[NWActivityEpilogueStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NWActivityEpilogueStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 UUIDString];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[NWActivityEpilogueStatistics report](self, "report");
    memcpy(__dst, v24, sizeof(__dst));
    uint64_t v12 = +[NWActivityStatistics createActivityReportDictionary:uuidString:parentUUIDString:]( &OBJC_CLASS___NWActivityStatistics,  "createActivityReportDictionary:uuidString:parentUUIDString:",  __dst,  v8,  v10);
    if (!v12)
    {

      return (NSMutableDictionary *)0LL;
    }

    uint64_t v13 = (void *)v12;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, @"activity");
    v14 = -[NWActivityEpilogueStatistics layer2Report](self, "layer2Report");
    if (v14)
    {
      v15 = -[NWActivityEpilogueStatistics layer2Report](self, "layer2Report");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, @"l2Report");
    }
    v16 = -[NWActivityEpilogueStatistics deviceReport](self, "deviceReport");
    if (v16)
    {
      v17 = -[NWActivityEpilogueStatistics deviceReport](self, "deviceReport");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v17,  @"deviceReport");
    }

    -[NWActivityEpilogueStatistics setMetricType:](self, "setMetricType:", 4LL);
    objc_storeStrong((id *)p_dictionaryReport, v7);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *p_dictionaryReport;
      int v20 = 136446466;
      v21 = "-[NWActivityEpilogueStatistics dictionaryReport]";
      __int16 v22 = 2114;
      v23 = v19;
      _os_log_impl( &dword_181A5C000,  v18,  OS_LOG_TYPE_DEBUG,  "%{public}s Generated nw_activity epilogue report: %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    dictionaryReport = *p_dictionaryReport;
  }

  id v4 = dictionaryReport;
  return v4;
}

- (NWActivityEpilogueStatistics)initWithNWActivityEpilogueReport:(nw_activity_epilogue_report_s *)a3 length:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a4 == 592)
  {
    memcpy(__dst, a3, sizeof(__dst));
    -[NWActivityEpilogueStatistics setReport:](self, "setReport:", __dst);
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
      id v10 = "-[NWActivityEpilogueStatistics initWithNWActivityEpilogueReport:length:]";
      __int16 v11 = 2048;
      uint64_t v12 = 592LL;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s failure to initialize statistics object from nw_activity epilogue report, expected size %zd actual size %zd",  (uint8_t *)&v9,  0x20u);
    }

    v5 = 0LL;
  }

  return v5;
}

- (NWActivityEpilogueStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NWActivityEpilogueStatistics;
  v5 = -[NWActivityEpilogueStatistics init](&v22, sel_init);
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
  v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
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
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
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
          v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
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
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
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
        v24 = "-[NWActivityEpilogueStatistics initWithJSONData:]";
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

- (nw_activity_epilogue_report_s)report
{
  return (nw_activity_epilogue_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_epilogue_report_s));
}

- (void)setReport:(nw_activity_epilogue_report_s *)a3
{
}

- (void).cxx_destruct
{
}

+ (id)createActivityEpilogueDictionary:(nw_activity_epilogue_report_s *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v4)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->duration_msecs];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKeyedSubscript:@"durationMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->fragments_quenched];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKeyedSubscript:@"fragmentsQuenched"];

    unsigned int v7 = a3->completion_reason - 1;
    if (v7 > 3) {
      v8 = @"NW_ACTIVITY_COMPLETION_REASON_INVALID";
    }
    else {
      v8 = off_189BC5838[v7];
    }
    [v4 setObject:v8 forKeyedSubscript:@"completionReason"];
    [NSString stringWithUTF8String:a3->underlying_error_domain_string];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKeyedSubscript:@"underlyingErrorDomainString"];

    [MEMORY[0x189607968] numberWithInt:a3->underlying_error_domain];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:@"underlyingErrorDomain"];

    [MEMORY[0x189607968] numberWithInt:a3->underlying_error_code];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:@"underlyingErrorCode"];

    id v12 = v4;
  }

  return v4;
}

@end