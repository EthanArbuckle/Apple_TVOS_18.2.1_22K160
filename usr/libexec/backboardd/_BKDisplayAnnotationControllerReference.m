@interface _BKDisplayAnnotationControllerReference
- (BKDisplayAnnotationController)controller;
- (_BKDisplayAnnotationControllerReference)initWithController:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)dealloc;
- (void)setController:(id)a3;
@end

@implementation _BKDisplayAnnotationControllerReference

- (_BKDisplayAnnotationControllerReference)initWithController:(id)a3
{
  v5 = (os_unfair_lock_s *)a3;
  v9.receiver = self;
  v9.super_class = [BKDisplayAnnotationControllerReference class];
  _BKDisplayAnnotationControllerReference *v6 = [[_BKDisplayAnnotationControllerReference alloc] init];
  v7 = v6;
  if (v6)
  {
    v6->_controller = a3;
    if (v5)
    {
      os_unfair_lock_lock(v5 + 8);
      ++*(void *)&v5[10]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v5 + 8);
    }
  }

  return v7;
}

- (void)dealloc
{
  controller = self->_controller;
  if (controller)
  {
    p_lock = &controller->_lock;
    os_unfair_lock_lock(&controller->_lock);
    uint64_t lock_externalReferenceCount = controller->_lock_externalReferenceCount;
    controller->_uint64_t lock_externalReferenceCount = lock_externalReferenceCount - 1;
    if (lock_externalReferenceCount <= 0)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_externalReferenceCount >= 0"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v16 = NSStringFromSelector("removeExternalReference");
        v17 = (BKDisplayAnnotationController *)[v16 autorelease];
        v19 = [controller class];
        v20 = NSStringFromClass(v19);
        v21 = [v20 autorelease];
        *(_DWORD *)buf = 138544642;
        v24 = v17;
        __int16 v25 = 2114;
        v26 = v21;
        __int16 v27 = 2048;
        v28 = controller;
        __int16 v29 = 2114;
        v30 = @"BKDisplayAnnotationController.m";
        __int16 v31 = 1024;
        int v32 = 282;
        __int16 v33 = 2114;
        v34 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v15 UTF8String]);
      __break(0);
      JUMPOUT(0x10002D8DCLL);
    }

    if (lock_externalReferenceCount == 1)
    {
      displayController = controller->_displayController;
      v7 = controller;
      if (displayController)
      {
        id v8 = sub_10003F198();
        os_log_s *v9 = [v8 autorelease];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "removing last reference to %{public}@",  buf,  0xCu);
        }

        os_unfair_lock_lock(&displayController->_lock);
        v10 = [BKDisplayAnnotationController display];
        id v11 = [v10 uniqueId];
        id v12 = [v11 length];
        v13 = (void *)BKSDisplayUUIDMainKey;
        if (v12) {
          v13 = v11;
        }
        id v14 = v13;

        [displayController->_lock_displayToAnnotationContext removeObjectForKey:v14];
        os_unfair_lock_unlock(&displayController->_lock);
      }

      [v7 _lock_invalidate];
    }

    os_unfair_lock_unlock(p_lock);
  }

  v22.receiver = self;
  v22.super_class = [BKDisplayAnnotationControllerReference class];
  [_BKDisplayAnnotationControllerReference dealloc];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_controller;
}

- (BKDisplayAnnotationController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end