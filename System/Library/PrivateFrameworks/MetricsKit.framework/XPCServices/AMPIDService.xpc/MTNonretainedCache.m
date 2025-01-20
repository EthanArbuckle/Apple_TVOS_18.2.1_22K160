@interface MTNonretainedCache
- (MTNonretainedCache)init;
- (NSMutableDictionary)cache;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objectForKeyedSubscript:(id)a3 creation:(id)a4;
- (void)setCache:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation MTNonretainedCache

- (MTNonretainedCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTNonretainedCache;
  v2 = -[MTNonretainedCache init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MTNonretainedCache setCache:](v2, "setCache:", v3);
  }

  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v5, "cache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v5, "cache"));
    [v9 setObject:0 forKeyedSubscript:v4];
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v7, "cache"));
    v9 = (MTWeakRef *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

    if (!v9)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___MTWeakRef);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v7, "cache"));
      [v10 setObject:v9 forKeyedSubscript:v6];
    }

    -[MTWeakRef setValue:](v9, "setValue:", v11);
  }

  else
  {
    v9 = (MTWeakRef *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v7, "cache"));
    -[MTWeakRef setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0LL, v6);
  }

  objc_sync_exit(v7);
}

- (id)objectForKeyedSubscript:(id)a3 creation:(id)a4
{
  id v6 = a3;
  v7 = (uint64_t (**)(void))a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v8, "cache"));
  v10 = (MTWeakRef *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (!v10)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___MTWeakRef);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTNonretainedCache cache](v8, "cache"));
    [v11 setObject:v10 forKeyedSubscript:v6];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTWeakRef value](v10, "value"));
  if (!v12)
  {
    uint64_t v13 = v7[2](v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[MTWeakRef setValue:](v10, "setValue:", v12);
  }

  objc_sync_exit(v8);
  return v12;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end