@interface NWCandidatePathMonitor
- (NSArray)candidatePaths;
- (NSArray)interfaces;
- (NSArray)remoteEndpoints;
- (NSMutableDictionary)candidatePathEvaluators;
- (NWCandidatePathMonitor)init;
- (NWCandidatePathMonitor)initWithParameters:(id)a3;
- (NWParameters)parameters;
- (OS_dispatch_queue)queue;
- (OS_nw_path_evaluator)primaryEvaluator;
- (id)cParameters;
- (id)interfacesLocked;
- (id)updateHandler;
- (void)cancelCandidatePathEvaluators;
- (void)cancelWithHandler:(id)a3;
- (void)dealloc;
- (void)resetCandidatePathEvaluators;
- (void)setCandidatePathEvaluators:(id)a3;
- (void)setPrimaryEvaluator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteEndpoints:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)startWithQueue:(id)a3 updateHandler:(id)a4;
- (void)updateRemoteEndpoints:(id)a3;
@end

@implementation NWCandidatePathMonitor

- (NWCandidatePathMonitor)initWithParameters:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NWCandidatePathMonitor;
  v5 = -[NWCandidatePathMonitor init](&v21, sel_init);
  if (v5)
  {
    if (v4) {
      v6 = (nw_parameters *)[v4 copyCParameters];
    }
    else {
      v6 = nw_parameters_create();
    }
    v7 = v6;
    nw_parameters_set_multipath_service(v6, nw_multipath_service_handover);
    evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0LL, v7);
    -[NWCandidatePathMonitor setPrimaryEvaluator:](v5, "setPrimaryEvaluator:", evaluator_for_endpoint);

    id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[NWCandidatePathMonitor setCandidatePathEvaluators:](v5, "setCandidatePathEvaluators:", v9);

    v5->lock._os_unfair_lock_opaque = 0;
    v10 = v5;

    goto LABEL_6;
  }

  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v23 = "-[NWCandidatePathMonitor initWithParameters:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_181A5C000, v14, v15, v16, buf, 0xCu);
      }
    }

    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v15 = type;
        BOOL v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v23 = "-[NWCandidatePathMonitor initWithParameters:]";
            __int16 v24 = 2082;
            v25 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v14,  v15,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }

        if (!v18) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }

      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        v16 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }

- (NWCandidatePathMonitor)init
{
  return -[NWCandidatePathMonitor initWithParameters:](self, "initWithParameters:", 0LL);
}

- (void)cancelCandidatePathEvaluators
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke;
  v4[3] = &unk_189BC93A0;
  v4[4] = self;
  p_lock = &self->lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_cancel(v4);

    -[NWCandidatePathMonitor setPrimaryEvaluator:](self, "setPrimaryEvaluator:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWCandidatePathMonitor;
  -[NWCandidatePathMonitor dealloc](&v5, sel_dealloc);
}

- (id)cParameters
{
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
    os_unfair_lock_lock(v3 + 24);
    id v5 = v4[6];
    os_unfair_lock_unlock(v3 + 24);
  }

  else
  {
    id v5 = 0LL;
  }

  id v6 = nw_path_copy_parameters(v5);
  return v6;
}

