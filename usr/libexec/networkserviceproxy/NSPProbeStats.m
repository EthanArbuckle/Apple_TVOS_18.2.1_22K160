@interface NSPProbeStats
- (NSString)probeInterface;
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (id)probeReasonToString;
- (int64_t)probeReason;
- (unint64_t)directProbeCount;
- (unint64_t)directProbeFailedCount;
- (unint64_t)directProbeRedirectedCount;
- (unint64_t)directProbeServerErrorCount;
- (unint64_t)directProbeSuccessCount;
- (unint64_t)probeDurationSec;
- (unint64_t)proxyProbeCount;
- (unint64_t)proxyProbeFailedCount;
- (unint64_t)proxyProbeRedirectedCount;
- (unint64_t)proxyProbeServerErrorCount;
- (unint64_t)proxyProbeSuccessCount;
- (void)setDirectProbeCount:(unint64_t)a3;
- (void)setDirectProbeFailedCount:(unint64_t)a3;
- (void)setDirectProbeRedirectedCount:(unint64_t)a3;
- (void)setDirectProbeServerErrorCount:(unint64_t)a3;
- (void)setDirectProbeSuccessCount:(unint64_t)a3;
- (void)setProbeDurationSec:(unint64_t)a3;
- (void)setProbeInterface:(id)a3;
- (void)setProbeReason:(int64_t)a3;
- (void)setProxyProbeCount:(unint64_t)a3;
- (void)setProxyProbeFailedCount:(unint64_t)a3;
- (void)setProxyProbeRedirectedCount:(unint64_t)a3;
- (void)setProxyProbeServerErrorCount:(unint64_t)a3;
- (void)setProxyProbeSuccessCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPProbeStats

- (id)eventName
{
  return @"com.apple.nsp.ProbeStats";
}

- (id)probeReasonToString
{
  int64_t v2 = -[NSPProbeStats probeReason](self, "probeReason");
  v3 = @"Unknown";
  if (v2 == 1) {
    v3 = @"Proxy";
  }
  if (v2 == 2) {
    return @"DNS";
  }
  else {
    return (id)v3;
  }
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats tierType](self, "tierType"));

  if (v3)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats tierType](self, "tierType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"TierType");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats probeReasonToString](self, "probeReasonToString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"ProbeReason");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats probeInterface](self, "probeInterface"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v10,  @"ProbeInterface");

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats probeDurationSec](self, "probeDurationSec")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, @"ProbeDuration");

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats proxyProbeCount](self, "proxyProbeCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v12,  @"ProxyProbeCount");

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats proxyProbeSuccessCount](self, "proxyProbeSuccessCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v13,  @"ProxyProbeSuccessCount");

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats proxyProbeFailedCount](self, "proxyProbeFailedCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v14,  @"ProxyProbeFailedCount");

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats proxyProbeRedirectedCount](self, "proxyProbeRedirectedCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v15,  @"ProxyProbeRedirectedCount");

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats proxyProbeServerErrorCount](self, "proxyProbeServerErrorCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v16,  @"ProxyProbeServerErrorCount");

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats directProbeCount](self, "directProbeCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v17,  @"DirectProbeCount");

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats directProbeSuccessCount](self, "directProbeSuccessCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v18,  @"DirectProbeSuccessCount");

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats directProbeFailedCount](self, "directProbeFailedCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v19,  @"DirectProbeFailedCount");

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats directProbeRedirectedCount](self, "directProbeRedirectedCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v20,  @"DirectProbeRedirectedCount");

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProbeStats directProbeServerErrorCount](self, "directProbeServerErrorCount")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v21,  @"DirectProbeServerErrorCount");

    return v7;
  }

  else
  {
    uint64_t v23 = nplog_obj(v4, v5, v6);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      v26 = "-[NSPProbeStats analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "%s called with null self.tierType",  (uint8_t *)&v25,  0xCu);
    }

    return 0LL;
  }

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (int64_t)probeReason
{
  return self->_probeReason;
}

- (void)setProbeReason:(int64_t)a3
{
  self->_probeReason = a3;
}

- (NSString)probeInterface
{
  return self->_probeInterface;
}

- (void)setProbeInterface:(id)a3
{
}

- (unint64_t)probeDurationSec
{
  return self->_probeDurationSec;
}

- (void)setProbeDurationSec:(unint64_t)a3
{
  self->_probeDurationSec = a3;
}

- (unint64_t)proxyProbeCount
{
  return self->_proxyProbeCount;
}

- (void)setProxyProbeCount:(unint64_t)a3
{
  self->_proxyProbeCount = a3;
}

- (unint64_t)proxyProbeSuccessCount
{
  return self->_proxyProbeSuccessCount;
}

- (void)setProxyProbeSuccessCount:(unint64_t)a3
{
  self->_proxyProbeSuccessCount = a3;
}

- (unint64_t)proxyProbeFailedCount
{
  return self->_proxyProbeFailedCount;
}

- (void)setProxyProbeFailedCount:(unint64_t)a3
{
  self->_proxyProbeFailedCount = a3;
}

- (unint64_t)proxyProbeRedirectedCount
{
  return self->_proxyProbeRedirectedCount;
}

- (void)setProxyProbeRedirectedCount:(unint64_t)a3
{
  self->_proxyProbeRedirectedCount = a3;
}

- (unint64_t)proxyProbeServerErrorCount
{
  return self->_proxyProbeServerErrorCount;
}

- (void)setProxyProbeServerErrorCount:(unint64_t)a3
{
  self->_proxyProbeServerErrorCount = a3;
}

- (unint64_t)directProbeCount
{
  return self->_directProbeCount;
}

- (void)setDirectProbeCount:(unint64_t)a3
{
  self->_directProbeCount = a3;
}

- (unint64_t)directProbeSuccessCount
{
  return self->_directProbeSuccessCount;
}

- (void)setDirectProbeSuccessCount:(unint64_t)a3
{
  self->_directProbeSuccessCount = a3;
}

- (unint64_t)directProbeFailedCount
{
  return self->_directProbeFailedCount;
}

- (void)setDirectProbeFailedCount:(unint64_t)a3
{
  self->_directProbeFailedCount = a3;
}

- (unint64_t)directProbeRedirectedCount
{
  return self->_directProbeRedirectedCount;
}

- (void)setDirectProbeRedirectedCount:(unint64_t)a3
{
  self->_directProbeRedirectedCount = a3;
}

- (unint64_t)directProbeServerErrorCount
{
  return self->_directProbeServerErrorCount;
}

- (void)setDirectProbeServerErrorCount:(unint64_t)a3
{
  self->_directProbeServerErrorCount = a3;
}

- (void).cxx_destruct
{
}

@end