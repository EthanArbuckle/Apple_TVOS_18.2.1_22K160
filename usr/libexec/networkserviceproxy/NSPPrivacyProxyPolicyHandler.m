@interface NSPPrivacyProxyPolicyHandler
+ (id)sharedHandler;
- (BOOL)addPoliciesForMPTCPConverterProxy:(id)a3;
- (BOOL)addPoliciesForProbing;
- (BOOL)set:(id)a3 flowDivertHandle:(id)a4 inProcessFlowDivert:(BOOL)a5 ingressProxyURL:(id)a6 ingressFallbackProxyURL:(id)a7 exceptionBundleIDs:(id)a8 exceptionProcessPaths:(id)a9;
- (NSPPrivacyProxyPolicyHandler)init;
- (id)currentPolicy;
- (void)addNetworkDiscoveryProxyAgent:(id)a3 with:(id)a4;
- (void)addObliviousProxyAgent:(id)a3 processes:(id)a4 hostname:(id)a5;
- (void)addPreferredProxy:(id)a3 agentUUID:(id)a4 withDomainFilter:(id)a5;
- (void)addProxiedContentAgent:(id)a3 maps:(id)a4;
- (void)cellularDisabled:(BOOL)a3;
- (void)handleAppInstallation:(id)a3;
- (void)handleAppUninstallation:(id)a3;
- (void)interface:(id)a3 disabled:(BOOL)a4;
- (void)remove:(BOOL)a3;
- (void)removeObliviousProxyAgent:(id)a3 forHostname:(id)a4 apply:(BOOL)a5;
- (void)removePoliciesForMPTCPConverterProxy:(BOOL)a3;
- (void)removePreferredProxy:(id)a3 apply:(BOOL)a4;
- (void)removeProxiedContentAgent:(id)a3 apply:(BOOL)a4;
- (void)replaceDisabledInterfaces:(id)a3;
- (void)setCaptivePortalExceptionHostname:(id)a3;
- (void)wifiDisabled:(BOOL)a3;
@end

@implementation NSPPrivacyProxyPolicyHandler

- (NSPPrivacyProxyPolicyHandler)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyPolicyHandler;
  v2 = -[NSPPrivacyProxyPolicyHandler init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_policy, 0LL);
    objc_storeStrong((id *)&v3->_flowDivertHandle, 0LL);
    v3->_inProcessFlowDivert = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_mainPolicyIDs, v4);

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_interfacePolicyIDs, v5);

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterPolicyIDs, v6);

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterIDs, v7);

    id v8 = sub_100093304((uint64_t)v3, @"nsp_privacy_proxy_policy_session", 300LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_storeStrong((id *)&v3->_session, v9);

    id v10 = sub_100093304((uint64_t)v3, @"nsp_privacy_proxy_policy_control_session", 100LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_storeStrong((id *)&v3->_controlSession, v11);

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_safariTechnologyPreviewPolicyIDs, v12);

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_safariBundlePolicyIDs, v13);

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_mailAppPolicyIDs, v14);

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_probePolicyIDs, v15);

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_obliviousAgentPolicyIDs, v16);

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentPolicyIDs, v17);

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_networkSpecificProxyPolicyIDs, v18);

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentNotifyFlags, v19);

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_mptcpProxyPolicyIDs, v20);

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_storeStrong((id *)&v3->_networkToolProxyPolicyIDs, v21);
  }

  return v3;
}

+ (id)sharedHandler
{
  if (qword_1001171F8 != -1) {
    dispatch_once(&qword_1001171F8, &stru_1000FA9D8);
  }
  return (id)qword_1001171F0;
}

