@interface NWAccumulator
- (NSArray)accumulations;
- (NSMutableArray)accumulatedValues;
- (NSString)name;
- (NWAccumulator)initWithName:(id)a3;
- (NWAccumulator)lastSnapshot;
- (id)accumulatedValueForObject:(id)a3 andKeyPath:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (id)snapshot;
- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5;
- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5;
- (void)reset;
- (void)setAccumulatedValues:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setName:(id)a3;
@end

@implementation NWAccumulator

- (NWAccumulator)initWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWAccumulator;
  v6 = -[NWAccumulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(void *)&v7->_lock._os_unfair_lock_opaque = 0LL;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    accumulatedValues = v7->_accumulatedValues;
    v7->_accumulatedValues = v8;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = -[NWAccumulator name](v7, "name");
      *(_DWORD *)buf = 136446466;
      v15 = "-[NWAccumulator initWithName:]";
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_181A5C000, v10, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulator init %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__1683;
  v25 = __Block_byref_object_dispose__1684;
  id v26 = 0LL;
  p_lock = &self->_lock;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __24__NWAccumulator_dealloc__block_invoke;
  v20[3] = &unk_189BC9210;
  v20[4] = self;
  v20[5] = &v21;
  os_unfair_lock_lock(&self->_lock);
  __24__NWAccumulator_dealloc__block_invoke((uint64_t)v20);
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
        v12 = __24__NWAccumulator_dealloc__block_invoke_2;
        objc_super v13 = &unk_189BC9238;
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
  v10.super_class = (Class)&OBJC_CLASS___NWAccumulator;
  -[NWAccumulator dealloc](&v10, sel_dealloc);
}

- (id)description
{
  v3 = (void *)NSString;
  -[NWAccumulator name](self, "name");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulator accumulatedValues](self, "accumulatedValues");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<NWAccumulator %@, NWAccumulations: %@>", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)accumulations
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  p_lock = &self->_lock;
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  objc_super v10 = __30__NWAccumulator_accumulations__block_invoke;
  v11 = &unk_189BC9238;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  os_unfair_lock_lock(p_lock);
  __30__NWAccumulator_accumulations__block_invoke((uint64_t)&v8);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x189603F18], "arrayWithArray:", v5, v8, v9, v10, v11, v12, v13);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)accumulatedValueForObject:(id)a3 andKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__1683;
  uint64_t v21 = __Block_byref_object_dispose__1684;
  id v22 = 0LL;
  p_lock = &self->_lock;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke;
  v13[3] = &unk_189BBE1E0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  __int128 v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v10 = (NWAccumulator *)a3;
  id v11 = a4;
  v12 = (NWAccumulator *)a5;
  id v13 = a6;
  id v14 = v13;
  if (v10 && v12 && v13)
  {
    uint64_t v15 = -[NWAccumulator accumulatedValueForObject:andKeyPath:](self, "accumulatedValueForObject:andKeyPath:", v10, v12);
    if (v15)
    {
      __int128 v16 = (NWAccumulator *)v15;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v17 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v31 = 2112;
        v32 = v10;
        __int16 v33 = 2112;
        v34 = v12;
        __int16 v35 = 2112;
        v36 = v16;
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl( &dword_181A5C000,  v17,  OS_LOG_TYPE_INFO,  "%{public}s Existing NWAccumulatedValue for object: %@ and keyPath: %@: %@, resetting %@",  buf,  0x34u);
      }

      -[NWAccumulator setCallback:](v16, "setCallback:", v14);
      -[NWAccumulator accumulation](v16, "accumulation");
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 reset];

      -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v12,  v10,  1LL);
    }

    else
    {
      v20 = objc_alloc_init(&OBJC_CLASS___NWAccumulatedValue);
      -[NWAccumulatedValue setObject:](v20, "setObject:", v10);
      -[NWAccumulatedValue setKeyPath:](v20, "setKeyPath:", v12);
      -[NWAccumulatedValue setCallback:](v20, "setCallback:", v14);
      uint64_t v21 = -[NWAccumulation initWithName:](objc_alloc(&OBJC_CLASS___NWAccumulation), "initWithName:", v11);
      -[NWAccumulatedValue setAccumulation:](v20, "setAccumulation:", v21);
      uint64_t v23 = MEMORY[0x1895F87A8];
      uint64_t v24 = 3221225472LL;
      v25 = __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      id v26 = &unk_189BC9238;
      v27 = self;
      uint64_t v28 = v20;
      id v22 = v20;
      os_unfair_lock_lock(&self->_lock);
      __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v23);
      os_unfair_lock_unlock(&self->_lock);
      -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v12,  v10,  0LL,  v23,  v24,  v25,  v26,  v27,  v28);

      __int128 v16 = 0LL;
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int128 v16 = (NWAccumulator *)(id)gLogObj;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (NWAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      v36 = v12;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl( &dword_181A5C000,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)",  buf,  0x34u);
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
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();

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
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
          v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        __int128 v18 = "%{public}s called with null keyPath, backtrace limit exceeded";
        goto LABEL_32;
      }
    }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  -[NWAccumulator accumulatedValueForObject:andKeyPath:](self, "accumulatedValueForObject:andKeyPath:", v10, v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v11 objectForKeyedSubscript:*MEMORY[0x1896075B8]];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v12 callback];
    id v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, os_log_s *))v14)[2](v14, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int128 v16 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136447490;
      uint64_t v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v20 = 2112;
      BOOL v21 = self;
      __int16 v22 = 2112;
      BOOL v23 = v13;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@",  (uint8_t *)&v18,  0x3Eu);
    }

    if (v15)
    {
      [v12 accumulation];
      os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      objc_msgSend(v17, "updateWithState:atTime:", v15);
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      uint64_t v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v20 = 2112;
      BOOL v21 = self;
      __int16 v22 = 2112;
      BOOL v23 = (os_log_s *)v10;
      _os_log_impl( &dword_181A5C000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s %@ did not find value for object: %@",  (uint8_t *)&v18,  0x20u);
    }
  }
}

