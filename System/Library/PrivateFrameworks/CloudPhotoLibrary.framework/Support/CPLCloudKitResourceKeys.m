@interface CPLCloudKitResourceKeys
- (CPLCloudKitResourceKeys)initWithPrefix:(id)a3 resourceType:(unint64_t)a4;
- (id)_allKeys;
- (id)_allKeysWithoutExpungedState;
- (id)description;
@end

@implementation CPLCloudKitResourceKeys

- (CPLCloudKitResourceKeys)initWithPrefix:(id)a3 resourceType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___CPLCloudKitResourceKeys;
    v7 = -[CPLCloudKitResourceKeys init](&v35, "init");
    v8 = v7;
    if (v7)
    {
      v7->_resourceType = a4;
      v9 = (NSString *)[v6 copy];
      prefix = v8->_prefix;
      v8->_prefix = v9;

      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"FileSize"]);
      fileSizeKey = v8->_fileSizeKey;
      v8->_fileSizeKey = (NSString *)v11;

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"FileType"]);
      fileUTIKey = v8->_fileUTIKey;
      v8->_fileUTIKey = (NSString *)v13;

      uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Width"]);
      widthKey = v8->_widthKey;
      v8->_widthKey = (NSString *)v15;

      uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Height"]);
      heightKey = v8->_heightKey;
      v8->_heightKey = (NSString *)v17;

      uint64_t v19 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Fingerprint"]);
      fingerprintKey = v8->_fingerprintKey;
      v8->_fingerprintKey = (NSString *)v19;

      uint64_t v21 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"HashEnc"]);
      stableHashKey = v8->_stableHashKey;
      v8->_stableHashKey = (NSString *)v21;

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"InfoEnc"]);
      encryptedInfoKey = v8->_encryptedInfoKey;
      v8->_encryptedInfoKey = (NSString *)v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"ExpungedState"]);
      expungedStateKey = v8->_expungedStateKey;
      v8->_expungedStateKey = (NSString *)v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"ExpungedDate"]);
      expungedDateKey = v8->_expungedDateKey;
      v8->_expungedDateKey = (NSString *)v27;

      uint64_t v29 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Res"]);
      resourceKey = v8->_resourceKey;
      v8->_resourceKey = (NSString *)v29;

      uint64_t v31 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Dynamic"]);
      dynamicKey = v8->_dynamicKey;
      v8->_dynamicKey = (NSString *)v31;
    }

    self = v8;
    v33 = self;
  }

  else
  {
    v33 = 0LL;
  }

  return v33;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  self->_resourceType));
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@/%@>", v4, self->_prefix);

  return v5;
}

- (id)_allKeysWithoutExpungedState
{
  __int128 v4 = *(_OWORD *)&self->_fileSizeKey;
  widthKey = self->_widthKey;
  __int128 v6 = *(_OWORD *)&self->_heightKey;
  resourceKey = self->_resourceKey;
  encryptedInfoKey = self->_encryptedInfoKey;
  v8 = resourceKey;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v4,  7LL));
}

- (id)_allKeys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitResourceKeys _allKeysWithoutExpungedState](self, "_allKeysWithoutExpungedState"));
  expungedDateKey = self->_expungedDateKey;
  v8[0] = self->_expungedStateKey;
  v8[1] = expungedDateKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObjectsFromArray:v5]);

  return v6;
}

- (void).cxx_destruct
{
}

@end