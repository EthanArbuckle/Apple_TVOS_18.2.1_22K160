@interface NWConnectionStatistics
+ (id)protocolToTransportProtocolString:(unsigned int)a3;
- (BOOL)cellularFallback;
- (BOOL)cellularRrcConnected;
- (BOOL)connected;
- (BOOL)delegated;
- (BOOL)dnsAnswersCached;
- (BOOL)fallbackEligible;
- (BOOL)kernelReportedStalls;
- (BOOL)kernelReportingConnectionStalled;
- (BOOL)kernelReportingReadStalled;
- (BOOL)kernelReportingWriteStalled;
- (BOOL)tcpFastOpen;
- (BOOL)tls13Configured;
- (BOOL)tlsHandshakeTimedOut;
- (BOOL)tlsSucceeded;
- (NSArray)activities;
- (NSArray)externallyVisibleActivityUUIDs;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSString)clientIdentifier;
- (NSString)effectiveBundleID;
- (NSString)sourceIdentifier;
- (NSUUID)connectionUUID;
- (NSUUID)externallyVisibleConnectionUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWConnectionStatistics)initWithJSONData:(id)a3;
- (NWConnectionStatistics)initWithTCPReport:(netcore_stats_tcp_report *)a3 length:(unint64_t)a4 clientIdentifier:(id)a5 sourceIdentifier:(id)a6;
- (id)_createDataUsageSnapshotDictionaryFromStruct:(const netcore_stats_data_usage_snapshot *)a3;
- (id)_createFallbackReportDictionaryFromStruct:(const netcore_stats_tcp_cell_fallback_report *)a3;
- (id)_createStatisticsReportDictionaryFromStruct:(const netcore_stats_tcp_statistics_report *)a3;
- (int)connectedInterfaceType;
- (int)interfaceType;
- (netcore_stats_tcp_report)report;
- (unint64_t)bytesDuplicate;
- (unint64_t)bytesIn;
- (unint64_t)bytesOOO;
- (unint64_t)bytesOut;
- (unint64_t)bytesRetransmitted;
- (unint64_t)packetsDuplicate;
- (unint64_t)packetsIn;
- (unint64_t)packetsOOO;
- (unint64_t)packetsOut;
- (unint64_t)packetsRetransmitted;
- (unsigned)connectionEstablishmentTimeMsecs;
- (unsigned)connectionReportReason;
- (unsigned)dnsResolvedTimeMsecs;
- (unsigned)flowDurationMsecs;
- (unsigned)metricType;
- (unsigned)tcpAppDataStallTimerMsecs;
- (unsigned)tcpAppReportingDataStallCount;
- (unsigned)tcpBetterRouteEventCount;
- (unsigned)tcpConnectionReuseCount;
- (unsigned)tcpRTTBestMsecs;
- (unsigned)tcpRTTCurrentMsecs;
- (unsigned)tcpRTTSmoothedMsecs;
- (unsigned)tcpRTTVariance;
- (unsigned)tcpSynRetransmissionCount;
- (unsigned)timeToConnectionEstablishmentMsecs;
- (unsigned)timeToConnectionStartMsecs;
- (unsigned)timeToDnsResolvedMsecs;
- (unsigned)timeToDnsStartMsecs;
- (unsigned)trafficClass;
- (void)setActivities:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDictionaryReport:(id)a3;
- (void)setEffectiveBundleID:(id)a3;
- (void)setExternallyVisibleActivityUUIDs:(id)a3;
- (void)setExternallyVisibleConnectionUUID:(id)a3;
- (void)setExternallyVisibleParentUUID:(id)a3;
- (void)setLayer2Report:(id)a3;
- (void)setMetricType:(unsigned __int8)a3;
- (void)setReport:(netcore_stats_tcp_report *)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation NWConnectionStatistics

- (BOOL)delegated
{
  return v3;
}

- (unsigned)timeToDnsResolvedMsecs
{
  return v3;
}

- (unsigned)timeToDnsStartMsecs
{
  return v3;
}

- (unsigned)dnsResolvedTimeMsecs
{
  return v3;
}

- (BOOL)dnsAnswersCached
{
  return v3 & 1;
}

- (int)interfaceType
{
  return v3;
}

- (unsigned)timeToConnectionStartMsecs
{
  return v3;
}

- (unsigned)timeToConnectionEstablishmentMsecs
{
  return v3;
}

- (unsigned)connectionEstablishmentTimeMsecs
{
  return v3;
}

- (unsigned)flowDurationMsecs
{
  return v3;
}

- (int)connectedInterfaceType
{
  return v3;
}

- (BOOL)connected
{
  return (v4 >> 1) & 1;
}

- (unint64_t)bytesIn
{
  return v3;
}

- (unint64_t)bytesOut
{
  return v3;
}

- (unint64_t)bytesDuplicate
{
  return v3;
}

- (unint64_t)bytesOOO
{
  return v3;
}

- (unint64_t)bytesRetransmitted
{
  return v3;
}

- (unint64_t)packetsIn
{
  return v3;
}

- (unint64_t)packetsOut
{
  return v3;
}

- (unint64_t)packetsDuplicate
{
  return v3;
}

- (unint64_t)packetsOOO
{
  return v3;
}

- (unint64_t)packetsRetransmitted
{
  return v3;
}

- (unsigned)tcpRTTCurrentMsecs
{
  return v3;
}

- (unsigned)tcpRTTSmoothedMsecs
{
  return v3;
}

- (unsigned)tcpRTTBestMsecs
{
  return v3;
}

- (unsigned)tcpRTTVariance
{
  return v3;
}

- (unsigned)tcpSynRetransmissionCount
{
  return v3;
}

- (BOOL)tcpFastOpen
{
  return (v4 >> 9) & 1;
}

- (unsigned)tcpBetterRouteEventCount
{
  return v3;
}

- (unsigned)tcpConnectionReuseCount
{
  return v3;
}

- (unsigned)tcpAppReportingDataStallCount
{
  return v3;
}

- (unsigned)tcpAppDataStallTimerMsecs
{
  return v3;
}

- (unsigned)trafficClass
{
  return v3;
}

- (BOOL)fallbackEligible
{
  return v3 == 1;
}

- (BOOL)cellularFallback
{
  return (v4 >> 2) & 1;
}

- (BOOL)cellularRrcConnected
{
  return (v4 >> 3) & 1;
}

- (BOOL)tls13Configured
{
  return v3 == 5;
}

- (BOOL)tlsSucceeded
{
  return ((unint64_t)v4 >> 15) & 1;
}

