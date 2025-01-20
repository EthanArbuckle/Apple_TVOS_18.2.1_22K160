@interface MAAutoAssetSetEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)assetLockedInhibitsRemoval;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSetEntry)initWithCoder:(id)a3;
- (id)copy;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetLockedInhibitsRemoval:(BOOL)a3;
- (void)setAssetSelector:(id)a3;
@end

@implementation MAAutoAssetSetEntry

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  a5,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  0LL,  a5);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  a5,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetEntry;
  v16 = -[MAAutoAssetSetEntry init](&v20, sel_init);
  if (v16)
  {
    v17 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  v12,  v13,  v14,  v15);
    assetSelector = v16->_assetSelector;
    v16->_assetSelector = v17;

    v16->_assetLockedInhibitsRemoval = a7;
  }

  return v16;
}

- (MAAutoAssetSetEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetEntry;
  v5 = -[MAAutoAssetSetEntry init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetLockedInhibitsRemoval = [v4 decodeBoolForKey:@"assetLockedInhibitsRemoval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"assetSelector"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"),  @"assetLockedInhibitsRemoval");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 assetSpecifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  [v8 downloadDecryptionKey];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:]( v3,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:",  v5,  v7,  v9,  -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAutoAssetSetEntry *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      -[MAAutoAssetSetEntry assetSelector](v5, "assetSelector");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = -[MAAutoAssetSetEntry assetSelector](v5, "assetSelector");
        v8 = -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
        if ([v7 isEqual:v8])
        {
          BOOL v9 = -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](v5, "assetLockedInhibitsRemoval");
          int v10 = v9 ^ -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval") ^ 1;
        }

        else
        {
          LOBYTE(v10) = 0;
        }
      }

      else
      {
        LOBYTE(v10) = 0;
      }
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)summary
{
  v3 = (void *)NSString;
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 summary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval");
  v7 = @"N";
  if (v6) {
    v7 = @"Y";
  }
  [v3 stringWithFormat:@"assetSelector:%@|assetLockedInhibitsRemoval:%@", v5, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (BOOL)assetLockedInhibitsRemoval
{
  return self->_assetLockedInhibitsRemoval;
}

- (void)setAssetLockedInhibitsRemoval:(BOOL)a3
{
  self->_assetLockedInhibitsRemoval = a3;
}

- (void).cxx_destruct
{
}

@end