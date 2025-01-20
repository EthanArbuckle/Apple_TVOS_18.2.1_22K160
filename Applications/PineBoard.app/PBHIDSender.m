@interface PBHIDSender
+ (BOOL)_isMultiButtonMFIGamePad:(__IOHIDServiceClient *)a3;
+ (id)senderCEC;
+ (id)senderIR;
+ (id)senderMediaRemote;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstParty;
- (BOOL)isMultiButtonMFIGamePad;
- (BSSettings)settings;
- (NSString)debugDescription;
- (NSString)description;
- (PBHIDSender)initWithCategory:(int64_t)a3;
- (PBHIDSender)initWithHIDServiceClient:(__IOHIDServiceClient *)a3;
- (PBHIDSender)initWithSenderID:(unint64_t)a3 category:(int64_t)a4 remoteType:(int64_t)a5 settings:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)category;
- (int64_t)remoteType;
- (unint64_t)hash;
- (unint64_t)senderID;
- (unsigned)_vendorID;
@end

@implementation PBHIDSender

+ (id)senderCEC
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008AA94;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004707D0 != -1) {
    dispatch_once(&qword_1004707D0, block);
  }
  return (id)qword_1004707C8;
}

+ (id)senderIR
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008AB3C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004707E0 != -1) {
    dispatch_once(&qword_1004707E0, block);
  }
  return (id)qword_1004707D8;
}

+ (id)senderMediaRemote
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008ABE4;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004707F0 != -1) {
    dispatch_once(&qword_1004707F0, block);
  }
  return (id)qword_1004707E8;
}

- (PBHIDSender)initWithHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (a3)
  {
    v5 = (void *)IOHIDServiceClientCopyProperties(a3, &off_1003FE698);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"VendorID"]);
    id v7 = [v6 unsignedIntValue];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"ProductID"]);
    id v9 = [v8 unsignedIntValue];

    uint64_t v10 = TVSBluetoothRemoteTypeForVendorIDAndProductID(v7, v9);
    if (v10)
    {
      uint64_t v11 = 1LL;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"DeviceUsagePage"]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 objectForKey:@"DeviceUsage"]);
      v14 = (void *)v13;
      if (v12 && v13)
      {
        unsigned int v15 = [v12 unsignedIntValue];
        unsigned int v16 = [v14 unsignedIntValue];
      }

      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PrimaryUsagePage"]);
        unsigned int v15 = [v17 unsignedIntValue];

        v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PrimaryUsage"]);
        unsigned int v16 = [v18 unsignedIntValue];
      }

      uint64_t v19 = 2LL;
      if (v15 != 1 || v16 != 5) {
        uint64_t v19 = 0LL;
      }
      if (v15 == 1 && v16 == 6) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = v19;
      }
    }

    id v20 = objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
    [v20 setObject:v21 forSetting:1];

    if (v11 == 2)
    {
    }

    v22 = -[PBHIDSender initWithSenderID:category:remoteType:settings:]( self,  "initWithSenderID:category:remoteType:settings:",  sub_100031CC4(a3),  v11,  v10,  v20);

    return v22;
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"HIDServiceClient != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027874C(a2, (uint64_t)self, (uint64_t)v25);
    }
    result = (PBHIDSender *)_bs_set_crash_log_message([v25 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBHIDSender)initWithCategory:(int64_t)a3
{
  return -[PBHIDSender initWithSenderID:category:remoteType:settings:]( self,  "initWithSenderID:category:remoteType:settings:",  0LL,  a3,  0LL,  0LL);
}

- (PBHIDSender)initWithSenderID:(unint64_t)a3 category:(int64_t)a4 remoteType:(int64_t)a5 settings:(id)a6
{
  id v10 = a6;
  if (a4)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___PBHIDSender;
    uint64_t v11 = -[PBHIDSender init](&v17, "init");
    v12 = v11;
    if (v11)
    {
      v11->_senderID = a3;
      v11->_category = a4;
      v11->_remoteType = a5;
      uint64_t v13 = (BSSettings *)[v10 copy];
      settings = v12->_settings;
      v12->_settings = v13;
    }

    self = v12;
    unsigned int v15 = self;
  }

  else
  {
    unsigned int v15 = 0LL;
  }

  return v15;
}

- (BOOL)isFirstParty
{
  return -[PBHIDSender _vendorID](self, "_vendorID") == 76;
}

