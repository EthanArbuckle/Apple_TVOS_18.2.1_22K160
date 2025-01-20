@interface MAAbsoluteAssetId
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOnlyAssetTypeAndId;
- (BOOL)isEqual:(id)a3;
- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4;
- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4 attributes:(id)a5;
- (MAAbsoluteAssetId)initWithCoder:(id)a3;
- (MAAbsoluteAssetId)initWithPlist:(id)a3;
- (NSString)assetId;
- (NSString)assetType;
- (id)allAttributesHash;
- (id)assetIdHash;
- (id)contentHash;
- (id)description;
- (id)diffFrom:(id)a3;
- (id)diffFromAsset:(id)a3;
- (id)diffFromAssetId:(id)a3 assetType:(id)a4 attributes:(id)a5;
- (id)encodeAsPlist;
- (id)nonIdHash;
- (id)pallasDynamicAssetIdHash;
- (id)policyHash;
- (id)summary;
- (id)urlHash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetId:(id)a3;
- (void)setAssetType:(id)a3;
@end

@implementation MAAbsoluteAssetId

- (id)allAttributesHash
{
  return self->_allAttributesHash;
}

- (id)nonIdHash
{
  return self->_nonAssetIdHash;
}

- (id)contentHash
{
  return self->_downloadContentHash;
}

- (id)urlHash
{
  return self->_downloadUrlHash;
}

- (id)policyHash
{
  return self->_downloadPolicyHash;
}

- (id)assetIdHash
{
  return self->_assetIdHash;
}

- (id)pallasDynamicAssetIdHash
{
  return self->_pallasAssetIdHash;
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4
{
  return -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:]( self,  "initWithAssetId:forAssetType:attributes:",  a3,  a4,  0LL);
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MAAbsoluteAssetId;
  v12 = -[MAAbsoluteAssetId init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetType, a4);
    objc_storeStrong((id *)&v13->_assetId, a3);
    uint64_t v14 = getHashFromAttributesInSet(v10, v11, 0LL);
    allAttributesHash = v13->_allAttributesHash;
    v13->_allAttributesHash = (NSString *)v14;

    uint64_t v16 = getHashFromAssetIdAttributes(v10, v11);
    assetIdHash = v13->_assetIdHash;
    v13->_assetIdHash = (NSString *)v16;

    uint64_t v18 = getHashFromNonAssetIdAttributes(v10, v11);
    nonAssetIdHash = v13->_nonAssetIdHash;
    v13->_nonAssetIdHash = (NSString *)v18;

    attributesInDownloadContent();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = getHashFromAttributesInSet(v10, v11, v20);
    downloadContentHash = v13->_downloadContentHash;
    v13->_downloadContentHash = (NSString *)v21;

    attributesInDownloadUrl();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = getHashFromAttributesInSet(v10, v11, v23);
    downloadUrlHash = v13->_downloadUrlHash;
    v13->_downloadUrlHash = (NSString *)v24;

    attributesInDownloadPolicy();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = getHashFromAttributesInSet(v10, v11, v26);
    downloadPolicyHash = v13->_downloadPolicyHash;
    v13->_downloadPolicyHash = (NSString *)v27;

    attributesInPallasDynamicAssetId();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = getHashFromAttributesInSet(v10, v11, v29);
    pallasAssetIdHash = v13->_pallasAssetIdHash;
    v13->_pallasAssetIdHash = (NSString *)v30;
  }

  return v13;
}

- (MAAbsoluteAssetId)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MAAbsoluteAssetId;
  v5 = -[MAAbsoluteAssetId init](&v25, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetId"];
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributesHash"];
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetIdHash"];
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonIdHash"];
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentHash"];
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHash"];
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policyHash"];
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pallasDynamicAssetIdHash"];
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;
  }

  return v5;
}

- (MAAbsoluteAssetId)initWithPlist:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MAAbsoluteAssetId;
  v5 = -[MAAbsoluteAssetId init](&v25, sel_init);
  if (v5)
  {
    uint64_t v6 = getPlistString(v4, @"assetId");
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    uint64_t v8 = getPlistString(v4, @"assetType");
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    uint64_t v10 = getPlistString(v4, @"attributesHash");
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    uint64_t v12 = getPlistString(v4, @"assetIdHash");
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    uint64_t v14 = getPlistString(v4, @"nonIdHash");
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    uint64_t v16 = getPlistString(v4, @"contentHash");
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    uint64_t v18 = getPlistString(v4, @"urlHash");
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    uint64_t v20 = getPlistString(v4, @"policyHash");
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    uint64_t v22 = getPlistString(v4, @"pallasDynamicAssetIdHash");
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[MAAbsoluteAssetId assetId](self, "assetId");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"assetId"];
  v5 = -[MAAbsoluteAssetId assetType](self, "assetType");
  [v6 encodeObject:v5 forKey:@"assetType"];

  [v6 encodeObject:self->_allAttributesHash forKey:@"attributesHash"];
  [v6 encodeObject:self->_assetIdHash forKey:@"assetIdHash"];
  [v6 encodeObject:self->_nonAssetIdHash forKey:@"nonIdHash"];
  [v6 encodeObject:self->_downloadContentHash forKey:@"contentHash"];
  [v6 encodeObject:self->_downloadUrlHash forKey:@"urlHash"];
  [v6 encodeObject:self->_downloadPolicyHash forKey:@"policyHash"];
  [v6 encodeObject:self->_pallasAssetIdHash forKey:@"pallasDynamicAssetIdHash"];
}

