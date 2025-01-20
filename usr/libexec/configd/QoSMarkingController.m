@interface QoSMarkingController
+ (id)sharedController;
- (BOOL)qosMarkingIsAppleAudioVideoCallsEnabled:(id)a3;
- (BOOL)qosMarkingIsEnabled:(id)a3;
- (BOOL)qosMarkingPolicyEnabled:(id)a3 forKey:(id)a4;
- (NSArray)interfaces;
- (NSMutableDictionary)enabled;
- (NSMutableDictionary)enabledAV;
- (NSMutableDictionary)policySessions;
- (NSMutableDictionary)requested;
- (QoSMarkingController)init;
- (id)createPolicySession;
- (id)qosMarkingAllowListAppIdentifiers:(id)a3;
- (void)addAllowListAppIdentifierPolicy:(id)a3 forApp:(id)a4 order:(unsigned int)a5;
- (void)addAllowListPathPolicy:(id)a3 forPath:(id)a4 order:(unsigned int)a5;
- (void)setEnabled:(id)a3;
- (void)setEnabledAV:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setPolicy:(id)a3 forInterface:(id)a4;
- (void)setPolicySessions:(id)a3;
- (void)setRequested:(id)a3;
- (void)updatePolicy:(id)a3 forInterface:(id)a4;
@end

@implementation QoSMarkingController

- (id)createPolicySession
{
  return objc_alloc_init(&OBJC_CLASS___NEPolicySession);
}

- (BOOL)qosMarkingPolicyEnabled:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:v5]);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      unsigned __int8 v8 = [v6 BOOLValue];
    }

    else
    {
      id v9 = sub_10005DC2C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v10, v11))
      {
        memset(v18, 0, sizeof(v18));
        unsigned int v12 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v10, (os_log_type_t)v11)) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 2LL;
        }
        int v16 = 138412290;
        id v17 = v5;
        v14 = (_OWORD *)_os_log_send_and_compose_impl( v13,  0LL,  v18,  256LL,  &_mh_execute_header,  v10,  v11,  "%@ not valid",  &v16,  12);
        __SC_log_send2(3LL, v10, v11, 0LL, v14);
        if (v14 != v18) {
          free(v14);
        }
      }

      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)qosMarkingIsEnabled:(id)a3
{
  return -[QoSMarkingController qosMarkingPolicyEnabled:forKey:]( self,  "qosMarkingPolicyEnabled:forKey:",  a3,  kSCPropNetQoSMarkingEnabled);
}

- (BOOL)qosMarkingIsAppleAudioVideoCallsEnabled:(id)a3
{
  return -[QoSMarkingController qosMarkingPolicyEnabled:forKey:]( self,  "qosMarkingPolicyEnabled:forKey:",  a3,  kSCPropNetQoSMarkingAppleAudioVideoCalls);
}

- (id)qosMarkingAllowListAppIdentifiers:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kSCPropNetQoSMarkingAllowListAppIdentifiers]);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    id v19 = sub_10005DC2C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v20 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v5, v20))
    {
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      unsigned int v21 = (_sc_log > 0) | 2;
      uint64_t v22 = os_log_type_enabled(v5, (os_log_type_t)v20) ? v21 : 2LL;
      v27[0] = 0;
      int v26 = 2;
      v23 = (__int128 *)_os_log_send_and_compose_impl( v22,  0LL,  &v33,  256LL,  &_mh_execute_header,  v5,  v20,  "QoSMarkingAllowListAppIdentifiers list not valid",  v27,  v26);
      __SC_log_send2(3LL, v5, v20, 0LL, v23);
      if (v23 != &v33) {
        free(v23);
      }
    }

