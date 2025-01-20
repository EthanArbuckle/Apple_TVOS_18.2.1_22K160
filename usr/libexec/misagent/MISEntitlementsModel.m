@interface MISEntitlementsModel
- (MISEntitlementsModel)initWithDB:(id)a3;
- (int)insertEntitlement:(id)a3 forProfile:(id)a4;
- (void)emitEntitlementPredicates:(id)a3 predicateHandler:(id)a4;
@end

@implementation MISEntitlementsModel

- (MISEntitlementsModel)initWithDB:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MISEntitlementsModel;
  v5 = -[MISEntitlementsModel init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_db, v4);
    v7 = v6;
  }

  return v6;
}

- (void)emitEntitlementPredicates:(id)a3 predicateHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003F1C;
  v6[3] = &unk_100010710;
  id v7 = a4;
  id v5 = v7;
  sub_10000890C(a3, v6);
}

- (int)insertEntitlement:(id)a3 forProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004004;
  v12[3] = &unk_100010738;
  id v13 = v7;
  id v14 = v6;
  unsigned __int8 v15 = [v6 hasSuffix:@"*"];
  id v9 = v6;
  id v10 = v7;
  LODWORD(v7) = objc_msgSend( WeakRetained,  "executeQuery:withBind:withResults:",  @"INSERT OR IGNORE INTO entitlements_provisioning_cache VALUES (NULL, @uuid, @predicate, @wildcard)",  v12,  0);

  return (int)v7;
}

- (void).cxx_destruct
{
}

@end