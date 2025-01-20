@interface KTAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)everOptedIn;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)optInState;
- (BOOL)recentlyOptedIn;
- (BOOL)shouldRemove;
- (BOOL)updateWithOptInOutWithExt:(id)a3 error:(id *)a4;
- (BOOL)validateEmptyOptInOutHistory:(id)a3 responseTime:(id)a4 error:(id *)a5;
- (BOOL)validateOptInHistory:(id)a3 responseTime:(id)a4 error:(id *)a5;
- (KTAccount)initWithCoder:(id)a3;
- (KTAccount)initWithIdsAccount:(id)a3;
- (KTAccount)initWithMutation:(id)a3;
- (NSData)accountKey;
- (NSData)accountKeyHash;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)devices;
- (NSMutableArray)optInOutHistory;
- (id)debugDescription;
- (id)deviceForDeviceIdHash:(id)a3;
- (id)kvsOptInOutEntry:(id)a3 before:(id)a4;
- (id)optInHistory;
- (id)optInHistoryDescription;
- (id)optInOutHistoryJsonArray;
- (id)optInRecord;
- (void)addDevicesObject:(id)a3;
- (void)cleanupDevices;
- (void)deleteMarkedEntries:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeDevicesObject:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevices:(id)a3;
- (void)setOptInOutHistory:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithDeviceStateArray:(id)a3;
- (void)updateWithExtensions:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4;
@end

@implementation KTAccount

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v32 = self;
  obj = self->_devices;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v36)
  {
    uint64_t v34 = *(void *)v43;
    v35 = v3;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v4;
        v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceID]);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        [v3 appendFormat:@"    deviceID:%@\n", v7];

        v8 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIDHash]);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
        [v3 appendFormat:@"    deviceIDHash: %@\n", v9];

        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 clientDatas]);
        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v39;
          do
          {
            v15 = 0LL;
            do
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v15);
              [v10 appendFormat:@"     {\n"];
              v17 = (void *)objc_claimAutoreleasedReturnValue([v16 clientData]);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
              [v10 appendFormat:@"      clientData:%@\n", v18];

              v19 = (void *)objc_claimAutoreleasedReturnValue([v16 clientDataHash]);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_hexString"));
              [v10 appendFormat:@"      clientDataHash:%@\n", v20];

              objc_msgSend( v10,  "appendFormat:",  @"      appVersion:%lu\n",  objc_msgSend(v16, "applicationVersion"));
              v21 = (void *)objc_claimAutoreleasedReturnValue([v16 addedDate]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v16 markedForDeletion]);
              v23 = (void *)objc_claimAutoreleasedReturnValue([v16 expiry]);
              v24 = (void *)objc_claimAutoreleasedReturnValue([v16 escrowExpiry]);
              objc_msgSend( v10,  "appendFormat:",  @"      addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
                v21,
                v22,
                v23,
                v24);

              [v10 appendFormat:@"     },\n"];
              v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v13);
        }

        [v10 appendFormat:@"    ]"];
        v3 = v35;
        [v35 appendFormat:@"    clientDatas: %@\n", v10];
        [v35 appendFormat:@"   },\n"];

        uint64_t v4 = v37 + 1;
      }

      while ((id)(v37 + 1) != v36);
      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v36);
  }

  [v3 appendFormat:@"  ]"];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v32, "accountKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v32, "accountKeyHash"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "kt_hexString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInHistoryDescription](v32, "optInHistoryDescription"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  accountKey:%@\n  accountKeyHash:%@\n  optInHistory:%@\n devices: %@\n}",  v26,  v28,  v29,  v3));

  return v30;
}

