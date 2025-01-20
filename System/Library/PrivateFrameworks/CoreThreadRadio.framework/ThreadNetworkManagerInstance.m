@interface ThreadNetworkManagerInstance
- (BOOL)alreadyOnTheSameNetwork:(id)a3;
- (BOOL)areTwoNetworksSame:(id)a3 nwname:(id)a4 creds_xpan:(id)a5 xpan:(id)a6;
- (BOOL)checkAndUpdateNetworkParamsFromMdnsScan:(id)a3 borderAgentID:(id)a4 leaderBorderAgentID:(id)a5 isNwFound:(BOOL *)a6 numAppleBRs:(int *)a7 numThirdPartyBRs:(int *)a8 isLeaderAppleDevice:(BOOL *)a9 numThreadNwsFound:(int *)a10 shouldRunPeriodicTdm:(BOOL *)a11;
- (BOOL)checkIfMdnsIsPublishedForBAID;
- (BOOL)checkIfNetworkIsFoundInMDNSScan:(id)a3 borderAgentID:(id)a4;
- (BOOL)clearThreadCredentials;
- (BOOL)commissioningCore:(id)a3 PSKd:(id)a4 server:(id)a5 index:(int)a6;
- (BOOL)isCurrentNetworkSameAsOneToStart:(id)a3;
- (BOOL)isNetworkSame:(Ctr_attachToNetwork *)a3 nwname:(void *)a4 xpan:(void *)a5;
- (BOOL)isPeriodicCaCollectionMeshcopRunning;
- (BOOL)lastIsLeaderThirdParty;
- (BOOL)tnm_internalInstall;
- (BOOL)updateMeshcopRelatedParams:(BOOL *)a3 numAppleBRs:(int *)a4 numThirdPartyBRs:(int *)a5 isLeaderAppleDevice:(BOOL *)a6 numThreadNwsFound:(int *)a7 shouldRunPeriodicTdm:(BOOL *)a8;
- (BOOL)updatePreferredNetworkForDatasetChange;
- (BOOL)validateDataSetTLVs:(id)a3;
- (BOOL)validateDataSetTLVs:(id)a3 creds:(id *)a4;
- (BOOL)waitForSync;
- (CtrInternalClient)CtrInternalClientPtr;
- (NSString)deviceName;
- (NSString)hwAddr;
- (OS_dispatch_queue)checkPreferredThreadNetworkTimerQueue;
- (OS_dispatch_queue)fQueue;
- (OS_dispatch_queue)periodicStatsQueue;
- (OS_dispatch_queue)tnmNodeTypeChangeQueue;
- (OS_dispatch_queue)tnmWedStatusChangeQueue;
- (OS_dispatch_queue)tnm_scan_queue;
- (OS_dispatch_source)checkPreferredThreadNetworkTimer;
- (OS_dispatch_source)tnm_nw_topology_fetch_timer;
- (Result)getNCPNetworkInfo:(Result *__return_ptr)retstr;
- (Result)getPskc:(Result *__return_ptr)retstr pskc_str:;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:uuid:;
- (Result)updateKeychainWithThreadActiveDataSet;
- (THThreadNetworkCredentialsActiveDataSetRecord)lastKnownJoinedNetworkRecord;
- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore;
- (ThreadNetworkfinder)BAFinder;
- (basic_string<char,)getNCPPropertyAsString:(std::allocator<char>> *__return_ptr)retstr;
- (dict)threadNetworkManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (id)dataFromHexString:(id)a3;
- (id)getCurrentBorderAgent;
- (id)getCurrentCredentialsDataSet;
- (id)getCurrentNetworkCredentials;
- (id)getCurrentNetworkCredentialsActiveDataSetRecord;
- (id)getCurrentNetworkNameAndXpanid;
- (id)getHardwareAddress;
- (id)getNCPPreferredNetworkInDict:(id)a3;
- (id)getNCPProperties;
- (id)getNCPPropertyInDict:(const char *)a3;
- (id)getNCPStatusInDict;
- (id)getPreferredNetwork;
- (id)getPreferredNetworkWithNoScan;
- (id)getRCPProperties;
- (id)init:(id)a3 statsQueue:(id)a4;
- (int)attachToNetwork:(dict)a3 output:(dict *)a4;
- (int)attachWithAllCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)checkPreferredAndJoin:(dict *)a3;
- (int)commission:(dict *)a3;
- (int)commissionOrFormNetwork:(dict)a3 is_attaching:(BOOL)a4 cfg_attach:(Ctr_attachToNetwork *)a5 output:(dict *)a6;
- (int)commissionToSpecifNetwork:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)deleteCredentialsForThisNetwork:(id)a3;
- (int)formNetworkWithAOD:(const char *)a3 record:(id)a4 output:(dict *)a5;
- (int)formNetworkWithCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)formNewNetwork:(dict)a3;
- (int)getMeCredentialsForThisNetwork:(id)a3 credentialsRecord_t:(id *)a4;
- (int)getMePassPhraseForThisNetwork:(id)a3 passPhrase:(id *)a4;
- (int)howToGetOnTheNetwork:(id)a3;
- (int)howToStartThreadNetwork:(const char *)a3 credentialsRecord_t:(id *)a4;
- (int)initializeKeyChainStore;
- (int)joinerAttach:(const char *)a3 output:(dict *)a4;
- (int)lastKnownNCPState;
- (int)lastKnownNodeType;
- (int)lastKnownValidNodeType;
- (int)prevKnownNCPState;
- (int)retrieveActiveDataSetRecordForUniqueId:(const char *)a3 record:(id *)a4;
- (int)retrieveCredentialsForUniqueId:(const char *)a3 credentialsRecord_t:(id *)a4;
- (int)setChannel:(dict)a3;
- (int)setChannelUsingChannelManger:(dict)a3;
- (int)setLogTimestampBase;
- (int)threadLeave;
- (int)threadStart:(const char *)a3 output:(dict *)a4;
- (int)updatePrimaryResident:(const char *)a3 isPrimaryResident:(BOOL)a4 isPrimaryResidentThreadCapable:(BOOL)a5;
- (unint64_t)getCountOfAvailableNetworksForCommissioning;
- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3;
- (unsigned)lastHostConfiguredChannel;
- (unsigned)lastUpdatedNCPChannel;
- (void)appendValMapToDict:(id)a3 value:(any)a4;
- (void)captureNCPStateInformation:(id *)a3;
- (void)checkAndResetFrameCounterDuplicates;
- (void)checkAndResumeNW;
- (void)checkMeshcopMdns;
- (void)checkPreferredThreadNetworkTimerHandler;
- (void)configureAndPostPeriodStats;
- (void)configureRecoveryTimer;
- (void)createDriverInterface:(id)a3;
- (void)deleteCurrentNetwork:(id)a3;
- (void)fillupThreadCredentialsToSelfHealThreadNetwork:(id)a3 store:(id)a4;
- (void)getAllMacMetrics;
- (void)getAllTrelMetrics;
- (void)getCoexMetrics:(id)a3 coexDict:(id)a4;
- (void)getDaemonAndVendorVersions;
- (void)getEngagementMetrics;
- (void)getIPMLEMetrics:(id)a3;
- (void)getNCPChannel;
- (void)getNCPState:(BOOL)a3;
- (void)getNetworkRadioMetrics;
- (void)getPowerMetrics;
- (void)getTopologyMetrics;
- (void)initCheckPreferredTimer;
- (void)initSyslogDumpInfo;
- (void)resetCoexMetrics;
- (void)resetEngagementMetrics;
- (void)resetIPMLEMetrics;
- (void)resetMacMetrics;
- (void)resetNetworkRadioMetrics;
- (void)resetPowerMetrics;
- (void)resetTopologyMetrics;
- (void)resetTrelLinkMetrics;
- (void)resetTrelNeighborMetrics;
- (void)resumeNetwork;
- (void)retrieveAndPostThirdPartyInfo;
- (void)saveLastKnownJoinedNetwork:(const char *)a3 datasetRecord:(id)a4;
- (void)sendThirdPartyMetricsInfo:(unsigned int)a3 prefNws:(unsigned int)a4 prefNwsByApple:(unsigned int)a5;
- (void)setBAFinder:(id)a3;
- (void)setCheckPreferredThreadNetworkTimer:(id)a3;
- (void)setCheckPreferredThreadNetworkTimerQueue:(id)a3;
- (void)setCtrInternalClientPtr:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFQueue:(id)a3;
- (void)setHwAddr:(id)a3;
- (void)setIsPeriodicCaCollectionMeshcopRunning:(BOOL)a3;
- (void)setKeyChainStore:(id)a3;
- (void)setLastHostConfiguredChannel:(unsigned __int8)a3;
- (void)setLastIsLeaderThirdParty:(BOOL)a3;
- (void)setLastKnownJoinedNetworkRecord:(id)a3;
- (void)setLastKnownNCPState:(int)a3;
- (void)setLastKnownNodeType:(int)a3;
- (void)setLastKnownValidNodeType:(int)a3;
- (void)setLastUpdatedNCPChannel:(unsigned __int8)a3;
- (void)setPeriodicStatsQueue:(id)a3;
- (void)setPrevKnownNCPState:(int)a3;
- (void)setTnmNodeTypeChangeQueue:(id)a3;
- (void)setTnmWedStatusChangeQueue:(id)a3;
- (void)setTnm_nw_topology_fetch_timer:(id)a3;
- (void)setTnm_scan_queue:(id)a3;
- (void)setWaitForSync:(BOOL)a3;
- (void)startNetworkTopologyBuilder;
- (void)triggerScan;
- (void)updateInternalDBForCommonDimensions:(id)a3 coexCntrsDict:(id)a4 coexDict:(id)a5;
- (void)updateInternalDBForTriggerBasedMetrics:(dict *)a3 isTriggerBased:(BOOL)a4 triggerType:(int)a5 triggerId:(int)a6;
- (void)upgradeCredentials;
@end

@implementation ThreadNetworkManagerInstance

- (id)getRCPProperties
{
  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
  -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "NCP:State");
  if (v39 >= 0) {
    v5 = v38;
  }
  else {
    v5 = (void **)v38[0];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"NCP:State");

  if (-[ThreadNetworkManagerInstance lastKnownNCPState](self, "lastKnownNCPState") == 8)
  {
    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:Health:Metrics");
    sub_100014D08((uint64_t)v38, (__int128 *)__p);
    if (v41 < 0) {
      operator delete(__p[0]);
    }
    if (v39 >= 0) {
      v7 = v38;
    }
    else {
      v7 = (void **)v38[0];
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  @"Thread:Health:Metrics");

    v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v38;
      if (v39 < 0) {
        v11 = (void **)v38[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Thread:Health:Metrics=%s", (uint8_t *)__p, 0xCu);
    }

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Network:Key");
    sub_100014D08((uint64_t)v38, (__int128 *)__p);
    if (v41 < 0) {
      operator delete(__p[0]);
    }
    if (v39 >= 0) {
      v12 = v38;
    }
    else {
      v12 = (void **)v38[0];
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, @"Network:Key");

    v14 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v38;
      if (v39 < 0) {
        v16 = (void **)v38[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Network::Key=%s", (uint8_t *)__p, 0xCu);
    }

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Network:KeyIndex");
    sub_100014D08((uint64_t)v38, (__int128 *)__p);
    if (v41 < 0) {
      operator delete(__p[0]);
    }
    if (v39 >= 0) {
      v17 = v38;
    }
    else {
      v17 = (void **)v38[0];
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v18,  @"Network:KeyIndex");

    v19 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = v38;
      if (v39 < 0) {
        v21 = (void **)v38[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Network::KeyIndex=%s", (uint8_t *)__p, 0xCu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:Services"));
    if (v22) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v22, @"Thread:Services");
    }
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPPropertyInDict:](self, "getNCPPropertyInDict:", "Thread:OffMeshRoutes"));

    v24 = (void *)v23;
    if (v23) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v23, @"Thread:OffMeshRoutes");
    }
    uint64_t v25 = objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:OnMeshPrefixes"));

    v26 = (void *)v25;
    if (v25) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v25, @"Thread:OnMeshPrefixes");
    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "vendor:ncp:state:dump"));

    v28 = (void *)v27;
    if (v27) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v27, @"vendor:ncp:state:dump");
    }
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPPropertyInDict:](self, "getNCPPropertyInDict:", "Thread:RouterTable"));

    v30 = (void *)v29;
    if (v29) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v29, @"Thread:RouterTable");
    }
    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPPropertyInDict:](self, "getNCPPropertyInDict:", "Thread:EidCache"));

    v32 = (void *)v31;
    if (v31) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v31, @"Thread:EidCache");
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:TrelPeers"));

    if (v33) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v33, @"Thread:TrelPeers");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:MessageBufferStats"));

    if (v34) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v34, @"Thread:MessageBufferStats");
    }
  }

  else
  {
    v35 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1001C3BF8(v36);
    }

    v34 = 0LL;
  }

  if (v39 < 0) {
    operator delete(v38[0]);
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)getNCPStatusInDict
{
  uint64_t v17 = 0LL;
  sub_10000AC00(__p, "Command Error");
  int v14 = 3;
  *(_OWORD *)v15 = *(_OWORD *)__p;
  uint64_t v16 = v19;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance CtrInternalClientPtr](self, "CtrInternalClientPtr"));
  v4 = v3;
  if (v3)
  {
    [v3 getNCPStatus:&v17];
  }

  else
  {
    *(_OWORD *)__p = 0u;
    __int128 v19 = 0u;
  }

  sub_1000E4898(&v14, (uint64_t)__p);
  if (SHIBYTE(v19) < 0) {
    operator delete(__p[1]);
  }

  if (v14)
  {
    v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPStatusInDict]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s : Failed to get the NCP status",  (uint8_t *)__p,  0xCu);
    }

    v7 = 0LL;
  }

  else
  {
    v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPStatusInDict]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : got the NCP status, now go for decoding",  (uint8_t *)__p,  0xCu);
    }

    uint64_t v10 = v17;
    if (v17) {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 24LL))(v17);
    }
    uint64_t v13 = v10;
    sub_10000B470(&v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8LL))(v13);
    }
  }

  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  return v7;
}

- (id)getNCPPropertyInDict:(const char *)a3
{
  uint64_t v18 = 0LL;
  sub_10000AC00(buf, "Command Error");
  int v15 = 3;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)buf;
  uint64_t v17 = *(void *)&buf[16];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance CtrInternalClientPtr](self, "CtrInternalClientPtr"));
  sub_10000AC00(__p, (char *)a3);
  if (v5) {
    [v5 getProperty:__p output:&v18];
  }
  else {
    memset(buf, 0, 32);
  }
  sub_1000E4898(&v15, (uint64_t)buf);
  if (v14 < 0) {
    operator delete(__p[0]);
  }

  if (v15)
  {
    v6 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPPropertyInDict:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s : Failed to get the NCP Property %s",  buf,  0x16u);
    }

    v8 = 0LL;
  }

  else
  {
    uint64_t v9 = v18;
    if (v18) {
      uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 24LL))(v18);
    }
    uint64_t v12 = v9;
    sub_10000B470(&v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
    }
  }

  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
  }
  return v8;
}

- (basic_string<char,)getNCPPropertyAsString:(std::allocator<char>> *__return_ptr)retstr
{
  v3 = v2;
  v4 = v1;
  int v15 = 0LL;
  sub_10000AC00(__p, "Command Error");
  int v12 = 3;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)__p;
  char v14 = __p[2];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 CtrInternalClientPtr]);
  sub_10000AC00(v10, v3);
  if (v6) {
    [v6 getProperty:v10 output:&v15];
  }
  else {
    memset(__p, 0, 32);
  }
  sub_1000E4898(&v12, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }

  if (v12)
  {
    v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPPropertyAsString:]";
      WORD2(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 6) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s : Failed to get the NCP Property %s",  (uint8_t *)__p,  0x16u);
    }

    sub_10000AC00(retstr, "");
  }

  else
  {
    sub_100147B4C((uint64_t *)&v15, (std::string *)retstr);
  }

  if (SHIBYTE(v14) < 0) {
    operator delete(v13[0]);
  }
  result = v15;
  if (v15) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)(*((uint64_t (**)(basic_string<char, std::char_traits<char>, std::allocator<char>> *))v15->var0.var0.var0.var1.var0
  }
                                                                                + 1))(v15);
  return result;
}

- (id)getNCPProperties
{
  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "NCP:State");
  if (v60 >= 0) {
    v5 = v59;
  }
  else {
    v5 = (void **)v59[0];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"NCP:State");

  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
  if (-[ThreadNetworkManagerInstance lastKnownNCPState](self, "lastKnownNCPState") == 8)
  {
    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:Leader:Address");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v7 = v59;
    }
    else {
      v7 = (void **)v59[0];
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  @"Thread:Leader:Address");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:Leader:RouterID");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      uint64_t v9 = v59;
    }
    else {
      uint64_t v9 = (void **)v59[0];
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  @"Thread:Leader:RouterID");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:Leader:Weight");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      char v11 = v59;
    }
    else {
      char v11 = (void **)v59[0];
    }
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v12,  @"Thread:Leader:Weight");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:]( self,  "getNCPPropertyAsString:",  "Thread:Leader:LocalWeight");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      uint64_t v13 = v59;
    }
    else {
      uint64_t v13 = (void **)v59[0];
    }
    char v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  @"Thread:Leader:LocalWeight");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "IPv6:LinkLocalAddress");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      int v15 = v59;
    }
    else {
      int v15 = (void **)v59[0];
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v16,  @"IPv6:LinkLocalAddress");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "IPv6:MeshLocalAddress");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      uint64_t v17 = v59;
    }
    else {
      uint64_t v17 = (void **)v59[0];
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v18,  @"IPv6:MeshLocalAddress");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "IPv6:MeshLocalPrefix");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      __int128 v19 = v59;
    }
    else {
      __int128 v19 = (void **)v59[0];
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v20,  @"IPv6:MeshLocalPrefix");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:RLOC16");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v21 = v59;
    }
    else {
      v21 = (void **)v59[0];
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, @"Thread:RLOC16");

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "IPv6:AllAddresses"));
    if (v23) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v23, @"IPv6:AllAddresses");
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "IPv6:MulticastAddresses"));

    if (v24) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v24, @"IPv6:MulticastAddresses");
    }
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:ChildTable:AsValMap"));

    if (v25) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v25, @"Thread:ChildTable:AsValMap");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:RouterTable:AsValMap"));

    if (v26) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v26, @"Thread:RouterTable:AsValMap");
    }
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:NeighborTable:AsValMap"));

    if (v27) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v27, @"Thread:NeighborTable:AsValMap");
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPPropertyInDict:](self, "getNCPPropertyInDict:", "Stat:Long"));

    if (v28) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v28, @"Stat:Long");
    }
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "OpenThread:MsgBufferCounters"));

    if (v29) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v29, @"OpenThread:MsgBufferCounters");
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:Services"));

    if (v30) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v30, @"Thread:Services");
    }
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPPropertyInDict:](self, "getNCPPropertyInDict:", "IPv6:Routes"));

    if (v31) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v31, @"IPv6:Routes");
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "NCP:Counter:AllMac:AsValMap"));

    if (v32) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v32, @"NCP:Counter:AllMac:AsValMap");
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "NCP:Counter:AllIPv6:AsValMap"));

    if (v33) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v33, @"NCP:Counter:AllIPv6:AsValMap");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "vendor:coex:counters:asvalmap"));

    if (v34) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v34, @"vendor:coex:counters:asvalmap");
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "vendor:radio:counters:asvalmap"));

    if (v35) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v35, @"vendor:radio:counters:asvalmap");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "NCP:Counter:Thread:Mle:AsValMap"));

    if (v36) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v36, @"NCP:Counter:Thread:Mle:AsValMap");
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:Leader:Services:AsValMap"));

    if (v37) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v37, @"Thread:Leader:Services:AsValMap");
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "vendor:ncp:state:dump"));

    if (v38) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v38, @"vendor:ncp:state:dump");
    }
    -[ThreadNetworkManagerInstance getNCPPropertyAsString:]( self,  "getNCPPropertyAsString:",  "Thread:Leader:NetworkData");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      char v39 = v59;
    }
    else {
      char v39 = (void **)v59[0];
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v39));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v40,  @"Thread:Leader:NetworkData");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:]( self,  "getNCPPropertyAsString:",  "Thread:Leader:StableNetworkData");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      char v41 = v59;
    }
    else {
      char v41 = (void **)v59[0];
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v41));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v42,  @"Thread:Leader:StableNetworkData");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:StableNetworkData");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v43 = v59;
    }
    else {
      v43 = (void **)v59[0];
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v43));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v44,  @"Thread:StableNetworkData");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "Thread:NetworkData");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v45 = v59;
    }
    else {
      v45 = (void **)v59[0];
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v45));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v46,  @"Thread:NetworkData");

    v47 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:OffMeshRoutes"));
    if (v47) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v47, @"Thread:OffMeshRoutes");
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPropertyInDict:]( self,  "getNCPPropertyInDict:",  "Thread:OnMeshPrefixes"));

    if (v48) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v48, @"Thread:OnMeshPrefixes");
    }
    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "NCP:TXPower");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v49 = v59;
    }
    else {
      v49 = (void **)v59[0];
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v49));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v50, @"NCP:TXPower");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:]( self,  "getNCPPropertyAsString:",  "vendor:current:power:info");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v51 = v59;
    }
    else {
      v51 = (void **)v59[0];
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v51));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v52,  @"vendor:current:power:info");

    -[ThreadNetworkManagerInstance getNCPPropertyAsString:](self, "getNCPPropertyAsString:", "TPC:Mode");
    sub_100014D08((uint64_t)v59, (__int128 *)__p);
    if (v58 < 0) {
      operator delete(__p[0]);
    }
    if (v60 >= 0) {
      v53 = v59;
    }
    else {
      v53 = (void **)v59[0];
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v53));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v54, @"TPC:Mode");
  }

  v55 = v4;
  if (v60 < 0) {
    operator delete(v59[0]);
  }

  objc_autoreleasePoolPop(v3);
  return v55;
}

- (id)getNCPPreferredNetworkInDict:(id)a3
{
  id v3 = a3;
  context = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v8 = objc_claimAutoreleasedReturnValue([v7 extendedPANID]);
    uint64_t v9 = (ctu *)[v8 bytes];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 extendedPANID]);
    id v12 = [v11 length];
    ctu::hex(v123, v9, v12, v13);
  }

  else
  {
    sub_10000AC00(v123, "(unknown)");
  }

  char v14 = (void *)objc_claimAutoreleasedReturnValue([v3 borderAgent]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 discriminatorId]);
  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 borderAgent]);
    id v17 = objc_claimAutoreleasedReturnValue([v16 discriminatorId]);
    uint64_t v18 = (ctu *)[v17 bytes];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 borderAgent]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 discriminatorId]);
    id v21 = [v20 length];
    ctu::hex(v121, v18, v21, v22);
  }

  else
  {
    sub_10000AC00(v121, "(unknown)");
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSet]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dataSetArray]);
  if (v24)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSet]);
    id v26 = objc_claimAutoreleasedReturnValue([v25 dataSetArray]);
    uint64_t v27 = (ctu *)[v26 bytes];
    v28 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSet]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dataSetArray]);
    id v30 = [v29 length];
    ctu::hex(v119, v27, v30, v31);
  }

  else
  {
    sub_10000AC00(v119, "(unknown)");
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  v33 = &AWDPostMetric_ptr;
  if (v32)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    id v35 = objc_claimAutoreleasedReturnValue([v34 UUIDString]);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s",  [v35 UTF8String],  context));

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v36, @"UUID");
  }

  else
  {
    v36 = 0LL;
  }

  v37 = v121;
  if (v122 < 0) {
    v37 = (void **)v121[0];
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v37));

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v38, @"borderAgentDiscriminatorID");
  char v39 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 networkName]);
  char v41 = v40;
  if (!v40) {
    v40 = @"(unknown)";
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s", -[__CFString UTF8String](v40, "UTF8String")));

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v42, @"networkName");
  v43 = v123;
  if (v124 < 0) {
    v43 = (void **)v123[0];
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v43));

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v44, @"xpanid");
  v45 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 PANID]);

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    id v48 = objc_claimAutoreleasedReturnValue([v47 PANID]);
    v49 = (ctu *)[v48 bytes];
    v50 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 PANID]);
    id v52 = [v51 length];
    ctu::hex(__p, v49, v52, v53);
    if (v118 >= 0) {
      v54 = __p;
    }
    else {
      v54 = (void **)__p[0];
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v54));

    v33 = &AWDPostMetric_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v55, @"panid");
  }

  else
  {
    v55 = v44;
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 masterKey]);

  if (v57)
  {
    char v58 = v33[138];
    v59 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    id v60 = objc_claimAutoreleasedReturnValue([v59 masterKey]);
    v61 = (ctu *)[v60 bytes];
    v62 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 masterKey]);
    id v64 = [v63 length];
    ctu::hex(__p, v61, v64, v65);
    if (v118 >= 0) {
      v66 = __p;
    }
    else {
      v66 = (void **)__p[0];
    }
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringWithFormat:", @"%{sensitive}s", v66));

    v33 = &AWDPostMetric_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v67, @"masterKey");
  }

  else
  {
    v67 = v55;
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v68 PSKc]);

  if (v69)
  {
    v70 = v33[138];
    v71 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    id v72 = objc_claimAutoreleasedReturnValue([v71 PSKc]);
    v73 = (ctu *)[v72 bytes];
    v74 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 PSKc]);
    id v76 = [v75 length];
    ctu::hex(__p, v73, v76, v77);
    if (v118 >= 0) {
      v78 = __p;
    }
    else {
      v78 = (void **)__p[0];
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "stringWithFormat:", @"%{sensitive}s", v78));

    v33 = &AWDPostMetric_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v79, @"PSKc");
  }

  else
  {
    v79 = v67;
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  v81 = (void *)objc_claimAutoreleasedReturnValue([v80 passPhrase]);

  if (v81)
  {
    v82 = v33[138];
    v83 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    id v84 = objc_claimAutoreleasedReturnValue([v83 passPhrase]);
    uint64_t v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "stringWithFormat:", @"%s", objc_msgSend(v84, "UTF8String")));

    v79 = (void *)v85;
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v85, @"passPhrase");
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  unsigned int v87 = [v86 channel];
  int v88 = kTHNetworkChannel_None;

  if (v87 == v88)
  {
    v89 = &AWDPostMetric_ptr;
  }

  else
  {
    v89 = &AWDPostMetric_ptr;
    v90 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    uint64_t v91 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  [v90 channel]));

    v79 = (void *)v91;
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v91, @"channel");
  }

  v92 = v119;
  if (v120 < 0) {
    v92 = (void **)v119[0];
  }
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89[138], "stringWithFormat:", @"%{sensitive}s", v92));

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v93, @"datasetCredentials");
  v94 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  v95 = (void *)objc_claimAutoreleasedReturnValue([v94 userInfo]);

  if (v95)
  {
    v96 = v89[138];
    v97 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
    id v98 = objc_claimAutoreleasedReturnValue([v97 userInfo]);
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "stringWithFormat:", @"%s", objc_msgSend(v98, "UTF8String")));

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v99, @"datasetUserInfo");
  }

  else
  {
    v99 = v93;
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue([v3 keychainAccessGroup]);

  if (v100)
  {
    v101 = v89[138];
    id v102 = objc_claimAutoreleasedReturnValue([v3 keychainAccessGroup]);
    uint64_t v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "stringWithFormat:", @"%s", objc_msgSend(v102, "UTF8String")));

    v99 = (void *)v103;
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v103, @"accessGroup");
  }

  v104 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);

  if (v104)
  {
    v105 = v89[138];
    v106 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);
    id v107 = objc_claimAutoreleasedReturnValue([v106 description]);
    uint64_t v108 = objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "stringWithFormat:", @"%s", objc_msgSend(v107, "UTF8String")));

    v99 = (void *)v108;
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v108, @"createdOn");
  }

  v109 = (void *)objc_claimAutoreleasedReturnValue([v3 lastModificationDate]);

  if (v109)
  {
    v110 = v89[138];
    v111 = (void *)objc_claimAutoreleasedReturnValue([v3 lastModificationDate]);
    id v112 = objc_claimAutoreleasedReturnValue([v111 description]);
    uint64_t v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "stringWithFormat:", @"%s", objc_msgSend(v112, "UTF8String")));

    v99 = (void *)v113;
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v113, @"lastModifiedOn");
  }

  v114 = v4;
  if (v120 < 0) {
    operator delete(v119[0]);
  }
  if (v122 < 0) {
    operator delete(v121[0]);
  }
  if (v124 < 0) {
    operator delete(v123[0]);
  }

  objc_autoreleasePoolPop(context);
  return v114;
}

- (void)captureNCPStateInformation:(id *)a3
{
  id v8 = *a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPStatusInDict](self, "getNCPStatusInDict"));
  if (v4) {
    [v8 setObject:v4 forKey:@"NCP Status"];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getPreferredNetwork](self, "getPreferredNetwork"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getNCPPreferredNetworkInDict:]( self,  "getNCPPreferredNetworkInDict:",  v5));
    if (v6) {
      [v8 setObject:v6 forKey:@"NCP PreferredNetwork"];
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getNCPProperties](self, "getNCPProperties"));
  if (v7) {
    [v8 setObject:v7 forKey:@"NCP Properties"];
  }
}

- (void)initSyslogDumpInfo
{
  id v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TNM: initSyslogDumpInfo : Starting", buf, 2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001C38D4;
  v7[3] = &unk_1002B5720;
  v7[4] = self;
  os_state_add_handler(v6, v7);
}

- (id)init:(id)a3 statsQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ThreadNetworkManagerInstance;
  uint64_t v9 = -[ThreadNetworkManagerInstance init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fQueue, a3);
    objc_storeStrong(p_isa + 14, a4);
    [p_isa createDriverInterface:v7];
  }

  return p_isa;
}

- (unint64_t)getCountOfAvailableNetworksForCommissioning
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  BAFinder = self->_BAFinder;
  if (!BAFinder)
  {
    v5 = -[ThreadNetworkfinder init](objc_opt_new(&OBJC_CLASS___ThreadNetworkfinder), "init");
    v6 = self->_BAFinder;
    self->_BAFinder = v5;

    BAFinder = self->_BAFinder;
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001C7BC8;
  v14[3] = &unk_1002B5848;
  objc_copyWeak(&v16, &location);
  id v7 = v3;
  int v15 = v7;
  -[ThreadNetworkfinder startScan:queue:timeInSec:](BAFinder, "startScan:queue:timeInSec:", v14, &_dispatch_main_q, 5LL);
  id v8 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v19 = "-[ThreadNetworkManagerInstance getCountOfAvailableNetworksForCommissioning]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : Finding networks to commission...", buf, 0xCu);
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v10 = -[ThreadNetworkfinder findNWs](self->_BAFinder, "findNWs");
  char v11 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v19 = "-[ThreadNetworkManagerInstance getCountOfAvailableNetworksForCommissioning]";
    __int16 v20 = 2048;
    unint64_t v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s : Found networks : %lu", buf, 0x16u);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v10;
}

- (void)createDriverInterface:(id)a3
{
  id v60 = a3;
  v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TNM creating DriverInterface", buf, 2u);
  }

  v6 = -[CtrInternalClient init:](objc_alloc(&OBJC_CLASS___CtrInternalClient), "init:", "TNM-Internal");
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  self->_CtrInternalClientPtr = v6;

  dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  uint64_t v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
  unint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMScan.Queue", v9);
  tnm_scan_queue = self->_tnm_scan_queue;
  self->_tnm_scan_queue = v10;

  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  unint64_t v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
  char v14 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMNodeTypeChange.Queue", v13);
  tnmNodeTypeChangeQueue = self->_tnmNodeTypeChangeQueue;
  self->_tnmNodeTypeChangeQueue = v14;

  dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  id v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMWedStatusChange.Queue", v17);
  tnmWedStatusChangeQueue = self->_tnmWedStatusChangeQueue;
  self->_tnmWedStatusChangeQueue = v18;

  __int16 v20 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Initializing srp_mdns_proxyd interface", buf, 2u);
  }

  srputil_srp_mdns_proxyd_interface_init();
  int v22 = sub_100110910("lastHostConfiguredChannel");
  if (v22) {
    unsigned __int8 v23 = v22;
  }
  else {
    unsigned __int8 v23 = 25;
  }
  self->_lastHostConfiguredChannel = v23;
  *(void *)&self->_prevKnownNCPState = 0LL;
  self->_lastIsLeaderThirdParty = 1;
  sub_100143BD8();
  objc_initWeak(&location, self);
  if (-[ThreadNetworkManagerInstance initializeKeyChainStore](self, "initializeKeyChainStore"))
  {
    v24 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1001EC5AC();
    }
  }

  v61 = objc_alloc_init(&OBJC_CLASS___ThreadNetworkManagerSelfHealHandler);
  id v26 = self->_CtrInternalClientPtr;
  sub_10000AC00(v93, "ActiveDataSetChanged");
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_1001C862C;
  v91[3] = &unk_1002B5898;
  objc_copyWeak(&v92, &location);
  id v27 = v60;
  id v90 = v27;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v26,  "setEventHandler:InternalClientEventBlock:dqueue:",  v93,  v91,  &v90);
  id v28 = v90;
  id v90 = 0LL;

  if (v94 < 0) {
    operator delete(v93[0]);
  }
  uint64_t v29 = self->_CtrInternalClientPtr;
  sub_10000AC00(v88, "NCP:State");
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_1001C8960;
  v86[3] = &unk_1002B5898;
  objc_copyWeak(&v87, &location);
  id v30 = v27;
  id v85 = v30;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v29,  "setEventHandler:InternalClientEventBlock:dqueue:",  v88,  v86,  &v85);
  id v31 = v85;
  id v85 = 0LL;

  if (v89 < 0) {
    operator delete(v88[0]);
  }
  v32 = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "Network:NodeType");
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_1001C8B64;
  v81[3] = &unk_1002B5898;
  objc_copyWeak(&v82, &location);
  v80 = self->_tnmNodeTypeChangeQueue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v32,  "setEventHandler:InternalClientEventBlock:dqueue:",  __p,  v81,  &v80);
  v33 = v80;
  v80 = 0LL;

  if (v84 < 0) {
    operator delete(__p[0]);
  }
  v34 = self->_CtrInternalClientPtr;
  sub_10000AC00(v78, "Beacon");
  unint64_t v77 = self->_tnm_scan_queue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v34,  "setEventHandler:InternalClientEventBlock:dqueue:",  v78,  &stru_1002B58B8,  &v77);
  id v35 = v77;
  unint64_t v77 = 0LL;

  if (v79 < 0) {
    operator delete(v78[0]);
  }
  v36 = self->_CtrInternalClientPtr;
  sub_10000AC00(v75, "NCP:Reset");
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_1001C8FA8;
  v73[3] = &unk_1002B5898;
  objc_copyWeak(&v74, &location);
  id v37 = v30;
  id v72 = v37;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v36,  "setEventHandler:InternalClientEventBlock:dqueue:",  v75,  v73,  &v72);
  id v38 = v72;
  id v72 = 0LL;

  if (v76 < 0) {
    operator delete(v75[0]);
  }
  char v39 = self->_CtrInternalClientPtr;
  sub_10000AC00(v70, "Thread:ChildTable:AddChild");
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1001C90E8;
  v68[3] = &unk_1002B5898;
  objc_copyWeak(&v69, &location);
  id v40 = v37;
  id v67 = v40;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v39,  "setEventHandler:InternalClientEventBlock:dqueue:",  v70,  v68,  &v67);
  id v41 = v67;
  id v67 = 0LL;

  if (v71 < 0) {
    operator delete(v70[0]);
  }
  v42 = self->_CtrInternalClientPtr;
  sub_10000AC00(v65, "Thread:ChildTable:RemoveChild");
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1001C9498;
  v63[3] = &unk_1002B5898;
  objc_copyWeak(&v64, &location);
  id v43 = v40;
  id v62 = v43;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v42,  "setEventHandler:InternalClientEventBlock:dqueue:",  v65,  v63,  &v62);
  id v44 = v62;
  id v62 = 0LL;

  if (v66 < 0) {
    operator delete(v65[0]);
  }
  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 1LL, &v92);
  -[ThreadNetworkManagerInstance getNCPChannel](self, "getNCPChannel");
  int v45 = isNetworkConnected();
  v46 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v97) = v45;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "WiFi Status is: %d", buf, 8u);
  }

  id v48 = (NSString *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getHardwareAddress](self, "getHardwareAddress"));
  hwAddr = self->_hwAddr;
  self->_hwAddr = v48;

  v50 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    id v52 = self->_hwAddr;
    *(_DWORD *)buf = 136315395;
    v97 = "-[ThreadNetworkManagerInstance createDriverInterface:]";
    __int16 v98 = 2117;
    v99 = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "%s : HW Address of this device is %{sensitive}@, \n",  buf,  0x16u);
  }

  unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  v54 = (NSString *)objc_claimAutoreleasedReturnValue([v53 name]);
  deviceName = self->_deviceName;
  self->_deviceName = v54;

  v56 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    char v58 = self->_deviceName;
    *(_DWORD *)buf = 136315394;
    v97 = "-[ThreadNetworkManagerInstance createDriverInterface:]";
    __int16 v98 = 2112;
    v99 = v58;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s : Current Device Name : %@", buf, 0x16u);
  }

  -[ThreadNetworkManagerInstance setLogTimestampBase](self, "setLogTimestampBase");
  -[ThreadNetworkManagerInstance startNetworkTopologyBuilder](self, "startNetworkTopologyBuilder");
  -[ThreadNetworkManagerInstance initSyslogDumpInfo](self, "initSyslogDumpInfo");
  *(_WORD *)&self->_waitForSync = 0;
  -[ThreadNetworkManagerInstance initCheckPreferredTimer](self, "initCheckPreferredTimer");
  -[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer](v61, "initSelfHealThreadNetworkTimer");
  -[ThreadNetworkManagerInstance configureAndPostPeriodStats](self, "configureAndPostPeriodStats");
  -[ThreadNetworkManagerInstance configureRecoveryTimer](self, "configureRecoveryTimer");
  -[ThreadNetworkManagerInstance getDaemonAndVendorVersions](self, "getDaemonAndVendorVersions");
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&v87);
  objc_destroyWeak(v59);

  objc_destroyWeak(&location);
}