- (BOOL)set:(id)a3 flowDivertHandle:(id)a4 inProcessFlowDivert:(BOOL)a5 ingressProxyURL:(id)a6 ingressFallbackProxyURL:(id)a7 exceptionBundleIDs:(id)a8 exceptionProcessPaths:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v90 = a6;
  id v91 = a7;
  id v92 = a8;
  id v93 = a9;
  v17 = self;
  objc_sync_enter(v17);
  v88 = v15;
  sub_10003ED60((uint64_t)v17, v15);
  v89 = v16;
  sub_10000E02C((uint64_t)v17, v16);
  if (v17)
  {
    v17->_int inProcessFlowDivert = a5;
    objc_storeStrong((id *)&v17->_ingressProxyURL, a6);
    objc_storeStrong((id *)&v17->_ingressFallbackProxyURL, a7);
    objc_storeStrong((id *)&v17->_exceptionBundleIDs, a8);
    objc_storeStrong((id *)&v17->_exceptionProcessPaths, a9);
  }

  sub_1000937C0((id *)&v17->super.isa);
  sub_1000940EC((id *)&v17->super.isa);
  sub_100094218((id *)&v17->super.isa);
  sub_100094344((id *)&v17->super.isa);
  -[NSPPrivacyProxyPolicyHandler removePoliciesForMPTCPConverterProxy:]( v17,  "removePoliciesForMPTCPConverterProxy:",  0LL);
  sub_100094470((id *)&v17->super.isa);
  if (v17)
  {
    policy = v17->_policy;
    int inProcessFlowDivert = v17->_inProcessFlowDivert;
    flowDivertHandle = v17->_flowDivertHandle;
    ingressProxyURL = v17->_ingressProxyURL;
    ingressFallbackProxyURL = v17->_ingressFallbackProxyURL;
    exceptionProcessPaths = v17->_exceptionProcessPaths;
    v24 = v17->_exceptionBundleIDs;
    v25 = ingressFallbackProxyURL;
    v26 = ingressProxyURL;
    v27 = flowDivertHandle;
    v28 = policy;
    id v29 = sub_100083508( (uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization,  v28,  v27,  inProcessFlowDivert,  v26,  v25,  v24,  exceptionProcessPaths);
    v94 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (v94 && (id v30 = [v94 count]) != 0)
    {
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      id v33 = v94;
      id v34 = [v33 countByEnumeratingWithState:&v95 objects:v103 count:16];
      id v37 = v34;
      if (v34)
      {
        uint64_t v38 = *(void *)v96;
        while (2)
        {
          v39 = 0LL;
          do
          {
            if (*(void *)v96 != v38) {
              objc_enumerationMutation(v33);
            }
            v40 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v39);
            uint64_t v41 = nplog_obj(v34, v35, v36);
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v109 = v17;
              __int16 v110 = 2112;
              id v111 = v40;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@ adding policy %@", buf, 0x16u);
            }

            id v43 = -[NEPolicySession addPolicy:](v17->_session, "addPolicy:", v40);
            uint64_t v46 = nplog_obj(v43, v44, v45);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            v48 = v47;
            if (!v43)
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v109 = v17;
                _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%@ failed to add policy",  buf,  0xCu);
              }

              goto LABEL_38;
            }

            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v109 = v17;
              __int16 v110 = 2048;
              id v111 = v43;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ added policy %lu", buf, 0x16u);
            }

            v49 = v17->_mainPolicyIDs;
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v43));
            -[NSMutableArray addObject:](v49, "addObject:", v50);

            v39 = (char *)v39 + 1;
          }

          while (v37 != v39);
          id v34 = [v33 countByEnumeratingWithState:&v95 objects:v103 count:16];
          id v37 = v34;
          if (v34) {
            continue;
          }
          break;
        }
      }

      if ((sub_100094C9C((void **)&v17->super.isa) & 1) != 0)
      {
        uint64_t v51 = sub_100086864((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v17->_policy);
        if ((v51 & 1) != 0)
        {
          id v87 = +[NSPAppRule copyUUIDsForSigningIdentifier:executablePath:]( &OBJC_CLASS___NSPAppRule,  "copyUUIDsForSigningIdentifier:executablePath:",  @"com.apple.networkQuality",  0LL);
          v54 = sub_100086670((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v87);
          v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          id v56 = v55;
          id v57 = [v56 countByEnumeratingWithState:&v99 objects:buf count:16];
          id v60 = v57;
          if (v57)
          {
            uint64_t v61 = *(void *)v100;
            while (2)
            {
              v62 = 0LL;
              do
              {
                if (*(void *)v100 != v61) {
                  objc_enumerationMutation(v56);
                }
                v63 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)v62);
                uint64_t v64 = nplog_obj(v57, v58, v59);
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v104 = 138412546;
                  v105 = v17;
                  __int16 v106 = 2112;
                  id v107 = v63;
                  _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_INFO,  "%@ adding networkQuality policy %@",  v104,  0x16u);
                }

                id v66 = -[NEPolicySession addPolicy:](v17->_session, "addPolicy:", v63);
                uint64_t v69 = nplog_obj(v66, v67, v68);
                v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                v71 = v70;
                if (!v66)
                {
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v104 = 138412290;
                    v105 = v17;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "%@ failed to add networkQuality policy",  v104,  0xCu);
                  }

                  sub_100094470((id *)&v17->super.isa);
                  goto LABEL_39;
                }

                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v104 = 138412546;
                  v105 = v17;
                  __int16 v106 = 2048;
                  id v107 = v66;
                  _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_INFO,  "%@ added networkQuality policy %lu",  v104,  0x16u);
                }

                v72 = v17->_networkToolProxyPolicyIDs;
                v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v66,  v87,  v88,  v89,  v90,  v91,  v92,  v93));
                -[NSMutableArray addObject:](v72, "addObject:", v73);

                v62 = (char *)v62 + 1;
              }

              while (v60 != v62);
              id v57 = [v56 countByEnumeratingWithState:&v99 objects:buf count:16];
              id v60 = v57;
              if (v57) {
                continue;
              }
              break;
            }
          }
        }

        else
        {
          uint64_t v85 = nplog_obj(v51, v52, v53);
          v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v104 = 138412290;
            v105 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_INFO,  "%@ network tools policy condition is not set",  v104,  0xCu);
          }
        }

        goto LABEL_41;
      }

      sub_1000940EC((id *)&v17->super.isa);
    }

    else
    {
      uint64_t v74 = nplog_obj(v30, v31, v32);
      id v33 = (id)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_INFO,  "%@ there are no privacy proxy policies to add",  buf,  0xCu);
      }

