@interface ZhuGeCache
- (BOOL)setCache:(id)a3 forKey:(id)a4 withError:(id *)a5;
- (Class)cacheType;
- (NSMutableArray)cacheList;
- (NSMutableDictionary)cacheDict;
- (NSNumber)capacity;
- (NSString)name;
- (ZhuGeCache)initWithName:(id)a3 andCapacity:(id)a4 andCacheType:(Class)a5;
- (id)getCacheForKey:(id)a3;
- (void)clearCache;
- (void)delCacheForKey:(id)a3;
@end

@implementation ZhuGeCache

- (ZhuGeCache)initWithName:(id)a3 andCapacity:(id)a4 andCacheType:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ZhuGeCache;
  v11 = -[ZhuGeCache init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    initPthreadRecursiveMutex(&v11->aRecursiveMutex);
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v12->_capacity, a4);
    objc_storeStrong((id *)&v12->_cacheType, a5);
    v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheList = v12->_cacheList;
    v12->_cacheList = v13;

    v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheDict = v12->_cacheDict;
    v12->_cacheDict = v15;
  }

  return v12;
}

- (void)clearCache
{
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheDict](self, "cacheDict"));
  [v4 removeAllObjects];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
    unsigned int v6 = [v5 containsObject:v9];

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheDict](self, "cacheDict"));
      [v7 removeObjectForKey:v9];

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
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
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheDict](self, "cacheDict"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    unsigned int v12 = [v11 isEqualToString:v4];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
      [v13 removeObject:v4];

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
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
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache name](self, "name"));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCache setCache:forKey:withError:]",  91LL,  @"In %@, error p-pointer is nil!",  v30,  v31,  v32,  (uint64_t)v29);

    BOOL v28 = 0;
    goto LABEL_19;
  }

  *a5 = 0LL;
  if (!v8)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache name](self, "name"));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCache setCache:forKey:withError:]",  97LL,  @"In %@, aCache pointer is nil!",  v34,  v35,  v36,  (uint64_t)v33);
LABEL_17:

    uint64_t v40 = 45LL;
LABEL_18:
    BOOL v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  v40,  0LL));
    goto LABEL_19;
  }

  if (!v9)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache name](self, "name"));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCache setCache:forKey:withError:]",  103LL,  @"In %@, aKey pointer is nil!",  v37,  v38,  v39,  (uint64_t)v33);
    goto LABEL_17;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
  unsigned int v12 = [v11 containsObject:v9];

  if (v12) {
    -[ZhuGeCache delCacheForKey:](self, "delCacheForKey:", v9);
  }
  if (-[ZhuGeCache cacheType](self, "cacheType")
    && (objc_opt_isKindOfClass(v8, -[ZhuGeCache cacheType](self, "cacheType")) & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache name](self, "name"));
    objc_opt_class(v8);
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m",  "-[ZhuGeCache setCache:forKey:withError:]",  115LL,  @"In %@, key %@ got a wrong cache class type %@!",  v43,  v44,  v45,  (uint64_t)v42);

    uint64_t v40 = 9LL;
    goto LABEL_18;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ZhuGeCache capacity](self, "capacity"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
    id v16 = [v15 count];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache capacity](self, "capacity"));
    signed int v18 = [v17 intValue];

    if ((unint64_t)v16 >= v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
      id v20 = [v19 count];
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache capacity](self, "capacity"));
      signed int v22 = [v21 intValue];

      if ((uint64_t)v20 - v22 + 1 >= 1)
      {
        unint64_t v23 = (unint64_t)v20 - v22 + 2;
        do
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
          -[ZhuGeCache delCacheForKey:](self, "delCacheForKey:", v25);

          --v23;
        }

        while (v23 > 1);
      }
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheList](self, "cacheList"));
  [v26 addObject:v9];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeCache cacheDict](self, "cacheDict"));
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