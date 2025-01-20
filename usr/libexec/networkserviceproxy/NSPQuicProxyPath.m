@interface NSPQuicProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (NSPQUICProxyPathDelegate)quicProxyPathDelegate;
- (NSPQuicProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13;
- (void)enableFallback:(BOOL)a3;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)setQuicProxyPathDelegate:(id)a3;
- (void)setupMultiHopProxyRegistrations;
- (void)setupNetworkSpecificMultiHopProxyRegistrations:(id)a3;
- (void)setupSingleHopProxyRegistrations;
- (void)tearDownMultiHopRegistration;
@end

@implementation NSPQuicProxyPath

- (NSPQuicProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a12;
  id v23 = a13;
  v27 = v23;
  if (!v20)
  {
    uint64_t v32 = nplog_obj(v23, v24, v25, v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v30 = 0LL;
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v39 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v34 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v33, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v21)
  {
    uint64_t v35 = nplog_obj(v23, v24, v25, v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v39 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v34 = "%s called with null egressProxy";
    goto LABEL_12;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NSPQuicProxyPath;
  *(_WORD *)((char *)&v36 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v36) = a9;
  v28 = -[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]( &v37,  "initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFail Open:geohashSharingEnabled:configEpoch:networkCharacteristics:",  v19,  v20,  v21,  a6,  v14,  v13,  v36,  v22,  v23);
  v29 = v28;
  if (v28) {
    objc_storeWeak((id *)&v28->_quicProxyPathDelegate, v19);
  }
  self = v29;
  v30 = self;
LABEL_6:

  return v30;
}

- (void)setupSingleHopProxyRegistrations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxySingleHopNetworkRegistration);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "singleHopProxyAgentUUID"));
    v6 = sub_100046A14((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setSingleHopRegistration:](self, "setSingleHopRegistration:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (!v7)
    {
      uint64_t v11 = nplog_obj(v8, v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        BOOL v14 = "-[NSPQuicProxyPath setupSingleHopProxyRegistrations]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s called with null self.singleHopRegistration",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

- (void)setupMultiHopProxyRegistrations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v3)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));

      if (!v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        -[NSPProxyPath setNonDefaultAgentUUID:](self, "setNonDefaultAgentUUID:", v5);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
      v7 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyMultiHopNetworkRegistration);
      uint64_t v8 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      uint64_t v9 = v8;
      if (v8) {
        uint64_t v8 = (id *)v8[3];
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 vendor]);
      uint64_t v11 = sub_10004477C((id *)&v7->super.super.isa, v6, 0LL, v10, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v11);
    }

    else
    {
      v12 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyMultiHopNetworkRegistration);
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopProxyAgentUUID"));
      uint64_t v9 = sub_100045CC4((id *)&v12->super.super.isa, v6, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v9);
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v13)
    {
      uint64_t v17 = nplog_obj(v14, v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v19 = 136315138;
        id v20 = "-[NSPQuicProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%s called with null self.multiHopRegistration",  (uint8_t *)&v19,  0xCu);
      }
    }
  }

- (void)setupNetworkSpecificMultiHopProxyRegistrations:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v5)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));

      if (!v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        -[NSPProxyPath setNonDefaultAgentUUID:](self, "setNonDefaultAgentUUID:", v7);
      }

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
      uint64_t v9 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyMultiHopNetworkRegistration);
      uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      uint64_t v11 = v10;
      if (v10) {
        uint64_t v10 = (id *)v10[3];
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 vendor]);
      int v13 = sub_10004477C((id *)&v9->super.super.isa, v8, v4, v12, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v13);
    }

    else
    {
      uint64_t v14 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyMultiHopNetworkRegistration);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopProxyAgentUUID"));
      uint64_t v11 = sub_100045CC4((id *)&v14->super.super.isa, v8, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v11);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v15)
    {
      uint64_t v88 = nplog_obj(v16, v17, v18);
      v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v146 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
        v86 = "%s called with null self.multiHopRegistration";
        goto LABEL_72;
      }

      goto LABEL_73;
    }
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v19)
  {
    uint64_t v84 = nplog_obj(v20, v21, v22);
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v146 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
      v86 = "%s called with null self.ingressProxy";
LABEL_72:
      _os_log_fault_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_FAULT, v86, buf, 0xCu);
    }

