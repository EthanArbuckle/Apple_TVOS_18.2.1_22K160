@interface ADDomainObjectCache
- (ADDomainObjectCache)init;
- (id)domainObjectForKey:(id)a3;
- (id)oldIdForKey:(id)a3;
- (void)reset;
- (void)setDomainObject:(id)a3 forKey:(id)a4;
- (void)setDomainObject:(id)a3 withOldId:(id)a4 forKey:(id)a5;
@end

@implementation ADDomainObjectCache

- (ADDomainObjectCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADDomainObjectCache;
  v2 = -[ADDomainObjectCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cacheEntriesByAceKey = v2->_cacheEntriesByAceKey;
    v2->_cacheEntriesByAceKey = v3;
  }

  return v2;
}

- (id)domainObjectForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cacheEntriesByAceKey,  "objectForKeyedSubscript:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aceDictionary]);

  return v4;
}

- (void)setDomainObject:(id)a3 withOldId:(id)a4 forKey:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_ADDomainObjectCacheEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cacheEntriesByAceKey,  "objectForKeyedSubscript:",  v9));
  if (v11)
  {
    if (!v10)
    {
      v10 = objc_alloc_init(&OBJC_CLASS____ADDomainObjectCacheEntry);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cacheEntriesByAceKey,  "setObject:forKeyedSubscript:",  v10,  v9);
    }

    -[_ADDomainObjectCacheEntry setAceDictionary:](v10, "setAceDictionary:", v11);
    if (v8) {
      -[_ADDomainObjectCacheEntry setOldId:](v10, "setOldId:", v8);
    }
  }

  else if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_cacheEntriesByAceKey, "removeObjectForKey:", v9);
  }
}

- (void)setDomainObject:(id)a3 forKey:(id)a4
{
}

- (id)oldIdForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cacheEntriesByAceKey,  "objectForKeyedSubscript:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 oldId]);

  return v4;
}

- (void)reset
{
}

- (void).cxx_destruct
{
}

@end