- (NWParameters)parameters
{
  v3 = objc_alloc(&OBJC_CLASS___NWParameters);
  -[NWCandidatePathMonitor cParameters](self, "cParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v4);

  return v5;
}

- (void)resetCandidatePathEvaluators
{
  uint64_t v184 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->lock);
  val = self;
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v4 = nw_path_evaluator_copy_path(v3);

  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  enumerate_block[0] = MEMORY[0x1895F87A8];
  enumerate_block[1] = 3221225472LL;
  enumerate_block[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke;
  enumerate_block[3] = &unk_189BB9F60;
  id v98 = v5;
  id v167 = v98;
  v95 = v4;
  nw_path_enumerate_interfaces((nw_path_t)v4, enumerate_block);
  id v6 = (void *)MEMORY[0x189604010];
  v7 = -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
  [v7 allKeys];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setWithArray:v8];
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
  }

  else
  {
    int v10 = gLogFDOverride;

    if (v10 == -1) {
      goto LABEL_23;
    }
  }

  __int128 v164 = 0u;
  __int128 v165 = 0u;
  __int128 v162 = 0u;
  __int128 v163 = 0u;
  id v11 = v98;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v162 objects:v183 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v163;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v163 != v13) {
          objc_enumerationMutation(v11);
        }
        os_log_type_t v15 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          [v15 internalInterface];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v17;
          _os_log_impl(&dword_181A5C000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Current interface: %@", buf, 0x16u);
        }
      }

      uint64_t v12 = [v11 countByEnumeratingWithState:&v162 objects:v183 count:16];
    }

    while (v12);
  }

  __int128 v160 = 0u;
  __int128 v161 = 0u;
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  id v18 = v97;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v158 objects:v182 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v159;
    do
    {
      for (uint64_t j = 0LL; j != v19; ++j)
      {
        if (*(void *)v159 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v158 + 1) + 8 * j);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          [v22 internalInterface];
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v24;
          _os_log_impl(&dword_181A5C000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Existing interface: %@", buf, 0x16u);
        }
      }

      uint64_t v19 = [v18 countByEnumeratingWithState:&v158 objects:v182 count:16];
    }

    while (v19);
  }