- (BOOL)kernelReportedStalls
{
  return (v4 >> 5) & 1;
}

- (BOOL)kernelReportingConnectionStalled
{
  return (v4 >> 6) & 1;
}

- (BOOL)kernelReportingReadStalled
{
  return (v4 >> 7) & 1;
}

- (BOOL)kernelReportingWriteStalled
{
  return HIBYTE(v4) & 1;
}

- (NSUUID)connectionUUID
{
  id v3 = objc_alloc(MEMORY[0x189607AB8]);
  -[NWConnectionStatistics report](self, "report");
  return (NSUUID *)(id)[v3 initWithUUIDBytes:&v5];
}

- (NSUUID)parentUUID
{
  id v3 = objc_alloc(MEMORY[0x189607AB8]);
  -[NWConnectionStatistics report](self, "report");
  return (NSUUID *)(id)[v3 initWithUUIDBytes:&v5];
}

- (BOOL)tlsHandshakeTimedOut
{
  return ((unint64_t)v4 >> 24) & 1;
}

- (NSArray)activities
{
  v2 = (id *)MEMORY[0x1895F8858](self);
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = v2[6];
  if (v3) {
    return (NSArray *)v3;
  }
  location = v2 + 6;
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  unint64_t v5 = 0LL;
  uint64_t v6 = 383LL;
  id v27 = v4;
  while (1)
  {
    objc_msgSend(v2, "report", p_buf, v25);
    id v7 = objc_alloc(MEMORY[0x189607AB8]);
    [v2 report];
    v8 = (void *)[v7 initWithUUIDBytes:&type[v6 + 1]];
    if (v8)
    {
      [v4 addObject:v8];
      goto LABEL_4;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    int buf = 136446210;
    v31 = "-[NWConnectionStatistics activities]";
    LODWORD(v25) = 12;
    p_int buf = &buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (__nwlog_fault(v10, type, &v28))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type[0];
        if (os_log_type_enabled(v11, type[0]))
        {
          int buf = 136446210;
          v31 = "-[NWConnectionStatistics activities]";
          v13 = v11;
          os_log_type_t v14 = v12;
          v15 = "%{public}s Failed to convert UUID from connection report";
          goto LABEL_19;
        }
      }

      else
      {
        if (v28)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v17 = (os_log_s *)(id)gLogObj;
          os_log_type_t v18 = type[0];
          BOOL v19 = os_log_type_enabled(v17, type[0]);
          if (backtrace_string)
          {
            if (v19)
            {
              int buf = 136446466;
              v31 = "-[NWConnectionStatistics activities]";
              __int16 v32 = 2082;
              v33 = backtrace_string;
              _os_log_impl( &dword_181A5C000,  v17,  v18,  "%{public}s Failed to convert UUID from connection report, dumping backtrace:%{public}s",  (uint8_t *)&buf,  0x16u);
            }

            free(backtrace_string);
          }

          else
          {
            if (v19)
            {
              int buf = 136446210;
              v31 = "-[NWConnectionStatistics activities]";
              _os_log_impl( &dword_181A5C000,  v17,  v18,  "%{public}s Failed to convert UUID from connection report, no backtrace",  (uint8_t *)&buf,  0xCu);
            }
          }

          id v4 = v27;
          goto LABEL_25;
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v20 = type[0];
        if (os_log_type_enabled(v11, type[0]))
        {
          int buf = 136446210;
          v31 = "-[NWConnectionStatistics activities]";
          v13 = v11;
          os_log_type_t v14 = v20;
          v15 = "%{public}s Failed to convert UUID from connection report, backtrace limit exceeded";
LABEL_19:
          _os_log_impl(&dword_181A5C000, v13, v14, v15, (uint8_t *)&buf, 0xCu);
        }
      }
    }

- (NSString)bundleID
{
  id v3 = objc_alloc(NSString);
  -[NWConnectionStatistics report](self, "report");
  return (NSString *)(id)[v3 initWithCString:&v5 encoding:134217984];
}

- (void)setBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136446722;
      v8 = "-[NWConnectionStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      os_log_type_t v12 = self;
      _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }

  -[NWConnectionStatistics report](self, "report");
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (NSString)effectiveBundleID
{
  id v3 = objc_alloc(NSString);
  -[NWConnectionStatistics report](self, "report");
  return (NSString *)(id)[v3 initWithCString:&v5 encoding:134217984];
}

- (void)setEffectiveBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136446722;
      v8 = "-[NWConnectionStatistics setEffectiveBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      os_log_type_t v12 = self;
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s Set effective bundle ID to %@ for %@",  buf,  0x20u);
    }
  }

  -[NWConnectionStatistics report](self, "report");
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (unsigned)connectionReportReason
{
  return v3;
}

- (unsigned)metricType
{
  if (self->_metricType <= 1u) {
    return 1;
  }
  else {
    return self->_metricType;
  }
}