- (id)optInOutHistoryJsonArray
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) diagnosticsJsonDictionary]);
          [v5 addObject:v11];

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    [v3 setObject:v6 forKeyedSubscript:@"accountKey"];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  [v3 setObject:v8 forKeyedSubscript:@"accountKeyHash"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) diagnosticsJsonDictionary]);
        [v9 addObject:v15];

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"devices"];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistoryJsonArray](self, "optInOutHistoryJsonArray"));
  [v3 setObject:v16 forKeyedSubscript:@"optInOutHistory"];

  return (NSDictionary *)v3;
}

- (id)optInHistoryDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reverseObjectEnumerator]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        else {
          id v12 = @"NO";
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)[v11 timestampMs] / 0x3E8)));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_toISO_8601_UTCString"));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v12,  v14));

        [v4 addObject:v15];
      }

      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@","]);
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
  [v4 encodeObject:v5 forKey:@"accountKey"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
  [v4 encodeObject:v6 forKey:@"accountKeyHash"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
  [v4 encodeObject:v7 forKey:@"devices"];

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    id v11 = [v10 count];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0LL));
      id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          __int128 v18 = 0LL;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            if (v19) {
              [v13 addObject:v19];
            }

            __int128 v18 = (char *)v18 + 1;
          }

          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v16);
      }

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v13));
      [v4 encodeObject:v20 forKey:@"optInOutHistory"];
    }
  }
}

- (KTAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"accountKey");
  uint64_t v43 = objc_claimAutoreleasedReturnValue(v6);
  id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v7),  @"accountKeyHash");
  uint64_t v42 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
  id v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___KTDevice, v11),  0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"devices"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
  uint64_t v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSData, v16),  0LL);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"optInOutHistory"]);
  __int128 v20 = v19;
  if (v19)
  {
    __int128 v39 = v18;
    __int128 v40 = self;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v19 count]));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v22 = v20;
    id v23 = [v22 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v46;
      while (2)
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
          id v44 = 0LL;
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[OptInOutWithExt parseFromData:error:]( &OBJC_CLASS___OptInOutWithExt,  "parseFromData:error:",  v27,  &v44));
          id v29 = v44;
          if (!v28)
          {
            v30 = (void *)v43;
            if (qword_1002EEA28 != -1) {
              dispatch_once(&qword_1002EEA28, &stru_100284E18);
            }
            v32 = v41;
            v31 = (void *)v42;
            __int128 v18 = v39;
            v33 = (os_log_s *)qword_1002EEA30;
            if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "failed to parse OptInOut record: %@",  buf,  0xCu);
            }

            uint64_t v34 = 0LL;
            self = v40;
            goto LABEL_21;
          }

          [v21 addObject:v28];
        }

        id v24 = [v22 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    __int128 v18 = v39;
    self = v40;
  }

  else
  {
    __int128 v21 = 0LL;
  }

  v35 = objc_alloc_init(&OBJC_CLASS___KTAccount);
  uint64_t v34 = v35;
  v31 = (void *)v42;
  v30 = (void *)v43;
  v32 = v41;
  if (v35)
  {
    -[KTAccount setAccountKey:](v35, "setAccountKey:", v43);
    -[KTAccount setAccountKeyHash:](v34, "setAccountKeyHash:", v42);
    id v36 = [v41 mutableCopy];
    -[KTAccount setDevices:](v34, "setDevices:", v36);

    if (v21)
    {
      -[KTAccount setOptInOutHistory:](v34, "setOptInOutHistory:", v21);
    }

    else
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      -[KTAccount setOptInOutHistory:](v34, "setOptInOutHistory:", v37);
    }
  }