- (BOOL)isMultiButtonMFIGamePad
{
  return -[BSSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", 2LL);
}

- (unsigned)_vendorID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSSettings objectForSetting:](self->_settings, "objectForSetting:", 1LL));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)hash
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendUnsignedInteger:self->_senderID];
  id v5 = [v3 appendInteger:self->_category];
  id v6 = [v3 appendInteger:self->_remoteType];
  id v7 = [v3 appendObject:self->_settings];
  id v8 = [v3 hash];

  return (unint64_t)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBHIDSender));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t senderID = self->_senderID;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10008B238;
  v26[3] = &unk_1003D2B80;
  id v8 = v4;
  id v27 = v8;
  id v9 = [v6 appendUnsignedInteger:senderID counterpart:v26];
  int64_t category = self->_category;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10008B250;
  v24[3] = &unk_1003D4148;
  id v11 = v8;
  id v25 = v11;
  id v12 = [v6 appendInteger:category counterpart:v24];
  int64_t remoteType = self->_remoteType;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10008B268;
  v22[3] = &unk_1003D4148;
  id v14 = v11;
  id v23 = v14;
  id v15 = [v6 appendInteger:remoteType counterpart:v22];
  settings = self->_settings;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10008B280;
  v20[3] = &unk_1003D2130;
  id v21 = v14;
  id v17 = v14;
  id v18 = [v6 appendObject:settings counterpart:v20];

  return v6 != 0LL;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[PBHIDSender succinctDescription](self, "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBHIDSender descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBHIDSender succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unsigned int v3 = +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  objc_opt_class(self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 appendUnsignedInteger:self->_senderID withName:@"senderID" format:1];
  switch(self->_category)
  {
    case 0LL:
      id v6 = @"Unknown";
      goto LABEL_10;
    case 1LL:
      uint64_t v7 = TVSBluetoothRemoteTypeLogString(self->_remoteType);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      [v4 appendString:v8 withName:0];

      goto LABEL_11;
    case 2LL:
      id v6 = @"GamePad";
      goto LABEL_10;
    case 3LL:
      id v6 = @"Keyboard";
      goto LABEL_10;
    case 4LL:
      id v6 = @"CEC";
      goto LABEL_10;
    case 5LL:
      id v6 = @"IR";
      goto LABEL_10;
    case 6LL:
      id v6 = @"MediaRemote";
      goto LABEL_10;
    default:
      id v6 = 0LL;
LABEL_10:
      [v4 appendString:v6 withName:0];
LABEL_11:
      id v9 =  objc_msgSend( v4,  "appendBool:withName:ifEqualTo:",  -[PBHIDSender isFirstParty](self, "isFirstParty"),  @"isFirstParty",  1);
      id v10 =  objc_msgSend( v4,  "appendBool:withName:ifEqualTo:",  -[PBHIDSender isMultiButtonMFIGamePad](self, "isMultiButtonMFIGamePad"),  @"isMultiButtonMFIGamePad",  1);
      return v4;
  }

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBHIDSender descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  id v6 = [v5 appendUnsignedInteger:self->_senderID withName:@"senderID" format:1];
  unint64_t category = self->_category;
  if (category > 6) {
    id v8 = 0LL;
  }
  else {
    id v8 = off_1003D4168[category];
  }
  [v5 appendString:v8 withName:@"category"];
  if (self->_category == 1)
  {
    uint64_t v9 = TVSBluetoothRemoteTypeLogString(self->_remoteType);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 appendString:v10 withName:@"remoteType"];
  }

  id v11 =  objc_msgSend( v5,  "appendBool:withName:",  -[PBHIDSender isFirstParty](self, "isFirstParty"),  @"isFirstParty");
  id v12 =  objc_msgSend( v5,  "appendBool:withName:",  -[PBHIDSender isMultiButtonMFIGamePad](self, "isMultiButtonMFIGamePad"),  @"isMultiButtonMFIGamePad");
  return v5;
}

+ (BOOL)_isMultiButtonMFIGamePad:(__IOHIDServiceClient *)a3
{
  id v15 = (void *)IOHIDServiceClientCopyProperty(a3, @"Keyboard");
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Elements"]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    char v16 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"UsagePage"]);
        id v11 = [v10 unsignedIntegerValue];

        if (v11 == (id)12)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Usage"]);
          id v13 = [v12 unsignedIntegerValue];

          if (v13 == (id)547)
          {
            char v16 = 1;
          }

          else if (v13 == (id)516)
          {
            char v6 = 1;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  else
  {
    char v16 = 0;
    char v6 = 0;
  }

  return v6 & v16 & 1;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (int64_t)category
{
  return self->_category;
}

- (int64_t)remoteType
{
  return self->_remoteType;
}

- (BSSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end