- (dict)threadNetworkManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v5 = v3;
  dispatch_queue_attr_t v8 = v4;
  uint64_t v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = var0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Message received from client %s",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v113 = 0x3812000000LL;
  v114 = sub_1001CA2E8;
  v115 = sub_1001CA324;
  uint64_t v116 = 256LL;
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v13 = v12;
  if (!v12) {
    xpc_object_t v13 = xpc_null_create();
  }

  id v14 = v13;
  int v15 = v14;
  id v117 = v14;
  if (!v14 || xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v16 = xpc_null_create();
    id v17 = v117;
    id v117 = v16;
  }

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  dispatch_time_t v19 = dispatch_time(0LL, 5000000000LL);
  uint64_t v109 = 0LL;
  id v110 = 0LL;
  __int16 v111 = 256;
  id v20 = sub_1000EA704(v5);
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  string = (char *)xpc_dictionary_get_string(v21, "method");
  sub_10000AC00(&v105, string);

  id v23 = sub_1000EA704(v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = (char *)xpc_dictionary_get_string(v24, "property_name");
  sub_10000AC00(__p, v25);

  if (!std::string::compare(&v105, "setChannel"))
  {
    sub_1001BF91C(&v102, v5);
    signed int v28 = -[ThreadNetworkManagerInstance setChannelUsingChannelManger:](self, "setChannelUsingChannelManger:", &v102);
    uint64_t v29 = v102;
    id v102 = 0LL;

    goto LABEL_42;
  }

  if (!std::string::compare(&v105, "attachToNetwork"))
  {
    sub_1001BF91C(&v101, v5);
    signed int v28 = -[ThreadNetworkManagerInstance attachToNetwork:output:]( self,  "attachToNetwork:output:",  &v101,  *((void *)&buf + 1) + 48LL);
    id v30 = v101;
    v101 = 0LL;

    goto LABEL_42;
  }

  if (!std::string::compare(&v105, "commissionOrFormNetwork"))
  {
    sub_1001BF91C(&v100, v5);
    signed int v28 = -[ThreadNetworkManagerInstance commissionOrFormNetwork:is_attaching:cfg_attach:output:]( self,  "commissionOrFormNetwork:is_attaching:cfg_attach:output:",  &v100,  0LL,  &v109,  *((void *)&buf + 1) + 48LL);
    id v31 = v100;
    v100 = 0LL;

    goto LABEL_42;
  }

  if (std::string::compare(&v105, "threadStart"))
  {
    if (!std::string::compare(&v105, "threadLeave"))
    {
      id v44 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = &v105;
        if ((v105.__r_.__value_.__s.__size_ & 0x80u) != 0) {
          v46 = (std::string *)v105.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v106 = 136315394;
        *(void *)&v106[4] = a3;
        *(_WORD *)&v106[12] = 2080;
        *(void *)&v106[14] = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "Got command from \"%s\" for method \"%s\"",  v106,  0x16u);
      }

      unsigned int v47 = -[ThreadNetworkManagerInstance threadLeave](self, "threadLeave");
    }

    else
    {
      if (!std::string::compare(&v105, "provideEmac")
        || !std::string::compare(&v105, "startPairing")
        || !std::string::compare(&v105, "stopPairing")
        || !std::string::compare(&v105, "startFWUpdate")
        || !std::string::compare(&v105, "stopFWUpdate"))
      {
        signed int v28 = 0;
        goto LABEL_42;
      }

      if (std::string::compare(&v105, "updatePrimaryResident"))
      {
        if (!std::string::compare(&v105, "getTriggerBasedStats"))
        {
          id v74 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
          v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            char v76 = &v105;
            if ((v105.__r_.__value_.__s.__size_ & 0x80u) != 0) {
              char v76 = (std::string *)v105.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)v106 = 136315394;
            *(void *)&v106[4] = a3;
            *(_WORD *)&v106[12] = 2080;
            *(void *)&v106[14] = v76;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "Got command from \"%s\" for method \"%s\"",  v106,  0x16u);
          }

          *(void *)v106 = 0LL;
          *(void *)&v106[8] = v106;
          *(void *)&v106[16] = 0x2020000000LL;
          id v77 = sub_1000EA704(v5);
          v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
          int uint64 = xpc_dictionary_get_uint64(v78, "triggerType");

          *(_DWORD *)id v107 = uint64;
          v98[0] = 0LL;
          v98[1] = v98;
          v98[2] = 0x2020000000LL;
          id v80 = sub_1000EA704(v5);
          v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
          LODWORD(v78) = xpc_dictionary_get_uint64(v81, "triggerId");

          int v99 = (int)v78;
          periodicStatsQueue = (dispatch_queue_s *)self->_periodicStatsQueue;
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472LL;
          v93[2] = sub_1001CA350;
          v93[3] = &unk_1002B58E0;
          v93[4] = self;
          p___int128 buf = &buf;
          v96 = v106;
          v97 = v98;
          v83 = v18;
          char v94 = v83;
          dispatch_async(periodicStatsQueue, v93);
          if (dispatch_semaphore_wait(v83, v19))
          {
            char v84 = sub_1000160F4("com.apple.wpantund.tnm", "default");
            id v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
              sub_1001EC678(v85, v86, v87, v88, v89, v90, v91, v92);
            }

            signed int v28 = 1;
          }

          else
          {
            signed int v28 = 0;
          }

          _Block_object_dispose(v98, 8);
          _Block_object_dispose(v106, 8);
        }

        else
        {
          id v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_1001EC6E8();
          }

          signed int v28 = 1;
        }

        goto LABEL_42;
      }

      id v60 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        id v62 = &v105;
        if ((v105.__r_.__value_.__s.__size_ & 0x80u) != 0) {
          id v62 = (std::string *)v105.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v106 = 136315394;
        *(void *)&v106[4] = a3;
        *(_WORD *)&v106[12] = 2080;
        *(void *)&v106[14] = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "Got command from \"%s\" for method \"%s\"",  v106,  0x16u);
      }

      id v63 = sub_1000EA704(v5);
      id v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      unint64_t v65 = xpc_dictionary_get_string(v64, "primaryResidentInfo");

      id v66 = sub_1000EA704(v5);
      id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      BOOL v68 = xpc_dictionary_get_BOOL(v67, "isPrimaryResident");

      id v69 = sub_1000EA704(v5);
      v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
      BOOL v71 = xpc_dictionary_get_BOOL(v70, "isPrimaryResidentThreadCapable");

      id v72 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v106 = 136315906;
        *(void *)&v106[4] = "-[ThreadNetworkManagerInstance threadNetworkManagerInstance_MsgHandler:message:]";
        *(_WORD *)&v106[12] = 2080;
        *(void *)&v106[14] = v65;
        *(_WORD *)&v106[22] = 1024;
        *(_DWORD *)id v107 = v68;
        *(_WORD *)&v107[4] = 1024;
        *(_DWORD *)&v107[6] = v71;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "%s: Calling updatePrimaryResident, primaryInfo=%s, isPrimaryResident=%d, isPrimaryResidentThreadCapable=%d",  v106,  0x22u);
      }

      unsigned int v47 = -[ThreadNetworkManagerInstance updatePrimaryResident:isPrimaryResident:isPrimaryResidentThreadCapable:]( self,  "updatePrimaryResident:isPrimaryResident:isPrimaryResidentThreadCapable:",  v65,  v68,  v71);
    }

    signed int v28 = v47;
    goto LABEL_42;
  }

  id v32 = sub_1000EA704(v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = xpc_dictionary_get_string(v33, "uniqueNetworkId");

  id v35 = sub_1000EA704(v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  self->_BOOL waitForSync = xpc_dictionary_get_BOOL(v36, "wait_for_sync");

  id v37 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    BOOL waitForSync = self->_waitForSync;
    *(_DWORD *)v106 = 136315650;
    *(void *)&v106[4] = "-[ThreadNetworkManagerInstance threadNetworkManagerInstance_MsgHandler:message:]";
    *(_WORD *)&v106[12] = 2080;
    *(void *)&v106[14] = v34;
    *(_WORD *)&v106[22] = 1024;
    *(_DWORD *)id v107 = waitForSync;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s: Calling threadStart, Got the Unique Network ID : %s, waitForSync flag : %d",  v106,  0x1Cu);
  }

  signed int v28 = -[ThreadNetworkManagerInstance threadStart:output:]( self,  "threadStart:output:",  v34,  *((void *)&buf + 1) + 48LL);
  self->_BOOL waitForSync = 0;
  uint64_t v40 = sub_10000B370();
  __darwin_time_t v41 = sub_10000B428();
  gettimeofday((timeval *)&qword_1002D1A30, 0LL);
  v42 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v106 = 134218754;
    *(void *)&v106[4] = v40;
    *(_WORD *)&v106[12] = 2048;
    *(void *)&v106[14] = v41;
    *(_WORD *)&v106[22] = 2080;
    *(void *)id v107 = "-[ThreadNetworkManagerInstance threadNetworkManagerInstance_MsgHandler:message:]";
    *(_WORD *)&v107[8] = 1024;
    signed int v108 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[%llu, %llu] %s: threadStart finished with ret : %d",  v106,  0x26u);
  }

LABEL_42:
  id v48 = sub_1000EA704((id *)(*((void *)&buf + 1) + 48LL));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = v49;
  if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v51 = &v105;
  }
  else {
    v51 = (std::string *)v105.__r_.__value_.__r.__words[0];
  }
  xpc_dictionary_set_string(v49, "method", (const char *)v51);

  id v52 = sub_1000EA704((id *)(*((void *)&buf + 1) + 48LL));
  unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v54 = v53;
  if (v104 >= 0) {
    v55 = __p;
  }
  else {
    v55 = (void **)__p[0];
  }
  xpc_dictionary_set_string(v53, "property_name", (const char *)v55);

  id v56 = sub_1000EA704((id *)(*((void *)&buf + 1) + 48LL));
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  xpc_dictionary_set_int64(v57, "ret", v28);

  sub_1001BF91C(v8, (id *)(*((void *)&buf + 1) + 48LL));
  if (v104 < 0) {
    operator delete(__p[0]);
  }

  _Block_object_dispose(&buf, 8);
  id v58 = v117;
  id v117 = 0LL;

  return v59;
}

- (void)appendValMapToDict:(id)a3 value:(any)a4
{
  id v5 = a3;
  sub_10000C008((uint64_t)a4.var0, &v12);
  v6 = v12;
  for (i = v12; i != v13; v6 = i)
  {
    id v7 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)sub_10012A480((uint64_t)(v6 + 56)));
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = i + 32;
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9, i));
    [v5 setObject:v8 forKey:v10];

    sub_10000B338((uint64_t)&i);
  }

  sub_10000D448((uint64_t)&v12);
}

- (void)updateInternalDBForCommonDimensions:(id)a3 coexCntrsDict:(id)a4 coexDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_10000AC00(buf, "Command error");
  int v74 = 0;
  __int128 v75 = *(_OWORD *)buf;
  uint64_t v76 = *(void *)&buf[16];
  uint64_t v72 = 0LL;
  id v73 = xpc_null_create();
  unsigned __int8 v71 = 0;
  uint64_t v70 = 0LL;
  unsigned __int8 v69 = 0;
  *(_DWORD *)&__val[1] = 0;
  __val[0] = 0;
  self->_isPeriodicCaCollectionMeshcopRunning = 1;
  if (-[ThreadNetworkManagerInstance updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]( self,  "updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:",  &v71,  (char *)&v70 + 4,  &v70,  &v69,  &__val[1],  __val))
  {
    int v11 = v69;
    self->_lastIsLeaderThirdParty = v69 ^ 1;
  }

  else
  {
    xpc_object_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    xpc_object_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001EC770();
    }

    int v11 = v69;
  }

  sub_1000D0030(v71, SHIDWORD(v70), v70, v11 != 0, *(int *)&__val[1]);
  self->_isPeriodicCaCollectionMeshcopRunning = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:Counter:AllIPv6:AsValMap");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v72);
  }
  else {
    memset(buf, 0, 32);
  }
  int v15 = *sub_1000E4898(&v74, (uint64_t)buf);
  if (v67 < 0)
  {
    operator delete(__p[0]);
    if (v15) {
      goto LABEL_22;
    }
  }

  else if (v15)
  {
    goto LABEL_22;
  }

  uint64_t v16 = v72;
  if (v72) {
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v72 + 24LL))(v72);
  }
  uint64_t v65 = v16;
  v17.var0 = (placeholder *)&v65;
  convert_ValMap_to_xpc_object(v17, "NCP:Counter:AllIPv6:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v18 = *(id *)buf;
  xpc_object_t v19 = xpc_null_create();

  id v20 = v73;
  id v73 = v18;

  if (v65) {
    (*(void (**)(uint64_t))(*(void *)v65 + 8LL))(v65);
  }
  unint64_t v21 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 962;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPCounterAllIPv6AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v73;
  *(void *)&buf[8] = "value";
  xpc_object_t v23 = sub_1000A9F60((uint64_t)buf);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  sub_1000C919C(v24, v8);

LABEL_22:
  uint64_t v64 = 0LL;
  uint64_t v25 = self->_CtrInternalClientPtr;
  sub_10000AC00(v62, "NCP:Counter:Thread:Mle:AsValMap");
  if (v25) {
    -[CtrInternalClient getProperty:output:](v25, "getProperty:output:", v62, &v64);
  }
  else {
    memset(buf, 0, 32);
  }
  int v26 = *sub_1000E4898(&v74, (uint64_t)buf);
  if (v63 < 0)
  {
    operator delete(v62[0]);
    if (v26) {
      goto LABEL_38;
    }
  }

  else if (v26)
  {
    goto LABEL_38;
  }

  uint64_t v27 = v64;
  if (v64) {
    uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v64 + 24LL))(v64);
  }
  uint64_t v61 = v27;
  v28.var0 = (placeholder *)&v61;
  convert_ValMap_to_xpc_object(v28, "NCP:Counter:Thread:Mle:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v29 = *(id *)buf;
  xpc_object_t v30 = xpc_null_create();

  id v31 = v73;
  id v73 = v29;

  if (v61) {
    (*(void (**)(uint64_t))(*(void *)v61 + 8LL))(v61);
  }
  id v32 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 971;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPCounterThreadMleAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v73;
  *(void *)&buf[8] = "value";
  xpc_object_t v34 = sub_1000A9F60((uint64_t)buf);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  sub_1000C8D20(v35, v8);

LABEL_38:
  uint64_t v60 = 0LL;
  v36 = self->_CtrInternalClientPtr;
  sub_10000AC00(v58, "vendor:coex:counters:asvalmap");
  if (v36) {
    -[CtrInternalClient getProperty:output:](v36, "getProperty:output:", v58, &v60);
  }
  else {
    memset(buf, 0, 32);
  }
  int v37 = *sub_1000E4898(&v74, (uint64_t)buf);
  if (v59 < 0)
  {
    operator delete(v58[0]);
    if (v37) {
      goto LABEL_54;
    }
  }

  else if (v37)
  {
    goto LABEL_54;
  }

  uint64_t v38 = v60;
  if (v60) {
    uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)v60 + 24LL))(v60);
  }
  uint64_t v57 = v38;
  v39.var0 = (placeholder *)&v57;
  convert_ValMap_to_xpc_object(v39, "vendor:coex:counters:asvalmap", "PropGet", (xpc_object_t *)buf);
  id v40 = *(id *)buf;
  xpc_object_t v41 = xpc_null_create();

  id v42 = v73;
  id v73 = v40;

  if (v57) {
    (*(void (**)(uint64_t))(*(void *)v57 + 8LL))(v57);
  }
  id v43 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 980;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_CoEx_Counters_AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v73;
  *(void *)&buf[8] = "value";
  xpc_object_t v45 = sub_1000A9F60((uint64_t)buf);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  sub_1000C7D2C(v46, v10, v9);

LABEL_54:
  std::to_string(&v56, __val[0]);
  unsigned int v47 = self->_CtrInternalClientPtr;
  sub_10000AC00(v54, "tdm:periodicdiag:enable");
  if (v47)
  {
    if ((v56.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      id v48 = &v56;
    }
    else {
      id v48 = (std::string *)v56.__r_.__value_.__r.__words[0];
    }
    -[CtrInternalClient setProperty:property_val:](v47, "setProperty:property_val:", v54, v48);
  }

  else
  {
    memset(buf, 0, 32);
  }

  int v49 = *sub_1000E4898(&v74, (uint64_t)buf);
  if (v55 < 0)
  {
    operator delete(v54[0]);
    if (v49) {
      goto LABEL_71;
    }
  }

  else if (v49)
  {
    goto LABEL_71;
  }

  v50 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    id v52 = &v56;
    if ((v56.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      id v52 = (std::string *)v56.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 993;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = __val[0];
    *(_WORD *)&buf[24] = 2080;
    *(void *)&buf[26] = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "%s:%d:  kWPANTUNDProperty_TDM_periodicDiagnosticsEnable shouldRunTdm=%d shouldRunTdmStr=%s",  buf,  0x22u);
  }

LABEL_71:
  if (v60) {
    (*(void (**)(uint64_t))(*(void *)v60 + 8LL))(v60);
  }
  if (v64) {
    (*(void (**)(uint64_t))(*(void *)v64 + 8LL))(v64);
  }
  if (v72) {
    (*(void (**)(uint64_t))(*(void *)v72 + 8LL))(v72);
  }
  id v53 = v73;
  id v73 = 0LL;

  if (SHIBYTE(v76) < 0) {
    operator delete((void *)v75);
  }
}

- (void)getNetworkRadioMetrics
{
  int v158 = 0;
  __int128 v159 = *(_OWORD *)buf;
  uint64_t v160 = *(void *)&buf[16];
  uint64_t v156 = 0LL;
  id v157 = xpc_null_create();
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    v4 = &mDaemonVersion;
  }
  else {
    v4 = (uint64_t *)mDaemonVersion;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    v6 = &mVendorVersion;
  }
  else {
    v6 = (uint64_t *)mVendorVersion;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v154, "vendor:MAC:packet:RSSIHistogram:AsValMap");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v154, &v156);
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v155 < 0)
  {
    operator delete(v154[0]);
    if (v9) {
      goto LABEL_23;
    }
  }

  else if (v9)
  {
    goto LABEL_23;
  }

  uint64_t v10 = v156;
  if (v156) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v156 + 24LL))(v156);
  }
  uint64_t v153 = v10;
  v11.var0 = (placeholder *)&v153;
  convert_ValMap_to_xpc_object(v11, "vendor:MAC:packet:RSSIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v12 = *(id *)buf;
  xpc_object_t v13 = xpc_null_create();

  id v14 = v157;
  id v157 = v12;

  if (v153) {
    (*(void (**)(uint64_t))(*(void *)v153 + 8LL))(v153);
  }
  int v15 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1245;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Neighbor_RSSI_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v17 = sub_1000A9F60((uint64_t)buf);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  sub_1000BF8F4(v18, v3);

LABEL_23:
  sub_1000C2110(v3);
  uint64_t v152 = 0LL;
  xpc_object_t v19 = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:MAC:packet:LQIHistogram:AsValMap");
  if (v19) {
    -[CtrInternalClient getProperty:output:](v19, "getProperty:output:", __p, &v152);
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v151 < 0)
  {
    operator delete(__p[0]);
    if (v20) {
      goto LABEL_39;
    }
  }

  else if (v20)
  {
    goto LABEL_39;
  }

  uint64_t v21 = v152;
  if (v152) {
    uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v152 + 24LL))(v152);
  }
  uint64_t v149 = v21;
  v22.var0 = (placeholder *)&v149;
  convert_ValMap_to_xpc_object(v22, "vendor:MAC:packet:LQIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v23 = *(id *)buf;
  xpc_object_t v24 = xpc_null_create();

  id v25 = v157;
  id v157 = v23;

  if (v149) {
    (*(void (**)(uint64_t))(*(void *)v149 + 8LL))(v149);
  }
  int v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1257;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_MAC_Packet_LQI_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v28 = sub_1000A9F60((uint64_t)buf);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  sub_1000C0990(v29, v3);

LABEL_39:
  uint64_t v148 = 0LL;
  xpc_object_t v30 = self->_CtrInternalClientPtr;
  sub_10000AC00(v146, "TPC:FrameTxPowerHistogram");
  if (v30) {
    -[CtrInternalClient getProperty:output:](v30, "getProperty:output:", v146, &v148);
  }
  else {
    memset(buf, 0, 32);
  }
  int v31 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v147 < 0)
  {
    operator delete(v146[0]);
    if (v31) {
      goto LABEL_55;
    }
  }

  else if (v31)
  {
    goto LABEL_55;
  }

  uint64_t v32 = v148;
  if (v148) {
    uint64_t v32 = (*(uint64_t (**)(uint64_t))(*(void *)v148 + 24LL))(v148);
  }
  uint64_t v145 = v32;
  v33.var0 = (placeholder *)&v145;
  convert_ValMap_to_xpc_object(v33, "TPC:FrameTxPowerHistogram", "PropGet", (xpc_object_t *)buf);
  id v34 = *(id *)buf;
  xpc_object_t v35 = xpc_null_create();

  id v36 = v157;
  id v157 = v34;

  if (v145) {
    (*(void (**)(uint64_t))(*(void *)v145 + 8LL))(v145);
  }
  int v37 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1265;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_Tpc_FrameTxPowerHistogram Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v39 = sub_1000A9F60((uint64_t)buf);
  id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  sub_1000C21F4(v40, v3);

LABEL_55:
  uint64_t v144 = 0LL;
  xpc_object_t v41 = self->_CtrInternalClientPtr;
  sub_10000AC00(v142, "TPC:NeighborTxPowerHistogram");
  if (v41) {
    -[CtrInternalClient getProperty:output:](v41, "getProperty:output:", v142, &v144);
  }
  else {
    memset(buf, 0, 32);
  }
  int v42 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v143 < 0)
  {
    operator delete(v142[0]);
    if (v42) {
      goto LABEL_71;
    }
  }

  else if (v42)
  {
    goto LABEL_71;
  }

  uint64_t v43 = v144;
  if (v144) {
    uint64_t v43 = (*(uint64_t (**)(uint64_t))(*(void *)v144 + 24LL))(v144);
  }
  uint64_t v141 = v43;
  v44.var0 = (placeholder *)&v141;
  convert_ValMap_to_xpc_object(v44, "TPC:NeighborTxPowerHistogram", "PropGet", (xpc_object_t *)buf);
  id v45 = *(id *)buf;
  xpc_object_t v46 = xpc_null_create();

  id v47 = v157;
  id v157 = v45;

  if (v141) {
    (*(void (**)(uint64_t))(*(void *)v141 + 8LL))(v141);
  }
  id v48 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1273;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_Tpc_NeighborTxPowerHistogram Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v50 = sub_1000A9F60((uint64_t)buf);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  sub_1000C2658(v51, v3);

LABEL_71:
  uint64_t v140 = 0LL;
  id v52 = self->_CtrInternalClientPtr;
  sub_10000AC00(v138, "TPC:NeighborEnergySavingsFactorHistogram");
  if (v52) {
    -[CtrInternalClient getProperty:output:](v52, "getProperty:output:", v138, &v140);
  }
  else {
    memset(buf, 0, 32);
  }
  int v53 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v139 < 0)
  {
    operator delete(v138[0]);
    if (v53) {
      goto LABEL_87;
    }
  }

  else if (v53)
  {
    goto LABEL_87;
  }

  uint64_t v54 = v140;
  if (v140) {
    uint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)v140 + 24LL))(v140);
  }
  uint64_t v137 = v54;
  v55.var0 = (placeholder *)&v137;
  convert_ValMap_to_xpc_object(v55, "TPC:NeighborEnergySavingsFactorHistogram", "PropGet", (xpc_object_t *)buf);
  id v56 = *(id *)buf;
  xpc_object_t v57 = xpc_null_create();

  id v58 = v157;
  id v157 = v56;

  if (v137) {
    (*(void (**)(uint64_t))(*(void *)v137 + 8LL))(v137);
  }
  char v59 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1281;
    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_Tpc_NeighborEnergySavingsFactorHistogram Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v61 = sub_1000A9F60((uint64_t)buf);
  id v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  sub_1000C2AC0(v62, v3);

LABEL_87:
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472LL;
  v135[2] = sub_1001CC52C;
  v135[3] = &unk_1002B2158;
  id v63 = v3;
  id v136 = v63;
  AnalyticsSendExplodingEventLazy(@"com.apple.Flagstone.flagstoneNetworkRadioMetricsHist", v135);

  [v63 removeAllObjects];
  if (byte_1002C9DAF >= 0) {
    uint64_t v64 = &mDaemonVersion;
  }
  else {
    uint64_t v64 = (uint64_t *)mDaemonVersion;
  }
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v64));
  [v63 setObject:v65 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    id v66 = &mVendorVersion;
  }
  else {
    id v66 = (uint64_t *)mVendorVersion;
  }
  char v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v66));
  [v63 setObject:v67 forKey:@"header_vendor_version"];

  uint64_t v134 = 0LL;
  BOOL v68 = self->_CtrInternalClientPtr;
  sub_10000AC00(v132, "vendor:radio:counters:asvalmap");
  if (v68) {
    -[CtrInternalClient getProperty:output:](v68, "getProperty:output:", v132, &v134);
  }
  else {
    memset(buf, 0, 32);
  }
  int v69 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v133 < 0)
  {
    operator delete(v132[0]);
    if (v69) {
      goto LABEL_109;
    }
  }

  else if (v69)
  {
    goto LABEL_109;
  }

  uint64_t v70 = v134;
  if (v134) {
    uint64_t v70 = (*(uint64_t (**)(uint64_t))(*(void *)v134 + 24LL))(v134);
  }
  uint64_t v131 = v70;
  v71.var0 = (placeholder *)&v131;
  convert_ValMap_to_xpc_object(v71, "vendor:radio:counters:asvalmap", "PropGet", (xpc_object_t *)buf);
  id v72 = *(id *)buf;
  xpc_object_t v73 = xpc_null_create();

  id v74 = v157;
  id v157 = v72;

  if (v131) {
    (*(void (**)(uint64_t))(*(void *)v131 + 8LL))(v131);
  }
  __int128 v75 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1306;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Radio_Counters_AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v77 = sub_1000A9F60((uint64_t)buf);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  sub_1000C2F08(v78, v63);

LABEL_109:
  uint64_t v130 = 0LL;
  char v79 = self->_CtrInternalClientPtr;
  sub_10000AC00(v128, "vendor:radio:stats:asvalmap");
  if (v79) {
    -[CtrInternalClient getProperty:output:](v79, "getProperty:output:", v128, &v130);
  }
  else {
    memset(buf, 0, 32);
  }
  int v80 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v129 < 0)
  {
    operator delete(v128[0]);
    if (v80) {
      goto LABEL_125;
    }
  }

  else if (v80)
  {
    goto LABEL_125;
  }

  uint64_t v81 = v130;
  if (v130) {
    uint64_t v81 = (*(uint64_t (**)(uint64_t))(*(void *)v130 + 24LL))(v130);
  }
  uint64_t v127 = v81;
  v82.var0 = (placeholder *)&v127;
  convert_ValMap_to_xpc_object(v82, "vendor:radio:stats:asvalmap", "PropGet", (xpc_object_t *)buf);
  id v83 = *(id *)buf;
  xpc_object_t v84 = xpc_null_create();

  id v85 = v157;
  id v157 = v83;

  if (v127) {
    (*(void (**)(uint64_t))(*(void *)v127 + 8LL))(v127);
  }
  uint64_t v86 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1315;
    _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_RadioStats_AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v88 = sub_1000A9F60((uint64_t)buf);
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  sub_1000C31B0(v89, v63);

LABEL_125:
  uint64_t v126 = 0LL;
  uint64_t v90 = self->_CtrInternalClientPtr;
  sub_10000AC00(v124, "vendor:openthread:radio:counters:AsValMap");
  if (v90) {
    -[CtrInternalClient getProperty:output:](v90, "getProperty:output:", v124, &v126);
  }
  else {
    memset(buf, 0, 32);
  }
  int v91 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v125 < 0)
  {
    operator delete(v124[0]);
    if (v91) {
      goto LABEL_141;
    }
  }

  else if (v91)
  {
    goto LABEL_141;
  }

  uint64_t v92 = v126;
  if (v126) {
    uint64_t v92 = (*(uint64_t (**)(uint64_t))(*(void *)v126 + 24LL))(v126);
  }
  uint64_t v123 = v92;
  v93.var0 = (placeholder *)&v123;
  convert_ValMap_to_xpc_object(v93, "vendor:openthread:radio:counters:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v94 = *(id *)buf;
  xpc_object_t v95 = xpc_null_create();

  id v96 = v157;
  id v157 = v94;

  if (v123) {
    (*(void (**)(uint64_t))(*(void *)v123 + 8LL))(v123);
  }
  v97 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  __int16 v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
  if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1324;
    _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Openthread_Radio_Counters_AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v99 = sub_1000A9F60((uint64_t)buf);
  v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
  sub_1000C33B8(v100, v63, @"vendor:openthread:radio:counters:AsValMap");

LABEL_141:
  uint64_t v122 = 0LL;
  v101 = self->_CtrInternalClientPtr;
  sub_10000AC00(v120, "vendor:streaming:stats");
  if (v101) {
    -[CtrInternalClient getProperty:output:](v101, "getProperty:output:", v120, &v122);
  }
  else {
    memset(buf, 0, 32);
  }
  int v102 = *sub_1000E4898(&v158, (uint64_t)buf);
  if (v121 < 0)
  {
    operator delete(v120[0]);
    if (v102) {
      goto LABEL_157;
    }
  }

  else if (v102)
  {
    goto LABEL_157;
  }

  uint64_t v103 = v122;
  if (v122) {
    uint64_t v103 = (*(uint64_t (**)(uint64_t))(*(void *)v122 + 24LL))(v122);
  }
  uint64_t v119 = v103;
  v104.var0 = (placeholder *)&v119;
  convert_ValMap_to_xpc_object(v104, "vendor:streaming:stats", "PropGet", (xpc_object_t *)buf);
  id v105 = *(id *)buf;
  xpc_object_t v106 = xpc_null_create();

  id v107 = v157;
  id v157 = v105;

  if (v119) {
    (*(void (**)(uint64_t))(*(void *)v119 + 8LL))(v119);
  }
  signed int v108 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1335;
    _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_StreamingStats Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v157;
  *(void *)&buf[8] = "value";
  xpc_object_t v110 = sub_1000A9F60((uint64_t)buf);
  __int16 v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
  sub_1000C33B8(v111, v63, @"vendor:streaming:stats");

LABEL_157:
  v114 = _NSConcreteStackBlock;
  uint64_t v115 = 3221225472LL;
  uint64_t v116 = sub_1001CC534;
  id v117 = &unk_1002B2158;
  id v112 = v63;
  id v118 = v112;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneNetworkRadioMetricsCounters", &v114);
  -[ThreadNetworkManagerInstance resetNetworkRadioMetrics](self, "resetNetworkRadioMetrics", v114, v115, v116, v117);

  if (v122) {
    (*(void (**)(uint64_t))(*(void *)v122 + 8LL))(v122);
  }
  if (v126) {
    (*(void (**)(uint64_t))(*(void *)v126 + 8LL))(v126);
  }
  if (v130) {
    (*(void (**)(uint64_t))(*(void *)v130 + 8LL))(v130);
  }
  if (v134) {
    (*(void (**)(uint64_t))(*(void *)v134 + 8LL))(v134);
  }
  if (v140) {
    (*(void (**)(uint64_t))(*(void *)v140 + 8LL))(v140);
  }
  if (v144) {
    (*(void (**)(uint64_t))(*(void *)v144 + 8LL))(v144);
  }
  if (v148) {
    (*(void (**)(uint64_t))(*(void *)v148 + 8LL))(v148);
  }
  if (v152) {
    (*(void (**)(uint64_t))(*(void *)v152 + 8LL))(v152);
  }

  if (v156) {
    (*(void (**)(uint64_t))(*(void *)v156 + 8LL))(v156);
  }
  id v113 = v157;
  id v157 = 0LL;

  if (SHIBYTE(v160) < 0) {
    operator delete((void *)v159);
  }
}

- (void)resetNetworkRadioMetrics
{
  int v57 = 0;
  __int128 v58 = *(_OWORD *)buf;
  uint64_t v59 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v55, "vendor:MAC:packet:RSSIHistogram");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v55, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v56 < 0)
  {
    operator delete(v55[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1359;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Neighbor_RSSI_Histogram stats",  buf,  0x12u);
  }

LABEL_13:
  id v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v53, "vendor:MAC:packet:LQIHistogram");
  if (v7) {
    -[CtrInternalClient setProperty:property_val:](v7, "setProperty:property_val:", v53, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v54 < 0)
  {
    operator delete(v53[0]);
    if (v8) {
      goto LABEL_25;
    }
  }

  else if (v8)
  {
    goto LABEL_25;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1363;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_LQI_Histogram stats",  buf,  0x12u);
  }

LABEL_25:
  any v11 = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "TPC:FrameTxPowerHistogram");
  if (v11) {
    -[CtrInternalClient setProperty:property_val:](v11, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v12 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v52 < 0)
  {
    operator delete(__p[0]);
    if (v12) {
      goto LABEL_37;
    }
  }

  else if (v12)
  {
    goto LABEL_37;
  }

  xpc_object_t v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1367;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_Tpc_FrameTxPowerHistogram stats",  buf,  0x12u);
  }

LABEL_37:
  int v15 = self->_CtrInternalClientPtr;
  sub_10000AC00(v49, "TPC:NeighborTxPowerHistogram");
  if (v15) {
    -[CtrInternalClient setProperty:property_val:](v15, "setProperty:property_val:", v49, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v16 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v50 < 0)
  {
    operator delete(v49[0]);
    if (v16) {
      goto LABEL_49;
    }
  }

  else if (v16)
  {
    goto LABEL_49;
  }

  xpc_object_t v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1371;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_Tpc_NeighborTxPowerHistogram stats",  buf,  0x12u);
  }

LABEL_49:
  xpc_object_t v19 = self->_CtrInternalClientPtr;
  sub_10000AC00(v47, "TPC:NeighborEnergySavingsFactorHistogram");
  if (v19) {
    -[CtrInternalClient setProperty:property_val:](v19, "setProperty:property_val:", v47, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v48 < 0)
  {
    operator delete(v47[0]);
    if (v20) {
      goto LABEL_61;
    }
  }

  else if (v20)
  {
    goto LABEL_61;
  }

  uint64_t v21 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  any v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1375;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_Tpc_NeighborEnergySavingsFactorHistogram stats",  buf,  0x12u);
  }

LABEL_61:
  id v23 = self->_CtrInternalClientPtr;
  sub_10000AC00(v45, "vendor:radio:counters");
  if (v23) {
    -[CtrInternalClient setProperty:property_val:](v23, "setProperty:property_val:", v45, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v24 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v46 < 0)
  {
    operator delete(v45[0]);
    if (v24) {
      goto LABEL_73;
    }
  }

  else if (v24)
  {
    goto LABEL_73;
  }

  id v25 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1379;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Radio_Counters stats",  buf,  0x12u);
  }

LABEL_73:
  uint64_t v27 = self->_CtrInternalClientPtr;
  sub_10000AC00(v43, "vendor:radio:stats");
  if (v27) {
    -[CtrInternalClient setProperty:property_val:](v27, "setProperty:property_val:", v43, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v28 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v44 < 0)
  {
    operator delete(v43[0]);
    if (v28) {
      goto LABEL_85;
    }
  }

  else if (v28)
  {
    goto LABEL_85;
  }

  id v29 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  xpc_object_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1383;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_RadioStats stats",  buf,  0x12u);
  }

LABEL_85:
  int v31 = self->_CtrInternalClientPtr;
  sub_10000AC00(v41, "vendor:openthread:radio:counters");
  if (v31) {
    -[CtrInternalClient setProperty:property_val:](v31, "setProperty:property_val:", v41, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v32 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v42 < 0)
  {
    operator delete(v41[0]);
    if (v32) {
      goto LABEL_97;
    }
  }

  else if (v32)
  {
    goto LABEL_97;
  }

  any v33 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1387;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Openthread_Radio_Counters stats",  buf,  0x12u);
  }

LABEL_97:
  xpc_object_t v35 = self->_CtrInternalClientPtr;
  sub_10000AC00(v39, "vendor:streaming:stats");
  if (v35) {
    -[CtrInternalClient setProperty:property_val:](v35, "setProperty:property_val:", v39, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v36 = *sub_1000E4898(&v57, (uint64_t)buf);
  if (v40 < 0)
  {
    operator delete(v39[0]);
    if (v36) {
      goto LABEL_109;
    }
  }

  else if (v36)
  {
    goto LABEL_109;
  }

  int v37 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1392;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_StreamingStats stats",  buf,  0x12u);
  }

LABEL_109:
  sub_1000C2EEC();
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
}

- (void)getAllMacMetrics
{
  int v110 = 0;
  __int128 v111 = *(_OWORD *)buf;
  uint64_t v112 = *(void *)&buf[16];
  uint64_t v108 = 0LL;
  id v109 = xpc_null_create();
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    v6 = &mVendorVersion;
  }
  else {
    v6 = (uint64_t *)mVendorVersion;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v106, "NCP:Counter:AllMac:AsValMap");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v106, &v108);
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v107 < 0)
  {
    operator delete(v106[0]);
    if (v9) {
      goto LABEL_23;
    }
  }

  else if (v9)
  {
    goto LABEL_23;
  }

  uint64_t v10 = v108;
  if (v108) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v108 + 24LL))(v108);
  }
  uint64_t v105 = v10;
  v11.var0 = (placeholder *)&v105;
  convert_ValMap_to_xpc_object(v11, "NCP:Counter:AllMac:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v12 = *(id *)buf;
  xpc_object_t v13 = xpc_null_create();

  id v14 = v109;
  id v109 = v12;

  if (v105) {
    (*(void (**)(uint64_t))(*(void *)v105 + 8LL))(v105);
  }
  int v15 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1410;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPCounterAllMacAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v17 = sub_1000A9F60((uint64_t)buf);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  sub_1000C63D4(v18, v3);

LABEL_23:
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472LL;
  v103[2] = sub_1001CDE90;
  v103[3] = &unk_1002B2158;
  id v19 = v3;
  id v104 = v19;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneMACMetricsCounters", v103);
  [v19 removeAllObjects];
  if (byte_1002C9DAF >= 0) {
    int v20 = &mDaemonVersion;
  }
  else {
    int v20 = (uint64_t *)mDaemonVersion;
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
  [v19 setObject:v21 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    any v22 = &mVendorVersion;
  }
  else {
    any v22 = (uint64_t *)mVendorVersion;
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
  [v19 setObject:v23 forKey:@"header_vendor_version"];

  uint64_t v102 = 0LL;
  int v24 = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:MAC:packet:SizeHistogram:AsValMap");
  if (v24) {
    -[CtrInternalClient getProperty:output:](v24, "getProperty:output:", __p, &v102);
  }
  else {
    memset(buf, 0, 32);
  }
  int v25 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v101 < 0)
  {
    operator delete(__p[0]);
    if (v25) {
      goto LABEL_45;
    }
  }

  else if (v25)
  {
    goto LABEL_45;
  }

  uint64_t v26 = v102;
  if (v102) {
    uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v102 + 24LL))(v102);
  }
  uint64_t v99 = v26;
  v27.var0 = (placeholder *)&v99;
  convert_ValMap_to_xpc_object(v27, "vendor:MAC:packet:SizeHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v28 = *(id *)buf;
  xpc_object_t v29 = xpc_null_create();

  id v30 = v109;
  id v109 = v28;

  if (v99) {
    (*(void (**)(uint64_t))(*(void *)v99 + 8LL))(v99);
  }
  int v31 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1430;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_MAC_Packet_Size_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v33 = sub_1000A9F60((uint64_t)buf);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  sub_1000C0DF8(v34, v19);

LABEL_45:
  uint64_t v98 = 0LL;
  xpc_object_t v35 = self->_CtrInternalClientPtr;
  sub_10000AC00(v96, "NCP:MacRetryHistogram:AsValMap");
  if (v35) {
    -[CtrInternalClient getProperty:output:](v35, "getProperty:output:", v96, &v98);
  }
  else {
    memset(buf, 0, 32);
  }
  int v36 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v97 < 0)
  {
    operator delete(v96[0]);
    if (v36) {
      goto LABEL_61;
    }
  }

  else if (v36)
  {
    goto LABEL_61;
  }

  uint64_t v37 = v98;
  if (v98) {
    uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v98 + 24LL))(v98);
  }
  uint64_t v95 = v37;
  v38.var0 = (placeholder *)&v95;
  convert_ValMap_to_xpc_object(v38, "NCP:MacRetryHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v39 = *(id *)buf;
  xpc_object_t v40 = xpc_null_create();

  id v41 = v109;
  id v109 = v39;

  if (v95) {
    (*(void (**)(uint64_t))(*(void *)v95 + 8LL))(v95);
  }
  char v42 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1438;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPMacRetryHistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v44 = sub_1000A9F60((uint64_t)buf);
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  sub_1000C4958(v45, v19);

LABEL_61:
  uint64_t v94 = 0LL;
  char v46 = self->_CtrInternalClientPtr;
  sub_10000AC00(v92, "vendor:MAC:packet:ErrorHistogram:AsValMap");
  if (v46) {
    -[CtrInternalClient getProperty:output:](v46, "getProperty:output:", v92, &v94);
  }
  else {
    memset(buf, 0, 32);
  }
  int v47 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v93 < 0)
  {
    operator delete(v92[0]);
    if (v47) {
      goto LABEL_77;
    }
  }

  else if (v47)
  {
    goto LABEL_77;
  }

  uint64_t v48 = v94;
  if (v94) {
    uint64_t v48 = (*(uint64_t (**)(uint64_t))(*(void *)v94 + 24LL))(v94);
  }
  uint64_t v91 = v48;
  v49.var0 = (placeholder *)&v91;
  convert_ValMap_to_xpc_object(v49, "vendor:MAC:packet:ErrorHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v50 = *(id *)buf;
  xpc_object_t v51 = xpc_null_create();

  id v52 = v109;
  id v109 = v50;

  if (v91) {
    (*(void (**)(uint64_t))(*(void *)v91 + 8LL))(v91);
  }
  int v53 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  char v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1446;
    _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_MAC_Packet_Error_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v55 = sub_1000A9F60((uint64_t)buf);
  char v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  sub_1000C36AC(v56, v19);

LABEL_77:
  uint64_t v90 = 0LL;
  int v57 = self->_CtrInternalClientPtr;
  sub_10000AC00(v88, "vendor:cca:energydetected:histogram:AsValMap");
  if (v57) {
    -[CtrInternalClient getProperty:output:](v57, "getProperty:output:", v88, &v90);
  }
  else {
    memset(buf, 0, 32);
  }
  int v58 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v89 < 0)
  {
    operator delete(v88[0]);
    if (v58) {
      goto LABEL_93;
    }
  }

  else if (v58)
  {
    goto LABEL_93;
  }

  uint64_t v59 = v90;
  if (v90) {
    uint64_t v59 = (*(uint64_t (**)(uint64_t))(*(void *)v90 + 24LL))(v90);
  }
  uint64_t v87 = v59;
  v60.var0 = (placeholder *)&v87;
  convert_ValMap_to_xpc_object(v60, "vendor:cca:energydetected:histogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v61 = *(id *)buf;
  xpc_object_t v62 = xpc_null_create();

  id v63 = v109;
  id v109 = v61;

  if (v87) {
    (*(void (**)(uint64_t))(*(void *)v87 + 8LL))(v87);
  }
  uint64_t v64 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1456;
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Cca_Energy_Detected_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v66 = sub_1000A9F60((uint64_t)buf);
  char v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  sub_1000C5778(v67, v19);

LABEL_93:
  uint64_t v86 = 0LL;
  BOOL v68 = self->_CtrInternalClientPtr;
  sub_10000AC00(v84, "vendor:csma:backoff:histogram:AsValMap");
  if (v68) {
    -[CtrInternalClient getProperty:output:](v68, "getProperty:output:", v84, &v86);
  }
  else {
    memset(buf, 0, 32);
  }
  int v69 = *sub_1000E4898(&v110, (uint64_t)buf);
  if (v85 < 0)
  {
    operator delete(v84[0]);
    if (v69) {
      goto LABEL_109;
    }
  }

  else if (v69)
  {
    goto LABEL_109;
  }

  uint64_t v70 = v86;
  if (v86) {
    uint64_t v70 = (*(uint64_t (**)(uint64_t))(*(void *)v86 + 24LL))(v86);
  }
  uint64_t v83 = v70;
  v71.var0 = (placeholder *)&v83;
  convert_ValMap_to_xpc_object(v71, "vendor:csma:backoff:histogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v72 = *(id *)buf;
  xpc_object_t v73 = xpc_null_create();

  id v74 = v109;
  id v109 = v72;

  if (v83) {
    (*(void (**)(uint64_t))(*(void *)v83 + 8LL))(v83);
  }
  __int128 v75 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1465;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Csma_Backoff_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v109;
  *(void *)&buf[8] = "value";
  xpc_object_t v77 = sub_1000A9F60((uint64_t)buf);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  sub_1000C5F88(v78, v19);

LABEL_109:
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_1001CDE98;
  v81[3] = &unk_1002B2158;
  id v79 = v19;
  id v82 = v79;
  AnalyticsSendExplodingEventLazy(@"com.apple.Flagstone.flagstoneMACMetricsHist", v81);

  -[ThreadNetworkManagerInstance resetMacMetrics](self, "resetMacMetrics");
  if (v86) {
    (*(void (**)(uint64_t))(*(void *)v86 + 8LL))(v86);
  }
  if (v90) {
    (*(void (**)(uint64_t))(*(void *)v90 + 8LL))(v90);
  }
  if (v94) {
    (*(void (**)(uint64_t))(*(void *)v94 + 8LL))(v94);
  }
  if (v98) {
    (*(void (**)(uint64_t))(*(void *)v98 + 8LL))(v98);
  }
  if (v102) {
    (*(void (**)(uint64_t))(*(void *)v102 + 8LL))(v102);
  }

  if (v108) {
    (*(void (**)(uint64_t))(*(void *)v108 + 8LL))(v108);
  }
  id v80 = v109;
  id v109 = 0LL;

  if (SHIBYTE(v112) < 0) {
    operator delete((void *)v111);
  }
}

- (void)resetMacMetrics
{
  int v39 = 0;
  __int128 v40 = *(_OWORD *)buf;
  uint64_t v41 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:Counter:AllMac");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v38 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1499;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllMac stats",  buf,  0x12u);
  }

