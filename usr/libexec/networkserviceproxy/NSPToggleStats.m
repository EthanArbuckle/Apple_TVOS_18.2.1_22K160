@interface NSPToggleStats
- (BOOL)toggleState;
- (NSPProxyAgentNetworkStatistics)fallbackPathStatistics;
- (NSPProxyAgentNetworkStatistics)primaryPathStatistics;
- (NSPToggleStats)init;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configOutageCount;
- (unint64_t)fraudAlertCount;
- (unint64_t)networkOutageCount;
- (unint64_t)odohAuthFailureCount;
- (unint64_t)odohBadMessageCount;
- (unint64_t)odohOutageCount;
- (unint64_t)proxyOutageCount;
- (unint64_t)systemIncompatibleCount;
- (unint64_t)tokenOutageCount;
- (void)addNetworkStatsToToggleStatsDict:(id)a3 networkStats:(id)a4;
- (void)resetStats;
- (void)sendToggleOffStats;
- (void)sendToggleOnStats;
- (void)setConfigOutageCount:(unint64_t)a3;
- (void)setFallbackPathStatistics:(id)a3;
- (void)setFraudAlertCount:(unint64_t)a3;
- (void)setNetworkOutageCount:(unint64_t)a3;
- (void)setOdohAuthFailureCount:(unint64_t)a3;
- (void)setOdohBadMessageCount:(unint64_t)a3;
- (void)setOdohOutageCount:(unint64_t)a3;
- (void)setPrimaryPathStatistics:(id)a3;
- (void)setProxyOutageCount:(unint64_t)a3;
- (void)setSystemIncompatibleCount:(unint64_t)a3;
- (void)setToggleState:(BOOL)a3;
- (void)setTokenOutageCount:(unint64_t)a3;
@end

@implementation NSPToggleStats

- (NSPToggleStats)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSPToggleStats;
  v2 = -[NSPToggleStats init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSPProxyAgentNetworkStatistics);
    primaryPathStatistics = v2->_primaryPathStatistics;
    v2->_primaryPathStatistics = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSPProxyAgentNetworkStatistics);
    fallbackPathStatistics = v2->_fallbackPathStatistics;
    v2->_fallbackPathStatistics = v5;
  }

  return v2;
}

- (id)eventName
{
  return @"com.apple.nsp.ToggleStats";
}

- (void)addNetworkStatsToToggleStatsDict:(id)a3 networkStats:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    uint64_t v42 = nplog_obj(v7, v8, v9);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v46 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v43 = "%s called with null toggleStatsDict";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, v43, buf, 0xCu);
    goto LABEL_9;
  }

  if (!v7)
  {
    uint64_t v44 = nplog_obj(0LL, v8, v9);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v46 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v43 = "%s called with null networkStats";
    goto LABEL_14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));

  if (v11 == v10)
  {
    v13 = @"PrimaryPath";
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));

    if (v12 == v10) {
      v13 = @"FallbackPath";
    }
    else {
      v13 = 0LL;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"ProxyConnectionSuccessCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[2]));
  [v6 setObject:v15 forKeyedSubscript:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionTimeoutCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[3]));
  [v6 setObject:v17 forKeyedSubscript:v16];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionRefusedCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[4]));
  [v6 setObject:v19 forKeyedSubscript:v18];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionHostDownCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[5]));
  [v6 setObject:v21 forKeyedSubscript:v20];

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionHostUnreachableCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[6]));
  [v6 setObject:v23 forKeyedSubscript:v22];

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionErrorCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[7]));
  [v6 setObject:v25 forKeyedSubscript:v24];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionDNSTimeoutCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[8]));
  [v6 setObject:v27 forKeyedSubscript:v26];

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionDNSBlockedCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[9]));
  [v6 setObject:v29 forKeyedSubscript:v28];

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IngressProxyConnectionCertErrorCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[10]));
  [v6 setObject:v31 forKeyedSubscript:v30];

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"EgressProxyConnectionErrorCount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[11]));
  [v6 setObject:v33 forKeyedSubscript:v32];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"OriginProxyConnectionErrorCount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[12]));
  [v6 setObject:v35 forKeyedSubscript:v34];

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"EgressProxyUnavailableErrorCount"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[13]));
  [v6 setObject:v37 forKeyedSubscript:v36];

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"IncompleteHandshakeStallCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[14]));
  [v6 setObject:v39 forKeyedSubscript:v38];

  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  @"PostHandShakeStallCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10[15]));
  [v6 setObject:v41 forKeyedSubscript:v40];

