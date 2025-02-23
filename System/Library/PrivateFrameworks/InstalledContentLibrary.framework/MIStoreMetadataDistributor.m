@interface MIStoreMetadataDistributor
+ (BOOL)supportsSecureCoding;
- (BOOL)distributorIsFirstPartyApple;
- (BOOL)distributorIsThirdParty;
- (BOOL)isEqual:(id)a3;
- (MIStoreMetadataDistributor)initWithCoder:(id)a3;
- (MIStoreMetadataDistributor)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)localizedDistributorName;
- (NSNumber)marketplaceItemID;
- (NSString)accountID;
- (NSString)developerID;
- (NSString)developerName;
- (NSString)distributorID;
- (NSString)distributorNameForCurrentLocale;
- (NSString)domain;
- (NSString)marketplaceDomain;
- (NSURL)shareURL;
- (NSURL)sourceURL;
- (NSURL)supportPageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)distributorType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setDeveloperID:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setDistributorID:(id)a3;
- (void)setDomain:(id)a3;
- (void)setLocalizedDistributorName:(id)a3;
- (void)setMarketplaceDomain:(id)a3;
- (void)setMarketplaceItemID:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setSupportPageURL:(id)a3;
@end

@implementation MIStoreMetadataDistributor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStoreMetadataDistributor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[MIStoreMetadataDistributor init](self, "init");
  if (v5)
  {
    [v4 objectForKeyedSubscript:distributorID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDistributorID:](v5, "setDistributorID:", v6);
    }

    else if (v6 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = distributorID;
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:accountID];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setAccountID:](v5, "setAccountID:", v7);
    }

    else if (v7 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = accountID;
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:domain];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDomain:](v5, "setDomain:", v8);
    }

    else if (v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = domain;
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:::supportPageURL];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x189604030] URLWithString:v11];
      supportPageURL = v5->_supportPageURL;
      v5->_supportPageURL = (NSURL *)v12;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", ::sourceURL, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v16 = v15;
    }
    else {
      id v16 = 0LL;
    }

    if (v16)
    {
      uint64_t v17 = [MEMORY[0x189604030] URLWithString:v16];
      sourceURL = v5->_sourceURL;
      v5->_sourceURL = (NSURL *)v17;
    }

    [v4 objectForKeyedSubscript:localizedDistributorName];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v19, v20, v21))
      {
        -[MIStoreMetadataDistributor setLocalizedDistributorName:](v5, "setLocalizedDistributorName:", v19);
      }

      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        MOLogWrite();
      }
    }

    [v4 objectForKeyedSubscript:developerID];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDeveloperID:](v5, "setDeveloperID:", v22);
    }

    else if (v22 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v33 = developerID;
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:developerName];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDeveloperName:](v5, "setDeveloperName:", v23);
    }

    else if (v23 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v33 = developerName;
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:::shareURL];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v25 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v26 = v25;
    }
    else {
      id v26 = 0LL;
    }

    if (v26)
    {
      uint64_t v27 = [MEMORY[0x189604030] URLWithString:v26];
      shareURL = v5->_shareURL;
      v5->_shareURL = (NSURL *)v27;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", marketplaceItemID, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setMarketplaceItemID:](v5, "setMarketplaceItemID:", v29);
    }

    else if (v29 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }

    [v4 objectForKeyedSubscript:marketplaceDomain];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setMarketplaceDomain:](v5, "setMarketplaceDomain:", v30);
    }

    else if (v30 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }
  }

  return v5;
}

