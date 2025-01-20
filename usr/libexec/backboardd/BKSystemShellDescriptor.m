@interface BKSystemShellDescriptor
+ (BKSystemShellDescriptor)new;
+ (id)build:(id)a3;
- (BKSystemShellDescriptor)init;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)jobLabel;
- (double)systemIdleSleepInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (int)pid;
- (int64_t)watchdogType;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation BKSystemShellDescriptor

- (BKSystemShellDescriptor)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot directly allocate BKSystemShellDescriptor"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v12 = 138544642;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"BKSystemShellDescriptor.m";
    __int16 v20 = 1024;
    int v21 = 33;
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v12,  0x3Au);
  }

  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  unint64_t v4 = -[NSString hash](self->_bundlePath, "hash") ^ v3;
  unint64_t v5 = v4 ^ -[NSString hash](self->_jobLabel, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_pid));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_systemIdleSleepInterval));
  unint64_t v9 = (unint64_t)[v8 hash];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_watchdogType));
  unint64_t v11 = v7 ^ v9 ^ (unint64_t)[v10 hash];

  unint64_t v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9LL * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v11 ^ (v11 >> 30))) >> 27));
  return v12 ^ (v12 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BKSystemShellDescriptor, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    unint64_t v7 = v4;
    BOOL v8 = BSEqualObjects(v7[1], self->_bundleIdentifier)
      && BSEqualObjects(v7[2], self->_bundlePath)
      && BSEqualObjects(v7[3], self->_jobLabel)
      && *((_DWORD *)v7 + 8) == self->_pid
      && *((double *)v7 + 5) == self->_systemIdleSleepInterval
      && v7[6] == self->_watchdogType;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return sub_100054568(objc_alloc(&OBJC_CLASS___BKSystemShellDescriptor), self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return sub_100054568(objc_alloc(&OBJC_CLASS___BKMutableSystemShellDescriptor), self);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
}

- (NSString)debugDescription
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle debugStyle](&OBJC_CLASS___BSDescriptionStyle, "debugStyle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionStream descriptionForRootObject:withStyle:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:withStyle:",  self,  v3));

  return (NSString *)v4;
}

- (id)succinctDescription
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle succinctStyle](&OBJC_CLASS___BSDescriptionStyle, "succinctStyle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionStream descriptionForRootObject:withStyle:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:withStyle:",  self,  v3));

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v12 = a3;
  uint64_t v4 = BSProcessDescriptionForPID(self->_pid);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v12 appendString:v5 withName:0];

  if (([v12 hasSuccinctStyle] & 1) == 0)
  {
    id v6 = [v12 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
    id v7 = [v12 appendObject:self->_bundlePath withName:@"bundlePath"];
    id v8 = [v12 appendObject:self->_jobLabel withName:@"jobLabel"];
    id v9 =  [v12 appendDouble:@"systemIdleSleepInterval" withName:2 decimalPrecision:self->_systemIdleSleepInterval];
    int64_t watchdogType = self->_watchdogType;
    if (watchdogType)
    {
      if (watchdogType == 1) {
        unint64_t v11 = @"shell";
      }
      else {
        unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<unknown:%lX>",  self->_watchdogType));
      }
    }

    else
    {
      unint64_t v11 = @"BackBoard";
    }

    [v12 appendString:v11 withName:@"watchdogType"];
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (int)pid
{
  return self->_pid;
}

- (double)systemIdleSleepInterval
{
  return self->_systemIdleSleepInterval;
}

- (int64_t)watchdogType
{
  return self->_watchdogType;
}

- (void).cxx_destruct
{
}

+ (id)build:(id)a3
{
  NSUInteger v3 = (void (**)(id, id))a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___BKMutableSystemShellDescriptor);
  id v6 = sub_1000545FC(v4, v5);
  v3[2](v3, v6);

  id v7 = [v6 copy];
  return v7;
}

+ (BKSystemShellDescriptor)new
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot directly allocate BKSystemShellDescriptor"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v8 = (objc_class *)objc_opt_class(a1, v7);
    id v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v12 = 138544642;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    id v17 = a1;
    __int16 v18 = 2114;
    v19 = @"BKSystemShellDescriptor.m";
    __int16 v20 = 1024;
    int v21 = 38;
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v12,  0x3Au);
  }

  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

@end