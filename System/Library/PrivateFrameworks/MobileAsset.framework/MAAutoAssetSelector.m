@interface MAAutoAssetSelector
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSelector)initWithCoder:(id)a3;
- (NSData)downloadDecryptionKey;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (id)copy;
- (id)copyClearingWriteOnlyFields;
- (id)initForAssetType:(id)a3;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5;
- (id)newSummaryDictionary;
- (id)persistedEntryID;
- (id)shortName;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetVersion:(id)a3;
@end

@implementation MAAutoAssetSelector

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  a3,  a4,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  a3,  a4,  0LL,  a5);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  a3,  a4,  a5,  0LL);
}

- (id)initForAssetType:(id)a3
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( self,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  a3,  0LL,  0LL,  0LL);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MAAutoAssetSelector;
  v15 = -[MAAutoAssetSelector init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MAAutoAssetSelector)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAAutoAssetSelector;
  v5 = -[MAAutoAssetSelector init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSpecifier"];
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadDecryptionKey"];
    downloadDecryptionKey = v5->_downloadDecryptionKey;
    v5->_downloadDecryptionKey = (NSData *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSelector assetType](self, "assetType");
  [v4 encodeObject:v5 forKey:@"assetType"];

  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"assetSpecifier"];
  v7 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  [v4 encodeObject:v7 forKey:@"assetVersion"];

  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"downloadDecryptionKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  -[MAAutoAssetSelector assetType](self, "assetType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  id v8 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( v3,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  v4,  v5,  v6,  v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (MAAutoAssetSelector *)a3;
  if (v5 == self)
  {
    char v14 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = v5;
      uint64_t v7 = -[MAAutoAssetSelector assetType](v6, "assetType");
      if (!v7) {
        goto LABEL_28;
      }
      id v8 = (void *)v7;
      uint64_t v9 = -[MAAutoAssetSelector assetSpecifier](v6, "assetSpecifier");
      if (!v9)
      {
        char v14 = 0;
LABEL_40:

        goto LABEL_41;
      }

      uint64_t v10 = (void *)v9;
      -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        uint64_t v15 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
        if (v15)
        {
          v16 = (void *)v15;
          char v14 = 0;
          goto LABEL_38;
        }
      }

      -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v3 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
        if (!v3)
        {
          LOBYTE(v13) = 1;
          goto LABEL_26;
        }
      }
      v17 = -[MAAutoAssetSelector downloadDecryptionKey](v6, "downloadDecryptionKey");
      if (!v17)
      {
        v20 = -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
        if (v20)
        {
          LOBYTE(v13) = 1;
          goto LABEL_25;
        }
      }

      uint64_t v13 = -[MAAutoAssetSelector downloadDecryptionKey](v6, "downloadDecryptionKey");
      if (v13)
      {
        v26 = v3;
        -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v19 = v18 == 0LL;

        if (v17)
        {
          LOBYTE(v13) = v19;
          v3 = v26;
          goto LABEL_21;
        }

        v20 = 0LL;
        LOBYTE(v13) = v19;
        v3 = v26;
      }

      else
      {
        if (v17)
        {
LABEL_21:

          if (!v12)
          {
LABEL_27:

            if ((v13 & 1) == 0)
            {
              -[MAAutoAssetSelector assetType](v6, "assetType");
              id v8 = (void *)objc_claimAutoreleasedReturnValue();
              -[MAAutoAssetSelector assetType](self, "assetType");
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (![v8 isEqualToString:v10])
              {
                char v14 = 0;
LABEL_39:

                goto LABEL_40;
              }
              v16 = -[MAAutoAssetSelector assetSpecifier](v6, "assetSpecifier");
              v21 = -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
              if ([v16 isEqualToString:v21])
              {
                v22 = -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
                if (v22)
                {
                  v23 = -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
                  v24 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
                  char v14 = [v23 isEqualToString:v24];
                }

                else
                {
                  char v14 = 1;
                }
              }

              else
              {
                char v14 = 0;
              }

LABEL_38:
              goto LABEL_39;
            }

- (id)copyClearingWriteOnlyFields
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  -[MAAutoAssetSelector assetType](self, "assetType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v3,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v4,  v5,  v6);

  return v7;
}

- (id)persistedEntryID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x189607940]);
    v5 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    uint64_t v6 = (void *)[v4 initWithString:v5];

    objc_msgSend( v6,  "replaceOccurrencesOfString:withString:options:range:",  @",",  @"_",  2,  0,  objc_msgSend(v6, "length"));
    id v7 = objc_alloc(NSString);
    -[MAAutoAssetSelector assetType](self, "assetType");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v7 initWithFormat:@"%@_%@_%@", v8, v9, v6];
  }

  else
  {
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    id v12 = objc_alloc(NSString);
    uint64_t v13 = -[MAAutoAssetSelector assetType](self, "assetType");
    uint64_t v6 = (void *)v13;
    if (!v11)
    {
      uint64_t v10 = (void *)[v12 initWithFormat:@"%@_ENTIRE_ASSET_TYPE", v13];
      goto LABEL_6;
    }

    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v12 initWithFormat:@"%@_%@", v6, v8];
  }

LABEL_6:
  return v10;
}

- (id)shortName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    v5 = -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)[v4 initWithFormat:@"%@(%@)", v5, v6];
  }

  else
  {
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8) {
      -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    }
    else {
      -[MAAutoAssetSelector assetType](self, "assetType");
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = objc_alloc(NSString);
    v5 = -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    uint64_t v6 = (__CFString *)[v4 initWithFormat:@"|version:%@", v5];
  }

  else
  {
    uint64_t v6 = @"(any version)";
  }

  id v7 = (void *)NSString;
  -[MAAutoAssetSelector assetType](self, "assetType");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = @"|decryption:Y";
  if (!v10) {
    id v11 = &stru_189FFC530;
  }
  [v7 stringWithFormat:@"type:%@|specifier:%@%@%@", v8, v9, v6, v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[MAAutoAssetSelector assetType](self, "assetType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v4 forKey:@"assetType"];
  v5 = -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  [v3 setSafeObject:v5 forKey:@"assetSpecifier"];

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setSafeObject:v7 forKey:@"assetVersion"];
  }

  else
  {
    [v3 setSafeObject:@"ANY-VERSION" forKey:@"assetVersion"];
  }

  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"downloadDecryptionKey"];

  return v3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSData)downloadDecryptionKey
{
  return self->_downloadDecryptionKey;
}

- (void).cxx_destruct
{
}

@end