- (void)addAllowListPathPolicy:(id)a3 forPath:(id)a4 order:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_policySessions, "objectForKeyedSubscript:", v7));
  if (v52)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyRouteRule routeRuleWithAction:forInterfaceName:]( &OBJC_CLASS___NEPolicyRouteRule,  "routeRuleWithAction:forInterfaceName:",  3LL,  v7));
    v64 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult routeRules:](&OBJC_CLASS___NEPolicyResult, "routeRules:", v10));

    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
    id v12 = +[NEProcessInfo copyUUIDsForExecutable:](&OBJC_CLASS___NEProcessInfo, "copyUUIDsForExecutable:", v8);
    id v13 = v12;
    v49 = v11;
    if (v12 && [v12 count])
    {
      __int128 v45 = v9;
      id v47 = v8;
      id v48 = v7;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id obj = v13;
      id v14 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
      if (!v14) {
        goto LABEL_25;
      }
      id v15 = v14;
      uint64_t v50 = *(void *)v61;
      while (1)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v61 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v17));
          id v19 = objc_alloc(&OBJC_CLASS___NEPolicy);
          v58[0] = v18;
          v58[1] = v11;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
          id v21 = [v19 initWithOrder:a5 result:v51 conditions:v20];

          id v22 = [v52 addPolicy:v21];
          id v23 = sub_10005DC2C();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (v22)
          {
            uint64_t v25 = _SC_syslog_os_log_mapping(5LL);
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            __int128 v75 = 0u;
            __int128 v76 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            LODWORD(v26) = (_sc_log > 0) | 2;
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            if (os_log_type_enabled(v24, (os_log_type_t)v25)) {
              uint64_t v26 = v26;
            }
            else {
              uint64_t v26 = 2LL;
            }
            v27 = v24;
            v28 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
            int v54 = 138413058;
            id v55 = v48;
            __int16 v56 = 1024;
            *(_DWORD *)v57 = a5;
            *(_WORD *)&v57[4] = 2112;
            *(void *)&v57[6] = v47;
            *(_WORD *)&v57[14] = 2112;
            *(void *)&v57[16] = v28;
            LODWORD(v44) = 38;
            __int128 v29 = (__int128 *)_os_log_send_and_compose_impl( v26,  0LL,  &v65,  256LL,  &_mh_execute_header,  v27,  v25,  "QoS marking policy: %@: %u: allowlist path %@ (%@)",  &v54,  v44);

            uint64_t v30 = 5LL;
          }

          else
          {
            uint64_t v25 = _SC_syslog_os_log_mapping(3LL);
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            __int128 v75 = 0u;
            __int128 v76 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            LODWORD(v31) = (_sc_log > 0) | 2;
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            if (os_log_type_enabled(v24, (os_log_type_t)v25)) {
              uint64_t v31 = v31;
            }
            else {
              uint64_t v31 = 2LL;
            }
            v27 = v24;
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
            int v54 = 138412802;
            id v55 = v48;
            __int16 v56 = 2112;
            *(void *)v57 = v47;
            *(_WORD *)&v57[8] = 2112;
            *(void *)&v57[10] = v32;
            LODWORD(v44) = 32;
            __int128 v29 = (__int128 *)_os_log_send_and_compose_impl( v31,  0LL,  &v65,  256LL,  &_mh_execute_header,  v27,  v25,  "QoS marking policy: %@: could not add allowlist policy for path %@ (%@)",  &v54,  v44);

            uint64_t v30 = 3LL;
          }

          __SC_log_send2(v30, v27, v25, 0LL, v29);
          if (v29 != &v65) {
            free(v29);
          }
          uint64_t v11 = v49;
LABEL_23:
        }

        id v15 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
        if (!v15)
        {
LABEL_25:

          id v8 = v47;
          id v7 = v48;
          goto LABEL_40;
        }
      }
    }

    id v33 = sub_10005DC2C();
    __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v35 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v34, v35))
    {
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      unsigned int v36 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v34, (os_log_type_t)v35)) {
        uint64_t v37 = v36;
      }
      else {
        uint64_t v37 = 2LL;
      }
      int v54 = 138412546;
      id v55 = v7;
      __int16 v56 = 2112;
      *(void *)v57 = v8;
      __int128 v38 = (__int128 *)_os_log_send_and_compose_impl( v37,  0LL,  &v65,  256LL,  &_mh_execute_header,  v34,  v35,  "QoS marking policy: %@: could not add path \"%@\"",  &v54,  22);
      __SC_log_send2(3LL, v34, v35, 0LL, v38);
      if (v38 != &v65) {
        free(v38);
      }
      uint64_t v11 = v49;
    }
  }

  else
  {
    id v39 = sub_10005DC2C();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v40 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v11, v40))
    {
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      unsigned int v41 = (_sc_log > 0) | 2;
      uint64_t v42 = os_log_type_enabled(v11, (os_log_type_t)v40) ? v41 : 2LL;
      int v54 = 138412290;
      id v55 = v7;
      __int128 v43 = (__int128 *)_os_log_send_and_compose_impl( v42,  0LL,  &v65,  256LL,  &_mh_execute_header,  v11,  v40,  "QoS marking policy: %@: no session",  &v54,  12);
      __SC_log_send2(3LL, v11, v40, 0LL, v43);
      if (v43 != &v65) {
        free(v43);
      }
    }
  }