- (KTAccount)initWithIdsAccount:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___KTAccount;
  uint64_t v5 = -[KTAccount init](&v29, "init");
  if (!v5) {
    goto LABEL_15;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountKeyHash]);
  -[KTAccount setAccountKeyHash:](v5, "setAccountKeyHash:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[KTAccount setDevices:](v5, "setDevices:", v7);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 devicesArray]);
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[KTDevice initWithIdsDevice:]( objc_alloc(&OBJC_CLASS___KTDevice),  "initWithIdsDevice:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)i));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](v5, "devices"));
        [v14 addObject:v13];
      }

      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }

    while (v10);
  }

  id v24 = 0LL;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedOptInOutHistory:&v24]);
  id v16 = v24;
  id v17 = [v15 mutableCopy];
  -[KTAccount setOptInOutHistory:](v5, "setOptInOutHistory:", v17);

  if (v16)
  {
    if (qword_1002EEA28 != -1) {
      dispatch_once(&qword_1002EEA28, &stru_100284E38);
    }
    __int128 v18 = (void *)qword_1002EEA30;
    if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
    {
      __int128 v19 = v18;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v5, "accountKeyHash"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v31 = v21;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to create account for %@: %@",  buf,  0x16u);
    }

    id v22 = 0LL;
  }

  else
  {
LABEL_15:
    id v22 = v5;
  }

  return v22;
}

- (KTAccount)initWithMutation:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTAccount;
  uint64_t v5 = -[KTAccount init](&v21, "init");
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 accountKeyHash]);
  accountKeyHash = v5->_accountKeyHash;
  v5->_accountKeyHash = (NSData *)v6;

  id v8 = -[KTDevice initWithMutation:](objc_alloc(&OBJC_CLASS___KTDevice), "initWithMutation:", v4);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v8));
  devices = v5->_devices;
  v5->_devices = (NSMutableArray *)v9;

  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  optInOutHistory = v5->_optInOutHistory;
  v5->_optInOutHistory = (NSMutableArray *)v11;

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v13);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 extensions]);
  id v20 = 0LL;
  -[KTAccount updateWithExtensions:error:](v5, "updateWithExtensions:error:", v15, &v20);
  id v16 = v20;

  if (v16)
  {
    if (qword_1002EEA28 != -1) {
      dispatch_once(&qword_1002EEA28, &stru_100284E58);
    }
    id v17 = (os_log_s *)qword_1002EEA30;
    if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "unable to create account record: %@",  buf,  0xCu);
    }

    __int128 v18 = 0LL;
  }

  else
  {
LABEL_9:
    __int128 v18 = v5;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (KTAccount *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___KTAccount, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      uint64_t v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v7, "accountKey"));
      if (v8 == (void *)v9)
      {
      }

      else
      {
        id v10 = (void *)v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v7, "accountKey"));
        unsigned int v13 = [v11 isEqualToData:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v7, "accountKeyHash"));
      if (v15 == (void *)v16)
      {
      }

      else
      {
        id v17 = (void *)v16;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v7, "accountKeyHash"));
        unsigned int v20 = [v18 isEqualToData:v19];

        if (!v20) {
          goto LABEL_15;
        }
      }

      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[KTAccount devices](v7, "devices"));
      if (v21 == (void *)v22)
      {
      }

      else
      {
        id v23 = (void *)v22;
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](v7, "devices"));
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

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0LL));
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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0LL));
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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0LL));
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

- (id)deviceForDeviceIdHash:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v5 = self->_devices;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIDHash", (void)v15));
          unsigned __int8 v12 = [v11 isEqualToData:v4];

          if ((v12 & 1) != 0)
          {
            id v13 = v10;

            goto LABEL_15;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    goto LABEL_14;
  }

  if (-[NSMutableArray count](self->_devices, "count") != (id)1)
  {
LABEL_14:
    id v13 = 0LL;
    goto LABEL_15;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", 0LL));
LABEL_15:

  return v13;
}

- (id)optInRecord
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3
    && (id v4 = (void *)v3,
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory")),
        id v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)optInHistory
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    id v6 = [v5 count];

    if (v6) {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    }
    else {
      uint64_t v3 = 0LL;
    }
  }

  return v3;
}

- (BOOL)optInState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInRecord](self, "optInRecord"));
  unsigned __int8 v3 = [v2 optIn];

  return v3;
}

