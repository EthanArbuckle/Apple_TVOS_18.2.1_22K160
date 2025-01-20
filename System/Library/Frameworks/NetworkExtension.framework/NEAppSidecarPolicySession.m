@interface NEAppSidecarPolicySession
+ (id)connectionIdentifier;
- (BOOL)installPolicies;
- (BOOL)uninstallPolicies;
- (NEAppSidecarPolicySession)init;
@end

@implementation NEAppSidecarPolicySession

- (NEAppSidecarPolicySession)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEAppSidecarPolicySession;
  v2 = -[NEAppSidecarPolicySession init](&v12, sel_init);
  if (!v2) {
    goto LABEL_4;
  }
  v3 = -[NEPolicySession initFromPrivilegedProcess]( objc_alloc(&OBJC_CLASS___NEPolicySession),  "initFromPrivilegedProcess");
  policySession = v2->_policySession;
  v2->_policySession = v3;

  v5 = v2->_policySession;
  if (v5)
  {
    -[NEPolicySession lockSessionToCurrentProcess](v5, "lockSessionToCurrentProcess");
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    policyIDList = v2->_policyIDList;
    v2->_policyIDList = v6;

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }

  ne_log_obj();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, "failed to create policy session", v11, 2u);
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

- (BOOL)installPolicies
{
  uint64_t v154 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 8LL, 1))
  {
    selfa = self;
    id v3 = +[NEProcessInfo copyUUIDsForExecutable:]( &OBJC_CLASS___NEProcessInfo,  "copyUUIDsForExecutable:",  @"/usr/libexec/rapportd");
    if (v3)
    {
      id v4 = +[NEProcessInfo copyUUIDsForExecutable:]( &OBJC_CLASS___NEProcessInfo,  "copyUUIDsForExecutable:",  @"/usr/libexec/SidecarRelay");
      if (v4)
      {
        v5 = +[NEProcessInfo copyDNSUUIDs](&OBJC_CLASS___NEProcessInfo, "copyDNSUUIDs");
        v6 = v5;
        if (v5)
        {
          v128 = v5;
          id v125 = v3;
          v126 = v4;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          id obj = v3;
          uint64_t v7 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            LODWORD(v9) = 0;
            v10 = 0LL;
            v11 = 0LL;
            id v133 = *(id *)v146;
            while (2)
            {
              uint64_t v12 = 0LL;
              uint64_t v13 = v9;
              do
              {
                v14 = v11;
                v15 = v10;
                if (*(id *)v146 != v133) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v16 = *(void *)(*((void *)&v145 + 1) + 8 * v12);
                id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
                v18 = +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v16);
                [v17 addObject:v18];
                v19 = +[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces");
                [v17 addObject:v19];
                v11 = +[NEPolicyResult passWithFlags:](&OBJC_CLASS___NEPolicyResult, "passWithFlags:", 2LL);
                v10 = -[NEPolicy initWithOrder:result:conditions:]( objc_alloc(&OBJC_CLASS___NEPolicy),  "initWithOrder:result:conditions:",  v13 + v12,  v11,  v17);
                uint64_t v21 = objc_msgSend(objc_getProperty(selfa, v20, 8, 1), "addPolicy:", v10);
                int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v24 = v23;
                if (!v21)
                {
                  BOOL v32 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
                  if (is_debug_logging_enabled)
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                      v120 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v120;
                      _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  v113 = obj;
LABEL_80:

                  goto LABEL_81;
                }

                if (is_debug_logging_enabled)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_1876B1000, v24, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }

                else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v25;
                  _os_log_impl(&dword_1876B1000, v24, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }

                id Property = objc_getProperty(selfa, v26, 16LL, 1);
                v28 = (void *)MEMORY[0x189607968];
                id v29 = Property;
                [v28 numberWithUnsignedInteger:v21];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v29 addObject:v30];

                ++v12;
              }

              while (v8 != v12);
              uint64_t v9 = (v13 + v12);
              uint64_t v8 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }

          else
          {
            uint64_t v9 = 0LL;
            v10 = 0LL;
            v11 = 0LL;
          }

          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          v127 = v128;
          uint64_t v130 = -[os_log_s countByEnumeratingWithState:objects:count:]( v127,  "countByEnumeratingWithState:objects:count:",  &v141,  v150,  16LL);
          if (v130)
          {
            uint64_t obja = *(void *)v142;
            while (2)
            {
              for (uint64_t i = 0LL; i != v130; ++i)
              {
                if (*(void *)v142 != obja) {
                  objc_enumerationMutation(v127);
                }
                uint64_t v34 = *(void *)(*((void *)&v141 + 1) + 8 * i);
                id v35 = objc_alloc_init(MEMORY[0x189603FA8]);
                v36 = +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v34);
                [v35 addObject:v36];
                v37 = +[NEPolicyCondition packetFilterTags:](&OBJC_CLASS___NEPolicyCondition, "packetFilterTags:", 1LL);
                [v35 addObject:v37];
                v38 = +[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces");
                [v35 addObject:v38];
                v39 = +[NEPolicyResult passWithFlags:](&OBJC_CLASS___NEPolicyResult, "passWithFlags:", 2LL);
                id v134 = v35;
                v40 = -[NEPolicy initWithOrder:result:conditions:]( objc_alloc(&OBJC_CLASS___NEPolicy),  "initWithOrder:result:conditions:",  v9,  v39,  v35);

                uint64_t v42 = objc_msgSend(objc_getProperty(selfa, v41, 8, 1), "addPolicy:", v40);
                int v43 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (!v42)
                {
                  BOOL v116 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
                  if (v43)
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v40;
                      _os_log_error_impl( &dword_1876B1000,  v45,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v40, "descriptionWithIndent:options:", 0LL, 2LL);
                      v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v122;
                      _os_log_error_impl( &dword_1876B1000,  v45,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  v58 = v40;
                  v56 = v39;
                  goto LABEL_110;
                }

                if (v43)
                {
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v40;
                    _os_log_debug_impl(&dword_1876B1000, v45, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }

                else if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v40, "descriptionWithIndent:options:", 0LL, 2LL);
                  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v46;
                  _os_log_impl(&dword_1876B1000, v45, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }

                id v48 = objc_getProperty(selfa, v47, 16LL, 1);
                v49 = (void *)MEMORY[0x189607968];
                id v50 = v48;
                [v49 numberWithUnsignedInteger:v42];
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                [v50 addObject:v51];

                v45 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FA8]);
                v52 = +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v34);
                -[os_log_s addObject:](v45, "addObject:", v52);

                [MEMORY[0x189608DE8] endpointWithHostname:@"224.0.0.251" port:@"5353"];
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = +[NEPolicyCondition remoteAddress:prefix:]( &OBJC_CLASS___NEPolicyCondition,  "remoteAddress:prefix:",  v53,  0LL);
                -[os_log_s addObject:](v45, "addObject:", v54);
                v55 = +[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces");
                -[os_log_s addObject:](v45, "addObject:", v55);
                v56 = +[NEPolicyResult passWithFlags:](&OBJC_CLASS___NEPolicyResult, "passWithFlags:", 2LL);
                int v129 = v9;
                int v57 = v9 + 1;
                v58 = -[NEPolicy initWithOrder:result:conditions:]( objc_alloc(&OBJC_CLASS___NEPolicy),  "initWithOrder:result:conditions:",  (v9 + 1),  v56,  v45);

                uint64_t v60 = objc_msgSend(objc_getProperty(selfa, v59, 8, 1), "addPolicy:", v58);
                int v61 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v63 = v62;
                if (!v60)
                {
                  BOOL v117 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
                  if (v61)
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v58;
                      _os_log_error_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v58, "descriptionWithIndent:options:", 0LL, 2LL);
                      v123 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v123;
                      _os_log_error_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  goto LABEL_111;
                }

                if (v61)
                {
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v58;
                    _os_log_debug_impl(&dword_1876B1000, v63, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }

                else if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v58, "descriptionWithIndent:options:", 0LL, 2LL);
                  v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v64;
                  _os_log_impl(&dword_1876B1000, v63, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }

                id v66 = objc_getProperty(selfa, v65, 16LL, 1);
                v67 = (void *)MEMORY[0x189607968];
                id v68 = v66;
                [v67 numberWithUnsignedInteger:v60];
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                [v68 addObject:v69];

                id v70 = objc_alloc_init(MEMORY[0x189603FA8]);
                v71 = +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v34);
                [v70 addObject:v71];

                [MEMORY[0x189608DE8] endpointWithHostname:@"FF02::FB" port:@"5353"];
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = +[NEPolicyCondition remoteAddress:prefix:]( &OBJC_CLASS___NEPolicyCondition,  "remoteAddress:prefix:",  v72,  0LL);
                [v70 addObject:v73];
                v74 = +[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces");
                [v70 addObject:v74];
                v11 = +[NEPolicyResult passWithFlags:](&OBJC_CLASS___NEPolicyResult, "passWithFlags:", 2LL);
                uint64_t v75 = (v57 + 1);
                v10 = -[NEPolicy initWithOrder:result:conditions:]( objc_alloc(&OBJC_CLASS___NEPolicy),  "initWithOrder:result:conditions:",  v75,  v11,  v70);

                uint64_t v77 = objc_msgSend(objc_getProperty(selfa, v76, 8, 1), "addPolicy:", v10);
                int v78 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v80 = v79;
                if (!v77)
                {
                  BOOL v119 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
                  if (v78)
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v124;
                      _os_log_error_impl( &dword_1876B1000,  v80,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  v58 = v10;
                  v56 = v11;
LABEL_110:
                  v118 = v134;
LABEL_111:

                  BOOL v31 = 0;
                  v11 = v56;
                  goto LABEL_82;
                }

                if (v78)
                {
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_1876B1000, v80, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }

                else if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                  v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v81;
                  _os_log_impl(&dword_1876B1000, v80, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }

                id v83 = objc_getProperty(selfa, v82, 16LL, 1);
                v84 = (void *)MEMORY[0x189607968];
                id v85 = v83;
                [v84 numberWithUnsignedInteger:v77];
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                [v85 addObject:v86];

                uint64_t v9 = (v75 + 1);
              }

              uint64_t v9 = (v129 + 3);
              uint64_t v130 = -[os_log_s countByEnumeratingWithState:objects:count:]( v127,  "countByEnumeratingWithState:objects:count:",  &v141,  v150,  16LL);
              if (v130) {
                continue;
              }
              break;
            }
          }

          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          id v135 = v126;
          uint64_t v87 = [v135 countByEnumeratingWithState:&v137 objects:v149 count:16];
          if (v87)
          {
            uint64_t v88 = v87;
            uint64_t v89 = *(void *)v138;
            while (2)
            {
              uint64_t v90 = 0LL;
              uint64_t v91 = v9;
              do
              {
                v92 = v11;
                v93 = v10;
                if (*(void *)v138 != v89) {
                  objc_enumerationMutation(v135);
                }
                uint64_t v94 = *(void *)(*((void *)&v137 + 1) + 8 * v90);
                id v95 = objc_alloc_init(MEMORY[0x189603FA8]);
                v96 = +[NEPolicyCondition effectiveApplication:]( &OBJC_CLASS___NEPolicyCondition,  "effectiveApplication:",  v94);
                [v95 addObject:v96];
                v97 = +[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces");
                [v95 addObject:v97];
                v11 = +[NEPolicyResult passWithFlags:](&OBJC_CLASS___NEPolicyResult, "passWithFlags:", 2LL);
                v10 = -[NEPolicy initWithOrder:result:conditions:]( objc_alloc(&OBJC_CLASS___NEPolicy),  "initWithOrder:result:conditions:",  v91 + v90,  v11,  v95);
                uint64_t v99 = objc_msgSend(objc_getProperty(selfa, v98, 8, 1), "addPolicy:", v10);
                int v100 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v102 = v101;
                if (!v99)
                {
                  BOOL v115 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
                  if (v100)
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl( &dword_1876B1000,  v102,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    id v3 = v125;
                    id v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                      v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v121;
                      _os_log_error_impl( &dword_1876B1000,  v102,  OS_LOG_TYPE_ERROR,  "Failed to add policy: %@",  buf,  0xCu);
                    }
                  }

                  v113 = v135;
                  goto LABEL_80;
                }

                if (v100)
                {
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_1876B1000, v102, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }

                else if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0LL, 2LL);
                  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v103;
                  _os_log_impl(&dword_1876B1000, v102, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }

                id v105 = objc_getProperty(selfa, v104, 16LL, 1);
                v106 = (void *)MEMORY[0x189607968];
                id v107 = v105;
                [v106 numberWithUnsignedInteger:v99];
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                [v107 addObject:v108];

                ++v90;
              }

              while (v88 != v90);
              LODWORD(v9) = v91 + v90;
              uint64_t v88 = [v135 countByEnumeratingWithState:&v137 objects:v149 count:16];
              if (v88) {
                continue;
              }
              break;
            }
          }

          char v110 = objc_msgSend(objc_getProperty(selfa, v109, 8, 1), "apply");
          ne_log_obj();
          v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v112 = v111;
          if ((v110 & 1) != 0)
          {
            id v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1876B1000, v112, OS_LOG_TYPE_INFO, "Sidecar policies install successful", buf, 2u);
            }

            BOOL v31 = 1;
          }

          else
          {
            id v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1876B1000, v112, OS_LOG_TYPE_ERROR, "Sidecar policies install failed", buf, 2u);
            }

            BOOL v31 = 0;
          }

          id v4 = v126;
        }

        else
        {
          ne_log_obj();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1876B1000, (os_log_t)v11, OS_LOG_TYPE_ERROR, "failed to get DNS UUID", buf, 2u);
          }

- (BOOL)uninstallPolicies
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 8LL, 1))
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NEAppSidecarPolicySession uninstallPolicies]";
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null self.policySession",  (uint8_t *)&v8,  0xCu);
    }

    goto LABEL_8;
  }

  BOOL v4 = 1;
  objc_msgSend(objc_getProperty(self, v3, 8, 1), "removeAllPolicies");
  if ((objc_msgSend(objc_getProperty(self, v5, 8, 1), "apply") & 1) == 0)
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to uninstall Sidecar policies",  (uint8_t *)&v8,  2u);
    }

- (void).cxx_destruct
{
}

+ (id)connectionIdentifier
{
  return @"AppleSidecar";
}

@end