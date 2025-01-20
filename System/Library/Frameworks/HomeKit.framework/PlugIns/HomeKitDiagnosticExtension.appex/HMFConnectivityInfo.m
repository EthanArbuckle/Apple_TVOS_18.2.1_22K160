@interface HMFConnectivityInfo
+ (BOOL)supportsSecureCoding;
+ (id)connectivityInfoWithAccessoryIdentifier:(id)a3 wakeConfiguration:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMFConnectivityInfo)initWithAccessoryIdentifier:(id)a3 woBLEInfo:(id)a4 woWLANInfos:(id)a5;
- (HMFConnectivityInfo)initWithCoder:(id)a3;
- (HMFWoBLEInfo)woBLEInfo;
- (HMFWoWLANInfo)woWLANInfo;
- (NSArray)woWLANInfos;
- (NSString)accessoryIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWoBLEInfo:(id)a3;
- (void)setWoWLANInfos:(id)a3;
@end

@implementation HMFConnectivityInfo

- (HMFConnectivityInfo)initWithAccessoryIdentifier:(id)a3 woBLEInfo:(id)a4 woWLANInfos:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9 && (v10 || [v11 count]))
  {
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___HMFConnectivityInfo;
    v13 = -[HMFConnectivityInfo init](&v35, "init");
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
      objc_storeStrong((id *)&v14->_woBLEInfo, a4);
      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v16 = v12;
        id v17 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
            }

            id v18 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }

          while (v18);
        }

        v22 = (NSArray *)[v15 copy];
        woWLANInfos = v14->_woWLANInfos;
        v14->_woWLANInfos = v22;
      }
    }

    self = v14;
    v24 = self;
  }

  else
  {
    v25 = objc_autoreleasePoolPush();
    uint64_t v26 = HMFGetOSLogHandle(0LL);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier(0LL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138543618;
      v38 = v29;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@Returning nil for the invalid woBLEInfo and woWLANInfo of accessory: %@",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v25);
    v24 = 0LL;
  }

  return v24;
}

- (HMFWoWLANInfo)woWLANInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return (HMFWoWLANInfo *)v3;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMFConnectivityInfo *)a3;
  if (self == v5)
  {
    char v17 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMFConnectivityInfo, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    unint64_t v8 = v7;
    if (!v8) {
      goto LABEL_9;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo accessoryIdentifier](v8, "accessoryIdentifier"));
    int v11 = HMFEqualObjects(v9, v10);

    if (!v11) {
      goto LABEL_9;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](v8, "woBLEInfo"));
    int v14 = HMFEqualObjects(v12, v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](v8, "woWLANInfos"));
      char v17 = HMFEqualObjects(v15, v16);
    }

    else
    {
LABEL_9:
      char v17 = 0;
    }
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier"));
  [v11 encodeObject:v4 forKey:@"HMFCI.ID"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo"));
    [v11 encodeObject:v6 forKey:@"HMFCI.woBLE"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfo](self, "woWLANInfo"));

  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfo](self, "woWLANInfo"));
    [v11 encodeObject:v8 forKey:@"HMFCI.woWLAN"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));
    [v11 encodeObject:v10 forKey:@"HMFCI.All.woWLAN"];
  }
}

- (HMFConnectivityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"HMFCI.ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v30[0] = objc_opt_class(&OBJC_CLASS___HMFWoBLEInfo, v8);
  v30[1] = objc_opt_class(&OBJC_CLASS___NSData, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"HMFCI.woBLE"]);

  v29[0] = objc_opt_class(&OBJC_CLASS___HMFWoWLANInfo, v13);
  v29[1] = objc_opt_class(&OBJC_CLASS___NSArray, v14);
  v29[2] = objc_opt_class(&OBJC_CLASS___NSData, v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
  char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"HMFCI.woWLAN"]);

  v28[0] = objc_opt_class(&OBJC_CLASS___HMFWoWLANInfo, v19);
  v28[1] = objc_opt_class(&OBJC_CLASS___NSArray, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"HMFCI.All.woWLAN"]);

  if (![v23 count] && v18)
  {
    v27 = v18;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

    v23 = (void *)v24;
  }

  v25 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:]( self,  "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:",  v7,  v12,  v23);

  return v25;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Identifier: %@ BLEInfo: %@, WLANInfos: %@",  v3,  v4,  v5));

  return v6;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (HMFWoBLEInfo)woBLEInfo
{
  return self->_woBLEInfo;
}

- (void)setWoBLEInfo:(id)a3
{
}

- (NSArray)woWLANInfos
{
  return self->_woWLANInfos;
}

- (void)setWoWLANInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)connectivityInfoWithAccessoryIdentifier:(id)a3 wakeConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 custom1]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryIdentifier]);

  if (v8)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___HMFWoBLEInfo);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 custom1]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryIdentifier]);
    v12 = -[HMFWoBLEInfo initWithBLEIdentifier:](v9, "initWithBLEIdentifier:", v11);
  }

  else
  {
    v12 = 0LL;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 custom2]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 primaryIdentifier]);

  if (!v14)
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___HMFConnectivityInfo);
    goto LABEL_8;
  }

  uint64_t v15 = objc_alloc(&OBJC_CLASS___HMFWoWLANInfo);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 custom2]);
  char v17 = (void *)objc_claimAutoreleasedReturnValue([v16 primaryIdentifier]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 custom2]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 secondaryIdentifier]);
  uint64_t v20 = -[HMFWoWLANInfo initWithPrimaryIdentifier:wifiIdentifiers:]( v15,  "initWithPrimaryIdentifier:wifiIdentifiers:",  v17,  v19);

  uint64_t v21 = objc_alloc(&OBJC_CLASS___HMFConnectivityInfo);
  if (!v20)
  {
LABEL_8:
    v23 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:]( v21,  "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:",  v5,  v12,  0LL);
    goto LABEL_9;
  }

  v25 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v23 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:]( v21,  "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:",  v5,  v12,  v22);

LABEL_9:
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

@end