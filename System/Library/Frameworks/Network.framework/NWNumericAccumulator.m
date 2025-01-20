@interface NWNumericAccumulator
- (NSMutableArray)kvoWatchers;
- (NSMutableArray)overriddenStates;
- (NSMutableDictionary)accumulations;
- (NSString)name;
- (NWNumericAccumulator)initWithName:(id)a3;
- (id)aggregatedStates;
- (id)description;
- (id)dictionaryRepresentation;
- (id)overrideStateWithName:(id)a3;
- (id)watcherForObject:(id)a3 andKeyPath:(id)a4;
- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5;
- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6;
- (void)addCount:(id)a3 toAccumulation:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5;
- (void)reset;
- (void)setAccumulations:(id)a3;
- (void)setKvoWatchers:(id)a3;
- (void)setName:(id)a3;
- (void)setOverriddenStates:(id)a3;
- (void)updateState:(id)a3 forName:(id)a4;
@end

@implementation NWNumericAccumulator

- (NWNumericAccumulator)initWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NWNumericAccumulator;
  v6 = -[NWNumericAccumulator init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(void *)&v7->_lock._os_unfair_lock_opaque = 0LL;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    kvoWatchers = v7->_kvoWatchers;
    v7->_kvoWatchers = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    overriddenStates = v7->_overriddenStates;
    v7->_overriddenStates = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    accumulations = v7->_accumulations;
    v7->_accumulations = v12;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = -[NWNumericAccumulator name](v7, "name");
      *(_DWORD *)buf = 136446466;
      v19 = "-[NWNumericAccumulator initWithName:]";
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_181A5C000, v14, OS_LOG_TYPE_DEBUG, "%{public}s NWNumericAccumulator init %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__1683;
  v25 = __Block_byref_object_dispose__1684;
  id v26 = 0LL;
  p_lock = &self->_lock;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __31__NWNumericAccumulator_dealloc__block_invoke;
  v20[3] = &unk_189BC9210;
  v20[4] = self;
  v20[5] = &v21;
  os_unfair_lock_lock(&self->_lock);
  __31__NWNumericAccumulator_dealloc__block_invoke((uint64_t)v20);
  os_unfair_lock_unlock(p_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (id)v22[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        v11[0] = v4;
        v11[1] = 3221225472LL;
        v12 = __31__NWNumericAccumulator_dealloc__block_invoke_2;
        v13 = &unk_189BC9238;
        uint64_t v14 = v9;
        v15 = self;
        os_unfair_lock_lock(&self->_kvo_lock);
        v12((uint64_t)v11);
        os_unfair_lock_unlock(&self->_kvo_lock);
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }

    while (v6);
  }

  [(id)v22[5] removeAllObjects];
  _Block_object_dispose(&v21, 8);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NWNumericAccumulator;
  -[NWNumericAccumulator dealloc](&v10, sel_dealloc);
}

- (id)description
{
  v3 = (void *)NSString;
  -[NWNumericAccumulator name](self, "name");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNumericAccumulator kvoWatchers](self, "kvoWatchers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<NWNumericAccumulator %@, NWAccumulatorKVOWatchers: %zu>", v4, objc_msgSend(v5, "count")];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)watcherForObject:(id)a3 andKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  __int16 v20 = __Block_byref_object_copy__1683;
  uint64_t v21 = __Block_byref_object_dispose__1684;
  id v22 = 0LL;
  p_lock = &self->_lock;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke;
  v13[3] = &unk_189BBE1E0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  __int128 v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)overrideStateWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__1683;
  __int128 v16 = __Block_byref_object_dispose__1684;
  id v17 = 0LL;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __46__NWNumericAccumulator_overrideStateWithName___block_invoke;
  v9[3] = &unk_189BBEEE8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  os_unfair_lock_lock(p_lock);
  __46__NWNumericAccumulator_overrideStateWithName___block_invoke(v9);
  os_unfair_lock_unlock(p_lock);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)aggregatedStates
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__1683;
  id v10 = __Block_byref_object_dispose__1684;
  id v11 = objc_alloc_init(NSString);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __40__NWNumericAccumulator_aggregatedStates__block_invoke;
  v5[3] = &unk_189BC9210;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->_lock);
  __40__NWNumericAccumulator_aggregatedStates__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addCount:(id)a3 toAccumulation:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
    id v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v26;
      if (os_log_type_enabled(v16, v26))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        __int128 v18 = "%{public}s called with null count";