LABEL_23:
  v25 = (void *)[v98 mutableCopy];
  [v25 minusSet:v97];
  v103 = (void *)[v97 mutableCopy];
  [v103 minusSet:v98];
  v101 = (void *)[v97 mutableCopy];
  [v101 intersectSet:v98];
  objc_initWeak(&location, val);
  -[NWCandidatePathMonitor cParameters](val, "cParameters");
  parameters = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  __int128 v155 = 0u;
  __int128 v156 = 0u;
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  obuint64_t j = v25;
  uint64_t v109 = [obj countByEnumeratingWithState:&v153 objects:v181 count:16];
  if (v109)
  {
    id v107 = *(id *)v154;
    do
    {
      for (id k = 0LL; k != (id)v109; id k = (char *)k + 1)
      {
        if (*(id *)v154 != v107) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v153 + 1) + 8LL * (void)k);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          [v26 internalInterface];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v28;
          _os_log_impl(&dword_181A5C000, v27, OS_LOG_TYPE_DEBUG, "%{public}s Adding interface %@", buf, 0x16u);
        }

        id v117 = objc_alloc_init(MEMORY[0x189603FC8]);
        __int128 v151 = 0u;
        __int128 v152 = 0u;
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        v29 = -[NWCandidatePathMonitor remoteEndpoints](val, "remoteEndpoints");
        uint64_t v30 = [v29 countByEnumeratingWithState:&v149 objects:v180 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v150;
          id v115 = v29;
          do
          {
            for (uint64_t m = 0LL; m != v30; ++m)
            {
              if (*(void *)v150 != v31) {
                objc_enumerationMutation(v115);
              }
              v33 = *(void **)(*((void *)&v149 + 1) + 8 * m);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v34 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                [v26 internalInterface];
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v33;
                __int16 v178 = 2112;
                v179 = v35;
                _os_log_impl( &dword_181A5C000,  v34,  OS_LOG_TYPE_DEBUG,  "%{public}s Adding %@ over interface %@",  buf,  0x20u);
              }

              [v33 internalEndpoint];
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = nw_parameters_copy(parameters);
              [v26 internalInterface];
              v38 = (nw_interface *)objc_claimAutoreleasedReturnValue();
              nw_parameters_require_interface(v37, v38);

              evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v36, v37);
              v40 = -[NWCandidatePathMonitor queue](val, "queue");
              v147[0] = MEMORY[0x1895F87A8];
              v147[1] = 3221225472LL;
              v147[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8;
              v147[3] = &unk_189BC8C90;
              objc_copyWeak(&v148, &location);
              nw_path_evaluator_set_update_handler(evaluator_for_endpoint, v40, v147);

              [v117 setObject:evaluator_for_endpoint forKeyedSubscript:v33];
              objc_destroyWeak(&v148);
            }

            v29 = v115;
            uint64_t v30 = [v115 countByEnumeratingWithState:&v149 objects:v180 count:16];
          }

          while (v30);
        }
        v41 = -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        [v41 setObject:v117 forKeyedSubscript:v26];
      }

      uint64_t v109 = [obj countByEnumeratingWithState:&v153 objects:v181 count:16];
    }

    while (v109);
  }

  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  id v108 = v103;
  uint64_t v114 = [v108 countByEnumeratingWithState:&v143 objects:v173 count:16];
  if (v114)
  {
    id v112 = *(id *)v144;
    do
    {
      for (id n = 0LL; n != (id)v114; id n = (char *)n + 1)
      {
        if (*(id *)v144 != v112) {
          objc_enumerationMutation(v108);
        }
        v42 = *(void **)(*((void *)&v143 + 1) + 8LL * (void)n);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          [v42 internalInterface];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v44;
          _os_log_impl(&dword_181A5C000, v43, OS_LOG_TYPE_DEBUG, "%{public}s Removing interface %@", buf, 0x16u);
        }
        v45 = -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        [v45 objectForKeyedSubscript:v42];
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v141 = 0u;
        __int128 v142 = 0u;
        __int128 v139 = 0u;
        __int128 v140 = 0u;
        [v46 allKeys];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v48 = [v47 countByEnumeratingWithState:&v139 objects:v172 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v140;
          do
          {
            for (iuint64_t i = 0LL; ii != v48; ++ii)
            {
              if (*(void *)v140 != v49) {
                objc_enumerationMutation(v47);
              }
              v51 = *(void **)(*((void *)&v139 + 1) + 8 * ii);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v52 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                [v42 internalInterface];
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v51;
                __int16 v178 = 2112;
                v179 = v53;
                _os_log_impl( &dword_181A5C000,  v52,  OS_LOG_TYPE_DEBUG,  "%{public}s Removing %@ from interface %@",  buf,  0x20u);
              }

              [v46 objectForKeyedSubscript:v51];
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v54);
              [v46 setObject:0 forKeyedSubscript:v51];
            }

            uint64_t v48 = [v47 countByEnumeratingWithState:&v139 objects:v172 count:16];
          }

          while (v48);
        }
        v55 = -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        [v55 setObject:0 forKeyedSubscript:v42];
      }

      uint64_t v114 = [v108 countByEnumeratingWithState:&v143 objects:v173 count:16];
    }

    while (v114);
  }

  v56 = (void *)MEMORY[0x189604010];
  v57 = -[NWCandidatePathMonitor remoteEndpoints](val, "remoteEndpoints");
  [v56 setWithArray:v57];
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v137 = 0u;
  __int128 v138 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  id v96 = v101;
  uint64_t v100 = [v96 countByEnumeratingWithState:&v135 objects:v171 count:16];
  if (v100)
  {
    uint64_t v99 = *(void *)v136;
    do
    {
      for (juint64_t j = 0LL; jj != v100; ++jj)
      {
        if (*(void *)v136 != v99) {
          objc_enumerationMutation(v96);
        }
        v118 = *(void **)(*((void *)&v135 + 1) + 8 * jj);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v58 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          [v118 internalInterface];
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v59;
          _os_log_impl(&dword_181A5C000, v58, OS_LOG_TYPE_DEBUG, "%{public}s Keeping interface %@", buf, 0x16u);
        }
        v60 = -[NWCandidatePathMonitor candidatePathEvaluators](val, "candidatePathEvaluators");
        [v60 objectForKeyedSubscript:v118];
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = (void *)MEMORY[0x189604010];
        [v61 allKeys];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 setWithArray:v63];
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = (void *)[v104 mutableCopy];
        [v64 minusSet:v110];
        v65 = (void *)[v110 mutableCopy];
        [v65 minusSet:v104];
        v102 = v65;
        __int128 v133 = 0u;
        __int128 v134 = 0u;
        __int128 v131 = 0u;
        __int128 v132 = 0u;
        id v113 = v64;
        uint64_t v66 = [v113 countByEnumeratingWithState:&v131 objects:v170 count:16];
        if (v66)
        {
          uint64_t v67 = *(void *)v132;
          do
          {
            for (uint64_t kk = 0LL; kk != v66; ++kk)
            {
              if (*(void *)v132 != v67) {
                objc_enumerationMutation(v113);
              }
              v69 = *(void **)(*((void *)&v131 + 1) + 8 * kk);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v70 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                [v118 internalInterface];
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v69;
                __int16 v178 = 2112;
                v179 = v71;
                _os_log_impl( &dword_181A5C000,  v70,  OS_LOG_TYPE_DEBUG,  "%{public}s Adding %@ over interface %@",  buf,  0x20u);
              }

              [v69 internalEndpoint];
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = nw_parameters_copy(parameters);
              [v118 internalInterface];
              v74 = (nw_interface *)objc_claimAutoreleasedReturnValue();
              nw_parameters_require_interface(v73, v74);

              v75 = nw_path_create_evaluator_for_endpoint(v72, v73);
              v76 = -[NWCandidatePathMonitor queue](val, "queue");
              v129[0] = MEMORY[0x1895F87A8];
              v129[1] = 3221225472LL;
              v129[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10;
              v129[3] = &unk_189BC8C90;
              objc_copyWeak(&v130, &location);
              nw_path_evaluator_set_update_handler(v75, v76, v129);

              [v61 setObject:v75 forKeyedSubscript:v69];
              objc_destroyWeak(&v130);
            }

            uint64_t v66 = [v113 countByEnumeratingWithState:&v131 objects:v170 count:16];
          }

          while (v66);
        }

        __int128 v127 = 0u;
        __int128 v128 = 0u;
        __int128 v125 = 0u;
        __int128 v126 = 0u;
        id v77 = v102;
        uint64_t v78 = [v77 countByEnumeratingWithState:&v125 objects:v169 count:16];
        if (v78)
        {
          uint64_t v79 = *(void *)v126;
          do
          {
            for (muint64_t m = 0LL; mm != v78; ++mm)
            {
              if (*(void *)v126 != v79) {
                objc_enumerationMutation(v77);
              }
              v81 = *(void **)(*((void *)&v125 + 1) + 8 * mm);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v82 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                [v118 internalInterface];
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v81;
                __int16 v178 = 2112;
                v179 = v83;
                _os_log_impl( &dword_181A5C000,  v82,  OS_LOG_TYPE_DEBUG,  "%{public}s Removing %@ from interface %@",  buf,  0x20u);
              }

              [v61 objectForKeyedSubscript:v81];
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v84);
              [v61 setObject:0 forKeyedSubscript:v81];
            }

            uint64_t v78 = [v77 countByEnumeratingWithState:&v125 objects:v169 count:16];
          }

          while (v78);
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v85 = (id)gLogObj;
        if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_DEBUG))
        {
        }

        else
        {
          BOOL v86 = gLogFDOverride == -1;

          if (v86) {
            goto LABEL_97;
          }
        }

        v87 = (void *)[v110 mutableCopy];
        [v87 intersectSet:v104];
        __int128 v123 = 0u;
        __int128 v124 = 0u;
        __int128 v121 = 0u;
        __int128 v122 = 0u;
        id v88 = v87;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v121 objects:v168 count:16];
        if (v89)
        {
          uint64_t v90 = *(void *)v122;
          do
          {
            for (uint64_t nn = 0LL; nn != v89; ++nn)
            {
              if (*(void *)v122 != v90) {
                objc_enumerationMutation(v88);
              }
              v92 = *(void **)(*((void *)&v121 + 1) + 8 * nn);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v93 = (os_log_s *)(id)gLogObj;
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                [v118 internalInterface];
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v92;
                __int16 v178 = 2112;
                v179 = v94;
                _os_log_impl( &dword_181A5C000,  v93,  OS_LOG_TYPE_DEBUG,  "%{public}s Keeping %@ on interface %@",  buf,  0x20u);
              }
            }

            uint64_t v89 = [v88 countByEnumeratingWithState:&v121 objects:v168 count:16];
          }

          while (v89);
        }

