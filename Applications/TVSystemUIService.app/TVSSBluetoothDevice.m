@interface TVSSBluetoothDevice
+ (id)deviceFromTVPSBluetoothDevice:(id)a3;
+ (id)gameControllerIdentifierFromRendererIdentifier:(id)a3;
- (BOOL)contentIsSelected;
- (BOOL)isBatteryCharging;
- (BOOL)isBatteryLevelValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)shouldShowActivityIndicator;
- (BOOL)shouldShowConnectionStateImage;
- (BOOL)supportsDisconnectRequests;
- (NSString)contentText1;
- (NSString)contentTitle;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)name;
- (NSString)rendererIdentifier;
- (TVSSBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 connectionState:(unint64_t)a6 batteryLevel:(int64_t)a7 flags:(unint64_t)a8;
- (UIImage)contentImage;
- (UIImage)contentImage1;
- (UIImage)contentImage2;
- (double)normalizedBatteryLevel;
- (id)_batteryLevelDisplayString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)batteryLevel;
- (unint64_t)connectionState;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)lowBatteryState;
- (unint64_t)type;
@end

@implementation TVSSBluetoothDevice

- (NSString)rendererIdentifier
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0LL;
  if (-[TVSSBluetoothDevice isPaired](self, "isPaired"))
  {
    v9 = -[TVSSBluetoothDevice identifier](v11, "identifier");
    v2 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Paired-",  v9);
    id v3 = v10[0];
    v10[0] = v2;
  }

  else
  {
    v8 = -[TVSSBluetoothDevice identifier](v11, "identifier");
    v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Pairable-",  v8);
    id v5 = v10[0];
    v10[0] = v4;
  }

  id v7 = v10[0];
  objc_storeStrong(v10, 0LL);
  return (NSString *)v7;
}

+ (id)gameControllerIdentifierFromRendererIdentifier:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  if ([location[0] hasPrefix:@"Paired-"])
  {
    id v3 = objc_msgSend(location[0], "substringFromIndex:", objc_msgSend(@"Paired-", "length"));
    id v4 = v9;
    id v9 = v3;
  }

  else if ([location[0] hasPrefix:@"Pairable-"])
  {
    id v5 = objc_msgSend(location[0], "substringFromIndex:", objc_msgSend(@"Pairable-", "length"));
    id v6 = v9;
    id v9 = v5;
  }

  id v8 = v9;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (BOOL)shouldShowActivityIndicator
{
  unint64_t v3 = -[TVSSBluetoothDevice connectionState](self, "connectionState");
  if (v3 <= 3) {
    __asm { BR              X8 }
  }

  return 0;
}

- (BOOL)shouldShowConnectionStateImage
{
  unint64_t v3 = -[TVSSBluetoothDevice connectionState](self, "connectionState");
  if (v3 <= 3) {
    __asm { BR              X8 }
  }

  return 0;
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"gamecontroller.fill",  a2,  self);
}

- (UIImage)contentImage1
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  unint64_t v4 = -[TVSSBluetoothDevice connectionState](self, "connectionState");
  if (v4 <= 1) {
    goto LABEL_4;
  }
  if (v4 == 2)
  {
    objc_storeStrong(location, @"checkmark.circle.fill");
    goto LABEL_6;
  }

  if (v4 == 3) {
LABEL_4:
  }
    objc_storeStrong(location, @"circle");
LABEL_6:
  id v3 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", location[0]);
  objc_storeStrong(location, 0LL);
  return (UIImage *)v3;
}

- (UIImage)contentImage2
{
  unint64_t v4 = self;
  v3[1] = (id)a2;
  if ((id)-[TVSSBluetoothDevice connectionState](self, "connectionState") == (id)2)
  {
    if (-[TVSSBluetoothDevice isBatteryLevelValid](v4, "isBatteryLevelValid"))
    {
      -[TVSSBluetoothDevice normalizedBatteryLevel](v4, "normalizedBatteryLevel");
      v3[0] =  +[TVSSBatteryLevelImageConfiguration imageSymbolNameForBatteryLevel:]( &OBJC_CLASS___TVSSBatteryLevelImageConfiguration,  "imageSymbolNameForBatteryLevel:");
      id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v3[0]);
      objc_storeStrong(v3, 0LL);
    }

    else
    {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return (UIImage *)v5;
}

- (NSString)contentTitle
{
  return -[TVSSBluetoothDevice displayName](self, "displayName", a2, self);
}

- (NSString)contentText1
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = 0LL;
  unint64_t v4 = -[TVSSBluetoothDevice connectionState](self, "connectionState");
  if (v4 <= 3) {
    __asm { BR              X8 }
  }

  id v3 = v5[0];
  objc_storeStrong(v5, 0LL);
  return (NSString *)v3;
}

