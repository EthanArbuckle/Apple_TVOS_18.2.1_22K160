@interface ICLAppRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdatedSystemApp;
- (ICLAppRecord)initWithCoder:(id)a3;
- (ICLAppRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSArray)driverKitExtensionURLs;
- (NSArray)stashedVersions;
- (NSURL)parallelPlaceholderURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDriverKitExtensionURLs:(id)a3;
- (void)setIsUpdatedSystemApp:(BOOL)a3;
- (void)setParallelPlaceholderURL:(id)a3;
- (void)setStashedVersions:(id)a3;
@end

@implementation ICLAppRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLAppRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  v5 = -[ICLPlaceholderRecord initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parallelPlaceholderURL"];
    parallelPlaceholderURL = v5->_parallelPlaceholderURL;
    v5->_parallelPlaceholderURL = (NSURL *)v6;

    v5->_isUpdatedSystemApp = [v4 decodeBoolForKey:@"isUpdatedSystemApp"];
    v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"driverKitExtensionURLs"];
    driverKitExtensionURLs = v5->_driverKitExtensionURLs;
    v5->_driverKitExtensionURLs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x189604010];
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"stashedVersions"];
    stashedVersions = v5->_stashedVersions;
    v5->_stashedVersions = (NSArray *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  id v4 = a3;
  -[ICLPlaceholderRecord encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v5 = -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL", v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"parallelPlaceholderURL"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"),  @"isUpdatedSystemApp");
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"driverKitExtensionURLs"];
  v7 = -[ICLAppRecord stashedVersions](self, "stashedVersions");
  [v4 encodeObject:v7 forKey:@"stashedVersions"];
}

- (ICLAppRecord)initWithLegacyRecordDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  v5 = -[ICLPlaceholderRecord initWithLegacyRecordDictionary:](&v33, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"ParallelPlaceholderPath"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    if (v8)
    {
      [MEMORY[0x189604030] fileURLWithPath:v8 isDirectory:1];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLAppRecord setParallelPlaceholderURL:](v5, "setParallelPlaceholderURL:", v9);
    }

    [v4 objectForKeyedSubscript:@"IsUpdatedSystemApp"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLAppRecord setIsUpdatedSystemApp:](v5, "setIsUpdatedSystemApp:", MIBooleanValue(v10, 0LL));

    [v4 objectForKeyedSubscript:@"DriverKitExtensionPaths"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }

    if (v13)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v13))
      {
        id v28 = v8;
        uint64_t v14 = (void *)objc_opt_new();
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            uint64_t v19 = 0LL;
            do
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              [MEMORY[0x189604030] fileURLWithPath:*(void *)(*((void *)&v29 + 1) + 8 * v19) isDirectory:1];
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v14 addObject:v20];

              ++v19;
            }

            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
          }

          while (v17);
        }

        v21 = (void *)[v14 copy];
        -[ICLAppRecord setDriverKitExtensionURLs:](v5, "setDriverKitExtensionURLs:", v21);

        id v8 = v28;
      }
    }

    [v4 objectForKeyedSubscript:@"StashedVersionInfo"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v24 = v23;
    }
    else {
      id v24 = 0LL;
    }

    if (v24)
    {
      v25 = -[ICLStashedAppRecord initWithLegacyRecordDictionary:]( objc_alloc(&OBJC_CLASS___ICLStashedAppRecord),  "initWithLegacyRecordDictionary:",  v24);
      v34 = v25;
      [MEMORY[0x189603F18] arrayWithObjects:&v34 count:1];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLAppRecord setStashedVersions:](v5, "setStashedVersions:", v26);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  id v5 = -[ICLPlaceholderRecord copyWithZone:](&v13, sel_copyWithZone_);
  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setParallelPlaceholderURL:v7];

  objc_msgSend(v5, "setIsUpdatedSystemApp:", -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"));
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDriverKitExtensionURLs:v9];
  v10 = -[ICLAppRecord stashedVersions](self, "stashedVersions");
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setStashedVersions:v11];

  return v5;
}

- (id)legacyRecordDictionary
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  -[ICLPlaceholderRecord legacyRecordDictionary](&v27, sel_legacyRecordDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v4];

  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"ParallelPlaceholderPath"];
  }

  if (-[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp")) {
    uint64_t v7 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v7 = MEMORY[0x189604A80];
  }
  [v3 setObject:v7 forKeyedSubscript:@"IsUpdatedSystemApp"];
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    v10 = (void *)objc_opt_new();
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v15), "path", (void)v23);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 addObject:v16];

          ++v15;
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v13);
    }

    uint64_t v17 = (void *)[v10 copy];
    if (v17) {
      [v3 setObject:v17 forKeyedSubscript:@"DriverKitExtensionPaths"];
    }
  }

  -[ICLAppRecord stashedVersions](self, "stashedVersions", (void)v23);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 firstObject];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v19 legacyRecordDictionary];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20) {
      [v3 setObject:v20 forKeyedSubscript:@"StashedVersionInfo"];
    }
  }

  v21 = (void *)[v3 copy];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLAppRecord *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
      if (-[ICLPlaceholderRecord isEqual:](&v18, sel_isEqual_, v4))
      {
        id v5 = v4;
        -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLAppRecord parallelPlaceholderURL](v5, "parallelPlaceholderURL");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          BOOL v9 = -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp");
          if (v9 == -[ICLAppRecord isUpdatedSystemApp](v5, "isUpdatedSystemApp"))
          {
            -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLAppRecord driverKitExtensionURLs](v5, "driverKitExtensionURLs");
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v14 = MICompareObjects(v12, v13);

            if (v14)
            {
              -[ICLAppRecord stashedVersions](self, "stashedVersions");
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLAppRecord stashedVersions](v5, "stashedVersions");
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v17 = MICompareObjects(v15, v16);

              if (v17)
              {
                BOOL v10 = 1;
                goto LABEL_15;
              }

              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_14:
                BOOL v10 = 0;
LABEL_15:

                goto LABEL_16;
              }
            }

            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_14;
            }
          }

          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_14;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_14;
        }

        MOLogWrite();
        goto LABEL_14;
      }
    }

    BOOL v10 = 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp");
  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 hash];

  -[ICLAppRecord stashedVersions](self, "stashedVersions");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;

  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v7 ^ [v8 hash];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICLAppRecord;
  return v9 ^ -[ICLPlaceholderRecord hash](&v11, sel_hash);
}

- (NSURL)parallelPlaceholderURL
{
  return self->_parallelPlaceholderURL;
}

- (void)setParallelPlaceholderURL:(id)a3
{
}

- (BOOL)isUpdatedSystemApp
{
  return self->_isUpdatedSystemApp;
}

- (void)setIsUpdatedSystemApp:(BOOL)a3
{
  self->_isUpdatedSystemApp = a3;
}

- (NSArray)driverKitExtensionURLs
{
  return self->_driverKitExtensionURLs;
}

- (void)setDriverKitExtensionURLs:(id)a3
{
}

- (NSArray)stashedVersions
{
  return self->_stashedVersions;
}

- (void)setStashedVersions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end