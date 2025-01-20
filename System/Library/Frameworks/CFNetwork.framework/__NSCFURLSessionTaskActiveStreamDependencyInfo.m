@interface __NSCFURLSessionTaskActiveStreamDependencyInfo
- (BOOL)isEmpty;
- (uint64_t)removeStreamWithStreamID:(uint64_t)a3 requestURLString:;
- (void)dealloc;
@end

@implementation __NSCFURLSessionTaskActiveStreamDependencyInfo

- (uint64_t)removeStreamWithStreamID:(uint64_t)a3 requestURLString:
{
  if (result)
  {
    uint64_t v5 = result;
    id v7 = *(id *)(v5 + 16);
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      *(void *)(v5 + 16) = v7;
    }

    objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "removeObject:", a2);
    id v8 = *(id *)(v5 + 16);
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
      *(void *)(v5 + 16) = v8;
    }

    result = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a3), "count");
    if (!result)
    {
      id v9 = *(id *)(v5 + 16);
      if (!v9)
      {
        id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
        *(void *)(v5 + 16) = v9;
      }

      result = [v9 setObject:0 forKeyedSubscript:a3];
    }

    if (*(void *)(v5 + 24))
    {
      result = +[NSURLSessionTaskDependencyTree mimeTypeForURLString:]( (uint64_t)&OBJC_CLASS___NSURLSessionTaskDependencyTree,  a3);
      if (result)
      {
        uint64_t v10 = result;
        result = [*(id *)(v5 + 24) objectForKey:result];
        if (result)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "removeObject:", a2);
          result = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "count");
          if (!result) {
            return [*(id *)(v5 + 24) setObject:0 forKeyedSubscript:v10];
          }
        }
      }
    }
  }

  return result;
}

- (BOOL)isEmpty
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(id *)(result + 16);
    if (!v2)
    {
      id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
      *(void *)(v1 + 16) = v2;
    }

    if ([v2 count])
    {
      return 0LL;
    }

    else
    {
      v3 = *(void **)(v1 + 24);
      return !v3 || [v3 count] == 0;
    }
  }

  return result;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0LL, 8LL);
    objc_setProperty_nonatomic(self, v3, 0LL, 16LL);
    objc_setProperty_nonatomic(self, v4, 0LL, 24LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFURLSessionTaskActiveStreamDependencyInfo;
  -[__NSCFURLSessionTaskActiveStreamDependencyInfo dealloc](&v5, sel_dealloc);
}

@end