- (BOOL)contentIsSelected
{
  return -[TVSSBluetoothDevice isPaired](self, "isPaired", a2, self);
}

- (id)_batteryLevelDisplayString
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = 0LL;
  if (-[TVSSBluetoothDevice isBatteryLevelValid](self, "isBatteryLevelValid"))
  {
    id v7 = -[TVSSBluetoothDevice batteryLevel](v9, "batteryLevel");
    id v6 = TVSSLocString(@"TVSSGameControllersBatteryLevelFormat");
    v2 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7);
    id v3 = v8[0];
    v8[0] = v2;
  }

  id v5 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v5;
}

+ (id)deviceFromTVPSBluetoothDevice:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v13 = 0LL;
  id v8 = [location[0] type];
  if (v8 == (id)1)
  {
    uint64_t v13 = 1LL;
  }

  else if (v8 == (id)4)
  {
    uint64_t v13 = 2LL;
  }

  if (v13)
  {
    id v7 = [location[0] state];
    if ((unint64_t)v7 <= 3) {
      __asm { BR              X8 }
    }

    uint64_t v11 = 4LL;
    uint64_t v10 = -1LL;
    if (TVPSBluetoothDeviceIsValidBatteryLevel([location[0] batteryLevel])) {
      uint64_t v10 = (uint64_t)[location[0] batteryLevel];
    }
    unint64_t v4 = objc_alloc(&OBJC_CLASS___TVSSBluetoothDevice);
    id v6 = [location[0] uniqueIdentifier];
    id v5 = [location[0] name];
    id v9 = -[TVSSBluetoothDevice initWithIdentifier:name:type:connectionState:batteryLevel:flags:]( v4,  "initWithIdentifier:name:type:connectionState:batteryLevel:flags:",  v6);

    id v15 = v9;
    int v12 = 1;
    objc_storeStrong(&v9, 0LL);
  }

  else
  {
    id v15 = 0LL;
    int v12 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v15;
}

