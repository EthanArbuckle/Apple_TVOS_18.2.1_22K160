@interface MADAutoSetConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)haveReceivedLookupResponse;
- (BOOL)inhibitImpliedScheduling;
- (BOOL)isEqual:(id)a3;
- (BOOL)managesAssetSelector:(id)a3;
- (BOOL)refererncesAssetType:(id)a3;
- (BOOL)vendingAtomicInstanceForConfiguredEntries;
- (MADAutoSetConfiguration)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)assetSetIdentifier;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)latestAtomicInstanceToVend;
- (id)assetSetEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4;
- (id)copy;
- (id)firstEntryAssetType;
- (id)initForClientDomainName:(id)a3 forSetClientName:(id)a4 forAssetSetIdentifier:(id)a5 withAutoAssetEntries:(id)a6 withLatestAtomicInstanceToVend:(id)a7 inhibitingImpliedScheduling:(BOOL)a8 havingReceivedLookupResponse:(BOOL)a9 vendingAtomicInstanceForConfiguredEntries:(BOOL)a10;
- (id)newSummaryWithoutEntryID;
- (id)persistedEntryID;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setAutoAssetSetClientName:(id)a3;
- (void)setHaveReceivedLookupResponse:(BOOL)a3;
- (void)setInhibitImpliedScheduling:(BOOL)a3;
- (void)setLatestAtomicInstanceToVend:(id)a3;
- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3;
@end

@implementation MADAutoSetConfiguration

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](self, "clientDomainName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetSetClientName](self, "autoAssetSetClientName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](self, "assetSetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  id v13 = [v5 count];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  if (v6) {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  }
  else {
    v7 = @"N";
  }
  if (-[MADAutoSetConfiguration inhibitImpliedScheduling](self, "inhibitImpliedScheduling")) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (-[MADAutoSetConfiguration haveReceivedLookupResponse](self, "haveReceivedLookupResponse")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  if (-[MADAutoSetConfiguration vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"))
  {
    v10 = @"Y";
  }

  else
  {
    v10 = @"N";
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[(client)Domain:%@,Name:%@|(set)Identifier:%@,Entries:%ld|latestToVend:%@|inhibitScheduling:%@|lookupRsp:%@|vendingForConfig:%@]",  v3,  v14,  v4,  v13,  v7,  v8,  v9,  v10));
  if (v6) {

  }
  return v11;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (BOOL)inhibitImpliedScheduling
{
  return self->_inhibitImpliedScheduling;
}

- (id)initForClientDomainName:(id)a3 forSetClientName:(id)a4 forAssetSetIdentifier:(id)a5 withAutoAssetEntries:(id)a6 withLatestAtomicInstanceToVend:(id)a7 inhibitingImpliedScheduling:(BOOL)a8 havingReceivedLookupResponse:(BOOL)a9 vendingAtomicInstanceForConfiguredEntries:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v24 = a5;
  id v23 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MADAutoSetConfiguration;
  v20 = -[MADAutoSetConfiguration init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_clientDomainName, a3);
    objc_storeStrong((id *)&v21->_autoAssetSetClientName, a4);
    objc_storeStrong((id *)&v21->_assetSetIdentifier, a5);
    objc_storeStrong((id *)&v21->_autoAssetEntries, a6);
    objc_storeStrong((id *)&v21->_latestAtomicInstanceToVend, a7);
    v21->_inhibitImpliedScheduling = a8;
    v21->_haveReceivedLookupResponse = a9;
    v21->_vendingAtomicInstanceForConfiguredEntries = a10;
  }

  return v21;
}

- (MADAutoSetConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADAutoSetConfiguration;
  v5 = -[MADAutoSetConfiguration init](&v23, "init");
  if (v5)
  {
    v24[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v24[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v24[2] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v24[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v24[4] = objc_opt_class(&OBJC_CLASS___NSData);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 5LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetSetClientName"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"autoAssetEntries"]);
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v17;

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"latestAtomicInstanceToVend"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    latestAtomicInstanceToVend = v5->_latestAtomicInstanceToVend;
    v5->_latestAtomicInstanceToVend = (NSString *)v20;

    v5->_inhibitImpliedScheduling = [v4 decodeBoolForKey:@"inhibitImpliedScheduling"];
    v5->_haveReceivedLookupResponse = [v4 decodeBoolForKey:@"haveReceivedLookupResponse"];
    v5->_vendingAtomicInstanceForConfiguredEntries = [v4 decodeBoolForKey:@"vendingAtomicInstanceForConfiguredEntries"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](self, "clientDomainName"));
  [v9 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetSetClientName](self, "autoAssetSetClientName"));
  [v9 encodeObject:v5 forKey:@"autoAssetSetClientName"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](self, "assetSetIdentifier"));
  [v9 encodeObject:v6 forKey:@"assetSetIdentifier"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  [v9 encodeObject:v7 forKey:@"autoAssetEntries"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  [v9 encodeObject:v8 forKey:@"latestAtomicInstanceToVend"];

  objc_msgSend( v9,  "encodeBool:forKey:",  -[MADAutoSetConfiguration inhibitImpliedScheduling](self, "inhibitImpliedScheduling"),  @"inhibitImpliedScheduling");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[MADAutoSetConfiguration haveReceivedLookupResponse](self, "haveReceivedLookupResponse"),  @"haveReceivedLookupResponse");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[MADAutoSetConfiguration vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"),  @"vendingAtomicInstanceForConfiguredEntries");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)assetSetEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      v10 = 0LL;
      id v22 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        uint64_t v12 = p_ivars[155];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSelector]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v12, "stringIsEqual:to:", v14, v6) & 1) != 0)
        {
          uint64_t v15 = p_ivars[155];
          uint64_t v16 = v8;
          uint64_t v17 = p_ivars;
          id v18 = v6;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSelector]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSpecifier]);
          LODWORD(v15) = -[__objc2_ivar_list stringIsEqual:to:](v15, "stringIsEqual:to:", v20, v23);

          id v6 = v18;
          p_ivars = v17;
          uint64_t v8 = v16;
          id v7 = v22;

          if ((_DWORD)v15)
          {
            id v7 = v11;
            goto LABEL_12;
          }
        }

        else
        {
        }

        v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