- (MIStoreMetadataDistributor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStoreMetadataDistributor init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distributorID"];
    distributorID = v5->_distributorID;
    v5->_distributorID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportPageURL"];
    supportPageURL = v5->_supportPageURL;
    v5->_supportPageURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v14;

    id v16 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"localizedDistributorName"];
    localizedDistributorName = v5->_localizedDistributorName;
    v5->_localizedDistributorName = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerID"];
    developerID = v5->_developerID;
    v5->_developerID = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerName"];
    developerName = v5->_developerName;
    v5->_developerName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketplaceItemID"];
    marketplaceItemID = v5->_marketplaceItemID;
    v5->_marketplaceItemID = (NSNumber *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketplaceDomain"];
    marketplaceDomain = v5->_marketplaceDomain;
    v5->_marketplaceDomain = (NSString *)v29;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDistributorID:v7];

  -[MIStoreMetadataDistributor accountID](self, "accountID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAccountID:v9];

  -[MIStoreMetadataDistributor domain](self, "domain");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setDomain:v11];

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setSupportPageURL:v13];

  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setSourceURL:v15];

  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLocalizedDistributorName:v17];
  v18 = -[MIStoreMetadataDistributor developerID](self, "developerID");
  uint64_t v19 = (void *)[v18 copyWithZone:a3];
  [v5 setDeveloperID:v19];

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)[v20 copyWithZone:a3];
  [v5 setDeveloperName:v21];
  v22 = -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  uint64_t v23 = (void *)[v22 copyWithZone:a3];
  [v5 setShareURL:v23];
  v24 = -[MIStoreMetadataDistributor marketplaceItemID](self, "marketplaceItemID");
  uint64_t v25 = (void *)[v24 copyWithZone:a3];
  [v5 setMarketplaceItemID:v25];

  -[MIStoreMetadataDistributor marketplaceDomain](self, "marketplaceDomain");
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = (void *)[v26 copyWithZone:a3];
  [v5 setMarketplaceDomain:v27];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  [v4 encodeObject:v5 forKey:@"distributorID"];

  -[MIStoreMetadataDistributor accountID](self, "accountID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"accountID"];
  v7 = -[MIStoreMetadataDistributor domain](self, "domain");
  [v4 encodeObject:v7 forKey:@"domain"];

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"supportPageURL"];
  v9 = -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  [v4 encodeObject:v9 forKey:@"sourceURL"];

  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"localizedDistributorName"];

  -[MIStoreMetadataDistributor developerID](self, "developerID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"developerID"];

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"developerName"];
  v13 = -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  [v4 encodeObject:v13 forKey:@"shareURL"];

  -[MIStoreMetadataDistributor marketplaceItemID](self, "marketplaceItemID");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"marketplaceItemID"];

  -[MIStoreMetadataDistributor marketplaceDomain](self, "marketplaceDomain");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"marketplaceDomain"];
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)objc_opt_new();
  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:distributorID];
  }
  v5 = -[MIStoreMetadataDistributor accountID](self, "accountID");
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:accountID];
  }

  -[MIStoreMetadataDistributor domain](self, "domain");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:domain];
  }
  v7 = -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:localizedDistributorName];
  }

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    [v8 absoluteString];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v10 forKeyedSubscript:supportPageURL];
  }

  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 absoluteString];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKeyedSubscript:sourceURL];
  }

  -[MIStoreMetadataDistributor developerID](self, "developerID");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:developerID];
  }

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:developerName];
  }

  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 absoluteString];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKeyedSubscript:shareURL];
  }

  -[MIStoreMetadataDistributor marketplaceItemID](self, "marketplaceItemID");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19) {
    [v3 setObject:v19 forKeyedSubscript:marketplaceItemID];
  }

  -[MIStoreMetadataDistributor marketplaceDomain](self, "marketplaceDomain");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20) {
    [v3 setObject:v20 forKeyedSubscript:marketplaceDomain];
  }

  uint64_t v21 = (void *)[v3 copy];
  return (NSDictionary *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStoreMetadataDistributor *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStoreMetadataDistributor distributorID](self, "distributorID");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MIStoreMetadataDistributor distributorID](v5, "distributorID");
      if (MICompareObjects(v6, v7))
      {
        -[MIStoreMetadataDistributor accountID](self, "accountID");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[MIStoreMetadataDistributor accountID](v5, "accountID");
        if (MICompareObjects(v8, v9))
        {
          -[MIStoreMetadataDistributor domain](self, "domain");
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIStoreMetadataDistributor domain](v5, "domain");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (MICompareObjects(v10, v11))
          {
            -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[MIStoreMetadataDistributor supportPageURL](v5, "supportPageURL");
            v38 = v12;
            if (MICompareObjects(v12, v37))
            {
              v13 = -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
              v35 = -[MIStoreMetadataDistributor sourceURL](v5, "sourceURL");
              v36 = v13;
              if (MICompareObjects(v13, v35))
              {
                -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[MIStoreMetadataDistributor localizedDistributorName](v5, "localizedDistributorName");
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v14;
                if (MICompareObjects(v14, v33))
                {
                  -[MIStoreMetadataDistributor developerID](self, "developerID");
                  id v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = -[MIStoreMetadataDistributor developerID](v5, "developerID");
                  uint64_t v32 = v15;
                  if (MICompareObjects(v15, v31))
                  {
                    -[MIStoreMetadataDistributor developerName](self, "developerName");
                    id v16 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MIStoreMetadataDistributor developerName](v5, "developerName");
                    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = v16;
                    if (MICompareObjects(v16, v29))
                    {
                      -[MIStoreMetadataDistributor shareURL](self, "shareURL");
                      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MIStoreMetadataDistributor shareURL](v5, "shareURL");
                      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = v17;
                      if (MICompareObjects(v17, v27))
                      {
                        uint64_t v18 = -[MIStoreMetadataDistributor marketplaceItemID](self, "marketplaceItemID");
                        -[MIStoreMetadataDistributor marketplaceItemID](v5, "marketplaceItemID");
                        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                        id v26 = (void *)v18;
                        uint64_t v20 = (void *)v18;
                        uint64_t v21 = v19;
                        if (MICompareObjects(v20, v19))
                        {
                          -[MIStoreMetadataDistributor marketplaceDomain](self, "marketplaceDomain");
                          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                          v24 = -[MIStoreMetadataDistributor marketplaceDomain](v5, "marketplaceDomain");
                          BOOL v22 = MICompareObjects(v25, v24);
                        }

                        else
                        {
                          BOOL v22 = 0;
                        }
                      }

                      else
                      {
                        BOOL v22 = 0;
                      }
                    }

                    else
                    {
                      BOOL v22 = 0;
                    }
                  }

                  else
                  {
                    BOOL v22 = 0;
                  }
                }

                else
                {
                  BOOL v22 = 0;
                }
              }

              else
              {
                BOOL v22 = 0;
              }
            }

            else
            {
              BOOL v22 = 0;
            }
          }

          else
          {
            BOOL v22 = 0;
          }
        }

        else
        {
          BOOL v22 = 0;
        }
      }

      else
      {
        BOOL v22 = 0;
      }
    }

    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v25 hash];
  v24 = -[MIStoreMetadataDistributor accountID](self, "accountID");
  uint64_t v4 = [v24 hash] ^ v3;
  -[MIStoreMetadataDistributor domain](self, "domain");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v23 hash];
  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 hash];
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v9 ^ [v10 hash];
  -[MIStoreMetadataDistributor developerID](self, "developerID");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  -[MIStoreMetadataDistributor developerName](self, "developerName");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 hash];
  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v15 ^ [v16 hash];
  -[MIStoreMetadataDistributor marketplaceItemID](self, "marketplaceItemID");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v17 ^ [v18 hash];
  -[MIStoreMetadataDistributor marketplaceDomain](self, "marketplaceDomain");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)distributorType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"com.apple.AppStore"])
    {
      unint64_t v4 = 1LL;
    }

    else if ([v3 isEqualToString:@"com.apple.TestFlight"])
    {
      unint64_t v4 = 2LL;
    }

    else
    {
      unint64_t v4 = -1LL;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (BOOL)distributorIsFirstPartyApple
{
  return -[MIStoreMetadataDistributor distributorType](self, "distributorType") - 1 < 2;
}

- (BOOL)distributorIsThirdParty
{
  return -[MIStoreMetadataDistributor distributorType](self, "distributorType") == -1;
}

- (NSString)distributorNameForCurrentLocale
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v5 count]) {
    goto LABEL_11;
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v5, 0LL);
  uint64_t v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
        if (v11)
        {
          uint64_t v12 = (void *)v11;

          goto LABEL_13;
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[__CFArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

  [v3 objectForKeyedSubscript:&stru_189D525C8];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_11:
    -[MIStoreMetadataDistributor distributorID](self, "distributorID", (void)v14);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

- (NSString)distributorID
{
  return self->_distributorID;
}

- (void)setDistributorID:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSURL)supportPageURL
{
  return self->_supportPageURL;
}

- (void)setSupportPageURL:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSDictionary)localizedDistributorName
{
  return self->_localizedDistributorName;
}

- (void)setLocalizedDistributorName:(id)a3
{
}

- (NSString)developerID
{
  return self->_developerID;
}

- (void)setDeveloperID:(id)a3
{
}

- (NSString)developerName
{
  return self->_developerName;
}

- (void)setDeveloperName:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSNumber)marketplaceItemID
{
  return self->_marketplaceItemID;
}

- (void)setMarketplaceItemID:(id)a3
{
}

- (NSString)marketplaceDomain
{
  return self->_marketplaceDomain;
}

- (void)setMarketplaceDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end