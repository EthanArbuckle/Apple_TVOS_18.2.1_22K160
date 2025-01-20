@interface TVSSNetworkState
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternetAvailable;
- (BOOL)isVPNActive;
- (BOOL)isVPNConfigured;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSNetworkState)initWithActiveInterfaceType:(unint64_t)a3 internetAvailable:(BOOL)a4 wifiState:(id)a5 vpnConfigured:(BOOL)a6 vpnActive:(BOOL)a7;
- (TVSSWifiNetworkState)wifiState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activeInterfaceType;
- (unint64_t)hash;
@end

@implementation TVSSNetworkState

- (TVSSNetworkState)initWithActiveInterfaceType:(unint64_t)a3 internetAvailable:(BOOL)a4 wifiState:(id)a5 vpnConfigured:(BOOL)a6 vpnActive:(BOOL)a7
{
  v31 = self;
  SEL v30 = a2;
  unint64_t v29 = a3;
  BOOL v28 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  BOOL v26 = a6;
  BOOL v25 = a7;
  BOOL v16 = 1;
  if (location) {
    BOOL v16 = v29 == 2;
  }
  if (!v16)
  {
    v24 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"wifiState == nil || activeInterfaceType == TVSSNetworkInterfaceTypeWifi");
    id v23 = &_os_log_default;
    char v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v23;
      os_log_type_t type = v22;
      v15 = NSStringFromSelector(v30);
      v11 = v15;
      v21 = v11;
      v7 = (objc_class *)objc_opt_class(v31);
      v14 = NSStringFromClass(v7);
      v20 = v14;
      sub_10000583C( (uint64_t)v32,  (uint64_t)v11,  (uint64_t)v20,  (uint64_t)v31,  (uint64_t)@"TVSSNetworkState.m",  127,  (uint64_t)v24);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v32,  0x3Au);

      objc_storeStrong((id *)&v20, 0LL);
      objc_storeStrong((id *)&v21, 0LL);
    }

    objc_storeStrong(&v23, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v24, "UTF8String"));
    __break(0);
    JUMPOUT(0x100068890LL);
  }

  v8 = v31;
  v31 = 0LL;
  v19.receiver = v8;
  v19.super_class = (Class)&OBJC_CLASS___TVSSNetworkState;
  v31 = -[TVSSNetworkState init](&v19, "init");
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v31->_activeInterfaceType = v29;
    v31->_internetAvailable = v28;
    objc_storeStrong((id *)&v31->_wifiState, location);
    v31->_vpnConfigured = v26;
    v31->_vpnActive = v25;
  }

  v10 = v31;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  return v10;
}

- (id)succinctDescription
{
  id v3 = -[TVSSNetworkState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v6 = v9[0];
  v7 = sub_100068B44(v10->_activeInterfaceType);
  objc_msgSend(v6, "appendString:withName:");

  id v2 = [v9[0] appendBool:v10->_internetAvailable withName:@"isInternetAvailable"];
  id v3 = [v9[0] appendBool:v10->_vpnConfigured withName:@"isVPNConfigured"];
  id v4 = [v9[0] appendBool:v10->_vpnActive withName:@"isVPNActive"];
  id v8 = v9[0];
  objc_storeStrong(v9, 0LL);
  return v8;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSNetworkState descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[TVSSNetworkState succinctDescriptionBuilder](v8, "succinctDescriptionBuilder");
  [v6 setActiveMultilinePrefix:location[0]];
  id v3 = [v6 appendObject:v8->_wifiState withName:@"wifiState"];
  id v5 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v53 == location[0])
  {
    char v54 = 1;
    int v51 = 1;
  }

  else
  {
    id v50 = location[0];
    v49 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v50,  objc_opt_class(&OBJC_CLASS___TVSSNetworkState));
    v10 = v49;
    unint64_t activeInterfaceType = v53->_activeInterfaceType;
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_100069138;
    v47 = &unk_1001B76F0;
    id v48 = v50;
    id v3 =  -[BSEqualsBuilder appendUnsignedInteger:counterpart:]( v10,  "appendUnsignedInteger:counterpart:",  activeInterfaceType,  &v43);
    v12 = v49;
    BOOL internetAvailable = v53->_internetAvailable;
    v37 = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    v40 = sub_100069168;
    v41 = &unk_1001B7A30;
    id v42 = v50;
    id v4 = -[BSEqualsBuilder appendBool:counterpart:](v12, "appendBool:counterpart:", internetAvailable, &v37);
    v14 = v49;
    wifiState = v53->_wifiState;
    v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_10006919C;
    v35 = &unk_1001B60F8;
    id v36 = v50;
    id v5 = -[BSEqualsBuilder appendObject:counterpart:](v14, "appendObject:counterpart:", wifiState, &v31);
    BOOL v16 = v49;
    BOOL vpnConfigured = v53->_vpnConfigured;
    BOOL v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    BOOL v28 = sub_1000691CC;
    unint64_t v29 = &unk_1001B7A30;
    id v30 = v50;
    id v6 = -[BSEqualsBuilder appendBool:counterpart:](v16, "appendBool:counterpart:", vpnConfigured, &v25);
    v18 = v49;
    BOOL vpnActive = v53->_vpnActive;
    objc_super v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    char v22 = sub_100069200;
    id v23 = &unk_1001B7A30;
    id v24 = v50;
    id v7 = -[BSEqualsBuilder appendBool:counterpart:](v18, "appendBool:counterpart:", vpnActive, &v19);
    char v54 = -[BSEqualsBuilder isEqual](v49, "isEqual") & 1;
    int v51 = 1;
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong((id *)&v49, 0LL);
    objc_storeStrong(&v50, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v54 & 1;
}

- (unint64_t)hash
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v9[0] appendUnsignedInteger:v10->_activeInterfaceType];
  id v3 = [v9[0] appendBool:v10->_internetAvailable];
  id v4 = [v9[0] appendObject:v10->_wifiState];
  id v5 = [v9[0] appendBool:v10->_vpnConfigured];
  id v6 = [v9[0] appendBool:v10->_vpnActive];
  id v8 = [v9[0] hash];
  objc_storeStrong(v9, 0LL);
  return (unint64_t)v8;
}

- (NSString)description
{
  return (NSString *)-[TVSSNetworkState succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSNetworkState descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (unint64_t)activeInterfaceType
{
  return self->_activeInterfaceType;
}

- (BOOL)isInternetAvailable
{
  return self->_internetAvailable;
}

- (TVSSWifiNetworkState)wifiState
{
  return self->_wifiState;
}

- (BOOL)isVPNConfigured
{
  return self->_vpnConfigured;
}

- (BOOL)isVPNActive
{
  return self->_vpnActive;
}

- (void).cxx_destruct
{
}

@end