- (void)remove:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  sub_1000937C0((id *)&obj->super.isa);
  sub_1000940EC((id *)&obj->super.isa);
  sub_100094218((id *)&obj->super.isa);
  sub_100094344((id *)&obj->super.isa);
  sub_100094470((id *)&obj->super.isa);
  if (v3)
  {
    if (obj)
    {
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      v4 = obj->_probePolicyIDs;
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v68,  v72,  16LL);
      if (v5)
      {
        uint64_t v6 = *(void *)v69;
        do
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v69 != v6) {
              objc_enumerationMutation(v4);
            }
            id v8 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
            v9 = obj->_session;
            -[NEPolicySession removePolicyWithID:](v9, "removePolicyWithID:", [v8 unsignedIntegerValue]);
          }

          id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v68,  v72,  16LL);
        }

        while (v5);
      }

      -[NSMutableArray removeAllObjects](obj->_probePolicyIDs, "removeAllObjects");
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](obj->_domainFilterPolicyIDs, "allValues"));
      id v11 = [v10 countByEnumeratingWithState:&v60 objects:v72 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v61;
        do
        {
          for (j = 0LL; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v61 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)j);
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            id v15 = v14;
            id v16 = [v15 countByEnumeratingWithState:&v56 objects:&v68 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v57;
              do
              {
                for (k = 0LL; k != v16; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  v19 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)k);
                  v20 = obj->_session;
                  -[NEPolicySession removePolicyWithID:]( v20,  "removePolicyWithID:",  [v19 unsignedIntegerValue]);
                }

                id v16 = [v15 countByEnumeratingWithState:&v56 objects:&v68 count:16];
              }

              while (v16);
            }
          }

          id v11 = [v10 countByEnumeratingWithState:&v60 objects:v72 count:16];
        }

        while (v11);
      }

      -[NSMutableDictionary removeAllObjects](obj->_domainFilterPolicyIDs, "removeAllObjects");
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](obj->_domainFilterIDs, "allValues"));
      id v22 = [v21 countByEnumeratingWithState:&v52 objects:&v64 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v53;
        do
        {
          for (m = 0LL; m != v22; m = (char *)m + 1)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)m);
            v26 = obj->_session;
            -[NEPolicySession removeDomainFilterWithID:]( v26,  "removeDomainFilterWithID:",  [v25 unsignedIntegerValue]);
          }

          id v22 = [v21 countByEnumeratingWithState:&v52 objects:&v64 count:16];
        }

        while (v22);
      }

      -[NSMutableDictionary removeAllObjects](obj->_domainFilterIDs, "removeAllObjects");
      if (-[NSMutableDictionary count](obj->_obliviousAgentPolicyIDs, "count"))
      {
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        v27 = obj->_obliviousAgentPolicyIDs;
        id v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v64,  v72,  16LL);
        if (v28)
        {
          uint64_t v29 = *(void *)v65;
          do
          {
            for (n = 0LL; n != v28; n = (char *)n + 1)
            {
              if (*(void *)v65 != v29) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)n);
              __int128 v60 = 0u;
              __int128 v61 = 0u;
              __int128 v62 = 0u;
              __int128 v63 = 0u;
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( obj->_obliviousAgentPolicyIDs,  "objectForKeyedSubscript:",  v31));
              id v33 = [v32 countByEnumeratingWithState:&v60 objects:&v68 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v61;
                do
                {
                  for (ii = 0LL; ii != v33; ii = (char *)ii + 1)
                  {
                    if (*(void *)v61 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v36 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)ii);
                    id v37 = obj->_controlSession;
                    -[NEPolicySession removePolicyWithID:]( v37,  "removePolicyWithID:",  [v36 unsignedIntegerValue]);
                  }

                  id v33 = [v32 countByEnumeratingWithState:&v60 objects:&v68 count:16];
                }

                while (v33);
              }
            }

            id v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v64,  v72,  16LL);
          }

          while (v28);
        }

        -[NSMutableDictionary removeAllObjects](obj->_obliviousAgentPolicyIDs, "removeAllObjects");
      }

      if (-[NSMutableDictionary count](obj->_proxiedContentPolicyIDs, "count"))
      {
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        uint64_t v38 = obj->_proxiedContentPolicyIDs;
        id v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v64,  v72,  16LL);
        if (v39)
        {
          uint64_t v40 = *(void *)v65;
          do
          {
            for (jj = 0LL; jj != v39; jj = (char *)jj + 1)
            {
              if (*(void *)v65 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)jj);
              __int128 v60 = 0u;
              __int128 v61 = 0u;
              __int128 v62 = 0u;
              __int128 v63 = 0u;
              id v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( obj->_proxiedContentPolicyIDs,  "objectForKeyedSubscript:",  v42));
              id v44 = [v43 countByEnumeratingWithState:&v60 objects:&v68 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v61;
                do
                {
                  for (kk = 0LL; kk != v44; kk = (char *)kk + 1)
                  {
                    if (*(void *)v61 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    v47 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)kk);
                    v48 = obj->_session;
                    -[NEPolicySession removePolicyWithID:]( v48,  "removePolicyWithID:",  [v47 unsignedIntegerValue]);
                  }

                  id v44 = [v43 countByEnumeratingWithState:&v60 objects:&v68 count:16];
                }

                while (v44);
              }
            }

            id v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v64,  v72,  16LL);
          }

          while (v39);
        }

        -[NSMutableDictionary removeAllObjects](obj->_proxiedContentPolicyIDs, "removeAllObjects");
        -[NSMutableDictionary removeAllObjects](obj->_proxiedContentNotifyFlags, "removeAllObjects");
        sub_100096910((id *)&obj->super.isa);
      }
    }

    -[NSPPrivacyProxyPolicyHandler removePoliciesForMPTCPConverterProxy:]( obj,  "removePoliciesForMPTCPConverterProxy:",  0LL);
  }

  if (obj) {
    session = obj->_session;
  }
  else {
    session = 0LL;
  }
  v50 = session;
  -[NEPolicySession apply](v50, "apply");

  sub_10003ED60((uint64_t)obj, 0LL);
  sub_10000E02C((uint64_t)obj, 0LL);
  if (obj) {
    obj->_int inProcessFlowDivert = 0;
  }
  objc_sync_exit(obj);
}

- (id)currentPolicy
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && (policy = v2->_policy) != 0LL)
  {
    v4 = policy;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyPolicy dictionaryRepresentation](v4, "dictionaryRepresentation"));
  }

  else
  {
    id v5 = 0LL;
  }

  objc_sync_exit(v2);

  return v5;
}

