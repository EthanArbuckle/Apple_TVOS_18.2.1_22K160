@interface TVSContinuityCameraDevice
- (BOOL)isDedicated;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (TVSContinuityCameraDevice)initWithRPDevice:(id)a3 isDedicated:(BOOL)a4;
- (id)description;
@end

@implementation TVSContinuityCameraDevice

- (TVSContinuityCameraDevice)initWithRPDevice:(id)a3 isDedicated:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVSContinuityCameraDevice;
    v7 = -[TVSContinuityCameraDevice init](&v16, "init");
    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 persistentIdentifier]);
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v8;

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 name]);
      name = v7->_name;
      v7->_name = (NSString *)v10;

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 model]);
      model = v7->_model;
      v7->_model = (NSString *)v12;

      v7->_isDedicated = a4;
    }

    self = v7;
    v14 = self;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TVSContinuityCameraDevice *)a3;
  v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v21 = 1;
  }

  else
  {
    id v6 = v4;
    v7 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v6,  objc_opt_class(&OBJC_CLASS___TVSContinuityCameraDevice));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    identifier = self->_identifier;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10007D38C;
    v32[3] = &unk_1001919F0;
    uint64_t v10 = v6;
    v33 = v10;
    id v11 = [v8 appendString:identifier counterpart:v32];
    name = self->_name;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10007D394;
    v30[3] = &unk_1001919F0;
    v13 = v10;
    v31 = v13;
    id v14 = [v8 appendString:name counterpart:v30];
    model = self->_model;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10007D39C;
    v28[3] = &unk_1001919F0;
    objc_super v16 = v13;
    v29 = v16;
    id v17 = [v8 appendString:model counterpart:v28];
    BOOL isDedicated = self->_isDedicated;
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_10007D3A4;
    v26 = &unk_100191A18;
    v27 = v16;
    v19 = v16;
    id v20 = [v8 appendBool:isDedicated counterpart:&v23];
    unsigned __int8 v21 = objc_msgSend(v8, "isEqual", v23, v24, v25, v26);
  }

  return v21;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSContinuityCameraDevice identifier](self, "identifier"));
  id v5 = [v3 appendObject:v4 withName:@"identifier"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSContinuityCameraDevice name](self, "name"));
  [v3 appendString:v6 withName:@"name"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSContinuityCameraDevice model](self, "model"));
  [v3 appendString:v7 withName:@"model"];

  id v8 =  objc_msgSend( v3,  "appendBool:withName:",  -[TVSContinuityCameraDevice isDedicated](self, "isDedicated"),  @"isDedicated");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (BOOL)isDedicated
{
  return self->_isDedicated;
}

- (void).cxx_destruct
{
}

@end