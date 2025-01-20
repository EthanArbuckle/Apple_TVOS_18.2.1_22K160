@interface MSDExpireCache
- (MSDExpireCache)initWithExpiration:(double)a3;
- (MSDExpireCache)initWithExpiration:(double)a3 countLimit:(unint64_t)a4;
- (NSCache)storage;
- (double)expiration;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setExpiration:(double)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setStorage:(id)a3;
@end

@implementation MSDExpireCache

- (MSDExpireCache)initWithExpiration:(double)a3 countLimit:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDExpireCache;
  v6 = -[MSDExpireCache init](&v12, "init");
  v8 = v6;
  if (v6)
  {
    v6->_expiration = a3;
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSCache, v7);
    storage = v8->_storage;
    v8->_storage = (NSCache *)v9;

    -[NSCache setCountLimit:](v8->_storage, "setCountLimit:", a4);
  }

  return v8;
}

- (MSDExpireCache)initWithExpiration:(double)a3
{
  return -[MSDExpireCache initWithExpiration:countLimit:](self, "initWithExpiration:countLimit:", 10LL, a3);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_storage, "objectForKey:", v4));
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v5 creationTime];
    double v8 = v7;
    -[MSDExpireCache expiration](self, "expiration");
    if (v8 + v9 >= Current)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
      goto LABEL_6;
    }

    -[NSCache removeObjectForKey:](self->_storage, "removeObjectForKey:", v4);
  }

  v10 = 0LL;
LABEL_6:

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = -[_MSDExpireCacheEntry initWithValue:](objc_alloc(&OBJC_CLASS____MSDExpireCacheEntry), "initWithValue:", v7);

  -[NSCache setObject:forKey:](self->_storage, "setObject:forKey:", v8, v6);
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeAllObjects
{
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache allObjects](self->_storage, "allObjects"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSCache)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (double)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (void).cxx_destruct
{
}

@end