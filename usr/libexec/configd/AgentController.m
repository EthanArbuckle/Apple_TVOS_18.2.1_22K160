@interface AgentController
+ (id)sharedController;
- (AgentController)init;
- (BOOL)addPolicyToFloatingAgent:(id)a3 domain:(id)a4 agentUUIDToUse:(id)a5 policyType:(int64_t)a6 useControlPolicySession:(BOOL)a7;
- (BOOL)destroyFloatingAgent:(id)a3;
- (BOOL)getIntValue:(void *)a3 valuePtr:(int *)a4;
- (BOOL)initializeController;
- (BOOL)isControllerReady;
- (BOOL)isGlobalProxy:(__CFDictionary *)a3;
- (BOOL)isResolverMulticast:(id *)a3;
- (BOOL)isResolverOnion:(id *)a3;
- (BOOL)isResolverPrivate:(id *)a3;
- (BOOL)isTCPConverterProxyEnabled:(__CFDictionary *)a3;
- (BOOL)publishToAgent:(id)a3;
- (BOOL)registerAgent:(id)a3;
- (BOOL)spawnFloatingAgent:(Class)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 publishData:(id)a7;
- (BOOL)spawnMappedFloatingAgent:(id)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 updateData:(id)a7;
- (BOOL)unregisterAgent:(id)a3;
- (NEPolicySession)controlPolicySession;
- (NEPolicySession)policySession;
- (NSMutableDictionary)floatingDNSAgentList;
- (NSMutableDictionary)floatingProxyAgentList;
- (NSMutableDictionary)floatingProxyAgentList_TCPConverter;
- (NSMutableDictionary)policyDB;
- (OS_dispatch_queue)controllerQueue;
- (const)copyConfigAgentData:(id)a3 uuid:(unsigned __int8)a4[16] length:(unint64_t *)a5;
- (const)copyDNSAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4;
- (const)copyProxyAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4;
- (id)createPolicySession;
- (id)dataForProxyArray:(__CFArray *)a3;
- (id)dataForProxyDictionary:(__CFDictionary *)a3;
- (id)dataForResolver:(id *)a3;
- (id)dataLengthSanityCheck:(id)a3;
- (id)getAgentList:(id)a3 agentType:(unint64_t)a4 agentSubType:(unint64_t)a5;
- (id)getAgentWithSameDataAndSubType:(id)a3 data:(id)a4 subType:(unint64_t)a5;
- (id)getDNSDataFromCurrentConfig:(id *)a3 domain:(id)a4;
- (id)getProxyDataFromCurrentConfig:(__CFDictionary *)a3 domain:(id)a4;
- (id)sanitizeEntity:(id)a3;
- (id)sanitizeInterfaceName:(id)a3;
- (int)countProxyEntriesEnabled:(__CFDictionary *)a3;
- (int)entityInstanceNumber:(id)a3;
- (resolverList)copyResolverList:(id *)a3;
- (void)applyPolicies;
- (void)cleanConflictingAgentsFromList:(id)a3 new_list:(id)a4 agentDictionary:(id)a5;
- (void)deleteAgentList:(id)a3 list:(id)a4;
- (void)freeResolverList:(resolverList *)a3;
- (void)processDNSChanges;
- (void)processDNSResolvers:(id *)a3;
- (void)processDefaultProxyChanges:(__CFDictionary *)a3;
- (void)processOnionResolver:(id *)a3;
- (void)processProxyChanges;
- (void)processScopedDNSResolvers:(id *)a3;
- (void)processScopedProxyChanges:(__CFDictionary *)a3;
- (void)processServiceSpecificDNSResolvers:(id *)a3;
- (void)processServiceSpecificProxyChanges:(__CFDictionary *)a3;
- (void)processSupplementalDNSResolvers:(id *)a3;
- (void)processSupplementalProxyChanges:(__CFDictionary *)a3;
- (void)setControlPolicySession:(id)a3;
- (void)setControllerQueue:(id)a3;
- (void)setFloatingDNSAgentList:(id)a3;
- (void)setFloatingProxyAgentList:(id)a3;
- (void)setFloatingProxyAgentList_TCPConverter:(id)a3;
- (void)setPolicyDB:(id)a3;
- (void)setPolicySession:(id)a3;
@end

@implementation AgentController

+ (id)sharedController
{
  if (qword_100079E98 != -1) {
    dispatch_once(&qword_100079E98, &stru_100072E80);
  }
  id v2 = (id)qword_100079E90;
  objc_sync_enter(v2);
  if (([(id)qword_100079E90 isControllerReady] & 1) != 0
    || ([(id)qword_100079E90 initializeController] & 1) != 0)
  {
    objc_sync_exit(v2);

    id v3 = (id)qword_100079E90;
  }

  else
  {
    objc_sync_exit(v2);

    id v3 = 0LL;
  }

  return v3;
}

- (AgentController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AgentController;
  id v2 = -[AgentController init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[AgentController initializeController](v2, "initializeController");
  }
  return v3;
}

- (BOOL)initializeController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));

  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController createPolicySession](self, "createPolicySession")),
        -[AgentController setPolicySession:](self, "setPolicySession:", v4),
        v4,
        objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession")),
        v5,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingProxyAgentList:](self, "setFloatingProxyAgentList:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      if (!v8) {
        goto LABEL_14;
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingProxyAgentList_TCPConverter:](self, "setFloatingProxyAgentList_TCPConverter:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController floatingProxyAgentList_TCPConverter]( self,  "floatingProxyAgentList_TCPConverter"));
      if (!v11) {
        goto LABEL_14;
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingDNSAgentList:](self, "setFloatingDNSAgentList:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      if (!v14) {
        goto LABEL_14;
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));

    if (v15
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary")),
          -[AgentController setPolicyDB:](self, "setPolicyDB:", v16),
          v16,
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB")),
          v17,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));

      if (v18) {
        return 1;
      }
      dispatch_queue_t v19 = dispatch_queue_create("IPMonitorAgentControllerQueue", 0LL);
      -[AgentController setControllerQueue:](self, "setControllerQueue:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));
      if (v20) {
        return 1;
      }
      v22 = "Failed to create a queue";
    }

    else
    {
LABEL_14:
      v22 = "Failed to create a dictionary";
    }
  }

  else
  {
    v22 = "Failed to create a policy session";
  }

  os_log_t v23 = sub_10002E39C();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = _SC_syslog_os_log_mapping(3LL);
  if (__SC_log_enabled(3LL, v24, v25))
  {
    memset(v31, 0, sizeof(v31));
    unsigned int v26 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v24, (os_log_type_t)v25)) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 2LL;
    }
    int v29 = 136315138;
    v30 = v22;
    v28 = (_OWORD *)_os_log_send_and_compose_impl( v27,  0LL,  v31,  256LL,  &_mh_execute_header,  v24,  v25,  "Error occured while initializing AgentController: %s",  (const char *)&v29);
    __SC_log_send2(3LL, v24, v25, 0LL, v28);
    if (v28 != v31) {
      free(v28);
    }
  }

  _SC_crash(v22, 0LL, 0LL);
  return 0;
}

- (id)createPolicySession
{
  return objc_alloc_init(&OBJC_CLASS___NEPolicySession);
}

- (BOOL)isControllerReady
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    if (v4)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
          if (v7)
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));
            BOOL v9 = v8 != 0LL;
          }

          else
          {
            BOOL v9 = 0;
          }
        }

        else
        {
          BOOL v9 = 0;
        }
      }

      else
      {
        BOOL v9 = 0;
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)dataForProxyArray:(__CFArray *)a3
{
  id v4 = 0LL;
  _SCSerialize(a3, &v4, 0LL, 0LL);
  return v4;
}

- (id)dataForProxyDictionary:(__CFDictionary *)a3
{
  if (a3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, a3);
    CFDictionaryRemoveValue(MutableCopy, kSCPropNetProxiesSupplementalMatchDomain);
    ProxyAgentData = (void *)SCNetworkProxiesCreateProxyAgentData(MutableCopy);
    CFRelease(MutableCopy);
    return ProxyAgentData;
  }

  else
  {
    os_log_t v6 = sub_10002E39C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v7, v8))
    {
      memset(v13, 0, sizeof(v13));
      unsigned int v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 2LL;
      }
      v12[0] = 0;
      v11 = (_OWORD *)_os_log_send_and_compose_impl( v10,  0LL,  v13,  256LL,  &_mh_execute_header,  v7,  v8,  "Invalid domain proxy dict",  v12,  2);
      __SC_log_send2(5LL, v7, v8, 0LL, v11);
      if (v11 != v13) {
        free(v11);
      }
    }

    return 0LL;
  }

- (id)getProxyDataFromCurrentConfig:(__CFDictionary *)a3 domain:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!a3 || !v6)
  {
    os_log_t v16 = sub_10002E39C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v17, v18))
    {
      memset(v25, 0, sizeof(v25));
      unsigned int v19 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v17, (os_log_type_t)v18)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 2LL;
      }
      v24[0] = 0;
      v21 = (_OWORD *)_os_log_send_and_compose_impl( v20,  0LL,  v25,  256LL,  &_mh_execute_header,  v17,  v18,  "Invalid proxies/domain",  v24,  2);
      __SC_log_send2(5LL, v17, v18, 0LL, v21);
      if (v21 != v25) {
        free(v21);
      }
    }

    goto LABEL_17;
  }

  Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
  if (!Value || (unsigned int v9 = Value, Count = CFArrayGetCount(Value), Count < 1))
  {
LABEL_17:
    v22 = 0LL;
    goto LABEL_18;
  }

  CFIndex v11 = Count;
  CFIndex v12 = 0LL;
  v13 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
    v15 = CFDictionaryGetValue(ValueAtIndex, v13);
    if (v15)
    {
      if (CFEqual(v15, v7)) {
        break;
      }
    }

    if (v11 == ++v12) {
      goto LABEL_17;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyDictionary:](self, "dataForProxyDictionary:", ValueAtIndex));
LABEL_18:

  return v22;
}

- (BOOL)getIntValue:(void *)a3 valuePtr:(int *)a4
{
  BOOL result = a3
        && (CFTypeID v6 = CFGetTypeID(a3), v6 == CFNumberGetTypeID())
        && CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, a4) != 0;
  return result;
}

