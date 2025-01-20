@interface MIStashMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIStashMetadata)initWithCoder:(id)a3;
- (NSDate)dateOriginallyInstalled;
- (NSDate)dateStashed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateOriginallyInstalled:(id)a3;
- (void)setDateStashed:(id)a3;
@end

@implementation MIStashMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStashMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStashMetadata init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStashed"];
    dateStashed = v5->_dateStashed;
    v5->_dateStashed = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOriginallyInstalled"];
    dateOriginallyInstalled = v5->_dateOriginallyInstalled;
    v5->_dateOriginallyInstalled = (NSDate *)v8;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[MIStashMetadata dateStashed](self, "dateStashed");
  uint64_t v6 = (void *)[v5 copy];
  [v4 setDateStashed:v6];
  v7 = -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDateOriginallyInstalled:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStashMetadata dateStashed](self, "dateStashed");
  [v4 encodeObject:v5 forKey:@"dateStashed"];

  -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"dateOriginallyInstalled"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStashMetadata *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStashMetadata dateStashed](self, "dateStashed");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MIStashMetadata dateStashed](v5, "dateStashed");
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
        v10 = -[MIStashMetadata dateOriginallyInstalled](v5, "dateOriginallyInstalled");
        BOOL v11 = MICompareObjects(v9, v10);
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStashMetadata dateStashed](self, "dateStashed");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  [v3 stringWithFormat:@"<%@<%p> dateStashed=%@ dateOriginallyInstalled=%@>", v5, self, v6, v7];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)metadataFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v26 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v5 options:3 error:&v26];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v26;
  BOOL v8 = v7;
  if (!v6)
  {
    [v7 domain];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:*MEMORY[0x189607460]])
    {
      uint64_t v17 = [v8 code];

      if (v17 == 260) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    [v5 path];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIStashMetadata metadataFromURL:error:]",  108LL,  @"MIInstallerErrorDomain",  130LL,  v8,  0LL,  @"Failed to read stash metadata from %@",  v21,  (uint64_t)v20);

    v9 = 0LL;
    BOOL v11 = 0LL;
    BOOL v8 = (void *)v22;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  id v25 = v7;
  v9 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v6 error:&v25];
  id v10 = v25;

  if (!v9)
  {
    [v5 path];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"+[MIStashMetadata metadataFromURL:error:]",  115LL,  @"MIInstallerErrorDomain",  130LL,  v10,  0LL,  @"Failed to read stash metadata from %@",  v19,  (uint64_t)v18);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v9 = 0LL;
    BOOL v11 = 0LL;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  [v9 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1896075C8]];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    [v9 error];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = _CreateAndLogError( (uint64_t)"+[MIStashMetadata metadataFromURL:error:]",  121LL,  @"MIInstallerErrorDomain",  130LL,  v12,  0LL,  @"Failed to decode stash metadata from %@",  v14,  (uint64_t)v13);

    id v10 = (id)v15;
  }

  [v9 finishDecoding];
  BOOL v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11) {
      *a4 = v8;
    }
  }

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v7 encodeObject:self forKey:*MEMORY[0x1896075C8]];
  [v7 encodedData];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v15 = 0LL;
    char v9 = [v8 writeToURL:v6 options:268435457 error:&v15];
    id v10 = v15;
    if ((v9 & 1) == 0)
    {
      [v6 path];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = _CreateAndLogError( (uint64_t)"-[MIStashMetadata serializeToURL:error:]",  159LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to write serialized MIStashedBundleMetadata to %@",  v12,  (uint64_t)v11);

      id v10 = (id)v13;
    }

    if (a4 && v10)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10 == 0LL;
}

- (NSDate)dateStashed
{
  return self->_dateStashed;
}

- (void)setDateStashed:(id)a3
{
}

- (NSDate)dateOriginallyInstalled
{
  return self->_dateOriginallyInstalled;
}

- (void)setDateOriginallyInstalled:(id)a3
{
}

- (void).cxx_destruct
{
}

@end