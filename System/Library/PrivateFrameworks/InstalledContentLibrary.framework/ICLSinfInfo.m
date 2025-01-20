@interface ICLSinfInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMIDBasedSINF;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMissingRequiredSINF;
- (ICLSinfInfo)initWithCoder:(id)a3;
- (ICLSinfInfo)initWithLegacySinfInfoDictionary:(id)a3;
- (NSDictionary)legacySinfInfoDictionary;
- (NSNumber)applicationDSID;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationDSID:(id)a3;
- (void)setDownloaderDSID:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setHasMIDBasedSINF:(BOOL)a3;
- (void)setIsMissingRequiredSINF:(BOOL)a3;
@end

@implementation ICLSinfInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLSinfInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[ICLSinfInfo init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationDSID"];
    applicationDSID = v5->_applicationDSID;
    v5->_applicationDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyID"];
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloaderDSID"];
    downloaderDSID = v5->_downloaderDSID;
    v5->_downloaderDSID = (NSNumber *)v10;

    v5->_hasMIDBasedSINF = [v4 decodeBoolForKey:@"hasMIDBasedSINF"];
    v5->_isMissingRequiredSINF = [v4 decodeBoolForKey:@"isMissingRequiredSINF"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"applicationDSID"];
  v5 = -[ICLSinfInfo familyID](self, "familyID");
  [v7 encodeObject:v5 forKey:@"familyID"];

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v6 forKey:@"downloaderDSID"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"),  @"hasMIDBasedSINF");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"),  @"isMissingRequiredSINF");
}

- (ICLSinfInfo)initWithLegacySinfInfoDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[ICLSinfInfo init](self, "init");
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"ApplicationDSID"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    -[ICLSinfInfo setApplicationDSID:](v5, "setApplicationDSID:", v8);
    [v4 objectForKeyedSubscript:@"FamilyID"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    -[ICLSinfInfo setFamilyID:](v5, "setFamilyID:", v11);
    [v4 objectForKeyedSubscript:@"DownloaderDSID"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    -[ICLSinfInfo setDownloaderDSID:](v5, "setDownloaderDSID:", v14);
    [v4 objectForKeyedSubscript:@"HasMIDBasedSINF"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLSinfInfo setHasMIDBasedSINF:](v5, "setHasMIDBasedSINF:", MIBooleanValue(v15, 0LL));

    [v4 objectForKeyedSubscript:@"MissingSINF"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLSinfInfo setIsMissingRequiredSINF:](v5, "setIsMissingRequiredSINF:", MIBooleanValue(v16, 0LL));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  [v4 setApplicationDSID:v5];

  -[ICLSinfInfo familyID](self, "familyID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setFamilyID:v6];

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setDownloaderDSID:v7];

  objc_msgSend(v4, "setHasMIDBasedSINF:", -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"));
  objc_msgSend(v4, "setIsMissingRequiredSINF:", -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"));
  return v4;
}

- (NSDictionary)legacySinfInfoDictionary
{
  v3 = (void *)objc_opt_new();
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"ApplicationDSID"];
  }
  v5 = -[ICLSinfInfo familyID](self, "familyID");
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"FamilyID"];
  }

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"DownloaderDSID"];
  }

  BOOL v7 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
  uint64_t v8 = MEMORY[0x189604A80];
  uint64_t v9 = MEMORY[0x189604A88];
  if (v7)
  {
    if (-[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF")) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v8;
    }
    [v3 setObject:v10 forKeyedSubscript:@"HasMIDBasedSINF"];
  }

  if (-[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"))
  {
    if (-[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF")) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v8;
    }
    [v3 setObject:v11 forKeyedSubscript:@"MissingSINF"];
  }

  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLSinfInfo *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLSinfInfo applicationDSID](self, "applicationDSID");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLSinfInfo applicationDSID](v5, "applicationDSID");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[ICLSinfInfo familyID](self, "familyID");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLSinfInfo familyID](v5, "familyID");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          v12 = -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
          -[ICLSinfInfo downloaderDSID](v5, "downloaderDSID");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            BOOL v15 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
            if (v15 == -[ICLSinfInfo hasMIDBasedSINF](v5, "hasMIDBasedSINF"))
            {
              BOOL v18 = -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF");
              if (v18 == -[ICLSinfInfo isMissingRequiredSINF](v5, "isMissingRequiredSINF"))
              {
                BOOL v16 = 1;
                goto LABEL_22;
              }

              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_21:
                BOOL v16 = 0;
LABEL_22:

                goto LABEL_23;
              }
            }

            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_21;
            }
          }

          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_21;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_21;
        }
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_21;
      }

      MOLogWrite();
      goto LABEL_21;
    }

    BOOL v16 = 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
  BOOL v4 = -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF");
  uint64_t v5 = 2LL;
  if (!v4) {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5 | v3;
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 hash];

  -[ICLSinfInfo familyID](self, "familyID");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v8 ^ [v9 hash];

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = v10 ^ [v11 hash] ^ v6;

  return v12;
}

- (NSNumber)applicationDSID
{
  return self->_applicationDSID;
}

- (void)setApplicationDSID:(id)a3
{
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
}

- (NSNumber)downloaderDSID
{
  return self->_downloaderDSID;
}

- (void)setDownloaderDSID:(id)a3
{
}

- (BOOL)hasMIDBasedSINF
{
  return self->_hasMIDBasedSINF;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (BOOL)isMissingRequiredSINF
{
  return self->_isMissingRequiredSINF;
}

- (void)setIsMissingRequiredSINF:(BOOL)a3
{
  self->_isMissingRequiredSINF = a3;
}

- (void).cxx_destruct
{
}

@end