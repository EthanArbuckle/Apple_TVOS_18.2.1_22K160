@interface NWAccumulation
- (BOOL)isSnapshot;
- (NSMutableDictionary)durations;
- (NSString)currentState;
- (NSString)name;
- (NWAccumulation)initWithName:(id)a3;
- (double)lastUpdateTime;
- (id)description;
- (id)snapshot;
- (void)dealloc;
- (void)reset;
- (void)setCurrentState:(id)a3;
- (void)setDurations:(id)a3;
- (void)setIsSnapshot:(BOOL)a3;
- (void)setLastUpdateTime:(double)a3;
- (void)setName:(id)a3;
- (void)updateWithState:(id)a3 atTime:(double)a4;
@end

@implementation NWAccumulation

- (NWAccumulation)initWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NWAccumulation;
  v6 = -[NWAccumulation init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    durations = v7->_durations;
    v7->_durations = v8;

    currentState = v7->_currentState;
    v7->_currentState = 0LL;

    v7->_lastUpdateTime = 0.0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[NWAccumulation name](v7, "name");
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWAccumulation initWithName:]";
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_181A5C000, v11, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulation init %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __25__NWAccumulation_dealloc__block_invoke;
  v5[3] = &unk_189BC93A0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NWAccumulation_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWAccumulation;
  -[NWAccumulation dealloc](&v4, sel_dealloc);
}

- (id)description
{
  v3 = (void *)NSString;
  if (-[NWAccumulation isSnapshot](self, "isSnapshot")) {
    objc_super v4 = " [Snapshot]";
  }
  else {
    objc_super v4 = "";
  }
  -[NWAccumulation name](self, "name");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<NWAccumulation%s %@, states: %@>", v4, v5, self->_durations];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWithState:(id)a3 atTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (-[NWAccumulation isSnapshot](self, "isSnapshot"))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "-[NWAccumulation updateWithState:atTime:]";
      __int16 v13 = 2112;
      objc_super v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2048;
      double v18 = a4;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s %@ skipping update for snapshot (state: %@ at time %f)",  buf,  0x2Au);
    }
  }

  else
  {
    p_lock = &self->_lock;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __41__NWAccumulation_updateWithState_atTime___block_invoke;
    v10[3] = &unk_189BC75E8;
    v10[4] = self;
    id v9 = v6;
    v10[5] = v9;
    *(double *)&v10[6] = a4;
    os_unfair_lock_lock(p_lock);
    __41__NWAccumulation_updateWithState_atTime___block_invoke((uint64_t)v10);
    os_unfair_lock_unlock(p_lock);
  }
}

- (NSMutableDictionary)durations
{
  uint64_t v16 = 0LL;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__1683;
  v20 = __Block_byref_object_dispose__1684;
  id v21 = 0LL;
  p_lock = &self->_lock;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __27__NWAccumulation_durations__block_invoke;
  v15[3] = &unk_189BC9210;
  v15[4] = self;
  v15[5] = &v16;
  os_unfair_lock_lock(&self->_lock);
  __27__NWAccumulation_durations__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(p_lock);
  if (v17[5] && !-[NWAccumulation isSnapshot](self, "isSnapshot"))
  {
    uint64_t v5 = v17[5];
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    -[NWAccumulation updateWithState:atTime:](self, "updateWithState:atTime:", v5);
  }

  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy__1683;
  __int16 v13 = __Block_byref_object_dispose__1684;
  id v14 = 0LL;
  v8[0] = v4;
  v8[1] = 3221225472LL;
  v8[2] = __27__NWAccumulation_durations__block_invoke_2;
  v8[3] = &unk_189BC9210;
  v8[4] = self;
  v8[5] = &v9;
  os_unfair_lock_lock(p_lock);
  __27__NWAccumulation_durations__block_invoke_2((uint64_t)v8);
  os_unfair_lock_unlock(p_lock);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);
  return (NSMutableDictionary *)v6;
}

- (void)reset
{
  p_lock = &self->_lock;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __23__NWAccumulation_reset__block_invoke;
  v3[3] = &unk_189BC93A0;
  v3[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __23__NWAccumulation_reset__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

- (id)snapshot
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___NWAccumulation);
  -[NWAccumulation name](self, "name");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[NWAccumulation initWithName:](v3, "initWithName:", v4);

  -[NWAccumulation setIsSnapshot:](v5, "setIsSnapshot:", 1LL);
  -[NWAccumulation durations](self, "durations");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 mutableCopy];
  -[NWAccumulation setDurations:](v5, "setDurations:", v7);

  uint64_t v16 = 0LL;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__1683;
  v20 = __Block_byref_object_dispose__1684;
  id v21 = 0LL;
  uint64_t v12 = 0LL;
  __int16 v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __26__NWAccumulation_snapshot__block_invoke;
  v11[3] = &unk_189BC16A8;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  os_unfair_lock_lock(&self->_lock);
  __26__NWAccumulation_snapshot__block_invoke(v11);
  os_unfair_lock_unlock(&self->_lock);
  -[NWAccumulation setCurrentState:](v5, "setCurrentState:", v17[5]);
  -[NWAccumulation setLastUpdateTime:](v5, "setLastUpdateTime:", v13[3]);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v23 = "-[NWAccumulation snapshot]";
    __int16 v24 = 2112;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_DEBUG, "%{public}s %@ created snapshot: %@", buf, 0x20u);
  }

  uint64_t v9 = v5;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDurations:(id)a3
{
}

- (NSString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (BOOL)isSnapshot
{
  return self->_isSnapshot;
}

- (void)setIsSnapshot:(BOOL)a3
{
  self->_isSnapshot = a3;
}

- (void).cxx_destruct
{
}

double __26__NWAccumulation_snapshot__block_invoke(void *a1)
{
  double result = *(double *)(a1[4] + 40LL);
  *(double *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

uint64_t __23__NWAccumulation_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

void __27__NWAccumulation_durations__block_invoke(uint64_t a1)
{
}

void __27__NWAccumulation_durations__block_invoke_2(uint64_t a1)
{
}

void __41__NWAccumulation_updateWithState_atTime___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v2 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(char **)(a1 + 32);
    double v4 = *(double *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136446978;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    __int16 v46 = 2112;
    v47 = v3;
    __int16 v48 = 2112;
    double v49 = v4;
    __int16 v50 = 2048;
    uint64_t v51 = v5;
    _os_log_impl(&dword_181A5C000, v2, OS_LOG_TYPE_DEBUG, "%{public}s %@ new state: %@ at time %f", buf, 0x2Au);
  }

  if (!*(void *)(a1 + 40))
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v33 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v42 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state";
LABEL_52:
        _os_log_impl(&dword_181A5C000, v34, v35, v36, buf, 0xCu);
      }
    }

    else if (v42)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      BOOL v39 = os_log_type_enabled(v34, type);
      if (backtrace_string)
      {
        if (v39)
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
          __int16 v46 = 2082;
          v47 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v34,  v35,  "%{public}s called with null state, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_54:
        if (!v33) {
          return;
        }
        goto LABEL_55;
      }

      if (v39)
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, no backtrace";
        goto LABEL_52;
      }
    }

    else
    {
      __nwlog_obj();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_52;
      }
    }

void __25__NWAccumulation_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;
}

@end