LABEL_32:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v25)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v26;
      BOOL v21 = os_log_type_enabled(v16, v26);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
          __int16 v29 = 2082;
          v30 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s called with null count, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_34:
        if (!v15) {
          goto LABEL_4;
        }
LABEL_35:
        free(v15);
        goto LABEL_4;
      }

      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        __int128 v18 = "%{public}s called with null count, no backtrace";
        goto LABEL_32;
      }
    }

    else
    {
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v26;
      if (os_log_type_enabled(v16, v26))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        __int128 v18 = "%{public}s called with null count, backtrace limit exceeded";
        goto LABEL_32;
      }
    }

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v10 = (NWNumericAccumulator *)a3;
  id v11 = a4;
  id v12 = (NWNumericAccumulator *)a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v10 && v12 && v13)
  {
    -[NWNumericAccumulator watcherForObject:andKeyPath:](self, "watcherForObject:andKeyPath:", v10, v12);
    id v15 = (NWNumericAccumulator *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int128 v16 = (os_log_s *)(id)gLogObj;
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136447234;
        uint64_t v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v29 = 2112;
        v30 = v10;
        __int16 v31 = 2112;
        v32 = v12;
        __int16 v33 = 2112;
        v34 = v15;
        __int16 v35 = 2112;
        v36 = v12;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_INFO,  "%{public}s Existing NWAccumulatorKVOWatcher for object: %@ and keyPath: %@: %@, resetting %@",  buf,  0x34u);
      }

      -[NWNumericAccumulator setCallback:](v15, "setCallback:", v14);
      -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v12,  v10,  1LL);
    }

    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v29 = 2112;
        v30 = v10;
        __int16 v31 = 2112;
        v32 = v12;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_INFO,  "%{public}s Adding new NWAccumulatorKVOWatcher for object: %@ and keyPath: %@",  buf,  0x20u);
      }

      uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NWAccumulatorKVOWatcher);
      -[NWAccumulatorKVOWatcher setName:](v19, "setName:", v11);
      -[NWAccumulatorKVOWatcher setObject:](v19, "setObject:", v10);
      -[NWAccumulatorKVOWatcher setKeyPath:](v19, "setKeyPath:", v12);
      -[NWAccumulatorKVOWatcher setCallback:](v19, "setCallback:", v14);
      uint64_t v21 = MEMORY[0x1895F87A8];
      uint64_t v22 = 3221225472LL;
      BOOL v23 = __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      v24 = &unk_189BC9238;
      char v25 = self;
      os_log_type_t v26 = v19;
      __int16 v20 = v19;
      os_unfair_lock_lock(&self->_lock);
      __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v21);
      os_unfair_lock_unlock(&self->_lock);
      -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v12,  v10,  0LL,  v21,  v22,  v23,  v24,  v25,  v26);

      id v15 = 0LL;
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (NWNumericAccumulator *)(id)gLogObj;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      __int128 v18 = (NWNumericAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      uint64_t v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
      __int16 v29 = 2112;
      v30 = self;
      __int16 v31 = 2112;
      v32 = v10;
      __int16 v33 = 2112;
      v34 = v12;
      __int16 v35 = 2112;
      v36 = v18;
      _os_log_impl( &dword_181A5C000,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)",  buf,  0x34u);
    }
  }
}

- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    __nwlog_obj();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    __int16 v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    id v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (v27 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v27;
      if (os_log_type_enabled(v16, v27))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        __int128 v18 = "%{public}s called with null keyPath";
LABEL_32:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v27;
      BOOL v21 = os_log_type_enabled(v16, v27);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          __int16 v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
          __int16 v30 = 2082;
          __int16 v31 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s called with null keyPath, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_34:
        if (!v15) {
          goto LABEL_4;
        }
LABEL_35:
        free(v15);
        goto LABEL_4;
      }

      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        __int128 v18 = "%{public}s called with null keyPath, no backtrace";
        goto LABEL_32;
      }
    }

    else
    {
      __nwlog_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = v27;
      if (os_log_type_enabled(v16, v27))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        __int128 v18 = "%{public}s called with null keyPath, backtrace limit exceeded";
        goto LABEL_32;
      }
    }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  -[NWNumericAccumulator watcherForObject:andKeyPath:](self, "watcherForObject:andKeyPath:", v10, v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v11 objectForKeyedSubscript:*MEMORY[0x1896075B8]];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v12 callback];
    uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, os_log_s *))v14)[2](v14, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int128 v16 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136447490;
      __int128 v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2112;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@",  (uint8_t *)&v17,  0x3Eu);
    }

    if (v15) {
      [v12 updateWithState:v15];
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446722;
      __int128 v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2112;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = (os_log_s *)v10;
      _os_log_impl( &dword_181A5C000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s %@ did not find value for object: %@",  (uint8_t *)&v17,  0x20u);
    }
  }
}