- (int)countProxyEntriesEnabled:(__CFDictionary *)a3
{
  v17[0] = kSCPropNetProxiesHTTPEnable;
  v17[1] = kSCPropNetProxiesHTTPSEnable;
  v17[2] = kSCPropNetProxiesProxyAutoConfigEnable;
  v17[3] = kSCPropNetProxiesFTPEnable;
  v17[4] = kSCPropNetProxiesGopherEnable;
  v17[5] = kSCPropNetProxiesRTSPEnable;
  v17[6] = kSCPropNetProxiesSOCKSEnable;
  v17[7] = kSCPropNetProxiesTransportConverterEnable;
  v17[8] = kSCPropNetProxiesProxyAutoDiscoveryEnable;
  if (a3)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      LODWORD(v16[0]) = 0;
      unsigned int v6 = -[AgentController getIntValue:valuePtr:]( self,  "getIntValue:valuePtr:",  CFDictionaryGetValue(a3, (const void *)v17[v5]),  v16);
      int result = v16[0];
      if (v6 && SLODWORD(v16[0]) >= 1) {
        break;
      }
      if (++v5 == 9) {
        return 0;
      }
    }
  }

  else
  {
    os_log_t v9 = sub_10002E39C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v10, v11))
    {
      memset(v16, 0, sizeof(v16));
      unsigned int v12 = (_sc_log > 0) | 2;
      uint64_t v13 = os_log_type_enabled(v10, (os_log_type_t)v11) ? v12 : 2LL;
      v15[0] = 0;
      v14 = (_OWORD *)_os_log_send_and_compose_impl( v13,  0LL,  v16,  256LL,  &_mh_execute_header,  v10,  v11,  "No proxies",  v15,  2);
      __SC_log_send2(5LL, v10, v11, 0LL, v14);
      if (v14 != v16) {
        free(v14);
      }
    }

    return 0;
  }

  return result;
}

- (void)processSupplementalProxyChanges:(__CFDictionary *)a3
{
  if (a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  1LL,  2LL));

    v101 = -[NSCountedSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithCapacity:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    type = a3;
    Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
    theArray = Value;
    if (Value) {
      CFIndex Count = CFArrayGetCount(Value);
    }
    else {
      CFIndex Count = 0LL;
    }
    v106 = v7;
    id v107 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v103 = Count;
    if (Count >= 1)
    {
      CFIndex v21 = 0LL;
      v22 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v21);
        v24 = (void *)CFDictionaryGetValue(ValueAtIndex, v22);
        if (v24)
        {
          uint64_t v25 = v24;
          if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", ValueAtIndex))
          {
            [v7 addObject:v25];
          }

          else
          {
            os_log_t v26 = sub_10002E39C();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            uint64_t v28 = _SC_syslog_os_log_mapping(6LL);
            if (__SC_log_enabled(6LL, v27, v28))
            {
              __int128 v149 = 0u;
              __int128 v148 = 0u;
              __int128 v147 = 0u;
              __int128 v146 = 0u;
              __int128 v145 = 0u;
              __int128 v144 = 0u;
              __int128 v143 = 0u;
              __int128 v142 = 0u;
              __int128 v141 = 0u;
              __int128 v139 = 0u;
              __int128 v140 = 0u;
              __int128 v137 = 0u;
              __int128 v138 = 0u;
              __int128 v136 = 0u;
              unsigned int v29 = (_sc_log > 0) | 2;
              __int128 v134 = 0u;
              __int128 v135 = 0u;
              if (os_log_type_enabled(v27, (os_log_type_t)v28)) {
                uint64_t v30 = v29;
              }
              else {
                uint64_t v30 = 2LL;
              }
              int v132 = 138412290;
              v133 = v25;
              LODWORD(v97) = 12;
              v31 = (__int128 *)_os_log_send_and_compose_impl( v30,  0LL,  &v134,  256LL,  &_mh_execute_header,  v27,  v28,  "Proxy settings on %@ are generic. Not recognizing as new domain",  &v132,  v97);
              __SC_log_send2(6LL, v27, v28, 0LL, v31);
              if (v31 != &v134) {
                free(v31);
              }
              v7 = v106;
            }
          }
        }

        ++v21;
      }

      while (v103 != v21);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    -[AgentController cleanConflictingAgentsFromList:new_list:agentDictionary:]( self,  "cleanConflictingAgentsFromList:new_list:agentDictionary:",  v6,  v7,  v32);

    __int128 v130 = 0u;
    __int128 v131 = 0u;
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    id v33 = v6;
    id v34 = [v33 countByEnumeratingWithState:&v128 objects:v127 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v129;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v129 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v128 + 1) + 8LL * (void)i);
          if (([v7 containsObject:v38] & 1) == 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:v38]);

            -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v40);
          }
        }

        id v35 = [v33 countByEnumeratingWithState:&v128 objects:v127 count:16];
      }

      while (v35);
    }

    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    id obj = v33;
    id v41 = [obj countByEnumeratingWithState:&v123 objects:v122 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v124;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v124 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void *)(*((void *)&v123 + 1) + 8LL * (void)j);
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v45]);

          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v47 getAgentMapping]);
            v49 = v48;
            if (v48)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v48 getAssociatedEntity]);
              v51 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getProxyDataFromCurrentConfig:domain:]( self,  "getProxyDataFromCurrentConfig:domain:",  type,  v50));

              if (!v51
                || (v52 = (void *)objc_claimAutoreleasedReturnValue([v47 getAgentData]),
                    unsigned __int8 v53 = [v52 isEqual:v51],
                    v52,
                    (v53 & 1) == 0))
              {
                [v107 addObject:v47];

LABEL_48:
                goto LABEL_49;
              }
            }

            else
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue([v47 getAssociatedEntity]);
              v51 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getProxyDataFromCurrentConfig:domain:]( self,  "getProxyDataFromCurrentConfig:domain:",  type,  v54));

              v55 = (void *)objc_claimAutoreleasedReturnValue([v47 getAgentData]);
              unsigned __int8 v56 = [v55 isEqual:v51];

              if ((v56 & 1) == 0)
              {
                [v47 updateAgentData:v51];
                [v104 addObject:v47];
              }
            }

            [v106 removeObject:v45];
            goto LABEL_48;
          }

- (void)processScopedProxyChanges:(__CFDictionary *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  1LL,  1LL));

  uint64_t v28 = a3;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesScoped);
  if (Value)
  {
    v7 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      os_log_t v10 = (const void **)malloc(8 * Count);
      CFDictionaryGetKeysAndValues(v7, v10, 0LL);
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        id v12 = (id)v10[i];
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s%@",  "@",  v12));
        if (-[AgentController countProxyEntriesEnabled:]( self,  "countProxyEntriesEnabled:",  CFDictionaryGetValue(v7, v12)))
        {
          id v14 = [v29 indexOfObject:v13];
          uint64_t v15 = SCNetworkProxiesCopyMatching(v28, 0LL, v12);
          if (v15)
          {
            id v16 = (const void *)v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyArray:](self, "dataForProxyArray:", v15));
            CFRelease(v16);
          }

          else
          {
            v17 = 0LL;
          }

          if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___ProxyAgent),  v13,  1LL,  8LL,  v17);
            v24 = 0LL;
          }

          else
          {
            [v29 removeObjectAtIndex:v14];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            v24 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v13]);

            if (v24)
            {
              [v24 updateAgentData:v17];
            }
          }
        }

        else
        {
          os_log_t v18 = sub_10002E39C();
          unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = _SC_syslog_os_log_mapping(6LL);
          if (__SC_log_enabled(6LL, v19, v20))
          {
            unsigned int v21 = (_sc_log > 0) | 2;
            memset(v32, 0, sizeof(v32));
            uint64_t v22 = os_log_type_enabled(v19, (os_log_type_t)v20) ? v21 : 2LL;
            int v30 = 138412290;
            id v31 = v12;
            LODWORD(v27) = 12;
            os_log_t v23 = (_OWORD *)_os_log_send_and_compose_impl( v22,  0LL,  v32,  256LL,  &_mh_execute_header,  v19,  v20,  "Proxy settings on %@ are generic. Skipping",  &v30,  v27);
            __SC_log_send2(6LL, v19, v20, 0LL, v23);
            if (v23 != v32) {
              free(v23);
            }
          }

          v24 = 0LL;
          v17 = 0LL;
        }
      }

      free(v10);
    }
  }

  os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v26, v29);
}

- (void)processServiceSpecificProxyChanges:(__CFDictionary *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  1LL,  6LL));

  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesServices);
  if (Value)
  {
    uint64_t v8 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      uint64_t v11 = (const void **)malloc(8 * Count);
      CFDictionaryGetKeysAndValues(v8, v11, 0LL);
      uint64_t v12 = 0LL;
      uint64_t v28 = v6;
      do
      {
        id v13 = (id)v11[v12];
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s%@",  "@",  v13));
        if (-[AgentController countProxyEntriesEnabled:]( self,  "countProxyEntriesEnabled:",  CFDictionaryGetValue(v8, v13)))
        {
          uint64_t v15 = CFDictionaryGetValue(v8, v13);
          if (v15)
          {
            unsigned int v29 = v15;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController dataForProxyArray:]( self,  "dataForProxyArray:",  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL)));
          }

          else
          {
            id v16 = 0LL;
          }

          id v24 = [v6 indexOfObject:v14];
          if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___ProxyAgent),  v14,  6LL,  -1LL,  v16);
            os_log_t v23 = 0LL;
          }

          else
          {
            [v6 removeObjectAtIndex:v24];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v14]);

            if (v23)
            {
              [v23 updateAgentData:v16];
            }

            unsigned int v6 = v28;
          }
        }

        else
        {
          os_log_t v17 = sub_10002E39C();
          os_log_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          uint64_t v19 = _SC_syslog_os_log_mapping(6LL);
          if (__SC_log_enabled(6LL, v18, v19))
          {
            unsigned int v20 = (_sc_log > 0) | 2;
            memset(v32, 0, sizeof(v32));
            if (os_log_type_enabled(v18, (os_log_type_t)v19)) {
              uint64_t v21 = v20;
            }
            else {
              uint64_t v21 = 2LL;
            }
            int v30 = 138412290;
            id v31 = v13;
            LODWORD(v27) = 12;
            uint64_t v22 = (_OWORD *)_os_log_send_and_compose_impl( v21,  0LL,  v32,  256LL,  &_mh_execute_header,  v18,  v19,  "Proxy settings on %@ are generic. Skipping",  &v30,  v27);
            __SC_log_send2(6LL, v18, v19, 0LL, v22);
            if (v22 != v32) {
              free(v22);
            }
            unsigned int v6 = v28;
          }

          os_log_t v23 = 0LL;
          id v16 = 0LL;
        }

        ++v12;
      }

      while (v10 != v12);
      free(v11);
    }
  }

  os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v26, v6);
}

- (BOOL)isGlobalProxy:(__CFDictionary *)a3
{
  return CFDictionaryContainsKey(a3, kSCPropNetProxiesBypassAllowed) != 0;
}