- (void)addPreferredProxy:(id)a3 agentUUID:(id)a4 withDomainFilter:(id)a5
{
  id v8 = a3;
  id v53 = a4;
  id v9 = a5;
  __int128 v54 = v9;
  __int128 v55 = v8;
  if (v8)
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    -[NSPPrivacyProxyPolicyHandler removePreferredProxy:apply:](v12, "removePreferredProxy:apply:", v8, 0LL);
    if (v12) {
      session = v12->_session;
    }
    else {
      session = 0LL;
    }
    v14 = session;
    id v15 = -[NEPolicySession addDomainFilterWithData:](v14, "addDomainFilterWithData:", v54);

    if (v15)
    {
      uint64_t v19 = nplog_obj(v16, v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        __int128 v63 = (const char *)v12;
        __int16 v64 = 1024;
        *(_DWORD *)__int128 v65 = (_DWORD)v15;
        *(_WORD *)&v65[4] = 2112;
        *(void *)&v65[6] = v55;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ added domain filter %u for %@", buf, 0x1Cu);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
      if (v12) {
        domainFilterIDs = v12->_domainFilterIDs;
      }
      else {
        domainFilterIDs = 0LL;
      }
      uint64_t v23 = domainFilterIDs;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v21, v55);

      v24 = (NEPolicySession *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v25 = sub_1000835FC((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v53, (uint64_t)v15);
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(v25);
      id v26 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      id v29 = v26;
      if (v26)
      {
        uint64_t v30 = *(void *)v58;
        do
        {
          uint64_t v31 = 0LL;
          do
          {
            if (*(void *)v58 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v32 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)v31);
            uint64_t v33 = nplog_obj(v26, v27, v28);
            uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v63 = (const char *)v12;
              __int16 v64 = 2112;
              *(void *)__int128 v65 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%@ adding domain filter policy %@",  buf,  0x16u);
            }

            if (v12) {
              uint64_t v35 = v12->_session;
            }
            else {
              uint64_t v35 = 0LL;
            }
            uint64_t v36 = v35;
            id v37 = -[NEPolicySession addPolicy:](v36, "addPolicy:", v32);

            if (v37)
            {
              uint64_t v41 = nplog_obj(v38, v39, v40);
              uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                __int128 v63 = (const char *)v12;
                __int16 v64 = 1024;
                *(_DWORD *)__int128 v65 = (_DWORD)v37;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%@ added domain filter policy %u",  buf,  0x12u);
              }

              id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v37));
              -[NEPolicySession addObject:](v24, "addObject:", v43);
            }

            else
            {
              uint64_t v44 = nplog_obj(v38, v39, v40);
              id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v63 = (const char *)v12;
                _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%@ failed to add domain filter policy",  buf,  0xCu);
              }
            }

            uint64_t v31 = (char *)v31 + 1;
          }

          while (v29 != v31);
          id v26 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
          id v29 = v26;
        }

        while (v26);
      }

      if (v12) {
        domainFilterPolicyIDs = v12->_domainFilterPolicyIDs;
      }
      else {
        domainFilterPolicyIDs = 0LL;
      }
      uint64_t v46 = domainFilterPolicyIDs;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v24, v55);

      if (v12) {
        v47 = v12->_session;
      }
      else {
        v47 = 0LL;
      }
      v48 = v47;
      -[NEPolicySession apply](v48, "apply");
    }

    else
    {
      uint64_t v49 = nplog_obj(v16, v17, v18);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v63 = (const char *)v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%@ failed to add domain filter",  buf,  0xCu);
      }

      if (v12) {
        uint64_t v51 = v12->_session;
      }
      else {
        uint64_t v51 = 0LL;
      }
      v24 = v51;
      -[NEPolicySession apply](v24, "apply");
    }

    objc_sync_exit(v12);
  }

  else
  {
    uint64_t v52 = nplog_obj(v9, v10, v11);
    uint64_t v12 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v63 = "-[NSPPrivacyProxyPolicyHandler addPreferredProxy:agentUUID:withDomainFilter:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_FAULT,  "%s called with null proxyName",  buf,  0xCu);
    }
  }
}

- (void)removePreferredProxy:(id)a3 apply:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = self;
    objc_sync_enter(v9);
    if (v9) {
      domainFilterPolicyIDs = v9->_domainFilterPolicyIDs;
    }
    else {
      domainFilterPolicyIDs = 0LL;
    }
    uint64_t v11 = domainFilterPolicyIDs;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v8));

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v34;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v13);
          }
          if (v9) {
            session = v9->_session;
          }
          else {
            session = 0LL;
          }
          uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v16);
          uint64_t v19 = session;
          -[NEPolicySession removePolicyWithID:]( v19,  "removePolicyWithID:",  objc_msgSend(v18, "unsignedIntegerValue", (void)v33));

          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v20 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
        id v14 = v20;
      }

      while (v20);
    }

    if (v9) {
      v21 = v9->_domainFilterPolicyIDs;
    }
    else {
      v21 = 0LL;
    }
    id v22 = v21;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", 0LL, v8);

    if (v9) {
      domainFilterIDs = v9->_domainFilterIDs;
    }
    else {
      domainFilterIDs = 0LL;
    }
    v24 = domainFilterIDs;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v8));

    if (v25)
    {
      if (v9) {
        id v26 = v9->_session;
      }
      else {
        id v26 = 0LL;
      }
      uint64_t v27 = v26;
      -[NEPolicySession removeDomainFilterWithID:]( v27,  "removeDomainFilterWithID:",  [v25 unsignedIntegerValue]);

      if (v9) {
        uint64_t v28 = v9->_domainFilterIDs;
      }
      else {
        uint64_t v28 = 0LL;
      }
      id v29 = v28;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", 0LL, v8);
    }

    if (objc_msgSend(v13, "count", (void)v33) && v4)
    {
      if (v9) {
        uint64_t v30 = v9->_session;
      }
      else {
        uint64_t v30 = 0LL;
      }
      uint64_t v31 = v30;
      -[NEPolicySession apply](v31, "apply");
    }

    objc_sync_exit(v9);
  }

  else
  {
    uint64_t v32 = nplog_obj(0LL, v6, v7);
    id v9 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = "-[NSPPrivacyProxyPolicyHandler removePreferredProxy:apply:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "%s called with null proxyName",  buf,  0xCu);
    }
  }
}

