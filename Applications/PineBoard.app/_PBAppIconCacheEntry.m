@interface _PBAppIconCacheEntry
- (NSString)bundleIdentifier;
- (_PBAppIconCacheEntry)init;
- (_PBAppIconCacheEntry)initWithBundleIdentifier:(id)a3;
- (id)cacheKeyForScale:(double)a3;
- (void)setCacheKey:(id)a3 forScale:(double)a4;
@end

@implementation _PBAppIconCacheEntry

- (_PBAppIconCacheEntry)init
{
  return 0LL;
}

- (_PBAppIconCacheEntry)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____PBAppIconCacheEntry;
  v5 = -[_PBAppIconCacheEntry init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cacheKeyByScale = v5->_cacheKeyByScale;
    v5->_cacheKeyByScale = v8;
  }

  return v5;
}

- (id)cacheKeyForScale:(double)a3
{
  cacheKeyByScale = self->_cacheKeyByScale;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cacheKeyByScale, "objectForKey:", v4));

  return v5;
}

- (void)setCacheKey:(id)a3 forScale:(double)a4
{
  cacheKeyByScale = self->_cacheKeyByScale;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  -[NSMutableDictionary setObject:forKey:](cacheKeyByScale, "setObject:forKey:", v6, v7);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end