LABEL_13:
  id v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v35, "vendor:MAC:packet:SizeHistogram");
  if (v7) {
    -[CtrInternalClient setProperty:property_val:](v7, "setProperty:property_val:", v35, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v36 < 0)
  {
    operator delete(v35[0]);
    if (v8) {
      goto LABEL_25;
    }
  }

  else if (v8)
  {
    goto LABEL_25;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1504;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_Size_Histogram stats",  buf,  0x12u);
  }

LABEL_25:
  any v11 = self->_CtrInternalClientPtr;
  sub_10000AC00(v33, "NCP:MacRetryHistogram");
  if (v11) {
    -[CtrInternalClient setProperty:property_val:](v11, "setProperty:property_val:", v33, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v12 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v34 < 0)
  {
    operator delete(v33[0]);
    if (v12) {
      goto LABEL_37;
    }
  }

  else if (v12)
  {
    goto LABEL_37;
  }

  xpc_object_t v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1509;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPMacRetryHistogram stats",  buf,  0x12u);
  }

LABEL_37:
  int v15 = self->_CtrInternalClientPtr;
  sub_10000AC00(v31, "vendor:MAC:packet:ErrorHistogram");
  if (v15) {
    -[CtrInternalClient setProperty:property_val:](v15, "setProperty:property_val:", v31, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v16 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v32 < 0)
  {
    operator delete(v31[0]);
    if (v16) {
      goto LABEL_49;
    }
  }

  else if (v16)
  {
    goto LABEL_49;
  }

  xpc_object_t v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1514;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_Error_Histogram stats",  buf,  0x12u);
  }

LABEL_49:
  id v19 = self->_CtrInternalClientPtr;
  sub_10000AC00(v29, "vendor:cca:energydetected:histogram");
  if (v19) {
    -[CtrInternalClient setProperty:property_val:](v19, "setProperty:property_val:", v29, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v30 < 0)
  {
    operator delete(v29[0]);
    if (v20) {
      goto LABEL_61;
    }
  }

  else if (v20)
  {
    goto LABEL_61;
  }

  uint64_t v21 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  any v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1519;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Cca_Energy_Detected_HistogramAsValMap stats",  buf,  0x12u);
  }

LABEL_61:
  id v23 = self->_CtrInternalClientPtr;
  sub_10000AC00(v27, "vendor:csma:backoff:histogram");
  if (v23) {
    -[CtrInternalClient setProperty:property_val:](v23, "setProperty:property_val:", v27, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v24 = *sub_1000E4898(&v39, (uint64_t)buf);
  if (v28 < 0)
  {
    operator delete(v27[0]);
    if (v24) {
      goto LABEL_73;
    }
  }

  else if (v24)
  {
    goto LABEL_73;
  }

  int v25 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1524;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Csma_Backoff_Histogram stats",  buf,  0x12u);
  }

LABEL_73:
  if (SHIBYTE(v41) < 0) {
    operator delete((void *)v40);
  }
}

- (void)getCoexMetrics:(id)a3 coexDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000AC00(__p, "Command success");
  int v42 = 0;
  __int128 v43 = *(_OWORD *)__p;
  xpc_object_t v44 = __p[2];
  id v41 = xpc_null_create();
  if (byte_1002C9DAF >= 0) {
    int v8 = &mDaemonVersion;
  }
  else {
    int v8 = (uint64_t *)mDaemonVersion;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  [v6 setObject:v9 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    uint64_t v10 = &mVendorVersion;
  }
  else {
    uint64_t v10 = (uint64_t *)mVendorVersion;
  }
  any v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  [v6 setObject:v11 forKey:@"header_vendor_version"];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001CEAC4;
  v39[3] = &unk_1002B2158;
  id v12 = v6;
  id v40 = v12;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneCoexMetricsCounters", v39);
  if (byte_1002C9DAF >= 0) {
    xpc_object_t v13 = &mDaemonVersion;
  }
  else {
    xpc_object_t v13 = (uint64_t *)mDaemonVersion;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
  [v7 setObject:v14 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    int v15 = &mVendorVersion;
  }
  else {
    int v15 = (uint64_t *)mVendorVersion;
  }
  int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  [v7 setObject:v16 forKey:@"header_vendor_version"];

  uint64_t v38 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v36, "vendor:coex:histograms:asvalmap");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v36, &v38);
  }
  else {
    memset(__p, 0, 32);
  }
  int v18 = *sub_1000E4898(&v42, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v37 < 0)
  {
    operator delete(v36[0]);
    if (v18) {
      goto LABEL_29;
    }
  }

  else if (v18)
  {
    goto LABEL_29;
  }

  uint64_t v19 = v38;
  if (v38) {
    uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 24LL))(v38);
  }
  uint64_t v35 = v19;
  v20.var0 = (placeholder *)&v35;
  convert_ValMap_to_xpc_object(v20, "vendor:coex:histograms:asvalmap", "PropGet", __p);
  uint64_t v21 = __p[0];
  xpc_object_t v22 = xpc_null_create();

  id v23 = v41;
  id v41 = v21;

  if (v35) {
    (*(void (**)(uint64_t))(*(void *)v35 + 8LL))(v35);
  }
  int v24 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCoexMetrics:coexDict:]";
    WORD2(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 6) = 1559;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_CoEx_Histograms_AsValMap Property",  (uint8_t *)__p,  0x12u);
  }

  __p[0] = &v41;
  __p[1] = "value";
  xpc_object_t v26 = sub_1000A9F60((uint64_t)__p);
  any v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  sub_1000C700C(v27, v7);

LABEL_29:
  char v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  char v32 = sub_1001CEACC;
  xpc_object_t v33 = &unk_1002B2158;
  id v28 = v7;
  id v34 = v28;
  AnalyticsSendExplodingEventLazy(@"com.apple.Flagstone.flagstoneCoexMetricsHist", &v30);

  -[ThreadNetworkManagerInstance resetCoexMetrics](self, "resetCoexMetrics", v30, v31, v32, v33);
  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 8LL))(v38);
  }

  id v29 = v41;
  id v41 = 0LL;

  if (SHIBYTE(v44) < 0) {
    operator delete((void *)v43);
  }
}

- (void)resetCoexMetrics
{
  int v15 = 0;
  *(_OWORD *)int v16 = *(_OWORD *)buf;
  uint64_t v17 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:coex:counters");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *sub_1000E4898(&v15, (uint64_t)buf);
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetCoexMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1585;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_CoEx_Counters_AsValMap stats",  buf,  0x12u);
  }

LABEL_13:
  id v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v11, "vendor:coex:histograms");
  if (v7) {
    -[CtrInternalClient setProperty:property_val:](v7, "setProperty:property_val:", v11, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *sub_1000E4898(&v15, (uint64_t)buf);
  if (v12 < 0)
  {
    operator delete(v11[0]);
    if (v8) {
      goto LABEL_25;
    }
  }

  else if (v8)
  {
    goto LABEL_25;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetCoexMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1589;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_CoEx_Histograms_AsValMap stats",  buf,  0x12u);
  }

LABEL_25:
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
}

- (void)getIPMLEMetrics:(id)a3
{
  id v4 = a3;
  sub_10000AC00(v18, "Command success");
  xpc_object_t v5 = v18[0];
  int v6 = v19;
  xpc_object_t v7 = xpc_null_create();
  v18[0] = v7;
  if (byte_1002C9DAF >= 0) {
    int v8 = &mDaemonVersion;
  }
  else {
    int v8 = (uint64_t *)mDaemonVersion;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  [v4 setObject:v9 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    uint64_t v10 = &mVendorVersion;
  }
  else {
    uint64_t v10 = (uint64_t *)mVendorVersion;
  }
  any v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  [v4 setObject:v11 forKey:@"header_vendor_version"];

  xpc_object_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  int v15 = sub_1001CEF40;
  int v16 = &unk_1002B2158;
  id v12 = v4;
  id v17 = v12;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneIPMLEMetrics", &v13);
  -[ThreadNetworkManagerInstance resetIPMLEMetrics](self, "resetIPMLEMetrics", v13, v14, v15, v16);

  if (v6 < 0) {
    operator delete(v5);
  }
}

- (void)resetIPMLEMetrics
{
  int v15 = 0;
  *(_OWORD *)int v16 = *(_OWORD *)buf;
  uint64_t v17 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:Counter:AllIPv6");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *sub_1000E4898(&v15, (uint64_t)buf);
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  xpc_object_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetIPMLEMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1622;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllIPv6 stats",  buf,  0x12u);
  }

LABEL_13:
  xpc_object_t v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v11, "NCP:Counter:Thread:Mle");
  if (v7) {
    -[CtrInternalClient setProperty:property_val:](v7, "setProperty:property_val:", v11, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *sub_1000E4898(&v15, (uint64_t)buf);
  if (v12 < 0)
  {
    operator delete(v11[0]);
    if (v8) {
      goto LABEL_25;
    }
  }

  else if (v8)
  {
    goto LABEL_25;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetIPMLEMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1627;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPCounterThreadMle stats",  buf,  0x12u);
  }

LABEL_25:
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
}

- (void)getEngagementMetrics
{
  int v68 = 0;
  __int128 v69 = *(_OWORD *)buf;
  uint64_t v70 = *(void *)&buf[16];
  id v67 = xpc_null_create();
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    int v6 = &mVendorVersion;
  }
  else {
    int v6 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  uint64_t v66 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:neighbor:count:histogram:AsValMap");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v66);
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *sub_1000E4898(&v68, (uint64_t)buf);
  if (v65 < 0)
  {
    operator delete(__p[0]);
    if (v9) {
      goto LABEL_23;
    }
  }

  else if (v9)
  {
    goto LABEL_23;
  }

  uint64_t v10 = v66;
  if (v66) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v66 + 24LL))(v66);
  }
  uint64_t v63 = v10;
  v11.var0 = (placeholder *)&v63;
  convert_ValMap_to_xpc_object(v11, "vendor:neighbor:count:histogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v12 = *(id *)buf;
  xpc_object_t v13 = xpc_null_create();

  id v14 = v67;
  id v67 = v12;

  if (v63) {
    (*(void (**)(uint64_t))(*(void *)v63 + 8LL))(v63);
  }
  int v15 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1645;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Connected_Neighbors_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v67;
  *(void *)&buf[8] = "value";
  xpc_object_t v17 = sub_1000A9F60((uint64_t)buf);
  int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  sub_1000CFA74(v18, v3);

LABEL_23:
  uint64_t v62 = 0LL;
  char v19 = self->_CtrInternalClientPtr;
  sub_10000AC00(v60, "vendor:joiner:RSSIHistogram:AsValMap");
  if (v19) {
    -[CtrInternalClient getProperty:output:](v19, "getProperty:output:", v60, &v62);
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *sub_1000E4898(&v68, (uint64_t)buf);
  if (v61 < 0)
  {
    operator delete(v60[0]);
    if (v20) {
      goto LABEL_39;
    }
  }

  else if (v20)
  {
    goto LABEL_39;
  }

  uint64_t v21 = v62;
  if (v62) {
    uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v62 + 24LL))(v62);
  }
  uint64_t v59 = v21;
  v22.var0 = (placeholder *)&v59;
  convert_ValMap_to_xpc_object(v22, "vendor:joiner:RSSIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v23 = *(id *)buf;
  xpc_object_t v24 = xpc_null_create();

  id v25 = v67;
  id v67 = v23;

  if (v59) {
    (*(void (**)(uint64_t))(*(void *)v59 + 8LL))(v59);
  }
  xpc_object_t v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  any v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1653;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Joiner_RSSI_HistogramAsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v67;
  *(void *)&buf[8] = "value";
  xpc_object_t v28 = sub_1000A9F60((uint64_t)buf);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  sub_1000BEFB0(v29, v3);

LABEL_39:
  sub_1000BEA44(v3);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1001CFB38;
  v57[3] = &unk_1002B2158;
  id v30 = v3;
  id v58 = v30;
  AnalyticsSendExplodingEventLazy(@"com.apple.Flagstone.flagstoneEngagementMetricsHist", v57);

  [v30 removeAllObjects];
  if (byte_1002C9DAF >= 0) {
    uint64_t v31 = &mDaemonVersion;
  }
  else {
    uint64_t v31 = (uint64_t *)mDaemonVersion;
  }
  char v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
  [v30 setObject:v32 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    xpc_object_t v33 = &mVendorVersion;
  }
  else {
    xpc_object_t v33 = (uint64_t *)mVendorVersion;
  }
  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v33));
  [v30 setObject:v34 forKey:@"header_vendor_version"];

  uint64_t v56 = 0LL;
  uint64_t v35 = self->_CtrInternalClientPtr;
  sub_10000AC00(v54, "vendor:linkloss:counters:AsValMap");
  if (v35) {
    -[CtrInternalClient getProperty:output:](v35, "getProperty:output:", v54, &v56);
  }
  else {
    memset(buf, 0, 32);
  }
  int v36 = *sub_1000E4898(&v68, (uint64_t)buf);
  if (v55 < 0)
  {
    operator delete(v54[0]);
    if (v36) {
      goto LABEL_61;
    }
  }

  else if (v36)
  {
    goto LABEL_61;
  }

  uint64_t v37 = v56;
  if (v56) {
    uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v56 + 24LL))(v56);
  }
  uint64_t v53 = v37;
  v38.var0 = (placeholder *)&v53;
  convert_ValMap_to_xpc_object(v38, "vendor:linkloss:counters:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v39 = *(id *)buf;
  xpc_object_t v40 = xpc_null_create();

  id v41 = v67;
  id v67 = v39;

  if (v53) {
    (*(void (**)(uint64_t))(*(void *)v53 + 8LL))(v53);
  }
  int v42 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1680;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDVendor_Link_Loss_Counters_AsValMap Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v67;
  *(void *)&buf[8] = "value";
  xpc_object_t v44 = sub_1000A9F60((uint64_t)buf);
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  sub_1000BF61C(v45, v30);

LABEL_61:
  uint64_t v48 = _NSConcreteStackBlock;
  uint64_t v49 = 3221225472LL;
  id v50 = sub_1001CFB40;
  xpc_object_t v51 = &unk_1002B2158;
  id v46 = v30;
  id v52 = v46;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneEngagementMetricsCounters", &v48);
  -[ThreadNetworkManagerInstance resetEngagementMetrics](self, "resetEngagementMetrics", v48, v49, v50, v51);

  if (v56) {
    (*(void (**)(uint64_t))(*(void *)v56 + 8LL))(v56);
  }
  if (v62) {
    (*(void (**)(uint64_t))(*(void *)v62 + 8LL))(v62);
  }
  if (v66) {
    (*(void (**)(uint64_t))(*(void *)v66 + 8LL))(v66);
  }

  id v47 = v67;
  id v67 = 0LL;

  if (SHIBYTE(v70) < 0) {
    operator delete((void *)v69);
  }
}

- (void)resetEngagementMetrics
{
  int v21 = 0;
  *(_OWORD *)any v22 = *(_OWORD *)buf;
  uint64_t v23 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:neighbor:count:histogram");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *sub_1000E4898(&v21, (uint64_t)buf);
  if (v20 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  xpc_object_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1701;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Connected_Neighbors_Histogram stats",  buf,  0x12u);
  }

LABEL_13:
  xpc_object_t v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v17, "vendor:joiner:RSSIHistogram");
  if (v7) {
    -[CtrInternalClient setProperty:property_val:](v7, "setProperty:property_val:", v17, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *sub_1000E4898(&v21, (uint64_t)buf);
  if (v18 < 0)
  {
    operator delete(v17[0]);
    if (v8) {
      goto LABEL_25;
    }
  }

  else if (v8)
  {
    goto LABEL_25;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1705;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Joiner_RSSI_Histogram stats",  buf,  0x12u);
  }

LABEL_25:
  sub_1000BEC60();
  any v11 = self->_CtrInternalClientPtr;
  sub_10000AC00(v15, "vendor:linkloss:counters");
  if (v11) {
    -[CtrInternalClient setProperty:property_val:](v11, "setProperty:property_val:", v15, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v12 = *sub_1000E4898(&v21, (uint64_t)buf);
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (v12) {
      goto LABEL_37;
    }
  }

  else if (v12)
  {
    goto LABEL_37;
  }

  xpc_object_t v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1712;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDVendor_Link_Loss_Counters stats",  buf,  0x12u);
  }

LABEL_37:
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }
}

- (void)checkAndResetFrameCounterDuplicates
{
  uint64_t v11 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v7, "Thread:FrameCounter:DuplicateDetectedFlag");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v7, &v11);
    BOOL v3 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(v10) < 0) {
      operator delete(__p[1]);
    }
  }

  else
  {
    *(_OWORD *)__p = 0u;
    __int128 v10 = 0u;
    BOOL v3 = 1;
  }

  if (v8 < 0)
  {
    operator delete(v7[0]);
    if (v3) {
      goto LABEL_7;
    }
LABEL_11:
    int v6 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    xpc_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EC858();
    }
    goto LABEL_13;
  }

  if (!v3) {
    goto LABEL_11;
  }
LABEL_7:
  if (!sub_1001478B8(&v11)) {
    goto LABEL_14;
  }
  int v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  xpc_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001EC7E4();
  }
LABEL_13:

LABEL_14:
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
  }
}

- (void)getAllTrelMetrics
{
  int v29 = 0;
  *(_OWORD *)id v30 = *(_OWORD *)buf;
  uint64_t v31 = *(void *)&buf[16];
  uint64_t v27 = 0LL;
  id v28 = xpc_null_create();
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    int v6 = &mVendorVersion;
  }
  else {
    int v6 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:Counter:TrelLink");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v27);
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *sub_1000E4898(&v29, (uint64_t)buf);
  if (v26 < 0)
  {
    operator delete(__p[0]);
    if (v9)
    {
LABEL_14:
      __int128 v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllTrelMetrics]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1768;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s:%d: Failed to get kWPANTUNDProperty_NCPCounterAllTrel Property",  buf,  0x12u);
      }

      goto LABEL_24;
    }
  }

  else if (v9)
  {
    goto LABEL_14;
  }

  uint64_t v12 = v27;
  if (v27) {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 24LL))(v27);
  }
  uint64_t v24 = v12;
  v13.var0 = (placeholder *)&v24;
  convert_ValMap_to_xpc_object(v13, "NCP:Counter:TrelLink", "PropGet", (xpc_object_t *)buf);
  id v14 = *(id *)buf;
  xpc_object_t v15 = xpc_null_create();

  id v16 = v28;
  id v28 = v14;

  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
  }
  xpc_object_t v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllTrelMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1752;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPCounterAllTrel Property",  buf,  0x12u);
  }

  *(void *)__int128 buf = &v28;
  *(void *)&buf[8] = "value";
  xpc_object_t v19 = sub_1000A9F60((uint64_t)buf);
  char v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  sub_1000C9A78(v20, v3);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001D052C;
  v22[3] = &unk_1002B2158;
  uint64_t v23 = v3;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneTRELLinkCounters", v22);
  -[ThreadNetworkManagerInstance resetTrelLinkMetrics](self, "resetTrelLinkMetrics");
  -[ThreadNetworkManagerInstance resetTrelNeighborMetrics](self, "resetTrelNeighborMetrics");
  uint64_t v11 = v23;
LABEL_24:

  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8LL))(v27);
  }
  id v21 = v28;
  id v28 = 0LL;

  if (SHIBYTE(v31) < 0) {
    operator delete(v30[0]);
  }
}

- (void)resetTrelLinkMetrics
{
  int v9 = 0;
  *(_OWORD *)__int128 v10 = *(_OWORD *)__p;
  uint64_t v11 = __p[2];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v7, "NCP:Counter:TrelLink");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v7, "0");
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *sub_1000E4898(&v9, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v8 < 0)
  {
    operator delete(v7[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  xpc_object_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance resetTrelLinkMetrics]";
    WORD2(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 6) = 1778;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllTrel stats",  (uint8_t *)__p,  0x12u);
  }

LABEL_13:
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
}

- (void)resetTrelNeighborMetrics
{
  int v9 = 0;
  *(_OWORD *)__int128 v10 = *(_OWORD *)__p;
  uint64_t v11 = __p[2];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v7, "NCP:Counter:Thread:Neighbor:TrelStats");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v7, "0");
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *sub_1000E4898(&v9, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v8 < 0)
  {
    operator delete(v7[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  xpc_object_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance resetTrelNeighborMetrics]";
    WORD2(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 6) = 1788;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllNeighborTrelStats stats",  (uint8_t *)__p,  0x12u);
  }

LABEL_13:
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
}

- (void)getPowerMetrics
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    int v6 = &mVendorVersion;
  }
  else {
    int v6 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  sub_1000D1D40(v3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001D0B08;
  v20[3] = &unk_1002B2158;
  id v8 = v3;
  id v21 = v8;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstonePowerMetricsCounters", v20);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    __int128 v10 = &mDaemonVersion;
  }
  else {
    __int128 v10 = (uint64_t *)mDaemonVersion;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  [v9 setObject:v11 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    uint64_t v12 = &mVendorVersion;
  }
  else {
    uint64_t v12 = (uint64_t *)mVendorVersion;
  }
  any v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
  [v9 setObject:v13 forKey:@"header_vendor_version"];

  sub_1000D1C68(v9);
  xpc_object_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  xpc_object_t v17 = sub_1001D0B10;
  char v18 = &unk_1002B2158;
  id v14 = v9;
  id v19 = v14;
  AnalyticsSendExplodingEventLazy(@"com.apple.Flagstone.flagstonePowerMetricsHist", &v15);

  -[ThreadNetworkManagerInstance resetPowerMetrics](self, "resetPowerMetrics", v15, v16, v17, v18);
}

- (void)resetPowerMetrics
{
  v2 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    xpc_object_t v5 = "-[ThreadNetworkManagerInstance resetPowerMetrics]";
    __int16 v6 = 1024;
    int v7 = 1833;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Reset Power Metrics", (uint8_t *)&v4, 0x12u);
  }

  sub_1000D1DC0();
}

- (void)getTopologyMetrics
{
  xpc_object_t v2 = v10[0];
  int v3 = v11;
  xpc_object_t v4 = xpc_null_create();
  v10[0] = v4;
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    __int16 v6 = &mDaemonVersion;
  }
  else {
    __int16 v6 = (uint64_t *)mDaemonVersion;
  }
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  [v5 setObject:v7 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    id v8 = &mVendorVersion;
  }
  else {
    id v8 = (uint64_t *)mVendorVersion;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  [v5 setObject:v9 forKey:@"header_vendor_version"];

  if (v3 < 0) {
    operator delete(v2);
  }
}

- (void)resetTopologyMetrics
{
  if (v3 < 0) {
    operator delete(__p);
  }
}

- (void)updateInternalDBForTriggerBasedMetrics:(dict *)a3 isTriggerBased:(BOOL)a4 triggerType:(int)a5 triggerId:(int)a6
{
  BOOL v8 = a4;
  sub_10000AC00(buf, "Command error");
  int v107 = 0;
  __int128 v108 = *(_OWORD *)buf;
  uint64_t v109 = *(void *)&buf[16];
  id v106 = xpc_null_create();
  uint64_t v104 = 0LL;
  id v105 = xpc_null_create();
  xpc_object_t v78 = xpc_null_create();
  v103[3] = v78;
  xpc_object_t v77 = xpc_null_create();
  v103[1] = 0LL;
  v103[2] = v77;
  uint64_t v102 = v103;
  v103[0] = 0LL;
  v101[0] = 0LL;
  v101[1] = 0LL;
  v100 = v101;
  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
  if (self->_lastKnownNCPState != 8)
  {
    if (!v8) {
      goto LABEL_84;
    }
    xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sub_1000CA200(a5, v98);
    sub_1000CA1D0(a6, v96);
    int v18 = v99;
    id v19 = (void **)v98[0];
    NSStringEncoding v20 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
    if (v18 >= 0) {
      id v21 = v98;
    }
    else {
      id v21 = v19;
    }
    any v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  v20));
    int v23 = v97;
    uint64_t v24 = (void **)v96[0];
    NSStringEncoding v25 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
    if (v23 >= 0) {
      char v26 = v96;
    }
    else {
      char v26 = v24;
    }
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  v25));
    if (byte_1002C9DAF >= 0) {
      id v28 = &mDaemonVersion;
    }
    else {
      id v28 = (uint64_t *)mDaemonVersion;
    }
    int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v28));
    [v17 setObject:v29 forKey:@"header_daemon_version"];

    if (byte_1002C9DC7 >= 0) {
      id v30 = &mVendorVersion;
    }
    else {
      id v30 = (uint64_t *)mVendorVersion;
    }
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v30));
    [v17 setObject:v31 forKey:@"header_vendor_version"];

    sub_1000B5130(self->_lastKnownNCPState, buf);
    int v32 = (char)buf[23];
    xpc_object_t v33 = *(uint8_t **)buf;
    NSStringEncoding v34 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
    if (v32 >= 0) {
      uint64_t v35 = buf;
    }
    else {
      uint64_t v35 = v33;
    }
    int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  v34));
    [v17 setObject:v36 forKey:@"thread_nw_state"];
    [v17 setObject:v22 forKey:@"trigger_type"];
    [v17 setObject:v27 forKey:@"trigger_identifier"];
    uint64_t v37 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    any v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      sub_1000B5130(self->_lastKnownNCPState, v94);
      uint64_t v76 = v95 >= 0 ? v94 : (void **)v94[0];
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = v76;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "updateInternalDBForTriggerBasedMetrics NCPState:%s is not associated. Return here. triggerType=%@, triggerId=%@ ",  buf,  0x20u);
      if (v95 < 0) {
        operator delete(v94[0]);
      }
    }

    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472LL;
    v92[2] = sub_1001D1988;
    v92[3] = &unk_1002B2158;
    id v79 = v17;
    id v93 = v79;
    AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneTriggerBasedStateInfo", v92);

    if (v97 < 0) {
      operator delete(v96[0]);
    }
    if (v99 < 0) {
      operator delete(v98[0]);
    }
    goto LABEL_83;
  }

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v88, "UpdateLeaderInfo");
  -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v88, "1");
  if (v91 < 0) {
    operator delete(__p);
  }
  if (v89 < 0) {
    operator delete(v88[0]);
  }
  id v79 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    uint64_t v12 = &mDaemonVersion;
  }
  else {
    uint64_t v12 = (uint64_t *)mDaemonVersion;
  }
  any v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
  [v79 setObject:v13 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    id v14 = &mVendorVersion;
  }
  else {
    id v14 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  [v79 setObject:v15 forKey:@"header_vendor_version"];

  uint64_t v16 = self->_CtrInternalClientPtr;
  sub_10000AC00(v86, "NCP:Counter:Thread:MleAndIPv6:TriggerBased");
  if (v16) {
    -[CtrInternalClient getProperty:output:](v16, "getProperty:output:", v86, &v104);
  }
  else {
    memset(buf, 0, 32);
  }
  int v39 = *sub_1000E4898(&v107, (uint64_t)buf);
  if (v87 < 0)
  {
    operator delete(v86[0]);
    if (v39) {
      goto LABEL_59;
    }
  }

  else if (v39)
  {
    goto LABEL_59;
  }

  uint64_t v40 = v104;
  if (v104) {
    uint64_t v40 = (*(uint64_t (**)(uint64_t))(*(void *)v104 + 24LL))(v104);
  }
  uint64_t v85 = v40;
  v41.var0 = (placeholder *)&v85;
  convert_ValMap_to_xpc_object(v41, "NCP:Counter:Thread:MleAndIPv6:TriggerBased", "PropGet", (xpc_object_t *)buf);
  id v42 = *(id *)buf;
  xpc_object_t v43 = xpc_null_create();

  id v44 = v106;
  id v106 = v42;

  if (v85) {
    (*(void (**)(uint64_t))(*(void *)v85 + 8LL))(v85);
  }
  id v45 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForTriggerBasedMetrics:isTriggerBased:triggerType:triggerId:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1946;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "%s:%d: kWPANTUNDProperty_NCPCounterAllMleAndIPv6TriggerBased Property",  buf,  0x12u);
  }

  id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (byte_1002C9DAF >= 0) {
    uint64_t v48 = &mDaemonVersion;
  }
  else {
    uint64_t v48 = (uint64_t *)mDaemonVersion;
  }
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v48));
  [v47 setObject:v49 forKey:@"header_daemon_version"];

  if (byte_1002C9DC7 >= 0) {
    id v50 = &mVendorVersion;
  }
  else {
    id v50 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v50));
  [v47 setObject:v51 forKey:@"header_vendor_version"];

  v98[0] = &v106;
  v98[1] = "value";
  xpc_object_t v52 = sub_1000A9F60((uint64_t)v98);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  sub_1000CD28C(v47, v53, v8, a5, a6, self->_lastIsLeaderThirdParty, (uint64_t)buf);
  sub_100144CF0((uint64_t)&v102, buf);
  sub_10000D448((uint64_t)buf);

  sub_1000738CC(&v84, (uint64_t *)&v102);
  v54.var0 = (placeholder *)&v84;
  convert_ValMap_to_xpc_object(v54, "NCP:Counter:Thread:MleAndIPv6:TriggerBased", "PropGet", (xpc_object_t *)buf);
  id v55 = *(id *)buf;
  xpc_object_t v56 = xpc_null_create();

  id v57 = v105;
  id v105 = v55;

  if (v84) {
    (*(void (**)(uint64_t))(*(void *)v84 + 8LL))(v84);
  }

LABEL_59:
  id v58 = sub_1000EA704(&a3->var0.var0);
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  id v60 = sub_1000EA704(&v106);
  char v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  xpc_dictionary_set_value(v59, "currOutput", v61);

  id v62 = sub_1000EA704(&a3->var0.var0);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  id v64 = sub_1000EA704(&v105);
  char v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  xpc_dictionary_set_value(v63, "prevOutput", v65);

  uint64_t v66 = self->_CtrInternalClientPtr;
  sub_10000AC00(v82, "cametrics_triggerbased_stability_data");
  if (v66) {
    -[CtrInternalClient setProperty:property_val:](v66, "setProperty:property_val:", v82, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v67 = *sub_1000E4898(&v107, (uint64_t)buf);
  if (v83 < 0)
  {
    operator delete(v82[0]);
    if (v67) {
      goto LABEL_71;
    }
  }

  else if (v67)
  {
    goto LABEL_71;
  }

  int v68 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  __int128 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_1001EC940();
  }

LABEL_71:
  uint64_t v70 = self->_CtrInternalClientPtr;
  sub_10000AC00(v80, "NCP:Counter:Thread:MleAndIPv6:TriggerBased");
  if (v70) {
    -[CtrInternalClient setProperty:property_val:](v70, "setProperty:property_val:", v80, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v71 = *sub_1000E4898(&v107, (uint64_t)buf);
  if (v81 < 0)
  {
    operator delete(v80[0]);
    if (!v71)
    {
LABEL_80:
      id v72 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      xpc_object_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        sub_1001EC8CC();
      }
    }
  }

  else if (!v71)
  {
    goto LABEL_80;
  }

- (void)configureRecoveryTimer
{
  char v3 = (dispatch_queue_s *)FrameCounterRecoveryQ;
  if (!FrameCounterRecoveryQ)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    xpc_object_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("TNM.SR.FrameCounterRecoveryQ", v5);
    int v7 = (void *)FrameCounterRecoveryQ;
    FrameCounterRecoveryQ = (uint64_t)v6;

    BOOL v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created FrameCounterRecoveryQ \n", buf, 2u);
    }

    char v3 = (dispatch_queue_s *)FrameCounterRecoveryQ;
  }

  if (FrameCounterRecoveryTimer) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v3 == 0LL;
  }
  if (!v10)
  {
    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
    uint64_t v12 = (void *)FrameCounterRecoveryTimer;
    FrameCounterRecoveryTimer = (uint64_t)v11;

    dispatch_time_t v13 = dispatch_time(0LL, 3603000000000LL);
    dispatch_source_set_timer((dispatch_source_t)FrameCounterRecoveryTimer, v13, 0x346E388FE00uLL, 0LL);
    id v14 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    xpc_object_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v18 = 3603;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Created Periodic FRAME_COUNTER_RECOVERY_TIMER = [%d]sec \n",  buf,  8u);
    }

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001D1B90;
    handler[3] = &unk_1002B5570;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)FrameCounterRecoveryTimer, handler);
    dispatch_activate((dispatch_object_t)FrameCounterRecoveryTimer);
  }

