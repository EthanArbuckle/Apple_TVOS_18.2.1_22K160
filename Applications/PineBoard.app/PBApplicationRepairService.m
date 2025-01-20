@interface PBApplicationRepairService
- (ASDRepairService)service;
- (BOOL)_addBundleID:(id)a3;
- (NSMutableSet)requestedBundleIDs;
- (PBApplicationRepairService)init;
- (PBApplicationRepairService)initWithRepairService:(id)a3;
- (id)description;
- (os_unfair_lock_s)lock;
- (unint64_t)activeRequestCount;
- (void)_removeBundleID:(id)a3;
- (void)repairApplication:(id)a3 background:(BOOL)a4 completion:(id)a5;
- (void)repairApplication:(id)a3 completion:(id)a4;
@end

@implementation PBApplicationRepairService

- (PBApplicationRepairService)initWithRepairService:(id)a3
{
  id v6 = a3;
  Class v7 = NSClassFromString(@"ASDRepairService");
  if (!v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002845F0(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1001303D4LL);
  }

  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:ASDRepairServiceClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002845F0(a2);
    }
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBApplicationRepairService;
  v8 = -[PBApplicationRepairService init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_service, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    requestedBundleIDs = v9->_requestedBundleIDs;
    v9->_requestedBundleIDs = v10;
  }

  return v9;
}

- (PBApplicationRepairService)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ASDRepairService defaultService](&OBJC_CLASS___ASDRepairService, "defaultService"));
  v4 = -[PBApplicationRepairService initWithRepairService:](self, "initWithRepairService:", v3);

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  os_unfair_lock_lock(&self->_lock);
  id v4 = [v3 appendObject:self->_requestedBundleIDs withName:0];
  os_unfair_lock_unlock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v5;
}

- (unint64_t)activeRequestCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableSet count](self->_requestedBundleIDs, "count");
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)v4;
}

- (void)repairApplication:(id)a3 completion:(id)a4
{
}

- (void)repairApplication:(id)a3 background:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  unsigned int v11 = -[PBApplicationRepairService _addBundleID:](self, "_addBundleID:", v10);
  id v12 = sub_1000F6934();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      __int16 v25 = 1024;
      BOOL v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Requesting repair {bundleID=%{public}@, isBackground=%{BOOL}d}",  buf,  0x12u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 purchaserDSID]);
    id v16 = objc_msgSend( [ASDRepairOptions alloc],  "initWithBundleID:accountIdentifier:claimStyle:",  v10,  v15,  objc_msgSend(v8, "type") == (id)2);
    [v16 setExitReason:16];
    [v16 setIsBackground:v6];
    v17 = (void *)mach_absolute_time();
    objc_initWeak((id *)buf, self);
    service = self->_service;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001307E4;
    v19[3] = &unk_1003D89D0;
    objc_copyWeak(v22, (id *)buf);
    id v20 = v10;
    v22[1] = v17;
    id v21 = v9;
    -[ASDRepairService repairAppWithOptions:replyHandler:](service, "repairAppWithOptions:replyHandler:", v16, v19);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Repair already in-flight {bundleID=%{public}@",  buf,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    }
  }
}

- (BOOL)_addBundleID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v5 = -[NSMutableSet containsObject:](self->_requestedBundleIDs, "containsObject:", v4);
  if ((v5 & 1) == 0) {
    -[NSMutableSet addObject:](self->_requestedBundleIDs, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5 ^ 1;
}

- (void)_removeBundleID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_requestedBundleIDs, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (ASDRepairService)service
{
  return self->_service;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableSet)requestedBundleIDs
{
  return self->_requestedBundleIDs;
}

- (void).cxx_destruct
{
}

  ;
}

@end