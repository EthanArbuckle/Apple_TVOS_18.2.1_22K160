@interface ExtractionServiceInfo
+ (id)extractionServiceInfoForPluginBundlePath:(id)a3;
- (ExtractionServiceInfo)initWithPluginBundlePath:(id)a3;
- (ExtractionServiceInfo)initWithUUID:(id)a3 pluginBundlePath:(id)a4;
- (NSString)pluginBundlePath;
- (NSUUID)uuid;
- (_opaque_pthread_cond_t)availableExtractionServiceMemoryCondition;
- (_opaque_pthread_mutex_t)availableExtractionServiceMemoryMutex;
- (id)reserveExtractionMemory:(id)a3;
- (unint64_t)availableExtractionServiceMemory;
- (void)dealloc;
- (void)extractionBecameInvalid;
- (void)releaseExtractionMemory:(id)a3;
- (void)setAvailableExtractionServiceMemory:(unint64_t)a3;
@end

@implementation ExtractionServiceInfo

+ (id)extractionServiceInfoForPluginBundlePath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v6 = (void *)_sExtractionServiceDict;
    if (_sExtractionServiceDict
      || ([MEMORY[0x189603FC8] dictionaryWithCapacity:1],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v8 = (void *)_sExtractionServiceDict,
          _sExtractionServiceDict = v7,
          v8,
          (v6 = (void *)_sExtractionServiceDict) != 0LL))
    {
      [v6 objectForKey:v4];
      v9 = (ExtractionServiceInfo *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v9 = -[ExtractionServiceInfo initWithPluginBundlePath:]( objc_alloc(&OBJC_CLASS___ExtractionServiceInfo),  "initWithPluginBundlePath:",  v4);
        if (v9) {
          [(id)_sExtractionServiceDict setValue:v9 forKey:v4];
        }
      }
    }

    else
    {
      STGetLogHandle();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:].cold.2();
      }

      v9 = 0LL;
    }

    objc_sync_exit(v5);
  }

  else
  {
    STGetLogHandle();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:].cold.1();
    }
    v9 = 0LL;
  }

  return v9;
}

- (ExtractionServiceInfo)initWithPluginBundlePath:(id)a3
{
  id v4 = (void *)MEMORY[0x189607AB8];
  id v5 = a3;
  [v4 UUID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[ExtractionServiceInfo initWithUUID:pluginBundlePath:](self, "initWithUUID:pluginBundlePath:", v6, v5);

  return v7;
}

- (ExtractionServiceInfo)initWithUUID:(id)a3 pluginBundlePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    STGetLogHandle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.1();
    }
    goto LABEL_10;
  }

  if (!v8)
  {
    STGetLogHandle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.2();
    }
LABEL_10:

LABEL_13:
    v11 = 0LL;
    goto LABEL_5;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ExtractionServiceInfo;
  v10 = -[ExtractionServiceInfo init](&v14, sel_init);
  if (!v10)
  {
    STGetLogHandle();
    self = (ExtractionServiceInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:].cold.3();
    }
    goto LABEL_13;
  }

  v11 = v10;
  objc_storeStrong((id *)&v10->_uuid, a3);
  objc_storeStrong((id *)&v11->_pluginBundlePath, a4);
  v11->_availableExtractionServiceMemory = 52428800LL;
  pthread_mutex_init(&v11->_availableExtractionServiceMemoryMutex, 0LL);
  pthread_cond_init(&v11->_availableExtractionServiceMemoryCondition, 0LL);
LABEL_5:

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ExtractionServiceInfo;
  -[ExtractionServiceInfo dealloc](&v3, sel_dealloc);
}