LABEL_97:
      }

      uint64_t v100 = [v96 countByEnumeratingWithState:&v135 objects:v171 count:16];
    }

    while (v100);
  }

  objc_destroyWeak(&location);
}

- (void)startWithQueue:(id)a3 updateHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)locatioid n = 136446210;
    *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)locatioid n = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_181A5C000, v13, v14, "%{public}s called with null queue", location, 0xCu);
      }
    }

    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      BOOL v19 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)locatioid n = 136446466;
          *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
          __int16 v30 = 2082;
          uint64_t v31 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v13,  v18,  "%{public}s called with null queue, dumping backtrace:%{public}s",  location,  0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v12) {
          goto LABEL_4;
        }
LABEL_39:
        free(v12);
        goto LABEL_4;
      }

      if (v19)
      {
        *(_DWORD *)locatioid n = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_181A5C000, v13, v18, "%{public}s called with null queue, no backtrace", location, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)locatioid n = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl( &dword_181A5C000,  v13,  v23,  "%{public}s called with null queue, backtrace limit exceeded",  location,  0xCu);
      }
    }

- (void)cancelWithHandler:(id)a3
{
  blocid k = a3;
  -[NWCandidatePathMonitor cancelCandidatePathEvaluators](self, "cancelCandidatePathEvaluators");
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (block)
    {
      -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
      id v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      nw_path_evaluator_set_cancel_handler(v5, block);
    }

    -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_cancel(v6);

    -[NWCandidatePathMonitor setPrimaryEvaluator:](self, "setPrimaryEvaluator:", 0LL);
    goto LABEL_8;
  }

  -[NWCandidatePathMonitor queue](self, "queue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = block;
  if (block && v7)
  {
    -[NWCandidatePathMonitor queue](self, "queue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, block);

LABEL_8:
    v8 = block;
  }
}

- (id)interfacesLocked
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NWCandidatePathMonitor primaryEvaluator](self, "primaryEvaluator");
  id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock(v5 + 24);
    id v7 = (nw_path *)v6[6];
    os_unfair_lock_unlock(v5 + 24);
  }

  else
  {
    id v7 = 0LL;
  }

  enumerate_block[0] = MEMORY[0x1895F87A8];
  enumerate_block[1] = 3221225472LL;
  enumerate_block[2] = __42__NWCandidatePathMonitor_interfacesLocked__block_invoke;
  enumerate_block[3] = &unk_189BB9F60;
  id v8 = v3;
  id v11 = v8;
  nw_path_enumerate_interfaces(v7, enumerate_block);

  return v8;
}

