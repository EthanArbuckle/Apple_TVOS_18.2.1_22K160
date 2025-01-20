@interface NSPFallbackProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)setupMultiHopProxyRegistrations;
- (void)setupSingleHopProxyRegistrations;
@end

@implementation NSPFallbackProxyPath

- (void)setupSingleHopProxyRegistrations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxySingleHopFallbackNetworkRegistration);
    v5 = (void *)(-[NSPProxyPath forceFallback](self, "forceFallback")
                ? objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "singleHopProxyAgentUUID"))
                : objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "singleHopFallbackProxyAgentUUID")));
    v6 = v5;
    v7 = sub_100048210((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setSingleHopRegistration:](self, "setSingleHopRegistration:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (!v8)
    {
      uint64_t v12 = nplog_obj(v9, v10, v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v14 = 136315138;
        v15 = "-[NSPFallbackProxyPath setupSingleHopProxyRegistrations]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null self.singleHopRegistration",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

- (void)setupMultiHopProxyRegistrations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyMultiHopFallbackNetworkRegistration);
    v5 = (void *)(-[NSPProxyPath forceFallback](self, "forceFallback")
                ? objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopProxyAgentUUID"))
                : objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "multiHopFallbackProxyAgentUUID")));
    v6 = v5;
    v7 = sub_1000477A0((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v8)
    {
      uint64_t v12 = nplog_obj(v9, v10, v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v14 = 136315138;
        v15 = "-[NSPFallbackProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null self.multiHopRegistration",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

- (void)resetSingleHopProxyAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (v3)
  {
    -[NSPFallbackProxyPath setupSingleHopProxyRegistrations](self, "setupSingleHopProxyRegistrations");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v61 = (void *)v8;
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 24);
    }
    else {
      uint64_t v9 = 0LL;
    }
    id v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tcpProxyFqdn]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v59 = (void *)v12;
    if (v12) {
      v13 = *(void **)(v12 + 24);
    }
    else {
      v13 = 0LL;
    }
    id v14 = v13;
    v57 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyKeyInfos]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v56 = (void *)v15;
    if (v15) {
      v16 = *(void **)(v15 + 24);
    }
    else {
      v16 = 0LL;
    }
    id v17 = v16;
    v62 = (void *)objc_claimAutoreleasedReturnValue([v17 proxyVersion]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v54 = (void *)v18;
    if (v18) {
      v19 = *(void **)(v18 + 24);
    }
    else {
      v19 = 0LL;
    }
    id v20 = v19;
    unsigned int v21 = [v20 supportsResumption];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v60 = v10;
    v52 = (void *)v22;
    int v50 = v21;
    if (v22) {
      v23 = *(void **)(v22 + 24);
    }
    else {
      v23 = 0LL;
    }
    id v24 = v23;
    unsigned int v25 = [v24 algorithm];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    BOOL v27 = sub_10000C67C(v26);
    v58 = v14;
    if (v27)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v47 = (void *)v28;
      if (v28) {
        v29 = *(void **)(v28 + 48);
      }
      else {
        v29 = 0LL;
      }
      id v48 = v29;
    }

    else
    {
      id v48 = 0LL;
    }

    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v31 = (void *)v30;
    v55 = v17;
    v53 = v20;
    v51 = (void *)v26;
    BOOL v49 = v27;
    v32 = (void *)v7;
    if (v30) {
      v33 = *(void **)(v30 + 24);
    }
    else {
      v33 = 0LL;
    }
    id v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 tokenChallenge]);
    unsigned __int8 v36 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_10004822C((uint64_t)v32, v11, v57, v62, v50, v25 == 2, v48, v35 != 0LL, v36, v37);

    if (v49)
    {
    }

    unsigned int v38 = -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered");
    uint64_t v39 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (v39)
    {
      v40 = (void *)v39;
      unsigned int v41 = [*(id *)(v39 + 24) isRegistered];

      if (v38 == v41) {
        return;
      }
    }

    else if ((v38 & 1) == 0)
    {
      return;
    }

    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v43 = (void *)v42;
    if (v42) {
      id v44 = [*(id *)(v42 + 24) isRegistered];
    }
    else {
      id v44 = 0LL;
    }
    -[NSPProxyPath setSingleHopRegistered:](self, "setSingleHopRegistered:", v44);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    [v63 singleHopAgentRegistered:self];
  }

  else
  {
    uint64_t v45 = nplog_obj(v4, v5, v6);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[NSPFallbackProxyPath resetSingleHopProxyAgent]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "%s called with null self.ingressProxy",  buf,  0xCu);
    }
  }