- (BOOL)isTCPConverterProxyEnabled:(__CFDictionary *)a3
{
  int valuePtr = 0;
  value = 0LL;
  BOOL result = 0;
  if (CFDictionaryGetValueIfPresent(a3, kSCPropNetProxiesTransportConverterEnable, (const void **)&value))
  {
    id v3 = value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (v3)
    {
      if (CFGetTypeID(v3) == TypeID && CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr) && valuePtr) {
        return 1;
      }
    }
  }

  return result;
}

- (void)processDefaultProxyChanges:(__CFDictionary *)a3
{
  values = CFDictionaryCreateMutableCopy(0LL, 0LL, a3);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesScoped);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesServices);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesSupplemental);
  id v4 = CFArrayCreate(0LL, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", values))
    {
      CFRelease(values);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyArray:](self, "dataForProxyArray:", v4));
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_defaultProxy"]);

      if (v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getAgentData]);
        unsigned __int8 v9 = [v5 isEqual:v8];

        if ((v9 & 1) != 0) {
          goto LABEL_29;
        }
        -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v7);
      }

      unsigned int v10 = -[AgentController isGlobalProxy:](self, "isGlobalProxy:", values);
      if (v10)
      {
        os_log_t v11 = sub_10002E39C();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = _SC_syslog_os_log_mapping(6LL);
        if (__SC_log_enabled(6LL, v12, v13))
        {
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v40 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v33 = 0u;
          unsigned int v14 = (_sc_log > 0) | 2;
          uint64_t v15 = os_log_type_enabled(v12, (os_log_type_t)v13) ? v14 : 2LL;
          v32[0] = 0;
          id v16 = (__int128 *)_os_log_send_and_compose_impl( v15,  0LL,  &v33,  256LL,  &_mh_execute_header,  v12,  v13,  "Global proxy detected...",  v32,  2);
          __SC_log_send2(6LL, v12, v13, 0LL, v16);
          if (v16 != &v33) {
            free(v16);
          }
        }

        uint64_t v17 = 7LL;
        uint64_t v18 = 7LL;
      }

      else
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = 3LL;
      }

      if ((v10 & -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___ProxyAgent),  @"_defaultProxy",  v18,  v17,  v5)) == 1 && -[AgentController isTCPConverterProxyEnabled:](self, "isTCPConverterProxyEnabled:", values))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
        os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"_defaultProxy"]);

        if (v26)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 getAgentData]);
          unsigned int v29 = [v5 isEqual:v28];

          if (v29)
          {
            int v30 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController floatingProxyAgentList_TCPConverter]( self,  "floatingProxyAgentList_TCPConverter"));
            [v30 setObject:v26 forKey:@"_defaultProxy"];

            sub_10004A968(1);
          }
        }

        goto LABEL_30;
      }

- (void)applyPolicies
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
    unsigned __int8 v6 = [v5 apply];

    if ((v6 & 1) == 0)
    {
      os_log_t v7 = sub_10002E39C();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v8, v9))
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        unsigned int v10 = (_sc_log > 0) | 2;
        uint64_t v11 = os_log_type_enabled(v8, (os_log_type_t)v9) ? v10 : 2LL;
        v24[0] = 0;
        uint64_t v12 = (__int128 *)_os_log_send_and_compose_impl( v11,  0LL,  &v25,  256LL,  &_mh_execute_header,  v8,  v9,  "Failed to apply control policies",  v24,  2);
        __SC_log_send2(3LL, v8, v9, 0LL, v12);
        if (v12 != &v25) {
          free(v12);
        }
      }
    }
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    unsigned __int8 v16 = [v15 apply];

    if ((v16 & 1) == 0)
    {
      os_log_t v17 = sub_10002E39C();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v18, v19))
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        unsigned int v20 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v18, (os_log_type_t)v19)) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 2LL;
        }
        v24[0] = 0;
        LODWORD(v23) = 2;
        unsigned int v22 = (__int128 *)_os_log_send_and_compose_impl( v21,  0LL,  &v25,  256LL,  &_mh_execute_header,  v18,  v19,  "Failed to apply policies",  v24,  v23);
        __SC_log_send2(3LL, v18, v19, 0LL, v22);
        if (v22 != &v25) {
          free(v22);
        }
      }
    }
  }

- (void)processProxyChanges
{
  uint64_t v3 = SCDynamicStoreCopyProxiesWithOptions(0LL, 0LL);
  if (v3)
  {
    id v4 = (const void *)v3;
    -[AgentController processDefaultProxyChanges:](self, "processDefaultProxyChanges:", v3);
    -[AgentController processScopedProxyChanges:](self, "processScopedProxyChanges:", v4);
    -[AgentController processSupplementalProxyChanges:](self, "processSupplementalProxyChanges:", v4);
    -[AgentController processServiceSpecificProxyChanges:](self, "processServiceSpecificProxyChanges:", v4);
    -[AgentController applyPolicies](self, "applyPolicies");
    CFRelease(v4);
  }

  else
  {
    os_log_t v5 = sub_10002E39C();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v6, v7))
    {
      memset(v25, 0, sizeof(v25));
      unsigned int v8 = (_sc_log > 0) | 2;
      uint64_t v9 = os_log_type_enabled(v6, (os_log_type_t)v7) ? v8 : 2LL;
      v19[0] = 0;
      unsigned int v10 = (_OWORD *)_os_log_send_and_compose_impl( v9,  0LL,  v25,  256LL,  &_mh_execute_header,  v6,  v7,  "No proxy information",  v19,  2);
      __SC_log_send2(6LL, v6, v7, 0LL, v10);
      if (v10 != v25) {
        free(v10);
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    id v12 = [v11 copy];

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * (void)i)]);
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v18);
        }

        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }

      while (v15);

      -[AgentController applyPolicies](self, "applyPolicies");
    }

    else
    {
    }
  }

- (void)freeResolverList:(resolverList *)a3
{
  if (a3)
  {
    if (a3->var0) {
      free(a3->var0);
    }
    var2 = a3->var2;
    if (var2) {
      free(var2);
    }
    var4 = a3->var4;
    if (var4) {
      free(var4);
    }
    free(a3);
  }

- (resolverList)copyResolverList:(id *)a3
{
  if (a3->var0 < 1 || !*(void *)(&a3->var0 + 1)) {
    return 0LL;
  }
  os_log_t v5 = (resolverList *)calloc(1uLL, 0x30uLL);
  if (a3->var0 >= 1)
  {
    uint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(&a3->var0 + 1) + 8 * v6);
      unsigned __int8 v8 = -[AgentController isResolverMulticast:](self, "isResolverMulticast:", v7);
      p_unsigned int var3 = &v5->var3;
      if ((v8 & 1) != 0
        || (unsigned __int8 v10 = -[AgentController isResolverPrivate:](self, "isResolverPrivate:", v7),
            p_unsigned int var3 = &v5->var5,
            (v10 & 1) != 0)
        || !*(void *)v7 && (p_unsigned int var3 = &v5->var1, *(int *)(v7 + 8) >= 1))
      {
        ++*p_var3;
      }

      ++v6;
    }

    while (v6 < a3->var0);
  }

  os_log_t v11 = sub_10002E39C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = _SC_syslog_os_log_mapping(6LL);
  if (__SC_log_enabled(6LL, v12, v13))
  {
    memset(v35, 0, sizeof(v35));
    unsigned int v14 = (_sc_log > 0) | 2;
    uint64_t v15 = os_log_type_enabled(v12, (os_log_type_t)v13) ? v14 : 2LL;
    unsigned int var3 = v5->var3;
    unsigned int var5 = v5->var5;
    __int16 v31 = 1024;
    unsigned int v32 = var3;
    __int16 v33 = 1024;
    unsigned int v34 = var5;
    uint64_t v18 = (_OWORD *)_os_log_send_and_compose_impl( v15,  0LL,  v35,  256LL,  &_mh_execute_header,  v12,  v13,  "Resolvers: %u default, %u multicast, %u private",  &v30,  20,  67109632);
    __SC_log_send2(6LL, v12, v13, 0LL, v18);
    if (v18 != v35) {
      free(v18);
    }
  }

  size_t var1 = v5->var1;
  if ((_DWORD)var1) {
    v5->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)calloc(var1, 8uLL);
  }
  size_t v20 = v5->var3;
  if ((_DWORD)v20) {
    v5->var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)calloc(v20, 8uLL);
  }
  size_t v21 = v5->var5;
  if ((_DWORD)v21) {
    v5->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)calloc(v21, 8uLL);
  }
  if (a3->var0 >= 1)
  {
    uint64_t v22 = 0LL;
    unint64_t v23 = 0LL;
    unint64_t v24 = 0LL;
    unint64_t v25 = 0LL;
    do
    {
      uint64_t v26 = *(void *)(*(void *)(&a3->var0 + 1) + 8 * v22);
      if (-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v26) && v23 < v5->var3)
      {
        unint64_t v27 = v23++;
        p_var2 = (resolverList *)&v5->var2;
      }

      else if (-[AgentController isResolverPrivate:](self, "isResolverPrivate:", v26) && v24 < v5->var5)
      {
        unint64_t v27 = v24++;
        p_var2 = (resolverList *)&v5->var4;
      }

      else
      {
        unint64_t v27 = v25++;
        p_var2 = v5;
      }

      p_var2->var0[v27] = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v26;
LABEL_39:
      ++v22;
    }

    while (v22 < a3->var0);
  }

  return v5;
}

- (id)dataForResolver:(id *)a3
{
  if (!a3)
  {
    os_log_t v8 = sub_10002E39C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v9, v10))
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      unsigned int v11 = (_sc_log > 0) | 2;
      uint64_t v12 = os_log_type_enabled(v9, (os_log_type_t)v10) ? v11 : 2LL;
      v18[0] = 0;
      uint64_t v13 = (__int128 *)_os_log_send_and_compose_impl( v12,  0LL,  &v19,  256LL,  &_mh_execute_header,  v9,  v10,  "Invalid dns resolver",  v18,  2);
      __SC_log_send2(5LL, v9, v10, 0LL, v13);
      if (v13 != &v19) {
        free(v13);
      }
    }

    return 0LL;
  }

  if (*(int *)&a3->var3 < 1)
  {
    p_size_t var1 = &a3->var1;
    if (a3->var1 <= 0) {
      return 0LL;
    }
    goto LABEL_17;
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  os_log_t v5 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (*(int *)&a3->var3 >= 1)
  {
    uint64_t v6 = 0LL;
    do
      CFArrayAppendValue( v5,  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(*(void *)&a3->var4 + 8 * v6++)));
    while (v6 < *(int *)&a3->var3);
  }

  CFDictionaryAddValue(Mutable, @"SearchDomains", v5);
  CFRelease(v5);
  p_size_t var1 = &a3->var1;
  if (a3->var1 > 0)
  {
    if (Mutable)
    {
LABEL_18:
      unsigned int v14 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      if (*p_var1 >= 1)
      {
        uint64_t v15 = 0LL;
        do
        {
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          _SC_sockaddr_to_string(*(void *)(*(void *)(&a3->var1 + 1) + 8 * v15), &v19, 128LL);
          if ((_BYTE)v19) {
            CFArrayAppendValue( v14,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v19));
          }
          ++v15;
        }

        while (v15 < *p_var1);
      }

      CFDictionaryAddValue(Mutable, @"NameServers", v14);
      CFRelease(v14);
      goto LABEL_24;
    }