- (void)configureAndPostPeriodStats
{
  char v3 = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v4 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.metrics.threadradiod");
  -[NSBackgroundActivityScheduler setRepeats:](v4, "setRepeats:", 1LL);
  -[NSBackgroundActivityScheduler setInterval:](v4, "setInterval:", 3603.0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001D1D78;
  v6[3] = &unk_1002B5908;
  xpc_object_t v5 = v4;
  int v7 = v5;
  BOOL v8 = self;
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v5, "scheduleWithBlock:", v6);

  objc_autoreleasePoolPop(v3);
}

- (void)getDaemonAndVendorVersions
{
  int v17 = 0;
  *(_OWORD *)int v18 = *(_OWORD *)buf;
  uint64_t v19 = *(void *)&buf[16];
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "DaemonMorty:Version");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v16);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  int v4 = *sub_1000E4898(&v17, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    goto LABEL_13;
  }

  xpc_object_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getDaemonAndVendorVersions]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2184;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Failed to get kWPANTUNDProperty_DaemonMortyVersion Property",  buf,  0x12u);
  }

LABEL_13:
  sub_100147B4C(&v16, (std::string *)buf);
  sub_100014D08((uint64_t)&mDaemonVersion, (__int128 *)buf);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  int v7 = self->_CtrInternalClientPtr;
  sub_10000AC00(v11, "vendor:version");
  if (v7) {
    -[CtrInternalClient getProperty:output:](v7, "getProperty:output:", v11, &v15);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  int v8 = *sub_1000E4898(&v17, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v12 < 0)
  {
    operator delete(v11[0]);
    if (v8) {
      goto LABEL_27;
    }
  }

  else if (v8)
  {
    goto LABEL_27;
  }

  int v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getDaemonAndVendorVersions]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2189;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Failed to get kWPANTUNDVendor_Version Property",  buf,  0x12u);
  }

LABEL_27:
  sub_100147B4C(&v15, (std::string *)buf);
  sub_100014D08((uint64_t)&mVendorVersion, (__int128 *)buf);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8LL))(v15);
  }
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
  }
  if (SHIBYTE(v19) < 0) {
    operator delete(v18[0]);
  }
}

- (int)initializeKeyChainStore
{
  keyChainStore = self->_keyChainStore;
  if (!keyChainStore)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore]( &OBJC_CLASS___THThreadNetworkCredentialsKeychainBackingStore,  "defaultBackingStore"));
    xpc_object_t v5 = -[THThreadNetworkCredentialsStoreLocalClient initApplePrivateStoreWithBackingStore:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreLocalClient),  "initApplePrivateStoreWithBackingStore:",  v4);
    dispatch_queue_t v6 = self->_keyChainStore;
    self->_keyChainStore = v5;

    keyChainStore = self->_keyChainStore;
  }

  return keyChainStore == 0LL;
}

- (int)retrieveActiveDataSetRecordForUniqueId:(const char *)a3 record:(id *)a4
{
  uint64_t v64 = 0LL;
  char v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  int v67 = 1;
  uint64_t v58 = 0LL;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  char v61 = sub_1001D2DCC;
  id v62 = sub_1001D2DDC;
  id v63 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  id v55 = sub_1001D2DCC;
  xpc_object_t v56 = sub_1001D2DDC;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = sub_1001D2DCC;
  id v50 = sub_1001D2DDC;
  id v51 = 0LL;
  if (!self->_keyChainStore)
  {
    char v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1001ECA08(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_15;
  }

  if (!a3)
  {
    uint64_t v35 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1001ECA78();
    }
LABEL_15:

    dispatch_queue_t v6 = 0LL;
    goto LABEL_16;
  }

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  int v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  int v8 = (void *)v59[5];
  v59[5] = (uint64_t)v7;

  if (v59[5])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    BOOL v10 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    dispatch_source_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v59[5];
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v69 = "-[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]";
      __int16 v70 = 2112;
      uint64_t v71 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s: NSUUID :  unique Network Id is %@",  buf,  0x16u);
    }

    keyChainStore = self->_keyChainStore;
    uint64_t v14 = v59[5];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1001D2DE4;
    v40[3] = &unk_1002B5930;
    id v42 = &v58;
    xpc_object_t v43 = &v46;
    id v44 = &v64;
    id v45 = &v52;
    uint64_t v15 = v9;
    any v41 = v15;
    -[THThreadNetworkCredentialsStoreLocalClient retrieveActiveDataSetRecordWithUniqueIdentifier:completion:]( keyChainStore,  "retrieveActiveDataSetRecordWithUniqueIdentifier:completion:",  v14,  v40);
    dispatch_time_t v16 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v15, v16))
    {
      int v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001ECB68(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    else if (!v53[5])
    {
      *a4 = (id) v47[5];
      int v36 = *((_DWORD *)v65 + 6);
      goto LABEL_22;
    }

    int v36 = 1;
    *((_DWORD *)v65 + 6) = 1;
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v37 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  any v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_1001ECAEC();
  }

LABEL_16:
  int v36 = *((_DWORD *)v65 + 6);
LABEL_23:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v36;
}

- (int)retrieveCredentialsForUniqueId:(const char *)a3 credentialsRecord_t:(id *)a4
{
  uint64_t v64 = 0LL;
  char v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  int v67 = 1;
  uint64_t v58 = 0LL;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  char v61 = sub_1001D2DCC;
  id v62 = sub_1001D2DDC;
  id v63 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  id v55 = sub_1001D2DCC;
  xpc_object_t v56 = sub_1001D2DDC;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = sub_1001D2DCC;
  id v50 = sub_1001D2DDC;
  id v51 = 0LL;
  if (!self->_keyChainStore)
  {
    char v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1001ECC48(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_15;
  }

  if (!a3)
  {
    uint64_t v35 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1001ECCB8();
    }
LABEL_15:

    dispatch_queue_t v6 = 0LL;
    goto LABEL_16;
  }

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  int v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  int v8 = (void *)v59[5];
  v59[5] = (uint64_t)v7;

  if (v59[5])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    BOOL v10 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    dispatch_source_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v59[5];
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v69 = "-[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:]";
      __int16 v70 = 2112;
      uint64_t v71 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s: NSUUID :  unique Network Id is %@",  buf,  0x16u);
    }

    keyChainStore = self->_keyChainStore;
    uint64_t v14 = v59[5];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1001D33FC;
    v40[3] = &unk_1002B5958;
    id v42 = &v58;
    xpc_object_t v43 = &v46;
    id v44 = &v64;
    id v45 = &v52;
    uint64_t v15 = v9;
    any v41 = v15;
    -[THThreadNetworkCredentialsStoreLocalClient retrieveRecordWithUniqueIdentifier:completion:]( keyChainStore,  "retrieveRecordWithUniqueIdentifier:completion:",  v14,  v40);
    dispatch_time_t v16 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v15, v16))
    {
      int v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001ECDA8(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    else if (!v53[5])
    {
      *a4 = (id) v47[5];
      int v36 = *((_DWORD *)v65 + 6);
      goto LABEL_22;
    }

    int v36 = 1;
    *((_DWORD *)v65 + 6) = 1;
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v37 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  any v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_1001ECD2C();
  }

LABEL_16:
  int v36 = *((_DWORD *)v65 + 6);
LABEL_23:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v36;
}

- (BOOL)validateDataSetTLVs:(id)a3
{
  uint64_t v4 = 0LL;
  return -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:](self, "validateDataSetTLVs:creds:", a3, &v4);
}

- (BOOL)validateDataSetTLVs:(id)a3 creds:(id *)a4
{
  id v128 = a3;
  uint64_t v4 = [v128 bytes];
  unsigned int v5 = [v128 length];
  dispatch_queue_t v6 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001ED88C();
  }

  sub_100159A78((unint64_t)v4, v5, v138, 0x3E8uLL, 0);
  int v8 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  dispatch_semaphore_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001ED800((uint64_t)v138, v9, v10);
  }

  if (!v5)
  {
    LOBYTE(v11) = 0;
    uint64_t v131 = 0LL;
    v132 = 0LL;
    char v129 = 0LL;
    uint64_t v130 = 0LL;
    char v133 = 0LL;
LABEL_82:
    if (v133 && v129 && v132 && v131 && v130 && (_BYTE)v11)
    {
      xpc_object_t v56 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_1001ECF64();
      }

      LOBYTE(v124) = 1;
      uint64_t v58 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials),  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  v132,  0LL,  v131,  v11,  v130,  0LL,  0LL,  v124);
      if (v58)
      {
        uint64_t v59 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          sub_1001ECEF4();
        }

        id v61 = [[THThreadNetwork alloc] initWithName:v133 extendedPANID:v129];
        if (v61)
        {
          id v62 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsDataSet),  "initWithDataSetArray:userInfo:",  v128,  0LL);
          if (v62)
          {
            id v63 = v62;
            id v64 = objc_alloc(&OBJC_CLASS___THThreadNetworkBorderAgent);
            id UUIDAsStr = getUUIDAsStr();
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(UUIDAsStr);
            int v67 = (void *)objc_claimAutoreleasedReturnValue([v66 substringToIndex:16]);
            int v68 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance dataFromHexString:](self, "dataFromHexString:", v67));
            id v69 = [v64 initWithBaDiscrId:v68];

            if (v69)
            {
              __int16 v70 =  -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord),  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup: creationDate:lastModificationDate:",  v69,  v63,  v61,  v58,  0LL,  @"000000000000",  0LL,  0LL);
              *a4 = v70;
              if (v70)
              {
                uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord credentials](v70, "credentials"));
                [v71 setIsActiveDevice:1];

                id v72 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsDataSet);
                uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue([*a4 credentialsDataSet]);
                uint64_t v73 = objc_claimAutoreleasedReturnValue([v126 dataSetArray]);
                id v74 = (void *)objc_claimAutoreleasedReturnValue([*a4 credentials]);
                id v75 = (void *)objc_claimAutoreleasedReturnValue([v74 userInfo]);
                uint64_t v76 = (void *)v73;
                xpc_object_t v77 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]( v72,  "initWithDataSetArray:userInfo:",  v73,  v75);
                xpc_object_t v78 = (void *)objc_claimAutoreleasedReturnValue([*a4 credentials]);
                [v78 setCredentialsDataSet:v77];

                BOOL v79 = 1;
LABEL_150:

                return v79;
              }

              char v95 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
              id v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
                sub_1001ECEC8();
              }
            }

            else
            {
              id v93 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
              uint64_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
                sub_1001ECE9C();
              }
            }
          }

          else
          {
            char v91 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
            uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
              sub_1001ECE70();
            }
          }
        }

        else
        {
          uint64_t v85 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
          uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
            sub_1001ECE44();
          }
        }
      }

      else
      {
        uint64_t v84 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        uint64_t v58 = (THThreadNetworkCredentials *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          sub_1001ECE18();
        }
      }
    }

    else
    {
      id v80 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint64_t v58 = (THThreadNetworkCredentials *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_1001ECFD8();
      }
    }

- (int)howToGetOnTheNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  if (_os_feature_enabled_impl("Home", "ThreadCommissioningService"))
  {
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
    if (v6)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedPANID]);
      if (v7)
      {
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 credentialsDataSet]);
        dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataSetArray]);

        if (v9)
        {
          int v10 = 7;
          goto LABEL_21;
        }
      }

      else
      {
      }
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 masterKey]);
  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 PANID]);
    if (v12
      && [v5 channel] != 255
      && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName])) != 0)
    {
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedPANID]);

      if (v14)
      {
        int v10 = 0;
        goto LABEL_21;
      }
    }

    else
    {
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 passPhrase]);
  if (!v15)
  {
LABEL_20:
    int v10 = 8;
    goto LABEL_21;
  }

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  if (!v16)
  {

    goto LABEL_20;
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedPANID]);

  if (v17) {
    int v10 = 2;
  }
  else {
    int v10 = 8;
  }
LABEL_21:

  return v10;
}

- (int)howToStartThreadNetwork:(const char *)a3 credentialsRecord_t:(id *)a4
{
  int v7 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_semaphore_t v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      unsigned int v27 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
      __int16 v28 = 2080;
      uint64_t v29 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: unique Network Id is %s",  (uint8_t *)&v26,  0x16u);
    }

    if (-[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]( self,  "retrieveActiveDataSetRecordForUniqueId:record:",  a3,  a4))
    {
      int v10 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001ED970((uint64_t)a3, v11, v12);
      }

      return 8;
    }

    else
    {
      sub_1001D5710(*a4);
      if (-[ThreadNetworkManagerInstance alreadyOnTheSameNetwork:](self, "alreadyOnTheSameNetwork:", *a4))
      {
        uint64_t v21 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315394;
          unsigned int v27 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
          __int16 v28 = 2080;
          uint64_t v29 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s: Already on the same network %s",  (uint8_t *)&v26,  0x16u);
        }

        int v13 = 5;
      }

      else
      {
        int v13 = -[ThreadNetworkManagerInstance howToGetOnTheNetwork:](self, "howToGetOnTheNetwork:", *a4);
      }

      uint64_t v23 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint32_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315394;
        unsigned int v27 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
        __int16 v28 = 1024;
        LODWORD(v29) = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: ret is  %d", (uint8_t *)&v26, 0x12u);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001ED900(v9, v14, v15, v16, v17, v18, v19, v20);
    }

    -[ThreadNetworkManagerInstance threadLeave](self, "threadLeave");
    else {
      return 1;
    }
  }

  return v13;
}

- (BOOL)alreadyOnTheSameNetwork:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    sub_1000B5130(self->_lastKnownNCPState, __p);
    int v7 = v25 >= 0 ? __p : *(_BYTE **)__p;
    *(_DWORD *)__int128 buf = 136315394;
    unsigned int v27 = "-[ThreadNetworkManagerInstance alreadyOnTheSameNetwork:]";
    __int16 v28 = 2080;
    uint64_t v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: called in state %s", buf, 0x16u);
    if (v25 < 0) {
      operator delete(*(void **)__p);
    }
  }

  if (self->_lastKnownNCPState == 4)
  {
    -[CtrInternalClient reset:](self->_CtrInternalClientPtr, "reset:", 0LL);
    if (v21 < 0) {
      operator delete(v20);
    }
    sleep(5u);
LABEL_18:
    BOOL v13 = 0;
    goto LABEL_19;
  }

  if (!-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:](self, "isCurrentNetworkSameAsOneToStart:", v4))
  {
    uint64_t v14 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      id v17 = objc_claimAutoreleasedReturnValue([v16 networkName]);
      id v18 = [v17 UTF8String];
      *(_DWORD *)__p = 136315138;
      *(void *)&__p[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Not on the same network ID : %s", __p, 0xCu);
    }

    -[ThreadNetworkManagerInstance threadLeave](self, "threadLeave");
    goto LABEL_18;
  }

  int v8 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  dispatch_semaphore_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    id v11 = objc_claimAutoreleasedReturnValue([v10 networkName]);
    id v12 = [v11 UTF8String];
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance alreadyOnTheSameNetwork:]";
    __int16 v23 = 2080;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : Already joined on the same network : Unique ID : %s",  __p,  0x16u);
  }

  BOOL v13 = 1;
LABEL_19:

  return v13;
}

- (void)deleteCurrentNetwork:(id)a3
{
  id v5 = a3;
  uint64_t v37 = 0LL;
  any v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  uint64_t v40 = sub_1001D2DCC;
  any v41 = sub_1001D2DDC;
  id v42 = 0LL;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    uint64_t v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    uint64_t v33 = sub_1001D6DB8;
    uint64_t v34 = &unk_1002B5980;
    uint64_t v36 = &v37;
    int v8 = v6;
    uint64_t v35 = v8;
    -[THThreadNetworkCredentialsStoreLocalClient deleteActiveDataSetRecordForThreadBorderAgent:completion:]( keyChainStore,  "deleteActiveDataSetRecordForThreadBorderAgent:completion:",  v5,  &v31);
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      int v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001EDA5C(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    else
    {
      if (!v38[5])
      {
LABEL_10:

        goto LABEL_11;
      }

      unsigned int v27 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v28 = objc_claimAutoreleasedReturnValue(objc_msgSend( (id) v38[5], "description", v31, v32, v33, v34));
        id v29 = [v28 UTF8String];
        if (v29)
        {
          id v3 = objc_claimAutoreleasedReturnValue([(id) v38[5] description]);
          uint64_t v30 = (const char *)[v3 UTF8String];
        }

        else
        {
          uint64_t v30 = "(unknown error)";
        }

        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v44 = "-[ThreadNetworkManagerInstance deleteCurrentNetwork:]";
        __int16 v45 = 2080;
        uint64_t v46 = v30;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s : Error: failed to delete (%s)\n",  buf,  0x16u);
        if (v29) {
      }
        }
    }

    goto LABEL_10;
  }

  uint64_t v19 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_1001ED9EC((os_log_s *)v8, v20, v21, v22, v23, v24, v25, v26);
  }
LABEL_11:

  _Block_object_dispose(&v37, 8);
}

- (int)updatePrimaryResident:(const char *)a3 isPrimaryResident:(BOOL)a4 isPrimaryResidentThreadCapable:(BOOL)a5
{
  int v19 = 3;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)__p;
  uint64_t v21 = v18;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v14[0] = a4;
  v14[1] = a5;
  uint64_t v15 = a3;
  uint64_t v16 = 0LL;
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient updatePrimaryResident:](CtrInternalClientPtr, "updatePrimaryResident:", v14);
  }

  else
  {
    *(_OWORD *)__p = 0u;
    __int128 v18 = 0u;
  }

  sub_1000E4898(&v19, (uint64_t)__p);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[1]);
  }
  if (v19)
  {
    int v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001EDACC();
    }

    int v12 = 1;
  }

  else
  {
    int v12 = 0;
  }

  if (SHIBYTE(v21) < 0) {
    operator delete(v20[0]);
  }
  return v12;
}

- (int)threadLeave
{
  id v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000B5130(self->_lastKnownNCPState, __p);
    id v5 = v11 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v13 = "-[ThreadNetworkManagerInstance threadLeave]";
    __int16 v14 = 2080;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Cmd received in state %s", buf, 0x16u);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }

  -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
  if (v9 < 0) {
    operator delete(v8);
  }
  sleep(2u);
  lastKnownJoinedNetworkRecord = self->_lastKnownJoinedNetworkRecord;
  self->_lastKnownJoinedNetworkRecord = 0LL;

  return 0;
}

- (int)threadStart:(const char *)a3 output:(dict *)a4
{
  int v7 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Cmd received in state %d", buf, 0x12u);
  }

  int v10 = -[ThreadNetworkManagerInstance initializeKeyChainStore](self, "initializeKeyChainStore");
  if (v10)
  {
    char v11 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001EDB6C();
    }
    id v13 = 0LL;
    goto LABEL_7;
  }

  if (_os_feature_enabled_impl("Home", "ThreadCommissioningService"))
  {
    if ((isNetworkConnected() & 1) == 0)
    {
      uint64_t v22 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001EDB40();
      }
      id v13 = 0LL;
      int v10 = 1;
      goto LABEL_7;
    }

    if (!-[ThreadNetworkManagerInstance checkPreferredAndJoin:](self, "checkPreferredAndJoin:", a4))
    {
      uint64_t v25 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3189;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s : %d :  Joined the Preferred Network\n",  buf,  0x12u);
      }

      id v13 = 0LL;
      int v10 = 0;
      goto LABEL_7;
    }

    id v37 = 0LL;
    unsigned int v15 = -[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]( self,  "howToStartThreadNetwork:credentialsRecord_t:",  a3,  &v37);
    id v16 = v37;
    id v13 = v16;
    int v10 = 1;
    switch(v15)
    {
      case 0u:
        unsigned int v24 = -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]( self,  "formNetworkWithCreds:credentialsRecord_t:output:",  a3,  v16,  a4);
        goto LABEL_32;
      case 1u:
      case 2u:
      case 3u:
        sub_1001BF91C(&v34, &a4->var0.var0);
        int v10 = -[ThreadNetworkManagerInstance formNewNetwork:](self, "formNewNetwork:", &v34);
        uint64_t v17 = v34;
        uint64_t v34 = 0LL;

        int v12 = (os_log_s *)v34;
        goto LABEL_7;
      case 5u:
        xpc_object_t v26 = xpc_string_create(a3);
        xpc_object_t v35 = v26;
        if (!v26) {
          xpc_object_t v35 = xpc_null_create();
        }

        *(void *)__int128 buf = a4;
        *(void *)&buf[8] = "outputUniqueNetworkId";
        sub_1000089EC((uint64_t)buf, &v35, &v36);
        xpc_object_t v27 = v36;
        xpc_object_t v36 = 0LL;

        xpc_object_t v28 = v35;
        xpc_object_t v35 = 0LL;

        int v10 = 0;
        int v12 = (os_log_s *)v35;
        goto LABEL_7;
      case 7u:
        int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
        id v29 = objc_claimAutoreleasedReturnValue(-[os_log_s UUIDString](v12, "UUIDString"));
        int v10 = -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]( self,  "formNetworkWithAOD:record:output:",  [v29 UTF8String],  v13,  a4);

        goto LABEL_7;
      default:
        break;
    }
  }

  else
  {
    id v33 = 0LL;
    unsigned int v18 = -[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]( self,  "howToStartThreadNetwork:credentialsRecord_t:",  a3,  &v33);
    id v13 = v33;
    if (v18 - 1 < 2)
    {
      sub_1001BF91C(&v30, &a4->var0.var0);
      int v10 = -[ThreadNetworkManagerInstance formNewNetwork:](self, "formNewNetwork:", &v30);
      uint64_t v23 = v30;
      uint64_t v30 = 0LL;

      int v12 = (os_log_s *)v30;
LABEL_7:

      goto LABEL_8;
    }

    if (v18)
    {
      if (v18 != 5)
      {
        int v10 = 1;
        goto LABEL_8;
      }

      xpc_object_t v19 = xpc_string_create(a3);
      xpc_object_t v31 = v19;
      if (!v19) {
        xpc_object_t v31 = xpc_null_create();
      }

      *(void *)__int128 buf = a4;
      *(void *)&buf[8] = "outputUniqueNetworkId";
      sub_1000089EC((uint64_t)buf, &v31, &v32);
      xpc_object_t v20 = v32;
      xpc_object_t v32 = 0LL;

      xpc_object_t v21 = v31;
      xpc_object_t v31 = 0LL;

      int v10 = 0;
      int v12 = (os_log_s *)v31;
      goto LABEL_7;
    }

    if (-[ThreadNetworkManagerInstance attachWithAllCreds:credentialsRecord_t:output:]( self,  "attachWithAllCreds:credentialsRecord_t:output:",  a3,  v13,  a4))
    {
      unsigned int v24 = -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]( self,  "formNetworkWithCreds:credentialsRecord_t:output:",  a3,  v13,  a4);
LABEL_32:
      int v10 = v24;
    }

    else
    {
      int v10 = 0;
    }
  }

- (int)deleteCredentialsForThisNetwork:(id)a3
{
  id v5 = a3;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = sub_1001D2DCC;
  xpc_object_t v43 = sub_1001D2DDC;
  id v44 = 0LL;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    id v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472LL;
    xpc_object_t v35 = sub_1001D7940;
    xpc_object_t v36 = &unk_1002B5980;
    any v38 = &v39;
    int v8 = v6;
    id v37 = v8;
    -[THThreadNetworkCredentialsStoreLocalClient deleteRecordForNetwork:completion:]( keyChainStore,  "deleteRecordForNetwork:completion:",  v5,  &v33);
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      int v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001EDC08(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    else
    {
      if (!v40[5])
      {
        int v27 = 0;
        goto LABEL_11;
      }

      xpc_object_t v28 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v30 = objc_claimAutoreleasedReturnValue(objc_msgSend( (id) v40[5], "description", v33, v34, v35, v36));
        id v31 = [v30 UTF8String];
        if (v31)
        {
          id v3 = objc_claimAutoreleasedReturnValue([(id) v40[5] description]);
          xpc_object_t v32 = (const char *)[v3 UTF8String];
        }

        else
        {
          xpc_object_t v32 = "(unknown error)";
        }

        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v46 = "-[ThreadNetworkManagerInstance deleteCredentialsForThisNetwork:]";
        __int16 v47 = 2080;
        uint64_t v48 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s : Error: failed to delete (%s)\n",  buf,  0x16u);
        if (v31) {
      }
        }
    }

    int v27 = 1;
LABEL_11:

    goto LABEL_12;
  }

  xpc_object_t v19 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_1001EDB98((os_log_s *)v8, v20, v21, v22, v23, v24, v25, v26);
  }
  int v27 = 0;
LABEL_12:

  _Block_object_dispose(&v39, 8);
  return v27;
}

- (int)getMeCredentialsForThisNetwork:(id)a3 credentialsRecord_t:(id *)a4
{
  id v7 = a3;
  uint64_t v59 = 0LL;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  id v62 = sub_1001D2DCC;
  id v63 = sub_1001D2DDC;
  id v64 = 0LL;
  uint64_t v53 = 0LL;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  xpc_object_t v56 = sub_1001D2DCC;
  id v57 = sub_1001D2DDC;
  id v58 = 0LL;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1001D7F60;
    v49[3] = &unk_1002B59A8;
    id v51 = &v59;
    uint64_t v52 = &v53;
    int v10 = v8;
    id v50 = v10;
    -[THThreadNetworkCredentialsStoreLocalClient retrieveAllRecordsForNetwork:completion:]( keyChainStore,  "retrieveAllRecordsForNetwork:completion:",  v7,  v49);
    dispatch_time_t v11 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait(v10, v11))
    {
      uint64_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001EDCE8(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      int v21 = 1;
    }

    else
    {
      if (v54[5])
      {
        id v30 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v39 = objc_claimAutoreleasedReturnValue([(id) v54[5] description]);
          id v40 = [v39 UTF8String];
          if (v40)
          {
            id v4 = objc_claimAutoreleasedReturnValue([(id) v54[5] description]);
            uint64_t v41 = (const char *)[v4 UTF8String];
          }

          else
          {
            uint64_t v41 = "(unknown error)";
          }

          *(_DWORD *)__int128 buf = 136315394;
          int v67 = "-[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]";
          __int16 v68 = 2080;
          id v69 = v41;
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s : Error: failed to retrieve (%s)\n",  buf,  0x16u);
          if (v40) {
        }
          }

        int v21 = 1;
      }

      else
      {
        int v21 = 0;
      }

      if (![(id)v60[5] count])
      {
        xpc_object_t v32 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          id v42 = objc_claimAutoreleasedReturnValue([(id) v54[5] description]);
          id v43 = [v42 UTF8String];
          if (v43)
          {
            id v4 = objc_claimAutoreleasedReturnValue([(id) v54[5] description]);
            id v44 = (const char *)[v4 UTF8String];
          }

          else
          {
            id v44 = "(unknown error)";
          }

          *(_DWORD *)__int128 buf = 136315394;
          int v67 = "-[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]";
          __int16 v68 = 2080;
          id v69 = v44;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s : Error: failed to retrieve (%s), zero records found\n",  buf,  0x16u);
          if (v43) {
        }
          }

        int v21 = 1;
      }

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v13 = (os_log_s *)(id)v60[5];
      id v34 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v45,  v65,  16LL);
      if (v34)
      {
        uint64_t v35 = *(void *)v46;
        while (2)
        {
          for (i = 0LL; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v46 != v35) {
              objc_enumerationMutation(v13);
            }
            id v37 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
            if (v37)
            {
              *a4 = v37;
              goto LABEL_26;
            }
          }

          id v34 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v45,  v65,  16LL);
          if (v34) {
            continue;
          }
          break;
        }
      }
    }

- (void)fillupThreadCredentialsToSelfHealThreadNetwork:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
  dispatch_semaphore_t v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3360;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d: Radio mode %d", buf, 0x18u);
  }

  int v11 = self->_lastKnownNCPState;
  if (v11 != 8)
  {
    if (v11 == 4)
    {
      uint64_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001EDD58();
      }

      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      *(void *)&buf[24] = sub_1001D2DCC;
      *(void *)&_BYTE buf[32] = sub_1001D2DDC;
      id v67 = 0LL;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_1001D8A38;
      v65[3] = &unk_1002B5980;
      v65[4] = self;
      v65[5] = buf;
      [v7 deletePreferredNetworkEntryWithCompletion:v6 completion:v65];
      _Block_object_dispose(buf, 8);
    }

    goto LABEL_57;
  }

  sub_10000AC00(buf, "Commond is successful");
  int v62 = 0;
  __int128 v63 = *(_OWORD *)buf;
  uint64_t v64 = *(void *)&buf[16];
  uint64_t v14 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3382;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s:%d: Entered to fillup the preferred network entry",  buf,  0x12u);
  }

  uint64_t v61 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "Network:Name");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v61);
  }
  else {
    memset(buf, 0, 32);
  }
  int v17 = *sub_1000E4898(&v62, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v60 < 0)
  {
    operator delete(__p[0]);
    if (v17) {
      goto LABEL_17;
    }
LABEL_21:
    sub_100147B4C(&v61, &v58);
    if ((v58.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v20 = &v58;
    }
    else {
      uint64_t v20 = (std::string *)v58.__r_.__value_.__r.__words[0];
    }
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
    uint64_t v57 = 0LL;
    uint64_t v22 = self->_CtrInternalClientPtr;
    sub_10000AC00(v55, "Network:XPANID");
    if (v22) {
      -[CtrInternalClient getProperty:output:](v22, "getProperty:output:", v55, &v57);
    }
    else {
      memset(buf, 0, 32);
    }
    int v23 = *sub_1000E4898(&v62, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v56 < 0) {
      operator delete(v55[0]);
    }
    if (v23)
    {
      uint64_t v24 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Failed to get the Network XPANID Property",  buf,  2u);
      }

      goto LABEL_49;
    }

    unint64_t v54 = bswap64((unint64_t)sub_1001476B4(&v57, 0));
    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v54, 8LL));
    uint64_t v47 = 0LL;
    __int128 v48 = &v47;
    uint64_t v49 = 0x3812000000LL;
    id v50 = sub_1001CA2E8;
    id v51 = sub_1001CA324;
    uint64_t v52 = 256LL;
    xpc_object_t v26 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v27 = v26;
    if (!v26) {
      xpc_object_t v27 = xpc_null_create();
    }

    id v28 = v27;
    uint64_t v29 = v28;
    id v53 = v28;
    if (!v28 || xpc_get_type(v28) != (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t v30 = xpc_null_create();
      id v31 = v53;
      id v53 = v30;
    }

    xpc_object_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 networkName]);
    if ([v33 isEqualToString:v21])
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
      unsigned int v36 = [v35 isEqualToData:v44];

      if (v36)
      {
        id v37 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        any v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 networkName]);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 extendedPANID]);
          *(_DWORD *)__int128 buf = 136316418;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3410;
          *(_WORD *)&_BYTE buf[18] = 2112;
          *(void *)&buf[20] = v40;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v42;
          *(_WORD *)&buf[38] = 2112;
          id v67 = v21;
          __int16 v68 = 2112;
          id v69 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s:%d:Preferred network entry exists (name : %@, xpanid : %@)  ! And device is on same netowrk (name : %@, x panid : %@) storing the credentials again..",  buf,  0x3Au);
        }

        -[ThreadNetworkManagerInstance saveThreadConfiguration:](self, "saveThreadConfiguration:", v48 + 6);
        if (v46 < 0) {
          operator delete((void *)v45[8]);
        }
        goto LABEL_48;
      }
    }

    else
    {
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    *(void *)&buf[24] = sub_1001D2DCC;
    *(void *)&_BYTE buf[32] = sub_1001D2DDC;
    id v67 = 0LL;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001D8C94;
    v45[3] = &unk_1002B59D0;
    v45[4] = self;
    v45[5] = buf;
    v45[6] = &v47;
    [v7 deletePreferredNetworkEntryWithCompletion:v6 completion:v45];
    _Block_object_dispose(buf, 8);

LABEL_48:
    _Block_object_dispose(&v47, 8);
    id v43 = v53;
    id v53 = 0LL;

LABEL_49:
    if (v57) {
      (*(void (**)(uint64_t))(*(void *)v57 + 8LL))(v57);
    }

    goto LABEL_53;
  }

  if (!v17) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3388;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s:%d: Failed to get the Network Name Property",  buf,  0x12u);
  }

LABEL_53:
  if (v61) {
    (*(void (**)(uint64_t))(*(void *)v61 + 8LL))(v61);
  }
  if (SHIBYTE(v64) < 0) {
    operator delete((void *)v63);
  }
LABEL_57:
}

- (id)getPreferredNetworkWithNoScan
{
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = sub_1001D2DCC;
  id v42 = sub_1001D2DDC;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_1001D2DCC;
  unsigned int v36 = sub_1001D2DDC;
  id v37 = 0LL;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001D9034;
    v28[3] = &unk_1002B59F8;
    xpc_object_t v30 = &v38;
    id v31 = &v32;
    id v5 = v3;
    uint64_t v29 = v5;
    -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkWithNoScanWithCompletion:]( keyChainStore,  "retrievePreferredNetworkWithNoScanWithCompletion:",  v28);
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    if (dispatch_semaphore_wait(v5, v6))
    {
      id v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      dispatch_semaphore_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001EDF30(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }

    else if (!v33[5])
    {
      xpc_object_t v26 = (void *)v39[5];
      if (v26)
      {
        sub_1001D5710(v26);
        xpc_object_t v27 = (void *)v39[5];
      }

      else
      {
        xpc_object_t v27 = 0LL;
      }

      id v24 = v27;
      goto LABEL_11;
    }

    id v24 = 0LL;
LABEL_11:

    goto LABEL_12;
  }

  uint64_t v16 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
    sub_1001EDEC0((os_log_s *)v5, v17, v18, v19, v20, v21, v22, v23);
  }
  id v24 = 0LL;
LABEL_12:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

- (id)getPreferredNetwork
{
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = sub_1001D2DCC;
  id v42 = sub_1001D2DDC;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_1001D2DCC;
  unsigned int v36 = sub_1001D2DDC;
  id v37 = 0LL;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001D9390;
    v28[3] = &unk_1002B59F8;
    xpc_object_t v30 = &v38;
    id v31 = &v32;
    id v5 = v3;
    uint64_t v29 = v5;
    -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkOfAnyDSFormatWithCompletion:]( keyChainStore,  "retrievePreferredNetworkOfAnyDSFormatWithCompletion:",  v28);
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    if (dispatch_semaphore_wait(v5, v6))
    {
      id v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      dispatch_semaphore_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001EE070(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }

    else if (!v33[5])
    {
      xpc_object_t v26 = (void *)v39[5];
      if (v26)
      {
        sub_1001D5710(v26);
        xpc_object_t v27 = (void *)v39[5];
      }

      else
      {
        xpc_object_t v27 = 0LL;
      }

      id v24 = v27;
      goto LABEL_11;
    }

    id v24 = 0LL;
LABEL_11:

    goto LABEL_12;
  }

  uint64_t v16 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
    sub_1001EE000((os_log_s *)v5, v17, v18, v19, v20, v21, v22, v23);
  }
  id v24 = 0LL;
LABEL_12:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

- (int)checkPreferredAndJoin:(dict *)a3
{
  id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3511;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Checking for Preferred network availability to join",  buf,  0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getPreferredNetwork](self, "getPreferredNetwork"));
  if (!v7)
  {
    xpc_object_t v26 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    int v19 = 1;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3516;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d: No Preferred Network found ", buf, 0x12u);
    }

    goto LABEL_18;
  }

  if (self->_lastKnownNCPState == 4
    || !-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:](self, "isCurrentNetworkSameAsOneToStart:", v7))
  {
    uint64_t v20 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3532;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s : %d :  Leaving the existing Network...\n",  buf,  0x12u);
    }

    -[ThreadNetworkManagerInstance threadLeave](self, "threadLeave");
    uint64_t v22 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3536;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s : %d :  Joining the Preferred Network...\n",  buf,  0x12u);
    }

    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    id v25 = objc_claimAutoreleasedReturnValue(-[os_log_s UUIDString](v24, "UUIDString"));
    int v19 = -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]( self,  "formNetworkWithAOD:record:output:",  [v25 UTF8String],  v7,  a3);

LABEL_18:
    goto LABEL_19;
  }

  dispatch_semaphore_t v8 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 network]);
    id v11 = objc_claimAutoreleasedReturnValue([v10 networkName]);
    id v12 = [v11 UTF8String];
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : Already joined on the same network : Network name : %s",  buf,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  id v14 = objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  uint64_t v15 = (const char *)[v14 UTF8String];

  xpc_object_t v16 = xpc_string_create(v15);
  xpc_object_t v28 = v16;
  if (!v16) {
    xpc_object_t v28 = xpc_null_create();
  }

  *(void *)__int128 buf = a3;
  *(void *)&buf[8] = "outputUniqueNetworkId";
  sub_1000089EC((uint64_t)buf, &v28, &v29);
  xpc_object_t v17 = v29;
  xpc_object_t v29 = 0LL;

  xpc_object_t v18 = v28;
  xpc_object_t v28 = 0LL;

  -[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]( self,  "saveLastKnownJoinedNetwork:datasetRecord:",  v15,  v7);
  int v19 = 0;
LABEL_19:

  return v19;
}

