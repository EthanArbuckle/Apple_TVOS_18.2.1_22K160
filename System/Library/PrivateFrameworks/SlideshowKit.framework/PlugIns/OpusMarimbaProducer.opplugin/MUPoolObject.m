@interface MUPoolObject
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
+ (BOOL)clearVars;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)pooledClasses;
+ (int64_t)clearPool;
+ (void)clearAllPools;
- (void)release;
@end

@implementation MUPoolObject

+ (id)pooledClasses
{
  id result = (id)qword_2B0488;
  if (!qword_2B0488)
  {
    id result = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    qword_2B0488 = (uint64_t)result;
  }

  return result;
}

+ (void)clearAllPools
{
  v2 = (void *)qword_2B0488;
  objc_sync_enter((id)qword_2B0488);
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = +[MUPoolObject pooledClasses](&OBJC_CLASS___MUPoolObject, "pooledClasses", 0LL);
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[objc_class clearPool](NSClassFromString(*(NSString **)(*((void *)&v7 + 1) + 8LL * (void)v6)), "clearPool");
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

  objc_msgSend(+[MUPoolObject pooledClasses](MUPoolObject, "pooledClasses"), "removeAllObjects");
  objc_sync_exit(v2);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v4 = (void *)qword_2B0488;
  objc_sync_enter((id)qword_2B0488);
  __int128 v7 = objc_msgSend((id)objc_opt_class(a1, v5), "poolInfo");
  if (!*v7)
  {
    *__int128 v7 = objc_opt_class(a1, v6);
    v7[1] = 0LL;
    *((_BYTE *)v7 + 24) = objc_msgSend((id)objc_opt_class(a1, v8), "clearVars");
    v7[2] = objc_alloc_init(&OBJC_CLASS___NSObject);
    *((_BYTE *)v7 + 25) = 0;
    objc_msgSend( +[MUPoolObject pooledClasses](MUPoolObject, "pooledClasses"),  "addObject:",  NSStringFromClass((Class)*v7));
  }

  objc_sync_exit(v4);
  __int128 v9 = (void *)v7[2];
  objc_sync_enter(v9);
  __int128 v10 = (void *)v7[1];
  if (v10)
  {
    v7[1] = v10[1];
    if (*((_BYTE *)v7 + 24))
    {
      size_t v11 = malloc_size(v10);
      bzero(v10 + 2, v11 - 16);
    }

    id v12 = v10;
  }

  else
  {
    id v12 = NSAllocateObject((Class)a1, 0LL, 0LL);
  }

  objc_sync_exit(v9);
  if (v10) {
    return v10;
  }
  else {
    return v12;
  }
}

- (void)release
{
  id v3 = (void *)qword_2B0488;
  objc_sync_enter((id)qword_2B0488);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "poolInfo");
  objc_sync_exit(v3);
  if (-[MUPoolObject retainCount](self, "retainCount") == (char *)&dword_0 + 1 && !*((_BYTE *)v5 + 25))
  {
    -[MUPoolObject purge](self, "purge");
    uint64_t v6 = (void *)*((void *)v5 + 2);
    objc_sync_enter(v6);
    self->mPoolPrev = (MUPoolObject *)*((void *)v5 + 1);
    *((void *)v5 + 1) = self;
    objc_sync_exit(v6);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MUPoolObject;
    -[MUPoolObject release](&v7, "release");
  }

+ (int64_t)clearPool
{
  id v2 = objc_msgSend((id)objc_opt_class(a1, a2), "poolInfo");
  id v3 = (void *)*((void *)v2 + 2);
  objc_sync_enter(v3);
  *((_BYTE *)v2 + 25) = 1;
  uint64_t v4 = (void *)*((void *)v2 + 1);
  if (v4)
  {
    int64_t v5 = 0LL;
    do
    {
      *((void *)v2 + 1) = v4[1];
      [v4 purge];

      ++v5;
      uint64_t v4 = (void *)*((void *)v2 + 1);
    }

    while (v4);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  objc_sync_exit(v3);
  *((void *)v2 + 1) = 0LL;

  *((void *)v2 + 2) = 0LL;
  return v5;
}

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return 0LL;
}

+ (BOOL)clearVars
{
  return 1;
}

@end