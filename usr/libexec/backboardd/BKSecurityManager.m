@interface BKSecurityManager
+ (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4;
+ (BOOL)hasEntitlement:(id)a3 forConnection:(id)a4;
+ (id)sharedInstance;
- (BKSecurityManager)init;
- (BOOL)_lock_hasEntitlement:(id)a3 usingCacheForAuditToken:(id *)a4;
- (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4;
- (void)_processDidTerminate:(int64_t)a3;
@end

@implementation BKSecurityManager

- (BKSecurityManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKSecurityManager;
  v2 = -[BKSecurityManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lock_vpidToCacheEntry = v3->_lock_vpidToCacheEntry;
    v3->_lock_vpidToCacheEntry = v4;
  }

  return v3;
}

- (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(a4) = -[BKSecurityManager _lock_hasEntitlement:usingCacheForAuditToken:]( self,  "_lock_hasEntitlement:usingCacheForAuditToken:",  v7,  a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)_lock_hasEntitlement:(id)a3 usingCacheForAuditToken:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  __int128 v7 = *(_OWORD *)&a4->var0[4];
  v23[0] = *(_OWORD *)a4->var0;
  v23[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromAuditToken:](&OBJC_CLASS___BSAuditToken, "tokenFromAuditToken:", v23));
  id v9 = [v8 versionedPID];
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  v12 = (BKEntitlementCachePerProcessEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( lock_vpidToCacheEntry,  "objectForKey:",  v11));

  if (!v12)
  {
    v12 = objc_opt_new(&OBJC_CLASS___BKEntitlementCachePerProcessEntry);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100028154;
    v22[3] = &unk_1000B7ED8;
    v22[4] = self;
    v22[5] = v9;
    v13 = -[BSProcessDeathWatcher initWithPID:queue:deathHandler:]( [BSProcessDeathWatcher alloc],  "initWithPID:queue:deathHandler:",  [v8 pid],  &_dispatch_main_q,  v22);
    -[BKEntitlementCachePerProcessEntry setDeathWatcher:](v12, "setDeathWatcher:", v13);

    v14 = self->_lock_vpidToCacheEntry;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, v15);
  }

  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[BKEntitlementCachePerProcessEntry entitlementCache](v12, "entitlementCache"));
  if (!v16)
  {
    v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[BKEntitlementCachePerProcessEntry setEntitlementCache:](v12, "setEntitlementCache:", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v6));
  v18 = v17;
  if (v17)
  {
    LOBYTE(v19) = [v17 BOOLValue];
  }

  else
  {
    id v19 = [v8 hasEntitlement:v6];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v20, v6);
  }

  return (char)v19;
}

- (void)_processDidTerminate:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_vpidToCacheEntry, "objectForKey:", v7));

  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v11 deathWatcher]);
    [v8 invalidate];

    id v9 = self->_lock_vpidToCacheEntry;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DBFC0 != -1) {
    dispatch_once(&qword_1000DBFC0, &stru_1000B6328);
  }
  return (id)qword_1000DBFB8;
}

+ (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSecurityManager sharedInstance](&OBJC_CLASS___BKSecurityManager, "sharedInstance"));
  LOBYTE(a4) = [v6 hasEntitlement:v5 forAuditToken:a4];

  return (char)a4;
}

+ (BOOL)hasEntitlement:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  xpc_connection_get_audit_token(a4, v8);
  LOBYTE(a4) = [a1 hasEntitlement:v6 forAuditToken:v8];

  return (char)a4;
}

@end