- (void)wifiDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (!obj)
  {
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  if (obj->_wifiDisabled != v3)
  {
    obj->_wifiDisabled = v3;
LABEL_4:
    sub_100095848(obj);
  }

- (void)cellularDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (!obj)
  {
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  if (obj->_cellularDisabled != v3)
  {
    obj->_cellularDisabled = v3;
LABEL_4:
    sub_100095848(obj);
  }

- (void)interface:(id)a3 disabled:(BOOL)a4
{
  id v16 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (a4)
  {
    if (v6 && v6->_disabledInterfaces
      || (uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet), sub_100023D24((uint64_t)v6, v7), v7, v6))
    {
      char v8 = 0;
      disabledInterfaces = v6->_disabledInterfaces;
    }

    else
    {
      disabledInterfaces = 0LL;
      char v8 = 1;
    }

    uint64_t v10 = disabledInterfaces;
    unsigned __int8 v11 = -[NSMutableSet containsObject:](v10, "containsObject:", v16);

    if ((v11 & 1) == 0)
    {
      if ((v8 & 1) != 0) {
        uint64_t v12 = 0LL;
      }
      else {
        uint64_t v12 = v6->_disabledInterfaces;
      }
      id v13 = v12;
      -[NSMutableSet addObject:](v13, "addObject:", v16);
      goto LABEL_14;
    }
  }

  else if (v6)
  {
    if (v6->_disabledInterfaces)
    {
      id v14 = v6->_disabledInterfaces;
      unsigned int v15 = -[NSMutableSet containsObject:](v14, "containsObject:", v16);

      if (v15)
      {
        id v13 = v6->_disabledInterfaces;
        -[NSMutableSet removeObject:](v13, "removeObject:", v16);
LABEL_14:

        sub_100095848(v6);
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)replaceDisabledInterfaces:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([v4 count])
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          -[NSMutableSet addObject:]( v6,  "addObject:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14);
          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    if (v5) {
      disabledInterfaces = v5->_disabledInterfaces;
    }
    else {
      disabledInterfaces = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (!v5) {
      goto LABEL_15;
    }
    disabledInterfaces = v5->_disabledInterfaces;
    if (!disabledInterfaces) {
      goto LABEL_15;
    }
  }

  uint64_t v12 = disabledInterfaces;
  unsigned __int8 v13 = -[NSMutableSet isEqualToSet:](v12, "isEqualToSet:", v6);

  if ((v13 & 1) == 0)
  {
    sub_100023D24((uint64_t)v5, v6);
    sub_100095848(v5);
  }

- (void)setCaptivePortalExceptionHostname:(id)a3
{
  unsigned __int8 v11 = (NSString *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    uint64_t v6 = v5->_captiveNetworkExceptionHostname;
    id v7 = v11;
    if (v6 != v11)
    {
      captiveNetworkExceptionHostname = v5->_captiveNetworkExceptionHostname;
      goto LABEL_4;
    }

- (void)addObliviousProxyAgent:(id)a3 processes:(id)a4 hostname:(id)a5
{
  id v8 = a3;
  id v46 = a4;
  id v9 = a5;
  uint64_t v44 = v8;
  uint64_t v45 = v9;
  if (!v8)
  {
    uint64_t v41 = nplog_obj(v9, v10, v11);
    unsigned __int8 v13 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v52 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    uint64_t v42 = "%s called with null agentUUID";
LABEL_32:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_FAULT, v42, buf, 0xCu);
    goto LABEL_27;
  }

  uint64_t v12 = v9;
  if (!v9)
  {
    uint64_t v43 = nplog_obj(0LL, v10, v11);
    unsigned __int8 v13 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v52 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    uint64_t v42 = "%s called with null hostname";
    goto LABEL_32;
  }

  unsigned __int8 v13 = self;
  objc_sync_enter(v13);
  -[NSPPrivacyProxyPolicyHandler removeObliviousProxyAgent:forHostname:apply:]( v13,  "removeObliviousProxyAgent:forHostname:apply:",  v8,  v12,  0LL);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = sub_1000844C8((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v12, v46, v8);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
  id v20 = v17;
  if (v17)
  {
    uint64_t v21 = *(void *)v48;
    do
    {
      id v22 = 0LL;
      do
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v22);
        uint64_t v24 = nplog_obj(v17, v18, v19);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v52 = (const char *)v13;
          __int16 v53 = 2112;
          uint64_t v54 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%@ adding oblivious agent policy %@",  buf,  0x16u);
        }

        if (v13) {
          controlSession = v13->_controlSession;
        }
        else {
          controlSession = 0LL;
        }
        uint64_t v27 = controlSession;
        id v28 = -[NEPolicySession addPolicy:](v27, "addPolicy:", v23);

        if (v28)
        {
          uint64_t v32 = nplog_obj(v29, v30, v31);
          __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = (const char *)v13;
            __int16 v53 = 1024;
            LODWORD(v54) = (_DWORD)v28;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "%@ added oblivious agent policy %u",  buf,  0x12u);
          }

          __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v28));
          [v14 addObject:v34];
        }

        else
        {
          uint64_t v35 = nplog_obj(v29, v30, v31);
          __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v52 = (const char *)v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%@ failed to add oblivious agent policy",  buf,  0xCu);
          }
        }

        id v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v17 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
      id v20 = v17;
    }

    while (v17);
  }

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v45, v44));
  if (v13) {
    obliviousAgentPolicyIDs = v13->_obliviousAgentPolicyIDs;
  }
  else {
    obliviousAgentPolicyIDs = 0LL;
  }
  uint64_t v38 = obliviousAgentPolicyIDs;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v14, v36);

  if (v13) {
    uint64_t v39 = v13->_controlSession;
  }
  else {
    uint64_t v39 = 0LL;
  }
  uint64_t v40 = v39;
  -[NEPolicySession apply](v40, "apply");

  objc_sync_exit(v13);
LABEL_27:
}

