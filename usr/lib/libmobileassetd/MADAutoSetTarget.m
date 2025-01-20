@interface MADAutoSetTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)includesEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (MADAutoSetTarget)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (NSString)maxTargetOSVersion;
- (NSString)minTargetOSVersion;
- (id)assetSetEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4;
- (id)copy;
- (id)description;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 fromMinTargetOSVersion:(id)a5 toMaxTargetOSVersion:(id)a6 asEntriesWhenTargeting:(id)a7;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setMaxTargetOSVersion:(id)a3;
- (void)setMinTargetOSVersion:(id)a3;
@end

@implementation MADAutoSetTarget

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 fromMinTargetOSVersion:(id)a5 toMaxTargetOSVersion:(id)a6 asEntriesWhenTargeting:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MADAutoSetTarget;
  v17 = -[MADAutoSetTarget init](&v21, "init");
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientDomainName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (MADAutoSetTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MADAutoSetTarget;
  v5 = -[MADAutoSetTarget init](&v24, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"minTargetOSVersion"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    minTargetOSVersion = v5->_minTargetOSVersion;
    v5->_minTargetOSVersion = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"maxTargetOSVersion"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    maxTargetOSVersion = v5->_maxTargetOSVersion;
    v5->_maxTargetOSVersion = (NSString *)v16;

    v18 = objc_alloc(&OBJC_CLASS___NSSet);
    v25[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v25[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v25[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v25[3] = objc_opt_class(&OBJC_CLASS___NSArray);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL));
    id v20 = -[NSSet initWithArray:](v18, "initWithArray:", v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"autoAssetEntries"]);
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v21;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](self, "clientDomainName"));
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v6 forKey:@"assetSetIdentifier"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  [v4 encodeObject:v7 forKey:@"minTargetOSVersion"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  [v4 encodeObject:v8 forKey:@"maxTargetOSVersion"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  [v4 encodeObject:v9 forKey:@"autoAssetEntries"];
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
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      uint64_t v10 = 0LL;
      id v22 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        id v12 = p_ivars[155];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSelector]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v12, "stringIsEqual:to:", v14, v6) & 1) != 0)
        {
          id v15 = p_ivars[155];
          uint64_t v16 = v8;
          v17 = p_ivars;
          id v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSelector]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSpecifier]);
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

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MADAutoSetTarget);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](self, "clientDomainName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](self, "assetSetIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v9 = -[MADAutoSetTarget initForClientDomainName:forAssetSetIdentifier:fromMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:]( v3,  "initForClientDomainName:forAssetSetIdentifier:fromMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:",  v4,  v5,  v6,  v7,  v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MADAutoSetTarget *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADAutoSetTarget);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](self, "clientDomainName"));
      if (!v7)
      {
LABEL_22:

        goto LABEL_23;
      }

      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](self, "assetSetIdentifier"));
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
        if (v10)
        {
          v11 = (void *)v10;
          uint64_t v12 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            uint64_t v14 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
            if (v14)
            {
              id v15 = (void *)v14;
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](self, "clientDomainName"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](v6, "clientDomainName"));
              if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v16, v17))
              {
                v43 = v15;
                v44 = v16;
                id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](self, "assetSetIdentifier"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](v6, "assetSetIdentifier"));
                if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v18, v19))
                {
                  v41 = v19;
                  v42 = v18;
                  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](v6, "minTargetOSVersion"));
                  v40 = (void *)v20;
                  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v20))
                  {
                    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
                    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](v6, "maxTargetOSVersion"));
                    v38 = (void *)v21;
                    uint64_t v23 = v21;
                    objc_super v24 = (void *)v22;
                    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v23, v22))
                    {
                      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](v6, "autoAssetEntries"));
                      BOOL v26 = v25 == 0LL;
                    }

                    else
                    {
                      BOOL v26 = 1;
                    }
                  }

                  else
                  {
                    BOOL v26 = 1;
                  }

                  if (!v26)
                  {
                    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
                    uint64_t v29 = (uint64_t)[v28 count];

                    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](v6, "autoAssetEntries"));
                    id v31 = [v30 count];

                    if (v31 == (id)v29)
                    {
                      uint64_t v32 = 0LL;
                      uint64_t v33 = v29 & ~(v29 >> 63);
                      do
                      {
                        LOBYTE(v7) = v33 == v32;
                        if (v33 == v32) {
                          break;
                        }
                        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
                        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndex:v32]);

                        uint64_t v36 = objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](v6, "autoAssetEntries"));
                        v37 = (void *)objc_claimAutoreleasedReturnValue([(id)v36 objectAtIndex:v32]);

                        ++v32;
                        LOBYTE(v36) = [v37 isEqual:v35];
                      }

                      while ((v36 & 1) != 0);
                      goto LABEL_22;
                    }
                  }

                  goto LABEL_21;
                }

                id v15 = v43;
                uint64_t v16 = v44;
              }
            }
          }
        }
      }

LABEL_21:
      LOBYTE(v7) = 0;
      goto LABEL_22;
    }

    LOBYTE(v7) = 0;
  }

- (BOOL)includesEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4
{
  id v6 = a3;
  id v17 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
        if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v12, v6) & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSpecifier]);
          unsigned __int8 v15 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v17);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }

        else
        {
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget summary](self, "summary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\nautoAssetEntries:\n%@",  v3,  v5));

  return v6;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget clientDomainName](self, "clientDomainName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget assetSetIdentifier](self, "assetSetIdentifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"clientDomain:%@|setIdentifier:%@|targetOSVersion:%@..%@|autoAssetEntries:%ld",  v3,  v4,  v5,  v6,  [v7 count]));

  return v8;
}

- (id)newSummaryWithoutEntryID
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v7 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"targetOSVersion:%@..%@|autoAssetEntries:%ld",  v4,  v5,  [v6 count]);

  return v7;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (NSString)minTargetOSVersion
{
  return self->_minTargetOSVersion;
}

- (void)setMinTargetOSVersion:(id)a3
{
}

- (NSString)maxTargetOSVersion
{
  return self->_maxTargetOSVersion;
}

- (void)setMaxTargetOSVersion:(id)a3
{
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (void)setAutoAssetEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end