- (id)getDNSDataFromCurrentConfig:(id *)a3 domain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 && v6)
  {
    if (a3->var0 >= 1 && *(void *)(&a3->var0 + 1))
    {
      for (uint64_t i = 0LL; i < a3->var0; ++i)
      {
        uint64_t v9 = *(void **)(*(void *)(&a3->var0 + 1) + 8 * i);
        if (*v9
          && !-[AgentController isResolverMulticast:]( self,  "isResolverMulticast:",  *(void *)(*(void *)(&a3->var0 + 1) + 8 * i)))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *v9));
          if ([v10 isEqualToString:v7])
          {
            os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v9));

            goto LABEL_20;
          }
        }
      }
    }
  }

  else
  {
    os_log_t v11 = sub_10002E39C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v12, v13))
    {
      memset(v20, 0, sizeof(v20));
      unsigned int v14 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v12, (os_log_type_t)v13)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 2LL;
      }
      v19[0] = 0;
      uint64_t v16 = (_OWORD *)_os_log_send_and_compose_impl( v15,  0LL,  v20,  256LL,  &_mh_execute_header,  v12,  v13,  "Invalid dns_config/domain",  v19,  2);
      __SC_log_send2(5LL, v12, v13, 0LL, v16);
      if (v16 != v20) {
        free(v16);
      }
    }
  }

  os_log_t v17 = 0LL;
LABEL_20:

  return v17;
}

- (BOOL)isResolverMulticast:(id *)a3
{
  var0 = a3->var7.var0;
  if (var0) {
    LOBYTE(var0) = strstr((const char *)var0, "mdns") != 0LL;
  }
  return (char)var0;
}

- (BOOL)isResolverPrivate:(id *)a3
{
  var0 = a3->var7.var0;
  if (var0) {
    LOBYTE(var0) = strstr((const char *)var0, "pdns") != 0LL;
  }
  return (char)var0;
}

- (void)processSupplementalDNSResolvers:(id *)a3
{
  type = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v79 = -[NSCountedSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithCapacity:", 0LL);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v6,  2LL,  2LL));

  if (*(void *)(&a3->var0 + 1))
  {
    if (a3->var0 >= 1)
    {
      uint64_t v8 = 0LL;
      do
      {
        uint64_t v9 = *(void **)(*(void *)(&a3->var0 + 1) + 8 * v8);
        if (*v9
          && !-[AgentController isResolverPrivate:]( self,  "isResolverPrivate:",  *(void *)(*(void *)(&a3->var0 + 1) + 8 * v8))
          && !-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v9))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *v9,  1LL));
          [v5 addObject:v10];
        }

        ++v8;
      }

      while (v8 < a3->var0);
    }
  }

  else
  {
    a3->var0 = 0;
  }

  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController cleanConflictingAgentsFromList:new_list:agentDictionary:]( self,  "cleanConflictingAgentsFromList:new_list:agentDictionary:",  v7,  v5,  v11);

  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v121 objects:v120 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v122;
    do
    {
      for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v122 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v121 + 1) + 8LL * (void)i);
        if (([v5 containsObject:v17] & 1) == 0)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v17]);

          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v19);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v121 objects:v120 count:16];
    }

    while (v14);
  }

  v81 = v5;
  os_log_t v86 = a3;

  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  id obj = v12;
  id v20 = [obj countByEnumeratingWithState:&v116 objects:v115 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v117;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v117 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v116 + 1) + 8LL * (void)j);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v24]);

        if (v26)
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 getAgentMapping]);
          __int128 v28 = v27;
          if (v27)
          {
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 getAssociatedEntity]);
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getDNSDataFromCurrentConfig:domain:]( self,  "getDNSDataFromCurrentConfig:domain:",  v86,  v29));

            if (!v30
              || (__int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v26 getAgentData]),
                  unsigned __int8 v32 = [v31 isEqual:v30],
                  v31,
                  (v32 & 1) == 0))
            {
              [type addObject:v26];

LABEL_33:
              goto LABEL_34;
            }
          }

          else
          {
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v26 getAssociatedEntity]);
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getDNSDataFromCurrentConfig:domain:]( self,  "getDNSDataFromCurrentConfig:domain:",  v86,  v33));

            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v26 getAgentData]);
            unsigned __int8 v35 = [v34 isEqual:v30];

            if ((v35 & 1) == 0)
            {
              [v26 updateAgentData:v30];
              [v80 addObject:v26];
            }
          }

          [v81 removeObject:v24];
          goto LABEL_33;
        }

- (void)processDNSResolvers:(id *)a3
{
  id v4 = -[AgentController copyResolverList:](self, "copyResolverList:", a3);
  if (v4)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  2LL,  3LL));

    if (v4->var1 && v4->var0)
    {
      uint64_t v6 = 0LL;
      while (1)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v4->var0[v6]));
        if (v6) {
          uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_defaultDNS #%u",  v6 + 1));
        }
        else {
          uint64_t v8 = @"_defaultDNS";
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

        if (!v10) {
          goto LABEL_11;
        }
        [v32 removeObject:v8];
        os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getAgentData]);
        unsigned __int8 v12 = [v7 isEqual:v11];

        if ((v12 & 1) == 0) {
          break;
        }
LABEL_12:
      }

      -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v10);
LABEL_11:
      -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___DNSAgent),  v8,  3LL,  0LL,  v7);
      goto LABEL_12;
    }

- (void)processScopedDNSResolvers:(id *)a3
{
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  2LL,  1LL));

  if (SHIDWORD(a3->var1.var1) >= 1 && *(void *)&a3->var2)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = &CC_SHA256_ptr;
    uint64_t v9 = "@";
    do
    {
      uint64_t v10 = *(void *)(*(void *)&a3->var2 + 8 * v7);
      uint64_t v11 = sub_100028BF4(*(_DWORD *)(v10 + 64), (uint64_t)v20);
      if (v11)
      {
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8[172] stringWithUTF8String:v11]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8[172] stringWithFormat:@"%s%@", v9, v12]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v10));
        id v15 = [v6 indexOfObject:v13];
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___DNSAgent),  v13,  1LL,  8LL,  v14);
          unint64_t v16 = 0LL;
        }

        else
        {
          uint64_t v17 = v9;
          [v6 removeObjectAtIndex:v15];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v13]);

          if (v16)
          {
            [v16 updateAgentData:v14];
          }

          uint64_t v9 = v17;
          uint64_t v8 = &CC_SHA256_ptr;
        }
      }

      else
      {
        id v14 = 0LL;
        unint64_t v16 = 0LL;
        unsigned __int8 v12 = 0LL;
        id v13 = 0LL;
      }

      ++v7;
    }

    while (v7 < SHIDWORD(a3->var1.var1));
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v19, v6);
}

- (void)processServiceSpecificDNSResolvers:(id *)a3
{
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  id v19 = (id)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v5,  2LL,  6LL));

  if (SLODWORD(a3->var4) >= 1 && *(unint64_t *)((char *)&a3->var4 + 4))
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = &CC_SHA256_ptr;
    uint64_t v8 = "@";
    do
    {
      uint64_t v9 = *(void *)(*(unint64_t *)((char *)&a3->var4 + 4) + 8 * v6);
      uint64_t v10 = *(unsigned int *)(v9 + 76);
      if ((_DWORD)v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[172], "stringWithFormat:", @"%s%u", v8, v10));
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v9));
        id v13 = [v19 indexOfObject:v11];
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:]( self,  "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:",  objc_opt_class(&OBJC_CLASS___DNSAgent),  v11,  6LL,  -1LL,  v12);
          id v14 = 0LL;
        }

        else
        {
          id v15 = v8;
          unint64_t v16 = v7;
          [v19 removeObjectAtIndex:v13];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v11]);

          if (v14)
          {
            [v14 updateAgentData:v12];
          }

          uint64_t v7 = v16;
          uint64_t v8 = v15;
        }
      }

      else
      {
        unsigned __int8 v12 = 0LL;
        id v14 = 0LL;
        uint64_t v11 = 0LL;
      }

      ++v6;
    }

    while (v6 < SLODWORD(a3->var4));
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v18, v19);
}

- (BOOL)isResolverOnion:(id *)a3
{
  return a3->var0.var1 && !strcmp(a3->var0.var0, "onion");
}

- (void)processOnionResolver:(id *)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  if (a3->var0 < 1)
  {
LABEL_6:
    if (qword_100079EA0) {
      return;
    }
    id v6 = objc_alloc(&OBJC_CLASS___NEPolicy);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult drop](&OBJC_CLASS___NEPolicyResult, "drop"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition domain:](&OBJC_CLASS___NEPolicyCondition, "domain:", @"onion"));
    id v52 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
    uint64_t v10 = (os_log_s *)[v6 initWithOrder:500 result:v7 conditions:v9];

    if (!v10) {
      goto LABEL_36;
    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    qword_100079EA0 = (uint64_t)[(id)v11 addPolicy:v10];

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    LOBYTE(v11) = [v12 apply];

    if ((v11 & 1) != 0)
    {
      os_log_t v13 = sub_10002E39C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = _SC_syslog_os_log_mapping(6LL);
      if (__SC_log_enabled(6LL, v14, v15))
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        unsigned int v16 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v14, (os_log_type_t)v15)) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 2LL;
        }
        v35[0] = 0;
        uint64_t v18 = (__int128 *)_os_log_send_and_compose_impl( v17,  0LL,  &v36,  256LL,  &_mh_execute_header,  v14,  v15,  "Added a [.onion] drop policy",  v35,  2);
        uint64_t v19 = 6LL;
