@interface MANAutoAssetSetTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MANAutoAssetSetTarget)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)maxTargetOSVersion;
- (NSString)minTargetOSVersion;
- (id)copy;
- (id)description;
- (id)initForMinTargetOSVersion:(id)a3 toMaxTargetOSVersion:(id)a4 asEntriesWhenTargeting:(id)a5;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setMaxTargetOSVersion:(id)a3;
- (void)setMinTargetOSVersion:(id)a3;
@end

@implementation MANAutoAssetSetTarget

- (id)initForMinTargetOSVersion:(id)a3 toMaxTargetOSVersion:(id)a4 asEntriesWhenTargeting:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetTarget;
  v12 = -[MANAutoAssetSetTarget init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minTargetOSVersion, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MANAutoAssetSetTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetTarget;
  v5 = -[MANAutoAssetSetTarget init](&v18, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"minTargetOSVersion"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    minTargetOSVersion = v5->_minTargetOSVersion;
    v5->_minTargetOSVersion = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"maxTargetOSVersion"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    maxTargetOSVersion = v5->_maxTargetOSVersion;
    v5->_maxTargetOSVersion = (NSString *)v10;

    v12 = objc_alloc(&OBJC_CLASS___NSSet);
    v19[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v19[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v19[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v19[3] = objc_opt_class(&OBJC_CLASS___NSArray);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));
    v14 = -[NSSet initWithArray:](v12, "initWithArray:", v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"autoAssetEntries"]);
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  [v4 encodeObject:v5 forKey:@"minTargetOSVersion"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  [v4 encodeObject:v6 forKey:@"maxTargetOSVersion"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
  [v4 encodeObject:v7 forKey:@"autoAssetEntries"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetTarget);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v7 = -[MANAutoAssetSetTarget initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:]( v3,  "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:",  v4,  v5,  v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MANAutoAssetSetTarget *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetTarget);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
      if (!v7)
      {
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
        if (v10)
        {
          id v11 = (void *)v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](v6, "minTargetOSVersion"));
          if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v12, v13))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](v6, "maxTargetOSVersion"));
            v28 = v14;
            if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v15))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](v6, "autoAssetEntries"));

              if (v16)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
                uint64_t v18 = (uint64_t)[v17 count];

                v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](v6, "autoAssetEntries"));
                id v20 = [v19 count];

                if (v20 == (id)v18)
                {
                  uint64_t v21 = 0LL;
                  uint64_t v22 = v18 & ~(v18 >> 63);
                  do
                  {
                    LOBYTE(v7) = v22 == v21;
                    if (v22 == v21) {
                      break;
                    }
                    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:v21]);

                    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](v6, "autoAssetEntries"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue([(id)v25 objectAtIndex:v21]);

                    ++v21;
                    LOBYTE(v25) = [v26 isEqual:v24];
                  }

                  while ((v25 & 1) != 0);
                  goto LABEL_21;
                }
              }

              goto LABEL_20;
            }
          }
        }
      }

LABEL_20:
      LOBYTE(v7) = 0;
      goto LABEL_21;
    }

    LOBYTE(v7) = 0;
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget summary](self, "summary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\nautoAssetEntries:\n%@",  v3,  v5));

  return v6;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"targetOSVersion:%@..%@|autoAssetEntries:%ld",  v3,  v4,  [v5 count]));

  return v6;
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