- (void)tearDownMultiHopRegistration
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  sub_100045950((uint64_t)v2);
}

- (void)resetSingleHopProxyAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (v3)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC")) {
      return;
    }
    -[NSPQuicProxyPath setupSingleHopProxyRegistrations](self, "setupSingleHopProxyRegistrations");
    if (-[NSPProxyPath allowFallback](self, "allowFallback"))
    {
      char v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "singleHopFallbackProxyAgentUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
      char v74 = (void *)objc_claimAutoreleasedReturnValue([v7 singleHopFallbackProxyConfigHash:self]);
    }

    else
    {
      char v74 = 0LL;
      char v72 = 0LL;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    id v9 = sub_100045BD0((uint64_t)v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    char v71 = (void *)v12;
    if (v12) {
      int v13 = *(void **)(v12 + 24);
    }
    else {
      int v13 = 0LL;
    }
    id v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v69 = (void *)v16;
    if (v16) {
      uint64_t v17 = *(void **)(v16 + 24);
    }
    else {
      uint64_t v17 = 0LL;
    }
    id v18 = v17;
    v68 = (void *)objc_claimAutoreleasedReturnValue([v18 proxyKeyInfos]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    uint64_t v67 = (void *)v19;
    if (v19) {
      uint64_t v20 = *(void **)(v19 + 24);
    }
    else {
      uint64_t v20 = 0LL;
    }
    id v21 = v20;
    id v73 = (void *)objc_claimAutoreleasedReturnValue([v21 proxyVersion]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v58 = (void *)v10;
    v65 = (void *)v22;
    if (v22) {
      id v23 = *(void **)(v22 + 24);
    }
    else {
      id v23 = 0LL;
    }
    id v24 = v23;
    unsigned int v25 = [v24 supportsResumption];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    char v70 = v14;
    uint64_t v63 = (void *)v26;
    int v60 = v25;
    if (v26) {
      v27 = *(void **)(v26 + 24);
    }
    else {
      v27 = 0LL;
    }
    id v28 = v27;
    unsigned int v29 = [v28 algorithm];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    BOOL v31 = sub_10000C67C(v30);
    v66 = v21;
    if (v31)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      unsigned int v56 = (void *)v32;
      if (v32) {
        uint64_t v33 = *(void **)(v32 + 48);
      }
      else {
        uint64_t v33 = 0LL;
      }
      id v57 = v33;
    }

    else
    {
      id v57 = 0LL;
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    uint64_t v35 = (void *)v34;
    uint64_t v64 = v24;
    uint64_t v61 = (void *)v30;
    v62 = v28;
    BOOL v59 = v31;
    uint64_t v36 = (void *)v11;
    if (v34) {
      uint64_t v37 = *(void **)(v34 + 24);
    }
    else {
      uint64_t v37 = 0LL;
    }
    id v38 = v37;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 tokenChallenge]);
    unsigned __int8 v40 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_100046A30((uint64_t)v36, v15, v68, v73, v60, v29 == 2, v57, v39 != 0LL, v72, v40, v74, v41);

    if (v59)
    {
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    id v43 = sub_100045BD0((uint64_t)v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

    unsigned int v45 = -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered");
    uint64_t v46 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    uint64_t v47 = (void *)v46;
    if (v46)
    {
      v48 = v58;
      if (v45 != [*(id *)(v46 + 24) isRegistered])
      {
LABEL_27:

        goto LABEL_39;
      }
    }

    else
    {
      v48 = v58;
      if ((v45 & 1) != 0) {
        goto LABEL_27;
      }
    }

    unsigned __int8 v51 = [v44 isEqualToData:v48];

    if ((v51 & 1) != 0)
    {
LABEL_42:

      return;
    }

- (void)resetMultiHopProxyAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v3)
  {
    uint64_t v76 = nplog_obj(v4, v5, v6);
    uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v140 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    v78 = "%s called with null self.ingressProxy";
LABEL_74:
    _os_log_fault_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_FAULT, v78, buf, 0xCu);
    goto LABEL_72;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (v7)
  {
    -[NSPQuicProxyPath setupMultiHopProxyRegistrations](self, "setupMultiHopProxyRegistrations");
    if (-[NSPProxyPath allowFallback](self, "allowFallback"))
    {
      if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
      {
        id v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopProxyAgentUUID"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 multiHopQUICProxyConfigHash:self]);
      }

      else
      {
        id v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopFallbackProxyAgentUUID"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 multiHopFallbackProxyConfigHash:self]);
      }

      v129 = (void *)v12;
    }

    else
    {
      id v128 = 0LL;
      v129 = 0LL;
    }

    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v138 = 0LL;
    }

    else
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
      v138 = (void *)objc_claimAutoreleasedReturnValue([v13 alternatePreferredPathAgentUUIDs:self]);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    id v125 = (void *)v15;
    v95 = (void *)v14;
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 24);
    }
    else {
      uint64_t v16 = 0LL;
    }
    id v17 = v16;
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 proxyURL]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    id v123 = (void *)v19;
    if (v19) {
      uint64_t v20 = *(void **)(v19 + 24);
    }
    else {
      uint64_t v20 = 0LL;
    }
    id v21 = v20;
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 proxyURL]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    id v121 = (void *)v23;
    v122 = (void *)v22;
    if (v23) {
      id v24 = *(void **)(v23 + 24);
    }
    else {
      id v24 = 0LL;
    }
    id v25 = v24;
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 proxyKeyInfos]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v118 = (void *)v27;
    if (v27) {
      id v28 = *(void **)(v27 + 24);
    }
    else {
      id v28 = 0LL;
    }
    id v29 = v28;
    id v137 = (void *)objc_claimAutoreleasedReturnValue([v29 proxyKeyInfos]);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v116 = (void *)v30;
    if (v30) {
      BOOL v31 = *(void **)(v30 + 24);
    }
    else {
      BOOL v31 = 0LL;
    }
    id v32 = v31;
    v136 = (void *)objc_claimAutoreleasedReturnValue([v32 proxyVersion]);
    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    id v115 = (void *)v33;
    if (v33) {
      uint64_t v34 = *(void **)(v33 + 24);
    }
    else {
      uint64_t v34 = 0LL;
    }
    id v114 = v34;
    v135 = (void *)objc_claimAutoreleasedReturnValue([v114 proxyVersion]);
    uint64_t v35 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    id v113 = (void *)v35;
    if (v35) {
      uint64_t v36 = *(void **)(v35 + 24);
    }
    else {
      uint64_t v36 = 0LL;
    }
    id v112 = v36;
    id v134 = (void *)objc_claimAutoreleasedReturnValue([v112 allowedNextHops]);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    id v111 = (void *)v37;
    if (v37) {
      id v38 = *(void **)(v37 + 24);
    }
    else {
      id v38 = 0LL;
    }
    id v110 = v38;
    v133 = (void *)objc_claimAutoreleasedReturnValue([v110 allowedNextHops]);
    uint64_t v39 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    id v109 = (void *)v39;
    if (v39) {
      unsigned __int8 v40 = *(void **)(v39 + 24);
    }
    else {
      unsigned __int8 v40 = 0LL;
    }
    id v108 = v40;
    char v99 = [v108 supportsResumption];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    char v107 = (void *)v41;
    if (v41) {
      v42 = *(void **)(v41 + 24);
    }
    else {
      v42 = 0LL;
    }
    id v106 = v42;
    char v98 = [v106 supportsResumption];
    uint64_t v43 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    char v105 = (void *)v43;
    v44 = (void *)v18;
    if (v43) {
      unsigned int v45 = *(void **)(v43 + 24);
    }
    else {
      unsigned int v45 = 0LL;
    }
    id v104 = v45;
    unsigned int v46 = [v104 algorithm];
    uint64_t v47 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    BOOL v103 = (void *)v47;
    if (v47) {
      v48 = *(void **)(v47 + 24);
    }
    else {
      v48 = 0LL;
    }
    id v102 = v48;
    unsigned int v49 = [v102 algorithm];
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    BOOL v100 = sub_10000C67C((uint64_t)v101);
    if (v100)
    {
      uint64_t v50 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v83 = (void *)v50;
      if (v50) {
        unsigned __int8 v51 = *(void **)(v50 + 48);
      }
      else {
        unsigned __int8 v51 = 0LL;
      }
      id v127 = v51;
    }

    else
    {
      id v127 = 0LL;
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    BOOL v96 = sub_10000C67C((uint64_t)v97);
    if (v96)
    {
      uint64_t v52 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      id v82 = (void *)v52;
      if (v52) {
        unsigned int v53 = *(void **)(v52 + 48);
      }
      else {
        unsigned int v53 = 0LL;
      }
      id v126 = v53;
    }

    else
    {
      id v126 = 0LL;
    }

    uint64_t v54 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v94 = (void *)v54;
    if (v54) {
      v55 = *(void **)(v54 + 24);
    }
    else {
      v55 = 0LL;
    }
    id v93 = v55;
    v132 = (void *)objc_claimAutoreleasedReturnValue([v93 tokenChallenge]);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    char v92 = (void *)v56;
    if (v56) {
      id v57 = *(void **)(v56 + 24);
    }
    else {
      id v57 = 0LL;
    }
    id v91 = v57;
    id v131 = (void *)objc_claimAutoreleasedReturnValue([v91 tokenChallenge]);
    unsigned __int8 v87 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    char v86 = -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled");
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    v130 = (void *)objc_claimAutoreleasedReturnValue([v90 geohashOverride]);
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    char v84 = [v89 dnsFilteringHintEnabled];
    unsigned int v88 = -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC");
    v120 = v25;
    if (v88)
    {
      uint64_t v58 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      v81 = (void *)v58;
      if (v58) {
        BOOL v59 = *(void **)(v58 + 24);
      }
      else {
        BOOL v59 = 0LL;
      }
      id v80 = v59;
      v85 = (void *)objc_claimAutoreleasedReturnValue([v80 preferredPathPatterns]);
    }

    else
    {
      v85 = 0LL;
    }

    uint64_t v60 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    uint64_t v61 = (void *)v60;
    v124 = v17;
    id v119 = (void *)v26;
    id v117 = v29;
    if (v60) {
      v62 = *(void **)(v60 + 24);
    }
    else {
      v62 = 0LL;
    }
    char v63 = v49 == 2;
    char v64 = v46 == 2;
    id v65 = v62;
    char v66 = [v65 fallbackSupportsUDPProxying];
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_100045CE0( (uint64_t)v95,  v44,  v122,  v119,  v137,  v136,  v135,  v134,  v133,  v99,  v98,  v64,  v63,  v127,  v126,  v132 != 0LL,  v131 != 0LL,  v128,  v87,  v86,  v130,  v84,  v85,  v138,  v129,  v66,  v67);

    if (v88)
    {
    }

    if (v96)
    {
    }

    if (v100)
    {
    }

    unsigned int v68 = -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered");
    uint64_t v69 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (v69)
    {
      char v70 = (void *)v69;
      unsigned int v71 = [*(id *)(v69 + 24) isRegistered];

      if (v68 != v71)
      {
LABEL_65:
        uint64_t v72 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
        id v73 = (void *)v72;
        if (v72) {
          id v74 = [*(id *)(v72 + 24) isRegistered];
        }
        else {
          id v74 = 0LL;
        }
        -[NSPProxyPath setMultiHopRegistered:](self, "setMultiHopRegistered:", v74);

        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
        [v75 multiHopAgentRegistered:self];
      }
    }

    else if ((v68 & 1) != 0)
    {
      goto LABEL_65;
    }

    return;
  }

  uint64_t v79 = nplog_obj(v8, v9, v10);
  uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v140 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    v78 = "%s called with null self.egressProxy";
    goto LABEL_74;
  }

- (void)enableFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPProxyPath allowFallback](self, "allowFallback") != a3)
  {
    -[NSPProxyPath setAllowFallback:](self, "setAllowFallback:", v3);
    -[NSPQuicProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
    -[NSPQuicProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
  }

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = *(void **)(v8 + 24);
  }
  else {
    uint64_t v10 = 0LL;
  }
  id v11 = v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  int v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = *(void **)(v12 + 24);
  }
  else {
    uint64_t v14 = 0LL;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:",  v7,  v6,  v11,  v15,  -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"),  0LL);

  return v16;
}

- (NSPQUICProxyPathDelegate)quicProxyPathDelegate
{
  return (NSPQUICProxyPathDelegate *)objc_loadWeakRetained((id *)&self->_quicProxyPathDelegate);
}

- (void)setQuicProxyPathDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end