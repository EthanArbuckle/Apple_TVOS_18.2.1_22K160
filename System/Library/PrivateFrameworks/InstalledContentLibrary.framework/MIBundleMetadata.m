@interface MIBundleMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIBundleMetadata)initWithCoder:(id)a3;
- (NSDate)installDate;
- (NSError)placeholderFailureUnderlyingError;
- (NSSet)linkedChildBundleIDs;
- (NSString)alternateIconName;
- (NSString)installBuildVersion;
- (NSString)linkedParentBundleID;
- (NSString)watchKitAppExecutableHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)autoInstallOverride;
- (unint64_t)installType;
- (unint64_t)placeholderFailureReason;
- (unint64_t)placeholderFailureUnderlyingErrorSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setInstallBuildVersion:(id)a3;
- (void)setInstallDate:(id)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setLinkedChildBundleIDs:(id)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setPlaceholderFailureReason:(unint64_t)a3;
- (void)setPlaceholderFailureUnderlyingError:(id)a3;
- (void)setPlaceholderFailureUnderlyingErrorSource:(unint64_t)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
@end

@implementation MIBundleMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIBundleMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIBundleMetadata init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installBuildVersion"];
    installBuildVersion = v5->_installBuildVersion;
    v5->_installBuildVersion = (NSString *)v8;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installType"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installType = [v10 unsignedIntegerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureReason"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureReason = [v11 unsignedIntegerValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureUnderlyingError"];
    placeholderFailureUnderlyingError = v5->_placeholderFailureUnderlyingError;
    v5->_placeholderFailureUnderlyingError = (NSError *)v12;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureUnderlyingErrorSource"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureUnderlyingErrorSource = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitAppExecutableHash"];
    watchKitAppExecutableHash = v5->_watchKitAppExecutableHash;
    v5->_watchKitAppExecutableHash = (NSString *)v15;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoInstallOverride"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallOverride = [v17 unsignedIntegerValue];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v20;

    v22 = (void *)MEMORY[0x189604010];
    uint64_t v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"linkedChildBundleIDs"];
    linkedChildBundleIDs = v5->_linkedChildBundleIDs;
    v5->_linkedChildBundleIDs = (NSSet *)v25;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[MIBundleMetadata installDate](self, "installDate");
  uint64_t v6 = (void *)[v5 copy];
  [v4 setInstallDate:v6];
  v7 = -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  uint64_t v8 = (void *)[v7 copy];
  [v4 setInstallBuildVersion:v8];

  objc_msgSend(v4, "setInstallType:", -[MIBundleMetadata installType](self, "installType"));
  objc_msgSend( v4,  "setPlaceholderFailureReason:",  -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  v9 = -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  v10 = (void *)[v9 copy];
  [v4 setPlaceholderFailureUnderlyingError:v10];

  objc_msgSend( v4,  "setPlaceholderFailureUnderlyingErrorSource:",  -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  v11 = -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  uint64_t v12 = (void *)[v11 copy];
  [v4 setWatchKitAppExecutableHash:v12];

  objc_msgSend(v4, "setAutoInstallOverride:", -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  v13 = -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  v14 = (void *)[v13 copy];
  [v4 setAlternateIconName:v14];

  -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)[v15 copy];
  [v4 setLinkedParentBundleID:v16];
  v17 = -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  uint64_t v18 = (void *)[v17 copy];
  [v4 setLinkedChildBundleIDs:v18];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIBundleMetadata installDate](self, "installDate");
  [v4 encodeObject:v5 forKey:@"installDate"];

  -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"installBuildVersion"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[MIBundleMetadata installType](self, "installType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"installType"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"placeholderFailureReason"];
  v9 = -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  [v4 encodeObject:v9 forKey:@"placeholderFailureUnderlyingError"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"placeholderFailureUnderlyingErrorSource"];
  v11 = -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  [v4 encodeObject:v11 forKey:@"watchKitAppExecutableHash"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"autoInstallOverride"];
  v13 = -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  [v4 encodeObject:v13 forKey:@"alternateIconName"];
  v14 = -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  [v4 encodeObject:v14 forKey:@"linkedParentBundleID"];

  -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"linkedChildBundleIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIBundleMetadata *)a3;
  if (v4 == self)
  {
    BOOL v30 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIBundleMetadata installDate](self, "installDate");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MIBundleMetadata installDate](v5, "installDate");
      BOOL v8 = MICompareObjects(v6, v7);

      if (!v8) {
        goto LABEL_16;
      }
      v9 = -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
      v10 = -[MIBundleMetadata installBuildVersion](v5, "installBuildVersion");
      BOOL v11 = MICompareObjects(v9, v10);

      if (!v11) {
        goto LABEL_16;
      }
      unint64_t v12 = -[MIBundleMetadata installType](self, "installType");
      if (v12 != -[MIBundleMetadata installType](v5, "installType")) {
        goto LABEL_16;
      }
      unint64_t v13 = -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason");
      if (v13 != -[MIBundleMetadata placeholderFailureReason](v5, "placeholderFailureReason")) {
        goto LABEL_16;
      }
      v14 = -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
      -[MIBundleMetadata placeholderFailureUnderlyingError](v5, "placeholderFailureUnderlyingError");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v16 = MICompareObjects(v14, v15);

      if (!v16) {
        goto LABEL_16;
      }
      unint64_t v17 = -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource");
      if (v17 != -[MIBundleMetadata placeholderFailureUnderlyingErrorSource]( v5,  "placeholderFailureUnderlyingErrorSource")) {
        goto LABEL_16;
      }
      -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MIBundleMetadata watchKitAppExecutableHash](v5, "watchKitAppExecutableHash");
      BOOL v20 = MICompareObjects(v18, v19);

      if (!v20) {
        goto LABEL_16;
      }
      unint64_t v21 = -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride");
      if (v21 != -[MIBundleMetadata autoInstallOverride](v5, "autoInstallOverride")) {
        goto LABEL_16;
      }
      v22 = -[MIBundleMetadata alternateIconName](self, "alternateIconName");
      -[MIBundleMetadata alternateIconName](v5, "alternateIconName");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = MICompareObjects(v22, v23);

      if (!v24) {
        goto LABEL_16;
      }
      -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MIBundleMetadata linkedParentBundleID](v5, "linkedParentBundleID");
      BOOL v27 = MICompareObjects(v25, v26);

      if (v27)
      {
        v28 = -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
        v29 = -[MIBundleMetadata linkedChildBundleIDs](v5, "linkedChildBundleIDs");
        BOOL v30 = MICompareObjects(v28, v29);
      }

      else
      {
LABEL_16:
        BOOL v30 = 0;
      }
    }

    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (id)description
{
  unint64_t v21 = (void *)NSString;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleMetadata installDate](self, "installDate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  unint64_t v6 = -[MIBundleMetadata installType](self, "installType");
  unint64_t v7 = -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason");
  -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource");
  v10 = -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  unint64_t v11 = -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride");
  -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"<%@<%p> installDate=%@, installBuildVersion=%@, installType=%lu, placeholderFailureReason=%lu, placeholderFailureUnderlyingError=%@, placeholderFailureUnderlyingErrorSource=%lu, watchKitAppExecutableHash=%@, autoInstallOverride=%lu, alternateIconName=%@", v20, self, v4, v5, v6, v7, v8, v9, v10, v11, v12];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)NSString;
  -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 stringWithFormat:@"%@, linkedParentBundleID=%@ linkedChildBundleIDs=%@", v13, v15, v16];
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v17 stringByAppendingString:@">"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
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
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIBundleMetadata metadataFromURL:error:]",  156LL,  @"MIInstallerErrorDomain",  130LL,  v8,  0LL,  @"Failed to read bundle metadata from %@",  v21,  (uint64_t)v20);

    unint64_t v9 = 0LL;
    unint64_t v11 = 0LL;
    BOOL v8 = (void *)v22;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  id v25 = v7;
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v6 error:&v25];
  id v10 = v25;

  if (!v9)
  {
    [v5 path];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"+[MIBundleMetadata metadataFromURL:error:]",  163LL,  @"MIInstallerErrorDomain",  130LL,  v10,  0LL,  @"Failed to read bundle metadata from %@",  v19,  (uint64_t)v18);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    unint64_t v9 = 0LL;
    unint64_t v11 = 0LL;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  [v9 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1896075C8]];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    [v9 error];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = _CreateAndLogError( (uint64_t)"+[MIBundleMetadata metadataFromURL:error:]",  169LL,  @"MIInstallerErrorDomain",  130LL,  v12,  0LL,  @"Failed to decode bundle metadata from %@",  v14,  (uint64_t)v13);

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
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = _CreateAndLogError( (uint64_t)"-[MIBundleMetadata serializeToURL:error:]",  207LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to write serialized MIBundleMetadata to %@",  v12,  (uint64_t)v11);

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

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (NSString)installBuildVersion
{
  return self->_installBuildVersion;
}

- (void)setInstallBuildVersion:(id)a3
{
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSError)placeholderFailureUnderlyingError
{
  return self->_placeholderFailureUnderlyingError;
}

- (void)setPlaceholderFailureUnderlyingError:(id)a3
{
}

- (unint64_t)placeholderFailureUnderlyingErrorSource
{
  return self->_placeholderFailureUnderlyingErrorSource;
}

- (void)setPlaceholderFailureUnderlyingErrorSource:(unint64_t)a3
{
  self->_placeholderFailureUnderlyingErrorSource = a3;
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (NSSet)linkedChildBundleIDs
{
  return self->_linkedChildBundleIDs;
}

- (void)setLinkedChildBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end