- (int)getMePassPhraseForThisNetwork:(id)a3 passPhrase:(id *)a4
{
  id v7 = a3;
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x3032000000LL;
  __int128 v63 = sub_1001D2DCC;
  uint64_t v64 = sub_1001D2DDC;
  id v65 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  uint64_t v57 = sub_1001D2DCC;
  std::string v58 = sub_1001D2DDC;
  id v59 = 0LL;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  keyChainStore = self->_keyChainStore;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1001D9F3C;
  v50[3] = &unk_1002B59A8;
  uint64_t v52 = &v60;
  id v53 = &v54;
  uint64_t v10 = v8;
  id v51 = v10;
  -[THThreadNetworkCredentialsStoreLocalClient retrieveAllRecordsForNetwork:completion:]( keyChainStore,  "retrieveAllRecordsForNetwork:completion:",  v7,  v50);
  dispatch_time_t v11 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001EE0E0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_19:
    int v32 = 1;
    goto LABEL_23;
  }

  if (v55[5])
  {
    uint64_t v21 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v37 = objc_claimAutoreleasedReturnValue([(id) v55[5] description]);
      id v38 = [v37 UTF8String];
      if (v38)
      {
        id v4 = objc_claimAutoreleasedReturnValue([(id) v55[5] description]);
        id v39 = (const char *)[v4 UTF8String];
      }

      else
      {
        id v39 = "(unknown error)";
      }

      *(_DWORD *)__int128 buf = 136315138;
      id v67 = v39;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error: failed to retrieve (%s)\n",  buf,  0xCu);
      if (v38) {
    }
      }
  }

  if (![(id)v61[5] count])
  {
    uint64_t v23 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v43 = objc_claimAutoreleasedReturnValue([(id) v55[5] description]);
      id v44 = [v43 UTF8String];
      if (v44)
      {
        id v4 = objc_claimAutoreleasedReturnValue([(id) v55[5] description]);
        __int128 v45 = (const char *)[v4 UTF8String];
      }

      else
      {
        __int128 v45 = "(unknown error)";
      }

      *(_DWORD *)__int128 buf = 136315138;
      id v67 = v45;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Error: failed to retrieve (%s), zero records found\n",  buf,  0xCu);
      if (v44) {
    }
      }
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  uint64_t v13 = (os_log_s *)(id)v61[5];
  id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v46,  v70,  16LL);
  if (!v25) {
    goto LABEL_19;
  }
  uint64_t v26 = *(void *)v47;
  while (2)
  {
    for (i = 0LL; i != v25; i = (char *)i + 1)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v13);
      }
      xpc_object_t v28 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
      xpc_object_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "credentials", (void)v46));
      xpc_object_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 passPhrase]);
      BOOL v31 = v30 == 0LL;

      if (!v31)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v28 credentials]);
        *a4 = (id)objc_claimAutoreleasedReturnValue([v33 passPhrase]);

        uint64_t v34 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = (const char *)*a4;
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v28 credentials]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 passPhrase]);
          *(_DWORD *)__int128 buf = 138412546;
          id v67 = v40;
          __int16 v68 = 2112;
          id v69 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "**passPhrase : %@, passphrase  : %@ : ",  buf,  0x16u);
        }

        int v32 = 0;
        goto LABEL_23;
      }
    }

    id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v46,  v70,  16LL);
    int v32 = 1;
    if (v25) {
      continue;
    }
    break;
  }

- (int)commission:(dict *)a3
{
  return 0;
}

- (BOOL)commissioningCore:(id)a3 PSKd:(id)a4 server:(id)a5 index:(int)a6
{
  return 0;
}

- (BOOL)tnm_internalInstall
{
  return os_variant_has_internal_diagnostics(0LL, a2);
}

- (id)dataFromHexString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);

  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  __str[2] = 0;
  id result = [v4 length];
  int v7 = (_DWORD)result - 1;
  if (__OFSUB__((_DWORD)result, 1))
  {
LABEL_12:
    __break(0x5515u);
  }

  else
  {
    if (v7 >= 1)
    {
      int v8 = 0;
      do
      {
        id result = [v4 characterAtIndex:v8];
        int v9 = v8 + 1;
        if ((char)result >= 48
          && result <= 0x66u
          && result - 58 >= 0x27)
        {
          __str[0] = (char)result;
          BOOL v10 = __OFADD__(v8, 2);
          int v11 = v8 + 2;
          if (v10)
          {
            __break(0x5500u);
            goto LABEL_12;
          }

          __str[1] = [v4 characterAtIndex:v9];
          char v13 = strtol(__str, 0LL, 16);
          -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v13, 1LL);
          int v9 = v11;
        }

        int v8 = v9;
      }

      while (v9 < v7);
    }

    return v5;
  }

  return result;
}

- (int)commissionToSpecifNetwork:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  return 0;
}

- (int)joinerAttach:(const char *)a3 output:(dict *)a4
{
  int v35 = 3;
  __int128 v36 = *(_OWORD *)buf;
  uint64_t v37 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  xpc_object_t v29 = "JoinerAttach";
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v33 = "Thread:Joiner:State";
  char v34 = 0;
  if (CtrInternalClientPtr) {
    -[CtrInternalClient joiner:](CtrInternalClientPtr, "joiner:", &v29);
  }
  else {
    memset(buf, 0, 32);
  }
  sub_1000E4898(&v35, (uint64_t)buf);
  if (v35)
  {
    int v8 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001EE1EC((uint64_t)&v35, v9, v10, v11, v12, v13, v14, v15);
    }

    sub_1000BED14(1, 0);
    -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
    if (v23 < 0) {
      operator delete(__p);
    }
    int v16 = 1;
  }

  else
  {
    uint64_t v17 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Joiner return code %u", buf, 8u);
    }

    sub_1000BED14(1, 1);
    sleep(2u);
    sub_10000AC00(v26, "Command is Successful");
    *(_DWORD *)__int128 buf = 0;
    *(_OWORD *)&buf[8] = *(_OWORD *)v26;
    *(void *)&buf[24] = v27;
    -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:]( self,  "saveThreadConfiguration:passPhrase:",  a4,  a3);
    sub_1000E4898(buf, (uint64_t)v26);
    if (v28 < 0) {
      operator delete(v26[1]);
    }
    if (*(_DWORD *)buf)
    {
      uint64_t v19 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1001EE1C0();
      }

      -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
      if (v25 < 0) {
        operator delete(v24);
      }
      int v16 = 1;
    }

    else
    {
      int v16 = 0;
    }
  }

  if (SHIBYTE(v37) < 0) {
    operator delete((void *)v36);
  }
  return v16;
}

- (void)sendThirdPartyMetricsInfo:(unsigned int)a3 prefNws:(unsigned int)a4 prefNwsByApple:(unsigned int)a5
{
  if (sub_1000D0058(a3, a4, a5))
  {
    uint64_t v25 = 0LL;
    unsigned int v24 = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sub_1000CF58C((_DWORD *)&v25 + 1, &v25);
    sub_1000CF574(&v24);
    if (byte_1002C9DAF >= 0) {
      int v7 = &mDaemonVersion;
    }
    else {
      int v7 = (uint64_t *)mDaemonVersion;
    }
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    [v5 setObject:v8 forKey:@"header_daemon_version"];

    if (byte_1002C9DC7 >= 0) {
      int v9 = &mVendorVersion;
    }
    else {
      int v9 = (uint64_t *)mVendorVersion;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
    [v5 setObject:v10 forKey:@"header_vendor_version"];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v24));
    [v5 setObject:v11 forKey:@"number_of_third_party_border_routers"];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001DA828;
    v22[3] = &unk_1002B2158;
    id v12 = v5;
    id v23 = v12;
    AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneCTCSNumberOfThirdPartyBRs", v22);
    if (byte_1002C9DAF >= 0) {
      uint64_t v13 = &mDaemonVersion;
    }
    else {
      uint64_t v13 = (uint64_t *)mDaemonVersion;
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    [v6 setObject:v14 forKey:@"header_daemon_version"];

    if (byte_1002C9DC7 >= 0) {
      uint64_t v15 = &mVendorVersion;
    }
    else {
      uint64_t v15 = (uint64_t *)mVendorVersion;
    }
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    [v6 setObject:v16 forKey:@"header_vendor_version"];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v25));
    [v6 setObject:v17 forKey:@"number_of_preferred_nw_by_Apple_border_routers"];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", HIDWORD(v25)));
    [v6 setObject:v18 forKey:@"number_of_preferred_nw_by_third_party_border_routers"];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001DA830;
    v20[3] = &unk_1002B2158;
    id v19 = v6;
    id v21 = v19;
    AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneCTCSNumberPreferredNetworksByBorderRouters", v20);
  }

- (void)retrieveAndPostThirdPartyInfo
{
  keyChainStore = self->_keyChainStore;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001DA894;
  v3[3] = &unk_1002B5A20;
  v3[4] = self;
  -[THThreadNetworkCredentialsStoreLocalClient retrieveThirdPartyInfo:](keyChainStore, "retrieveThirdPartyInfo:", v3);
}

- (int)formNetworkWithAOD:(const char *)a3 record:(id)a4 output:(dict *)a5
{
  uint64_t v64 = a5;
  id v6 = a4;
  int v7 = sub_10000AC00(buf, "Command Error");
  unsigned int v86 = 3;
  std::string v87 = *(std::string *)buf;
  sub_10000AC00(v7, "Command is Successful");
  id v65 = *(void **)buf;
  int v67 = buf[23];
  int v8 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSet]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataSetArray]);
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4162;
    *(_WORD *)&_BYTE buf[18] = 2112;
    *(void *)&buf[20] = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d: dsString Data: %@ ", buf, 0x1Cu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSet]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataSetArray]);
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSet]);
    id v15 = objc_claimAutoreleasedReturnValue([v14 dataSetArray]);
    int v16 = (ctu *)[v15 bytes];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSet]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataSetArray]);
    id v19 = [v18 length];
    ctu::hex(v84, v16, v19, v20);
  }

  else
  {
    sub_10000AC00(v84, "");
  }

  unint64_t v21 = v85;
  if ((v85 & 0x80u) != 0) {
    unint64_t v21 = (unint64_t)v84[1];
  }
  if (!v21)
  {
    __int128 v30 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1001EE254();
    }

    goto LABEL_43;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSet]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dataSetArray]);
  unsigned __int8 v24 = -[ThreadNetworkManagerInstance validateDataSetTLVs:](self, "validateDataSetTLVs:", v23);

  if ((v24 & 1) != 0)
  {
    uint64_t v25 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = v84;
      if ((v85 & 0x80u) != 0) {
        uint64_t v27 = (void **)v84[0];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4181;
      *(_WORD *)&_BYTE buf[18] = 2080;
      *(void *)&buf[20] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d: dataset: %s ", buf, 0x1Cu);
    }

    sub_1000BEC94();
    CtrInternalClientPtr = self->_CtrInternalClientPtr;
    sub_10000AC00(__p, "Thread:ActiveDataset:Bytes");
    if (CtrInternalClientPtr)
    {
      if ((v85 & 0x80u) == 0) {
        xpc_object_t v29 = v84;
      }
      else {
        xpc_object_t v29 = (void **)v84[0];
      }
      -[CtrInternalClient setProperty:property_val:]( CtrInternalClientPtr,  "setProperty:property_val:",  __p,  v29,  v64,  v65);
    }

    else
    {
      memset(buf, 0, sizeof(buf));
    }

    sub_1000E4898(&v86, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v83 < 0) {
      operator delete(__p[0]);
    }
    int v35 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v86, v80);
      int v37 = v81;
      id v38 = (void **)v80[0];
      std::string::basic_string(&v79, &v87);
      id v39 = v80;
      if (v37 < 0) {
        id v39 = v38;
      }
      if ((v79.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v40 = &v79;
      }
      else {
        uint64_t v40 = (std::string *)v79.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Thread:ActiveDataset:Bytes";
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&buf[24] = v39;
      __int16 v89 = 2080;
      uint64_t v90 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%s : Set Result for %s = %s, Error Info: %s",  buf,  0x2Au);
      if (v81 < 0) {
        operator delete(v80[0]);
      }
    }

    if (v86)
    {
      uint64_t v41 = sub_1000160F4("com.apple.wpantund.tnm", "form");
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v86, v80);
        int v56 = v81;
        uint64_t v57 = (void **)v80[0];
        std::string::basic_string(&v79, &v87);
        std::string v58 = v80;
        if (v56 < 0) {
          std::string v58 = v57;
        }
        if ((v79.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          id v59 = &v79;
        }
        else {
          id v59 = (std::string *)v79.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "Thread:ActiveDataset:Bytes";
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&buf[24] = v58;
        __int16 v89 = 2080;
        uint64_t v90 = v59;
        _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s : Set kWPANTUNDProperty_ThreadActiveDatasetBytes Result for %s = %s, Error Info: %s",  buf,  0x2Au);
        if (v81 < 0) {
          operator delete(v80[0]);
        }
      }

      sub_1000BED14(0, 0);
LABEL_43:
      sub_10000AC00(v72, "Error");
      sub_10000AC00(v70, "Form Failed");
      sub_10000AC00(v68, "Failed to form a specific network using AOD, active operational dataset");
      sub_1000E8078((uint64_t *)v72, (uint64_t *)v70, (const std::string::value_type *)v68, 0LL);
      if (v69 < 0) {
        operator delete(v68[0]);
      }
      if (v71 < 0) {
        operator delete(v70[0]);
      }
      if (v73 < 0) {
        operator delete(v72[0]);
      }
      int v34 = 1;
      goto LABEL_50;
    }

    id v44 = self->_CtrInternalClientPtr;
    sub_10000AC00(v77, "Interface:Up");
    if (v44) {
      -[CtrInternalClient setProperty:property_val:](v44, "setProperty:property_val:", v77, "1");
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1000E4898(&v86, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v78 < 0) {
      operator delete(v77[0]);
    }
    __int128 v45 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v86, v80);
      int v47 = v81;
      __int128 v48 = (void **)v80[0];
      std::string::basic_string(&v79, &v87);
      __int128 v49 = v80;
      if (v47 < 0) {
        __int128 v49 = v48;
      }
      if ((v79.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        id v50 = &v79;
      }
      else {
        id v50 = (std::string *)v79.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Interface:Up";
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&buf[24] = v49;
      __int16 v89 = 2080;
      uint64_t v90 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "%s : Set Result for %s = %s, Error Info: %s",  buf,  0x2Au);
      if (v81 < 0) {
        operator delete(v80[0]);
      }
    }

    if (v86)
    {
      id v51 = sub_1000160F4("com.apple.wpantund.tnm", "form");
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v86, v80);
        int v60 = v81;
        uint64_t v61 = (void **)v80[0];
        std::string::basic_string(&v79, &v87);
        uint64_t v62 = v80;
        if (v60 < 0) {
          uint64_t v62 = v61;
        }
        if ((v79.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          __int128 v63 = &v79;
        }
        else {
          __int128 v63 = (std::string *)v79.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "Interface:Up";
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&buf[24] = v62;
        __int16 v89 = 2080;
        uint64_t v90 = v63;
        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%s : Set kWPANTUNDProperty_InterfaceUp Result for %s = %s, Error Info: %s",  buf,  0x2Au);
        if (v81 < 0) {
          operator delete(v80[0]);
        }
      }

      sub_1000BED14(0, 0);
      -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
      if (v76 < 0) {
        operator delete(v75[2]);
      }
      goto LABEL_43;
    }

    -[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]( self,  "saveLastKnownJoinedNetwork:datasetRecord:",  a3,  v6);
    xpc_object_t v53 = xpc_string_create(a3);
    xpc_object_t v74 = v53;
    if (!v53) {
      xpc_object_t v74 = xpc_null_create();
    }

    *(void *)__int128 buf = v64;
    *(void *)&buf[8] = "outputUniqueNetworkId";
    sub_1000089EC((uint64_t)buf, &v74, v75);
    xpc_object_t v54 = v75[0];
    v75[0] = 0LL;

    xpc_object_t v55 = v74;
    xpc_object_t v74 = 0LL;

    sub_1000BED14(0, 1);
    int v34 = 0;
  }

  else
  {
    __int128 v32 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1001EE2DC();
    }

    int v34 = -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]( self,  "formNetworkWithCreds:credentialsRecord_t:output:",  a3,  v6,  v64);
  }

- (int)formNetworkWithCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  id v7 = a4;
  v139[0] = 0LL;
  v139[1] = 0LL;
  uint64_t v140 = 0LL;
  int v172 = 0;
  memset(v171, 0, sizeof(v171));
  sub_10000AC00(buf, "Command Error");
  unsigned int v133 = 3;
  std::string v134 = *(std::string *)buf;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
  unsigned __int16 v9 = (unsigned __int16)[v8 channel];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
  id v11 = objc_claimAutoreleasedReturnValue([v10 PANID]);
  unsigned int v119 = *(unsigned __int16 *)[v11 bytes];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 network]);
  id v13 = objc_claimAutoreleasedReturnValue([v12 extendedPANID]);
  unint64_t v14 = *(void *)[v13 bytes];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 network]);
  id v16 = objc_claimAutoreleasedReturnValue([v15 networkName]);
  id v17 = [v16 UTF8String];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
  id v19 = objc_claimAutoreleasedReturnValue([v18 masterKey]);
  unint64_t v20 = (__int128 *)[v19 bytes];

  __int128 v170 = *v20;
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 PSKc]);
  LODWORD(v19) = v22 == 0LL;

  unint64_t v23 = bswap64(v14);
  if ((_DWORD)v19)
  {
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
    int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 passPhrase]);
    BOOL v36 = v35 == 0LL;

    if (v36)
    {
      char v71 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      id v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        sub_1001EE36C(v72, v73, v74, v75, v76, v77, v78, v79);
      }

      goto LABEL_57;
    }

    *(void *)__int128 buf = v17;
    *(void *)&buf[8] = 0LL;
    *(void *)&uint8_t buf[16] = 0LL;
    *(void *)&buf[24] = v23;
    int v37 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
    id v38 = objc_claimAutoreleasedReturnValue([v37 passPhrase]);
    *(void *)&uint8_t buf[16] = [v38 UTF8String];

    -[ThreadNetworkManagerInstance getPskc:pskc_str:](self, "getPskc:pskc_str:", buf, v139);
    sub_1000E4898(&v133, (uint64_t)v166);
    if (v168 < 0) {
      operator delete(*(void **)&v166[8]);
    }
    if (v133)
    {
      id v39 = sub_1000160F4("com.apple.wpantund.tnm", "form");
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1001EE44C(v40, v41, v42, v43, v44, v45, v46, v47);
      }

      goto LABEL_57;
    }

    id v105 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    uint64_t v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      uint64_t v107 = v139;
      if (v140 < 0) {
        uint64_t v107 = (void **)v139[0];
      }
      *(_DWORD *)v166 = 136315394;
      *(void *)&v166[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
      *(_WORD *)&v166[12] = 2080;
      *(void *)&v166[14] = v107;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "%s : generated pskc string : %s", v166, 0x16u);
    }

    if (v140 >= 0) {
      __int128 v30 = v139;
    }
    else {
      __int128 v30 = (void **)v139[0];
    }
  }

  else
  {
    unsigned __int8 v24 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 PSKc]);
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s: Creds PSKC : %@", buf, 0x16u);
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = 0LL;
    char v28 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
    id v29 = objc_claimAutoreleasedReturnValue([v28 PSKc]);
    *(_OWORD *)__int128 buf = *(_OWORD *)[v29 bytes];

    sub_100159A78((unint64_t)buf, 16LL, v171, 0x24uLL, 0);
    __int128 v30 = (void **)v171;
  }

  __int128 v31 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v30;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s : pskc string : %s", buf, 0x16u);
  }

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "Network:PSKc");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, v30);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  sub_1000E4898(&v133, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v132 < 0) {
    operator delete(__p[0]);
  }
  __int128 v48 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    unint64_t v50 = v23;
    id v51 = v17;
    uint64_t v52 = a3;
    xpc_object_t v53 = self;
    sub_1000E7B14(v133, v166);
    int v54 = v167;
    xpc_object_t v55 = *(_BYTE **)v166;
    std::string::basic_string(&v130, &v134);
    int v56 = v166;
    if (v54 < 0) {
      int v56 = v55;
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v57 = &v130;
    }
    else {
      uint64_t v57 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&_BYTE buf[22] = 2080;
    *(void *)&buf[24] = v56;
    __int16 v164 = 2080;
    v165 = v57;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%s : Set Result for %s = %s, Error Info: %s",  buf,  0x2Au);
    self = v53;
    a3 = v52;
    if (v167 < 0) {
      operator delete(*(void **)v166);
    }
    id v17 = v51;
    unint64_t v23 = v50;
  }

  if (v133)
  {
    std::string v58 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    sub_1000E7B14(v133, v166);
    int v110 = v167;
    uint64_t v111 = *(_BYTE **)v166;
    std::string::basic_string(&v130, &v134);
    uint64_t v112 = v166;
    if (v110 < 0) {
      uint64_t v112 = v111;
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      id v113 = &v130;
    }
    else {
      id v113 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&_BYTE buf[22] = 2080;
    *(void *)&buf[24] = v112;
    __int16 v164 = 2080;
    v165 = v113;
    _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s : Set PSKC Result for %s = %s, Error Info: %s",  buf,  0x2Au);
    if ((v167 & 0x80000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_120;
  }

  int v60 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    unint64_t v62 = v23;
    id v63 = v17;
    uint64_t v64 = a3;
    id v65 = self;
    sub_1000E7B14(v133, v166);
    int v66 = v167;
    int v67 = *(_BYTE **)v166;
    std::string::basic_string(&v130, &v134);
    __int16 v68 = v166;
    if (v66 < 0) {
      __int16 v68 = v67;
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      char v69 = &v130;
    }
    else {
      char v69 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&_BYTE buf[22] = 2080;
    *(void *)&buf[24] = v68;
    __int16 v164 = 2080;
    v165 = v69;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s : Set PSKC Result for %s = %s, Error Info: %s",  buf,  0x2Au);
    self = v65;
    a3 = v64;
    if (v167 < 0) {
      operator delete(*(void **)v166);
    }
    id v17 = v63;
    unint64_t v23 = v62;
  }

  __int16 v70 = self->_CtrInternalClientPtr;
  id v141 = v17;
  char v142 = 1;
  unsigned __int16 v143 = v9;
  char v144 = 0;
  __int16 v145 = v137;
  char v146 = v138;
  int v147 = 0;
  char v148 = 1;
  __int16 v149 = bswap32(v119) >> 16;
  char v150 = 1;
  *(_DWORD *)char v151 = *(_DWORD *)v136;
  *(_DWORD *)&v151[3] = *(_DWORD *)&v136[3];
  unint64_t v152 = v23;
  char v153 = 1;
  __int128 v154 = v170;
  char v155 = 0;
  int v156 = 0;
  char v157 = 0;
  *(_DWORD *)int v158 = *(_DWORD *)v135;
  *(_DWORD *)&v158[3] = *(_DWORD *)&v135[3];
  __int128 v159 = "router";
  char v160 = 0;
  char v161 = 0;
  *(void *)v162 = *(void *)v169;
  *(void *)&v162[6] = *(void *)&v169[6];
  if (v70) {
    -[CtrInternalClient form:](v70, "form:", &v141);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  sub_1000E4898(&v133, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v133)
  {
    id v80 = sub_1000160F4("com.apple.wpantund.tnm", "join");
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    sub_1000E7B14(v133, v166);
    int v114 = v167;
    uint64_t v115 = *(_BYTE **)v166;
    std::string::basic_string(&v130, &v134);
    uint64_t v116 = v166;
    if (v114 < 0) {
      uint64_t v116 = v115;
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v117 = &v130;
    }
    else {
      uint64_t v117 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v116;
    *(_WORD *)&_BYTE buf[22] = 2080;
    *(void *)&buf[24] = v117;
    _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s : TNM got the Failed Result for Form as = %s, Error Info: %s",  buf,  0x20u);
    if ((v167 & 0x80000000) == 0) {
      goto LABEL_56;
    }
LABEL_120:
    operator delete(*(void **)v166);
LABEL_56:

LABEL_57:
    BOOL v81 = 0;
LABEL_58:
    int v82 = 1;
    goto LABEL_59;
  }

  uint64_t v84 = sub_1000160F4("com.apple.wpantund.tnm", "join");
  unsigned __int8 v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    unsigned int v86 = self;
    sub_1000E7B14(v133, v166);
    int v87 = v167;
    xpc_object_t v88 = *(_BYTE **)v166;
    std::string::basic_string(&v130, &v134);
    __int16 v89 = v166;
    if (v87 < 0) {
      __int16 v89 = v88;
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v90 = &v130;
    }
    else {
      uint64_t v90 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v89;
    *(_WORD *)&_BYTE buf[22] = 2080;
    *(void *)&buf[24] = v90;
    _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "%s : TNM got the Success Result for Form as = %s, Error Info: %s",  buf,  0x20u);
    self = v86;
    if (v167 < 0) {
      operator delete(*(void **)v166);
    }
  }

  xpc_object_t v91 = xpc_string_create(a3);
  xpc_object_t v128 = v91;
  if (!v91)
  {
    xpc_object_t v128 = xpc_null_create();
  }

  *(void *)__int128 buf = a5;
  *(void *)&buf[8] = "outputUniqueNetworkId";
  sub_1000089EC((uint64_t)buf, &v128, &v129);
  xpc_object_t v92 = v129;
  xpc_object_t v129 = 0LL;

  xpc_object_t v93 = v128;
  xpc_object_t v128 = 0LL;

  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v7 credentials]);
  id v95 = objc_claimAutoreleasedReturnValue([v94 passPhrase]);
  -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:]( self,  "saveThreadConfiguration:passPhrase:",  a5,  [v95 UTF8String]);
  sub_1000E4898(&v133, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }

  if (v133)
  {
    id v96 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    char v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      sub_1001EE3DC(v97, v98, v99, v100, v101, v102, v103, v104);
    }

    -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
    if (v127 < 0) {
      operator delete(v126);
    }
    BOOL v81 = v133 == 13;
    goto LABEL_58;
  }

  -[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]( self,  "saveLastKnownJoinedNetwork:datasetRecord:",  a3,  v7);
  uint64_t v108 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_INFO,  "formNetworkWithCreds: Retrieve Third Party Info",  buf,  2u);
  }

  -[ThreadNetworkManagerInstance retrieveAndPostThirdPartyInfo](self, "retrieveAndPostThirdPartyInfo");
  BOOL v81 = 0;
  int v82 = 0;
LABEL_59:
  if ((v82 & (!v81 | isNetworkConnected())) == 1 && isSystemUpTimeIsGreaterThan(0x12CuLL))
  {
    sub_10000AC00(v124, "Error");
    sub_10000AC00(v122, "Form Failed");
    sub_10000AC00(v120, "Failed to form a specific network");
    sub_1000E8078((uint64_t *)v124, (uint64_t *)v122, (const std::string::value_type *)v120, 0LL);
    if (v121 < 0) {
      operator delete(v120[0]);
    }
    if (v123 < 0) {
      operator delete(v122[0]);
    }
    if (v125 < 0) {
      operator delete(v124[0]);
    }
  }

  if (SHIBYTE(v140) < 0) {
    operator delete(v139[0]);
  }

  return v82;
}

- (int)attachWithAllCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  id v6 = a4;
  sub_10000AC00(buf, "Command Error");
  unsigned int v51 = 3;
  std::string v52 = *(std::string *)buf;
  id v7 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "attachWithAllCreds Cmd received in state %d",  buf,  8u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 credentials]);
  unsigned __int16 v11 = (unsigned __int16)[v10 channel];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 credentials]);
  id v13 = objc_claimAutoreleasedReturnValue([v12 PANID]);
  unsigned int v14 = *(unsigned __int16 *)[v13 bytes];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
  id v16 = objc_claimAutoreleasedReturnValue([v15 extendedPANID]);
  unint64_t v17 = *(void *)[v16 bytes];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
  id v19 = objc_claimAutoreleasedReturnValue([v18 networkName]);
  id v20 = [v19 UTF8String];

  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 credentials]);
  id v22 = objc_claimAutoreleasedReturnValue([v21 masterKey]);
  unint64_t v23 = (__int128 *)[v22 bytes];

  __int128 v60 = *v23;
  sub_1000BEC94();
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v53[0] = v20;
  v53[1] = "router";
  unsigned __int16 v54 = v11;
  __int16 v55 = bswap32(v14) >> 16;
  unint64_t v56 = bswap64(v17);
  __int128 v57 = v60;
  int v58 = 16843009;
  if (CtrInternalClientPtr) {
    -[CtrInternalClient join:](CtrInternalClientPtr, "join:", v53);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  sub_1000E4898(&v51, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v51)
  {
    uint64_t v25 = sub_1000160F4("com.apple.wpantund.tnm", "join");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      sub_1000E7B14(v51, v49);
      int v38 = v50;
      id v39 = (void **)v49[0];
      std::string::basic_string(&v48, &v52);
      uint64_t v40 = v49;
      if (v38 < 0) {
        uint64_t v40 = v39;
      }
      if ((v48.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v41 = &v48;
      }
      else {
        uint64_t v41 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance attachWithAllCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v40;
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&buf[24] = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s : TNM got the Failed Result for Join as = %s, Error Info: %s",  buf,  0x20u);
      if (v50 < 0) {
        operator delete(v49[0]);
      }
    }

    sub_1000BED14(0, 0);
    -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
    if (v45 < 0) {
      operator delete(__p);
    }
    sleep(2u);
    int v27 = 1;
  }

  else
  {
    char v28 = sub_1000160F4("com.apple.wpantund.tnm", "join");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v51, v49);
      int v30 = v50;
      __int128 v31 = (void **)v49[0];
      std::string::basic_string(&v48, &v52);
      __int128 v32 = v49;
      if (v30 < 0) {
        __int128 v32 = v31;
      }
      if ((v48.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        id v33 = &v48;
      }
      else {
        id v33 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance attachWithAllCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v32;
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&buf[24] = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s : TNM got the Success Result for Join as = %s, Error Info: %s",  buf,  0x20u);
      if (v50 < 0) {
        operator delete(v49[0]);
      }
    }

    xpc_object_t v34 = xpc_string_create(a3);
    xpc_object_t v46 = v34;
    if (!v34) {
      xpc_object_t v46 = xpc_null_create();
    }

    *(void *)__int128 buf = a5;
    *(void *)&buf[8] = "outputUniqueNetworkId";
    sub_1000089EC((uint64_t)buf, &v46, &v47);
    xpc_object_t v35 = v47;
    xpc_object_t v47 = 0LL;

    xpc_object_t v36 = v46;
    xpc_object_t v46 = 0LL;

    sub_1000BED14(0, 1);
    int v27 = 0;
  }

  return v27;
}

- (int)commissionOrFormNetwork:(dict)a3 is_attaching:(BOOL)a4 cfg_attach:(Ctr_attachToNetwork *)a5 output:(dict *)a6
{
  return 0;
}

- (BOOL)isNetworkSame:(Ctr_attachToNetwork *)a3 nwname:(void *)a4 xpan:(void *)a5
{
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  unsigned __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%08llX", a3->var6));
  [v8 appendString:v9];

  sub_10000AC00(&__s1, a3->var0);
  id v10 = v8;
  sub_10000AC00(&__p, (char *)[v10 UTF8String]);
  unsigned __int16 v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    var0 = a3->var0;
    else {
      unsigned int v14 = *(unsigned __int8 **)a4;
    }
    else {
      id v15 = *(unsigned __int8 **)a5;
    }
    p_p = &__p;
    if ((v33 & 0x80u) != 0) {
      p_p = __p;
    }
    *(_DWORD *)__int128 buf = 136315906;
    int v38 = v14;
    __int16 v39 = 2080;
    uint64_t v40 = var0;
    __int16 v41 = 2080;
    uint64_t v42 = v15;
    __int16 v43 = 2080;
    uint64_t v44 = p_p;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "  Network Name : %s, Network to attach : %s, XPAN : %s, XPAN to attach : %s",  buf,  0x2Au);
  }

  if ((v36 & 0x80u) == 0) {
    size_t v17 = v36;
  }
  else {
    size_t v17 = __n;
  }
  uint64_t v18 = *((unsigned __int8 *)a4 + 23);
  int v19 = (char)v18;
  if ((v18 & 0x80u) != 0LL) {
    uint64_t v18 = *((void *)a4 + 1);
  }
  if (v17 != v18) {
    goto LABEL_45;
  }
  if (v19 >= 0) {
    id v20 = (unsigned __int8 *)a4;
  }
  else {
    id v20 = *(unsigned __int8 **)a4;
  }
  if ((v36 & 0x80) != 0)
  {
    if (memcmp(__s1, v20, __n)) {
      goto LABEL_45;
    }
  }

  else if (v36)
  {
    unint64_t v21 = 0LL;
    while (v21 <= 0x17)
    {
      if (v36 == ++v21) {
        goto LABEL_28;
      }
    }

- (BOOL)areTwoNetworksSame:(id)a3 nwname:(id)a4 creds_xpan:(id)a5 xpan:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isEqualToString:v10] && objc_msgSend(v11, "isEqualToData:", v12))
  {
    id v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[ThreadNetworkManagerInstance areTwoNetworksSame:nwname:creds_xpan:xpan:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  " %s : Networks are same ",  (uint8_t *)&v17,  0xCu);
    }

    BOOL v15 = 1;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)clearThreadCredentials
{
  id v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v9 = "-[ThreadNetworkManagerInstance clearThreadCredentials]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Entered in %s", buf, 0xCu);
  }

  -[CtrInternalClient leave](self->_CtrInternalClientPtr, "leave");
  if (v7 < 0) {
    operator delete(__p);
  }
  return sub_100110ED0();
}

- (BOOL)isCurrentNetworkSameAsOneToStart:(id)a3
{
  id v4 = a3;
  uint64_t v61 = 0LL;
  uint64_t v62 = 0LL;
  uint64_t v63 = 0LL;
  sub_10000AC00(__p, "Commond is successful");
  int v50 = 0;
  std::string v51 = *(std::string *)__p;
  -[ThreadNetworkManagerInstance getNCPNetworkInfo:](self, "getNCPNetworkInfo:", v60);
  sub_1000E4898(&v50, (uint64_t)__p);
  if (SBYTE1(v55) < 0) {
    operator delete(*(void **)&__p[8]);
  }
  if (v50)
  {
    id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      std::string::basic_string((std::string *)__p, &v51);
      char v7 = __p[23] >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v57 = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
      __int16 v58 = 2080;
      id v59 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s: Failed to get the NCP Network Info : %s",  buf,  0x16u);
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
    }

    goto LABEL_28;
  }

  __int16 v53 = bswap32(v60[1]) >> 16;
  unint64_t v52 = bswap64(v65);
  int v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 networkName]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v64));
    *(_DWORD *)__p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&_BYTE __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4645;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v11;
    *(_WORD *)&__p[28] = 2112;
    __int16 v55 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : %d : cnwname : %@, cfgnwname : %@",  __p,  0x26u);
  }

  id v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 extendedPANID]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v52, 8LL));
    *(_DWORD *)__p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&_BYTE __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4646;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v16;
    *(_WORD *)&__p[28] = 2112;
    __int16 v55 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s : %d : cxpan : %@, cfgxpan : %@", __p, 0x26u);
  }

  uint64_t v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 masterKey]);
    size_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v66, 16LL));
    *(_DWORD *)__p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&_BYTE __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4647;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v21;
    *(_WORD *)&__p[28] = 2112;
    __int16 v55 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s : %d : ckey : %@, cfgkey : %@", __p, 0x26u);
  }

  uint64_t v23 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 PANID]);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v53, 2LL));
    *(_DWORD *)__p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&_BYTE __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4648;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v26;
    *(_WORD *)&__p[28] = 2112;
    __int16 v55 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : %d : cpan : %@, cfgpan : %@", __p, 0x26u);
  }

  char v28 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int v30 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
    unsigned int v31 = [v30 channel];
    *(_DWORD *)__p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&_BYTE __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4649;
    *(_WORD *)&__p[18] = 1024;
    *(_DWORD *)&__p[20] = v31;
    *(_WORD *)&__p[24] = 1024;
    *(_DWORD *)&__p[26] = v60[0];
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s : %d : cchannel : %d, cfgchannel : %d",  __p,  0x1Eu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 network]);
  size_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s networkName](v6, "networkName"));
  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v64));
  if (([v32 isEqualToString:v33] & 1) == 0)
  {

LABEL_28:
    BOOL v42 = 0;
LABEL_29:

    goto LABEL_30;
  }

  xpc_object_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
  xpc_object_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v52, 8LL));
  if (![v35 isEqualToData:v36])
  {

    goto LABEL_28;
  }

  std::string v48 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 masterKey]);
  int v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v66, 16LL));
  if (![v49 isEqualToData:v37])
  {

    goto LABEL_28;
  }

  char v45 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
  xpc_object_t v46 = v34;
  xpc_object_t v47 = (void *)objc_claimAutoreleasedReturnValue([v45 PANID]);
  int v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v53, 2LL));
  if ([v47 isEqualToData:v38])
  {
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v4 credentials]);
    unsigned int v40 = [v39 channel];
    BOOL v41 = v60[0] == v40;
  }

  else
  {
    BOOL v41 = 0;
  }

  if (v41)
  {
    uint64_t v44 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    BOOL v42 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
      *(_WORD *)&_BYTE __p[12] = 1024;
      *(_DWORD *)&__p[14] = 4657;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d : Returning true..", __p, 0x12u);
    }

    goto LABEL_29;
  }

  BOOL v42 = 0;
LABEL_30:
  if (SHIBYTE(v63) < 0) {
    operator delete(v61);
  }

  return v42;
}

- (BOOL)updatePreferredNetworkForDatasetChange
{
  uint64_t v55 = 0LL;
  unint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  __int16 v58 = sub_1001D2DCC;
  id v59 = sub_1001D2DDC;
  id v60 = 0LL;
  v53[0] = 0LL;
  v53[1] = v53;
  void v53[2] = 0x3032000000LL;
  v53[3] = sub_1001D2DCC;
  v53[4] = sub_1001D2DDC;
  id v54 = 0LL;
  if (self->_lastKnownJoinedNetworkRecord)
  {
    if (self->_keyChainStore)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ThreadNetworkManagerInstance getPreferredNetworkWithNoScan]( self,  "getPreferredNetworkWithNoScan"));
      if (!v4)
      {
        int v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1001EE5A4();
        }
        goto LABEL_17;
      }

      lastKnownJoinedNetworkRecord = self->_lastKnownJoinedNetworkRecord;
      if (lastKnownJoinedNetworkRecord)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord credentialsDataSet]( lastKnownJoinedNetworkRecord,  "credentialsDataSet"));
        char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSetArray]);
        if ([v7 length])
        {
          std::string v48 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialsDataSet]);
          int v8 = (void *)objc_claimAutoreleasedReturnValue([v48 dataSetArray]);
          if ([v8 length])
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord credentialsDataSet]( self->_lastKnownJoinedNetworkRecord,  "credentialsDataSet"));
            uint64_t v2 = objc_claimAutoreleasedReturnValue([v9 dataSetArray]);
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialsDataSet]);
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataSetArray]);
            unsigned __int8 v12 = [(id)v2 isEqualToData:v11];

            if ((v12 & 1) == 0)
            {
              id v13 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
              unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)__int128 buf = 136315394;
                uint64_t v62 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]";
                __int16 v63 = 1024;
                int v64 = 4691;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  " %s:%d _lastKnownJoinedNetwork is not matching to the preferred network!",  buf,  0x12u);
              }

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr
{
  return (Result *)objc_msgSend(v1, "saveThreadConfiguration:passPhrase:");
}