- (id)reserveExtractionMemory:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = [v4 requiredExtractionMemory];
  if (v5)
  {
    unint64_t v6 = v5;
    STGetLogHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v6 >= 0x3200001)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ExtractionServiceInfo reserveExtractionMemory:].cold.2();
      }

      v23 = STExtractorErrorDomain;
      objc_msgSend( NSString,  "stringWithFormat:",  @"num required bytes (%zu) > max allowed extraction memory (%d)",  v6,  52428800);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 =  STCreateError( v23,  11LL,  v24,  0LL,  (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1351LL);

      v17 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
        __int16 v28 = 2048;
        unint64_t v29 = v6;
        _os_log_impl(&dword_1884F9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %zu bytes", buf, 0x16u);
      }

      pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
      if (v6 <= [v4 reservedExtractionMemory])
      {
        v17 = 0LL;
      }

      else
      {
        unint64_t v9 = v6 - [v4 reservedExtractionMemory];
        while (self->_availableExtractionServiceMemory < v9)
        {
          if ([v4 isInvalid]) {
            break;
          }
          STGetLogHandle();
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v9;
            __int16 v30 = 2048;
            unint64_t v31 = availableExtractionServiceMemory;
            _os_log_impl( &dword_1884F9000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s: waiting for available extraction memory (need [%zu] - avail [%zu])",  buf,  0x20u);
          }

          pthread_cond_wait( &self->_availableExtractionServiceMemoryCondition,  &self->_availableExtractionServiceMemoryMutex);
          STGetLogHandle();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v13 = self->_availableExtractionServiceMemory;
            int v14 = [v4 isInvalid];
            *(_DWORD *)buf = 136446978;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v9;
            __int16 v30 = 2048;
            unint64_t v31 = v13;
            __int16 v32 = 1024;
            int v33 = v14 ^ 1;
            _os_log_impl( &dword_1884F9000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s: available memory notification (need [%zu] - avail [%zu] - isValid [%d]",  buf,  0x26u);
          }
        }

        if ([v4 isInvalid])
        {
          v15 = STExtractorErrorDomain;
          [NSString stringWithFormat:@"STRemoteExtractor became invalid while waiting for extraction memory reservation"];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          STCreateError( v15,  11LL,  v16,  0LL,  (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1374LL);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          self->_availableExtractionServiceMemory -= v9;
          objc_msgSend(v4, "setReservedExtractionMemory:", objc_msgSend(v4, "reservedExtractionMemory") + v9);
          STGetLogHandle();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v6;
            __int16 v30 = 2048;
            unint64_t v31 = v18;
            _os_log_impl( &dword_1884F9000,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Got extraction memory reservation [%zu] - %zu bytes still available",  buf,  0x20u);
          }

          v17 = 0LL;
        }
      }

      pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);
    }
  }

  else
  {
    STGetLogHandle();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo reserveExtractionMemory:].cold.1();
    }

    v21 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"required extraction memory == 0"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v21,  11LL,  v22,  0LL,  (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1350LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)releaseExtractionMemory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
  if ([v4 reservedExtractionMemory])
  {
    uint64_t v5 = [v4 reservedExtractionMemory];
    self->_availableExtractionServiceMemory += v5;
    [v4 setReservedExtractionMemory:0];
    STGetLogHandle();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
      int v8 = 136446722;
      unint64_t v9 = "-[ExtractionServiceInfo releaseExtractionMemory:]";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      unint64_t v13 = availableExtractionServiceMemory;
      _os_log_impl( &dword_1884F9000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Releasing extraction memory reservation [%zu] - %zu bytes available",  (uint8_t *)&v8,  0x20u);
    }

    pthread_cond_signal(&self->_availableExtractionServiceMemoryCondition);
  }

  pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);
}

- (void)extractionBecameInvalid
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  STGetLogHandle();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = "-[ExtractionServiceInfo extractionBecameInvalid]";
    _os_log_impl( &dword_1884F9000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Extraction invalid - signaling to allow possible thread waiting for extraction memory to return",  (uint8_t *)&v4,  0xCu);
  }

  pthread_cond_broadcast(&self->_availableExtractionServiceMemoryCondition);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)pluginBundlePath
{
  return self->_pluginBundlePath;
}

- (unint64_t)availableExtractionServiceMemory
{
  return self->_availableExtractionServiceMemory;
}

- (void)setAvailableExtractionServiceMemory:(unint64_t)a3
{
  self->_unint64_t availableExtractionServiceMemory = a3;
}

- (_opaque_pthread_mutex_t)availableExtractionServiceMemoryMutex
{
  __int128 v3 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  __int128 v4 = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (_opaque_pthread_cond_t)availableExtractionServiceMemoryCondition
{
  __int128 v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  return self;
}

- (void).cxx_destruct
{
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.1()
{
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.2()
{
}

- (void)initWithUUID:pluginBundlePath:.cold.1()
{
}

- (void)initWithUUID:pluginBundlePath:.cold.2()
{
}

- (void)initWithUUID:pluginBundlePath:.cold.3()
{
}

- (void)reserveExtractionMemory:.cold.1()
{
}

- (void)reserveExtractionMemory:.cold.2()
{
}

@end