LABEL_33:
        __SC_log_send2(v19, v14, v15, 0LL, v18);
        if (v18 != &v36) {
          free(v18);
        }
      }
    }

    else
    {
      qword_100079EA0 = 0LL;
      os_log_t v32 = sub_10002E39C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      uint64_t v15 = _SC_syslog_os_log_mapping(5LL);
      if (__SC_log_enabled(5LL, v14, v15))
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        unsigned int v33 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v14, (os_log_type_t)v15)) {
          uint64_t v34 = v33;
        }
        else {
          uint64_t v34 = 2LL;
        }
        v35[0] = 0;
        uint64_t v18 = (__int128 *)_os_log_send_and_compose_impl( v34,  0LL,  &v36,  256LL,  &_mh_execute_header,  v14,  v15,  "Could not add a [.onion] drop policy",  v35,  2);
        uint64_t v19 = 5LL;
        goto LABEL_33;
      }
    }

    goto LABEL_36;
  }

  uint64_t v5 = 0LL;
  while (!-[AgentController isResolverOnion:]( self,  "isResolverOnion:",  *(void *)(*(void *)(&a3->var0 + 1) + 8 * v5)))
  {
    if (++v5 >= a3->var0) {
      goto LABEL_6;
    }
  }

- (void)processDNSChanges
{
  uint64_t v3 = dns_configuration_copy(self, a2);
  if (v3)
  {
    -[AgentController processDNSResolvers:](self, "processDNSResolvers:", v3);
    -[AgentController processScopedDNSResolvers:](self, "processScopedDNSResolvers:", v3);
    -[AgentController processSupplementalDNSResolvers:](self, "processSupplementalDNSResolvers:", v3);
    -[AgentController processServiceSpecificDNSResolvers:](self, "processServiceSpecificDNSResolvers:", v3);
  }

  else
  {
    os_log_t v4 = sub_10002E39C();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v5, v6))
    {
      memset(v24, 0, sizeof(v24));
      unsigned int v7 = (_sc_log > 0) | 2;
      uint64_t v8 = os_log_type_enabled(v5, (os_log_type_t)v6) ? v7 : 2LL;
      v18[0] = 0;
      uint64_t v9 = (_OWORD *)_os_log_send_and_compose_impl( v8,  0LL,  v24,  256LL,  &_mh_execute_header,  v5,  v6,  "No DNS configuration",  v18,  2);
      __SC_log_send2(6LL, v5, v6, 0LL, v9);
      if (v9 != v24) {
        free(v9);
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    id v11 = [v10 copy];

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)i)]);
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v17);
        }

        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }

      while (v14);
    }
  }

  -[AgentController processOnionResolver:](self, "processOnionResolver:", v3);
  -[AgentController applyPolicies](self, "applyPolicies");
  if (v3) {
    dns_configuration_free(v3);
  }
}

- (const)copyConfigAgentData:(id)a3 uuid:(unsigned __int8)a4[16] length:(unint64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!a5)
  {
    os_log_t v26 = sub_10002E39C();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v22 = _SC_syslog_os_log_mapping(5LL);
    if (!__SC_log_enabled(5LL, v21, v22))
    {
LABEL_26:

      id v16 = 0LL;
      id v14 = 0LL;
      goto LABEL_27;
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    *(_OWORD *)uu1 = 0u;
    __int128 v39 = 0u;
    unsigned int v27 = (_sc_log > 0) | 2;
    if (os_log_type_enabled((os_log_t)v21, (os_log_type_t)v22)) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 2LL;
    }
    uint64_t v25 = _os_log_send_and_compose_impl( v28,  0LL,  uu1,  256LL,  &_mh_execute_header,  v21,  v22,  "Invalid parameters for copying agent data");
LABEL_24:
    os_log_t v29 = (unsigned __int8 *)v25;
    __SC_log_send2(5LL, v21, v22, 0LL, v25);
    if (v29 != uu1) {
      free(v29);
    }
    goto LABEL_26;
  }

  *a5 = 0LL;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (!v10)
  {
LABEL_10:

LABEL_14:
    uuid_unparse(a4, out);
    os_log_t v20 = sub_10002E39C();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = _SC_syslog_os_log_mapping(5LL);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    *(_OWORD *)uu1 = 0u;
    __int128 v39 = 0u;
    unsigned int v23 = (_sc_log > 0) | 2;
    if (os_log_type_enabled((os_log_t)v21, (os_log_type_t)v22)) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 2LL;
    }
    uint64_t v25 = _os_log_send_and_compose_impl( v24,  0LL,  uu1,  256LL,  &_mh_execute_header,  v21,  v22,  "Invalid config agent uuid %s specified",  &v31);
    goto LABEL_24;
  }

  id v11 = v10;
  uint64_t v12 = *(void *)v35;
LABEL_4:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v35 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getAgentUUID]);
    [v15 getUUIDBytes:uu1];

    if (!uuid_compare(uu1, a4)) {
      break;
    }

    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v33 count:16];
      if (v11) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  if (!v14) {
    goto LABEL_14;
  }
  id v16 = (id)objc_claimAutoreleasedReturnValue([v14 getAgentData]);
  id v17 = [v16 length];
  if (v17)
  {
    size_t v18 = (size_t)v17;
    *a5 = (unint64_t)v17;
    uint64_t v19 = malloc((size_t)v17);
    id v16 = v16;
    memcpy(v19, [v16 bytes], v18);
    goto LABEL_28;
  }

- (const)copyProxyAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  uint64_t v8 = -[AgentController copyConfigAgentData:uuid:length:](self, "copyConfigAgentData:uuid:length:", v7, a3, a4);

  return v8;
}

- (const)copyDNSAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  uint64_t v8 = -[AgentController copyConfigAgentData:uuid:length:](self, "copyConfigAgentData:uuid:length:", v7, a3, a4);

  return v8;
}

- (id)dataLengthSanityCheck:(id)a3
{
  id v3 = a3;
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getAgentData]);
  if ((unint64_t)[v4 length] < 0x401)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 getAgentUUID]);
    [v6 getUUIDBytes:v10];
    id v7 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v10, 16LL);
    [v5 setValue:v7 forKey:@"OutOfBandDataUUID"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  0LL));
  }

  return v8;
}

- (id)sanitizeEntity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@" #"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v4]);
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)sanitizeInterfaceName:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@"@"];
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:v4 + 1]);
  }
  uint64_t v6 = v5;

  return v6;
}

- (int)entityInstanceNumber:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@" #"];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = 0;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:v4 + 2]);
    int v5 = [v6 intValue];
  }

  return v5;
}

- (void)cleanConflictingAgentsFromList:(id)a3 new_list:(id)a4 agentDictionary:(id)a5
{
  id v8 = a3;
  id v38 = a4;
  id obj = v8;
  id v41 = a5;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v68 objects:v67 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v69;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController sanitizeEntity:](self, "sanitizeEntity:", v13));
        if (([v14 isEqualToString:v13] & 1) == 0)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v14]);
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v15);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v13]);

          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v16);
          os_log_t v17 = sub_10002E39C();
          size_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          uint64_t v19 = _SC_syslog_os_log_mapping(6LL);
          if (__SC_log_enabled(6LL, v18, v19))
          {
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            unsigned int v20 = (_sc_log > 0) | 2;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            BOOL v21 = os_log_type_enabled(v18, (os_log_type_t)v19);
            int v47 = 138412546;
            uint64_t v22 = v21 ? v20 : 2LL;
            __int128 v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = v13;
            LODWORD(v37) = 22;
            unsigned int v23 = (__int128 *)_os_log_send_and_compose_impl( v22,  0LL,  &v51,  256LL,  &_mh_execute_header,  v18,  v19,  "Removing conflicting domain: %@, %@",  &v47,  v37);
            __SC_log_send2(6LL, v18, v19, 0LL, v23);
            if (v23 != &v51) {
              free(v23);
            }
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v68 objects:v67 count:16];
    }

    while (v10);
  }

  uint64_t v24 = -[NSCountedSet initWithArray:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithArray:", v38);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obja = obj;
  id v25 = [obja countByEnumeratingWithState:&v43 objects:v42 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(obja);
        }
        os_log_t v29 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
        if (-[NSCountedSet countForObject:](v24, "countForObject:", v29) >= 2)
        {
          unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v29]);
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v30);
          os_log_t v31 = sub_10002E39C();
          os_log_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          uint64_t v33 = _SC_syslog_os_log_mapping(6LL);
          if (__SC_log_enabled(6LL, v32, v33))
          {
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            unsigned int v34 = (_sc_log > 0) | 2;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            if (os_log_type_enabled(v32, (os_log_type_t)v33)) {
              uint64_t v35 = v34;
            }
            else {
              uint64_t v35 = 2LL;
            }
            int v47 = 138412290;
            __int128 v48 = v29;
            LODWORD(v37) = 12;
            __int128 v36 = (__int128 *)_os_log_send_and_compose_impl( v35,  0LL,  &v51,  256LL,  &_mh_execute_header,  v32,  v33,  "Removing domain %@ as it has duplicates in the current config",  &v47,  v37);
            __SC_log_send2(6LL, v32, v33, 0LL, v36);
            if (v36 != &v51) {
              free(v36);
            }
          }
        }
      }

      id v26 = [obja countByEnumeratingWithState:&v43 objects:v42 count:16];
    }

    while (v26);
  }
}

- (id)getAgentList:(id)a3 agentType:(unint64_t)a4 agentSubType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v14 getAgentType] == (id)a4 && objc_msgSend(v14, "getAgentSubType") == (id)a5)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getAssociatedEntity]);
          [v8 addObject:v15];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }

    while (v11);
  }

  return v8;
}

- (void)deleteAgentList:(id)a3 list:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)]);
        -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v9);
  }
}

- (id)getAgentWithSameDataAndSubType:(id)a3 data:(id)a4 subType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getAgentData]);
      unsigned int v16 = [v15 isEqual:v8];

      if (v16)
      {
        if ([v14 getAgentSubType] == (id)a5)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 getRegistrationObject]);

          if (v17) {
            break;
          }
        }
      }

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    __int128 v14 = 0LL;
  }

  return v14;
}