- (void)removeObliviousProxyAgent:(id)a3 forHostname:(id)a4 apply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v11 = a4;
  if (v11)
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v11, v8));
    BOOL v35 = v5;
    if (v12) {
      obliviousAgentPolicyIDs = v12->_obliviousAgentPolicyIDs;
    }
    else {
      obliviousAgentPolicyIDs = 0LL;
    }
    __int128 v15 = obliviousAgentPolicyIDs;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v13));

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        id v20 = 0LL;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v17);
          }
          if (v12) {
            controlSession = v12->_controlSession;
          }
          else {
            controlSession = 0LL;
          }
          id v22 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v20);
          uint64_t v23 = controlSession;
          -[NEPolicySession removePolicyWithID:](v23, "removePolicyWithID:", [v22 unsignedIntegerValue]);

          id v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v24 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
        id v18 = v24;
      }

      while (v24);
    }

    if (v12) {
      v25 = v12->_obliviousAgentPolicyIDs;
    }
    else {
      v25 = 0LL;
    }
    id v26 = v25;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", 0LL, v13);

    id v27 = [v17 count];
    if (v27 && v35)
    {
      if (v12) {
        uint64_t v30 = v12->_controlSession;
      }
      else {
        uint64_t v30 = 0LL;
      }
      uint64_t v31 = v30;
      -[NEPolicySession apply](v31, "apply");
    }

    uint64_t v32 = nplog_obj(v27, v28, v29);
    __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = (const char *)v12;
      __int16 v42 = 2112;
      id v43 = v11;
      __int16 v44 = 2112;
      id v45 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@ removed oblivious agent policies for %@ (%@)",  buf,  0x20u);
    }

    objc_sync_exit(v12);
  }

  else
  {
    uint64_t v34 = nplog_obj(0LL, v9, v10);
    uint64_t v12 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v41 = "-[NSPPrivacyProxyPolicyHandler removeObliviousProxyAgent:forHostname:apply:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_FAULT,  "%s called with null hostname",  buf,  0xCu);
    }
  }
}

- (void)addNetworkDiscoveryProxyAgent:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v49 = v7;
  __int128 v50 = v6;
  if (v6)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    if (v10 && -[NSMutableDictionary count](v10->_networkSpecificProxyPolicyIDs, "count", v49))
    {
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id obj = v10->_networkSpecificProxyPolicyIDs;
      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  buf,  16LL);
      if (v11)
      {
        uint64_t v12 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v61 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v10->_networkSpecificProxyPolicyIDs,  "objectForKeyedSubscript:",  v14));
            id v16 = [v15 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v57;
              do
              {
                for (j = 0LL; j != v16; j = (char *)j + 1)
                {
                  if (*(void *)v57 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)j);
                  id v20 = v10->_session;
                  -[NEPolicySession removePolicyWithID:]( v20,  "removePolicyWithID:",  [v19 unsignedIntegerValue]);
                }

                id v16 = [v15 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }

              while (v16);
            }
          }

          id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  buf,  16LL);
        }

        while (v11);
      }

      -[NSMutableDictionary removeAllObjects](v10->_networkSpecificProxyPolicyIDs, "removeAllObjects");
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v49));
    id v22 = sub_100083840((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v50, v49);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v23 = (id)objc_claimAutoreleasedReturnValue(v22);
    id v24 = [v23 countByEnumeratingWithState:&v52 objects:v64 count:16];
    id v27 = v24;
    if (v24)
    {
      uint64_t v28 = *(void *)v53;
      do
      {
        uint64_t v29 = 0LL;
        do
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v23);
          }
          uint64_t v30 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)v29);
          uint64_t v31 = nplog_obj(v24, v25, v26);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int128 v67 = (const char *)v10;
            __int16 v68 = 2112;
            uint64_t v69 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ adding network based proxy policy %@",  buf,  0x16u);
          }

          if (v10) {
            session = v10->_session;
          }
          else {
            session = 0LL;
          }
          uint64_t v34 = session;
          id v35 = -[NEPolicySession addPolicy:](v34, "addPolicy:", v30);

          if (v35)
          {
            uint64_t v39 = nplog_obj(v36, v37, v38);
            uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v67 = (const char *)v10;
              __int16 v68 = 1024;
              LODWORD(v69) = (_DWORD)v35;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%@ added network based proxy policy %u",  buf,  0x12u);
            }

            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v35));
            [v21 addObject:v41];
          }

          else
          {
            uint64_t v42 = nplog_obj(v36, v37, v38);
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v67 = (const char *)v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%@ failed to add network based proxy policy",  buf,  0xCu);
            }
          }

          uint64_t v29 = (char *)v29 + 1;
        }

        while (v27 != v29);
        id v24 = [v23 countByEnumeratingWithState:&v52 objects:v64 count:16];
        id v27 = v24;
      }

      while (v24);
    }

    id v43 = (void *)objc_claimAutoreleasedReturnValue([v50 UUIDString]);
    if (v10) {
      networkSpecificProxyPolicyIDs = v10->_networkSpecificProxyPolicyIDs;
    }
    else {
      networkSpecificProxyPolicyIDs = 0LL;
    }
    id v45 = networkSpecificProxyPolicyIDs;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v21, v43);

    if (v10) {
      id v46 = v10->_session;
    }
    else {
      id v46 = 0LL;
    }
    __int128 v47 = v46;
    -[NEPolicySession apply](v47, "apply");

    objc_sync_exit(v10);
  }

  else
  {
    uint64_t v48 = nplog_obj(v7, v8, v9);
    uint64_t v10 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v67 = "-[NSPPrivacyProxyPolicyHandler addNetworkDiscoveryProxyAgent:with:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_FAULT,  "%s called with null agentUUID",  buf,  0xCu);
    }
  }
}

