@interface KTDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)shouldRemove;
- (KTDevice)initWithCoder:(id)a3;
- (KTDevice)initWithIdsDevice:(id)a3;
- (KTDevice)initWithMutation:(id)a3;
- (NSData)deviceID;
- (NSData)deviceIDHash;
- (NSDate)addedDate;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)clientDatas;
- (id)clientRecordForAppVersion:(unint64_t)a3 clientDataHash:(id)a4;
- (id)clientRecordsForHash:(id)a3;
- (id)debugDescription;
- (void)addClientDatasObject:(id)a3;
- (void)cleanupRecords;
- (void)deleteMarkedEntries:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markClientDatasForAppVersion:(unint64_t)a3 mutationMs:(unint64_t)a4 except:(id)a5;
- (void)removeClientDatasObject:(id)a3;
- (void)setClientDatas:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceIDHash:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithDeviceStateArray:(id)a3;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
@end

@implementation KTDevice

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v21 = self;
  obj = self->_clientDatas;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v7);
        [v3 appendFormat:@"   {\n"];
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientData]);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
        [v3 appendFormat:@"    clientData:%@\n", v10];

        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDataHash]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
        [v3 appendFormat:@"    clientDataHash:%@\n", v12];

        objc_msgSend(v3, "appendFormat:", @"    appVersion:%lu\n", objc_msgSend(v8, "applicationVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 addedDate]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 markedForDeletion]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 expiry]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v8 escrowExpiry]);
        objc_msgSend( v3,  "appendFormat:",  @"    addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
          v13,
          v14,
          v15,
          v16);

        [v3 appendFormat:@"   },\n"];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v5);
  }

  [v3 appendFormat:@"  ]"];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v21->_deviceID, "kt_hexString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v21->_deviceIDHash, "kt_hexString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  deviceID:%@\n  deviceIDHash:%@\n  clientDatas: %@\n}",  v17,  v18,  v3));

  return v19;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    [v3 setObject:v6 forKeyedSubscript:@"deviceID"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  [v3 setObject:v8 forKeyedSubscript:@"deviceIDHash"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) diagnosticsJsonDictionary]);
        [v9 addObject:v15];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"clientDatas"];
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
  [v4 encodeObject:v5 forKey:@"deviceID"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
  [v4 encodeObject:v6 forKey:@"deviceIDHash"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  [v4 encodeObject:v7 forKey:@"clientDataRecords"];
}

- (KTDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"deviceID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v8), @"deviceIDHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
  v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___KTClientDataRecord, v13),  0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"clientDataRecords"]);

  __int128 v17 = objc_alloc_init(&OBJC_CLASS___KTDevice);
  __int128 v18 = v17;
  if (v17)
  {
    -[KTDevice setDeviceID:](v17, "setDeviceID:", v7);
    -[KTDevice setDeviceIDHash:](v18, "setDeviceIDHash:", v10);
    id v19 = [v16 mutableCopy];
    -[KTDevice setClientDatas:](v18, "setClientDatas:", v19);
  }

  return v18;
}

- (KTDevice)initWithIdsDevice:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KTDevice;
  uint64_t v5 = -[KTDevice init](&v20, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdHash]);
    -[KTDevice setDeviceIDHash:](v5, "setDeviceIDHash:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTDevice setClientDatas:](v5, "setClientDatas:", v7);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataArray", 0));
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = -[KTClientDataRecord initWithSingleDataRecord:]( objc_alloc(&OBJC_CLASS___KTClientDataRecord),  "initWithSingleDataRecord:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v5, "clientDatas"));
          [v14 addObject:v13];

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v10);
    }
  }

  return v5;
}