- (id)_createDataUsageSnapshotDictionaryFromStruct:(const netcore_stats_data_usage_snapshot *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v4)
  {
    char v5 = (void *)MEMORY[0x189607968];
    unint64_t bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      double v7 = (double)bytes_in;
      double v8 = log10((double)bytes_in);
      double v9 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v8)));
      unint64_t v10 = (unint64_t)(trunc(round(v9 * v7)) / v9);
    }

    else
    {
      unint64_t v10 = 0LL;
    }

    [v5 numberWithUnsignedLongLong:v10];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:@"bytesIn"];

    os_log_type_t v12 = (void *)MEMORY[0x189607968];
    unint64_t bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      double v14 = (double)bytes_out;
      double v15 = log10((double)bytes_out);
      double v16 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v15)));
      unint64_t v17 = (unint64_t)(trunc(round(v16 * v14)) / v16);
    }

    else
    {
      unint64_t v17 = 0LL;
    }

    [v12 numberWithUnsignedLongLong:v17];
    os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v18 forKeyedSubscript:@"bytesOut"];

    BOOL v19 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_in_cell = a3->multipath_bytes_in_cell;
    if (multipath_bytes_in_cell)
    {
      double v21 = (double)multipath_bytes_in_cell;
      double v22 = log10((double)multipath_bytes_in_cell);
      double v23 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v22)));
      unint64_t v24 = (unint64_t)(trunc(round(v23 * v21)) / v23);
    }

    else
    {
      unint64_t v24 = 0LL;
    }

    [v19 numberWithUnsignedLongLong:v24];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v25 forKeyedSubscript:@"multipathBytesInCell"];

    v26 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_out_cell = a3->multipath_bytes_out_cell;
    if (multipath_bytes_out_cell)
    {
      double v28 = (double)multipath_bytes_out_cell;
      double v29 = log10((double)multipath_bytes_out_cell);
      double v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      unint64_t v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }

    else
    {
      unint64_t v31 = 0LL;
    }

    [v26 numberWithUnsignedLongLong:v31];
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v32 forKeyedSubscript:@"multipathBytesOutCell"];

    v33 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_in_wifi = a3->multipath_bytes_in_wifi;
    if (multipath_bytes_in_wifi)
    {
      double v35 = (double)multipath_bytes_in_wifi;
      double v36 = log10((double)multipath_bytes_in_wifi);
      double v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      unint64_t v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }

    else
    {
      unint64_t v38 = 0LL;
    }

    [v33 numberWithUnsignedLongLong:v38];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v39 forKeyedSubscript:@"multipathBytesInWiFi"];

    v40 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_out_wifi = a3->multipath_bytes_out_wifi;
    if (multipath_bytes_out_wifi)
    {
      double v42 = (double)multipath_bytes_out_wifi;
      double v43 = log10((double)multipath_bytes_out_wifi);
      double v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      unint64_t v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }

    else
    {
      unint64_t v45 = 0LL;
    }

    [v40 numberWithUnsignedLongLong:v45];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v46 forKeyedSubscript:@"multipathBytesOutWiFi"];

    v47 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_in_initial = a3->multipath_bytes_in_initial;
    if (multipath_bytes_in_initial)
    {
      double v49 = (double)multipath_bytes_in_initial;
      double v50 = log10((double)multipath_bytes_in_initial);
      double v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      unint64_t v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }

    else
    {
      unint64_t v52 = 0LL;
    }

    [v47 numberWithUnsignedLongLong:v52];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v53 forKeyedSubscript:@"multipathBytesInInitial"];

    v54 = (void *)MEMORY[0x189607968];
    unint64_t multipath_bytes_out_initial = a3->multipath_bytes_out_initial;
    if (multipath_bytes_out_initial)
    {
      double v56 = (double)multipath_bytes_out_initial;
      double v57 = log10((double)multipath_bytes_out_initial);
      double v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      unint64_t v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }

    else
    {
      unint64_t v59 = 0LL;
    }

    [v54 numberWithUnsignedLongLong:v59];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v60 forKeyedSubscript:@"multipathBytesOutInitial"];

    id v61 = v4;
  }

  return v4;
}

