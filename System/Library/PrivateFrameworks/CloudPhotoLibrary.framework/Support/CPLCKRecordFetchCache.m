@interface CPLCKRecordFetchCache
- (CPLCKRecordFetchCache)init;
- (id)cachedRecordWithID:(id)a3;
- (id)description;
- (void)didFetchRecordWithID:(id)a3 record:(id)a4;
- (void)didModifyRecordWithID:(id)a3;
- (void)resetTrackingCounts;
- (void)willFetchRecordCount:(unint64_t)a3;
@end

@implementation CPLCKRecordFetchCache

- (CPLCKRecordFetchCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLCKRecordFetchCache;
  v2 = -[CPLCKRecordFetchCache init](&v6, "init");
  if (v2)
  {
    v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  300LL);
    mapping = v2->_mapping;
    v2->_mapping = v3;
  }

  return v2;
}

- (void)didFetchRecordWithID:(id)a3 record:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", v7, v6);
}

- (id)cachedRecordWithID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", a3));
  v5 = v4;
  uint64_t v6 = 3LL;
  if (!v4) {
    uint64_t v6 = 2LL;
  }
  ++(&self->super.isa)[v6];
  id v7 = [v4 copy];

  return v7;
}

- (void)didModifyRecordWithID:(id)a3
{
  mapping = self->_mapping;
  id v5 = a3;
  id v6 = -[NSMutableDictionary count](mapping, "count");
  -[NSMutableDictionary removeObjectForKey:](self->_mapping, "removeObjectForKey:", v5);

  if (-[NSMutableDictionary count](self->_mapping, "count") != v6) {
    ++self->_dropCount;
  }
}

- (void)resetTrackingCounts
{
  *(_OWORD *)&self->_missCount = 0u;
  *(_OWORD *)&self->_dropCount = 0u;
}

- (void)willFetchRecordCount:(unint64_t)a3
{
  self->_fetchCount += a3;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"[%lu records - hit: %lu - miss: %lu - fetch: %lu - drop: %lu]",  -[NSMutableDictionary count](self->_mapping, "count"),  self->_hitCount,  self->_missCount,  self->_fetchCount,  self->_dropCount);
}

- (void).cxx_destruct
{
}

@end