- (BOOL)refererncesAssetType:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) assetSelector]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetType]);
        unsigned __int8 v11 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v10, v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)managesAssetSelector:(id)a3
{
  id v4 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        v10 = p_ivars[155];
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetSelector", v21));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v10, "stringIsEqual:to:", v12, v13) & 1) != 0)
        {
          __int128 v14 = p_ivars[155];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSpecifier]);
          id v17 = v5;
          id v18 = v4;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 assetSpecifier]);
          LOBYTE(v14) = -[__objc2_ivar_list stringIsEqual:to:](v14, "stringIsEqual:to:", v16, v19);

          id v4 = v18;
          id v5 = v17;

          uint64_t v6 = v21;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }

        else
        {
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v5);
  }

- (id)firstEntryAssetType
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSelector]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);

        if (v8)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSelector]);
          id v3 = (id)objc_claimAutoreleasedReturnValue([v9 assetType]);

          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)copy
{
  id v3 = objc_alloc(&OBJC_CLASS___MADAutoSetConfiguration);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](self, "clientDomainName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetSetClientName](self, "autoAssetSetClientName"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](self, "assetSetIdentifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  id v8 = [v7 copy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  BOOL v10 = -[MADAutoSetConfiguration inhibitImpliedScheduling](self, "inhibitImpliedScheduling");
  unsigned __int8 v11 = -[MADAutoSetConfiguration haveReceivedLookupResponse](self, "haveReceivedLookupResponse");
  BYTE1(v14) = -[MADAutoSetConfiguration vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries");
  LOBYTE(v14) = v11;
  id v12 = -[MADAutoSetConfiguration initForClientDomainName:forSetClientName:forAssetSetIdentifier:withAutoAssetEntries:withLatestAtomicInstanceToVend:inhibitingImpliedScheduling:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:]( v3,  "initForClientDomainName:forSetClientName:forAssetSetIdentifier:withAutoAssetEntries:withLatestAtomicInstanceTo Vend:inhibitingImpliedScheduling:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:",  v4,  v5,  v6,  v8,  v9,  v10,  v14);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MADAutoSetConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADAutoSetConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      uint64_t v6 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](self, "clientDomainName"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](v6, "clientDomainName"));
      if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v7, v8) & 1) != 0)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](self, "assetSetIdentifier"));
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](v6, "assetSetIdentifier"));
        unsigned int v11 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v9, v10);

        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
          __int128 v13 = (char *)[v12 count];

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](v6, "autoAssetEntries"));
          __int128 v15 = (char *)[v14 count];

          if (v13 == v15)
          {
            if ((uint64_t)v13 < 1)
            {
              BOOL v16 = 1;
            }

            else
            {
              __int128 v27 = v13;
              BOOL v16 = 0;
              for (i = 0LL; i != v27; BOOL v16 = (uint64_t)i >= (uint64_t)v27)
              {
                id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:i]);

                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](v6, "autoAssetEntries"));
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:i]);

                id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSelector]);
                __int128 v23 = v6;
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 assetSelector]);
                unsigned __int8 v25 = [v22 isEqual:v24];

                uint64_t v6 = v23;
                if ((v25 & 1) == 0) {
                  break;
                }
                ++i;
              }
            }

            goto LABEL_15;
          }
        }
      }

      else
      {
      }

      BOOL v16 = 0;
