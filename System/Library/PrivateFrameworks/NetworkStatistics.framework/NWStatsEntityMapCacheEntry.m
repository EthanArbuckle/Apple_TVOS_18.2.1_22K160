@interface NWStatsEntityMapCacheEntry
- (NSDate)expiryTime;
- (NSObject)entityName;
- (id)description;
- (void)setEntityName:(id)a3;
- (void)setExpiryTime:(id)a3;
@end

@implementation NWStatsEntityMapCacheEntry

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[NWStatsEntityMapCacheEntry expiryTime](self, "expiryTime");
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  v7 = -[NWStatsEntityMapCacheEntry entityName](self, "entityName");
  v8 = (void *)[v3 initWithFormat:@"CacheEntry expiryTime %f, --> %@", v6, v7];

  return v8;
}

- (NSDate)expiryTime
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setExpiryTime:(id)a3
{
}

- (NSObject)entityName
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEntityName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end