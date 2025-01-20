@interface TVSSBluetoothControllerConfiguration
+ (id)gameControllersConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)_initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TVSSBluetoothControllerConfiguration

+ (id)gameControllersConfiguration
{
  v4 = (dispatch_once_t *)&unk_100221940;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B67D8);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221938;
}

- (id)_initWithName:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSBluetoothControllerConfiguration;
  v8 = -[TVSSBluetoothControllerConfiguration init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_name, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17 == location[0])
  {
    char v18 = 1;
    int v15 = 1;
  }

  else
  {
    id v14 = location[0];
    v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSBluetoothControllerConfiguration));
    objc_super v6 = v13;
    name = v17->_name;
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_100027060;
    v11 = &unk_1001B6610;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v6, "appendString:counterpart:", name, &v7);
    char v18 = -[BSEqualsBuilder isEqual](v13, "isEqual") & 1;
    int v15 = 1;
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

- (unint64_t)hash
{
  objc_super v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendString:v6->_name];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (id)description
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v4[0] appendString:v5->_name withName:@"name"];
  id v3 = [v4[0] build];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end