- (void)updateState:(id)a3 forName:(id)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v41 = 136446210;
    *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v32 = 0;
    if (buf[0] == 17)
    {
      __nwlog_obj();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_181A5C000, v15, v16, "%{public}s called with null state", v41, 0xCu);
      }
    }

    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = buf[0];
      BOOL v21 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)v41 = 136446466;
          *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
          *(_WORD *)&v41[12] = 2082;
          *(void *)&v41[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v15,  v20,  "%{public}s called with null state, dumping backtrace:%{public}s",  v41,  0x16u);
        }

        free(backtrace_string);
LABEL_42:
        if (!v14) {
          goto LABEL_8;
        }
LABEL_43:
        free(v14);
        goto LABEL_8;
      }

      if (v21)
      {
        *(_DWORD *)v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_181A5C000, v15, v20, "%{public}s called with null state, no backtrace", v41, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v25 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl( &dword_181A5C000,  v15,  v25,  "%{public}s called with null state, backtrace limit exceeded",  v41,  0xCu);
      }
    }

- (void)reset
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  __int16 v19 = __Block_byref_object_copy__1683;
  os_log_type_t v20 = __Block_byref_object_dispose__1684;
  id v21 = 0LL;
  p_lock = &self->_lock;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __29__NWNumericAccumulator_reset__block_invoke;
  v15[3] = &unk_189BC9210;
  v15[4] = self;
  v15[5] = &v16;
  os_unfair_lock_lock(&self->_lock);
  __29__NWNumericAccumulator_reset__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(p_lock);
  -[NSMutableDictionary removeAllObjects](self->_accumulations, "removeAllObjects");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (id)v17[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "keyPath", (void)v11);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 object];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v9,  v10,  1LL);
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NWNumericAccumulator name](self, "name");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  p_lock = &self->_lock;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  __int128 v11 = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke;
  __int128 v12 = &unk_189BC9238;
  __int128 v13 = self;
  id v14 = v5;
  id v7 = v5;
  os_unfair_lock_lock(p_lock);
  __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, @"states", v9, v10, v11, v12, v13, v14);

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableDictionary)accumulations
{
  return self->_accumulations;
}

- (void)setAccumulations:(id)a3
{
}

- (NSMutableArray)kvoWatchers
{
  return self->_kvoWatchers;
}

- (void)setKvoWatchers:(id)a3
{
}

- (NSMutableArray)overriddenStates
{
  return self->_overriddenStates;
}

