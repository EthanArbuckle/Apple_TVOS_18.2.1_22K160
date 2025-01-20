@interface ICLStashedAppRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICLStashedAppRecord)initWithCoder:(id)a3;
- (ICLStashedAppRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSDate)stashOriginalInstallTimestamp;
- (NSDate)stashedAtTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStashOriginalInstallTimestamp:(id)a3;
- (void)setStashedAtTimestamp:(id)a3;
@end

@implementation ICLStashedAppRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLStashedAppRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  v5 = -[ICLAppRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stashedAtTimestamp"];
    stashedAtTimestamp = v5->_stashedAtTimestamp;
    v5->_stashedAtTimestamp = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stashOriginalInstallTimestamp"];
    stashOriginalInstallTimestamp = v5->_stashOriginalInstallTimestamp;
    v5->_stashOriginalInstallTimestamp = (NSDate *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  id v4 = a3;
  -[ICLAppRecord encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp", v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"stashedAtTimestamp"];

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"stashOriginalInstallTimestamp"];
}

- (ICLStashedAppRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  v5 = -[ICLAppRecord initWithLegacyRecordDictionary:](&v13, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"StashedAtTimestamp"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    -[ICLStashedAppRecord setStashedAtTimestamp:](v5, "setStashedAtTimestamp:", v8);
    [v4 objectForKeyedSubscript:@"StashOriginalInstallTimestamp"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    -[ICLStashedAppRecord setStashOriginalInstallTimestamp:](v5, "setStashOriginalInstallTimestamp:", v11);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  id v5 = -[ICLAppRecord copyWithZone:](&v11, sel_copyWithZone_);
  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setStashedAtTimestamp:v7];

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setStashOriginalInstallTimestamp:v9];

  return v5;
}

- (id)legacyRecordDictionary
{
  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  -[ICLAppRecord legacyRecordDictionary](&v9, sel_legacyRecordDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v4];

  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"StashedAtTimestamp"];
  }

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"StashOriginalInstallTimestamp"];
  }

  id v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLStashedAppRecord *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
      if (-[ICLAppRecord isEqual:](&v14, sel_isEqual_, v4))
      {
        id v5 = v4;
        -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLStashedAppRecord stashedAtTimestamp](v5, "stashedAtTimestamp");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
          objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLStashedAppRecord stashOriginalInstallTimestamp](v5, "stashOriginalInstallTimestamp");
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v11 = MICompareObjects(v9, v10);

          if (v11)
          {
            BOOL v12 = 1;
LABEL_16:

            goto LABEL_17;
          }

          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_15:
            BOOL v12 = 0;
            goto LABEL_16;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_15;
        }

        MOLogWrite();
        goto LABEL_15;
      }
    }

    BOOL v12 = 0;
  }

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 hash] ^ v4;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICLStashedAppRecord;
  return v6 ^ -[ICLAppRecord hash](&v8, sel_hash);
}

- (NSDate)stashedAtTimestamp
{
  return self->_stashedAtTimestamp;
}

- (void)setStashedAtTimestamp:(id)a3
{
}

- (NSDate)stashOriginalInstallTimestamp
{
  return self->_stashOriginalInstallTimestamp;
}

- (void)setStashOriginalInstallTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end