- (BOOL)addPolicyToFloatingAgent:(id)a3 domain:(id)a4 agentUUIDToUse:(id)a5 policyType:(int64_t)a6 useControlPolicySession:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  __int128 v130 = v12;
  id v15 = [v12 getAgentType];
  id v16 = v15;
  if (v15 == (id)2) {
    int v17 = 0;
  }
  else {
    int v17 = 5000;
  }
  if (v15 == (id)2) {
    int v18 = 5000;
  }
  else {
    int v18 = 0;
  }
  unsigned int v19 = -[AgentController entityInstanceNumber:](self, "entityInstanceNumber:", v14);
  __int128 v131 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController sanitizeEntity:](self, "sanitizeEntity:", v14));

  switch(a6)
  {
    case 0LL:
      unsigned int v120 = v18;
      uint64_t v20 = 0LL;
      int v21 = v17 + 1000;
      goto LABEL_17;
    case 6LL:
      unsigned int v120 = v18;
      int v21 = v17 + 500;
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition domain:](&OBJC_CLASS___NEPolicyCondition, "domain:", v131));
      int v29 = 750;
      goto LABEL_19;
    case 7LL:
      unsigned int v120 = v18;
      int v21 = v17 + 1000;
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
LABEL_17:
      int v29 = 1250;
      goto LABEL_19;
    case 8LL:
      unsigned int v120 = v18;
      int v21 = v17 | 0x64;
      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[AgentController sanitizeInterfaceName:](self, "sanitizeInterfaceName:", v131));

      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition scopedInterface:](&OBJC_CLASS___NEPolicyCondition, "scopedInterface:", v30));
      int v29 = 250;
      __int128 v131 = (void *)v30;
LABEL_19:
      uint64_t v31 = v21 + v19;
      id v129 = v13;
      uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](&OBJC_CLASS___NEPolicyResult, "netAgentUUID:", v13));
      id v33 = objc_alloc(&OBJC_CLASS___NEPolicy);
      unsigned int v34 = v33;
      __int128 v124 = (void *)v32;
      __int128 v128 = (void *)v20;
      if (v20)
      {
        uint64_t v136 = v20;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v136, 1LL));
        id v36 = [v34 initWithOrder:v31 result:v32 conditions:v35];

        if (v36) {
          goto LABEL_21;
        }
LABEL_27:
        os_log_t v42 = sub_10002E39C();
        __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        uint64_t v44 = _SC_syslog_os_log_mapping(5LL);
        id v13 = v129;
        uint64_t v28 = v130;
        if (__SC_log_enabled(5LL, v43, v44))
        {
          __int128 v151 = 0u;
          __int128 v152 = 0u;
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          LODWORD(v45) = (_sc_log > 0) | 2;
          uint64_t v45 = os_log_type_enabled(v43, (os_log_type_t)v44) ? v45 : 2LL;
          __int128 v46 = v43;
          int v47 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
          int v134 = 138412290;
          __int128 v135 = v47;
          __int128 v48 = (__int128 *)_os_log_send_and_compose_impl( v45,  0LL,  &v137,  256LL,  &_mh_execute_header,  v46,  v44,  "Could not create a policy for agent %@",  &v134,  12);

          __SC_log_send2(5LL, v46, v44, 0LL, v48);
          if (v48 != &v137) {
            free(v48);
          }
        }

        BOOL v49 = 0;
        __int128 v23 = v128;
        goto LABEL_104;
      }

      id v36 = [v33 initWithOrder:v31 result:v32 conditions:0];
      if (!v36) {
        goto LABEL_27;
      }
LABEL_21:
      if (v7)
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));

        if (!v37)
        {
          id v38 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController createPolicySession](self, "createPolicySession"));
          -[AgentController setControlPolicySession:](self, "setControlPolicySession:", v38);

          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
          if (!v39)
          {
            os_log_t v90 = sub_10002E39C();
            __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
            uint64_t v92 = _SC_syslog_os_log_mapping(5LL);
            uint64_t v28 = v130;
            if (__SC_log_enabled(5LL, v91, v92))
            {
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              __int128 v147 = 0u;
              __int128 v148 = 0u;
              __int128 v145 = 0u;
              __int128 v146 = 0u;
              __int128 v143 = 0u;
              __int128 v144 = 0u;
              __int128 v141 = 0u;
              __int128 v142 = 0u;
              __int128 v139 = 0u;
              __int128 v140 = 0u;
              __int128 v137 = 0u;
              __int128 v138 = 0u;
              LODWORD(v93) = (_sc_log > 0) | 2;
              uint64_t v93 = os_log_type_enabled(v91, (os_log_type_t)v92) ? v93 : 2LL;
              __int128 v94 = v91;
              __int128 v95 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
              int v134 = 138412290;
              __int128 v135 = v95;
              __int128 v96 = (__int128 *)_os_log_send_and_compose_impl( v93,  0LL,  &v137,  256LL,  &_mh_execute_header,  v94,  v92,  "Could not create a control policy session for agent %@",  &v134,  12);

              __SC_log_send2(5LL, v94, v92, 0LL, v96);
              if (v96 != &v137) {
                free(v96);
              }
            }

            goto LABEL_46;
          }

          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
          [v40 setPriority:100];
        }

        uint64_t v41 = objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
      }

      else
      {
        uint64_t v41 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
      }

      uint64_t v50 = (void *)v41;
      [v130 setPreferredPolicySession:v41];

      uint64_t v51 = objc_claimAutoreleasedReturnValue([v130 preferredPolicySession]);
      id v52 = [(id)v51 addPolicy:v36];
      if (!v52)
      {
        os_log_t v60 = sub_10002E39C();
        __int128 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        uint64_t v62 = _SC_syslog_os_log_mapping(5LL);
        uint64_t v28 = v130;
        if (__SC_log_enabled(5LL, v61, v62))
        {
          uint64_t v63 = v51;
          __int128 v151 = 0u;
          __int128 v152 = 0u;
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v61, (os_log_type_t)v62)) {
            uint64_t v51 = v51;
          }
          else {
            uint64_t v51 = 2LL;
          }
          __int128 v64 = v61;
          __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
          int v134 = 138412290;
          __int128 v135 = v65;
          __int128 v66 = (__int128 *)_os_log_send_and_compose_impl( v51,  0LL,  &v137,  256LL,  &_mh_execute_header,  v64,  v62,  "Could not add a netagent policy for agent %@",  &v134,  12);

          __SC_log_send2(5LL, v64, v62, 0LL, v66);
          if (v66 != &v137) {
            free(v66);
          }
          uint64_t v51 = v63;
        }

LABEL_46:
        BOOL v49 = 0;
        __int128 v23 = v128;
        id v13 = v129;
        goto LABEL_104;
      }

      id v119 = v52;
      uint64_t v53 = (v17 + v29);
      uint64_t v54 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](&OBJC_CLASS___NEPolicyResult, "skipWithOrder:", v120));

      id v55 = objc_alloc(&OBJC_CLASS___NEPolicy);
      __int128 v56 = v55;
      __int128 v23 = v128;
      if (v128)
      {
        v133 = v128;
        uint64_t v57 = v51;
        uint64_t v58 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v133, 1LL));
        id v59 = [v56 initWithOrder:v53 result:v54 conditions:v58];

        id v36 = (id)v58;
        uint64_t v51 = v57;
      }

      else
      {
        id v59 = [v55 initWithOrder:v53 result:v54 conditions:0];
      }

      os_log_t v67 = (void *)v54;

      if (v59)
      {
        id v68 = [(id)v51 addPolicy:v59];
        id v13 = v129;
        if (v68)
        {
          id v69 = v68;
          __int128 v121 = (void *)v54;
          if (v16 != (id)1)
          {
            v127 = (void *)v51;
            id v89 = 0LL;
LABEL_84:
            __int128 v99 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
            uint64_t v28 = v130;
            __int128 v100 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
            __int128 v101 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKey:v100]);

            if (!v101) {
              __int128 v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            }
            __int128 v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v119));
            [v101 addObject:v102];

            __int128 v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v69));
            [v101 addObject:v103];

            if (v89)
            {
              __int128 v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v89));
              [v101 addObject:v104];
            }

            __int128 v105 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
            __int128 v106 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
            [v105 setObject:v101 forKey:v106];

            BOOL v49 = 1;
            goto LABEL_103;
          }

          __int128 v70 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  &ne_privacy_proxy_netagent_id);
          uint64_t v71 = objc_claimAutoreleasedReturnValue( +[NEPolicyResult removeNetworkAgentUUID:]( &OBJC_CLASS___NEPolicyResult,  "removeNetworkAgentUUID:",  v70));
          id v72 = objc_alloc(&OBJC_CLASS___NEPolicy);
          v73 = v72;
          __int128 v118 = (void *)v71;
          if (v128)
          {
            int v132 = v128;
            uint64_t v74 = v51;
            uint64_t v75 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v132, 1LL));
            id v76 = [v73 initWithOrder:v31 result:v71 conditions:v75];

            id v59 = (id)v75;
            uint64_t v51 = v74;
          }

          else
          {
            id v76 = [v72 initWithOrder:v31 result:v71 conditions:0];
          }

          __int128 v97 = v121;
          if (v76)
          {
            id v98 = [(id)v51 addPolicy:v76];
            if (v98)
            {
              id v89 = v98;
              v127 = (void *)v51;

              id v59 = v76;
              goto LABEL_84;
            }

            __int128 v107 = v70;
            os_log_t v115 = sub_10002E39C();
            __int128 v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
            uint64_t v110 = _SC_syslog_os_log_mapping(5LL);
            if (__SC_log_enabled(5LL, v109, v110))
            {
              uint64_t v111 = v51;
              __int128 v112 = v128;
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              __int128 v147 = 0u;
              __int128 v148 = 0u;
              __int128 v145 = 0u;
              __int128 v146 = 0u;
              __int128 v143 = 0u;
              __int128 v144 = 0u;
              __int128 v141 = 0u;
              __int128 v142 = 0u;
              __int128 v139 = 0u;
              __int128 v140 = 0u;
              __int128 v137 = 0u;
              __int128 v138 = 0u;
              LODWORD(v51) = (_sc_log > 0) | 2;
              if (os_log_type_enabled(v109, (os_log_type_t)v110)) {
                uint64_t v51 = v51;
              }
              else {
                uint64_t v51 = 2LL;
              }
              __int128 v109 = v109;
              __int128 v113 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
              int v134 = 138412290;
              __int128 v135 = v113;
              uint64_t v114 = _os_log_send_and_compose_impl( v51,  0LL,  &v137,  256LL,  &_mh_execute_header,  v109,  v110,  "Could not add a privacy proxy removal policy for agent %@",  &v134,  12,  v118);
LABEL_99:
              __int128 v116 = (__int128 *)v114;

              __SC_log_send2(5LL, v109, v110, 0LL, v116);
              if (v116 != &v137) {
                free(v116);
              }
              __int128 v23 = v112;
              uint64_t v51 = v111;
              __int128 v97 = v121;
            }
          }

          else
          {
            __int128 v107 = v70;
            os_log_t v108 = sub_10002E39C();
            __int128 v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
            uint64_t v110 = _SC_syslog_os_log_mapping(5LL);
            if (__SC_log_enabled(5LL, v109, v110))
            {
              uint64_t v111 = v51;
              __int128 v112 = v128;
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              __int128 v147 = 0u;
              __int128 v148 = 0u;
              __int128 v145 = 0u;
              __int128 v146 = 0u;
              __int128 v143 = 0u;
              __int128 v144 = 0u;
              __int128 v141 = 0u;
              __int128 v142 = 0u;
              __int128 v139 = 0u;
              __int128 v140 = 0u;
              __int128 v137 = 0u;
              __int128 v138 = 0u;
              LODWORD(v51) = (_sc_log > 0) | 2;
              if (os_log_type_enabled(v109, (os_log_type_t)v110)) {
                uint64_t v51 = v51;
              }
              else {
                uint64_t v51 = 2LL;
              }
              __int128 v109 = v109;
              __int128 v113 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
              int v134 = 138412290;
              __int128 v135 = v113;
              uint64_t v114 = _os_log_send_and_compose_impl( v51,  0LL,  &v137,  256LL,  &_mh_execute_header,  v109,  v110,  "Could not create a policy for agent %@",  &v134,  12,  v118);
              goto LABEL_99;
            }
          }

          BOOL v49 = 0;
          uint64_t v28 = v130;