- (void)addAllowListAppIdentifierPolicy:(id)a3 forApp:(id)a4 order:(unsigned int)a5
{
  id v7 = a3;
  id v47 = a4;
  if ([v47 hasPrefix:@"/"])
  {
    if (qword_10007A028 != -1) {
      dispatch_once(&qword_10007A028, &stru_1000731B0);
    }
    if (byte_10007A020) {
      -[QoSMarkingController addAllowListPathPolicy:forPath:order:]( self,  "addAllowListPathPolicy:forPath:order:",  v7,  v47,  a5);
    }
    goto LABEL_44;
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_policySessions, "objectForKeyedSubscript:", v7));
  if (v51)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyRouteRule routeRuleWithAction:forInterfaceName:]( &OBJC_CLASS___NEPolicyRouteRule,  "routeRuleWithAction:forInterfaceName:",  3LL,  v7));
    __int128 v63 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v63, 1LL));
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult routeRules:](&OBJC_CLASS___NEPolicyResult, "routeRules:", v9));

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
    id v10 = +[NEProcessInfo copyUUIDsForBundleID:uid:](&OBJC_CLASS___NEProcessInfo, "copyUUIDsForBundleID:uid:", v47, 0LL);
    uint64_t v11 = v10;
    if (v10 && [v10 count])
    {
      uint64_t v44 = v8;
      id v46 = v7;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id obj = v11;
      id v12 = [obj countByEnumeratingWithState:&v59 objects:v58 count:16];
      if (!v12) {
        goto LABEL_29;
      }
      id v13 = v12;
      uint64_t v48 = *(void *)v60;
      while (1)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v60 != v48) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v15));
          id v17 = objc_alloc(&OBJC_CLASS___NEPolicy);
          v57[0] = v16;
          v57[1] = v49;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
          id v19 = [v17 initWithOrder:a5 result:v50 conditions:v18];

          id v20 = [v51 addPolicy:v19];
          id v21 = sub_10005DC2C();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (v20)
          {
            uint64_t v23 = _SC_syslog_os_log_mapping(5LL);
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v76 = 0u;
            __int128 v77 = 0u;
            __int128 v74 = 0u;
            __int128 v75 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v70 = 0u;
            __int128 v71 = 0u;
            __int128 v68 = 0u;
            __int128 v69 = 0u;
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            LODWORD(v24) = (_sc_log > 0) | 2;
            __int128 v64 = 0u;
            __int128 v65 = 0u;
            if (os_log_type_enabled(v22, (os_log_type_t)v23)) {
              uint64_t v24 = v24;
            }
            else {
              uint64_t v24 = 2LL;
            }
            uint64_t v25 = v22;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
            int v53 = 138413058;
            id v54 = v46;
            __int16 v55 = 1024;
            *(_DWORD *)__int16 v56 = a5;
            *(_WORD *)&v56[4] = 2112;
            *(void *)&v56[6] = v47;
            *(_WORD *)&v56[14] = 2112;
            *(void *)&v56[16] = v26;
            LODWORD(v43) = 38;
            v27 = (__int128 *)_os_log_send_and_compose_impl( v24,  0LL,  &v64,  256LL,  &_mh_execute_header,  v25,  v23,  "QoS marking policy: %@: %u: allowlist bundleID %@ (%@)",  &v53,  v43);

            uint64_t v28 = 5LL;
          }

          else
          {
            uint64_t v23 = _SC_syslog_os_log_mapping(3LL);
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v76 = 0u;
            __int128 v77 = 0u;
            __int128 v74 = 0u;
            __int128 v75 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v70 = 0u;
            __int128 v71 = 0u;
            __int128 v68 = 0u;
            __int128 v69 = 0u;
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            LODWORD(v29) = (_sc_log > 0) | 2;
            __int128 v64 = 0u;
            __int128 v65 = 0u;
            if (os_log_type_enabled(v22, (os_log_type_t)v23)) {
              uint64_t v29 = v29;
            }
            else {
              uint64_t v29 = 2LL;
            }
            uint64_t v25 = v22;
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
            int v53 = 138412802;
            id v54 = v46;
            __int16 v55 = 2112;
            *(void *)__int16 v56 = v47;
            *(_WORD *)&v56[8] = 2112;
            *(void *)&v56[10] = v30;
            LODWORD(v43) = 32;
            v27 = (__int128 *)_os_log_send_and_compose_impl( v29,  0LL,  &v64,  256LL,  &_mh_execute_header,  v25,  v23,  "QoS marking policy: %@: could not add allowlist policy for bundleID %@ (%@)",  &v53,  v43);

            uint64_t v28 = 3LL;
          }

          __SC_log_send2(v28, v25, v23, 0LL, v27);
          if (v27 != &v64) {
            free(v27);
          }