- (BOOL)everOptedIn
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    id v5 = [v4 count];

    if (v5)
    {
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0LL));
      id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0LL; i != v3; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) optIn])
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }

          id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v3) {
            continue;
          }
          break;
        }
      }

- (BOOL)recentlyOptedIn
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    id v5 = [v4 count];

    if (v5)
    {
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0LL));
      id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0LL; i != v3; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) optIn])
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }

          id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v3) {
            continue;
          }
          break;
        }
      }

- (id)kvsOptInOutEntry:(id)a3 before:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
  id v9 = [v6 compare:v8];

  if (v9 == (id)-1LL)
  {
    __int128 v11 = (char *)[v5 count] - 1;
    while (1)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v11]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
      id v14 = [v6 compare:v13];

      if (v14 != (id)-1LL) {
        break;
      }
    }

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v11]);
    if (v10) {
      goto LABEL_9;
    }
LABEL_8:
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
    unsigned int v17 = [v16 BOOLValue];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  0.0));
    v21[0] = v18;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17 ^ 1));
    v21[1] = v19;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  }

  else
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  }

- (BOOL)validateEmptyOptInOutHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  unint64_t v11 = (unint64_t)[v10 count];

  unint64_t v12 = (unint64_t)[v8 count];
  if (!(v11 | v12))
  {
LABEL_2:
    char v13 = 1;
    goto LABEL_29;
  }

  if (v11)
  {
    if (!v12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
      unsigned int v16 = [v15 optIn];

      if (!v16)
      {
        if (qword_1002EEA28 != -1) {
          dispatch_once(&qword_1002EEA28, &stru_100284ED8);
        }
        __int128 v28 = (os_log_s *)qword_1002EEA30;
        if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)objc_super v29 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "opt-in state match: kvs = <null>; kt = 0",
            v29,
            2u);
        }

        goto LABEL_2;
      }

      if (qword_1002EEA28 != -1) {
        dispatch_once(&qword_1002EEA28, &stru_100284EB8);
      }
      unsigned int v17 = (os_log_s *)qword_1002EEA30;
      if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "opt-in state mismatch: kvs = <null>; kt = 1",
          buf,
          2u);
      }

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -289LL,  @"Opt-in state mismatch: kvs = <null>; kt = 1"));
      __int128 v19 = v18;
      if (a5 && v18) {
        *a5 = v18;
      }
    }

    char v13 = 0;
    goto LABEL_29;
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount kvsOptInOutEntry:before:](self, "kvsOptInOutEntry:before:", v8, v9));
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:1]);
  unsigned int v22 = [v21 BOOLValue];

  if (v22)
  {
    if (qword_1002EEA28 != -1) {
      dispatch_once(&qword_1002EEA28, &stru_100284E78);
    }
    id v23 = (os_log_s *)qword_1002EEA30;
    if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v32 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "opt-in state mismatch: kvs = 1; kt = <null>",
        v32,
        2u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -289LL,  @"Opt-in state mismatch: kvs = 1; kt = <null>"));
    __int128 v25 = v24;
    if (a5 && v24) {
      *a5 = v24;
    }
  }

  else
  {
    if (qword_1002EEA28 != -1) {
      dispatch_once(&qword_1002EEA28, &stru_100284E98);
    }
    unsigned __int8 v26 = (os_log_s *)qword_1002EEA30;
    if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "opt-in state match: kvs = 0; kt = <null>",
        v31,
        2u);
    }
  }

  char v13 = v22 ^ 1;

LABEL_29:
  return v13;
}

