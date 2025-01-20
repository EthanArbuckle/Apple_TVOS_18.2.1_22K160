@interface TVPABluetoothRemoteBatterySnapshot
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (TVPABluetoothRemoteBatterySnapshot)init;
- (TVPABluetoothRemoteBatterySnapshot)initWithBatteryLevel:(unint64_t)a3 timestamp:(id)a4;
- (id)description;
- (unint64_t)batteryLevel;
- (unint64_t)batteryRange;
- (unint64_t)hash;
@end

@implementation TVPABluetoothRemoteBatterySnapshot

- (TVPABluetoothRemoteBatterySnapshot)init
{
  v3 = self;
  -[TVPABluetoothRemoteBatterySnapshot doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  objc_storeStrong((id *)&v3, 0LL);
  return 0LL;
}

- (TVPABluetoothRemoteBatterySnapshot)initWithBatteryLevel:(unint64_t)a3 timestamp:(id)a4
{
  v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  v4 = v12;
  v12 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS___TVPABluetoothRemoteBatterySnapshot;
  v12 = -[TVPABluetoothRemoteBatterySnapshot init](&v8, "init");
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v12->_batteryLevel = v10;
    uint64_t v5 = sub_10000CF10(v12->_batteryLevel);
    v12->_batteryRange = v5;
    objc_storeStrong((id *)&v12->_timestamp, location);
  }

  v7 = v12;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v7;
}

- (id)description
{
  SEL v11 = self;
  v10[1] = (id)a2;
  v10[0] = [[BSDescriptionBuilder alloc] initWithObject:self];
  id v5 = v10[0];
  v6 = sub_10000CFD0(-[TVPABluetoothRemoteBatterySnapshot batteryRange](v11, "batteryRange"));
  objc_msgSend(v5, "appendString:withName:");

  id v2 =  objc_msgSend( v10[0],  "appendUnsignedInteger:withName:",  -[TVPABluetoothRemoteBatterySnapshot batteryLevel](v11, "batteryLevel"),  @"batteryLevel");
  id v7 = v10[0];
  objc_super v8 = -[TVPABluetoothRemoteBatterySnapshot timestamp](v11, "timestamp");
  id v3 = objc_msgSend(v7, "appendObject:withName:");

  id v9 = [v10[0] build];
  objc_storeStrong(v10, 0LL);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v25 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVPABluetoothRemoteBatterySnapshot));
  objc_super v8 = v25;
  id v7 = -[TVPABluetoothRemoteBatterySnapshot batteryLevel](v27, "batteryLevel");
  v19[1] = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  v22 = sub_10000D768;
  v23 = &unk_1000387B0;
  id v24 = location[0];
  id v3 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v8, "appendUnsignedInteger:counterpart:", v7);
  unint64_t v10 = v25;
  id v9 = -[TVPABluetoothRemoteBatterySnapshot batteryRange](v27, "batteryRange");
  v14[1] = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_10000D798;
  v18 = &unk_1000387B0;
  v19[0] = location[0];
  id v4 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v10, "appendUnsignedInteger:counterpart:", v9);
  SEL v11 = v25;
  v12 = -[TVPABluetoothRemoteBatterySnapshot timestamp](v27, "timestamp");
  v14[0] = location[0];
  id v5 = -[BSEqualsBuilder appendObject:counterpart:](v11, "appendObject:counterpart:", v12);

  unsigned __int8 v13 = -[BSEqualsBuilder isEqual](v25, "isEqual");
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v13 & 1;
}

- (unint64_t)hash
{
  unint64_t v10 = self;
  v9[1] = (id)a2;
  v9[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 =  objc_msgSend( v9[0],  "appendUnsignedInteger:",  -[TVPABluetoothRemoteBatterySnapshot batteryLevel](v10, "batteryLevel"));
  id v3 =  objc_msgSend( v9[0],  "appendUnsignedInteger:",  -[TVPABluetoothRemoteBatterySnapshot batteryRange](v10, "batteryRange"));
  id v6 = v9[0];
  id v7 = -[TVPABluetoothRemoteBatterySnapshot timestamp](v10, "timestamp");
  id v4 = objc_msgSend(v6, "appendObject:");

  id v8 = [v9[0] hash];
  objc_storeStrong(v9, 0LL);
  return (unint64_t)v8;
}

- (unint64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (unint64_t)batteryRange
{
  return self->_batteryRange;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end