- (id)_createStatisticsReportDictionaryFromStruct:(const netcore_stats_tcp_statistics_report *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v4)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:a3->time_to_dns_start_msecs];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKeyedSubscript:@"timeToDNSStartMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->time_to_dns_resolved_msecs];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKeyedSubscript:@"timeToDNSResolvedMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->dns_resolved_time_msecs];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:@"dNSResolvedTimeMsecs"];

    [MEMORY[0x189607968] numberWithInt:*((_WORD *)a3 + 104) & 1];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKeyedSubscript:@"dNSAnswersCached"];

    unsigned int v9 = a3->interface_type - 1;
    if (v9 > 3) {
      unint64_t v10 = @"INTERFACE_TYPE_OTHER";
    }
    else {
      unint64_t v10 = off_189BC5A88[v9];
    }
    [v4 setObject:v10 forKeyedSubscript:@"interfaceType"];
    [MEMORY[0x189607968] numberWithUnsignedInt:a3->time_to_connection_start_msecs];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:@"timeToConnectionStartMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->time_to_connection_establishment_msecs];
    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v12 forKeyedSubscript:@"timeToConnectionEstablishmentMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->connection_establishment_time_msecs];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v13 forKeyedSubscript:@"connectionEstablishmentTimeMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->flow_duration_msecs];
    double v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKeyedSubscript:@"flowDurationMsecs"];

    unsigned int v15 = a3->connected_interface_type - 1;
    if (v15 > 3) {
      double v16 = @"INTERFACE_TYPE_OTHER";
    }
    else {
      double v16 = off_189BC5A88[v15];
    }
    [v4 setObject:v16 forKeyedSubscript:@"connectedInterfaceType"];
    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 1) & 1];
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v17 forKeyedSubscript:@"connected"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_class];
    os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v18 forKeyedSubscript:@"trafficClass"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 2) & 1];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:@"cellularFallback"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 4) & 1];
    os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKeyedSubscript:@"preferFallback"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 3) & 1];
    double v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:@"cellularRRCConnected"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 5) & 1];
    double v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:@"kernelReportedStalls"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 6) & 1];
    double v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v23 forKeyedSubscript:@"kernelReportingConnectionStalled"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 7) & 1];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v24 forKeyedSubscript:@"kernelReportingReadStalled"];

    [MEMORY[0x189607968] numberWithInt:HIBYTE(*((unsigned __int16 *)a3 + 104)) & 1];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v25 forKeyedSubscript:@"kernelReportingWriteStalled"];

    v26 = (void *)MEMORY[0x189607968];
    unint64_t bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      double v28 = (double)bytes_in;
      double v29 = log10((double)bytes_in);
      double v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      unint64_t v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }

    else
    {
      unint64_t v31 = 0LL;
    }

    [v26 numberWithUnsignedLongLong:v31];
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v32 forKeyedSubscript:@"bytesIn"];

    v33 = (void *)MEMORY[0x189607968];
    unint64_t bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      double v35 = (double)bytes_out;
      double v36 = log10((double)bytes_out);
      double v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      unint64_t v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }

    else
    {
      unint64_t v38 = 0LL;
    }

    [v33 numberWithUnsignedLongLong:v38];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v39 forKeyedSubscript:@"bytesOut"];

    v40 = (void *)MEMORY[0x189607968];
    unint64_t bytes_duplicate = a3->bytes_duplicate;
    if (bytes_duplicate)
    {
      double v42 = (double)bytes_duplicate;
      double v43 = log10((double)bytes_duplicate);
      double v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      unint64_t v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }

    else
    {
      unint64_t v45 = 0LL;
    }

    [v40 numberWithUnsignedLongLong:v45];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v46 forKeyedSubscript:@"bytesDuplicate"];

    v47 = (void *)MEMORY[0x189607968];
    unint64_t bytes_ooo = a3->bytes_ooo;
    if (bytes_ooo)
    {
      double v49 = (double)bytes_ooo;
      double v50 = log10((double)bytes_ooo);
      double v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      unint64_t v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }

    else
    {
      unint64_t v52 = 0LL;
    }

    [v47 numberWithUnsignedLongLong:v52];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v53 forKeyedSubscript:@"bytesOutOfOrder"];

    v54 = (void *)MEMORY[0x189607968];
    unint64_t bytes_retransmitted = a3->bytes_retransmitted;
    if (bytes_retransmitted)
    {
      double v56 = (double)bytes_retransmitted;
      double v57 = log10((double)bytes_retransmitted);
      double v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      unint64_t v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }

    else
    {
      unint64_t v59 = 0LL;
    }

    [v54 numberWithUnsignedLongLong:v59];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v60 forKeyedSubscript:@"bytesRetransmitted"];

    id v61 = (void *)MEMORY[0x189607968];
    unint64_t packets_in = a3->packets_in;
    if (packets_in)
    {
      double v63 = (double)packets_in;
      double v64 = log10((double)packets_in);
      double v65 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v64)));
      unint64_t v66 = (unint64_t)(trunc(round(v65 * v63)) / v65);
    }

    else
    {
      unint64_t v66 = 0LL;
    }

    [v61 numberWithUnsignedLongLong:v66];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v67 forKeyedSubscript:@"packetsIn"];

    v68 = (void *)MEMORY[0x189607968];
    unint64_t packets_out = a3->packets_out;
    if (packets_out)
    {
      double v70 = (double)packets_out;
      double v71 = log10((double)packets_out);
      double v72 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v71)));
      unint64_t v73 = (unint64_t)(trunc(round(v72 * v70)) / v72);
    }

    else
    {
      unint64_t v73 = 0LL;
    }

    [v68 numberWithUnsignedLongLong:v73];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v74 forKeyedSubscript:@"packetsOut"];

    v75 = (void *)MEMORY[0x189607968];
    unint64_t packets_duplicate = a3->packets_duplicate;
    if (packets_duplicate)
    {
      double v77 = (double)packets_duplicate;
      double v78 = log10((double)packets_duplicate);
      double v79 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v78)));
      unint64_t v80 = (unint64_t)(trunc(round(v79 * v77)) / v79);
    }

    else
    {
      unint64_t v80 = 0LL;
    }

    [v75 numberWithUnsignedLongLong:v80];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v81 forKeyedSubscript:@"packetsDuplicate"];

    v82 = (void *)MEMORY[0x189607968];
    unint64_t packets_ooo = a3->packets_ooo;
    if (packets_ooo)
    {
      double v84 = (double)packets_ooo;
      double v85 = log10((double)packets_ooo);
      double v86 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v85)));
      unint64_t v87 = (unint64_t)(trunc(round(v86 * v84)) / v86);
    }

    else
    {
      unint64_t v87 = 0LL;
    }

    [v82 numberWithUnsignedLongLong:v87];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v88 forKeyedSubscript:@"packetsOutOfOrder"];

    v89 = (void *)MEMORY[0x189607968];
    unint64_t packets_retransmitted = a3->packets_retransmitted;
    if (packets_retransmitted)
    {
      double v91 = (double)packets_retransmitted;
      double v92 = log10((double)packets_retransmitted);
      double v93 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v92)));
      unint64_t v94 = (unint64_t)(trunc(round(v93 * v91)) / v93);
    }

    else
    {
      unint64_t v94 = 0LL;
    }

    [v89 numberWithUnsignedLongLong:v94];
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v95 forKeyedSubscript:@"packetsRetransmitted"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->current_rtt_msecs];
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v96 forKeyedSubscript:@"currentRTTMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->smoothed_rtt_msecs];
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v97 forKeyedSubscript:@"smoothedRTTMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->best_rtt_msecs];
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v98 forKeyedSubscript:@"bestRTTMsecs"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->rtt_variance];
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v99 forKeyedSubscript:@"rTTvariance"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->syn_retransmission_count];
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v100 forKeyedSubscript:@"synRetransmissionCount"];

    [MEMORY[0x189607968] numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 9) & 1];
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v101 forKeyedSubscript:@"tcpFastOpen"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->better_route_event_count];
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v102 forKeyedSubscript:@"betterRouteEventCount"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->connection_reuse_count];
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v103 forKeyedSubscript:@"connectionReuseCount"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->app_reporting_data_stall_count];
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v104 forKeyedSubscript:@"appReportingDataStallCount"];

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->app_data_stall_timer_msecs];
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v105 forKeyedSubscript:@"appDataStallTimerMsecs"];

    id v106 = v4;
  }

  return v4;
}

