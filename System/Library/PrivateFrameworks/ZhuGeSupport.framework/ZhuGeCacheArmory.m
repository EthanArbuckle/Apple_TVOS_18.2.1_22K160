@interface ZhuGeCacheArmory
- (BOOL)setCache:(id)a3 forKey:(id)a4 withError:(id *)a5;
- (Class)cacheType;
- (NSMutableArray)cacheList;
- (NSMutableDictionary)cacheDict;
- (NSNumber)capacity;
- (NSString)name;
- (ZhuGeCacheArmory)initWithName:(id)a3 andCapacity:(id)a4 andCacheType:(Class)a5;
- (id)getCacheForKey:(id)a3;
- (void)clearCache;
- (void)delCacheForKey:(id)a3;
@end

@implementation ZhuGeCacheArmory

- (ZhuGeCacheArmory)initWithName:(id)a3 andCapacity:(id)a4 andCacheType:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ZhuGeCacheArmory;
  v11 = -[ZhuGeCacheArmory init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    initPthreadRecursiveMutex(&v11->aRecursiveMutex);
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v12->_capacity, a4);
    objc_storeStrong((id *)&v12->_cacheType, a5);
    uint64_t v13 = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheList = v12->_cacheList;
    v12->_cacheList = (NSMutableArray *)v13;

    uint64_t v15 = objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheDict = v12->_cacheDict;
    v12->_cacheDict = (NSMutableDictionary *)v15;
  }

  return v12;
}

- (void)clearCache
{
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  v4 = -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
  [v4 removeAllObjects];
  v5 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
  [v5 removeAllObjects];

  pthread_mutex_unlock(p_aRecursiveMutex);
}

- (void)delCacheForKey:(id)a3
{
  id v9 = a3;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  if (v9)
  {
    v5 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
    int v6 = [v5 containsObject:v9];

    if (v6)
    {
      v7 = -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
      [v7 removeObjectForKey:v9];
      v8 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
      [v8 removeObject:v9];
    }
  }

  pthread_mutex_unlock(p_aRecursiveMutex);
}

- (id)getCacheForKey:(id)a3
{
  id v4 = a3;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  -[ZhuGeCacheArmory cacheList](self, "cacheList");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
    [v8 objectForKeyedSubscript:v4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ZhuGeCacheArmory cacheList](self, "cacheList");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 firstObject];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEqualToString:v4];

    if (v12)
    {
      -[ZhuGeCacheArmory cacheList](self, "cacheList");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 removeObject:v4];
      v14 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
      [v14 addObject:v4];
    }
  }

  else
  {
    id v9 = 0LL;
  }

  pthread_mutex_unlock(p_aRecursiveMutex);

  return v9;
}

- (BOOL)setCache:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  if (!a5)
  {
    v29 = -[ZhuGeCacheArmory name](self, "name");
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCacheArmory setCache:forKey:withError:]",  91LL,  @"In %@, error p-pointer is nil!",  v30,  v31,  v32,  (uint64_t)v29);

    BOOL v28 = 0;
    goto LABEL_19;
  }

  *a5 = 0LL;
  if (!v8)
  {
    v33 = -[ZhuGeCacheArmory name](self, "name");
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCacheArmory setCache:forKey:withError:]",  97LL,  @"In %@, aCache pointer is nil!",  v34,  v35,  v36,  (uint64_t)v33);
LABEL_17:

    v40 = (void *)MEMORY[0x189607870];
    uint64_t v41 = 45LL;
LABEL_18:
    [v40 errorWithZhuGeErrorCode:v41 underlyingError:0];
    BOOL v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  if (!v9)
  {
    v33 = -[ZhuGeCacheArmory name](self, "name");
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCacheArmory setCache:forKey:withError:]",  103LL,  @"In %@, aKey pointer is nil!",  v37,  v38,  v39,  (uint64_t)v33);
    goto LABEL_17;
  }
  v11 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
  int v12 = [v11 containsObject:v9];

  if (v12) {
    -[ZhuGeCacheArmory delCacheForKey:](self, "delCacheForKey:", v9);
  }
  if (-[ZhuGeCacheArmory cacheType](self, "cacheType"))
  {
    -[ZhuGeCacheArmory cacheType](self, "cacheType");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = -[ZhuGeCacheArmory name](self, "name");
      objc_opt_class();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCacheArmory setCache:forKey:withError:]",  115LL,  @"In %@, key %@ got a wrong cache class type %@!",  v44,  v45,  v46,  (uint64_t)v43);

      v40 = (void *)MEMORY[0x189607870];
      uint64_t v41 = 9LL;
      goto LABEL_18;
    }
  }

  uint64_t v13 = -[ZhuGeCacheArmory capacity](self, "capacity");
  if (v13)
  {
    v14 = (void *)v13;
    -[ZhuGeCacheArmory cacheList](self, "cacheList");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = [v15 count];
    v17 = -[ZhuGeCacheArmory capacity](self, "capacity");
    int v18 = [v17 intValue];

    if (v16 >= v18)
    {
      v19 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
      uint64_t v20 = [v19 count];
      v21 = -[ZhuGeCacheArmory capacity](self, "capacity");
      int v22 = [v21 intValue];

      if (v20 - v22 + 1 >= 1)
      {
        unint64_t v23 = v20 - v22 + 2;
        do
        {
          v24 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
          [v24 firstObject];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ZhuGeCacheArmory delCacheForKey:](self, "delCacheForKey:", v25);

          --v23;
        }

        while (v23 > 1);
      }
    }
  }
  v26 = -[ZhuGeCacheArmory cacheList](self, "cacheList");
  [v26 addObject:v9];
  v27 = -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
  [v27 setObject:v8 forKeyedSubscript:v9];

  BOOL v28 = 1;
LABEL_19:
  pthread_mutex_unlock(p_aRecursiveMutex);

  return v28;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSNumber)capacity
{
  return (NSNumber *)objc_getProperty(self, a2, 80LL, 1);
}

- (Class)cacheType
{
  return (Class)objc_getProperty(self, a2, 88LL, 1);
}

- (NSMutableArray)cacheList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSMutableDictionary)cacheDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104LL, 1);
}

- (void).cxx_destruct
{
}

@end