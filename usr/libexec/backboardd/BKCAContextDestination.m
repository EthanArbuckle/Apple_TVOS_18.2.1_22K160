@interface BKCAContextDestination
- (BKCAContextDestination)initWithContextID:(unsigned int)a3 clientPort:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendSuccinctDescriptionToFormatter:(id)a3;
@end

@implementation BKCAContextDestination

- (BKCAContextDestination)initWithContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  if (!a3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@ contextID != 0"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = [v10 autorelease];
      v13 = [self class];
      v14 = NSStringFromClass(v13);
      v15 = v14;
      *(_DWORD *)buf = 138544642;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v15;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKCAContextDestination.m";
      __int16 v32 = 1024;
      int v33 = 19;
      __int16 v34 = 2114;
      v35 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x100025FA4LL);
  }

  if (a4 + 1 <= 1)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"(((clientPort) != 0) && ((clientPort) != ((mach_port_name_t) ~0)))"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = [v17 autorelease];
      v20 = [self class];
      v21 = NSStringFromClass(v20);
      v22 = (void *)[v21 autorelease];
      *(_DWORD *)buf = 138544642;
      v25 = v18;
      __int16 v26 = 2114;
      v27 = v22;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKCAContextDestination.m";
      __int16 v32 = 1024;
      int v33 = 20;
      __int16 v34 = 2114;
      v35 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10002609CLL);
  }

  v23.receiver = self;
  v23.super_class = [BKCAContextDestination class];
  result = [BKCAContextDestination init];
  if (result)
  {
    result->_contextID = a3;
    result->_clientPort = a4;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BKHIDEventClient *v4 = [[BKHIDEventClient alloc] init];
  *((_DWORD *)v4 + 2) = self->_contextID;
  *((_DWORD *)v4 + 3) = self->_clientPort;
  objc_storeStrong((id *)v4 + 2, self->_inheritedSceneHostSettings);
  return v4;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithUnsignedInt:self->_contextID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [BKCAContextDestination class];
  id v7 = v4;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  v10 = v9;

  BOOL v11 = v10 && self->_contextID == v10[2] && self->_clientPort == v10[3];
  return v11;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (id)succinctDescription
{
  BSDescriptionStream *v3 = [[BSDescriptionStream alloc] init];
  [self appendSuccinctDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return v4;
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [v7 appendUInt64:self->_contextID withName:@"contextID" format:1];
  id v5 = [v7 appendUInt64:self->_clientPort withName:@"clientPort" format:1];
  id v6 =  [v7 appendObject:self->_inheritedSceneHostSettings withName:@"inheritedSceneHostSettings" skipIfNil:1];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100026348;
  v4[3] = &unk_1000B8030;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [v3 appendProem:v5 block:v4];
}

- (void).cxx_destruct
{
}

@end