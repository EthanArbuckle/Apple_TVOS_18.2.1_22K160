@interface TVSSWifiNetworkState
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)networkName;
- (TVSSWifiNetworkState)initWithNetworkName:(id)a3 signalStrength:(float)a4;
- (float)signalStrength;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSWifiNetworkState

- (TVSSWifiNetworkState)initWithNetworkName:(id)a3 signalStrength:(float)a4
{
  v52 = self;
  SEL v51 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  float v49 = a4;
  id v48 = location;
  id v47 = 0LL;
  Class v46 = NSClassFromString(@"NSString");
  if (!v48)
  {
    id v45 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v26 = type;
      v28 = NSStringFromSelector(v51);
      v24 = v28;
      v42 = v24;
      v4 = (objc_class *)objc_opt_class(v52);
      v27 = NSStringFromClass(v4);
      v41 = v27;
      sub_10000583C( (uint64_t)v55,  (uint64_t)v24,  (uint64_t)v41,  (uint64_t)v52,  (uint64_t)@"TVSSNetworkState.m",  30,  (uint64_t)v45);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v26,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v55,  0x3Au);

      objc_storeStrong((id *)&v41, 0LL);
      objc_storeStrong((id *)&v42, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v45 UTF8String]);
    __break(0);
    JUMPOUT(0x100067B2CLL);
  }

  if (((objc_opt_isKindOfClass(v48, v46) ^ 1) & 1) != 0)
  {
    id v40 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t v39 = &_os_log_default;
    os_log_type_t v38 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v20 = v39;
      os_log_type_t v21 = v38;
      v23 = NSStringFromSelector(v51);
      v19 = v23;
      v37 = v19;
      v5 = (objc_class *)objc_opt_class(v52);
      v22 = NSStringFromClass(v5);
      v36 = v22;
      sub_10000583C( (uint64_t)v54,  (uint64_t)v19,  (uint64_t)v36,  (uint64_t)v52,  (uint64_t)@"TVSSNetworkState.m",  30,  (uint64_t)v40);
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  v21,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v54,  0x3Au);

      objc_storeStrong((id *)&v36, 0LL);
      objc_storeStrong((id *)&v37, 0LL);
    }

    objc_storeStrong((id *)&v39, 0LL);
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x100067CE4LL);
  }

  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  *(float *)&double v6 = v49;
  BOOL v18 = 0;
  if (v49 >= 0.0)
  {
    *(float *)&double v6 = v49;
    BOOL v18 = v49 <= 1.0;
  }

  if (!v18)
  {
    id v35 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  v6,  @"signalStrength >= 0 && signalStrength <= 1");
    os_log_t v34 = &_os_log_default;
    os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v14 = v34;
      os_log_type_t v15 = v33;
      v17 = NSStringFromSelector(v51);
      v13 = v17;
      v32 = v13;
      v7 = (objc_class *)objc_opt_class(v52);
      v16 = NSStringFromClass(v7);
      v31 = v16;
      sub_10000583C( (uint64_t)v53,  (uint64_t)v13,  (uint64_t)v31,  (uint64_t)v52,  (uint64_t)@"TVSSNetworkState.m",  31,  (uint64_t)v35);
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  v15,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v53,  0x3Au);

      objc_storeStrong((id *)&v31, 0LL);
      objc_storeStrong((id *)&v32, 0LL);
    }

    objc_storeStrong((id *)&v34, 0LL);
    _bs_set_crash_log_message([v35 UTF8String]);
    __break(0);
    JUMPOUT(0x100067EECLL);
  }

  v8 = v52;
  v52 = 0LL;
  v30.receiver = v8;
  v30.super_class = (Class)&OBJC_CLASS___TVSSWifiNetworkState;
  v52 = -[TVSSWifiNetworkState init](&v30, "init", v6);
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    v9 = (NSString *)[location copy];
    networkName = v52->_networkName;
    v52->_networkName = v9;

    v52->_signalStrength = v49;
  }

  v12 = v52;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v52, 0LL);
  return v12;
}

- (id)succinctDescription
{
  id v3 = -[TVSSWifiNetworkState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  double v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v5[0] appendString:v6->_networkName withName:@"networkName"];
  id v2 = [v5[0] appendFloat:@"signalStrength" withName:v6->_signalStrength];
  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSWifiNetworkState descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSWifiNetworkState succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v28 == location[0])
  {
    char v29 = 1;
    int v26 = 1;
  }

  else
  {
    id v25 = location[0];
    v24 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v25,  objc_opt_class(&OBJC_CLASS___TVSSWifiNetworkState));
    v9 = v24;
    networkName = v28->_networkName;
    BOOL v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    os_log_type_t v21 = sub_100068488;
    v22 = &unk_1001B6610;
    id v23 = v25;
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v9, "appendString:counterpart:", networkName, &v18);
    v11 = v24;
    float signalStrength = v28->_signalStrength;
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    os_log_type_t v15 = sub_1000684B8;
    v16 = &unk_1001B86E0;
    id v4 = v25;
    *(float *)&double v5 = signalStrength;
    id v17 = v4;
    id v6 = -[BSEqualsBuilder appendFloat:counterpart:](v11, "appendFloat:counterpart:", &v12, v5);
    char v29 = -[BSEqualsBuilder isEqual](v24, "isEqual") & 1;
    int v26 = 1;
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong((id *)&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v29 & 1;
}

- (unint64_t)hash
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v7[0] appendString:v8->_networkName];
  *(float *)&double v3 = v8->_signalStrength;
  id v4 = [v7[0] appendFloat:v3];
  id v6 = [v7[0] hash];
  objc_storeStrong(v7, 0LL);
  return (unint64_t)v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSWifiNetworkState succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSWifiNetworkState descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (float)signalStrength
{
  return self->_signalStrength;
}

- (void).cxx_destruct
{
}

@end