- (NSArray)interfaces
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  os_log_type_t v14 = __Block_byref_object_copy__26786;
  os_log_type_t v15 = __Block_byref_object_dispose__26787;
  id v16 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  id v7 = __36__NWCandidatePathMonitor_interfaces__block_invoke;
  id v8 = &unk_189BC9210;
  id v9 = self;
  int v10 = &v11;
  v2 = self;
  id v3 = v6;
  os_unfair_lock_lock(&v2->lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(&v2->lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

- (NSArray)candidatePaths
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __40__NWCandidatePathMonitor_candidatePaths__block_invoke;
  v9[3] = &unk_189BC9238;
  v9[4] = self;
  id v4 = v3;
  v9[5] = v4;
  p_locid k = &self->lock;
  id v6 = self;
  os_unfair_lock_lock(p_lock);
  __40__NWCandidatePathMonitor_candidatePaths__block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(p_lock);

  id v7 = (NSArray *)v4;
  return v7;
}

- (void)updateRemoteEndpoints:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke;
    v16[3] = &unk_189BC9238;
    v16[4] = self;
    id v6 = v4;
    v16[5] = v6;
    p_locid k = &self->lock;
    id v8 = self;
    os_unfair_lock_lock(p_lock);
    __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke((uint64_t)v16);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_3;
  }

  __nwlog_obj();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
  int v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v18 = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v10, &v18, &v17))
  {
    if (v18 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = v18;
      if (os_log_type_enabled(v11, v18))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v13 = "%{public}s called with null remoteEndpoints";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = v18;
        BOOL v15 = os_log_type_enabled(v11, v18);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
            __int16 v21 = 2082;
            BOOL v22 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null remoteEndpoints, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v15) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v13 = "%{public}s called with null remoteEndpoints, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = v18;
      if (os_log_type_enabled(v11, v18))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v13 = "%{public}s called with null remoteEndpoints, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (OS_nw_path_evaluator)primaryEvaluator
{
  return self->_primaryEvaluator;
}

- (void)setPrimaryEvaluator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)remoteEndpoints
{
  return self->_remoteEndpoints;
}