- (BOOL)validateOptInHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    id v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount kvsOptInOutEntry:before:](self, "kvsOptInOutEntry:before:", v8, v9));
      char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
      id v14 = [v13 BOOLValue];

      if ((_DWORD)v14 == -[KTAccount optInState](self, "optInState"))
      {
        if (!(_DWORD)v14)
        {
          BOOL v19 = 1;
LABEL_34:

          goto LABEL_35;
        }

        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
        [v20 timeIntervalSince1970];
        double v22 = v21;

        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        id v18 = (id)objc_claimAutoreleasedReturnValue([v23 reverseObjectEnumerator]);

        id v24 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v24)
        {
          id v25 = v24;
          v35 = v12;
          uint64_t v26 = *(void *)v37;
          while (2)
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v37 != v26) {
                objc_enumerationMutation(v18);
              }
              __int128 v28 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
              if ((unint64_t)v22 < (unint64_t)[v28 timestampMs] / 0x3E8
                && ([v28 optIn] & 1) == 0)
              {
                if (qword_1002EEA28 != -1) {
                  dispatch_once(&qword_1002EEA28, &stru_100284F18);
                }
                unint64_t v12 = v35;
                objc_super v29 = (void *)qword_1002EEA30;
                if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  unint64_t v31 = (unint64_t)[v28 timestampMs];
                  *(_DWORD *)buf = 134218240;
                  *(void *)__int128 v41 = v31 / 0x3E8;
                  *(_WORD *)&v41[8] = 2048;
                  unint64_t v42 = (unint64_t)v22;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Detected opt-out at %llu after kvs opt-in at %llu",  buf,  0x16u);
                }

                __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -322,  @"Detected opt-out at %llu after kvs opt-in at %llu",  (unint64_t)[v28 timestampMs] / 0x3E8,  (unint64_t)v22));
                id v33 = v32;
                if (a5 && v32) {
                  *a5 = v32;
                }

                BOOL v19 = 0;
                goto LABEL_33;
              }
            }

            id v25 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
            BOOL v19 = 1;
            if (v25) {
              continue;
            }
            break;
          }

          unint64_t v12 = v35;
        }

        else
        {
          BOOL v19 = 1;
        }
      }

      else
      {
        if (qword_1002EEA28 != -1) {
          dispatch_once(&qword_1002EEA28, &stru_100284EF8);
        }
        __int128 v15 = (void *)qword_1002EEA30;
        if (os_log_type_enabled((os_log_t)qword_1002EEA30, OS_LOG_TYPE_ERROR))
        {
          unsigned int v16 = v15;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int128 v41 = -[KTAccount optInState](self, "optInState");
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = (_DWORD)v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "current opt-in state mismatch: kt = %d, kvs = %d",  buf,  0xEu);
        }

        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -289LL,  @"Current opt-in state mismatch: kt = %d, kvs = %d",  -[KTAccount optInState](self, "optInState"),  v14));
        id v18 = v17;
        BOOL v19 = 0;
        if (a5 && v17)
        {
          id v18 = v17;
          BOOL v19 = 0;
          *a5 = v18;
        }
      }

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v11 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceIdHash]);
  uint64_t v7 = (KTDevice *)objc_claimAutoreleasedReturnValue(-[KTAccount deviceForDeviceIdHash:](self, "deviceForDeviceIdHash:", v6));

  if (v7)
  {
    -[KTDevice updateWithAddMutation:error:](v7, "updateWithAddMutation:error:", v11, a4);
  }

  else
  {
    uint64_t v7 = -[KTDevice initWithMutation:](objc_alloc(&OBJC_CLASS___KTDevice), "initWithMutation:", v11);
    -[KTAccount addDevicesObject:](self, "addDevicesObject:", v7);
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v8);
  if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v11 extensions]);
    -[KTAccount updateWithExtensions:error:](self, "updateWithExtensions:error:", v10, a4);
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdHash]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount deviceForDeviceIdHash:](self, "deviceForDeviceIdHash:", v6));

  if (v7) {
    [v7 updateWithMarkDeleteMutation:v8 error:a4];
  }
}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v23 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v30 + 1) + 8 * (void)i) deviceIdHash]);
          [v4 addObject:v10];
        }

        id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v7);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v11));

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceIDHash]);
          unsigned __int8 v20 = [v4 containsObject:v19];

          if ((v20 & 1) != 0)
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_10015F6B8;
            v25[3] = &unk_100284F40;
            v25[4] = v18;
            double v21 = (void *)objc_claimAutoreleasedReturnValue([v5 indexesOfObjectsPassingTest:v25]);
            double v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectsAtIndexes:v21]);
            [v18 updateWithDeviceStateArray:v22];
          }

          else
          {
            -[KTAccount removeDevicesObject:](self, "removeDevicesObject:", v18);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v15);
    }

    id v3 = v23;
  }
}

