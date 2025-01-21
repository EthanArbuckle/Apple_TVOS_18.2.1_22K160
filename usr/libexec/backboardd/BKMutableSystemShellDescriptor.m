@interface BKMutableSystemShellDescriptor
- (void)setBundleIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setJobLabel:(id)a3;
- (void)setPid:(int)a3;
- (void)setSystemIdleSleepInterval:(double)a3;
- (void)setWatchdogType:(int64_t)a3;
@end

@implementation BKMutableSystemShellDescriptor

- (void)setBundleIdentifier:(id)a3
{
  id v24 = a3;
  if (v24)
  {
    uint64_t v6 = [NSString class];
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)[v24 classForCoder];
      if (!v9) {
        v9 = [v24 class];
      }
      v11 = NSStringFromClass(v9);
      v12 = v11;
      NSString *v14 = [NSString class];
      v15 = NSStringFromClass(v14);
      v16 = v15;
      v17 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@." bundleIdentifier:v12 expectedClass:v16];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = [v18 autorelease];
        v21 = [self class];
        v22 = NSStringFromClass(v21);
        v23 = [v22 autorelease];
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        __int16 v27 = 2114;
        v28 = v23;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2114;
        v32 = @"BKSystemShellDescriptor.m";
        __int16 v33 = 1024;
        int v34 = 192;
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v17 UTF8String]);
      __break(0);
      JUMPOUT(0x100053BF0LL);
    }
  }

  v7 = (NSString *)[v24 copy];
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v7;
}

- (void)setBundlePath:(id)a3
{
  id v24 = a3;
  if (v24)
  {
    NSString *v6 = [NSString class];
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)[v24 classForCoder];
      if (!v9) {
        v9 = [v24 class];
      }
      v11 = NSStringFromClass(v9);
      v12 = v11;
      v14 = [NSString class];
      v15 = NSStringFromClass(v14);
      v16 = [v15 autorelease];
      v17 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@." bundlePath:v12 expectedClass:v16];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = [v18 autorelease];
        v21 = [self class];
        v22 = NSStringFromClass(v21);
        v23 = v22;
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        __int16 v27 = 2114;
        v28 = v23;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2114;
        v32 = @"BKSystemShellDescriptor.m";
        __int16 v33 = 1024;
        int v34 = 198;
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v17 UTF8String]);
      __break(0);
      JUMPOUT(0x100053DD8LL);
    }
  }

  v7 = (NSString *)[v24 copy];
  bundlePath = self->super._bundlePath;
  self->super._bundlePath = v7;
}

- (void)setJobLabel:(id)a3
{
  id v24 = a3;
  if (v24)
  {
    NSString *v6 = [NSString class];
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)[v24 classForCoder];
      if (!v9) {
        v9 = [v24 class];
      }
      v11 = NSStringFromClass(v9);
      v12 = [v11 autorelease];
      NSString *v14 = [NSString class];
      v15 = NSStringFromClass(v14);
      v16 = [v15 autorelease];
      NSString *v17 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"jobLabel", v12, v16];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = [v18 autorelease];
        v21 = [self class];
        v22 = NSStringFromClass(v21);
        v23 = v22;
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        __int16 v27 = 2114;
        v28 = v23;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2114;
        v32 = @"BKSystemShellDescriptor.m";
        __int16 v33 = 1024;
        int v34 = 204;
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v17 UTF8String]);
      __break(0);
      JUMPOUT(0x100053FC0LL);
    }
  }

  v7 = (NSString *)[v24 copy];
  jobLabel = self->super._jobLabel;
  self->super._jobLabel = v7;
}

- (void)setPid:(int)a3
{
  self->super._pid = a3;
}

- (void)setSystemIdleSleepInterval:(double)a3
{
  self->super._systemIdleSleepInterval = a3;
}

- (void)setWatchdogType:(int64_t)a3
{
  self->super._watchdogType = a3;
}

@end