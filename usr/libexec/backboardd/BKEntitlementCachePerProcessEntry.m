@interface BKEntitlementCachePerProcessEntry
- (BSProcessDeathWatcher)deathWatcher;
- (NSMutableDictionary)entitlementCache;
- (void)setDeathWatcher:(id)a3;
- (void)setEntitlementCache:(id)a3;
@end

@implementation BKEntitlementCachePerProcessEntry

- (NSMutableDictionary)entitlementCache
{
  return self->_entitlementCache;
}

- (void)setEntitlementCache:(id)a3
{
}

- (BSProcessDeathWatcher)deathWatcher
{
  return self->_deathWatcher;
}

- (void)setDeathWatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end