- (void)updateWithExtensions:(id)a3 error:(id *)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "extensionType", (void)v15) == 3)
        {
          unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 extensionData]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[OptInOutWithExt parseFromData:error:]( &OBJC_CLASS___OptInOutWithExt,  "parseFromData:error:",  v12,  0LL));

          if (-[KTAccount updateWithOptInOutWithExt:error:](self, "updateWithOptInOutWithExt:error:", v13, a4)
            && [v13 optIn])
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v13 timestampMs] / 1000.0));
            -[KTAccount deleteMarkedEntries:](self, "deleteMarkedEntries:", v14);
          }

          goto LABEL_14;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)updateWithOptInOutWithExt:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  id v7 = [v6 count];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  uint64_t v9 = v8;
  if (!v7) {
    goto LABEL_5;
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);
  id v11 = [v10 timestampMs];
  id v12 = [v5 timestampMs];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  id v14 = v13;
  if (v11 >= v12)
  {
    id v18 = [v13 count];

    unint64_t v19 = 0LL;
    if (v18)
    {
      while (1)
      {
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:v19]);
        LOBYTE(v18) = [v5 isEqual:v21];

        double v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v19]);
        id v24 = [v23 timestampMs];
        id v25 = [v5 timestampMs];

        if (v24 > v25) {
          break;
        }
        ++v19;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        id v27 = [v26 count];

        if (v19 >= (unint64_t)v27)
        {
          LOBYTE(v18) = 0;
          goto LABEL_13;
        }
      }

      if (!v19) {
        goto LABEL_14;
      }
LABEL_13:
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v19 - 1]);
      unsigned __int8 v31 = [v30 optIn];
      char v32 = v31 ^ [v5 optIn] ^ 1;
    }

    else
    {
LABEL_14:
      char v32 = 0;
    }

    BOOL v28 = 0;
    if ((v18 & 1) == 0 && (v32 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      [v9 insertObject:v5 atIndex:v19];
      goto LABEL_18;
    }
  }

  else
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastObject]);
    unsigned int v16 = [v15 optIn];
    unsigned int v17 = [v5 optIn];

    if (v16 != v17)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      uint64_t v9 = v8;
LABEL_5:
      [v8 addObject:v5];
LABEL_18:

      BOOL v28 = 1;
      goto LABEL_19;
    }

    BOOL v28 = 0;
  }

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = -[OptInOutWithExt initWithMutation:](objc_alloc(&OBJC_CLASS___OptInOutWithExt), "initWithMutation:", v9);
  if (-[KTAccount updateWithOptInOutWithExt:error:](self, "updateWithOptInOutWithExt:error:", v6, a4)
    && -[OptInOut optIn](v6, "optIn"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v9 timestampMs] / 1000.0));
    -[KTAccount deleteMarkedEntries:](self, "deleteMarkedEntries:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 devicesArray]);
    -[KTAccount updateWithDeviceStateArray:](self, "updateWithDeviceStateArray:", v8);
  }
}

- (void)removeDevicesObject:(id)a3
{
}

- (void)addDevicesObject:(id)a3
{
}

- (BOOL)shouldRemove
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)cleanupDevices
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
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
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "cleanupRecords", (void)v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)deleteMarkedEntries:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
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
        [v12 deleteMarkedEntries:v4];
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDevices:(id)a3
{
}

- (NSMutableArray)optInOutHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOptInOutHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end