- (id)_createFallbackReportDictionaryFromStruct:(const netcore_stats_tcp_cell_fallback_report *)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (a3)
  {
    uint64_t v25 = self;
    [MEMORY[0x189607968] numberWithBool:a3->fellback];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v6 forKeyedSubscript:@"fellback"];

    int deny_reason = a3->deny_reason;
    if (deny_reason)
    {
      double v8 = @"DENY_REASON_BLOCKED_FROM_USING_CELL_DATA";
      if (deny_reason == 2) {
        double v8 = @"DENY_REASON_EXCEEDED_CELL_FALLBACK_DATA_BUDGET";
      }
      if (deny_reason == 3) {
        unsigned int v9 = @"DENY_REASON_METRICS_TESTING_DENIED";
      }
      else {
        unsigned int v9 = v8;
      }
      [v5 setObject:v9 forKeyedSubscript:@"denyReason"];
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:a3->fallback_timer_msecs];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    [v5 setObject:v10 forKeyedSubscript:@"fallbackTimerMsecs"];

    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (a3->network_event_count)
    {
      unint64_t v12 = 0LL;
      p_time_to_network_event_msecs = &a3->network_events[0].time_to_network_event_msecs;
      do
      {
        id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
        unint64_t v17 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:");
        unsigned int v14 = *p_time_to_network_event_msecs;
        p_time_to_network_event_msecs += 2;
        [MEMORY[0x189607968] numberWithUnsignedInt:v14];
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setObject:v15 forKeyedSubscript:@"timeToNetworkEventsMsecs"];

        [v11 addObject:v17];
        ++v12;
      }

      while (v12 < a3->network_event_count);
    }

    id v5 = v26;
    [v26 setObject:v11 forKeyedSubscript:@"networkEvents"];
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (a3->data_usage_snapshots_at_network_events_count)
    {
      unint64_t v19 = 0LL;
      data_usage_snapshots_at_network_events = a3->data_usage_snapshots_at_network_events;
      while (1)
      {
        uint64_t v21 = -[NWConnectionStatistics _createDataUsageSnapshotDictionaryFromStruct:]( v25,  "_createDataUsageSnapshotDictionaryFromStruct:",  data_usage_snapshots_at_network_events);
        if (!v21) {
          break;
        }
        double v22 = (void *)v21;
        [v18 addObject:v21];

        ++v19;
        ++data_usage_snapshots_at_network_events;
        if (v19 >= a3->data_usage_snapshots_at_network_events_count) {
          goto LABEL_17;
        }
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      double v23 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136446210;
        double v28 = "-[NWConnectionStatistics _createFallbackReportDictionaryFromStruct:]";
        _os_log_impl( &dword_181A5C000,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s failing to allocate NWLibnetcoreConnectionDataUsageSnapshotDictionary",  buf,  0xCu);
      }

      a3 = 0LL;
    }

    else
    {
LABEL_17:
      [v26 setObject:v18 forKeyedSubscript:@"connectionDataUsageSnapshots"];
      a3 = v26;
    }
  }

  return (id)(id)a3;
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v2 = MEMORY[0x1895F8858](self);
  uint64_t v275 = *MEMORY[0x1895F89C0];
  id v4 = (id *)(v2 + 80);
  id v3 = *(id *)(v2 + 80);
  if (v3) {
    goto LABEL_2;
  }
  double v7 = (void *)v2;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v5) {
    return (NSMutableDictionary *)v5;
  }
  double v8 = v5;
  [v7 report];
  if (!v259[1081])
  {
    v199 = v4;
    [MEMORY[0x189607968] numberWithUnsignedInt:v232];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v13 forKeyedSubscript:@"connectionReportReason"];

    if (v239 <= 3) {
      [v8 setObject:off_189BC58A0[v239] forKeyedSubscript:@"connectionMode"];
    }
    else {
      unsigned int v14 = off_189BC58C0[v240 - 1];
    }
    [v8 setObject:v14 forKeyedSubscript:@"appleHost"];
    else {
      double v36 = off_189BC58F0[v241 - 1];
    }
    [v8 setObject:v36 forKeyedSubscript:@"appleApp"];
    [MEMORY[0x189607968] numberWithInt:(v255 >> 23) & 1];
    double v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v37 forKeyedSubscript:@"isDaemon"];

    if ((v255 & 0x800000) != 0)
    {
      [v7 clientIdentifier];
      unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v38 forKeyedSubscript:@"processName"];
    }

    v39 = (void *)[objc_alloc(NSString) initWithCString:&v248 encoding:134217984];
    [v8 setObject:v39 forKeyedSubscript:@"bundleID"];

    v40 = (void *)[objc_alloc(NSString) initWithCString:&v249 encoding:134217984];
    [v8 setObject:v40 forKeyedSubscript:@"effectiveBundleID"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v229];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v41 forKeyedSubscript:@"secondsSinceInterfaceChange"];

    else {
      double v42 = off_189BC5938[v244 - 1];
    }
    [v8 setObject:v42 forKeyedSubscript:@"stackLevel"];
    +[NWConnectionStatistics protocolToTransportProtocolString:]( &OBJC_CLASS___NWConnectionStatistics,  "protocolToTransportProtocolString:",  v230);
    double v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v43 forKeyedSubscript:@"transportProtocol"];

    else {
      double v44 = off_189BC5960[v231 - 1];
    }
    [v8 setObject:v44 forKeyedSubscript:@"dnsProtocol"];
    else {
      unint64_t v45 = off_189BC5980[v242 - 1];
    }
    [v8 setObject:v45 forKeyedSubscript:@"dnsProvider"];
    [MEMORY[0x189607968] numberWithInt:(v255 >> 29) & 1];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v46 forKeyedSubscript:@"svcbRequested"];

    [MEMORY[0x189607968] numberWithInt:(v255 >> 30) & 1];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v47 forKeyedSubscript:@"svcbReceived"];

    [MEMORY[0x189607968] numberWithInt:v255 >> 31];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v48 forKeyedSubscript:@"svcbDoHURI"];

    [MEMORY[0x189607968] numberWithInt:(v255 >> 2) & 1];
    double v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v49 forKeyedSubscript:@"triggeredPath"];

    [MEMORY[0x189607968] numberWithInt:(v255 >> 3) & 1];
    double v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v50 forKeyedSubscript:@"systemProxyConfigured"];

    [MEMORY[0x189607968] numberWithInt:(v255 >> 4) & 1];
    double v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v51 forKeyedSubscript:@"customProxyConfigured"];

    [v8 objectForKeyedSubscript:@"systemProxyConfigured"];
    unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
    }

    else
    {
      [v8 objectForKeyedSubscript:@"customProxyConfigure"]);
      double v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
