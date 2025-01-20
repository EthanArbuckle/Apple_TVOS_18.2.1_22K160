@interface DAIDSDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIDSDevice:(id)a3;
- (BOOL)isEqualToNRDevice:(id)a3;
- (BOOL)isEqualToSFDevice:(id)a3;
- (DAIDSDestination)initWithCoder:(id)a3;
- (DAIDSDestination)initWithIDSDevice:(id)a3;
- (NSNumber)locallyPaired;
- (NSString)idsDestination;
- (NSString)uniqueID;
- (NSString)uniqueIDOverride;
- (NSUUID)bluetoothID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothID:(id)a3;
- (void)setLocallyPaired:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUniqueIDOverride:(id)a3;
@end

@implementation DAIDSDestination

- (DAIDSDestination)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DAIDSDestination;
  v5 = -[DAIDSDestination init](&v17, "init");
  if (v5)
  {
    uint64_t v6 = IDSCopyIDForDevice(v4);
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 nsuuid]);
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isLocallyPaired]));
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v14;
  }

  return v5;
}

- (DAIDSDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[DAIDSDestination init](self, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"destination"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"bluetoothID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"uniqueID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"uniqueIDOverride"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"locallyPaired"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v19;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination idsDestination](self, "idsDestination"));
  [v4 encodeObject:v5 forKey:@"destination"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
  [v4 encodeObject:v6 forKey:@"bluetoothID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueID](self, "uniqueID"));
  [v4 encodeObject:v7 forKey:@"uniqueID"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  [v4 encodeObject:v8 forKey:@"uniqueIDOverride"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
  [v4 encodeObject:v9 forKey:@"locallyPaired"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DAIDSDestination);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSDevice);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      unsigned __int8 v10 = -[DAIDSDestination isEqualToIDSDevice:](self, "isEqualToIDSDevice:", v4);
    }

    else
    {
      if (!qword_1000225A0)
      {
        __int128 v22 = off_1000188B0;
        v23 = 0LL;
        qword_1000225A0 = _sl_dlopen(&v22, 0LL);
      }

      if (!qword_1000225A0) {
        goto LABEL_12;
      }
      uint64_t v18 = 0LL;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2050000000LL;
      v11 = (void *)qword_1000225A8;
      uint64_t v21 = qword_1000225A8;
      if (!qword_1000225A8)
      {
        *(void *)&__int128 v22 = _NSConcreteStackBlock;
        *((void *)&v22 + 1) = 3221225472LL;
        v23 = sub_10000C834;
        v24 = &unk_1000188D0;
        v25 = &v18;
        sub_10000C834((uint64_t)&v22);
        v11 = (void *)v19[3];
      }

      id v12 = v11;
      _Block_object_dispose(&v18, 8);
      uint64_t v13 = objc_opt_class(v12);
      if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
      {
        unsigned __int8 v10 = -[DAIDSDestination isEqualToNRDevice:](self, "isEqualToNRDevice:", v4, v18);
      }

      else
      {
LABEL_12:
        if (!qword_1000225B0)
        {
          __int128 v22 = off_1000188F0;
          v23 = 0LL;
          qword_1000225B0 = _sl_dlopen(&v22, 0LL);
        }

        if (!qword_1000225B0) {
          goto LABEL_20;
        }
        uint64_t v18 = 0LL;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x2050000000LL;
        uint64_t v14 = (void *)qword_1000225B8;
        uint64_t v21 = qword_1000225B8;
        if (!qword_1000225B8)
        {
          *(void *)&__int128 v22 = _NSConcreteStackBlock;
          *((void *)&v22 + 1) = 3221225472LL;
          v23 = sub_10000C938;
          v24 = &unk_1000188D0;
          v25 = &v18;
          sub_10000C938((uint64_t)&v22);
          uint64_t v14 = (void *)v19[3];
        }

        id v15 = v14;
        _Block_object_dispose(&v18, 8);
        uint64_t v16 = objc_opt_class(v15);
        if ((objc_opt_isKindOfClass(v4, v16) & 1) == 0)
        {
LABEL_20:
          unsigned __int8 v8 = 0;
          goto LABEL_21;
        }

        unsigned __int8 v10 = -[DAIDSDestination isEqualToSFDevice:](self, "isEqualToSFDevice:", v4, v18);
      }
    }

    unsigned __int8 v8 = v10;
  }

- (BOOL)isEqualToNRDevice:(id)a3
{
  id v4 = a3;
  if (!qword_1000225A0)
  {
    __int128 v20 = off_1000188B0;
    uint64_t v21 = 0LL;
    qword_1000225A0 = _sl_dlopen(&v20, 0LL);
  }

  if (qword_1000225A0)
  {
    *(void *)&__int128 v20 = 0LL;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v5 = (void *)qword_1000225C0;
    __int128 v22 = (void *)qword_1000225C0;
    if (!qword_1000225C0)
    {
      id v6 = (void *)sub_10000C888();
      uint64_t v5 = dlsym(v6, "NRDevicePropertyIsPaired");
      *(void *)(*((void *)&v20 + 1) + 24LL) = v5;
      qword_1000225C0 = (uint64_t)v5;
    }

    _Block_object_dispose(&v20, 8);
    if (!v5)
    {
      sub_10000EBD0();
      __break(1u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:*v5]);
    uint64_t v16 = 0LL;
    objc_super v17 = &v16;
    uint64_t v18 = 0x2050000000LL;
    unsigned __int8 v8 = (void *)qword_1000225C8;
    uint64_t v19 = qword_1000225C8;
    if (!qword_1000225C8)
    {
      *(void *)&__int128 v20 = _NSConcreteStackBlock;
      *((void *)&v20 + 1) = 3221225472LL;
      uint64_t v21 = (uint64_t)sub_10000CA2C;
      __int128 v22 = &unk_1000188D0;
      v23 = &v16;
      sub_10000CA2C((uint64_t)&v20);
      unsigned __int8 v8 = (void *)v17[3];
    }

    id v9 = v8;
    _Block_object_dispose(&v16, 8);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedInstance", v16));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIDForNRDevice:v4]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
    if ([v7 isEqualToNumber:v12])
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
      unsigned __int8 v14 = [v11 isEqual:v13];
    }

    else
    {
      unsigned __int8 v14 = 0;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)isEqualToIDSDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 uniqueIDOverride]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)isEqualToSFDevice:(id)a3
{
  id v4 = a3;
  if (!qword_1000225B0)
  {
    __int128 v10 = off_1000188F0;
    uint64_t v11 = 0LL;
    qword_1000225B0 = _sl_dlopen(&v10, 0LL);
  }

  if (qword_1000225B0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
    unsigned __int8 v8 = [v6 isEqual:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination idsDestination](self, "idsDestination"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueID](self, "uniqueID"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idsDestination: %@; bluetoothID: %@; unqiueID: %@; uniqueIDOverride: %@; isLocallyPaired: %@",
                   v3,
                   v4,
                   v5,
                   v6,
                   v7));

  return v8;
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (void)setUniqueIDOverride:(id)a3
{
}

- (NSNumber)locallyPaired
{
  return self->_locallyPaired;
}

- (void)setLocallyPaired:(id)a3
{
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void).cxx_destruct
{
}

@end