- (id)getCurrentNetworkNameAndXpanid
{
  int v30 = 0;
  *(_OWORD *)unsigned int v31 = *(_OWORD *)__p;
  uint64_t v32 = *(void *)&__p[16];
  uint64_t v29 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v27, "Network:Name");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v27, &v29);
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  int v4 = *sub_1000E4898(&v30, (uint64_t)__p);
  if ((__p[31] & 0x80000000) != 0) {
    operator delete(*(void **)&__p[8]);
  }
  if (v28 < 0)
  {
    operator delete(v27[0]);
    if (v4) {
      goto LABEL_8;
    }
  }

  else if (v4)
  {
LABEL_8:
    id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__p = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Failed to get the Network Name Property",  __p,  2u);
    }

    id v7 = 0LL;
    goto LABEL_39;
  }

  sub_100147B4C(&v29, (std::string *)__p);
  sub_10000D650(&v34, __p);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v8 = &v34;
  }
  else {
    int v8 = (std::string *)v34.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v35 = v8;
  id v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
    *(_WORD *)&_BYTE __p[12] = 2080;
    *(void *)&__p[14] = v35;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s : cfg network name %s", __p, 0x16u);
  }

  uint64_t v26 = 0LL;
  id v11 = self->_CtrInternalClientPtr;
  sub_10000AC00(v24, "Network:XPANID");
  if (v11) {
    -[CtrInternalClient getProperty:output:](v11, "getProperty:output:", v24, &v26);
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  int v12 = *sub_1000E4898(&v30, (uint64_t)__p);
  if ((__p[31] & 0x80000000) != 0) {
    operator delete(*(void **)&__p[8]);
  }
  if (v25 < 0)
  {
    operator delete(v24[0]);
    if (v12) {
      goto LABEL_26;
    }
LABEL_30:
    dispatch_semaphore_t v36 = sub_1001476B4(&v26, 0);
    BOOL v15 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      *(_WORD *)&_BYTE __p[12] = 2048;
      *(void *)&__p[14] = v36;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s : xpaid from NCP : 0x%llX", __p, 0x16u);
    }

    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v35));
    int v17 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      *(_WORD *)&_BYTE __p[12] = 2112;
      *(void *)&__p[14] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain nw_name : %@",  __p,  0x16u);
    }

    unint64_t v23 = bswap64((unint64_t)v36);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v23, 8LL));
    BOOL v20 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      *(_WORD *)&_BYTE __p[12] = 2112;
      *(void *)&__p[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain xpaid : %@",  __p,  0x16u);
    }

    id v7 = [[THThreadNetwork alloc] initWithName:v14 extendedPANID:v19];
    goto LABEL_37;
  }

  if (!v12) {
    goto LABEL_30;
  }
LABEL_26:
  id v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1001EE860();
  }
  id v7 = 0LL;
LABEL_37:

  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 8LL))(v26);
  }
LABEL_39:
  if (v29) {
    (*(void (**)(uint64_t))(*(void *)v29 + 8LL))(v29);
  }
  if (SHIBYTE(v32) < 0) {
    operator delete(v31[0]);
  }
  return v7;
}

- (id)getCurrentNetworkCredentials
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid](self, "getCurrentNetworkNameAndXpanid"));
  if (!v3)
  {
    id v9 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001EE88C(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    id v6 = 0LL;
    goto LABEL_9;
  }

  id v22 = 0LL;
  unsigned int v4 = -[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]( self,  "getMeCredentialsForThisNetwork:credentialsRecord_t:",  v3,  &v22);
  id v5 = v22;
  id v6 = v5;
  if (v4)
  {
    id v7 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v3 networkName]);
      objc_claimAutoreleasedReturnValue([v3 extendedPANID]);
      sub_1001EE948();
    }

LABEL_9:
    uint64_t v18 = 0LL;
    goto LABEL_15;
  }

  if (!v5)
  {
    int v19 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v3 networkName]);
      objc_claimAutoreleasedReturnValue([v3 extendedPANID]);
      sub_1001EE8FC();
    }
  }

  id v6 = v6;
  uint64_t v18 = v6;
LABEL_15:

  return v18;
}

- (id)getCurrentNetworkCredentialsActiveDataSetRecord
{
  uint64_t v51 = 0LL;
  unint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  id v54 = sub_1001D2DCC;
  uint64_t v55 = sub_1001D2DDC;
  id v56 = 0LL;
  uint64_t v45 = 0LL;
  xpc_object_t v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  std::string v48 = sub_1001D2DCC;
  __int128 v49 = sub_1001D2DDC;
  id v50 = 0LL;
  unsigned int v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001EEA74(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getCurrentBorderAgent](self, "getCurrentBorderAgent"));
  if (v13)
  {
    if (!self->_keyChainStore)
    {
      char v28 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001EE994(v16, v29, v30, v31, v32, v33, v34, v35);
      }
      id v27 = 0LL;
      goto LABEL_17;
    }

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
    keyChainStore = self->_keyChainStore;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1001DF1B8;
    v41[3] = &unk_1002B59F8;
    uint64_t v43 = &v51;
    uint64_t v44 = &v45;
    uint64_t v16 = v14;
    BOOL v42 = v16;
    -[THThreadNetworkCredentialsStoreLocalClient retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:completion:]( keyChainStore,  "retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:completion:",  v13,  v41);
    dispatch_time_t v17 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v16, v17))
    {
      uint64_t v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001EEA04(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }

    else
    {
      if (!v46[5])
      {
        id v27 = (id)v52[5];
        goto LABEL_16;
      }

      dispatch_semaphore_t v36 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v38 = objc_claimAutoreleasedReturnValue([(id) v46[5] description]);
        id v39 = [v38 UTF8String];
        if (v39)
        {
          id v2 = objc_claimAutoreleasedReturnValue([(id) v46[5] description]);
          unsigned int v40 = (const char *)[v2 UTF8String];
        }

        else
        {
          unsigned int v40 = "(unknown error)";
        }

        *(_DWORD *)__int128 buf = 136315394;
        __int16 v58 = "-[ThreadNetworkManagerInstance getCurrentNetworkCredentialsActiveDataSetRecord]";
        __int16 v59 = 2080;
        id v60 = v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s : Error: failed to retrieve (%s)\n",  buf,  0x16u);
        if (v39) {
      }
        }
    }

    id v27 = 0LL;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }

  id v27 = 0LL;
LABEL_18:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v27;
}

- (void)upgradeCredentials
{
  id v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v8 = "-[ThreadNetworkManagerInstance upgradeCredentials]";
    __int16 v9 = 1024;
    int v10 = 4896;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Upgrading Credentials", buf, 0x12u);
  }

  if (_os_feature_enabled_impl("Home", "ThreadCommissioningService"))
  {
    -[ThreadNetworkManagerInstance updateKeychainWithThreadActiveDataSet](self, "updateKeychainWithThreadActiveDataSet");
    if (v6 < 0) {
      operator delete(__p);
    }
  }

- (Result)updateKeychainWithThreadActiveDataSet
{
  id v2 = v1;
  id v14 = xpc_null_create();
  sub_10000AC00(buf, "Commond is successful");
  retstr->var0 = 0;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  unsigned int v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateKeychainWithThreadActiveDataSet]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4906;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Updating Credentials", buf, 0x12u);
  }

  id v13 = 0LL;
  [v2 saveThreadConfiguration:&v14 passPhrase:0 uuid:&v13];
  id v6 = v13;
  sub_1000E4898(retstr, (uint64_t)buf);
  if (v16 < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (retstr->var0)
  {
    uint64_t v7 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001EE1C0();
    }
  }

  else
  {
    __int16 v9 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateKeychainWithThreadActiveDataSet]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4913;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Successfully formed new network",  buf,  0x12u);
    }

    objc_msgSend( v2, "saveLastKnownJoinedNetwork:datasetRecord:", objc_msgSend(v6, "UTF8String"), 0);
  }

  id v11 = v14;
  id v14 = 0LL;

  return result;
}

- (id)getCurrentBorderAgent
{
  int v17 = 0;
  *(_OWORD *)uint64_t v18 = *(_OWORD *)__p;
  int v19 = __p[2];
  uint64_t v16 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v14, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v14, &v16);
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *sub_1000E4898(&v17, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v15 < 0)
  {
    operator delete(v14[0]);
    if (v4) {
      goto LABEL_8;
    }
  }

  else if (v4)
  {
LABEL_8:
    id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001EEAE4();
    }

    id v7 = 0LL;
    goto LABEL_15;
  }

  uint64_t v8 = sub_1001476B4(&v16, 0);
  unint64_t v13 = bswap64((unint64_t)v8);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v13, 8LL));
  int v10 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315650;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentBorderAgent]";
    WORD2(__p[1]) = 2048;
    *(void **)((char *)&__p[1] + 6) = v8;
    HIWORD(__p[2]) = 2112;
    __p[3] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s : Got Extended MAC Addess as: 0x%llx, %@",  (uint8_t *)__p,  0x20u);
  }

  id v7 = [[THThreadNetworkBorderAgent alloc] initWithBaDiscrId:v9];
LABEL_15:
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
  }
  if (SHIBYTE(v19) < 0) {
    operator delete(v18[0]);
  }
  return v7;
}

- (id)getCurrentCredentialsDataSet
{
  int v20 = 0;
  __int128 v21 = *(_OWORD *)__p;
  uint64_t v22 = v18;
  uint64_t v19 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v15, "Thread:ActiveDataset:Bytes");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v15, &v19);
  }

  else
  {
    *(_OWORD *)__p = 0u;
    __int128 v18 = 0u;
  }

  int v4 = *sub_1000E4898(&v20, (uint64_t)__p);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[1]);
  }
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (v4)
    {
LABEL_8:
      id v5 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001EEB84();
      }
      goto LABEL_20;
    }
  }

  else if (v4)
  {
    goto LABEL_8;
  }

  sub_100147058(&v19, (uint64_t)__p);
  id v7 = __p[0];
  uint64_t v8 = __p[1];
  sub_100147058(&v19, (uint64_t)v14);
  if (v7 == v8) {
    __int16 v9 = 0LL;
  }
  else {
    __int16 v9 = v7;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v9,  (char *)v14[1] - (char *)v14[0]));
  uint64_t v23 = v14;
  sub_100006F6C((void ***)&v23);
  v14[0] = __p;
  sub_100006F6C(v14);
  if (v6 && -[os_log_s length](v6, "length"))
  {
    int v10 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsDataSet),  "initWithDataSetArray:userInfo:",  v6,  0LL);
    goto LABEL_21;
  }

  id v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1001EEB10();
  }

LABEL_20:
  int v10 = 0LL;
LABEL_21:

  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete((void *)v21);
  }
  return v10;
}

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:
{
  uint64_t v3 = 0LL;
  return (Result *)objc_msgSend(v1, "saveThreadConfiguration:passPhrase:uuid:");
}

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:uuid:
{
  uint64_t v111 = v4;
  uint64_t v5 = v3;
  id v6 = v2;
  uint64_t v7 = v1;
  sub_10000AC00(&v152, "Commond is successful");
  int v140 = 0;
  __rep __p = v152;
  *(_OWORD *)&v152.var0.var1.var1 = 0uLL;
  uint64_t v153 = 0LL;
  uint64_t v134 = 0LL;
  v135 = &v134;
  uint64_t v136 = 0x3032000000LL;
  __int16 v137 = sub_1001D2DCC;
  char v138 = sub_1001D2DDC;
  id v139 = 0LL;
  [(id)v7 getNCPNetworkInfo:&v152];
  sub_1000E4898(&v140, (uint64_t)v144);
  if ((v144[31] & 0x80000000) != 0) {
    operator delete(*(void **)&v144[8]);
  }
  if (v140)
  {
    __int16 v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string((std::string *)v144, (const std::string *)&__p);
      sub_1001EED48();
    }

    goto LABEL_7;
  }

  uint64_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)char v144 = 136316931;
    *(void *)&v144[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v144[12] = 1024;
    *(_DWORD *)&v144[14] = WORD1(v152.var0.var1.var0);
    *(_WORD *)&v144[18] = 2048;
    *(void *)&v144[20] = v155;
    *(_WORD *)&v144[28] = 2080;
    *(void *)&v144[30] = v154;
    *(_WORD *)&v144[38] = 2085;
    __int16 v145 = v156;
    __int16 v146 = 2085;
    int v147 = v158;
    __int16 v148 = 1024;
    int v149 = *(unsigned __int16 *)v152.var0.var0.var0;
    __int16 v150 = 2080;
    uint64_t v151 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s : #mOS Saving TC  - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: %{sensitive}s, ch = %d passPhrase : %s",  v144,  0x4Au);
  }

  if (sub_1001E0E40(v6))
  {
    xpc_object_t v14 = xpc_int64_create(*(unsigned __int16 *)v152.var0.var0.var0);
    xpc_object_t v132 = v14;
    if (!v14)
    {
      xpc_object_t v132 = xpc_null_create();
    }

    *(void *)char v144 = v6;
    *(void *)&v144[8] = "channel";
    sub_1000089EC((uint64_t)v144, &v132, &v133);
    xpc_object_t v15 = v133;
    xpc_object_t v133 = 0LL;

    xpc_object_t v16 = v132;
    xpc_object_t v132 = 0LL;

    id v17 = sub_1000EA704(v6);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    xpc_dictionary_set_uint64(v18, "panid", WORD1(v152.var0.var1.var0));

    xpc_object_t v19 = xpc_string_create(v154);
    xpc_object_t v130 = v19;
    if (!v19)
    {
      xpc_object_t v130 = xpc_null_create();
    }

    *(void *)char v144 = v6;
    *(void *)&v144[8] = "networkName";
    sub_1000089EC((uint64_t)v144, &v130, &v131);
    xpc_object_t v20 = v131;
    xpc_object_t v131 = 0LL;

    xpc_object_t v21 = v130;
    xpc_object_t v130 = 0LL;

    xpc_object_t v22 = xpc_uint64_create(v155);
    xpc_object_t v128 = v22;
    if (!v22)
    {
      xpc_object_t v128 = xpc_null_create();
    }

    *(void *)char v144 = v6;
    *(void *)&v144[8] = "xpanid";
    sub_1000089EC((uint64_t)v144, &v128, &v129);
    xpc_object_t v23 = v129;
    xpc_object_t v129 = 0LL;

    xpc_object_t v24 = v128;
    xpc_object_t v128 = 0LL;

    id v25 = sub_1000EA704(v6);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    xpc_dictionary_set_data(v26, "masterKey", v156, 0x10uLL);

    xpc_object_t v27 = xpc_string_create(v158);
    xpc_object_t v126 = v27;
    if (!v27)
    {
      xpc_object_t v126 = xpc_null_create();
    }

    *(void *)char v144 = v6;
    *(void *)&v144[8] = "PSKc";
    sub_1000089EC((uint64_t)v144, &v126, &v127);
    xpc_object_t v28 = v127;
    xpc_object_t v127 = 0LL;

    xpc_object_t v29 = v126;
    xpc_object_t v126 = 0LL;

    uint64_t v30 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      sub_1000A9F28(v6, v144);
      uint64_t v32 = v144[23] >= 0 ? v144 : *(_BYTE **)v144;
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s : output: %s", buf, 0x16u);
      if ((v144[23] & 0x80000000) != 0) {
        operator delete(*(void **)v144);
      }
    }
  }

  uint64_t v33 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)char v144 = 136316931;
    *(void *)&v144[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v144[12] = 1024;
    *(_DWORD *)&v144[14] = WORD1(v152.var0.var1.var0);
    *(_WORD *)&v144[18] = 2048;
    *(void *)&v144[20] = v155;
    *(_WORD *)&v144[28] = 2080;
    *(void *)&v144[30] = v154;
    *(_WORD *)&v144[38] = 2085;
    __int16 v145 = v156;
    __int16 v146 = 2085;
    int v147 = v158;
    __int16 v148 = 1024;
    int v149 = *(unsigned __int16 *)v152.var0.var0.var0;
    __int16 v150 = 2080;
    uint64_t v151 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s : #mOS  Saving TC in commissionOrFormNetwork - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: % {sensitive}s, ch = %d passPhrase : %s",  v144,  0x4Au);
  }

  if (!*(void *)(v7 + 64))
  {
    std::string v48 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1001EEBF8(v40, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_42;
  }

  uint64_t v35 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  dispatch_semaphore_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)char v144 = 136315394;
    *(void *)&v144[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v144[12] = 2080;
    *(void *)&v144[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain now .... %s",  v144,  0x16u);
  }

  if (v5)
  {
    int v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    int v37 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)char v144 = 136315394;
      *(void *)&v144[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
      *(_WORD *)&v144[12] = 2080;
      *(void *)&v144[14] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain passphrase %s",  v144,  0x16u);
    }

    if (!v110)
    {
      id v39 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1001EECD8(v40, v41, v42, v43, v44, v45, v46, v47);
      }
LABEL_42:

LABEL_7:
      retstr->var0 = v140;
      retstr->var1.var0.var0 = __p;
      memset(&__p, 0, sizeof(__p));
      goto LABEL_8;
    }
  }

  else
  {
    int v110 = 0LL;
  }

  *(void *)char v144 = 0LL;
  *(void *)&v144[8] = v144;
  *(void *)&v144[16] = 0x3032000000LL;
  *(void *)&v144[24] = sub_1001D2DCC;
  *(void *)&v144[32] = sub_1001D2DDC;
  __int16 v145 = 0LL;
  uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v154));
  id v56 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v109;
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain nw_name : %@",  buf,  0x16u);
  }

  unint64_t v125 = bswap64(v155);
  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v125, 8LL));
  __int16 v58 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v108;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s : Storing to keychain xpaid : %@", buf, 0x16u);
  }

  id v104 = [[THThreadNetwork alloc] initWithName:v109 extendedPANID:v108];
  uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v156, 16LL));
  id v60 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v107;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain master key %{sensitive}@",  buf,  0x16u);
  }

  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v157, 16LL));
  uint64_t v62 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  __int16 v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v106;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain pskc %{sensitive}@",  buf,  0x16u);
  }

  uint64_t v64 = v152.var0.var0.var0[0];
  unint64_t v65 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  int v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v64;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s : Storing to keychain channel %d", buf, 0x12u);
  }

  __int16 v124 = bswap32(WORD1(v152.var0.var1.var0)) >> 16;
  id v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v124, 2LL));
  int v67 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  __int16 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v105;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s : Storing to keychain panid %@ ", buf, 0x16u);
  }

  char v69 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  __int16 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    int v71 = *(unsigned __int8 *)(v7 + 10);
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v71;
    _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "%s : Storing to keychain wait for sync : %d",  buf,  0x12u);
  }

  id v72 = dispatch_semaphore_create(0LL);
  if (!_os_feature_enabled_impl("Home", "ThreadCommissioningService"))
  {
    uint64_t v76 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials),  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:",  v107,  v110,  v106,  v64,  v105,  0LL);
    if (v76)
    {
      uint64_t v77 = *(void **)(v7 + 64);
      uint64_t v78 = v72;
      uint64_t v79 = *(unsigned __int8 *)(v7 + 10);
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472LL;
      v114[2] = sub_1001E12E8;
      v114[3] = &unk_1002B5A98;
      uint64_t v116 = v144;
      uint64_t v117 = &v134;
      id v80 = v78;
      uint64_t v115 = v78;
      [v77 storeCredentials:v76 waitForSync:v79 forNetwork:v104 completion:v114];
      uint64_t v74 = v115;
      id v72 = v80;
LABEL_68:

      BOOL v81 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
      int v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_INFO,  "%s :#mOS: Waiting for the store credentials keychain completion to finish...  ",  buf,  0xCu);
      }

      dispatch_time_t v83 = dispatch_time(0LL, 150000000000LL);
      if (dispatch_semaphore_wait(v72, v83))
      {
        uint64_t v84 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        unsigned __int8 v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_1001EEC68(v85, v86, v87, v88, v89, v90, v91, v92);
        }

        int v93 = 1;
      }

      else
      {
        if (!v135[5])
        {
          id v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)&v144[8]
                                                                                                + 40LL), "UUIDString")));
          void *v111 = v94;
          if (sub_1001E0E40(v6))
          {
            xpc_object_t v95 = xpc_string_create((const char *)[v94 UTF8String]);
            xpc_object_t v112 = v95;
            if (!v95)
            {
              xpc_object_t v112 = xpc_null_create();
            }

            *(void *)__int128 buf = v6;
            *(void *)&buf[8] = "outputUniqueNetworkId";
            sub_1000089EC((uint64_t)buf, &v112, &v113);
            xpc_object_t v96 = v113;
            xpc_object_t v113 = 0LL;

            xpc_object_t v97 = v112;
            xpc_object_t v112 = 0LL;
          }

          uint64_t v98 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
          uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            id v100 = [v94 UTF8String];
            *(_DWORD *)__int128 buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v100;
            _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_INFO,  "%s : #mOS: uniqueNetworkId: %s",  buf,  0x16u);
          }

          goto LABEL_91;
        }

        *(_DWORD *)__int128 buf = 1;
        *(void *)&uint8_t buf[16] = 0LL;
        uint64_t v143 = 0LL;
        *(void *)&buf[8] = 0LL;
        sub_1000E4898(&v140, (uint64_t)buf);
        if (SHIBYTE(v143) < 0) {
          operator delete(*(void **)&buf[8]);
        }
        if ([(id)v135[5] code] != (id)6)
        {
LABEL_91:
          retstr->var0 = v140;
          retstr->var1.var0.var0 = __p;
          memset(&__p, 0, sizeof(__p));
          goto LABEL_92;
        }

        int v93 = 13;
      }

      *(_DWORD *)__int128 buf = v93;
      *(void *)&uint8_t buf[16] = 0LL;
      uint64_t v143 = 0LL;
      *(void *)&buf[8] = 0LL;
      sub_1000E4898(&v140, (uint64_t)buf);
      if (SHIBYTE(v143) < 0) {
        operator delete(*(void **)&buf[8]);
      }
      goto LABEL_91;
    }

    goto LABEL_76;
  }

  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 getCurrentBorderAgent]);
  if (!v73)
  {
LABEL_76:
    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0LL;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0LL;
    retstr->var1.var0.var0.var0.var1.var0 = 0LL;
    goto LABEL_92;
  }

  uint64_t v74 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([(id)v7 getCurrentCredentialsDataSet]);
  if (v74)
  {
    LOBYTE(v101) = 1;
    uint64_t v75 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials),  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  v107,  v110,  v106,  v64,  v105,  0LL,  v74,  v101);
    if (v75)
    {
      uint64_t v102 = *(void **)(v7 + 64);
      unsigned int v103 = *(unsigned __int8 *)(v7 + 10);
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472LL;
      v118[2] = sub_1001E0E90;
      v118[3] = &unk_1002B5A70;
      uint64_t v122 = v144;
      v118[4] = v7;
      id v119 = v104;
      uint64_t v76 = v73;
      uint64_t v120 = v76;
      char v123 = &v134;
      char v121 = v72;
      [v102 storeThreadNetworkCredentialActiveDataSet:v76 network:v119 credentials:v75 credentialsDataSet:v74 waitForSync:v103 completion:v118];

      goto LABEL_68;
    }

    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0LL;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0LL;
    retstr->var1.var0.var0.var0.var1.var0 = 0LL;
  }

  else
  {
    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0LL;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0LL;
    retstr->var1.var0.var0.var0.var1.var0 = 0LL;
  }

- (Result)getPskc:(Result *__return_ptr)retstr pskc_str:
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  sub_10000AC00(&buf, "Commond is successful");
  unsigned int v31 = 0;
  *(__n128 *)__p.var0.var0.var0 = buf;
  *((void *)&__p.var0.var1 + 2) = v37;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v8 = *(void **)(v6 + 32);
  __int16 v9 = *(void **)(v5 + 8);
  v25[0] = *(void *)v5;
  id v10 = v9;
  v25[1] = v10;
  __int128 v26 = *(_OWORD *)(v5 + 16);
  if (v8)
  {
    [v8 generatePSKc:v25 output:&v27];
  }

  else
  {

    __n128 buf = 0u;
    __int128 v37 = 0u;
  }

  sub_1000E4898(&v31, (uint64_t)&buf);
  if (SHIBYTE(v37) < 0) {
    operator delete((void *)buf.n128_u64[1]);
  }
  if (v31)
  {
    id v11 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_1000E7B14(v31, &buf);
      int v20 = SBYTE7(v37);
      unint64_t v21 = buf.n128_u64[0];
      std::string::basic_string(&v24, (const std::string *)&__p);
      p___n128 buf = &buf;
      if (v20 < 0) {
        p___n128 buf = (__n128 *)v21;
      }
      if ((v24.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        xpc_object_t v23 = &v24;
      }
      else {
        xpc_object_t v23 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)uint64_t v33 = 136315394;
      *(void *)&v33[4] = p_buf;
      __int16 v34 = 2080;
      uint64_t v35 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Result for generatePSKc = %s, Error Info: %s",  v33,  0x16u);
      if (SBYTE7(v37) < 0) {
        operator delete((void *)buf.n128_u64[0]);
      }
    }

LABEL_24:
    retstr->var0 = v31;
    retstr->var1.var0.var0 = __p;
    memset(&__p, 0, sizeof(__p));
    goto LABEL_25;
  }

  sub_100147058(&v27, (uint64_t)&buf);
  sub_100006EFC((uint64_t)&v28, &buf);
  v24.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf;
  sub_100006F6C((void ***)&v24);
  if (v28 != v29 && v28)
  {
    sub_100147058(&v27, (uint64_t)&v24);
    if (v24.__r_.__value_.__r.__words[0] == v24.__r_.__value_.__l.__size_) {
      unint64_t v13 = 0LL;
    }
    else {
      unint64_t v13 = (const void *)v24.__r_.__value_.__r.__words[0];
    }
    *(void *)&__int128 v37 = 0LL;
    __n128 buf = 0uLL;
    sub_100018E8C(&buf, v13, (uint64_t)v13 + 16, 0x10uLL);
    sub_100006EFC((uint64_t)&v28, &buf);
    *(void *)uint64_t v33 = &buf;
    sub_100006F6C((void ***)v33);
    *(void *)uint64_t v33 = &v24;
    sub_100006F6C((void ***)v33);
    sub_100033680(&v24, (uint64_t)&v28);
    sub_100147B4C((uint64_t *)&v24, (std::string *)&buf);
    sub_100014D08(v4, (__int128 *)&buf);
    if (SBYTE7(v37) < 0) {
      operator delete((void *)buf.n128_u64[0]);
    }
    if (v24.__r_.__value_.__r.__words[0]) {
      (*(void (**)(std::string::size_type))(*(void *)v24.__r_.__value_.__l.__data_ + 8LL))(v24.__r_.__value_.__r.__words[0]);
    }
    xpc_object_t v14 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    xpc_object_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      else {
        unint64_t v16 = *(void *)v4;
      }
      buf.n128_u32[0] = 136315138;
      *(unint64_t *)((char *)buf.n128_u64 + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "PSKC : %s", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_24;
  }

  __int128 v18 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  xpc_object_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    buf.n128_u16[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Error : Pskc array is NULL", (uint8_t *)&buf, 2u);
  }

  sub_10000AC00(&buf, "pskc array is NULL");
  retstr->var0 = 3;
  *(__n128 *)retstr->var1.var0.var0.var0.var0.var0 = buf;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = v37;
LABEL_25:
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8LL))(v27);
  }
  buf.n128_u64[0] = (unint64_t)&v28;
  sub_100006F6C((void ***)&buf);
  return result;
}

- (void)saveLastKnownJoinedNetwork:(const char *)a3 datasetRecord:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastKnownJoinedNetworkRecord, a4);
    uint64_t v8 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__n128 buf = 136315394;
      int v20 = "-[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]";
      __int16 v21 = 1024;
      int v22 = 5343;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s:%d last known joined network record",  buf,  0x12u);
    }

    sub_1001D5710(self->_lastKnownJoinedNetworkRecord);
    goto LABEL_5;
  }

  if (!a3)
  {
LABEL_5:
    id v10 = 0LL;
    goto LABEL_6;
  }

  id v18 = 0LL;
  unsigned int v11 = -[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]( self,  "retrieveActiveDataSetRecordForUniqueId:record:",  a3,  &v18);
  id v12 = v18;
  id v10 = v18;
  if (v11)
  {
    unint64_t v13 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    xpc_object_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001EEDFC();
    }
  }

  else
  {
    p_lastKnownJoinedNetworkRecord = (void **)&self->_lastKnownJoinedNetworkRecord;
    objc_storeStrong((id *)&self->_lastKnownJoinedNetworkRecord, v12);
    unint64_t v16 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__n128 buf = 136315394;
      int v20 = "-[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]";
      __int16 v21 = 1024;
      int v22 = 5352;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s:%d last known joined network record read from uuid",  buf,  0x12u);
    }

    sub_1001D5710(*p_lastKnownJoinedNetworkRecord);
  }

- (int)formNewNetwork:(dict)a3
{
  unsigned int v89 = 3;
  std::string v90 = v87;
  sub_10000AC00(&v84, "Command is Successful");
  LODWORD(v87.__r_.__value_.__l.__data_) = 0;
  *(_OWORD *)&v87.__r_.__value_.__r.__words[1] = v84;
  id v88 = v85;
  __int128 v84 = 0uLL;
  id v85 = 0LL;
  v82[0] = 0LL;
  v82[1] = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v5 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__n128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Form NW Cmd received in state %d", buf, 8u);
  }

  -[ThreadNetworkManagerInstance threadLeave](self, "threadLeave");
  unsigned int v8 = generatreNewPANIDAsInt();
  unint64_t NewXPANIDAsInt = generateNewXPANIDAsInt();
  NewMasterKeyAsByteArray = generateNewMasterKeyAsByteArray();
  id v11 = objc_claimAutoreleasedReturnValue(NewMasterKeyAsByteArray);
  __int128 v120 = *(_OWORD *)[v11 bytes];

  id v12 = generatreNewNetworkName();
  id v13 = objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 cStringUsingEncoding:4];

  id CommisonerCredentialAsString = generateCommisonerCredentialAsString();
  id v16 = objc_claimAutoreleasedReturnValue(CommisonerCredentialAsString);
  id v17 = [v16 cStringUsingEncoding:4];

  id v85 = v17;
  unint64_t v86 = NewXPANIDAsInt;
  *(void *)&__int128 v84 = v14;
  -[ThreadNetworkManagerInstance getPskc:pskc_str:](self, "getPskc:pskc_str:", &v84, v82);
  sub_1000E4898(&v89, (uint64_t)buf);
  if (v89)
  {
    id v18 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    xpc_object_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001EEEF4(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    goto LABEL_43;
  }

  uint64_t v27 = sub_1000160F4("com.apple.wpantund.tnm", "form");
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = v82;
    if (v83 < 0) {
      uint64_t v29 = (void **)v82[0];
    }
    *(_DWORD *)__n128 buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNewNetwork:]";
    *(_WORD *)&buf[12] = 2085;
    *(void *)&buf[14] = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s : pskc string : %{sensitive}s", buf, 0x16u);
  }

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "Network:PSKc");
  if (CtrInternalClientPtr)
  {
    if (v83 >= 0) {
      unsigned int v31 = v82;
    }
    else {
      unsigned int v31 = (void **)v82[0];
    }
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", __p, v31);
  }

  else
  {
    memset(buf, 0, 32);
  }

  sub_1000E4898(&v89, (uint64_t)buf);
  if (v81 < 0) {
    operator delete(__p[0]);
  }
  if (v89)
  {
    uint64_t v32 = sub_1000160F4("com.apple.wpantund.tnm", "form");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      sub_1000E7B14(v89, &v79);
      int size = (char)v79.__r_.__value_.__s.__size_;
      std::string::size_type v63 = v79.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v117, &v90);
      uint64_t v64 = &v79;
      if (size < 0) {
        uint64_t v64 = (std::string *)v63;
      }
      if ((v117.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v65 = &v117;
      }
      else {
        unint64_t v65 = (std::string *)v117.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__n128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "Network:PSKc";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v64;
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&_BYTE buf[24] = v65;
      _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Set Result for %s = %s, Error Info: %s",  buf,  0x20u);
    }

- (int)attachToNetwork:(dict)a3 output:(dict *)a4
{
  string = 0LL;
  id v103 = 0LL;
  __int16 v104 = 256;
  size_t length = 0LL;
  sub_10000AC00(&__p, "Command Error");
  unsigned int v69 = 3;
  std::string v70 = __p;
  sub_10000AC00(&buf, "Command is Successful");
  LODWORD(__p.__r_.__value_.__l.__data_) = 0;
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = buf;
  uint64_t v68 = v101;
  id v7 = sub_1000160F4("com.apple.wpantund.tnm", "join");
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    LODWORD(buf) = 67109120;
    DWORD1(buf) = lastKnownNCPState;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Attach NW Cmd received in state %d",  (uint8_t *)&buf,  8u);
  }

  id v10 = sub_1000EA704((id *)a3.var0.var0);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = xpc_dictionary_get_BOOL(v11, "clearThreadCredentials");
  LOBYTE(v104) = v12;

  if (v12)
  {
    -[ThreadNetworkManagerInstance clearThreadCredentials](self, "clearThreadCredentials");
    sleep(1u);
    -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
    id v13 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = self->_lastKnownNCPState;
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "AttachTNetwork New state is %d",  (uint8_t *)&buf,  8u);
    }
  }

  if (self->_lastKnownNCPState != 4) {
    goto LABEL_32;
  }
  id v16 = sub_1000EA704((id *)a3.var0.var0);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = xpc_dictionary_get_BOOL(v17, "hasNetworkKey");
  HIBYTE(v104) = v18;

  id v19 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = v20;
  if (!v18)
  {
    LOBYTE(v105) = xpc_dictionary_get_uint64(v20, "channel");
    __int16 v105 = v105;

    id v36 = sub_1000EA704((id *)a3.var0.var0);
    std::string::size_type v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    __int16 uint64 = xpc_dictionary_get_uint64(v37, "panid");

    id v38 = sub_1000EA704((id *)a3.var0.var0);
    id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    uint64_t v107 = xpc_dictionary_get_uint64(v39, "xpanid");

    id v40 = sub_1000EA704((id *)a3.var0.var0);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    string = xpc_dictionary_get_string(v41, "network_name");

    sub_1001BF91C(&v66, (id *)a3.var0.var0);
    int v42 = -[ThreadNetworkManagerInstance commissionOrFormNetwork:is_attaching:cfg_attach:output:]( self,  "commissionOrFormNetwork:is_attaching:cfg_attach:output:",  &v66,  1LL,  &string,  a4);
    BOOL v43 = v66;
    int v66 = 0LL;

    goto LABEL_33;
  }

  unsigned __int8 v22 = xpc_dictionary_get_uint64(v20, "channel");

  id v23 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int16 v25 = xpc_dictionary_get_uint64(v24, "panid");

  id v26 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = xpc_dictionary_get_uint64(v27, "xpanid");

  id v29 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  unsigned int v31 = xpc_dictionary_get_string(v30, "network_name");

  id v32 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  data = (__int128 *)xpc_dictionary_get_data(v33, "network_key", &length);

  __int128 v108 = *data;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v94[0] = v31;
  v94[1] = "router";
  __int16 v65 = v22;
  __int16 v95 = v22;
  __int16 v96 = v25;
  uint64_t v97 = v28;
  __int128 v98 = v108;
  int v99 = 16843009;
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient join:](CtrInternalClientPtr, "join:", v94);
  }

  else
  {
    __int128 buf = 0u;
    __int128 v101 = 0u;
  }

  sub_1000E4898(&v69, (uint64_t)&buf);
  if (SHIBYTE(v101) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  int v44 = sub_1000160F4("com.apple.wpantund.tnm", "join");
  uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    uint64_t v46 = v31;
    uint64_t v47 = v28;
    int v48 = a4;
    sub_1000E7B14(v69, &buf);
    int v49 = SBYTE7(v101);
    uint64_t v50 = (__int128 *)buf;
    std::string::basic_string(&v89, &v70);
    p___int128 buf = &buf;
    if (v49 < 0) {
      p___int128 buf = v50;
    }
    if ((v89.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v52 = &v89;
    }
    else {
      uint64_t v52 = (std::string *)v89.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string v90 = 136315394;
    uint64_t v91 = p_buf;
    __int16 v92 = 2080;
    __int16 v93 = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "TNM got the Result for Join as = %s, Error Info: %s",  v90,  0x16u);
    a4 = v48;
    uint64_t v28 = v47;
    if (SBYTE7(v101) < 0) {
      operator delete((void *)buf);
    }
    unsigned int v31 = v46;
  }

  if (!v69) {
    goto LABEL_42;
  }
  -[ThreadNetworkManagerInstance clearThreadCredentials](self, "clearThreadCredentials");
  sleep(1u);
  -[ThreadNetworkManagerInstance getNCPState:](self, "getNCPState:", 0LL);
  uint64_t v53 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    sub_1001EEF64((uint64_t)&self->_lastKnownNCPState, v54, v55, v56, v57, v58, v59, v60);
  }

  if (self->_lastKnownNCPState != 4)
  {
LABEL_32:
    int v42 = 4;
    goto LABEL_33;
  }

  *(_OWORD *)&v89.__r_.__value_.__l.__data_ = *data;
  uint64_t v61 = self->_CtrInternalClientPtr;
  char v72 = v31;
  char v73 = 1;
  __int16 v74 = v65;
  char v75 = 0;
  int v76 = 0;
  char v77 = 1;
  __int16 v78 = v25;
  char v79 = 1;
  uint64_t v80 = v28;
  char v81 = 1;
  __int128 v82 = *(_OWORD *)&v89.__r_.__value_.__l.__data_;
  char v83 = 0;
  int v84 = 0;
  char v85 = 0;
  unint64_t v86 = "router";
  char v87 = 0;
  char v88 = 0;
  if (v61)
  {
    -[CtrInternalClient form:](v61, "form:", &v72);
  }

  else
  {
    __int128 buf = 0u;
    __int128 v101 = 0u;
  }

  sub_1000E4898(&v69, (uint64_t)&buf);
  if (SHIBYTE(v101) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  if (v69) {
    goto LABEL_48;
  }
LABEL_42:
  -[ThreadNetworkManagerInstance saveThreadConfiguration:](self, "saveThreadConfiguration:", a4);
  sub_1000E4898(&__p, (uint64_t)&buf);
  if (SHIBYTE(v101) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  if (LODWORD(__p.__r_.__value_.__l.__data_))
  {
    std::string::size_type v63 = sub_1000160F4("com.apple.wpantund.tnm", "join");
    uint64_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_1001EE1C0();
    }

    -[ThreadNetworkManagerInstance clearThreadCredentials](self, "clearThreadCredentials");
LABEL_48:
    int v42 = 1;
    goto LABEL_33;
  }

  int v42 = 0;
LABEL_33:
  if (SHIBYTE(v68) < 0) {
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  }

  return v42;
}