- (TVSSBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 connectionState:(unint64_t)a6 batteryLevel:(int64_t)a7 flags:(unint64_t)a8
{
  v65 = self;
  SEL v64 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v62 = 0LL;
  objc_storeStrong(&v62, a4);
  unint64_t v61 = a5;
  unint64_t v60 = a6;
  int64_t v59 = a7;
  unint64_t v58 = a8;
  id v57 = location;
  id v56 = 0LL;
  Class v55 = NSClassFromString(@"NSString");
  if (!v57)
  {
    id v54 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v31 = type;
      v33 = NSStringFromSelector(v64);
      v29 = v33;
      v51 = v29;
      id v8 = (objc_class *)objc_opt_class(v65);
      v32 = NSStringFromClass(v8);
      v50 = v32;
      sub_10000583C( (uint64_t)v68,  (uint64_t)v29,  (uint64_t)v50,  (uint64_t)v65,  (uint64_t)@"TVSSBluetoothDevice.m",  67,  (uint64_t)v54);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v31,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v68,  0x3Au);

      objc_storeStrong((id *)&v50, 0LL);
      objc_storeStrong((id *)&v51, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v54 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F81A0LL);
  }

  if (((objc_opt_isKindOfClass(v57, v55) ^ 1) & 1) != 0)
  {
    id v49 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t v48 = &_os_log_default;
    os_log_type_t v47 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v25 = v48;
      os_log_type_t v26 = v47;
      v28 = NSStringFromSelector(v64);
      v24 = v28;
      v46 = v24;
      id v9 = (objc_class *)objc_opt_class(v65);
      v27 = NSStringFromClass(v9);
      v45 = v27;
      sub_10000583C( (uint64_t)v67,  (uint64_t)v24,  (uint64_t)v45,  (uint64_t)v65,  (uint64_t)@"TVSSBluetoothDevice.m",  67,  (uint64_t)v49);
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  v26,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v67,  0x3Au);

      objc_storeStrong((id *)&v45, 0LL);
      objc_storeStrong((id *)&v46, 0LL);
    }

    objc_storeStrong((id *)&v48, 0LL);
    _bs_set_crash_log_message([v49 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F8358LL);
  }

  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  if (v59 < 0 || (BOOL v23 = 1, v59 > 100)) {
    BOOL v23 = v59 < 0;
  }
  if (!v23)
  {
    id v44 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"(batteryLevel >= 0 && batteryLevel <= 100) || batteryLevel < 0");
    os_log_t v43 = &_os_log_default;
    os_log_type_t v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v19 = v43;
      os_log_type_t v20 = v42;
      v22 = NSStringFromSelector(v64);
      v18 = v22;
      v41 = v18;
      uint64_t v10 = (objc_class *)objc_opt_class(v65);
      v21 = NSStringFromClass(v10);
      v40 = v21;
      sub_10000583C( (uint64_t)v66,  (uint64_t)v18,  (uint64_t)v40,  (uint64_t)v65,  (uint64_t)@"TVSSBluetoothDevice.m",  68,  (uint64_t)v44);
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  v20,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v66,  0x3Au);

      objc_storeStrong((id *)&v40, 0LL);
      objc_storeStrong((id *)&v41, 0LL);
    }

    objc_storeStrong((id *)&v43, 0LL);
    _bs_set_crash_log_message([v44 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F8570LL);
  }

  uint64_t v11 = v65;
  v65 = 0LL;
  v39.receiver = v11;
  v39.super_class = (Class)&OBJC_CLASS___TVSSBluetoothDevice;
  v65 = -[TVSSBluetoothDevice init](&v39, "init");
  objc_storeStrong((id *)&v65, v65);
  if (v65)
  {
    int v12 = (NSString *)[location copy];
    identifier = v65->_identifier;
    v65->_identifier = v12;

    v14 = (NSString *)[v62 copy];
    name = v65->_name;
    v65->_name = v14;

    v65->_os_log_type_t type = v61;
    v65->_connectionState = v60;
    v65->_flags = v58;
    v65->_batteryLevel = v59;
    if (!-[TVSSBluetoothDevice isBatteryLevelValid](v65, "isBatteryLevelValid")) {
      v65->_batteryLevel = -1LL;
    }
  }

  v17 = v65;
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  return v17;
}

- (NSString)displayName
{
  id v6 = self;
  v5[1] = (id)a2;
  if (-[NSString length](self->_name, "length"))
  {
    id v7 = v6->_name;
  }

  else
  {
    v5[0] = 0LL;
    if (v6->_type == 2) {
      id v2 = TVSSLocString(@"TVSSBluetoothUnknownGameControllerTitle");
    }
    else {
      id v2 = TVSSLocString(@"TVSSBluetoothUnknownDeviceTitle");
    }
    id v3 = v5[0];
    v5[0] = v2;

    id v7 = (NSString *)v5[0];
    objc_storeStrong(v5, 0LL);
  }

  return v7;
}

- (double)normalizedBatteryLevel
{
  if (-[TVSSBluetoothDevice isBatteryLevelValid](self, "isBatteryLevelValid")) {
    return (double)self->_batteryLevel / 100.0;
  }
  else {
    return -1.0;
  }
}

- (BOOL)isBatteryLevelValid
{
  BOOL v3 = 0;
  if (self->_batteryLevel >= 0) {
    return self->_batteryLevel <= 100;
  }
  return v3;
}

- (unint64_t)lowBatteryState
{
  if (!-[TVSSBluetoothDevice isBatteryLevelValid](self, "isBatteryLevelValid")) {
    return 0LL;
  }
  if (self->_batteryLevel > qword_100220D28)
  {
    if (self->_batteryLevel <= qword_100220D30) {
      return 2LL;
    }
    return self->_batteryLevel <= qword_100220D38;
  }

  return 3LL;
}