LABEL_85:
        else {
          double v72 = off_189BC5998[(v253 - 1)];
        }
        [v8 setObject:v72 forKeyedSubscript:@"proxyResult"];
        [MEMORY[0x189607968] numberWithInt:(v255 >> 25) & 1];
        unint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v73 forKeyedSubscript:@"isPathExpensive"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 26) & 1];
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v74 forKeyedSubscript:@"isPathConstrained"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 27) & 1];
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v75 forKeyedSubscript:@"prohibitsExpensive"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 28) & 1];
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v76 forKeyedSubscript:@"prohibitsConstrained"];

        [MEMORY[0x189607968] numberWithInt:v256 & 1];
        double v77 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v77 forKeyedSubscript:@"isProbe"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 18) & 1];
        double v78 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v78 forKeyedSubscript:@"ipv4Available"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 19) & 1];
        double v79 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v79 forKeyedSubscript:@"ipv6Available"];

        [MEMORY[0x189607968] numberWithUnsignedInt:v227];
        unint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v80 forKeyedSubscript:@"ipv4DNSServerCount"];

        [MEMORY[0x189607968] numberWithUnsignedInt:v228];
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v81 forKeyedSubscript:@"ipv6DNSServerCount"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 5) & 1];
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v82 forKeyedSubscript:@"fallbackEligible"];

        unsigned int v83 = v255;
        if ((v255 & 0x20) != 0)
        {
          [MEMORY[0x189607968] numberWithInt:(v255 >> 6) & 1];
          double v84 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v84 forKeyedSubscript:@"weakFallback"];

          [MEMORY[0x189607968] numberWithInt:(v255 >> 7) & 1];
          double v85 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v85 forKeyedSubscript:@"preferFallback"];

          [MEMORY[0x189607968] numberWithInt:(v255 >> 8) & 1];
          double v86 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v86 forKeyedSubscript:@"usedFallback"];

          unsigned int v83 = v255;
        }

        [MEMORY[0x189607968] numberWithInt:(v83 >> 9) & 1];
        unint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v87 forKeyedSubscript:@"resolutionRequired"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 10) & 1];
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v88 forKeyedSubscript:@"tlsConfigured"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 12) & 1];
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v89 forKeyedSubscript:@"tfoConfigured"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 20) & 1];
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v90 forKeyedSubscript:@"tfoUsed"];

        [MEMORY[0x189607968] numberWithInt:(v255 >> 13) & 1];
        double v91 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v91 forKeyedSubscript:@"multipathConfigured"];

        [MEMORY[0x189607968] numberWithUnsignedInt:v215];
        double v92 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v92 forKeyedSubscript:@"trafficClass"];

        double v93 = @"NW_MPTCP_VERSION_UNKNOWN";
        if (v245 == 1) {
          double v93 = @"NW_MPTCP_VERSION_0";
        }
        if (v245 == 2) {
          unint64_t v94 = @"NW_MPTCP_VERSION_1";
        }
        else {
          unint64_t v94 = v93;
        }
        [v8 setObject:v94 forKeyedSubscript:@"mptcpVersion"];
        v95 = @"NW_FAILURE_REASON_PATH";
        switch(v236)
        {
          case 0:
            goto LABEL_100;
          case 2:
            v95 = @"NW_FAILURE_REASON_RESOLVER";
            goto LABEL_99;
          case 3:
            v95 = @"NW_FAILURE_REASON_FLOW";
            goto LABEL_99;
          case 4:
            v95 = @"NW_FAILURE_REASON_TLS";
            goto LABEL_99;
          default:
LABEL_99:
            [v8 setObject:v95 forKeyedSubscript:@"failureReason"];
LABEL_100:
            __int16 v96 = v255;
            if ((v255 & 4) != 0)
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:v216];
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v104 forKeyedSubscript:@"pathTriggerMilliseconds"];

              __int16 v96 = v255;
              if ((v255 & 0x200) == 0)
              {
LABEL_102:
                if ((v96 & 0x18) == 0) {
                  goto LABEL_104;
                }
                goto LABEL_103;
              }
            }

            else if ((v255 & 0x200) == 0)
            {
              goto LABEL_102;
            }

            [MEMORY[0x189607968] numberWithUnsignedInt:v217];
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 setObject:v105 forKeyedSubscript:@"resolutionMilliseconds"];

            __int16 v96 = v255;
            if ((v255 & 0x18) == 0)
            {
LABEL_104:
              if ((v96 & 0x4000) != 0)
              {
                [MEMORY[0x189607968] numberWithUnsignedInt:v219];
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v98 forKeyedSubscript:@"flowConnectMilliseconds"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v221];
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v99 forKeyedSubscript:@"flowDurationMilliseconds"];

                __int16 v96 = v255;
              }

              if (v96 < 0)
              {
                [MEMORY[0x189607968] numberWithUnsignedInt:v220];
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v100 forKeyedSubscript:@"tlsMilliseconds"];
              }

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[23]];
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v101 forKeyedSubscript:@"attemptDelayMilliseconds"];

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[24]];
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v102 forKeyedSubscript:@"attemptEstablishmentMilliseconds"];

              else {
                v103 = off_189BC59B8[v243 - 1];
              }
              [v8 setObject:v103 forKeyedSubscript:@"tlsVersion"];
              [MEMORY[0x189607968] numberWithInt:(v255 >> 21) & 1];
              id v106 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v106 forKeyedSubscript:@"tlsVersionTimeout"];

              [MEMORY[0x189607968] numberWithInt:HIBYTE(v255) & 1];
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v107 forKeyedSubscript:@"tlsHandshakeTimedOut"];

              [MEMORY[0x189607968] numberWithInt:HIBYTE(v256) & 1];
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v108 forKeyedSubscript:@"tlsECHEnabled"];

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[22]];
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v109 forKeyedSubscript:@"transformLastTimeoutMsecs"];
              v110 = +[NWConnectionStatistics protocolToTransportProtocolString:]( &OBJC_CLASS___NWConnectionStatistics,  "protocolToTransportProtocolString:",  v233);
              [v8 setObject:v110 forKeyedSubscript:@"transformFirstProtocol"];
              v111 = +[NWConnectionStatistics protocolToTransportProtocolString:]( &OBJC_CLASS___NWConnectionStatistics,  "protocolToTransportProtocolString:",  v234);
              [v8 setObject:v111 forKeyedSubscript:@"transformConnectedProtocol"];

              [MEMORY[0x189607968] numberWithUnsignedInt:v235];
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v112 forKeyedSubscript:@"transformConnectedProtocolIndex"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 2) & 1];
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v113 forKeyedSubscript:@"quicDeferred"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 3) & 1];
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v114 forKeyedSubscript:@"quicApplicationDeferred"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 4) & 1];
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v115 forKeyedSubscript:@"quicDenied"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 5) & 1];
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v116 forKeyedSubscript:@"quicAlternativePresent"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 6) & 1];
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v117 forKeyedSubscript:@"quicUpdatedAlternative"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 7) & 1];
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v118 forKeyedSubscript:@"quicSpeculativeAttempt"];

              else {
                v119 = off_189BC59F0[v251 - 1];
              }
              [v8 setObject:v119 forKeyedSubscript:@"accurateECNClientState"];
              else {
                v120 = off_189BC5A38[v252 - 1];
              }
              [v8 setObject:v120 forKeyedSubscript:@"accurateECNServerState"];
              [MEMORY[0x189607968] numberWithInt:(v256 >> 10) & 1];
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v121 forKeyedSubscript:@"l4sEnabled"];

              [MEMORY[0x189607968] numberWithUnsignedInt:v222];
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v122 forKeyedSubscript:@"ipv4AddressCount"];

              [MEMORY[0x189607968] numberWithUnsignedInt:v223];
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v123 forKeyedSubscript:@"ipv6AddressCount"];

              [MEMORY[0x189607968] numberWithInt:HIWORD(v255) & 1];
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v124 forKeyedSubscript:@"synthesizedIPv6Address"];

              [MEMORY[0x189607968] numberWithInt:(v255 >> 17) & 1];
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v125 forKeyedSubscript:@"synthesizedExtraIPv6Address"];

              if (v246 == 30) {
                v126 = @"NW_ADDRESS_FAMILY_IPV6";
              }
              else {
                v126 = @"NW_ADDRESS_FAMILY_OTHER";
              }
              if (v246 == 2) {
                v127 = @"NW_ADDRESS_FAMILY_IPV4";
              }
              else {
                v127 = v126;
              }
              [v8 setObject:v127 forKeyedSubscript:@"firstAddressFamily"];
              if ((v255 & 0x4000) != 0)
              {
                if (v247 == 30) {
                  v128 = @"NW_ADDRESS_FAMILY_IPV6";
                }
                else {
                  v128 = @"NW_ADDRESS_FAMILY_OTHER";
                }
                if (v247 == 2) {
                  v129 = @"NW_ADDRESS_FAMILY_IPV4";
                }
                else {
                  v129 = v128;
                }
                [v8 setObject:v129 forKeyedSubscript:@"connectedAddressFamily"];
                [MEMORY[0x189607968] numberWithUnsignedInt:v224];
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v130 forKeyedSubscript:@"connectedAddressIndex"];

                else {
                  v131 = off_189BC5A88[v237 - 1];
                }
                [v8 setObject:v131 forKeyedSubscript:@"connectedInterfaceType"];
                v132 = @"NW_INTERFACE_SUBTYPE_OTHER";
                v133 = @"NW_INTERFACE_SUBTYPE_COPROCESSOR";
                v134 = @"NW_INTERFACE_SUBTYPE_COMPANION";
                if (v238 != 5001) {
                  v134 = @"NW_INTERFACE_SUBTYPE_OTHER";
                }
                if (v238 != 4001) {
                  v133 = v134;
                }
                if (v238 == 1002) {
                  v132 = @"NW_INTERFACE_SUBTYPE_WIFI_AWDL";
                }
                if (v238 == 1001) {
                  v132 = @"NW_INTERFACE_SUBTYPE_WIFI_INFRASTRUCTURE";
                }
                if (v238 <= 4000) {
                  v135 = v132;
                }
                else {
                  v135 = v133;
                }
                [v8 setObject:v135 forKeyedSubscript:@"connectedInterfaceSubtype"];
                [MEMORY[0x189607968] numberWithUnsignedInt:v225];
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v136 forKeyedSubscript:@"connectionReuseCount"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v226];
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v137 forKeyedSubscript:@"dataStallCount"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[0]];
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v138 forKeyedSubscript:@"bytesIn"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[1]];
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v139 forKeyedSubscript:@"bytesOut"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[2]];
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v140 forKeyedSubscript:@"bytesDuplicate"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[3]];
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v141 forKeyedSubscript:@"bytesOutOfOrder"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[4]];
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v142 forKeyedSubscript:@"bytesRetransmitted"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[5]];
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v143 forKeyedSubscript:@"ecnCapablePacketsSent"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[6]];
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v144 forKeyedSubscript:@"ecnCapablePacketsAcked"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[7]];
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v145 forKeyedSubscript:@"ecnCapablePacketsMarked"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[8]];
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v146 forKeyedSubscript:@"ecnCapablePacketsLost"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[9]];
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v147 forKeyedSubscript:@"packetsIn"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[10]];
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v148 forKeyedSubscript:@"ect1PacketsIn"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[11]];
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v149 forKeyedSubscript:@"ect0PacketsIn"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[12]];
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v150 forKeyedSubscript:@"cePacketsIn"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[13]];
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v151 forKeyedSubscript:@"packetsOut"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v209];
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v152 forKeyedSubscript:@"currentRTT"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v210];
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v153 forKeyedSubscript:@"smoothedRTT"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v211];
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v154 forKeyedSubscript:@"bestRTT"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v212];
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v155 forKeyedSubscript:@"rTTvariance"];

                [MEMORY[0x189607968] numberWithUnsignedInt:v213];
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v156 forKeyedSubscript:@"synRetransmissionCount"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[20]];
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v157 forKeyedSubscript:@"estimatedUploadThroughput"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v208[21]];
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v158 forKeyedSubscript:@"estimatedDownloadThroughput"];
              }

              else {
                v159 = off_189BC5AA8[(v250 - 1)];
              }
              [v8 setObject:v159 forKeyedSubscript:@"privacyStance"];
              v198 = v7;
              else {
                v160 = off_189BC5AD0[(v254 - 1)];
              }
              [v8 setObject:v160 forKeyedSubscript:@"privacyProxyClient"];
              [MEMORY[0x189607968] numberWithInt:v255 & 1];
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v161 forKeyedSubscript:@"isKnownTracker"];

              [MEMORY[0x189607968] numberWithInt:(v255 >> 1) & 1];
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v162 forKeyedSubscript:@"isThirdPartyWebContent"];

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 9) & 1];
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v163 forKeyedSubscript:@"isWebSearchContent"];

              id v200 = objc_alloc_init(MEMORY[0x189603FA8]);
              for (uint64_t i = 0LL; i != 70; i += 7LL)
              {
                v165 = &v208[i];
                if (*(_DWORD *)&v257[i * 8] == -1) {
                  break;
                }
                id v166 = objc_alloc_init(MEMORY[0x189603FC8]);
                [MEMORY[0x189607968] numberWithInt:*((unsigned int *)v165 + 440)];
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                [v166 setObject:v167 forKeyedSubscript:@"protocolIndex"];

                v168 = (void *)[objc_alloc(NSString) initWithCString:v165 + 214 encoding:134217984];
                [v166 setObject:v168 forKeyedSubscript:@"protocolName"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v165[218]];
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                [v166 setObject:v169 forKeyedSubscript:@"handshakeMilliseconds"];

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v165[219]];
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                [v166 setObject:v170 forKeyedSubscript:@"handshakeRTTMilliseconds"];

                [v200 addObject:v166];
              }

              [v8 setObject:v200 forKeyedSubscript:@"protocolEstablishmentReports"];
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v171 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
              {
                [v8 objectForKeyedSubscript:@"protocolEstablishmentReports"];
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                int v269 = 136446466;
                v270 = "-[NWConnectionStatistics dictionaryReport]";
                __int16 v271 = 2112;
                id v272 = v172;
                _os_log_impl( &dword_181A5C000,  v171,  OS_LOG_TYPE_DEBUG,  "%{public}s Establishment reports: \n%@",  (uint8_t *)&v269,  0x16u);
              }

              id v173 = objc_alloc_init(MEMORY[0x189603FA8]);
              id v4 = v199;
              if (v258[0])
              {
                id v174 = objc_alloc_init(MEMORY[0x189603FC8]);
                v175 = (void *)[objc_alloc(NSString) initWithCString:v258 encoding:134217984];
                [v174 setObject:v175 forKeyedSubscript:@"proxyName"];

                [v173 addObject:v174];
                if (v259[0])
                {
                  id v176 = objc_alloc_init(MEMORY[0x189603FC8]);
                  v177 = (void *)[objc_alloc(NSString) initWithCString:v259 encoding:134217984];
                  [v176 setObject:v177 forKeyedSubscript:@"proxyName"];

                  [v173 addObject:v176];
                }
              }

              [v8 setObject:v173 forKeyedSubscript:@"proxyHops"];
              [v7 externallyVisibleConnectionUUID];
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              [v178 UUIDString];
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v179 forKeyedSubscript:@"connectionUUID"];

              [v7 externallyVisibleParentUUID];
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              [v180 UUIDString];
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v181 forKeyedSubscript:@"parentUUID"];

              id v182 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v204 = 0u;
              __int128 v205 = 0u;
              __int128 v206 = 0u;
              __int128 v207 = 0u;
              [v7 externallyVisibleActivityUUIDs];
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v184 = [v183 countByEnumeratingWithState:&v204 objects:v274 count:16];
              if (v184)
              {
                uint64_t v185 = v184;
                uint64_t v186 = *(void *)v205;
                do
                {
                  for (uint64_t j = 0LL; j != v185; ++j)
                  {
                    if (*(void *)v205 != v186) {
                      objc_enumerationMutation(v183);
                    }
                    [*(id *)(*((void *)&v204 + 1) + 8 * j) UUIDString];
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    [v182 addObject:v188];
                  }

                  uint64_t v185 = [v183 countByEnumeratingWithState:&v204 objects:v274 count:16];
                }

                while (v185);
              }

              [v8 setObject:v182 forKeyedSubscript:@"activities"];
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v189 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
              {
                [v8 objectForKeyedSubscript:@"activities"];
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                int v269 = 136446466;
                v270 = "-[NWConnectionStatistics dictionaryReport]";
                __int16 v271 = 2112;
                id v272 = v190;
                _os_log_impl( &dword_181A5C000,  v189,  OS_LOG_TYPE_DEBUG,  "%{public}s Activities array: \n%@",  (uint8_t *)&v269,  0x16u);
              }

              [MEMORY[0x189607968] numberWithUnsignedInt:(v256 >> 1) & 1];
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v191 forKeyedSubscript:@"quicExperimentEnabled"];

              [v198 layer2Report];
              v192 = (void *)objc_claimAutoreleasedReturnValue();

              if (v192)
              {
                [v198 layer2Report];
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v193 forKeyedSubscript:@"l2Report"];
              }

              [v198 deviceReport];
              v194 = (void *)objc_claimAutoreleasedReturnValue();

              if (v194)
              {
                [v198 deviceReport];
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 setObject:v195 forKeyedSubscript:@"deviceReport"];
              }

              [v198 setMetricType:2];
              objc_storeStrong(v199, v8);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v196 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
              {
                id v197 = *v199;
                int v269 = 136446466;
                v270 = "-[NWConnectionStatistics dictionaryReport]";
                __int16 v271 = 2114;
                id v272 = v197;
                _os_log_impl( &dword_181A5C000,  v196,  OS_LOG_TYPE_DEBUG,  "%{public}s Generated nw_connection report: %{public}@",  (uint8_t *)&v269,  0x16u);
              }

              uint64_t v34 = v200;
              goto LABEL_178;
            }