LABEL_27:
        }

        id v13 = [obj countByEnumeratingWithState:&v59 objects:v58 count:16];
        if (!v13)
        {
LABEL_29:

          id v7 = v46;
          goto LABEL_44;
        }
      }
    }

    id v31 = sub_10005DC2C();
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v32, v33))
    {
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      unsigned int v34 = (_sc_log > 0) | 2;
      uint64_t v35 = os_log_type_enabled(v32, (os_log_type_t)v33) ? v34 : 2LL;
      int v53 = 138412546;
      id v54 = v7;
      __int16 v55 = 2112;
      *(void *)__int16 v56 = v47;
      unsigned int v36 = (__int128 *)_os_log_send_and_compose_impl( v35,  0LL,  &v64,  256LL,  &_mh_execute_header,  v32,  v33,  "QoS marking policy: %@: could not add bundleID \"%@\"",  &v53,  22);
      __SC_log_send2(3LL, v32, v33, 0LL, v36);
      if (v36 != &v64) {
        free(v36);
      }
    }
  }

  else
  {
    id v37 = sub_10005DC2C();
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    uint64_t v39 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v38, v39))
    {
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      unsigned int v40 = (_sc_log > 0) | 2;
      uint64_t v41 = os_log_type_enabled(v38, (os_log_type_t)v39) ? v40 : 2LL;
      int v53 = 138412290;
      id v54 = v7;
      uint64_t v42 = (__int128 *)_os_log_send_and_compose_impl( v41,  0LL,  &v64,  256LL,  &_mh_execute_header,  v38,  v39,  "QoS marking policy: %@: no session",  &v53,  12);
      __SC_log_send2(3LL, v38, v39, 0LL, v42);
      if (v42 != &v64) {
        free(v42);
      }
    }
  }

- (QoSMarkingController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___QoSMarkingController;
  v2 = -[QoSMarkingController init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    interfaces = v2->_interfaces;
    v2->_interfaces = 0LL;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    policySessions = v3->_policySessions;
    v3->_policySessions = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requested = v3->_requested;
    v3->_requested = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    enabled = v3->_enabled;
    v3->_enabled = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    enabledAV = v3->_enabledAV;
    v3->_enabledAV = (NSMutableDictionary *)v11;
  }

  return v3;
}

- (void)updatePolicy:(id)a3 forInterface:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_enabled, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    unsigned int v9 = -[QoSMarkingController qosMarkingIsEnabled:](self, "qosMarkingIsEnabled:", v8);
    int v10 = v9 ^ 1;
    unsigned int v11 = -[QoSMarkingController qosMarkingIsAppleAudioVideoCallsEnabled:]( self,  "qosMarkingIsAppleAudioVideoCallsEnabled:",  v8);
    if (v6)
    {
LABEL_3:
      LODWORD(v12) = -[QoSMarkingController qosMarkingIsEnabled:](self, "qosMarkingIsEnabled:", v6);
      int v13 = v12 ^ 1;
      unsigned int v116 = -[QoSMarkingController qosMarkingIsAppleAudioVideoCallsEnabled:]( self,  "qosMarkingIsAppleAudioVideoCallsEnabled:",  v6);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned int v11 = 0;
    unsigned int v9 = 0;
    int v10 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }

  unsigned int v116 = 0;
  LODWORD(v12) = 0;
  int v13 = 0;