LABEL_103:
          id v13 = v129;
          goto LABEL_104;
        }

        os_log_t v83 = sub_10002E39C();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        uint64_t v85 = _SC_syslog_os_log_mapping(5LL);
        uint64_t v28 = v130;
        if (__SC_log_enabled(5LL, v84, v85))
        {
          __int128 v123 = v67;
          uint64_t v126 = v51;
          __int128 v151 = 0u;
          __int128 v152 = 0u;
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v84, (os_log_type_t)v85)) {
            uint64_t v51 = v51;
          }
          else {
            uint64_t v51 = 2LL;
          }
          os_log_t v86 = v84;
          v87 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
          int v134 = 138412290;
          __int128 v135 = v87;
          __int128 v88 = (__int128 *)_os_log_send_and_compose_impl( v51,  0LL,  &v137,  256LL,  &_mh_execute_header,  v86,  v85,  "Could not add a skip policy for agent %@",  &v134,  12);

          __SC_log_send2(5LL, v86, v85, 0LL, v88);
          if (v88 != &v137) {
            free(v88);
          }
          uint64_t v51 = v126;
          __int128 v23 = v128;
          os_log_t v67 = v123;
        }
      }

      else
      {
        os_log_t v77 = sub_10002E39C();
        v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        uint64_t v79 = _SC_syslog_os_log_mapping(5LL);
        id v13 = v129;
        uint64_t v28 = v130;
        if (__SC_log_enabled(5LL, v78, v79))
        {
          __int128 v122 = v67;
          uint64_t v125 = v51;
          __int128 v151 = 0u;
          __int128 v152 = 0u;
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v78, (os_log_type_t)v79)) {
            uint64_t v51 = v51;
          }
          else {
            uint64_t v51 = 2LL;
          }
          id v80 = v78;
          v81 = (void *)objc_claimAutoreleasedReturnValue([v130 getAgentName]);
          int v134 = 138412290;
          __int128 v135 = v81;
          id v82 = (__int128 *)_os_log_send_and_compose_impl( v51,  0LL,  &v137,  256LL,  &_mh_execute_header,  v80,  v79,  "Could not create a policy for agent %@",  &v134,  12);

          __SC_log_send2(5LL, v80, v79, 0LL, v82);
          if (v82 != &v137) {
            free(v82);
          }
          os_log_t v67 = v122;
          uint64_t v51 = v125;
        }
      }

LABEL_71:
      BOOL v49 = 0;
LABEL_104:

      return v49;
    default:
      os_log_t v22 = sub_10002E39C();
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = _SC_syslog_os_log_mapping(5LL);
      if (!__SC_log_enabled(5LL, v23, v24))
      {
        BOOL v49 = 0;
        uint64_t v28 = v130;
        goto LABEL_104;
      }

      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      __int128 v143 = 0u;
      __int128 v144 = 0u;
      __int128 v141 = 0u;
      __int128 v142 = 0u;
      __int128 v139 = 0u;
      __int128 v140 = 0u;
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      unsigned int v25 = (_sc_log > 0) | 2;
      if (os_log_type_enabled((os_log_t)v23, (os_log_type_t)v24)) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 2LL;
      }
      LOWORD(v134) = 0;
      uint64_t v27 = (__int128 *)_os_log_send_and_compose_impl( v26,  0LL,  &v137,  256LL,  &_mh_execute_header,  v23,  v24,  "Invalid policy condition specified",  &v134,  2);
      __SC_log_send2(5LL, v23, v24, 0LL, v27);
      uint64_t v28 = v130;
      if (v27 != &v137) {
        free(v27);
      }
      goto LABEL_71;
  }

- (BOOL)spawnFloatingAgent:(Class)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 publishData:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v14 setValue:v12 forKey:@"EntityName"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  [v14 setValue:v15 forKey:@"AgentSubType"];

  id v16 = [[a3 alloc] initWithParameters:v14];
  if (!-[AgentController registerAgent:](self, "registerAgent:", v16)) {
    goto LABEL_17;
  }
  if (v13)
  {
    [v16 updateAgentData:v13];
    -[AgentController publishToAgent:](self, "publishToAgent:", v16);
  }

  if ((a6 & 0x8000000000000000LL) == 0)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 agentUUID]);
    unsigned __int8 v18 = -[AgentController addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:]( self,  "addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:",  v16,  v12,  v17,  a6,  a5 == 7);

    if ((v18 & 1) == 0)
    {
      -[AgentController unregisterAgent:](self, "unregisterAgent:", v16);
LABEL_17:
      BOOL v27 = 0;
      goto LABEL_18;
    }
  }

  os_log_t v19 = sub_10002E39C();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = _SC_syslog_os_log_mapping(6LL);
  if (__SC_log_enabled(6LL, v20, v21))
  {
    memset(v31, 0, sizeof(v31));
    unsigned int v22 = (_sc_log > 0) | 2;
    uint64_t v23 = os_log_type_enabled(v20, (os_log_type_t)v21) ? v22 : 2LL;
    int v29 = 138412290;
    id v30 = v12;
    uint64_t v24 = (_OWORD *)_os_log_send_and_compose_impl( v23,  0LL,  v31,  256LL,  &_mh_execute_header,  v20,  v21,  "Spawning floating agent for %@",  &v29,  12);
    __SC_log_send2(6LL, v20, v21, 0LL, v24);
    if (v24 != v31) {
      free(v24);
    }
  }

  if ([v16 getAgentType] == (id)1) {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  }
  else {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  }
  uint64_t v26 = v25;
  [v25 setObject:v16 forKey:v12];

  BOOL v27 = 1;
LABEL_18:

  return v27;
}

- (BOOL)spawnMappedFloatingAgent:(id)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 updateData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v15 setValue:v13 forKey:@"EntityName"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  [v15 setValue:v16 forKey:@"AgentSubType"];

  id v17 = [objc_alloc((Class)objc_opt_class(v12)) initWithParameters:v15];
  unsigned __int8 v18 = v17;
  if (v14) {
    [v17 updateAgentData:v14];
  }
  os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 agentUUID]);
  BOOL v20 = -[AgentController addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:]( self,  "addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:",  v18,  v13,  v19,  a6,  a5 == 7);

  if (v20)
  {
    if ([v12 getAgentType] == (id)1) {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    }
    else {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    }
    unsigned int v22 = v21;
    [v21 setObject:v18 forKey:v13];

    [v18 setAgentMapping:v12];
    os_log_t v23 = sub_10002E39C();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v24, v25))
    {
      BOOL v33 = v20;
      id v34 = v14;
      memset(v39, 0, sizeof(v39));
      unsigned int v26 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v24, (os_log_type_t)v25)) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = 2LL;
      }
      uint64_t v28 = v24;
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v18 getAgentName]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v12 getAgentName]);
      int v35 = 138412546;
      id v36 = v29;
      __int16 v37 = 2112;
      id v38 = v30;
      uint64_t v31 = (_OWORD *)_os_log_send_and_compose_impl( v27,  0LL,  v39,  256LL,  &_mh_execute_header,  v28,  v25,  "Mapped floating agent %@ to %@",  &v35,  22);

      __SC_log_send2(6LL, v28, v25, 0LL, v31);
      if (v31 != v39) {
        free(v31);
      }
      id v14 = v34;
      LOBYTE(v20) = v33;
    }
  }

  return v20;
}

- (BOOL)publishToAgent:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataLengthSanityCheck:](self, "dataLengthSanityCheck:", v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 getAgentData]);
    id v7 = [v6 copy];

    [v4 updateAgentData:v5];
    os_log_t v8 = sub_10002E39C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v9, v10))
    {
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      unsigned int v11 = (_sc_log > 0) | 2;
      uint64_t v12 = os_log_type_enabled(v9, (os_log_type_t)v10) ? v11 : 2LL;
      id v13 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 getAgentName]);
      int v39 = 138412546;
      __int128 v40 = v14;
      __int16 v41 = 2048;
      id v42 = [v7 length];
      id v15 = (__int128 *)_os_log_send_and_compose_impl( v12,  0LL,  &v43,  256LL,  &_mh_execute_header,  v13,  v10,  "Data too large for %@ (%lu bytes)!",  &v39,  22);

      __SC_log_send2(5LL, v13, v10, 0LL, v15);
      if (v15 != &v43) {
        free(v15);
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"registrationObject"]);
  os_log_t v17 = sub_10002E39C();
  unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = _SC_syslog_os_log_mapping(5LL);
  int v20 = __SC_log_enabled(5LL, v18, v19);
  if (!v16)
  {
    if (!v20) {
      goto LABEL_33;
    }
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    unsigned int v29 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19)) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 2LL;
    }
    LOWORD(v39) = 0;
    LODWORD(v37) = 2;
    uint64_t v31 = _os_log_send_and_compose_impl( v30,  0LL,  &v43,  256LL,  &_mh_execute_header,  v18,  v19,  "Config Agent not registered. Cannot Update",  &v39,  v37);
    goto LABEL_31;
  }

  if (v20)
  {
    id v38 = v5;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    unsigned int v21 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19)) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 2LL;
    }
    os_log_t v23 = v18;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 getAgentName]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 getAgentData]);
    id v26 = [v25 length];
    int v39 = 138412546;
    __int128 v40 = v24;
    __int16 v41 = 2048;
    id v42 = v26;
    LODWORD(v37) = 22;
    uint64_t v27 = (__int128 *)_os_log_send_and_compose_impl( v22,  0LL,  &v43,  256LL,  &_mh_execute_header,  v23,  v19,  "Publishing data to agent %@ (%lu bytes)",  &v39,  v37);

    __SC_log_send2(5LL, v23, v19, 0LL, v27);
    if (v27 != &v43) {
      free(v27);
    }
    int v5 = v38;
  }

  if ([v16 updateNetworkAgent:v4])
  {
    BOOL v28 = 1;
    if (!v7) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  os_log_t v32 = sub_10002E39C();
  unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  uint64_t v19 = _SC_syslog_os_log_mapping(5LL);
  if (__SC_log_enabled(5LL, v18, v19))
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    unsigned int v33 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19)) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 2LL;
    }
    LOWORD(v39) = 0;
    LODWORD(v37) = 2;
    uint64_t v31 = _os_log_send_and_compose_impl( v34,  0LL,  &v43,  256LL,  &_mh_execute_header,  v18,  v19,  "Could not update config agent",  &v39,  v37);