- (int)setChannelUsingChannelManger:(dict)a3
{
  id v4 = sub_1000EA704((id *)a3.var0.var0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v5, "property_value");

  id v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)BOOL v43 = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SetChannel Cmd received in state %d", buf, 8u);
  }

  -[ThreadNetworkManagerInstance getNCPChannel](self, "getNCPChannel");
  int lastUpdatedNCPChannel = self->_lastUpdatedNCPChannel;
  if (atoi(string) == lastUpdatedNCPChannel)
  {
    id v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = self->_lastUpdatedNCPChannel;
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)BOOL v43 = string;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)&v43[10] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "SetChannel Cmd received: Channel rcvd(%s) is same the one configred in NCP(%d)",  buf,  0x12u);
    }

    return 0;
  }

  else
  {
    int lastKnownNodeType = self->_lastKnownNodeType;
    if (lastKnownNodeType == 1 || lastKnownNodeType == 7)
    {
      sub_10000AC00(__p, "Command Error");
      *(_DWORD *)__int128 buf = 3;
      *(_OWORD *)&v43[4] = *(_OWORD *)__p;
      int v44 = __p[2];
      CtrInternalClientPtr = self->_CtrInternalClientPtr;
      sub_10000AC00(v39, "ChannelManager:Delay");
      if (CtrInternalClientPtr) {
        -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v39, "120");
      }
      else {
        memset(__p, 0, sizeof(__p));
      }
      sub_1000E4898(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (v40 < 0) {
        operator delete(v39[0]);
      }
      id v19 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        sub_1000E7B14(*(unsigned int *)buf, v37);
        int v21 = SHIBYTE(v38);
        unsigned __int8 v22 = (void **)v37[0];
        std::string::basic_string(&v36, (const std::string *)&v43[4]);
        id v23 = v37;
        if (v21 < 0) {
          id v23 = v22;
        }
        if ((v36.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          uint64_t v24 = &v36;
        }
        else {
          uint64_t v24 = (std::string *)v36.__r_.__value_.__r.__words[0];
        }
        LODWORD(__p[0]) = 136315650;
        *(void **)((char *)__p + 4) = "ChannelManager:Delay";
        WORD2(__p[1]) = 2080;
        *(void **)((char *)&__p[1] + 6) = v23;
        HIWORD(__p[2]) = 2080;
        __p[3] = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  (uint8_t *)__p,  0x20u);
        if (SHIBYTE(v38) < 0) {
          operator delete(v37[0]);
        }
      }

      if (*(_DWORD *)buf) {
        goto LABEL_52;
      }
      sub_10000AC00(v37, "Command Error");
      LODWORD(__p[0]) = 3;
      *(_OWORD *)&__p[1] = *(_OWORD *)v37;
      __p[3] = v38;
      v37[0] = 0LL;
      v37[1] = 0LL;
      id v38 = 0LL;
      sub_1000E4898(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (SHIBYTE(v38) < 0) {
        operator delete(v37[0]);
      }
      __int16 v25 = self->_CtrInternalClientPtr;
      sub_10000AC00(v34, "ChannelManager:NewChannel");
      if (v25) {
        -[CtrInternalClient setProperty:property_val:](v25, "setProperty:property_val:", v34, string);
      }
      else {
        memset(__p, 0, sizeof(__p));
      }
      sub_1000E4898(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (v35 < 0) {
        operator delete(v34[0]);
      }
      id v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        sub_1000E7B14(*(unsigned int *)buf, v37);
        int v28 = SHIBYTE(v38);
        id v29 = (void **)v37[0];
        std::string::basic_string(&v36, (const std::string *)&v43[4]);
        uint64_t v30 = v37;
        if (v28 < 0) {
          uint64_t v30 = v29;
        }
        if ((v36.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          unsigned int v31 = &v36;
        }
        else {
          unsigned int v31 = (std::string *)v36.__r_.__value_.__r.__words[0];
        }
        LODWORD(__p[0]) = 136315650;
        *(void **)((char *)__p + 4) = "ChannelManager:NewChannel";
        WORD2(__p[1]) = 2080;
        *(void **)((char *)&__p[1] + 6) = v30;
        HIWORD(__p[2]) = 2080;
        __p[3] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  (uint8_t *)__p,  0x20u);
        if (SHIBYTE(v38) < 0) {
          operator delete(v37[0]);
        }
      }

      if (*(_DWORD *)buf)
      {
LABEL_52:
        int v14 = 1;
      }

      else
      {
        self->___int16 lastHostConfiguredChannel = atoi(string);
        int v33 = atoi(string);
        sub_1001104E4("lastHostConfiguredChannel", v33);
        int v14 = 0;
      }

      if (SHIBYTE(v44) < 0) {
        operator delete(*(void **)&v43[4]);
      }
    }

    else
    {
      id v17 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001EEFCC();
      }

      return 1;
    }
  }

  return v14;
}

- (int)setLogTimestampBase
{
  uint64_t v3 = (char *)operator new[](0x11uLL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  NSLog(@"Current Time:%@", v4);
  [v4 timeIntervalSince1970];
  unint64_t v6 = (unint64_t)(v5 * 1000.0);
  NSLog(@"UINT64 Time Interval since 1970 (msec): %llu", v6);
  sprintf(v3, "0x%016llx", v6);
  sub_10000AC00(__p, "Command Error");
  unsigned int v26 = 3;
  std::string v27 = *(std::string *)__p;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v24, "OpenThread:LogTimestampBase");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v24, v3);
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  sub_1000E4898(&v26, (uint64_t)__p);
  if ((__p[31] & 0x80000000) != 0) {
    operator delete(*(void **)&__p[8]);
  }
  if (v25 < 0) {
    operator delete(v24[0]);
  }
  if (v26)
  {
    unsigned int v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_1000E7B14(v26, v22);
      int v17 = v23;
      BOOL v18 = (void **)v22[0];
      std::string::basic_string(&v21, &v27);
      id v19 = v22;
      if (v17 < 0) {
        id v19 = v18;
      }
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v20 = &v21;
      }
      else {
        uint64_t v20 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string __p = 136315650;
      *(void *)&__p[4] = "OpenThread:LogTimestampBase";
      *(_WORD *)&_BYTE __p[12] = 2080;
      *(void *)&__p[14] = v19;
      *(_WORD *)&__p[22] = 2080;
      *(void *)&__p[24] = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Get Result for set %s, %s, Error Info: %s",  __p,  0x20u);
      if (v23 < 0) {
        operator delete(v22[0]);
      }
    }

    int v10 = 1;
  }

  else
  {
    id v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v26, v22);
      int v12 = v23;
      int v13 = (void **)v22[0];
      std::string::basic_string(&v21, &v27);
      int v14 = v22;
      if (v12 < 0) {
        int v14 = v13;
      }
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v15 = &v21;
      }
      else {
        int v15 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string __p = 136315650;
      *(void *)&__p[4] = "OpenThread:LogTimestampBase";
      *(_WORD *)&_BYTE __p[12] = 2080;
      *(void *)&__p[14] = v14;
      *(_WORD *)&__p[22] = 2080;
      *(void *)&__p[24] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  __p,  0x20u);
      if (v23 < 0) {
        operator delete(v22[0]);
      }
    }

    int v10 = 0;
  }

  operator delete[](v3);
  return v10;
}

- (int)setChannel:(dict)a3
{
  id v4 = sub_1000EA704((id *)a3.var0.var0);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v5, "property_value");

  id v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SetChannel Cmd received in state %d", buf, 8u);
  }

  -[ThreadNetworkManagerInstance getNCPChannel](self, "getNCPChannel");
  int lastUpdatedNCPChannel = self->_lastUpdatedNCPChannel;
  if (atoi(string) != lastUpdatedNCPChannel)
  {
    int v15 = self->_lastKnownNCPState;
    if (v15 == 4)
    {
      sub_10000AC00(v207, "Command Error");
      *(_DWORD *)__int128 buf = 3;
      *(_OWORD *)&buf[8] = *(_OWORD *)v207;
      *(void *)&_BYTE buf[24] = v207[2];
      CtrInternalClientPtr = self->_CtrInternalClientPtr;
      sub_10000AC00(v201, "NCP:Channel");
      if (CtrInternalClientPtr) {
        -[CtrInternalClient setProperty:property_val:](CtrInternalClientPtr, "setProperty:property_val:", v201, string);
      }
      else {
        memset(v207, 0, 32);
      }
      sub_1000E4898(buf, (uint64_t)v207);
      if (SHIBYTE(v207[3]) < 0) {
        operator delete((void *)v207[1]);
      }
      if (v202 < 0) {
        operator delete(v201[0]);
      }
      if (*(_DWORD *)buf)
      {
        int v33 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          sub_1000E7B14(*(unsigned int *)buf, &v206);
          int size = (char)v206.__r_.__value_.__s.__size_;
          std::string::size_type v85 = v206.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v200, (const std::string *)&buf[8]);
          unint64_t v86 = &v206;
          if (size < 0) {
            unint64_t v86 = (std::string *)v85;
          }
          if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            char v87 = &v200;
          }
          else {
            char v87 = (std::string *)v200.__r_.__value_.__r.__words[0];
          }
          LODWORD(v207[0]) = 136315650;
          *(void *)((char *)v207 + 4) = "NCP:Channel";
          WORD2(v207[1]) = 2080;
          *(void *)((char *)&v207[1] + 6) = v86;
          HIWORD(v207[2]) = 2080;
          v207[3] = v87;
          _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Get Result for set %s, %s, Error Info: %s",  (uint8_t *)v207,  0x20u);
        }

        int v14 = 1;
      }

      else
      {
        char v35 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        std::string v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          sub_1000E7B14(*(unsigned int *)buf, &v206);
          int v37 = (char)v206.__r_.__value_.__s.__size_;
          std::string::size_type v38 = v206.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v200, (const std::string *)&buf[8]);
          id v39 = &v206;
          if (v37 < 0) {
            id v39 = (std::string *)v38;
          }
          if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            char v40 = &v200;
          }
          else {
            char v40 = (std::string *)v200.__r_.__value_.__r.__words[0];
          }
          LODWORD(v207[0]) = 136315650;
          *(void *)((char *)v207 + 4) = "NCP:Channel";
          WORD2(v207[1]) = 2080;
          *(void *)((char *)&v207[1] + 6) = v39;
          HIWORD(v207[2]) = 2080;
          v207[3] = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  (uint8_t *)v207,  0x20u);
        }

        self->___int16 lastHostConfiguredChannel = atoi(string);
        int v41 = atoi(string);
        sub_1001104E4("lastHostConfiguredChannel", v41);
        int v14 = 0;
      }

      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      goto LABEL_80;
    }

    if (v15 != 5 && v15 != 8)
    {
      std::string v21 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v65 = self->_lastUpdatedNCPChannel;
        int v66 = self->_lastKnownNCPState;
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = string;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v65;
        *(_WORD *)&_BYTE buf[18] = 1024;
        *(_DWORD *)&buf[20] = v66;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "SetChannel Cmd received: Channel rcvd(%s), NCP channel is : (%d) in state in appropriate : %d, returning error.",  buf,  0x18u);
      }

      int v14 = 1;
      goto LABEL_80;
    }

    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v17 = v16;
    if (!v16) {
      xpc_object_t v17 = xpc_null_create();
    }

    id v18 = v17;
    id v19 = v18;
    id v199 = v18;
    if (v18)
    {
      if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v199 = xpc_null_create();
      }
    }

    else
    {
      id v199 = xpc_null_create();
    }

    sub_10000AC00(buf, "Command Error");
    LODWORD(v207[0]) = 3;
    *(_OWORD *)&v207[1] = *(_OWORD *)buf;
    v207[3] = *(void *)&buf[16];
    char v23 = self->_CtrInternalClientPtr;
    sub_10000AC00(__p, "Dataset:Command");
    if (v23) {
      -[CtrInternalClient setProperty:property_val:](v23, "setProperty:property_val:", __p, "Erase");
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v198 < 0) {
      operator delete(__p[0]);
    }
    if (LODWORD(v207[0]))
    {
      uint64_t v24 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      char v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v207[0], &v206);
        int v61 = (char)v206.__r_.__value_.__s.__size_;
        std::string::size_type v62 = v206.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v200, (const std::string *)&v207[1]);
        std::string::size_type v63 = &v206;
        if (v61 < 0) {
          std::string::size_type v63 = (std::string *)v62;
        }
        if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          uint64_t v64 = &v200;
        }
        else {
          uint64_t v64 = (std::string *)v200.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315906;
        *(void *)&uint8_t buf[4] = "Dataset:Command";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "Erase";
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v63;
        __int16 v204 = 2080;
        v205 = v64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Set Result for %s --> %s, %s, Error Info: %s",  buf,  0x2Au);
      }

LABEL_76:
      int v14 = 1;
LABEL_77:
      if (SHIBYTE(v207[3]) < 0) {
        operator delete((void *)v207[1]);
      }

      goto LABEL_80;
    }

    unsigned int v26 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    std::string v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v207[0], &v206);
      int v28 = (char)v206.__r_.__value_.__s.__size_;
      std::string::size_type v29 = v206.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v200, (const std::string *)&v207[1]);
      uint64_t v30 = &v206;
      if (v28 < 0) {
        uint64_t v30 = (std::string *)v29;
      }
      if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unsigned int v31 = &v200;
      }
      else {
        unsigned int v31 = (std::string *)v200.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315906;
      *(void *)&uint8_t buf[4] = "Dataset:Command";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Erase";
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&_BYTE buf[24] = v30;
      __int16 v204 = 2080;
      v205 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Set Result for %s --> %s, %s, Error Info: %s",  buf,  0x2Au);
    }

    sub_10000AC00(&v206, "Command Error");
    *(_DWORD *)__int128 buf = 3;
    *(std::string *)&buf[8] = v206;
    memset(&v206, 0, sizeof(v206));
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    id v32 = self->_CtrInternalClientPtr;
    sub_10000AC00(v195, "Dataset:Command");
    if (v32) {
      -[CtrInternalClient setProperty:property_val:](v32, "setProperty:property_val:", v195, "GetActive");
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v196 < 0) {
      operator delete(v195[0]);
    }
    if (LODWORD(v207[0]))
    {
      int v42 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      BOOL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v207[0], &v206);
        int v88 = (char)v206.__r_.__value_.__s.__size_;
        std::string::size_type v89 = v206.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v200, (const std::string *)&v207[1]);
        std::string v90 = &v206;
        if (v88 < 0) {
          std::string v90 = (std::string *)v89;
        }
        if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          uint64_t v91 = &v200;
        }
        else {
          uint64_t v91 = (std::string *)v200.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315906;
        *(void *)&uint8_t buf[4] = "Dataset:Command";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "GetActive";
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v90;
        __int16 v204 = 2080;
        v205 = v91;
        _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Set Result for %s --> %s, %s, Error Info: %s",  buf,  0x2Au);
      }

      goto LABEL_76;
    }

    uint64_t v45 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v207[0], &v206);
      int v47 = (char)v206.__r_.__value_.__s.__size_;
      std::string::size_type v48 = v206.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v200, (const std::string *)&v207[1]);
      int v49 = &v206;
      if (v47 < 0) {
        int v49 = (std::string *)v48;
      }
      if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v50 = &v200;
      }
      else {
        uint64_t v50 = (std::string *)v200.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315906;
      *(void *)&uint8_t buf[4] = "Dataset:Command";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "GetActive";
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&_BYTE buf[24] = v49;
      __int16 v204 = 2080;
      v205 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Set Result for %s --> %s, %s, Error Info: %s",  buf,  0x2Au);
    }

    uint64_t v194 = 0LL;
    uint64_t v51 = self->_CtrInternalClientPtr;
    sub_10000AC00(v192, "Dataset");
    if (v51) {
      -[CtrInternalClient getProperty:output:](v51, "getProperty:output:", v192, &v194);
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v193 < 0) {
      operator delete(v192[0]);
    }
    if (LODWORD(v207[0]))
    {
      uint64_t v52 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v207[0], &v206);
        int v107 = (char)v206.__r_.__value_.__s.__size_;
        std::string::size_type v108 = v206.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v200, (const std::string *)&v207[1]);
        char v109 = &v206;
        if (v107 < 0) {
          char v109 = (std::string *)v108;
        }
        if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          int v110 = &v200;
        }
        else {
          int v110 = (std::string *)v200.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "Dataset";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v109;
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v110;
        _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Get Result for get %s, %s, Error Info: %s",  buf,  0x20u);
      }

      int v14 = 1;
LABEL_339:
      if (v194) {
        (*(void (**)(uint64_t))(*(void *)v194 + 8LL))(v194);
      }
      goto LABEL_77;
    }

    uint64_t v54 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v207[0], &v206);
      int v56 = (char)v206.__r_.__value_.__s.__size_;
      std::string::size_type v57 = v206.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v200, (const std::string *)&v207[1]);
      uint64_t v58 = &v206;
      if (v56 < 0) {
        uint64_t v58 = (std::string *)v57;
      }
      if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v59 = &v200;
      }
      else {
        uint64_t v59 = (std::string *)v200.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "Dataset";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v58;
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&_BYTE buf[24] = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "Get Result for get %s, %s, Error Info: %s",  buf,  0x20u);
    }

    sub_10000AC00(&v206, "Command Error");
    *(_DWORD *)__int128 buf = 3;
    *(std::string *)&buf[8] = v206;
    memset(&v206, 0, sizeof(v206));
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    uint64_t v191 = 0LL;
    uint64_t v60 = self->_CtrInternalClientPtr;
    sub_10000AC00(v189, "Dataset:ActiveTimestamp");
    if (v60) {
      -[CtrInternalClient getProperty:output:](v60, "getProperty:output:", v189, &v191);
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v190 < 0) {
      operator delete(v189[0]);
    }
    int v67 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      sub_1000E7B14(v207[0], &v206);
      int v69 = (char)v206.__r_.__value_.__s.__size_;
      std::string::size_type v70 = v206.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v200, (const std::string *)&v207[1]);
      int v71 = &v206;
      if (v69 < 0) {
        int v71 = (std::string *)v70;
      }
      if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        char v72 = &v200;
      }
      else {
        char v72 = (std::string *)v200.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "Dataset:ActiveTimestamp";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v71;
      *(_WORD *)&_BYTE buf[22] = 2080;
      *(void *)&_BYTE buf[24] = v72;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_INFO,  "Get Result for get %s, %s, Error Info: %s",  buf,  0x20u);
    }

    char v73 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    __int16 v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      sub_100147B4C(&v191, (std::string *)buf);
      char v75 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
      LODWORD(v206.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v206.__r_.__value_.__r.__words + 4) = (std::string::size_type)v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "PTS => %s", (uint8_t *)&v206, 0xCu);
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }

    int v76 = sub_1001476B4(&v191, 0);
    if (LODWORD(v207[0]))
    {
      char v77 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      __int16 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v207[0], &v206);
        int v121 = (char)v206.__r_.__value_.__s.__size_;
        std::string::size_type v122 = v206.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v200, (const std::string *)&v207[1]);
        char v123 = &v206;
        if (v121 < 0) {
          char v123 = (std::string *)v122;
        }
        if ((v200.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          __int16 v124 = &v200;
        }
        else {
          __int16 v124 = (std::string *)v200.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "Dataset:ActiveTimestamp";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v123;
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v124;
        _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "Get Result for get %s, %s, Error Info: %s",  buf,  0x20u);
      }

      int v14 = 1;
LABEL_337:
      if (v191) {
        (*(void (**)(uint64_t))(*(void *)v191 + 8LL))(v191);
      }
      goto LABEL_339;
    }

    unint64_t v79 = (unint64_t)v76;
    uint64_t v80 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    char v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v79;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Got PTS value of 0x%llx", buf, 0xCu);
    }

    unint64_t v44 = v79 + 0x10000;
    if (v79 >= 0xFFFFFFFFFFFF0000LL)
    {
      __break(0x5500u);
      return v44;
    }

    std::to_string(&v206, v44);
    sub_10000AC00(&v200, "Command Error");
    *(_DWORD *)__int128 buf = 3;
    *(std::string *)&buf[8] = v200;
    memset(&v200, 0, sizeof(v200));
    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    __int128 v82 = self->_CtrInternalClientPtr;
    sub_10000AC00(v187, "Dataset:PendingTimestamp");
    if (v82)
    {
      if ((v206.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        char v83 = &v206;
      }
      else {
        char v83 = (std::string *)v206.__r_.__value_.__r.__words[0];
      }
      -[CtrInternalClient setProperty:property_val:](v82, "setProperty:property_val:", v187, v83);
    }

    else
    {
      memset(buf, 0, sizeof(buf));
    }

    sub_1000E4898(v207, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v188 < 0) {
      operator delete(v187[0]);
    }
    if (LODWORD(v207[0]))
    {
      __int16 v92 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        sub_1000E7B14(v207[0], &v200);
        int v94 = (char)v200.__r_.__value_.__s.__size_;
        std::string::size_type v95 = v200.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v186, (const std::string *)&v207[1]);
        __int16 v96 = &v200;
        if (v94 < 0) {
          __int16 v96 = (std::string *)v95;
        }
        if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          uint64_t v97 = &v186;
        }
        else {
          uint64_t v97 = (std::string *)v186.__r_.__value_.__r.__words[0];
        }
LABEL_192:
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "Dataset:ActiveTimestamp";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v96;
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v97;
        __int128 v98 = "Get Result for set %s, %s, Error Info: %s";
LABEL_329:
        __int128 v154 = v93;
        uint32_t v155 = 32;
LABEL_330:
        _os_log_error_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, v98, buf, v155);
      }
    }

    else
    {
      int v99 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      char v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        sub_1000E7B14(v207[0], &v200);
        int v101 = (char)v200.__r_.__value_.__s.__size_;
        std::string::size_type v102 = v200.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v186, (const std::string *)&v207[1]);
        id v103 = &v200;
        if (v101 < 0) {
          id v103 = (std::string *)v102;
        }
        if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          __int16 v104 = &v186;
        }
        else {
          __int16 v104 = (std::string *)v186.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "Dataset:ActiveTimestamp";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v103;
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&_BYTE buf[24] = v104;
        _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  buf,  0x20u);
      }

      sub_10000AC00(&v200, "Command Error");
      *(_DWORD *)__int128 buf = 3;
      *(std::string *)&buf[8] = v200;
      memset(&v200, 0, sizeof(v200));
      sub_1000E4898(v207, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      __int16 v105 = self->_CtrInternalClientPtr;
      sub_10000AC00(v184, "Dataset:ActiveTimestamp");
      if (v105)
      {
        if ((v206.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          unint64_t v106 = &v206;
        }
        else {
          unint64_t v106 = (std::string *)v206.__r_.__value_.__r.__words[0];
        }
        -[CtrInternalClient setProperty:property_val:](v105, "setProperty:property_val:", v184, v106);
      }

      else
      {
        memset(buf, 0, sizeof(buf));
      }

      sub_1000E4898(v207, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v185 < 0) {
        operator delete(v184[0]);
      }
      if (LODWORD(v207[0]))
      {
        char v111 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          sub_1000E7B14(v207[0], &v200);
          int v112 = (char)v200.__r_.__value_.__s.__size_;
          std::string::size_type v113 = v200.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v186, (const std::string *)&v207[1]);
          __int16 v96 = &v200;
          if (v112 < 0) {
            __int16 v96 = (std::string *)v113;
          }
          if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            uint64_t v97 = &v186;
          }
          else {
            uint64_t v97 = (std::string *)v186.__r_.__value_.__r.__words[0];
          }
          goto LABEL_192;
        }
      }

      else
      {
        char v114 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        char v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          sub_1000E7B14(v207[0], &v200);
          int v116 = (char)v200.__r_.__value_.__s.__size_;
          std::string::size_type v117 = v200.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v186, (const std::string *)&v207[1]);
          uint64_t v118 = &v200;
          if (v116 < 0) {
            uint64_t v118 = (std::string *)v117;
          }
          if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            id v119 = &v186;
          }
          else {
            id v119 = (std::string *)v186.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)&uint8_t buf[4] = "Dataset:ActiveTimestamp";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v118;
          *(_WORD *)&_BYTE buf[22] = 2080;
          *(void *)&_BYTE buf[24] = v119;
          _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  buf,  0x20u);
        }

        sub_10000AC00(&v200, "Command Error");
        *(_DWORD *)__int128 buf = 3;
        *(std::string *)&buf[8] = v200;
        memset(&v200, 0, sizeof(v200));
        sub_1000E4898(v207, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        __int128 v120 = self->_CtrInternalClientPtr;
        sub_10000AC00(v182, "Dataset:Channel");
        if (v120) {
          -[CtrInternalClient setProperty:property_val:](v120, "setProperty:property_val:", v182, string);
        }
        else {
          memset(buf, 0, sizeof(buf));
        }
        sub_1000E4898(v207, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v183 < 0) {
          operator delete(v182[0]);
        }
        if (LODWORD(v207[0]))
        {
          unint64_t v125 = sub_1000160F4("com.apple.wpantund.tnm", "default");
          __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            sub_1000E7B14(v207[0], &v200);
            int v126 = (char)v200.__r_.__value_.__s.__size_;
            std::string::size_type v127 = v200.__r_.__value_.__r.__words[0];
            std::string::basic_string(&v186, (const std::string *)&v207[1]);
            xpc_object_t v128 = &v200;
            if (v126 < 0) {
              xpc_object_t v128 = (std::string *)v127;
            }
            if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              xpc_object_t v129 = &v186;
            }
            else {
              xpc_object_t v129 = (std::string *)v186.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)__int128 buf = 136315650;
            *(void *)&uint8_t buf[4] = "Dataset:Channel";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v128;
            *(_WORD *)&_BYTE buf[22] = 2080;
            *(void *)&_BYTE buf[24] = v129;
            __int128 v98 = "Get Result for set %s, %s, Error Info: %s";
            goto LABEL_329;
          }
        }

        else
        {
          xpc_object_t v130 = sub_1000160F4("com.apple.wpantund.tnm", "default");
          xpc_object_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            sub_1000E7B14(v207[0], &v200);
            int v132 = (char)v200.__r_.__value_.__s.__size_;
            std::string::size_type v133 = v200.__r_.__value_.__r.__words[0];
            std::string::basic_string(&v186, (const std::string *)&v207[1]);
            uint64_t v134 = &v200;
            if (v132 < 0) {
              uint64_t v134 = (std::string *)v133;
            }
            if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              v135 = &v186;
            }
            else {
              v135 = (std::string *)v186.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)__int128 buf = 136315650;
            *(void *)&uint8_t buf[4] = "Dataset:Channel";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v134;
            *(_WORD *)&_BYTE buf[22] = 2080;
            *(void *)&_BYTE buf[24] = v135;
            _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  buf,  0x20u);
          }

          sub_10000AC00(&v200, "Command Error");
          *(_DWORD *)__int128 buf = 3;
          *(std::string *)&buf[8] = v200;
          memset(&v200, 0, sizeof(v200));
          sub_1000E4898(v207, (uint64_t)buf);
          if ((buf[31] & 0x80000000) != 0) {
            operator delete(*(void **)&buf[8]);
          }
          uint64_t v136 = self->_CtrInternalClientPtr;
          sub_10000AC00(v180, "Dataset:Delay");
          if (v136) {
            -[CtrInternalClient setProperty:property_val:](v136, "setProperty:property_val:", v180, "120000");
          }
          else {
            memset(buf, 0, sizeof(buf));
          }
          sub_1000E4898(v207, (uint64_t)buf);
          if ((buf[31] & 0x80000000) != 0) {
            operator delete(*(void **)&buf[8]);
          }
          if (v181 < 0) {
            operator delete(v180[0]);
          }
          if (LODWORD(v207[0]))
          {
            __int16 v137 = sub_1000160F4("com.apple.wpantund.tnm", "default");
            __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              sub_1000E7B14(v207[0], &v200);
              int v138 = (char)v200.__r_.__value_.__s.__size_;
              std::string::size_type v139 = v200.__r_.__value_.__r.__words[0];
              std::string::basic_string(&v186, (const std::string *)&v207[1]);
              int v140 = &v200;
              if (v138 < 0) {
                int v140 = (std::string *)v139;
              }
              if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                id v141 = &v186;
              }
              else {
                id v141 = (std::string *)v186.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)__int128 buf = 136315650;
              *(void *)&uint8_t buf[4] = "Dataset:Delay";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = v140;
              *(_WORD *)&_BYTE buf[22] = 2080;
              *(void *)&_BYTE buf[24] = v141;
              __int128 v98 = "Get Result for set %s, %s, Error Info: %s";
              goto LABEL_329;
            }
          }

          else
          {
            char v142 = sub_1000160F4("com.apple.wpantund.tnm", "default");
            uint64_t v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
            if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
            {
              sub_1000E7B14(v207[0], &v200);
              int v144 = (char)v200.__r_.__value_.__s.__size_;
              std::string::size_type v145 = v200.__r_.__value_.__r.__words[0];
              std::string::basic_string(&v186, (const std::string *)&v207[1]);
              __int16 v146 = &v200;
              if (v144 < 0) {
                __int16 v146 = (std::string *)v145;
              }
              if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                int v147 = &v186;
              }
              else {
                int v147 = (std::string *)v186.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)__int128 buf = 136315650;
              *(void *)&uint8_t buf[4] = "Dataset:Delay";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = v146;
              *(_WORD *)&_BYTE buf[22] = 2080;
              *(void *)&_BYTE buf[24] = v147;
              _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_INFO,  "Get Result for set %s, %s, Error Info: %s",  buf,  0x20u);
            }

            sub_10000AC00(&v200, "Command Error");
            *(_DWORD *)__int128 buf = 3;
            *(std::string *)&buf[8] = v200;
            memset(&v200, 0, sizeof(v200));
            sub_1000E4898(v207, (uint64_t)buf);
            if ((buf[31] & 0x80000000) != 0) {
              operator delete(*(void **)&buf[8]);
            }
            __int16 v148 = self->_CtrInternalClientPtr;
            sub_10000AC00(v178, "Dataset");
            if (v148) {
              -[CtrInternalClient getProperty:output:](v148, "getProperty:output:", v178, &v194);
            }
            else {
              memset(buf, 0, sizeof(buf));
            }
            sub_1000E4898(v207, (uint64_t)buf);
            if ((buf[31] & 0x80000000) != 0) {
              operator delete(*(void **)&buf[8]);
            }
            if (v179 < 0) {
              operator delete(v178[0]);
            }
            if (LODWORD(v207[0]))
            {
              int v149 = sub_1000160F4("com.apple.wpantund.tnm", "default");
              __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                sub_1000E7B14(v207[0], &v200);
                int v150 = (char)v200.__r_.__value_.__s.__size_;
                std::string::size_type v151 = v200.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v186, (const std::string *)&v207[1]);
                __rep v152 = &v200;
                if (v150 < 0) {
                  __rep v152 = (std::string *)v151;
                }
                if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  uint64_t v153 = &v186;
                }
                else {
                  uint64_t v153 = (std::string *)v186.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)__int128 buf = 136315650;
                *(void *)&uint8_t buf[4] = "Dataset";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = v152;
                *(_WORD *)&_BYTE buf[22] = 2080;
                *(void *)&_BYTE buf[24] = v153;
                __int128 v98 = "Get Result for get %s, %s, Error Info: %s";
                goto LABEL_329;
              }
            }

            else
            {
              int v156 = sub_1000160F4("com.apple.wpantund.tnm", "default");
              uint64_t v157 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);
              if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
              {
                sub_1000E7B14(v207[0], &v200);
                int v158 = (char)v200.__r_.__value_.__s.__size_;
                std::string::size_type v159 = v200.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v186, (const std::string *)&v207[1]);
                char v160 = &v200;
                if (v158 < 0) {
                  char v160 = (std::string *)v159;
                }
                if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  char v161 = &v186;
                }
                else {
                  char v161 = (std::string *)v186.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)__int128 buf = 136315650;
                *(void *)&uint8_t buf[4] = "Dataset";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = v160;
                *(_WORD *)&_BYTE buf[22] = 2080;
                *(void *)&_BYTE buf[24] = v161;
                _os_log_impl( (void *)&_mh_execute_header,  v157,  OS_LOG_TYPE_INFO,  "Get Result for get %s, %s, Error Info: %s",  buf,  0x20u);
              }

              sub_10000AC00(&v200, "Command Error");
              *(_DWORD *)__int128 buf = 3;
              *(std::string *)&buf[8] = v200;
              memset(&v200, 0, sizeof(v200));
              sub_1000E4898(v207, (uint64_t)buf);
              if ((buf[31] & 0x80000000) != 0) {
                operator delete(*(void **)&buf[8]);
              }
              v162 = self->_CtrInternalClientPtr;
              sub_10000AC00(v176, "Dataset:Command");
              if (v162) {
                -[CtrInternalClient setProperty:property_val:](v162, "setProperty:property_val:", v176, "SetPending");
              }
              else {
                memset(buf, 0, sizeof(buf));
              }
              sub_1000E4898(v207, (uint64_t)buf);
              if ((buf[31] & 0x80000000) != 0) {
                operator delete(*(void **)&buf[8]);
              }
              if (v177 < 0) {
                operator delete(v176[0]);
              }
              if (!LODWORD(v207[0]))
              {
                char v168 = sub_1000160F4("com.apple.wpantund.tnm", "default");
                v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);
                if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
                {
                  sub_1000E7B14(v207[0], &v200);
                  int v170 = (char)v200.__r_.__value_.__s.__size_;
                  std::string::size_type v171 = v200.__r_.__value_.__r.__words[0];
                  std::string::basic_string(&v186, (const std::string *)&v207[1]);
                  int v172 = &v200;
                  if (v170 < 0) {
                    int v172 = (std::string *)v171;
                  }
                  if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                    v173 = &v186;
                  }
                  else {
                    v173 = (std::string *)v186.__r_.__value_.__r.__words[0];
                  }
                  *(_DWORD *)__int128 buf = 136315906;
                  *(void *)&uint8_t buf[4] = "Dataset:Command";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "SetPending";
                  *(_WORD *)&_BYTE buf[22] = 2080;
                  *(void *)&_BYTE buf[24] = v172;
                  __int16 v204 = 2080;
                  v205 = v173;
                  _os_log_impl( (void *)&_mh_execute_header,  v169,  OS_LOG_TYPE_INFO,  "Set Result for %s --> %s, %s, Error Info: %s",  buf,  0x2Au);
                }

                self->___int16 lastHostConfiguredChannel = atoi(string);
                int v174 = atoi(string);
                sub_1001104E4("lastHostConfiguredChannel", v174);
                int v14 = 0;
                goto LABEL_335;
              }

              v163 = sub_1000160F4("com.apple.wpantund.tnm", "default");
              __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                sub_1000E7B14(v207[0], &v200);
                int v164 = (char)v200.__r_.__value_.__s.__size_;
                std::string::size_type v165 = v200.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v186, (const std::string *)&v207[1]);
                v166 = &v200;
                if (v164 < 0) {
                  v166 = (std::string *)v165;
                }
                if ((v186.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  char v167 = &v186;
                }
                else {
                  char v167 = (std::string *)v186.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)__int128 buf = 136315906;
                *(void *)&uint8_t buf[4] = "Dataset:Command";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "SetPending";
                *(_WORD *)&_BYTE buf[22] = 2080;
                *(void *)&_BYTE buf[24] = v166;
                __int16 v204 = 2080;
                v205 = v167;
                __int128 v98 = "Set Result for %s --> %s, %s, Error Info: %s";
                __int128 v154 = v93;
                uint32_t v155 = 42;
                goto LABEL_330;
              }
            }
          }
        }
      }
    }

    int v14 = 1;
LABEL_335:
    goto LABEL_337;
  }

  id v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = self->_lastUpdatedNCPChannel;
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = string;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "SetChannel Cmd received: Channel rcvd(%s) is same the one configred in NCP(%d)",  buf,  0x12u);
  }

  int v14 = 0;
LABEL_80:
  LODWORD(v44) = v14;
  return v44;
}

- (void)getNCPState:(BOOL)a3
{
  BOOL v3 = a3;
  sub_10000AC00(buf, "Command Error");
  int v25 = 3;
  *(timeval *)unsigned int v26 = buf[0];
  __darwin_time_t tv_sec = buf[1].tv_sec;
  uint64_t v24 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:State");
  if (CtrInternalClientPtr) {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v24);
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  sub_1000E4898(&v25, (uint64_t)buf);
  if (v23 < 0) {
    operator delete(__p[0]);
  }
  if (v25)
  {
    unint64_t v6 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0].tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = (__darwin_time_t)"-[ThreadNetworkManagerInstance getNCPState:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s : Failed to get the NCP State Property",  (uint8_t *)buf,  0xCu);
    }
  }

  else
  {
    uint64_t v8 = sub_10000B370();
    __darwin_time_t v9 = sub_10000B428();
    int v10 = &v21;
    sub_100147B4C(&v24, &v21);
    if ((v21.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int v10 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
    id v11 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0].tv_sec) = 134218498;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v8;
      *((_WORD *)&buf[0].tv_usec + 2) = 2048;
      *(void *)((char *)&buf[0].tv_usec + 6) = v9;
      HIWORD(buf[1].tv_sec) = 2080;
      *(void *)&buf[1].tv_usec = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[%llu, %llu] %s : NCP State Property",  (uint8_t *)buf,  0x20u);
    }

    self->_prevKnownNCPState = self->_lastKnownNCPState;
    int v13 = sub_10000AC00(buf, (char *)v10);
    int lastKnownNCPState = sub_1000B5828(v13);
    self->_int lastKnownNCPState = lastKnownNCPState;
    if (SHIBYTE(buf[1].tv_sec) < 0)
    {
      operator delete((void *)buf[0].tv_sec);
      int lastKnownNCPState = self->_lastKnownNCPState;
    }

    srputil_set_ncp_state(lastKnownNCPState);
    if (self->_lastKnownNCPState == 8 && qword_1002D1A30)
    {
      gettimeofday(buf, 0LL);
      __darwin_time_t v15 = buf[0].tv_sec;
      if (buf[0].tv_sec)
      {
        xpc_object_t v16 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        xpc_object_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          if (__OFSUB__(v15, qword_1002D1A30))
          {
            __break(0x5515u);
            return;
          }

          *(_DWORD *)int v28 = 134217984;
          __darwin_time_t v29 = v15 - qword_1002D1A30;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Associated: %ld sec since threadStartMsg\n",  v28,  0xCu);
        }
      }

      qword_1002D1A30 = 0LL;
      dword_1002D1A38 = 0;
    }

    id v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = self->_lastKnownNCPState;
      LODWORD(buf[0].tv_sec) = 136315394;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = (__darwin_time_t)v10;
      *((_WORD *)&buf[0].tv_usec + 2) = 1024;
      *(__darwin_suseconds_t *)((char *)&buf[0].tv_usec + 6) = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "TNM read NCP state as: %s, %d \n",  (uint8_t *)buf,  0x12u);
    }

    if (v3) {
      -[ThreadNetworkManagerInstance checkAndResumeNW](self, "checkAndResumeNW");
    }
  }

  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
  }
  if (SHIBYTE(tv_sec) < 0) {
    operator delete(v26[0]);
  }
}

- (void)checkPreferredThreadNetworkTimerHandler
{
  BOOL v3 = objc_autoreleasePoolPush();
  if (self->_isPeriodicCaCollectionMeshcopRunning)
  {
    id v4 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EF06C();
    }
  }

  else
  {
    unint64_t v6 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v19 = "-[ThreadNetworkManagerInstance checkPreferredThreadNetworkTimerHandler]";
      __int16 v20 = 1024;
      int v21 = 5991;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: check preferred thread network timer handler",  buf,  0x12u);
    }

    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v9 = v8;
    if (!v8) {
      xpc_object_t v9 = xpc_null_create();
    }

    id v10 = v9;
    id v11 = v10;
    id v17 = v10;
    if (v10)
    {
      if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v17 = xpc_null_create();
      }
    }

    else
    {
      id v17 = xpc_null_create();
    }

    int v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001EEFF8();
    }

    -[ThreadNetworkManagerInstance checkPreferredAndJoin:](self, "checkPreferredAndJoin:", &v17);
    int v14 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    __darwin_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v19 = "-[ThreadNetworkManagerInstance checkPreferredThreadNetworkTimerHandler]";
      __int16 v20 = 1024;
      int v21 = 5999;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s:%d: check preferred thread network timer handler Done",  buf,  0x12u);
    }

    id v16 = v17;
    id v17 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
}