- (void)addProxiedContentAgent:(id)a3 maps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v51 = v7;
  __int128 v52 = v6;
  if (v6)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    -[NSPPrivacyProxyPolicyHandler removeProxiedContentAgent:apply:](v10, "removeProxiedContentAgent:apply:", v6, 0LL);
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v11 = sub_100084D78((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v6, v51);
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(v11);
    id v12 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
    id v15 = v12;
    if (v12)
    {
      uint64_t v16 = *(void *)v66;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v66 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)v17);
          uint64_t v19 = nplog_obj(v12, v13, v14);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v72 = (const char *)v10;
            __int16 v73 = 2112;
            uint64_t v74 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%@ adding proxied content policy %@",  buf,  0x16u);
          }

          if (v10) {
            session = v10->_session;
          }
          else {
            session = 0LL;
          }
          id v22 = session;
          id v23 = -[NEPolicySession addPolicy:](v22, "addPolicy:", v18);

          if (v23)
          {
            uint64_t v27 = nplog_obj(v24, v25, v26);
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v72 = (const char *)v10;
              __int16 v73 = 1024;
              LODWORD(v74) = (_DWORD)v23;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%@ added proxied content policy %u",  buf,  0x12u);
            }

            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v23));
            [v55 addObject:v29];
          }

          else
          {
            uint64_t v30 = nplog_obj(v24, v25, v26);
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v72 = (const char *)v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%@ failed to add proxied content policy",  buf,  0xCu);
            }
          }

          uint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v12 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
        id v15 = v12;
      }

      while (v12);
    }

    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v52 UUIDString]);
    if (v10) {
      proxiedContentPolicyIDs = v10->_proxiedContentPolicyIDs;
    }
    else {
      proxiedContentPolicyIDs = 0LL;
    }
    uint64_t v32 = proxiedContentPolicyIDs;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v55, v50);

    if (v10) {
      __int128 v33 = v10->_session;
    }
    else {
      __int128 v33 = 0LL;
    }
    uint64_t v34 = v33;
    -[NEPolicySession apply](v34, "apply");

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v53 = v51;
    id v35 = [v53 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v35)
    {
      uint64_t v36 = 0LL;
      uint64_t v56 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v62 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v38 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          if ([v38 supportsReverseProxying])
          {
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 processes]);
            id v40 = [v39 countByEnumeratingWithState:&v57 objects:v69 count:16];
            if (v40)
            {
              uint64_t v41 = *(void *)v58;
              do
              {
                for (j = 0LL; j != v40; j = (char *)j + 1)
                {
                  if (*(void *)v58 != v41) {
                    objc_enumerationMutation(v39);
                  }
                  id v43 = (void *)objc_claimAutoreleasedReturnValue( [&off_100103AD0 objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * (void)j)]);
                  __int16 v44 = v43;
                  if (v43) {
                    v36 |= (unint64_t)[v43 unsignedLongLongValue];
                  }
                }

                id v40 = [v39 countByEnumeratingWithState:&v57 objects:v69 count:16];
              }

              while (v40);
            }
          }
        }

        id v35 = [v53 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }

      while (v35);

      if (v36)
      {
        id v45 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v36));
        if (v10) {
          proxiedContentNotifyFlags = v10->_proxiedContentNotifyFlags;
        }
        else {
          proxiedContentNotifyFlags = 0LL;
        }
        __int128 v47 = proxiedContentNotifyFlags;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v45, v50);

LABEL_51:
        sub_100096910((id *)&v10->super.isa);

        objc_sync_exit(v10);
        goto LABEL_52;
      }
    }

    else
    {
    }

    if (v10) {
      uint64_t v48 = v10->_proxiedContentNotifyFlags;
    }
    else {
      uint64_t v48 = 0LL;
    }
    id v45 = v48;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", 0LL, v50);
    goto LABEL_51;
  }

  uint64_t v49 = nplog_obj(v7, v8, v9);
  uint64_t v10 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[NSPPrivacyProxyPolicyHandler addProxiedContentAgent:maps:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_FAULT,  "%s called with null agentUUID",  buf,  0xCu);
  }

- (void)removeProxiedContentAgent:(id)a3 apply:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    if (v9) {
      proxiedContentPolicyIDs = v9->_proxiedContentPolicyIDs;
    }
    else {
      proxiedContentPolicyIDs = 0LL;
    }
    id v12 = proxiedContentPolicyIDs;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v10));

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v30;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v14);
          }
          if (v9) {
            session = v9->_session;
          }
          else {
            session = 0LL;
          }
          uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v17);
          id v20 = session;
          -[NEPolicySession removePolicyWithID:]( v20,  "removePolicyWithID:",  objc_msgSend(v19, "unsignedIntegerValue", (void)v29));

          uint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v21 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        id v15 = v21;
      }

      while (v21);
    }

    if (v9) {
      id v22 = v9->_proxiedContentPolicyIDs;
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", 0LL, v10);

    if (v9) {
      proxiedContentNotifyFlags = v9->_proxiedContentNotifyFlags;
    }
    else {
      proxiedContentNotifyFlags = 0LL;
    }
    uint64_t v25 = proxiedContentNotifyFlags;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", 0LL, v10);

    if ([v14 count] && v4)
    {
      if (v9) {
        uint64_t v26 = v9->_session;
      }
      else {
        uint64_t v26 = 0LL;
      }
      uint64_t v27 = v26;
      -[NEPolicySession apply](v27, "apply");
    }

    sub_100096910((id *)&v9->super.isa);

    objc_sync_exit(v9);
  }

  else
  {
    uint64_t v28 = nplog_obj(0LL, v6, v7);
    uint64_t v9 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v35 = "-[NSPPrivacyProxyPolicyHandler removeProxiedContentAgent:apply:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "%s called with null agentUUID",  buf,  0xCu);
    }
  }
}

- (BOOL)addPoliciesForProbing
{
  BOOL v3 = sub_1000861B0((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    id v9 = v5;
    uint64_t v10 = *(void *)v29;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v27 = v8;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v11);
        uint64_t v13 = nplog_obj(v5, v6, v7);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v27;
          __int128 v33 = self;
          __int16 v34 = 2112;
          id v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ adding probe policy %@", buf, 0x16u);
        }

        if (self) {
          session = self->_session;
        }
        else {
          session = 0LL;
        }
        id v16 = -[NEPolicySession addPolicy:](session, "addPolicy:", v12, v27, (void)v28);
        uint64_t v19 = nplog_obj(v16, v17, v18);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = v20;
        if (!v16)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v33 = self;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%@ failed to add probe policy",  buf,  0xCu);
          }

          BOOL v25 = 0;
          goto LABEL_24;
        }

        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v27;
          __int128 v33 = self;
          __int16 v34 = 2048;
          id v35 = v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ added probe policy %lu", buf, 0x16u);
        }

        if (self) {
          probePolicyIDs = self->_probePolicyIDs;
        }
        else {
          probePolicyIDs = 0LL;
        }
        id v23 = probePolicyIDs;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v16));
        -[NSMutableArray addObject:](v23, "addObject:", v24);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
      id v9 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v25 = 1;