LABEL_31:
    int v35 = (__int128 *)v31;
    __SC_log_send2(5LL, v18, v19, 0LL, v31);
    if (v35 != &v43) {
      free(v35);
    }
  }

- (BOOL)destroyFloatingAgent:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 getAssociatedEntity]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 getAgentName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

    if (v9)
    {
      __int128 v65 = self;
      os_log_t v67 = v6;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredPolicySession]);
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v66 = v9;
      id obj = v9;
      id v11 = [obj countByEnumeratingWithState:&v94 objects:v93 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v95;
        uint64_t v69 = *(void *)v95;
        do
        {
          id v14 = 0LL;
          id v70 = v12;
          do
          {
            if (*(void *)v95 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)v14) unsignedIntegerValue];
            if (([v10 removePolicyWithID:v15] & 1) == 0)
            {
              os_log_t v16 = sub_10002E39C();
              os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
              uint64_t v18 = _SC_syslog_os_log_mapping(5LL);
              if (__SC_log_enabled(5LL, v17, v18))
              {
                __int128 v91 = 0u;
                __int128 v92 = 0u;
                __int128 v89 = 0u;
                __int128 v90 = 0u;
                __int128 v87 = 0u;
                __int128 v88 = 0u;
                __int128 v85 = 0u;
                __int128 v86 = 0u;
                __int128 v83 = 0u;
                __int128 v84 = 0u;
                __int128 v81 = 0u;
                __int128 v82 = 0u;
                __int128 v79 = 0u;
                __int128 v80 = 0u;
                unsigned int v19 = (_sc_log > 0) | 2;
                __int128 v77 = 0u;
                __int128 v78 = 0u;
                if (os_log_type_enabled(v17, (os_log_type_t)v18)) {
                  uint64_t v20 = v19;
                }
                else {
                  uint64_t v20 = 2LL;
                }
                unsigned int v21 = v17;
                uint64_t v22 = v10;
                os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 policyWithID:v15]);
                uint64_t v24 = v5;
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 getAgentName]);
                int v73 = 138412546;
                uint64_t v74 = v23;
                __int16 v75 = 2112;
                id v76 = v25;
                LODWORD(v64) = 22;
                id v26 = (__int128 *)_os_log_send_and_compose_impl( v20,  0LL,  &v77,  256LL,  &_mh_execute_header,  v21,  v18,  "Could not remove policy %@ for agent %@",  &v73,  v64);

                __SC_log_send2(5LL, v21, v18, 0LL, v26);
                if (v26 != &v77) {
                  free(v26);
                }
                int v5 = v24;
                uint64_t v10 = v22;
                uint64_t v13 = v69;
                id v12 = v70;
              }
            }

            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [obj countByEnumeratingWithState:&v94 objects:v93 count:16];
        }

        while (v12);
      }

      self = v65;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](v65, "policyDB"));
      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v5 getAgentName]);
      [v27 removeObjectForKey:v28];

      id v9 = v66;
      id v6 = v67;
    }

    os_log_t v29 = sub_10002E39C();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v30, v31))
    {
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      unsigned int v32 = (_sc_log > 0) | 2;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      uint64_t v33 = os_log_type_enabled(v30, (os_log_type_t)v31) ? v32 : 2LL;
      int v73 = 138412290;
      uint64_t v74 = v6;
      LODWORD(v64) = 12;
      uint64_t v34 = (__int128 *)_os_log_send_and_compose_impl( v33,  0LL,  &v77,  256LL,  &_mh_execute_header,  v30,  v31,  "Destroying floating agent for %@",  &v73,  v64);
      __SC_log_send2(6LL, v30, v31, 0LL, v34);
      if (v34 != &v77) {
        free(v34);
      }
    }

    if ([v5 getAgentType] == (id)1)
    {
      int v35 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      [v35 removeObjectForKey:v6];

      id v36 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController floatingProxyAgentList_TCPConverter]( self,  "floatingProxyAgentList_TCPConverter"));
      [v36 removeObjectForKey:v6];

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController floatingProxyAgentList_TCPConverter]( self,  "floatingProxyAgentList_TCPConverter"));
      id v38 = [v37 count];

      if (!v38) {
        sub_10004A968(0);
      }
    }

    else
    {
      int v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v5 getAssociatedEntity]);
      [v39 removeObjectForKey:v40];
    }

    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v5 getRegistrationObject]);

    if (v41) {
      -[AgentController unregisterAgent:](self, "unregisterAgent:", v5);
    }
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));

    if (v42)
    {
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v43,  1LL,  7LL));

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      __int128 v46 = self;
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( -[AgentController getAgentList:agentType:agentSubType:]( self,  "getAgentList:agentType:agentSubType:",  v45,  2LL,  7LL));

      if (![v44 count] && !objc_msgSend(v47, "count"))
      {
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](v46, "controlPolicySession"));
        unsigned __int8 v49 = [v48 removeAllPolicies];

        if ((v49 & 1) == 0)
        {
          id v68 = v6;
          os_log_t v50 = sub_10002E39C();
          __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          uint64_t v52 = _SC_syslog_os_log_mapping(3LL);
          if (__SC_log_enabled(3LL, v51, v52))
          {
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            __int128 v89 = 0u;
            __int128 v90 = 0u;
            __int128 v87 = 0u;
            __int128 v88 = 0u;
            __int128 v85 = 0u;
            __int128 v86 = 0u;
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v81 = 0u;
            __int128 v82 = 0u;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            LODWORD(v53) = (_sc_log > 0) | 2;
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            if (os_log_type_enabled(v51, (os_log_type_t)v52)) {
              uint64_t v53 = v53;
            }
            else {
              uint64_t v53 = 2LL;
            }
            __int128 v54 = v51;
            id obja = v5;
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v5 getAgentName]);
            int v73 = 138412290;
            uint64_t v74 = v55;
            LODWORD(v64) = 12;
            __int128 v56 = (__int128 *)_os_log_send_and_compose_impl( v53,  0LL,  &v77,  256LL,  &_mh_execute_header,  v54,  v52,  "Could not remove policies for agent %@",  &v73,  v64);

            __SC_log_send2(3LL, v54, v52, 0LL, v56);
            if (v56 != &v77) {
              free(v56);
            }
            int v5 = obja;
          }

          id v6 = v68;
        }

        -[AgentController setControlPolicySession:](v46, "setControlPolicySession:", 0LL);
        os_log_t v57 = sub_10002E39C();
        __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        uint64_t v59 = _SC_syslog_os_log_mapping(5LL);
        if (__SC_log_enabled(5LL, v58, v59))
        {
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          __int128 v89 = 0u;
          __int128 v90 = 0u;
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          unsigned int v60 = (_sc_log > 0) | 2;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          if (os_log_type_enabled(v58, (os_log_type_t)v59)) {
            uint64_t v61 = v60;
          }
          else {
            uint64_t v61 = 2LL;
          }
          LOWORD(v73) = 0;
          LODWORD(v64) = 2;
          uint64_t v62 = (__int128 *)_os_log_send_and_compose_impl( v61,  0LL,  &v77,  256LL,  &_mh_execute_header,  v58,  v59,  "Closed control policy session",  &v73,  v64);
          __SC_log_send2(5LL, v58, v59, 0LL, v62);
          if (v62 != &v77) {
            free(v62);
          }
        }
      }
    }
  }

  return v5 != 0LL;
}

- (BOOL)registerAgent:(id)a3
{
  id v3 = a3;
  id v4 = -[NWNetworkAgentRegistration initWithNetworkAgentClass:]( objc_alloc(&OBJC_CLASS___NWNetworkAgentRegistration),  "initWithNetworkAgentClass:",  objc_opt_class(v3));
  unsigned __int8 v5 = -[NWNetworkAgentRegistration registerNetworkAgent:](v4, "registerNetworkAgent:", v3);
  if ((v5 & 1) != 0)
  {
    [v3 addAgentRegistrationObject:v4];
  }

  else
  {
    os_log_t v6 = sub_10002E39C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v7, v8))
    {
      memset(v14, 0, sizeof(v14));
      unsigned int v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 2LL;
      }
      v13[0] = 0;
      id v11 = (_OWORD *)_os_log_send_and_compose_impl( v10,  0LL,  v14,  256LL,  &_mh_execute_header,  v7,  v8,  "Could not register config agent",  v13,  2);
      __SC_log_send2(5LL, v7, v8, 0LL, v11);
      if (v11 != v14) {
        free(v11);
      }
    }
  }

  return v5;
}

- (BOOL)unregisterAgent:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForKey:@"registrationObject"]);
  id v4 = v3;
  if (!v3)
  {
    os_log_t v6 = sub_10002E39C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v7, v8))
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      unsigned int v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 2LL;
      }
      LOWORD(v17[0]) = 0;
      uint64_t v11 = _os_log_send_and_compose_impl( v10,  0LL,  &v18,  256LL,  &_mh_execute_header,  v7,  v8,  "Config Agent not registered. Cannot unregister",  v17,  2,  v17[0]);
      goto LABEL_14;
    }

- (OS_dispatch_queue)controllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setControllerQueue:(id)a3
{
}

- (NSMutableDictionary)floatingProxyAgentList
{
  return self->_floatingProxyAgentList;
}

- (void)setFloatingProxyAgentList:(id)a3
{
}

- (NSMutableDictionary)floatingProxyAgentList_TCPConverter
{
  return self->_floatingProxyAgentList_TCPConverter;
}

- (void)setFloatingProxyAgentList_TCPConverter:(id)a3
{
}

- (NSMutableDictionary)floatingDNSAgentList
{
  return self->_floatingDNSAgentList;
}

- (void)setFloatingDNSAgentList:(id)a3
{
}

- (NSMutableDictionary)policyDB
{
  return self->_policyDB;
}

- (void)setPolicyDB:(id)a3
{
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
}

- (NEPolicySession)controlPolicySession
{
  return self->_controlPolicySession;
}

- (void)setControlPolicySession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end