- (void)initCheckPreferredTimer
{
  BOOL v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    BOOL v43 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]";
    __int16 v44 = 1024;
    int v45 = 6014;
    __int16 v46 = 2048;
    uint64_t v47 = 0x40D5214000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s:%d : initiating check preferred timer, default wait time : %f",  buf,  0x1Cu);
  }

  double v5 = sub_100110B88("CheckPreferredTimeStamp");
  unint64_t v6 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    BOOL v43 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]";
    __int16 v44 = 1024;
    int v45 = 6019;
    __int16 v46 = 2048;
    uint64_t v47 = *(void *)&v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d : initiating check preferred timer, checkPreferredTimeStamp : %f",  buf,  0x1Cu);
  }

  dispatch_time_t v8 = dispatch_time(0LL, 21637000000000LL);
  if (v5 != 0.0)
  {
    xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v9 timeIntervalSince1970];
    double v11 = v10;

    if (v11 <= 1657720000.0)
    {
      id v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136316162;
        BOOL v43 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]";
        __int16 v44 = 1024;
        int v45 = 6043;
        __int16 v46 = 2048;
        uint64_t v47 = *(void *)&v11;
        __int16 v48 = 2048;
        uint64_t v49 = 0x41D8B3B330000000LL;
        __int16 v50 = 2048;
        uint64_t v51 = 0x40D5214000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s:%d : Invalid case : current timestamp :%f is less than default time stamp :%f of self heal thread network t imer, default wait time in secs : %f",  buf,  0x30u);
      }

      goto LABEL_12;
    }

    int v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    double v14 = v5 + 21637.0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315906;
      BOOL v43 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]";
      __int16 v44 = 1024;
      int v45 = 6030;
      __int16 v46 = 2048;
      uint64_t v47 = *(void *)&v11;
      __int16 v48 = 2048;
      uint64_t v49 = *(void *)&v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s:%d : check preferred timer, current time : %f,  next stop to trigger timer : %f ",  buf,  0x26u);
    }

    if (v11 < v14)
    {
      double v15 = v14 - v11;
      dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(v15 * 1000000000.0));
      id v16 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        BOOL v43 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]";
        __int16 v44 = 1024;
        int v45 = 6036;
        __int16 v46 = 2048;
        uint64_t v47 = *(void *)&v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s:%d : current is less than periodicity of self heal thread network timer, wait time in secs : %f",  buf,  0x1Cu);
      }

- (id)getHardwareAddress
{
  int v24 = 3;
  *(_OWORD *)int v25 = *(_OWORD *)buf;
  uint64_t v26 = v30;
  uint64_t v23 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:assigned:hw:mac");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v23);
  }

  else
  {
    *(_OWORD *)__int128 buf = 0u;
    __int128 v30 = 0u;
  }

  sub_1000E4898(&v24, (uint64_t)buf);
  if (SHIBYTE(v30) < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (v24)
  {
    id v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EF1C4(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    int v13 = 0LL;
  }

  else
  {
    double v14 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TNM successfully got Hardware Address", buf, 2u);
    }

    sub_100147058(&v23, (uint64_t)buf);
    uint64_t v28 = **(void **)buf;
    *(void *)uint64_t v27 = buf;
    sub_100006F6C((void ***)v27);
    sub_100159A78((unint64_t)&v28, 8LL, buf, 0x14uLL, 0);
    id v16 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v27 = 136642819;
      *(void *)&v27[4] = buf;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "TNM read HW address string: %{sensitive}s",  v27,  0xCu);
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
    id v18 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    dispatch_queue_attr_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v27 = 138739971;
      *(void *)&v27[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "TNM read HW address as: %{sensitive}@",  v27,  0xCu);
    }
  }

  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8LL))(v23);
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  return v13;
}

- (Result)getNCPNetworkInfo:(Result *__return_ptr)retstr
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  sub_10000AC00(buf, "Commond is successful");
  retstr->id var0 = 0;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.id var0 = *(_OWORD *)buf;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  int v65 = 0LL;
  uint64_t v6 = *(void **)(v4 + 32);
  sub_10000AC00(v63, "NCP:Channel");
  if (v6) {
    [v6 getProperty:v63 output:&v65];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  int v7 = *sub_1000E4898(retstr, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v64 < 0)
  {
    operator delete(v63[0]);
    if (v7) {
      goto LABEL_8;
    }
  }

  else if (v7)
  {
LABEL_8:
    uint64_t v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to get the Channel Property", buf, 2u);
    }

    goto LABEL_102;
  }

  *(_WORD *)uint64_t v3 = sub_1001472F4((uint64_t *)&v65);
  uint64_t v62 = 0LL;
  uint64_t v10 = *(void **)(v4 + 32);
  sub_10000AC00(__p, "Network:Name");
  if (v10) {
    [v10 getProperty:__p output:&v62];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  int v11 = *sub_1000E4898(retstr, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v61 < 0)
  {
    operator delete(__p[0]);
    if (v11) {
      goto LABEL_19;
    }
LABEL_23:
    sub_100147B4C(&v62, (std::string *)buf);
    sub_10000D650((std::string *)(v3 + 8), buf);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    else {
      uint64_t v14 = *(void *)(v3 + 8);
    }
    *(void *)(v3 + 32) = v14;
    double v15 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(v3 + 32);
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNCPNetworkInfo:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s : cfg network name %s", buf, 0x16u);
    }

    uint64_t v59 = 0LL;
    id v18 = *(void **)(v4 + 32);
    sub_10000AC00(v57, "Network:XPANID");
    if (v18) {
      [v18 getProperty:v57 output:&v59];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    int v19 = *sub_1000E4898(retstr, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v58 < 0)
    {
      operator delete(v57[0]);
      if (v19) {
        goto LABEL_37;
      }
    }

    else if (v19)
    {
LABEL_37:
      __int16 v20 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Failed to get the Network XPANID Property",  buf,  2u);
      }

LABEL_98:
      if (v59) {
        (*(void (**)(uint64_t))(*(void *)v59 + 8LL))(v59);
      }
      goto LABEL_100;
    }

    *(void *)(v3 + 40) = sub_1001476B4(&v59, 0);
    char v22 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(v3 + 40);
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNCPNetworkInfo:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s : xpanid from NCP : 0x%llX", buf, 0x16u);
    }

    uint64_t v56 = 0LL;
    int v25 = *(void **)(v4 + 32);
    sub_10000AC00(v54, "Network:PANID");
    if (v25) {
      [v25 getProperty:v54 output:&v56];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    int v26 = *sub_1000E4898(retstr, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v55 < 0) {
      operator delete(v54[0]);
    }
    if (v26)
    {
      uint64_t v27 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Failed to get the PANID Property", buf, 2u);
      }
    }

    else
    {
      *(_WORD *)(v3 + 2) = sub_1001472F4(&v56);
      uint64_t v53 = 0LL;
      uint64_t v29 = *(void **)(v4 + 32);
      sub_10000AC00(v51, "Network:PartitionId");
      if (v29) {
        [v29 getProperty:v51 output:&v53];
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      int v30 = *sub_1000E4898(retstr, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v52 < 0) {
        operator delete(v51[0]);
      }
      if (v30)
      {
        uint64_t v31 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Failed to get the Network Partition Id",  buf,  2u);
        }
      }

      else
      {
        int v33 = sub_1001472F4(&v53);
        __int16 v34 = sub_1000160F4("com.apple.wpantund.tnm", "default");
        char v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Network Partition Id: %d", buf, 8u);
        }

        uint64_t v50 = 0LL;
        std::string v36 = *(void **)(v4 + 32);
        sub_10000AC00(v48, "Network:Key");
        if (v36) {
          [v36 getProperty:v48 output:&v50];
        }
        else {
          memset(buf, 0, sizeof(buf));
        }
        int v37 = *sub_1000E4898(retstr, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v49 < 0) {
          operator delete(v48[0]);
        }
        if (v37)
        {
          std::string::size_type v38 = sub_1000160F4("com.apple.wpantund.tnm", "default");
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Failed to get the Network Key Property",  buf,  2u);
          }
        }

        else
        {
          sub_100147058(&v50, (uint64_t)buf);
          *(_OWORD *)(v3 + 48) = **(_OWORD **)buf;
          int v66 = (void **)buf;
          sub_100006F6C(&v66);
          uint64_t v47 = 0LL;
          char v40 = *(void **)(v4 + 32);
          sub_10000AC00(v45, "Network:PSKc");
          if (v40) {
            [v40 getProperty:v45 output:&v47];
          }
          else {
            memset(buf, 0, sizeof(buf));
          }
          int v41 = *sub_1000E4898(retstr, (uint64_t)buf);
          if ((buf[31] & 0x80000000) != 0) {
            operator delete(*(void **)&buf[8]);
          }
          if (v46 < 0) {
            operator delete(v45[0]);
          }
          if (v41)
          {
            int v42 = sub_1000160F4("com.apple.wpantund.tnm", "default");
            BOOL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "Failed to get the Network PSKC Property",  buf,  2u);
            }
          }

          else
          {
            sub_100147058(&v47, (uint64_t)buf);
            *(_OWORD *)(v3 + 64) = **(_OWORD **)buf;
            int v66 = (void **)buf;
            sub_100006F6C(&v66);
            sub_100159A78(v3 + 64, 16LL, (_BYTE *)(v3 + 80), 0x24uLL, 0);
          }

          if (v47) {
            (*(void (**)(uint64_t))(*(void *)v47 + 8LL))(v47);
          }
        }

        if (v50) {
          (*(void (**)(uint64_t))(*(void *)v50 + 8LL))(v50);
        }
      }

      if (v53) {
        (*(void (**)(uint64_t))(*(void *)v53 + 8LL))(v53);
      }
    }

    if (v56) {
      (*(void (**)(uint64_t))(*(void *)v56 + 8LL))(v56);
    }
    goto LABEL_98;
  }

  if (!v11) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to get the Network Name Property", buf, 2u);
  }

LABEL_100:
  if (v62) {
    (*(void (**)(uint64_t))(*(void *)v62 + 8LL))(v62);
  }
LABEL_102:
  id result = v65;
  if (v65) {
    return (Result *)(*(uint64_t (**)(Result *))(*(void *)&v65->var0 + 8LL))(v65);
  }
  return result;
}

- (void)getNCPChannel
{
  int v12 = 3;
  *(_OWORD *)int v13 = *(_OWORD *)__p;
  uint64_t v14 = v16;
  uint64_t v11 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v9, "NCP:Channel");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v9, &v11);
  }

  else
  {
    *(_OWORD *)std::string __p = 0u;
    __int128 v16 = 0u;
  }

  sub_1000E4898(&v12, (uint64_t)__p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[1]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  if (v12)
  {
    uint64_t v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EF234();
    }
  }

  else
  {
    unsigned __int8 v6 = sub_1001472F4(&v11);
    self->_int lastUpdatedNCPChannel = v6;
    int v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int lastUpdatedNCPChannel = self->_lastUpdatedNCPChannel;
      LODWORD(__p[0]) = 67109376;
      HIDWORD(__p[0]) = v6;
      LOWORD(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 2) = lastUpdatedNCPChannel;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "TNM read NCP channel as: %d, Last Updated NCPChannel: %d \n",  (uint8_t *)__p,  0xEu);
    }
  }

  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(v13[0]);
  }
}

- (void)resumeNetwork
{
  unsigned int v16 = 3;
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
  v17.__r_.__value_.__l.__cap_ = v15;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient resume](CtrInternalClientPtr, "resume");
  }

  else
  {
    *(_OWORD *)std::string __p = 0u;
    __int128 v15 = 0u;
  }

  sub_1000E4898(&v16, (uint64_t)__p);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[1]);
  }
  uint64_t v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sub_1000E7B14(v16, __p);
    int v6 = SBYTE7(v15);
    int v7 = (void **)__p[0];
    std::string::basic_string(&v13, &v17);
    uint64_t v8 = __p;
    if (v6 < 0) {
      uint64_t v8 = v7;
    }
    if ((v13.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v9 = &v13;
    }
    else {
      uint64_t v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315394;
    int v19 = v8;
    __int16 v20 = 2080;
    int v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "TNM request for Resume NW ==> res = %s, Error Info: %s \n",  buf,  0x16u);
    if (SBYTE7(v15) < 0) {
      operator delete(__p[0]);
    }
  }

  sleep(0xAu);
  objc_initWeak(__p, self);
  fQueue = (dispatch_queue_s *)self->_fQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001E7E48;
  v11[3] = &unk_1002B5870;
  objc_copyWeak(&v12, __p);
  dispatch_async(fQueue, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(__p);
}

- (void)triggerScan
{
  uint64_t v3 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TNM Triggering scan in state %d \n", buf, 8u);
  }

  sub_10000AC00(buf, "Command Error");
  int v6 = 0;
  unsigned int v27 = 3;
  *((void *)&v7 + 1) = *(void *)&buf[8];
  std::string v28 = *(std::string *)buf;
  scannedNetworkCount = 0;
  char v8 = 1;
  uint64_t v9 = "Command Error";
  *(void *)&__int128 v7 = 67109890LL;
  __int128 v21 = v7;
  do
  {
    char v10 = v8;
    sub_10000AC00(__p, v9);
    *(_DWORD *)__int128 buf = 3;
    *(_OWORD *)&buf[8] = *(_OWORD *)__p;
    *(void *)&_BYTE buf[24] = v26;
    __p[0] = 0LL;
    __p[1] = 0LL;
    uint64_t v26 = 0LL;
    sub_1000E4898(&v27, (uint64_t)buf);
    if (SHIBYTE(v26) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance CtrInternalClientPtr](self, "CtrInternalClientPtr", v21));
    id v12 = v11;
    v23[0] = 60LL;
    v23[1] = 0xFFFF000000000000LL;
    int v24 = 2;
    if (v11) {
      [v11 scan:v23];
    }
    else {
      memset(buf, 0, 32);
    }
    sub_1000E4898(&v27, (uint64_t)buf);

    std::string v13 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int128 v15 = v9;
      sub_1000E7B14(v27, __p);
      int v16 = SHIBYTE(v26);
      std::string v17 = (void **)__p[0];
      unsigned int v18 = v27;
      std::string::basic_string(&v22, &v28);
      int v19 = __p;
      if (v16 < 0) {
        int v19 = v17;
      }
      __int16 v20 = &v22;
      if ((v22.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        __int16 v20 = (std::string *)v22.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = v21;
      *(_DWORD *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v19;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v18;
      *(_WORD *)&_BYTE buf[24] = 2080;
      *(void *)&buf[26] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "TNM Scan(%d) Result = %s, Error Code: %d, Error Info: %s \n",  buf,  0x22u);
      uint64_t v9 = v15;
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
    }

    char v8 = 0;
    int v6 = 1;
  }

  while ((v10 & 1) != 0);
}

- (void)checkAndResumeNW
{
  fQueue = (dispatch_queue_s *)self->_fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001E82B4;
  v4[3] = &unk_1002B5870;
  objc_copyWeak(&v5, &location);
  dispatch_async(fQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)startNetworkTopologyBuilder
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  tnm_nw_topology_fetch_timer = self->_tnm_nw_topology_fetch_timer;
  self->_tnm_nw_topology_fetch_timer = v5;

  dispatch_time_t v7 = dispatch_time(0LL, 3600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)self->_tnm_nw_topology_fetch_timer, v7, 0x34630B8A000uLL, 0LL);
  char v8 = self->_tnm_nw_topology_fetch_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001E8440;
  handler[3] = &unk_1002B5570;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  dispatch_activate((dispatch_object_t)self->_tnm_nw_topology_fetch_timer);
  uint64_t v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "TNM: startNetworkTopologyBuilder : Starting",  v11,  2u);
  }
}

- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3
{
  uint64_t v27 = 0LL;
  std::string v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  int v30 = sub_1001D2DCC;
  uint64_t v31 = sub_1001D2DDC;
  id v3 = a3;
  id v32 = v3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v21 = 0LL;
  std::string v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  int v24 = sub_1001D2DCC;
  int v25 = sub_1001D2DDC;
  id UUIDAsStr = getUUIDAsStr();
  id v26 = (id)objc_claimAutoreleasedReturnValue(UUIDAsStr);
  if (v22[5])
  {
    int v6 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    dispatch_time_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v22[5];
      *(_DWORD *)__int128 buf = 136315650;
      __int16 v34 = "-[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]";
      __int16 v35 = 1024;
      int v36 = 6441;
      __int16 v37 = 2112;
      uint64_t v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Starting Scan Tag : %@", buf, 0x1Cu);
    }
  }

  uint64_t v9 = (void *)v28[5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001E8B5C;
  v17[3] = &unk_1002B5AC0;
  int v19 = &v21;
  __int16 v20 = &v27;
  char v10 = v4;
  unsigned int v18 = v10;
  [v9 startScan:v17 queue:&_dispatch_main_q timeInSec:5];
  uint64_t v11 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v34 = "-[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]";
    __int16 v35 = 1024;
    int v36 = 6449;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s:%d: Finding Thread network Border Routers around",  buf,  0x12u);
  }

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = [(id)v28[5] findNWs];
  uint64_t v14 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001EF2B8();
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return (unint64_t)v13;
}

- (BOOL)checkIfNetworkIsFoundInMDNSScan:(id)a3 borderAgentID:(id)a4
{
  id v76 = a3;
  char v75 = (NSString *)a4;
  int v6 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  dispatch_time_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  char v83 = self;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6459;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Entered. Checking if Network matches with Mdns",  buf,  0x12u);
  }

  uint64_t v8 = self;
  if (!self->_BAFinder)
  {
    uint64_t v9 = -[ThreadNetworkfinder init](objc_opt_new(&OBJC_CLASS___ThreadNetworkfinder), "init");
    BAFinder = self->_BAFinder;
    self->_BAFinder = v9;

    uint64_t v8 = self;
    if (!self->_BAFinder)
    {
      int v71 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      char v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
        __int16 v86 = 1024;
        *(_DWORD *)char v87 = 6465;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", buf, 0x12u);
      }

      goto LABEL_85;
    }
  }

  unint64_t v82 = -[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]( v8,  "getCountOfThreadBorderRoutersWithMdns:");
  if (!v82)
  {
LABEL_82:
    int v67 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      int v69 = (void *)objc_claimAutoreleasedReturnValue([v76 networkName]);
      sub_1001EF33C(v69, (uint64_t)buf, v68);
    }

    -[ThreadNetworkfinder clear](v83->_BAFinder, "clear");
LABEL_85:
    BOOL v73 = 0;
    goto LABEL_86;
  }

  uint64_t v12 = 0LL;
  *(void *)&__int128 v11 = 136315906LL;
  __int128 v74 = v11;
  while (1)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkfinder getBorderAgentForIndex:](v8->_BAFinder, "getBorderAgentForIndex:", v12, v74));
    uint64_t v14 = v13;
    if (v13) {
      break;
    }
LABEL_24:
    int v30 = 0LL;
    uint64_t v31 = 0LL;
    id v32 = 0LL;
    int v33 = 0LL;
LABEL_25:

LABEL_26:
    int v34 = v12 + 1;
    if (__OFADD__((_DWORD)v12, 1)) {
      __break(0x5500u);
    }
    uint64_t v12 = v34;
    uint64_t v8 = v83;
    if (v82 <= v34) {
      goto LABEL_82;
    }
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 addresses]);
  BOOL v16 = v15 == 0LL;

  if (v16)
  {
    int v24 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_24;
    }

    *(_DWORD *)__int128 buf = 136315394;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 2112;
    *(void *)char v87 = v14;
    id v26 = (os_log_s *)v25;
    uint64_t v27 = "%s : No IP address is available for the server : %@, continue to next BR";
    uint32_t v28 = 22;
LABEL_63:
    _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
    goto LABEL_23;
  }

  std::string v17 = (void *)objc_claimAutoreleasedReturnValue([v14 TXTRecordData]);
  char v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNetService dictionaryFromTXTRecordData:]( &OBJC_CLASS___NSNetService,  "dictionaryFromTXTRecordData:",  v17));

  if (!v81)
  {
    uint64_t v29 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    int v25 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)__int128 buf = 136315650;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6488;
    *(_WORD *)&v87[4] = 2112;
    *(void *)&v87[6] = v14;
    id v26 = (os_log_s *)v25;
    uint64_t v27 = "%s : %d No text record data available for the server : %@, continue to next network";
    uint32_t v28 = 28;
    goto LABEL_63;
  }

  __int16 v78 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKey:@"nn"]);
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKey:@"xp"]);
  unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKey:@"xa"]);
  unsigned int v18 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6496;
    *(_WORD *)&v87[4] = 2112;
    *(void *)&v87[6] = v81;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent MDNS Text Record Data : %@",  buf,  0x1Cu);
  }

  if (!v78 || !v80 || !v79)
  {
    __int16 v35 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    log = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
LABEL_46:
      int v30 = 0LL;
      uint64_t v31 = 0LL;
      id v32 = 0LL;
      int v33 = 0LL;
      int v51 = 4;
      goto LABEL_74;
    }

    *(_DWORD *)__int128 buf = 136315650;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6499;
    *(_WORD *)&v87[4] = 2112;
    *(void *)&v87[6] = v14;
    int v36 = log;
    __int16 v37 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
    uint32_t v38 = 28;
LABEL_78:
    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v37, buf, v38);
    goto LABEL_46;
  }

  if ([v80 length] == (id)16 && objc_msgSend(v79, "length") == (id)16)
  {
    __int16 v20 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v80 length];
      *(_DWORD *)__int128 buf = 136315650;
      std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v86 = 1024;
      *(_DWORD *)char v87 = 6504;
      *(_WORD *)&v87[4] = 2048;
      *(void *)&v87[6] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu",  buf,  0x1Cu);
    }

    char v23 = 0;
    goto LABEL_35;
  }

  if ([v80 length] != (id)8 || objc_msgSend(v79, "length") != (id)8)
  {
    char v52 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    log = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    id v65 = [v80 length];
    id v66 = [v79 length];
    *(_DWORD *)__int128 buf = v74;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6512;
    *(_WORD *)&v87[4] = 2048;
    *(void *)&v87[6] = v65;
    __int16 v88 = 2048;
    id v89 = v66;
    int v36 = log;
    __int16 v37 = "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu";
    uint32_t v38 = 38;
    goto LABEL_78;
  }

  id v39 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  char v23 = 1;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v40 = [v80 length];
    *(_DWORD *)__int128 buf = 136315650;
    std::string::size_type v85 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v86 = 1024;
    *(_DWORD *)char v87 = 6508;
    *(_WORD *)&v87[4] = 2048;
    *(void *)&v87[6] = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu",  buf,  0x1Cu);
  }

- (BOOL)checkAndUpdateNetworkParamsFromMdnsScan:(id)a3 borderAgentID:(id)a4 leaderBorderAgentID:(id)a5 isNwFound:(BOOL *)a6 numAppleBRs:(int *)a7 numThirdPartyBRs:(int *)a8 isLeaderAppleDevice:(BOOL *)a9 numThreadNwsFound:(int *)a10 shouldRunPeriodicTdm:(BOOL *)a11
{
  id v135 = a3;
  id v129 = a4;
  id v130 = a5;
  id v13 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    char v160 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNw"
           "Found:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
    __int16 v161 = 1024;
    int v162 = 6572;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Entered. Check and update network parameters from meshcop mDNS scan ",  buf,  0x12u);
  }

  *a6 = 0;
  *a8 = 0;
  *a7 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  id v137 = v129;
  sub_100159A78((unint64_t)[v137 bytes], (uint64_t)objc_msgSend(v137, "length"), buf, 0x100uLL, 0);
  uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buf,  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding")));
  __int128 v15 = self;
  if (!self->_BAFinder)
  {
    BOOL v16 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    std::string v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v144 = 136315394;
      std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:is"
             "NwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
      __int16 v146 = 1024;
      LODWORD(v147) = 6596;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Initialize new ThreadNetworkFinder instance ",  v144,  0x12u);
    }

    unsigned int v18 = -[ThreadNetworkfinder init](objc_opt_new(&OBJC_CLASS___ThreadNetworkfinder), "init");
    BAFinder = self->_BAFinder;
    self->_BAFinder = v18;

    __int128 v15 = self;
    if (!self->_BAFinder)
    {
      int v116 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      std::string::size_type v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
      xpc_object_t v131 = v117;
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v144 = 136315394;
        std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v146 = 1024;
        LODWORD(v147) = 6602;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v144, 0x12u);
      }

      BOOL v102 = 0;
      goto LABEL_128;
    }
  }

  unint64_t v20 = -[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]( v15,  "getCountOfThreadBorderRoutersWithMdns:");
  if (!v20)
  {
    __int16 v93 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    __int16 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_1001EF3A8(v94, v95, v96, v97, v98, v99, v100, v101);
    }

    -[ThreadNetworkfinder clear](self->_BAFinder, "clear");
    BOOL v102 = 0;
    goto LABEL_129;
  }

  xpc_object_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unint64_t v142 = v20;
  std::string::size_type v139 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v21 = 0LL;
  do
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkfinder getBorderAgentForIndex:](self->_BAFinder, "getBorderAgentForIndex:", v21));
    char v23 = v22;
    if (!v22) {
      goto LABEL_100;
    }
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v22 addresses]);
    BOOL v25 = v24 == 0LL;

    if (v25)
    {
      __int16 v35 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v144 = 136315394;
        std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v146 = 2112;
        *(void *)&__int128 v147 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s : No IP address is available for the server : %@, continue to next BR",  v144,  0x16u);
      }

      goto LABEL_99;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 TXTRecordData]);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNetService dictionaryFromTXTRecordData:]( &OBJC_CLASS___NSNetService,  "dictionaryFromTXTRecordData:",  v26));

    if (!v27)
    {
      int v36 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint32_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v144 = 136315650;
        std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v146 = 1024;
        LODWORD(v147) = 6638;
        WORD2(v147) = 2112;
        *(void *)((char *)&v147 + 6) = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s : %d No text record data available for the server : %@, continue to next network",  v144,  0x1Cu);
      }

      goto LABEL_98;
    }

    uint32_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v27, "objectForKey:", @"nn"));
    id v141 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v27, "objectForKey:", @"xp"));
    id v140 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v27, "objectForKey:", @"xa"));
    int v138 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v27, "objectForKey:", @"vn"));
    uint64_t v29 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int v144 = 136315650;
      std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:is"
             "NwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
      __int16 v146 = 1024;
      LODWORD(v147) = 6647;
      WORD2(v147) = 2112;
      *(void *)((char *)&v147 + 6) = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent MDNS Text Record Data : %@",  v144,  0x1Cu);
    }

    if (v28 && v141 && v140)
    {
      if ([v141 length] == (id)16 && objc_msgSend(v140, "length") == (id)16)
      {
        uint64_t v31 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = [v141 length];
          *(_DWORD *)int v144 = 136315650;
          std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentI"
                 "D:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
          __int16 v146 = 1024;
          LODWORD(v147) = 6655;
          WORD2(v147) = 2048;
          *(void *)((char *)&v147 + 6) = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu",  v144,  0x1Cu);
        }

        char v34 = 0;
        goto LABEL_32;
      }

      if ([v141 length] == (id)8 && objc_msgSend(v140, "length") == (id)8)
      {
        int v42 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        char v34 = 1;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v43 = [v141 length];
          *(_DWORD *)int v144 = 136315650;
          std::string::size_type v145 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentI"
                 "D:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
          __int16 v146 = 1024;
          LODWORD(v147) = 6659;
          WORD2(v147) = 2048;
          *(void *)((char *)&v147 + 6) = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu",  v144,  0x1Cu);
        }

- (BOOL)updateMeshcopRelatedParams:(BOOL *)a3 numAppleBRs:(int *)a4 numThirdPartyBRs:(int *)a5 isLeaderAppleDevice:(BOOL *)a6 numThreadNwsFound:(int *)a7 shouldRunPeriodicTdm:(BOOL *)a8
{
  int v44 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid](self, "getCurrentNetworkNameAndXpanid"));
  uint64_t v50 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v50);
    BOOL v14 = *(_DWORD *)buf == 0;
    if (SHIBYTE(v54) < 0) {
      operator delete(*(void **)&buf[8]);
    }
  }

  else
  {
    *(_OWORD *)__int128 buf = 0u;
    __int128 v54 = 0u;
    BOOL v14 = 1;
  }

  if (v49 < 0)
  {
    operator delete(__p[0]);
    if (v14)
    {
LABEL_7:
      sub_100147B4C(&v50, (std::string *)buf);
      int v15 = SBYTE7(v54);
      BOOL v16 = *(uint8_t **)buf;
      NSStringEncoding v17 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
      if (v15 >= 0) {
        unsigned int v18 = buf;
      }
      else {
        unsigned int v18 = v16;
      }
      int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  v17));
      unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance dataFromHexString:](self, "dataFromHexString:", v19));

      if (SBYTE7(v54) < 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v47 = 0LL;
      uint64_t v21 = self->_CtrInternalClientPtr;
      sub_10000AC00(v45, "Thread:Leader:ExtendedAddress");
      if (v21)
      {
        -[CtrInternalClient getProperty:output:](v21, "getProperty:output:", v45, &v47);
        BOOL v22 = *(_DWORD *)buf == 0;
        if (SHIBYTE(v54) < 0) {
          operator delete(*(void **)&buf[8]);
        }
      }

      else
      {
        *(_OWORD *)__int128 buf = 0u;
        __int128 v54 = 0u;
        BOOL v22 = 1;
      }

      if (v46 < 0)
      {
        operator delete(v45[0]);
        if (v22)
        {
LABEL_22:
          sub_100147058(&v47, (uint64_t)buf);
          uint64_t v52 = **(void **)buf;
          v51[0] = (void **)buf;
          sub_100006F6C(v51);
          sub_100159A78((unint64_t)&v52, 8LL, v51, 0x14uLL, 0);
          BOOL v25 = sub_1000160F4("com.apple.wpantund.tnm", "default");
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            *(void *)&uint8_t buf[4] = v51;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "retrieved leader_ext_addr: %s", buf, 0xCu);
          }

          sub_100147B4C(&v47, (std::string *)buf);
          int v27 = SBYTE7(v54);
          uint32_t v28 = *(uint8_t **)buf;
          NSStringEncoding v29 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
          if (v27 >= 0) {
            int v30 = buf;
          }
          else {
            int v30 = v28;
          }
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  v29));
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance dataFromHexString:](self, "dataFromHexString:", v31));

          if (SBYTE7(v54) < 0) {
            operator delete(*(void **)buf);
          }
          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", "FF", 8LL));
          unsigned int v34 = [v32 isEqualToData:v33];

          if (v34)
          {
            __int16 v35 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
            int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1001EF510();
            }
          }

          else
          {
            if (-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]( self,  "checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numTh irdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:",  v44,  v20,  v32,  a3,  a4,  a5,  a6,  a7,  a8))
            {
              id v39 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
              int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              BOOL v24 = 1;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "meschop mDns based params updated",  buf,  2u);
              }

              goto LABEL_42;
            }

            id v40 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
            int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1001EF53C();
            }
          }

          BOOL v24 = 0;
LABEL_42:

LABEL_43:
          if (v47) {
            (*(void (**)(uint64_t))(*(void *)v47 + 8LL))(v47);
          }
          goto LABEL_45;
        }
      }

      else if (v22)
      {
        goto LABEL_22;
      }

      __int16 v37 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      uint32_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1001EF568();
      }

      BOOL v24 = 0;
      goto LABEL_43;
    }
  }

  else if (v14)
  {
    goto LABEL_7;
  }

  char v23 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1001EEAE4();
  }
  BOOL v24 = 0;
LABEL_45:

  if (v50) {
    (*(void (**)(uint64_t))(*(void *)v50 + 8LL))(v50);
  }

  return v24;
}

- (BOOL)checkIfMdnsIsPublishedForBAID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid](self, "getCurrentNetworkNameAndXpanid"));
  uint64_t v22 = 0LL;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(v18, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v18, &v22);
    BOOL v5 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[1]);
    }
  }

  else
  {
    *(_OWORD *)std::string __p = 0u;
    __int128 v21 = 0u;
    BOOL v5 = 1;
  }

  if (v19 < 0)
  {
    operator delete(v18[0]);
    if (v5) {
      goto LABEL_7;
    }
  }

  else if (v5)
  {
LABEL_7:
    sub_100147B4C(&v22, (std::string *)__p);
    int v6 = SBYTE7(v21);
    dispatch_time_t v7 = (void **)__p[0];
    NSStringEncoding v8 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
    if (v6 >= 0) {
      uint64_t v9 = __p;
    }
    else {
      uint64_t v9 = v7;
    }
    char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  v8));
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkManagerInstance dataFromHexString:](self, "dataFromHexString:", v10));

    if (SBYTE7(v21) < 0) {
      operator delete(__p[0]);
    }
    BOOL v12 = -[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]( self,  "checkIfNetworkIsFoundInMDNSScan:borderAgentID:",  v3,  v11);
    if (v12)
    {
      id v13 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "mDNS record is published", (uint8_t *)__p, 2u);
      }
    }

    else
    {
      BOOL v16 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001EF594();
      }
    }

    goto LABEL_22;
  }

  int v15 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1001EEAE4();
  }
  LOBYTE(v12) = 0;
LABEL_22:

  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8LL))(v22);
  }

  return v12;
}

- (void)checkMeshcopMdns
{
  if (self->_lastKnownNCPState != 8)
  {
    dispatch_time_t v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    NSStringEncoding v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      sub_1000B5130(self->_lastKnownNCPState, __p);
      uint64_t v9 = v19 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)__int128 buf = 136315650;
      __int128 v21 = "-[ThreadNetworkManagerInstance checkMeshcopMdns]";
      __int16 v22 = 1024;
      int v23 = 6905;
      __int16 v24 = 2080;
      BOOL v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s : %d : mDNS search for meshcop.udp is not triggered as state is not associated. ncp state: %s",  buf,  0x1Cu);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
    }

    goto LABEL_12;
  }

  unsigned int v3 = -[ThreadNetworkManagerInstance checkIfMdnsIsPublishedForBAID](self, "checkIfMdnsIsPublishedForBAID");
  dispatch_semaphore_t v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v21 = "-[ThreadNetworkManagerInstance checkMeshcopMdns]";
      __int16 v22 = 1024;
      int v23 = 6910;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s : %d : mDNS record found after successful threadstart",  buf,  0x12u);
    }

    return;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001EF5C0();
  }

  if (self->_lastKnownNCPState != 8)
  {
    char v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    NSStringEncoding v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      sub_1000B5130(self->_lastKnownNCPState, __p);
      __int128 v11 = v19 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)__int128 buf = 136315650;
      __int128 v21 = "-[ThreadNetworkManagerInstance checkMeshcopMdns]";
      __int16 v22 = 1024;
      int v23 = 6915;
      __int16 v24 = 2080;
      BOOL v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s : %d : device is not in associate state, skipping the ABC. State: %s",  buf,  0x1Cu);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
    }

- (CtrInternalClient)CtrInternalClientPtr
{
  return (CtrInternalClient *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCtrInternalClientPtr:(id)a3
{
}

- (unsigned)lastUpdatedNCPChannel
{
  return self->_lastUpdatedNCPChannel;
}

- (void)setLastUpdatedNCPChannel:(unsigned __int8)a3
{
  self->_int lastUpdatedNCPChannel = a3;
}

- (unsigned)lastHostConfiguredChannel
{
  return self->_lastHostConfiguredChannel;
}

- (void)setLastHostConfiguredChannel:(unsigned __int8)a3
{
  self->___int16 lastHostConfiguredChannel = a3;
}

- (int)prevKnownNCPState
{
  return self->_prevKnownNCPState;
}

- (void)setPrevKnownNCPState:(int)a3
{
  self->_prevKnownNCPState = a3;
}

- (int)lastKnownNCPState
{
  return self->_lastKnownNCPState;
}

- (void)setLastKnownNCPState:(int)a3
{
  self->_int lastKnownNCPState = a3;
}

- (int)lastKnownNodeType
{
  return self->_lastKnownNodeType;
}

- (void)setLastKnownNodeType:(int)a3
{
  self->_int lastKnownNodeType = a3;
}

- (int)lastKnownValidNodeType
{
  return self->_lastKnownValidNodeType;
}

- (void)setLastKnownValidNodeType:(int)a3
{
  self->_lastKnownValidNodeType = a3;
}

- (OS_dispatch_queue)fQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFQueue:(id)a3
{
}

- (ThreadNetworkfinder)BAFinder
{
  return (ThreadNetworkfinder *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBAFinder:(id)a3
{
}

- (OS_dispatch_queue)tnm_scan_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTnm_scan_queue:(id)a3
{
}

- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore
{
  return (THThreadNetworkCredentialsStoreLocalClient *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setKeyChainStore:(id)a3
{
}

- (NSString)hwAddr
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setHwAddr:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)waitForSync
{
  return self->_waitForSync;
}

- (void)setWaitForSync:(BOOL)a3
{
  self->_BOOL waitForSync = a3;
}

- (BOOL)isPeriodicCaCollectionMeshcopRunning
{
  return self->_isPeriodicCaCollectionMeshcopRunning;
}

- (void)setIsPeriodicCaCollectionMeshcopRunning:(BOOL)a3
{
  self->_isPeriodicCaCollectionMeshcopRunning = a3;
}

- (OS_dispatch_source)tnm_nw_topology_fetch_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTnm_nw_topology_fetch_timer:(id)a3
{
}

- (OS_dispatch_source)checkPreferredThreadNetworkTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCheckPreferredThreadNetworkTimer:(id)a3
{
}

- (OS_dispatch_queue)checkPreferredThreadNetworkTimerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCheckPreferredThreadNetworkTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)periodicStatsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPeriodicStatsQueue:(id)a3
{
}

- (OS_dispatch_queue)tnmNodeTypeChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTnmNodeTypeChangeQueue:(id)a3
{
}

- (OS_dispatch_queue)tnmWedStatusChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setTnmWedStatusChangeQueue:(id)a3
{
}

- (BOOL)lastIsLeaderThirdParty
{
  return self->_lastIsLeaderThirdParty;
}

- (void)setLastIsLeaderThirdParty:(BOOL)a3
{
  self->_lastIsLeaderThirdParty = a3;
}

- (THThreadNetworkCredentialsActiveDataSetRecord)lastKnownJoinedNetworkRecord
{
  return (THThreadNetworkCredentialsActiveDataSetRecord *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setLastKnownJoinedNetworkRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end