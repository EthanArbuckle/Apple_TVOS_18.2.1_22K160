@interface MANAutoAssetSetEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)assetLockedInhibitsRemoval;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (MANAutoAssetSetEntry)initWithCoder:(id)a3;
- (id)copy;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 withAssetVersion:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 withAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetLockedInhibitsRemoval:(BOOL)a3;
- (void)setAssetSelector:(id)a3;
@end

@implementation MANAutoAssetSetEntry

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (BOOL)assetLockedInhibitsRemoval
{
  return self->_assetLockedInhibitsRemoval;
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  a5,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  0LL,  a5);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  a5,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 withAssetVersion:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6
{
  return -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( self,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  a3,  a4,  a5,  0LL,  a6);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 withAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetEntry;
  v16 = -[MANAutoAssetSetEntry init](&v20, "init");
  if (v16)
  {
    v17 = (MAAutoAssetSelector *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  v12,  v13,  v14,  v15);
    assetSelector = v16->_assetSelector;
    v16->_assetSelector = v17;

    v16->_assetLockedInhibitsRemoval = a7;
  }

  return v16;
}

- (MANAutoAssetSetEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetEntry;
  v5 = -[MANAutoAssetSetEntry init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v7;

    v5->_assetLockedInhibitsRemoval = [v4 decodeBoolForKey:@"assetLockedInhibitsRemoval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
  [v5 encodeObject:v4 forKey:@"assetSelector"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[MANAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"),  @"assetLockedInhibitsRemoval");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetEntry);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSpecifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadDecryptionKey]);
  id v10 = -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:]( v3,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:",  v5,  v7,  v9,  -[MANAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MANAutoAssetSetEntry *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](v6, "assetSelector"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](v6, "assetSelector"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
        if ([v8 isEqual:v9])
        {
          unsigned int v10 = -[MANAutoAssetSetEntry assetLockedInhibitsRemoval](v6, "assetLockedInhibitsRemoval");
          unsigned int v11 = v10 ^ -[MANAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval") ^ 1;
        }

        else
        {
          LOBYTE(v11) = 0;
        }
      }

      else
      {
        LOBYTE(v11) = 0;
      }
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetEntry assetSelector](self, "assetSelector"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  unsigned int v5 = -[MANAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval");
  id v6 = @"N";
  if (v5) {
    id v6 = @"Y";
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"assetSelector:%@|assetLockedInhibitsRemoval:%@",  v4,  v6));

  return v7;
}

- (void)setAssetSelector:(id)a3
{
}

- (void)setAssetLockedInhibitsRemoval:(BOOL)a3
{
  self->_assetLockedInhibitsRemoval = a3;
}

- (void).cxx_destruct
{
}

@end