- (BOOL)isBatteryCharging
{
  return sub_1000F8998(self->_flags, 2LL);
}

- (BOOL)isPaired
{
  return sub_1000F8998(self->_flags, 1LL);
}

- (BOOL)supportsDisconnectRequests
{
  return sub_1000F8998(self->_flags, 4LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSBluetoothDevice succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v8[0] appendString:v9->_identifier withName:@"identifier"];
  id v3 = v8[0];
  id v4 = TVSSBluetoothDeviceTypeDescription(v9->_type);
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v8[0];
  id v6 = TVSSBluetoothDeviceConnectionStateDescription(v9->_connectionState);
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSBluetoothDevice descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = -[TVSSBluetoothDevice succinctDescriptionBuilder](v13, "succinctDescriptionBuilder");
  [v11 setActiveMultilinePrefix:location[0]];
  id v3 =  objc_msgSend( v11,  "appendBool:withName:",  -[TVSSBluetoothDevice isBatteryLevelValid](v13, "isBatteryLevelValid"),  @"isBatteryLevelValid");
  id v4 = [v11 appendInteger:v13->_batteryLevel withName:@"batteryLevel"];
  id v8 = v11;
  id v9 = TVSSBluetoothDeviceLowBatteryStateDescription(-[TVSSBluetoothDevice lowBatteryState](v13, "lowBatteryState"));
  objc_msgSend(v8, "appendString:withName:");

  id v5 =  objc_msgSend( v11,  "appendBool:withName:",  -[TVSSBluetoothDevice isBatteryCharging](v13, "isBatteryCharging"),  @"isBatteryCharging");
  id v6 =  objc_msgSend( v11,  "appendBool:withName:",  -[TVSSBluetoothDevice supportsDisconnectRequests](v13, "supportsDisconnectRequests"),  @"supportsDisconnectRequests");
  id v10 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
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
    id v49 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v50,  objc_opt_class(&OBJC_CLASS___TVSSBluetoothDevice));
    id v10 = v49;
    identifier = v53->_identifier;
    os_log_t v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_1000F91CC;
    os_log_type_t v47 = &unk_1001B6610;
    id v48 = v50;
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v10, "appendString:counterpart:", identifier, &v43);
    int v12 = v49;
    unint64_t type = v53->_type;
    v37 = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    v40 = sub_1000F91FC;
    v41 = &unk_1001B76F0;
    id v42 = v50;
    id v4 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v12, "appendUnsignedInteger:counterpart:", type, &v37);
    v14 = v49;
    unint64_t connectionState = v53->_connectionState;
    os_log_type_t v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_1000F922C;
    v35 = &unk_1001B76F0;
    id v36 = v50;
    id v5 =  -[BSEqualsBuilder appendUnsignedInteger:counterpart:]( v14,  "appendUnsignedInteger:counterpart:",  connectionState,  &v31);
    v16 = v49;
    unint64_t flags = v53->_flags;
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_1000F925C;
    v29 = &unk_1001B76F0;
    id v30 = v50;
    id v6 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v16, "appendUnsignedInteger:counterpart:", flags, &v25);
    v18 = v49;
    int64_t batteryLevel = v53->_batteryLevel;
    v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_1000F928C;
    BOOL v23 = &unk_1001B7550;
    id v24 = v50;
    id v7 = -[BSEqualsBuilder appendInteger:counterpart:](v18, "appendInteger:counterpart:", batteryLevel, &v19);
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
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v9[0] appendString:v10->_identifier];
  id v3 = [v9[0] appendUnsignedInteger:v10->_type];
  id v4 = [v9[0] appendUnsignedInteger:v10->_connectionState];
  id v5 = [v9[0] appendUnsignedInteger:v10->_flags];
  id v6 = [v9[0] appendInteger:v10->_batteryLevel];
  id v8 = [v9[0] hash];
  objc_storeStrong(v9, 0LL);
  return (unint64_t)v8;
}

- (NSString)description
{
  return (NSString *)-[TVSSBluetoothDevice succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSBluetoothDevice descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
}

@end