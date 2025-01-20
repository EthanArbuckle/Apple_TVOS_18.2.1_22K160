@interface _PBOverlayLayoutLevelOcclusionAssertion
- (NSString)description;
- (NSString)reason;
- (_PBOverlayLayoutLevelOcclusionAssertion)initWithController:(id)a3 layoutLevel:(int64_t)a4 reason:(id)a5;
- (_PBOverlayLayoutLevelOcclusionController)controller;
- (id)stateDumpBuilder;
- (int64_t)layoutLevel;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithTransitionContext:(id)a3;
@end

@implementation _PBOverlayLayoutLevelOcclusionAssertion

- (_PBOverlayLayoutLevelOcclusionAssertion)initWithController:(id)a3 layoutLevel:(int64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____PBOverlayLayoutLevelOcclusionAssertion;
  v10 = -[_PBOverlayLayoutLevelOcclusionAssertion init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_lock_controller, v8);
    v11->_layoutLevel = a4;
    v12 = (NSString *)[v9 copy];
    reason = v11->_reason;
    v11->_reason = v12;
  }

  return v11;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_controller);
  os_unfair_lock_unlock(p_lock);
  if (WeakRetained)
  {
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client code must invalidate <%@:%p> before dealloc",  objc_opt_class(self),  self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B82C();
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____PBOverlayLayoutLevelOcclusionAssertion;
    -[_PBOverlayLayoutLevelOcclusionAssertion dealloc](&v7, "dealloc");
  }

- (void)invalidate
{
}

- (void)invalidateWithTransitionContext:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_controller);
  objc_storeWeak((id *)&self->_lock_controller, 0LL);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained) {
    [WeakRetained occlusionAssertion:self didInvalidateWithTransitionContext:v4];
  }
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  uint64_t v4 = sub_1001A3184(self->_layoutLevel);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:@"layoutLevel"];

  [v3 appendString:self->_reason withName:@"reason"];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendInteger:self->_layoutLevel withKey:@"layoutLevel"];
  id v5 = [v3 appendString:self->_reason withKey:@"reason"];
  return v3;
}

- (_PBOverlayLayoutLevelOcclusionController)controller
{
  return (_PBOverlayLayoutLevelOcclusionController *)objc_loadWeakRetained((id *)&self->_lock_controller);
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (NSString)reason
{
  return self->_reason;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end