LABEL_24:

  return v25;
}

- (void)handleAppInstallation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([v4 containsObject:@"com.apple.SafariTechnologyPreview"])
  {
    uint64_t v6 = v5 ? v5->_safariTechnologyPreviewPolicyIDs : 0LL;
    uint64_t v7 = v6;
    id v8 = -[NSMutableArray count](v7, "count");

    if (!v8)
    {
      uint64_t v12 = nplog_obj(v9, v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412546;
        uint64_t v24 = v5;
        __int16 v25 = 2112;
        uint64_t v26 = @"com.apple.SafariTechnologyPreview";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%@ adding policies for '%@'",  (uint8_t *)&v23,  0x16u);
      }

      uint64_t v14 = sub_100094C9C((void **)&v5->super.isa);
      if ((v14 & 1) != 0)
      {
        uint64_t v17 = nplog_obj(v14, v15, v16);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412546;
          uint64_t v24 = v5;
          __int16 v25 = 2112;
          uint64_t v26 = @"com.apple.SafariTechnologyPreview";
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@ successfully added policies for '%@'",  (uint8_t *)&v23,  0x16u);
        }

        if (v5) {
          session = v5->_session;
        }
        else {
          session = 0LL;
        }
        id v20 = session;
        -[NEPolicySession apply](v20, "apply");
      }

      else
      {
        uint64_t v21 = nplog_obj(v14, v15, v16);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = 138412546;
          uint64_t v24 = v5;
          __int16 v25 = 2112;
          uint64_t v26 = @"com.apple.SafariTechnologyPreview";
          _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@ failed to add policies for '%@'",  (uint8_t *)&v23,  0x16u);
        }

        sub_1000940EC((id *)&v5->super.isa);
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)handleAppUninstallation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 containsObject:@"com.apple.SafariTechnologyPreview"];
  if ((_DWORD)v6)
  {
    uint64_t v9 = nplog_obj(v6, v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = @"com.apple.SafariTechnologyPreview";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ removing policies for '%@'",  (uint8_t *)&v13,  0x16u);
    }

    sub_1000940EC((id *)&v5->super.isa);
    if (v5) {
      session = v5->_session;
    }
    else {
      session = 0LL;
    }
    uint64_t v12 = session;
    -[NEPolicySession apply](v12, "apply");
  }

  objc_sync_exit(v5);
}

- (BOOL)addPoliciesForMPTCPConverterProxy:(id)a3
{
  id v4 = a3;
  if (self) {
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  }
  else {
    mptcpProxyPolicyIDs = 0LL;
  }
  if (-[NSMutableArray count](mptcpProxyPolicyIDs, "count"))
  {
    unsigned __int8 v6 = 0;
  }

  else
  {
    id v30 = v4;
    uint64_t v7 = sub_100086454((uint64_t)&OBJC_CLASS___NSPPrivacyProxyPolicySerialization, v4);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v9)
    {
      id v12 = v9;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v8);
          }
          __int16 v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v14);
          uint64_t v16 = nplog_obj(v9, v10, v11);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = self;
            __int16 v37 = 2112;
            id v38 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%@ adding MPTCP converter proxy policy %@",  buf,  0x16u);
          }

          if (self) {
            session = self->_session;
          }
          else {
            session = 0LL;
          }
          id v19 = -[NEPolicySession addPolicy:](session, "addPolicy:", v15);
          uint64_t v22 = nplog_obj(v19, v20, v21);
          int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          uint64_t v24 = v23;
          if (!v19)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v36 = self;
              _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%@ failed to add MPTCP converter proxy policy",  buf,  0xCu);
            }

            unsigned __int8 v6 = 0;
            goto LABEL_30;
          }

          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = self;
            __int16 v37 = 2048;
            id v38 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%@ added MPTCP converter proxy policy %lu",  buf,  0x16u);
          }

          if (self) {
            __int16 v25 = self->_mptcpProxyPolicyIDs;
          }
          else {
            __int16 v25 = 0LL;
          }
          uint64_t v26 = v25;
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19));
          -[NSMutableArray addObject:](v26, "addObject:", v27);

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        id v12 = v9;
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (self) {
      __int128 v28 = self->_session;
    }
    else {
      __int128 v28 = 0LL;
    }
    unsigned __int8 v6 = -[NEPolicySession apply](v28, "apply");
LABEL_30:
    id v4 = v30;
  }

  return v6;
}

- (void)removePoliciesForMPTCPConverterProxy:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (self) {
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  }
  else {
    mptcpProxyPolicyIDs = 0LL;
  }
  unsigned __int8 v6 = mptcpProxyPolicyIDs;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v10);
        if (self) {
          session = self->_session;
        }
        else {
          session = 0LL;
        }
        uint64_t v13 = session;
        -[NEPolicySession removePolicyWithID:]( v13,  "removePolicyWithID:",  objc_msgSend(v11, "unsignedIntegerValue", (void)v17));

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      id v8 = v14;
    }

    while (v14);
  }

  if (v3)
  {
    if (self) {
      __int16 v15 = self->_session;
    }
    else {
      __int16 v15 = 0LL;
    }
    -[NEPolicySession apply](v15, "apply", (void)v17);
  }

  if (self) {
    uint64_t v16 = self->_mptcpProxyPolicyIDs;
  }
  else {
    uint64_t v16 = 0LL;
  }
  -[NSMutableArray removeAllObjects](v16, "removeAllObjects", (void)v17);
}

- (void).cxx_destruct
{
}

@end