LABEL_6:
  if (v6) {
    int v14 = 1;
  }
  else {
    int v14 = v9;
  }
  int v118 = v12;
  if (v14 == 1
    && ((v9 ^ v12) & 1) == 0
    && ((v10 ^ v13) & 1) == 0
    && ((v9 & v12) != 1 || ([v8 isEqual:v6] & 1) != 0))
  {
    int v15 = 0;
    if (!(_DWORD)v12) {
      goto LABEL_134;
    }
LABEL_60:
    v52 = (void *)objc_claimAutoreleasedReturnValue( -[QoSMarkingController qosMarkingAllowListAppIdentifiers:]( self,  "qosMarkingAllowListAppIdentifiers:",  v8));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[QoSMarkingController qosMarkingAllowListAppIdentifiers:](self, "qosMarkingAllowListAppIdentifiers:", v6));
    if (!-[NSMutableDictionary count](self->_enabled, "count")) {
      sub_100061580("net.qos.policy.restricted", 1);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_enabled, "setObject:forKeyedSubscript:", v6, v7);
    id v53 = sub_10005DC2C();
    id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    uint64_t v55 = _SC_syslog_os_log_mapping(5LL);
    v115 = v52;
    if (__SC_log_enabled(5LL, v54, v55))
    {
      __int16 v56 = v8;
      __int128 v152 = 0u;
      __int128 v153 = 0u;
      __int128 v150 = 0u;
      __int128 v151 = 0u;
      __int128 v148 = 0u;
      __int128 v149 = 0u;
      __int128 v146 = 0u;
      __int128 v147 = 0u;
      __int128 v144 = 0u;
      __int128 v145 = 0u;
      __int128 v142 = 0u;
      __int128 v143 = 0u;
      __int128 v140 = 0u;
      __int128 v141 = 0u;
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      unsigned int v57 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v54, (os_log_type_t)v55)) {
        uint64_t v58 = v57;
      }
      else {
        uint64_t v58 = 2LL;
      }
      __int128 v59 = "update";
      if (!v9) {
        __int128 v59 = "add";
      }
      LODWORD(v154[0]) = 138412546;
      *(void *)((char *)v154 + 4) = v7;
      WORD6(v154[0]) = 2080;
      *(void *)((char *)v154 + 14) = v59;
      LODWORD(v105) = 22;
      __int128 v60 = (__int128 *)_os_log_send_and_compose_impl( v58,  0LL,  &v138,  256LL,  &_mh_execute_header,  v54,  v55,  "QoS marking policy: %@: %s",  v154,  v105);
      __SC_log_send2(5LL, v54, v55, 0LL, v60);
      if (v60 != &v138) {
        free(v60);
      }
      id v8 = v56;
      v52 = v115;
    }

    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_policySessions,  "objectForKeyedSubscript:",  v7));
    if (!v61)
    {
      if ([(id)v12 count]) {
        int v75 = 1;
      }
      else {
        int v75 = v116;
      }
      if (v75 != 1)
      {
        __int128 v61 = 0LL;
        LOBYTE(v71) = 1;
        goto LABEL_101;
      }

      uint64_t v76 = objc_claimAutoreleasedReturnValue(-[QoSMarkingController createPolicySession](self, "createPolicySession"));
      if (!v76)
      {
        id v99 = sub_10005DC2C();
        __int128 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
        uint64_t v100 = _SC_syslog_os_log_mapping(3LL);
        if (__SC_log_enabled(3LL, v70, v100))
        {
          v101 = v8;
          __int128 v152 = 0u;
          __int128 v153 = 0u;
          __int128 v150 = 0u;
          __int128 v151 = 0u;
          __int128 v148 = 0u;
          __int128 v149 = 0u;
          __int128 v146 = 0u;
          __int128 v147 = 0u;
          __int128 v144 = 0u;
          __int128 v145 = 0u;
          __int128 v142 = 0u;
          __int128 v143 = 0u;
          __int128 v140 = 0u;
          __int128 v141 = 0u;
          __int128 v138 = 0u;
          __int128 v139 = 0u;
          unsigned int v102 = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v70, (os_log_type_t)v100)) {
            uint64_t v103 = v102;
          }
          else {
            uint64_t v103 = 2LL;
          }
          LODWORD(v154[0]) = 138412290;
          *(void *)((char *)v154 + 4) = v7;
          LODWORD(v105) = 12;
          v104 = (__int128 *)_os_log_send_and_compose_impl( v103,  0LL,  &v138,  256LL,  &_mh_execute_header,  v70,  v100,  "%@: failed to create policy session",  v154,  v105);
          __SC_log_send2(3LL, v70, v100, 0LL, v104);
          if (v104 != &v138) {
            free(v104);
          }
          __int128 v61 = 0LL;
          LOBYTE(v71) = 1;
          id v8 = v101;
          v52 = v115;
        }

        else
        {
          __int128 v61 = 0LL;
          LOBYTE(v71) = 1;
        }

        goto LABEL_92;
      }

      __int128 v61 = (void *)v76;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_policySessions,  "setObject:forKeyedSubscript:",  v76,  v7);
    }

    if (([v61 removeAllPolicies] & 1) == 0)
    {
      id v62 = sub_10005DC2C();
      __int128 v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      uint64_t v64 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v63, v64))
      {
        v110 = v61;
        int v65 = v15;
        __int128 v66 = v8;
        __int128 v152 = 0u;
        __int128 v153 = 0u;
        __int128 v150 = 0u;
        __int128 v151 = 0u;
        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        __int128 v144 = 0u;
        __int128 v145 = 0u;
        __int128 v142 = 0u;
        __int128 v143 = 0u;
        __int128 v140 = 0u;
        __int128 v141 = 0u;
        __int128 v138 = 0u;
        __int128 v139 = 0u;
        unsigned int v67 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v63, (os_log_type_t)v64)) {
          uint64_t v68 = v67;
        }
        else {
          uint64_t v68 = 2LL;
        }
        LODWORD(v154[0]) = 138412290;
        *(void *)((char *)v154 + 4) = v7;
        LODWORD(v105) = 12;
        __int128 v69 = (__int128 *)_os_log_send_and_compose_impl( v68,  0LL,  &v138,  256LL,  &_mh_execute_header,  v63,  v64,  "%@: could not remove policies",  v154,  v105);
        __SC_log_send2(3LL, v63, v64, 0LL, v69);
        if (v69 != &v138) {
          free(v69);
        }
        id v8 = v66;
        int v15 = v65;
        __int128 v61 = v110;
        v52 = v115;
      }
    }

    if ([(id)v12 count])
    {
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      __int128 v70 = (os_log_s *)(id)v12;
      id v71 = -[os_log_s countByEnumeratingWithState:objects:count:]( v70,  "countByEnumeratingWithState:objects:count:",  &v130,  v129,  16LL);
      if (v71)
      {
        v111 = v61;
        int v107 = v15;
        uint64_t v72 = *(void *)v131;
        uint64_t v73 = 2000LL;
        do
        {
          for (i = 0LL; i != v71; i = (char *)i + 1)
          {
            if (*(void *)v131 != v72) {
              objc_enumerationMutation(v70);
            }
            -[QoSMarkingController addAllowListAppIdentifierPolicy:forApp:order:]( self,  "addAllowListAppIdentifierPolicy:forApp:order:",  v7,  *(void *)(*((void *)&v130 + 1) + 8LL * (void)i),  (char *)i + v73);
          }

          id v71 = -[os_log_s countByEnumeratingWithState:objects:count:]( v70,  "countByEnumeratingWithState:objects:count:",  &v130,  v129,  16LL);
          uint64_t v73 = (v73 + (_DWORD)i);
        }

        while (v71);
        int v15 = v107;
        __int128 v61 = v111;
        v52 = v115;
      }

+ (id)sharedController
{
  if (qword_10007A010 != -1) {
    dispatch_once(&qword_10007A010, &stru_100073190);
  }
  return (id)qword_10007A008;
}

- (void)setInterfaces:(id)a3
{
  id v5 = a3;
  int v6 = socket(2, 2, 0);
  if (v6 == -1)
  {
    id v25 = sub_10005DC2C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v26 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v8, v26))
    {
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
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
      LODWORD(v27) = (_sc_log > 0) | 2;
      uint64_t v27 = os_log_type_enabled(v8, (os_log_type_t)v26) ? v27 : 2LL;
      id v8 = v8;
      unsigned int v28 = __error();
      uint64_t v29 = strerror(*v28);
      LODWORD(v60) = 136315138;
      *(void *)((char *)&v60 + 4) = v29;
      uint64_t v30 = (__int128 *)_os_log_send_and_compose_impl( v27,  0LL,  &v44,  256LL,  &_mh_execute_header,  v8,  v26,  "socket() failed: %s",  (const char *)&v60);

      __SC_log_send2(3LL, v8, v26, 0LL, v30);
      if (v30 != &v44) {
        free(v30);
      }
    }
  }

  else
  {
    int v7 = v6;
    id v33 = self;
    id v8 = self->_interfaces;
    objc_storeStrong((id *)&self->_interfaces, a3);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v32 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v36 + 1) + 8LL * (void)i);
          id v14 = [v13 UTF8String];
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __strlcpy_chk(&v60, v14, 16LL, 16LL);
          if (ioctl(v7, 0xC020699FuLL, &v60) == -1)
          {
            id v16 = sub_10005DC2C();
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            uint64_t v18 = _SC_syslog_os_log_mapping(5LL);
            if (__SC_log_enabled(5LL, v17, v18))
            {
              unsigned int v19 = v8;
              __int128 v58 = 0u;
              __int128 v59 = 0u;
              __int128 v56 = 0u;
              __int128 v57 = 0u;
              __int128 v54 = 0u;
              __int128 v55 = 0u;
              __int128 v52 = 0u;
              __int128 v53 = 0u;
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              LODWORD(v20) = (_sc_log > 0) | 2;
              __int128 v44 = 0u;
              __int128 v45 = 0u;
              if (os_log_type_enabled(v17, (os_log_type_t)v18)) {
                uint64_t v20 = v20;
              }
              else {
                uint64_t v20 = 2LL;
              }
              id v21 = v17;
              int v22 = __error();
              int v23 = strerror(*v22);
              int v40 = 136315394;
              id v41 = v14;
              __int16 v42 = 2080;
              id v43 = v23;
              LODWORD(v31) = 22;
              int v24 = (__int128 *)_os_log_send_and_compose_impl( v20,  0LL,  &v44,  256LL,  &_mh_execute_header,  v21,  v18,  "%s: ioctl(SIOCGIFTYPE) failed: %s",  (const char *)&v40,  v31);

              __SC_log_send2(5LL, v21, v18, 0LL, v24);
              if (v24 != &v44) {
                free(v24);
              }
              id v8 = v19;
            }
          }

          else if (*(void *)((char *)&v61 + 4) == 0x300000002LL {
                 && (-[os_log_s containsObject:](v8, "containsObject:", v13) & 1) == 0)
          }
          {
            int v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v33->_requested,  "objectForKeyedSubscript:",  v13));
            -[NSMutableDictionary removeObjectForKey:](v33->_requested, "removeObjectForKey:", v13);
            -[QoSMarkingController setPolicy:forInterface:](v33, "setPolicy:forInterface:", v15, v13);
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v36 objects:v35 count:16];
      }

      while (v10);
    }

    close(v7);
    id v5 = v32;
  }
}

- (void)setPolicy:(id)a3 forInterface:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_requested, "setObject:forKey:", v7, v6, v7);
  }

  else
  {
    -[QoSMarkingController updatePolicy:forInterface:](self, "updatePolicy:forInterface:", 0LL, v6);
    -[NSMutableDictionary removeObjectForKey:](self->_requested, "removeObjectForKey:", v6);
  }
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (NSMutableDictionary)policySessions
{
  return self->_policySessions;
}

- (void)setPolicySessions:(id)a3
{
}

- (NSMutableDictionary)requested
{
  return self->_requested;
}

- (void)setRequested:(id)a3
{
}

- (NSMutableDictionary)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
}

- (NSMutableDictionary)enabledAV
{
  return self->_enabledAV;
}

- (void)setEnabledAV:(id)a3
{
}

- (void).cxx_destruct
{
}

@end