LABEL_15:

      goto LABEL_16;
    }

    BOOL v16 = 0;
  }

- (id)newSummaryWithoutEntryID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetSetClientName](self, "autoAssetSetClientName"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self, "autoAssetEntries"));
  id v5 = [v4 count];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  if (v6) {
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration latestAtomicInstanceToVend](self, "latestAtomicInstanceToVend"));
  }
  else {
    uint64_t v7 = @"N";
  }
  if (-[MADAutoSetConfiguration inhibitImpliedScheduling](self, "inhibitImpliedScheduling")) {
    id v8 = @"Y";
  }
  else {
    id v8 = @"N";
  }
  if (-[MADAutoSetConfiguration haveReceivedLookupResponse](self, "haveReceivedLookupResponse")) {
    id v9 = @"Y";
  }
  else {
    id v9 = @"N";
  }
  if (-[MADAutoSetConfiguration vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"))
  {
    BOOL v10 = @"Y";
  }

  else
  {
    BOOL v10 = @"N";
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientName:%@|setEntries:%ld|latestToVend:%@|inhibitScheduling:%@|lookupRsp:%@|vendingforConfig:%@]",  v3,  v5,  v7,  v8,  v9,  v10));
  if (v6) {

  }
  return v11;
}

- (id)persistedEntryID
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](self, "clientDomainName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](self, "assetSetIdentifier"));
  uint64_t v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@_%@", v4, v5);

  return v6;
}

- (void)setAutoAssetSetClientName:(id)a3
{
}

- (void)setAutoAssetEntries:(id)a3
{
}

- (NSString)latestAtomicInstanceToVend
{
  return self->_latestAtomicInstanceToVend;
}

- (void)setLatestAtomicInstanceToVend:(id)a3
{
}

- (void)setInhibitImpliedScheduling:(BOOL)a3
{
  self->_inhibitImpliedScheduling = a3;
}

- (BOOL)haveReceivedLookupResponse
{
  return self->_haveReceivedLookupResponse;
}

- (void)setHaveReceivedLookupResponse:(BOOL)a3
{
  self->_haveReceivedLookupResponse = a3;
}

- (BOOL)vendingAtomicInstanceForConfiguredEntries
{
  return self->_vendingAtomicInstanceForConfiguredEntries;
}

- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3
{
  self->_vendingAtomicInstanceForConfiguredEntries = a3;
}

- (void).cxx_destruct
{
}

@end