- (void)setRemoteEndpoints:(id)a3
{
}

- (NSMutableDictionary)candidatePathEvaluators
{
  return self->_candidatePathEvaluators;
}

- (void)setCandidatePathEvaluators:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetCandidatePathEvaluators];
}

void __40__NWCandidatePathMonitor_candidatePaths__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  [*(id *)(a1 + 32) interfacesLocked];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v2 = 0LL;
      do
      {
        if (*(void *)v26 != v18)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }

        uint64_t v20 = v2;
        uint64_t v4 = *(void *)(*((void *)&v25 + 1) + 8 * v2);
        [*(id *)(a1 + 32) candidatePathEvaluators];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 objectForKeyedSubscript:v4];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          [v6 allKeys];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v22;
            do
            {
              for (uint64_t i = 0LL; i != v8; ++i)
              {
                if (*(void *)v22 != v9) {
                  objc_enumerationMutation(v7);
                }
                [v6 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
                uint64_t v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
                os_log_type_t v12 = v11;
                if (v11)
                {
                  uint64_t v13 = v11;
                  os_unfair_lock_lock(v12 + 24);
                  os_log_type_t v14 = (nw_path *)v13[6];
                  os_unfair_lock_unlock(v12 + 24);
                }

                else
                {
                  os_log_type_t v14 = 0LL;
                }

                if (nw_path_get_status(v14) != nw_path_status_unsatisfied)
                {
                  BOOL v15 = *(void **)(a1 + 40);
                  id v16 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v14);
                  [v15 addObject:v16];
                }
              }

              uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v8);
          }
        }

        uint64_t v2 = v20 + 1;
      }

      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v19);
  }
}

void __36__NWCandidatePathMonitor_interfaces__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfacesLocked];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __42__NWCandidatePathMonitor_interfacesLocked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);

  [v2 addObject:v4];
  return 1LL;
}

void __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    void v6[2] = __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2;
    v6[3] = &unk_189BC93A0;
    id v3 = (os_unfair_lock_s *)WeakRetained;
    v6[4] = v3;
    os_unfair_lock_lock(v3 + 2);
    __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2((uint64_t)v6);
    os_unfair_lock_unlock(v3 + 2);
    -[os_unfair_lock_s updateHandler](v3, "updateHandler");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[os_unfair_lock_s updateHandler](v3, "updateHandler");
      id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0LL);
    }
  }
}

uint64_t __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetCandidatePathEvaluators];
}

uint64_t __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);

  [v2 addObject:v4];
  return 1LL;
}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained updateHandler];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    id WeakRetained = v4;
    if (v2)
    {
      [v4 updateHandler];
      id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0LL);

      id WeakRetained = v4;
    }
  }
}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained updateHandler];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    id WeakRetained = v4;
    if (v2)
    {
      [v4 updateHandler];
      id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0LL);

      id WeakRetained = v4;
    }
  }
}

void __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  [*(id *)(a1 + 32) candidatePathEvaluators];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  obuint64_t j = v3;
  uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        [*(id *)(a1 + 32) candidatePathEvaluators];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 objectForKeyedSubscript:v6];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        [v8 allKeys];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0LL; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * j);
              [v8 objectForKeyedSubscript:v14];
              BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
              nw_path_evaluator_cancel(v15);
              [v8 setObject:0 forKeyedSubscript:v14];
            }

            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v11);
        }

        [*(id *)(a1 + 32) candidatePathEvaluators];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:0 forKeyedSubscript:v6];
      }

      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v18);
  }
}

@end