- (void)setOverriddenStates:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2;
  v4[3] = &unk_189BB61C8;
  v4[4] = v1;
  id v5 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v7 componentsSeparatedByString:@","];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (v11 == [*(id *)(*(void *)(a1 + 32) + 40) count] + v12)
  {
    v38 = a4;
    if (![v10 count])
    {
LABEL_15:
      v39[0] = MEMORY[0x1895F87A8];
      v39[1] = 3221225472LL;
      v39[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_151;
      v39[3] = &unk_189BB61A0;
      id v28 = v9;
      id v40 = v28;
      [v8 enumerateKeysAndObjectsUsingBlock:v39];
      [*(id *)(a1 + 40) addObject:v28];

      goto LABEL_35;
    }

    unint64_t v13 = 0LL;
    while (1)
    {
      unint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 32) count];
      uint64_t v15 = *(void *)(a1 + 32);
      if (v13 >= v14)
      {
        uint64_t v18 = *(void **)(v15 + 40);
        unint64_t v17 = v13 - [*(id *)(v15 + 32) count];
        uint64_t v16 = v18;
      }

      else
      {
        uint64_t v16 = *(void **)(v15 + 32);
        unint64_t v17 = v13;
      }

      [v16 objectAtIndex:v17];
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 name];
      os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue();

      [v10 objectAtIndex:v13];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v22 = (os_log_s *)(id)gLogObj;
      uint64_t v23 = v22;
      if (!v20) {
        break;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        id v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
        __int16 v45 = 2112;
        uint64_t v46 = (uint64_t)v20;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v21;
        _os_log_impl(&dword_181A5C000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Processing name %@ state %@", buf, 0x20u);
      }

      [v9 setObject:v21 forKeyedSubscript:v20];
      if (++v13 >= [v10 count]) {
        goto LABEL_15;
      }
    }

    *(_DWORD *)buf = 136446466;
    id v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
    __int16 v45 = 2112;
    uint64_t v46 = (uint64_t)v21;
    id v29 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v41 = 0;
    __int16 v30 = v38;
    if (!__nwlog_fault((const char *)v29, &type, &v41))
    {
LABEL_30:
      if (!v29)
      {
LABEL_32:
        if (v30) {
          _BYTE *v30 = 1;
        }

        goto LABEL_35;
      }

uint64_t __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_151( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __29__NWNumericAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __44__NWNumericAccumulator_updateState_forName___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
  if (v2) {
    return [v2 setState:a1[5]];
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NWAccumulatorOverrideState);
  uint64_t v5 = *(void *)(a1[7] + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(a1[7] + 8) + 40) setName:a1[4]];
  [*(id *)(*(void *)(a1[7] + 8) + 40) setState:a1[5]];
  return [*(id *)(a1[6] + 40) addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
}

uint64_t __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56)) {
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48) options:5 context:0];
}

void __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v2 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
    int v4 = 136446466;
    uint64_t v5 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]_block_invoke";
    __int16 v6 = 2048;
    uint64_t v7 = v3;
    _os_log_impl(&dword_181A5C000, v2, OS_LOG_TYPE_DEBUG, "%{public}s Now have %zu watchers", (uint8_t *)&v4, 0x16u);
  }
}

void __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = [v3 unsignedLongLongValue];
    uint64_t v6 = [*(id *)(a1 + 56) unsignedLongLongValue];
    BOOL v7 = __CFADD__(v5, v6);
    uint64_t v8 = v5 + v6;
    if (v7)
    {
      if (gLogDatapath)
      {
        __nwlog_obj();
        unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = [*(id *)(a1 + 56) unsignedLongLongValue];
          int v16 = 136446978;
          unint64_t v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
          __int16 v18 = 2082;
          __int16 v19 = "longValue";
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2048;
          uint64_t v23 = v8;
          _os_log_impl( &dword_181A5C000,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}s Overflow: %{public}s, increment %llu, result %llu",  (uint8_t *)&v16,  0x2Au);
        }
      }

      uint64_t v8 = -1LL;
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v8];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = *(id *)(a1 + 56);
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v10 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(const char **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 136447234;
    unint64_t v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
    __int16 v18 = 2112;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v9;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s New value for %@: %@ (+%@), states: %@",  (uint8_t *)&v16,  0x34u);
  }

  [v2 setObject:v9 forKeyedSubscript:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __40__NWNumericAccumulator_aggregatedStates__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        [*(id *)(*((void *)&v29 + 1) + 8 * v6) state];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v7 stringByAppendingFormat:@"%@,", v8];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v4);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 40LL);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        [*(id *)(*((void *)&v25 + 1) + 8 * v16) state];
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v17 stringByAppendingFormat:@"%@,", v18];
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        ++v16;
      }

      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v14);
  }

  uint64_t v22 = objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "substringToIndex:",  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "length") - 1);
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
  __int16 v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void __46__NWNumericAccumulator_overrideStateWithName___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1[4] + 40LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "name", (void)v10);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), v7);
          goto LABEL_11;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1[4] + 32LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_4:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      BOOL v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      objc_msgSend(v7, "object", (void)v12);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = v8;
      if (v8 == (void *)a1[5])
      {
        [v7 keyPath];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v10 isEqualToString:a1[6]];

        if (v11)
        {
          objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), v7);
          break;
        }
      }

      else
      {
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (!v4) {
          break;
        }
        goto LABEL_4;
      }
    }
  }
}

void __31__NWNumericAccumulator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0LL;
}

void __31__NWNumericAccumulator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) keyPath];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:v2 forKeyPath:v3];
}

@end