- (void)resetMultiHopProxyAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v3)
  {
    uint64_t v75 = nplog_obj(v4, v5, v6);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
    if (!os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_FAULT))
    {
LABEL_55:

      return;
    }

    *(_DWORD *)buf = 136315138;
    v135 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v77 = "%s called with null self.ingressProxy";
LABEL_58:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v76, OS_LOG_TYPE_FAULT, v77, buf, 0xCu);
    goto LABEL_55;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    uint64_t v78 = nplog_obj(v8, v9, v10);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v78);
    if (!os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_FAULT)) {
      goto LABEL_55;
    }
    *(_DWORD *)buf = 136315138;
    v135 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v77 = "%s called with null self.egressProxy";
    goto LABEL_58;
  }

  -[NSPFallbackProxyPath setupMultiHopProxyRegistrations](self, "setupMultiHopProxyRegistrations");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v125 = (void *)v12;
  if (v12) {
    v13 = *(void **)(v12 + 24);
  }
  else {
    v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 tcpProxyFqdn]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v131 = (void *)v15;
  v123 = (void *)v16;
  if (v16) {
    id v17 = *(void **)(v16 + 24);
  }
  else {
    id v17 = 0LL;
  }
  id v18 = v17;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 tcpProxyFqdn]);
  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v121 = (void *)v19;
  v122 = v18;
  v120 = (void *)v20;
  if (v20) {
    unsigned int v21 = *(void **)(v20 + 24);
  }
  else {
    unsigned int v21 = 0LL;
  }
  id v22 = v21;
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 proxyKeyInfos]);
  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v117 = (void *)v24;
  if (v24) {
    unsigned int v25 = *(void **)(v24 + 24);
  }
  else {
    unsigned int v25 = 0LL;
  }
  id v26 = v25;
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 proxyKeyInfos]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v114 = (void *)v28;
  if (v28) {
    v29 = *(void **)(v28 + 24);
  }
  else {
    v29 = 0LL;
  }
  id v113 = v29;
  v130 = (void *)objc_claimAutoreleasedReturnValue([v113 proxyVersion]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v112 = (void *)v30;
  if (v30) {
    v31 = *(void **)(v30 + 24);
  }
  else {
    v31 = 0LL;
  }
  id v111 = v31;
  v129 = (void *)objc_claimAutoreleasedReturnValue([v111 proxyVersion]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v110 = (void *)v32;
  if (v32) {
    v33 = *(void **)(v32 + 24);
  }
  else {
    v33 = 0LL;
  }
  id v109 = v33;
  v128 = (void *)objc_claimAutoreleasedReturnValue([v109 allowedNextHops]);
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v108 = (void *)v34;
  if (v34) {
    v35 = *(void **)(v34 + 24);
  }
  else {
    v35 = 0LL;
  }
  id v107 = v35;
  v127 = (void *)objc_claimAutoreleasedReturnValue([v107 allowedNextHops]);
  uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v106 = (void *)v36;
  if (v36) {
    v37 = *(void **)(v36 + 24);
  }
  else {
    v37 = 0LL;
  }
  id v105 = v37;
  char v97 = [v105 supportsResumption];
  uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v104 = (void *)v38;
  if (v38) {
    uint64_t v39 = *(void **)(v38 + 24);
  }
  else {
    uint64_t v39 = 0LL;
  }
  id v103 = v39;
  char v95 = [v103 supportsResumption];
  uint64_t v40 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v102 = (void *)v40;
  unsigned int v41 = (void *)v11;
  if (v40) {
    uint64_t v42 = *(void **)(v40 + 24);
  }
  else {
    uint64_t v42 = 0LL;
  }
  id v101 = v42;
  unsigned int v43 = [v101 algorithm];
  uint64_t v44 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v100 = (void *)v44;
  if (v44) {
    uint64_t v45 = *(void **)(v44 + 24);
  }
  else {
    uint64_t v45 = 0LL;
  }
  id v99 = v45;
  unsigned int v46 = [v99 algorithm];
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  BOOL v96 = sub_10000C67C((uint64_t)v98);
  if (v96)
  {
    uint64_t v47 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v80 = (void *)v47;
    if (v47) {
      id v48 = *(void **)(v47 + 48);
    }
    else {
      id v48 = 0LL;
    }
    id v126 = v48;
  }

  else
  {
    id v126 = 0LL;
  }

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  BOOL v93 = sub_10000C67C((uint64_t)v94);
  if (v93)
  {
    uint64_t v49 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v79 = (void *)v49;
    if (v49) {
      int v50 = *(void **)(v49 + 48);
    }
    else {
      int v50 = 0LL;
    }
    id v92 = v50;
  }

  else
  {
    id v92 = 0LL;
  }

  uint64_t v51 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v91 = (void *)v51;
  if (v51) {
    v52 = *(void **)(v51 + 24);
  }
  else {
    v52 = 0LL;
  }
  id v90 = v52;
  uint64_t v53 = objc_claimAutoreleasedReturnValue([v90 tokenChallenge]);
  uint64_t v54 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v124 = v14;
  v119 = v22;
  v89 = (void *)v54;
  if (v54) {
    v55 = *(void **)(v54 + 24);
  }
  else {
    v55 = 0LL;
  }
  id v88 = v55;
  uint64_t v56 = objc_claimAutoreleasedReturnValue([v88 tokenChallenge]);
  unsigned __int8 v84 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
  char v82 = -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled");
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v87 geohashOverride]);
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  char v81 = [v85 dnsFilteringHintEnabled];
  uint64_t v57 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v58 = (void *)v57;
  v132 = v41;
  v118 = (void *)v23;
  v115 = (void *)v27;
  v116 = v26;
  if (v57) {
    v59 = *(void **)(v57 + 24);
  }
  else {
    v59 = 0LL;
  }
  char v60 = v56 != 0;
  v83 = (void *)v56;
  v61 = (void *)v53;
  char v62 = v53 != 0;
  char v63 = v46 == 2;
  char v64 = v43 == 2;
  id v65 = v59;
  char v66 = [v65 fallbackSupportsUDPProxying];
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  sub_1000477BC( (uint64_t)v132,  v131,  v121,  v118,  v115,  v130,  v129,  v128,  v127,  v97,  v95,  v64,  v63,  v126,  v92,  v62,  v60,  v84,  v82,  v86,  v81,  v66,  v67);

  if (v93)
  {
  }

  if (v96)
  {
  }

  unsigned int v68 = -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered");
  uint64_t v69 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  if (v69)
  {
    v70 = (void *)v69;
    unsigned int v71 = [*(id *)(v69 + 24) isRegistered];

    if (v68 == v71) {
      return;
    }
  }

  else if ((v68 & 1) == 0)
  {
    return;
  }

  uint64_t v72 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v73 = (void *)v72;
  if (v72) {
    id v74 = [*(id *)(v72 + 24) isRegistered];
  }
  else {
    id v74 = 0LL;
  }
  -[NSPProxyPath setMultiHopRegistered:](self, "setMultiHopRegistered:", v74);

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  [v133 multiHopAgentRegistered:self];
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
  v13 = (void *)v12;
  if (v12) {
    id v14 = *(void **)(v12 + 24);
  }
  else {
    id v14 = 0LL;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:",  v7,  v6,  v11,  v15,  -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"),  1LL);

  return v16;
}

@end