LABEL_9:
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPToggleStats toggleState](self, "toggleState")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"ToggleState");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats configOutageCount](self, "configOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"ConfigOutageCount");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats tokenOutageCount](self, "tokenOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"TokenOutageCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats networkOutageCount](self, "networkOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"NetworkOutageCount");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats proxyOutageCount](self, "proxyOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"ProxyOutageCount");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats odohOutageCount](self, "odohOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"ODoHOutageCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats systemIncompatibleCount](self, "systemIncompatibleCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"SystemIncompatibleCount");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats fraudAlertCount](self, "fraudAlertCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"FraudAlertCount");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats odohAuthFailureCount](self, "odohAuthFailureCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"ODoHAuthFailureCount");

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPToggleStats odohBadMessageCount](self, "odohBadMessageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"ODoHBadMessageCount");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));
  -[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]( self,  "addNetworkStatsToToggleStatsDict:networkStats:",  v3,  v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));
  -[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]( self,  "addNetworkStatsToToggleStatsDict:networkStats:",  v3,  v15);

  return v3;
}

- (void)sendToggleOnStats
{
}

- (void)sendToggleOffStats
{
}

- (void)resetStats
{
  v3 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  v4 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }
}

- (unint64_t)tokenOutageCount
{
  return self->_tokenOutageCount;
}

- (void)setTokenOutageCount:(unint64_t)a3
{
  self->_tokenOutageCount = a3;
}

- (unint64_t)configOutageCount
{
  return self->_configOutageCount;
}

- (void)setConfigOutageCount:(unint64_t)a3
{
  self->_configOutageCount = a3;
}

- (unint64_t)networkOutageCount
{
  return self->_networkOutageCount;
}

- (void)setNetworkOutageCount:(unint64_t)a3
{
  self->_networkOutageCount = a3;
}

- (unint64_t)proxyOutageCount
{
  return self->_proxyOutageCount;
}

- (void)setProxyOutageCount:(unint64_t)a3
{
  self->_proxyOutageCount = a3;
}

- (unint64_t)odohOutageCount
{
  return self->_odohOutageCount;
}

- (void)setOdohOutageCount:(unint64_t)a3
{
  self->_odohOutageCount = a3;
}

- (unint64_t)systemIncompatibleCount
{
  return self->_systemIncompatibleCount;
}

- (void)setSystemIncompatibleCount:(unint64_t)a3
{
  self->_systemIncompatibleCount = a3;
}

- (unint64_t)fraudAlertCount
{
  return self->_fraudAlertCount;
}

- (void)setFraudAlertCount:(unint64_t)a3
{
  self->_fraudAlertCount = a3;
}

- (NSPProxyAgentNetworkStatistics)primaryPathStatistics
{
  return self->_primaryPathStatistics;
}

- (void)setPrimaryPathStatistics:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)fallbackPathStatistics
{
  return self->_fallbackPathStatistics;
}

- (void)setFallbackPathStatistics:(id)a3
{
}

- (unint64_t)odohAuthFailureCount
{
  return self->_odohAuthFailureCount;
}

- (void)setOdohAuthFailureCount:(unint64_t)a3
{
  self->_odohAuthFailureCount = a3;
}

- (unint64_t)odohBadMessageCount
{
  return self->_odohBadMessageCount;
}

- (void)setOdohBadMessageCount:(unint64_t)a3
{
  self->_odohBadMessageCount = a3;
}

- (BOOL)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(BOOL)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
}

@end