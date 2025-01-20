@interface _PBSAppState
- (BOOL)isBadgeEnabled;
- (BOOL)isRecentlyUpdated;
- (NSString)bundleIdentifier;
- (PBSBadgeValue)badgeValueWrapper;
- (_PBSAppState)initWithBundleIdentifier:(id)a3;
- (id)badgeValue;
- (void)invalidate;
- (void)setBadgeEnabled:(BOOL)a3;
- (void)setBadgeValue:(id)a3;
- (void)setRecentlyUpdated:(BOOL)a3;
@end

@implementation _PBSAppState

- (_PBSAppState)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____PBSAppState;
  v5 = -[_PBSAppState init](&v19, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[FBSApplicationDataStore storeForApplication:]( &OBJC_CLASS___FBSApplicationDataStore,  "storeForApplication:",  v4));
    store = v5->_store;
    v5->_store = (FBSApplicationDataStore *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[FBSApplicationDataStore objectForKey:](v5->_store, "objectForKey:", @"PBSAppState.badgeValue"));
    id badgeValue = v5->_badgeValue;
    v5->_id badgeValue = (id)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[PBSBadgeValue badgeValueWithValue:](&OBJC_CLASS___PBSBadgeValue, "badgeValueWithValue:", v5->_badgeValue));
    badgeValueWrapper = v5->_badgeValueWrapper;
    v5->_badgeValueWrapper = (PBSBadgeValue *)v12;

    v5->_badgeEnabled = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[FBSApplicationDataStore objectForKey:]( v5->_store,  "objectForKey:",  @"PBSAppState.badgeEnabled"));
    v15 = v14;
    if (v14) {
      v5->_badgeEnabled = [v14 BOOLValue];
    }
    unsigned int v16 = -[NSString isEqualToString:](v5->_bundleIdentifier, "isEqualToString:", @"com.apple.TVSettings");
    v5->_isTVSettings = v16;
    if (v16) {
      v5->_badgeEnabled = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[FBSApplicationDataStore objectForKey:]( v5->_store,  "objectForKey:",  @"PBSAppState.recentlyUpdated"));
    v5->_recentlyUpdated = [v17 BOOLValue];
  }

  return v5;
}

- (void)setBadgeValue:(id)a3
{
  id v5 = a3;
  id badgeValue = self->_badgeValue;
  if (badgeValue != v5 && ([badgeValue isEqual:v5] & 1) == 0)
  {
    objc_storeStrong(&self->_badgeValue, a3);
    if (v5)
    {
      v7 = (PBSBadgeValue *)objc_claimAutoreleasedReturnValue( +[PBSBadgeValue badgeValueWithValue:]( &OBJC_CLASS___PBSBadgeValue,  "badgeValueWithValue:",  v5));
      badgeValueWrapper = self->_badgeValueWrapper;
      self->_badgeValueWrapper = v7;
    }

    else
    {
      badgeValueWrapper = self->_badgeValueWrapper;
      self->_badgeValueWrapper = 0LL;
    }

    -[FBSApplicationDataStore setObject:forKey:](self->_store, "setObject:forKey:", v5, @"PBSAppState.badgeValue");
  }
}

- (void)setBadgeEnabled:(BOOL)a3
{
  if (!self->_isTVSettings && self->_badgeEnabled != a3)
  {
    self->_badgeEnabled = a3;
    store = self->_store;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
    -[FBSApplicationDataStore setObject:forKey:](store, "setObject:forKey:", v4, @"PBSAppState.badgeEnabled");
  }

- (void)setRecentlyUpdated:(BOOL)a3
{
  if (self->_recentlyUpdated != a3)
  {
    self->_recentlyUpdated = a3;
    store = self->_store;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
    -[FBSApplicationDataStore setObject:forKey:](store, "setObject:forKey:", v4, @"PBSAppState.recentlyUpdated");
  }

- (void)invalidate
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (PBSBadgeValue)badgeValueWrapper
{
  return self->_badgeValueWrapper;
}

- (id)badgeValue
{
  return self->_badgeValue;
}

- (BOOL)isBadgeEnabled
{
  return self->_badgeEnabled;
}

- (BOOL)isRecentlyUpdated
{
  return self->_recentlyUpdated;
}

- (void).cxx_destruct
{
}

@end