- (id)encodeAsPlist
{
  v3 = (void *)objc_opt_new();
  -[MAAbsoluteAssetId assetId](self, "assetId");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v4 forKey:@"assetId"];
  v5 = -[MAAbsoluteAssetId assetType](self, "assetType");
  [v3 setValue:v5 forKey:@"assetType"];

  [v3 setValue:self->_allAttributesHash forKey:@"attributesHash"];
  [v3 setValue:self->_assetIdHash forKey:@"assetIdHash"];
  [v3 setValue:self->_nonAssetIdHash forKey:@"nonIdHash"];
  [v3 setValue:self->_downloadContentHash forKey:@"contentHash"];
  [v3 setValue:self->_downloadUrlHash forKey:@"urlHash"];
  [v3 setValue:self->_downloadPolicyHash forKey:@"policyHash"];
  [v3 setValue:self->_pallasAssetIdHash forKey:@"pallasDynamicAssetIdHash"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)diffFrom:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    assetType = self->_assetType;
    [v4 assetType];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v33 = -[NSString isEqual:](assetType, "isEqual:", v6) ^ 1;

    assetId = self->_assetId;
    [v4 assetId];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v32 = -[NSString isEqual:](assetId, "isEqual:", v8) ^ 1;

    allAttributesHash = self->_allAttributesHash;
    [v4 allAttributesHash];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[NSString isEqual:](allAttributesHash, "isEqual:", v10) ^ 1;

    assetIdHash = self->_assetIdHash;
    [v4 assetIdHash];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[NSString isEqual:](assetIdHash, "isEqual:", v13) ^ 1;

    nonAssetIdHash = self->_nonAssetIdHash;
    [v4 nonIdHash];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = -[NSString isEqual:](nonAssetIdHash, "isEqual:", v16) ^ 1;

    downloadContentHash = self->_downloadContentHash;
    [v4 contentHash];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = -[NSString isEqual:](downloadContentHash, "isEqual:", v19) ^ 1;

    downloadUrlHash = self->_downloadUrlHash;
    [v4 urlHash];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(assetType) = -[NSString isEqual:](downloadUrlHash, "isEqual:", v22) ^ 1;

    downloadPolicyHash = self->_downloadPolicyHash;
    [v4 policyHash];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(assetId) = -[NSString isEqual:](downloadPolicyHash, "isEqual:", v24) ^ 1;

    pallasAssetIdHash = self->_pallasAssetIdHash;
    [v4 pallasDynamicAssetIdHash];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = -[NSString isEqual:](pallasAssetIdHash, "isEqual:", v26) ^ 1;

    BYTE2(v31) = (_BYTE)assetId;
    BYTE1(v31) = (_BYTE)assetType;
    LOBYTE(v31) = v20;
    id v28 = -[MAAssetDiff initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:]( objc_alloc(&OBJC_CLASS___MAAssetDiff),  "initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:",  v33,  v32,  v11,  v14,  v27,  v17,  v31);
  }

  else
  {
    +[MAAssetDiff allowEverythingDifferent](&OBJC_CLASS___MAAssetDiff, "allowEverythingDifferent");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  v29 = v28;

  return v29;
}

- (id)diffFromAsset:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAbsoluteAssetId diffFrom:](self, "diffFrom:", v4);
  return v5;
}

- (id)diffFromAssetId:(id)a3 assetType:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:]( objc_alloc(&OBJC_CLASS___MAAbsoluteAssetId),  "initWithAssetId:forAssetType:attributes:",  v10,  v9,  v8);

  -[MAAbsoluteAssetId diffFrom:](self, "diffFrom:", v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAbsoluteAssetId *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAAbsoluteAssetId assetId](v5, "assetId");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MAAbsoluteAssetId assetId](self, "assetId");
      if ([v6 isEqualToString:v7])
      {
        -[MAAbsoluteAssetId assetType](v5, "assetType");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAAbsoluteAssetId assetType](self, "assetType");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        char v10 = [v8 isEqualToString:v9];
      }

      else
      {
        char v10 = 0;
      }
    }

    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasOnlyAssetTypeAndId
{
  return !self->_allAttributesHash
      && !self->_assetIdHash
      && !self->_nonAssetIdHash
      && !self->_downloadContentHash
      && !self->_downloadUrlHash
      && !self->_downloadPolicyHash
      && self->_pallasAssetIdHash == 0LL;
}

- (id)summary
{
  BOOL v3 = -[MAAbsoluteAssetId hasOnlyAssetTypeAndId](self, "hasOnlyAssetTypeAndId");
  id v4 = (void *)NSString;
  v5 = -[MAAbsoluteAssetId assetType](self, "assetType");
  uint64_t v6 = -[MAAbsoluteAssetId assetId](self, "assetId");
  v7 = (void *)v6;
  if (v3) {
    id v8 = @"%@:%@";
  }
  else {
    id v8 = @"%@:%@(+)";
  }
  objc_msgSend(v4, "stringWithFormat:", v8, v5, v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  -[MAAbsoluteAssetId assetId](self, "assetId");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAbsoluteAssetId assetType](self, "assetType");
  [v3 stringWithFormat:@"(%@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@)", @"assetId", v4, @"assetType", v5, @"attributesHash", self->_allAttributesHash, @"assetIdHash", self->_assetIdHash, @"nonIdHash", self->_nonAssetIdHash, @"pallasDynamicAssetIdHash", self->_pallasAssetIdHash, @"contentHash", self->_downloadContentHash, @"urlHash", self->_downloadUrlHash, @"policyHash", self->_downloadPolicyHash];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end