- (void)reset
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NWAccumulator snapshot](self, "snapshot");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulator setLastSnapshot:](self, "setLastSnapshot:", v3);

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v4 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[NWAccumulator lastSnapshot](self, "lastSnapshot");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[NWAccumulator reset]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_181A5C000, v4, OS_LOG_TYPE_INFO, "%{public}s Reset, saved snapshot: %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  BOOL v21 = __Block_byref_object_copy__1683;
  __int16 v22 = __Block_byref_object_dispose__1684;
  id v23 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __22__NWAccumulator_reset__block_invoke;
  v18[3] = &unk_189BC9210;
  v18[4] = self;
  v18[5] = buf;
  os_unfair_lock_lock(&self->_lock);
  __22__NWAccumulator_reset__block_invoke((uint64_t)v18);
  os_unfair_lock_unlock(&self->_lock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = *(id *)(*(void *)&buf[8] + 40LL);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "accumulation", (void)v14);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 reset];

        [v10 keyPath];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 object];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]( self,  "registerObserverForKeyPath:ofObject:alreadyRegistered:",  v12,  v13,  1LL);
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v7);
  }

  _Block_object_dispose(buf, 8);
}

- (id)snapshot
{
  id v3 = objc_alloc(&OBJC_CLASS___NWAccumulator);
  -[NWAccumulator name](self, "name");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[NWAccumulator initWithName:](v3, "initWithName:", v4);

  p_lock = &self->_lock;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __25__NWAccumulator_snapshot__block_invoke;
  v10[3] = &unk_189BC9238;
  v10[4] = self;
  uint64_t v7 = v5;
  v10[5] = v7;
  os_unfair_lock_lock(p_lock);
  __25__NWAccumulator_snapshot__block_invoke((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
  uint64_t v8 = v7;

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NWAccumulator name](self, "name");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  p_lock = &self->_lock;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  id v11 = __41__NWAccumulator_dictionaryRepresentation__block_invoke;
  id v12 = &unk_189BC9238;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  os_unfair_lock_lock(p_lock);
  __41__NWAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, @"durations", v9, v10, v11, v12, v13, v14);

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NWAccumulator)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
}

- (NSMutableArray)accumulatedValues
{
  return self->_accumulatedValues;
}

- (void)setAccumulatedValues:(id)a3
{
}

- (void).cxx_destruct
{
}

void __41__NWAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32LL);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v13 + 1) + 8 * v5);
        id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v6 accumulation];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 name];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setObject:v9 forKeyedSubscript:@"name"];

        [v6 accumulation];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 durations];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setObject:v11 forKeyedSubscript:@"durations"];

        [*(id *)(a1 + 40) addObject:v7];
        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v3);
  }
}

void __25__NWAccumulator_snapshot__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "snapshot", (void)v9);
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) accumulatedValues];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v7];

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void __22__NWAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56)) {
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48) options:5 context:0];
}

uint64_t __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

void __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(void *a1)
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
      id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      objc_msgSend(v7, "object", (void)v12);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v9 = v8;
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

void __30__NWAccumulator_accumulations__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "accumulation", (void)v9);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addObject:v8];

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void __24__NWAccumulator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;
}

void __24__NWAccumulator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) keyPath];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:v2 forKeyPath:v3];
}

@end