- (NWConnectionStatistics)initWithTCPReport:(netcore_stats_tcp_report *)a3 length:(unint64_t)a4 clientIdentifier:(id)a5 sourceIdentifier:(id)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  if (a4 != 3424)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    unsigned int v15 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
      __int16 v30 = 2048;
      uint64_t v31 = 3424LL;
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      _os_log_impl( &dword_181A5C000,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s failure to initialize statistics object from TCP report, expected size %zd actual size %zd",  buf,  0x20u);
    }

    goto LABEL_7;
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NWConnectionStatistics;
  unint64_t v12 = -[NWConnectionStatistics init](&v27, sel_init);
  if (!v12)
  {
    __nwlog_obj();
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)int buf = 136446210;
    uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
    id v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)int buf = 136446210;
        uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        uint64_t v21 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_181A5C000, v19, v20, v21, buf, 0xCu);
      }
    }

    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = v26;
        BOOL v23 = os_log_type_enabled(v19, v26);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)int buf = 136446466;
            uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
            __int16 v30 = 2082;
            uint64_t v31 = (uint64_t)backtrace_string;
            _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }

        if (!v23) {
          goto LABEL_23;
        }
        *(_DWORD *)int buf = 136446210;
        uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        uint64_t v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }

      __nwlog_obj();
      unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)int buf = 136446210;
        uint64_t v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        uint64_t v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }

- (NWConnectionStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NWConnectionStatistics;
  id v5 = -[NWConnectionStatistics init](&v22, sel_init);
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

    id v9 = v5;
    goto LABEL_6;
  }

  __nwlog_obj();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)int buf = 136446210;
  unint64_t v24 = "-[NWConnectionStatistics initWithJSONData:]";
  unint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)int buf = 136446210;
        unint64_t v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)int buf = 136446466;
          unint64_t v24 = "-[NWConnectionStatistics initWithJSONData:]";
          __int16 v25 = 2082;
          os_log_type_t v26 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v13,  v16,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }

      if (v17)
      {
        *(_DWORD *)int buf = 136446210;
        unint64_t v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)int buf = 136446210;
        unint64_t v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_181A5C000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSUUID)externallyVisibleConnectionUUID
{
  return self->_externallyVisibleConnectionUUID;
}

- (void)setExternallyVisibleConnectionUUID:(id)a3
{
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
}

- (void)setActivities:(id)a3
{
}

- (NSArray)externallyVisibleActivityUUIDs
{
  return self->_externallyVisibleActivityUUIDs;
}

- (void)setExternallyVisibleActivityUUIDs:(id)a3
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

- (netcore_stats_tcp_report)report
{
  return (netcore_stats_tcp_report *)memcpy(retstr, &self->_report, sizeof(netcore_stats_tcp_report));
}

- (void)setReport:(netcore_stats_tcp_report *)a3
{
}

- (void).cxx_destruct
{
}

+ (id)protocolToTransportProtocolString:(unsigned int)a3
{
  id v3 = @"NW_TRANSPORT_PROTOCOL_QUIC";
  id v4 = @"NW_TRANSPORT_PROTOCOL_UNKNOWN";
  if (a3 == 17) {
    id v4 = @"NW_TRANSPORT_PROTOCOL_UDP";
  }
  if (a3 != 253) {
    id v3 = v4;
  }
  if (a3 == 6) {
    return @"NW_TRANSPORT_PROTOCOL_TCP";
  }
  else {
    return (id)v3;
  }
}

@end