- (KTDevice)initWithMutation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___KTDevice;
  uint64_t v5 = -[KTDevice init](&v12, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 deviceIdHash]);
    deviceIDHash = v5->_deviceIDHash;
    v5->_deviceIDHash = (NSData *)v6;

    uint64_t v8 = -[KTClientDataRecord initWithMutation:](objc_alloc(&OBJC_CLASS___KTClientDataRecord), "initWithMutation:", v4);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v8));
    clientDatas = v5->_clientDatas;
    v5->_clientDatas = (NSMutableArray *)v9;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (KTDevice *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___KTDevice, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](v7, "deviceID"));
      if (v8 == (void *)v9)
      {
      }

      else
      {
        id v10 = (void *)v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](v7, "deviceID"));
        unsigned int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](v7, "deviceIDHash"));
      if (v15 == (void *)v16)
      {
      }

      else
      {
        __int128 v17 = (void *)v16;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](v7, "deviceIDHash"));
        unsigned int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_15;
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v7, "clientDatas"));
      if (v21 == (void *)v22)
      {
      }

      else
      {
        __int128 v23 = (void *)v22;
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v7, "clientDatas"));
        unsigned __int8 v26 = [v24 isEqual:v25];

        if ((v26 & 1) == 0)
        {
LABEL_15:
          BOOL v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }

      BOOL v14 = 1;
      goto LABEL_18;
    }

    BOOL v14 = 0;
  }

- (id)clientRecordForAppVersion:(unint64_t)a3 clientDataHash:(id)a4
{
  id v6 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = self->_clientDatas;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "applicationVersion", (void)v17) == (id)a3)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDataHash]);
          unsigned __int8 v14 = [v13 isEqualToData:v6];

          if ((v14 & 1) != 0)
          {
            id v15 = v12;
            goto LABEL_12;
          }
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = 0LL;
LABEL_12:

  return v15;
}

- (id)clientRecordsForHash:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_clientDatas;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientDataHash", (void)v16));
        unsigned int v13 = [v12 isEqualToData:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  if ([v5 count]) {
    id v14 = v5;
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (void)removeClientDatasObject:(id)a3
{
}

- (void)addClientDatasObject:(id)a3
{
}

- (void)markClientDatasForAppVersion:(unint64_t)a3 mutationMs:(unint64_t)a4 except:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)a4 / 1000.0));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v14);
        if ((!v8
           || ([*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) isEqual:v8] & 1) == 0)
          && [v15 applicationVersion] == (id)a3
          && ([v15 marked:v9] & 1) == 0
          && ([v15 expired:v9] & 1) == 0)
        {
          [v15 markWithMutationMs:a4];
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * (void)i) marked:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)expired:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * (void)i) expired:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)active:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) active:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSDate)addedDate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 addedDate]);
        id v11 = [v10 compare:v3];

        if (v11 == (id)-1LL)
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 addedDate]);

          v3 = (void *)v12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return (NSDate *)v3;
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v11 = a3;
  id v6 = [v11 appVersion];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v11 clientDataHash]);
  uint64_t v8 = (KTClientDataRecord *)objc_claimAutoreleasedReturnValue( -[KTDevice clientRecordForAppVersion:clientDataHash:]( self,  "clientRecordForAppVersion:clientDataHash:",  v6,  v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 idsMutation]);
  id v10 = [v9 mutationMs];

  -[KTDevice markClientDatasForAppVersion:mutationMs:except:]( self,  "markClientDatasForAppVersion:mutationMs:except:",  [v11 appVersion],  v10,  v8);
  if (v8)
  {
    -[KTClientDataRecord updateWithAddMutation:error:](v8, "updateWithAddMutation:error:", v11, a4);
  }

  else
  {
    uint64_t v8 = -[KTClientDataRecord initWithMutation:](objc_alloc(&OBJC_CLASS___KTClientDataRecord), "initWithMutation:", v11);
    -[KTDevice addClientDatasObject:](self, "addClientDatasObject:", v8);
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [v9 appVersion];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 clientDataHash]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[KTDevice clientRecordForAppVersion:clientDataHash:]( self,  "clientRecordForAppVersion:clientDataHash:",  v6,  v7));

  if (v8) {
    [v8 updateWithMarkDeleteMutation:v9 error:a4];
  }
}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v4 = a3;
  __int128 v13 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100161628;
        v14[3] = &unk_100284F40;
        v14[4] = v12;
        if ([v4 indexOfObjectPassingTest:v14] == (id)0x7FFFFFFFFFFFFFFFLL) {
          -[KTDevice removeClientDatasObject:](v13, "removeClientDatasObject:", v12);
        }
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (BOOL)shouldRemove
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)cleanupRecords
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)deleteMarkedEntries:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (NSData)deviceID
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSData)deviceIDHash
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDeviceIDHash:(id)a3
{
}

- (NSMutableArray)clientDatas
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientDatas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end