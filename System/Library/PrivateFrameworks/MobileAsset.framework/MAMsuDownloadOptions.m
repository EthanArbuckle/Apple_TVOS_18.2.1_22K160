@interface MAMsuDownloadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowSameVersion;
- (BOOL)prerequisiteReleaseTypeIsOverridden;
- (BOOL)supervised;
- (MAMsuDownloadOptions)init;
- (MAMsuDownloadOptions)initWithCoder:(id)a3;
- (MAMsuDownloadOptions)initWithPlist:(id)a3;
- (NSString)liveAssetAudienceUUID;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)prerequisiteReleaseType;
- (NSString)purpose;
- (NSString)requestedProductVersion;
- (id)description;
- (id)encodeAsPlist;
- (int64_t)delayPeriod;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowSameVersion:(BOOL)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setLiveAssetAudienceUUID:(id)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPrerequisiteReleaseType:(id)a3;
- (void)setPrerequisiteReleaseTypeIsOverridden:(BOOL)a3;
- (void)setPurpose:(id)a3;
- (void)setRequestedProductVersion:(id)a3;
- (void)setSupervised:(BOOL)a3;
@end

@implementation MAMsuDownloadOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAMsuDownloadOptions)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  v2 = -[MADownloadOptions init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    requestedProductVersion = v2->_requestedProductVersion;
    v2->_requestedProductVersion = 0LL;

    v3->_delayPeriod = 0LL;
    v3->_supervised = 0;
    v3->_allowSameVersion = 0;
    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0LL;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0LL;

    prerequisiteReleaseType = v3->_prerequisiteReleaseType;
    v3->_prerequisiteReleaseType = 0LL;

    v3->_prerequisiteReleaseTypeIsOverridden = 0;
    liveAssetAudienceUUID = v3->_liveAssetAudienceUUID;
    v3->_liveAssetAudienceUUID = 0LL;

    purpose = v3->_purpose;
    v3->_purpose = 0LL;
  }

  return v3;
}

- (MAMsuDownloadOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  v5 = -[MADownloadOptions initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedProductVersion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setRequestedProductVersion:](v5, "setRequestedProductVersion:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DelayPeriod"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_delayPeriod = [v7 longValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Supervised"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supervised = [v8 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllowSameVersion"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowSameVersion = [v9 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuildVersion"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteBuildVersion:](v5, "setPrerequisiteBuildVersion:", v10);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteProductVersion"];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteProductVersion:](v5, "setPrerequisiteProductVersion:", v11);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteReleaseType"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteReleaseType:](v5, "setPrerequisiteReleaseType:", v12);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteReleaseTypeIsOverridden"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prerequisiteReleaseTypeIsOverridden = [v13 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveAssetAudienceUUID"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setLiveAssetAudienceUUID:](v5, "setLiveAssetAudienceUUID:", v14);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Purpose"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", v15);
  }

  return v5;
}

- (MAMsuDownloadOptions)initWithPlist:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  v5 = -[MADownloadOptions initWithPlist:](&v15, sel_initWithPlist_, v4);
  if (v5)
  {
    getPlistString(v4, @"RequestedProductVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setRequestedProductVersion:](v5, "setRequestedProductVersion:", v6);

    getPlistNumber(v4, @"DelayPeriod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_delayPeriod = [v7 longValue];

    v5->_supervised = getPlistNumberAsBool(v4, @"Supervised");
    v5->_allowSameVersion = getPlistNumberAsBool(v4, @"AllowSameVersion");
    getPlistString(v4, @"PrerequisiteBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteBuildVersion:](v5, "setPrerequisiteBuildVersion:", v8);

    getPlistString(v4, @"PrerequisiteProductVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteProductVersion:](v5, "setPrerequisiteProductVersion:", v9);

    getPlistString(v4, @"PrerequisiteReleaseType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteReleaseType:](v5, "setPrerequisiteReleaseType:", v10);

    v5->_prerequisiteReleaseTypeIsOverridden = getPlistNumberAsBool(v4, @"PrerequisiteReleaseTypeIsOverridden");
    getPlistString(v4, @"DownloadAuthorizationHeader");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setDownloadAuthorizationHeader:](v5, "setDownloadAuthorizationHeader:", v11);

    getPlistString(v4, @"LiveAssetAudienceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setLiveAssetAudienceUUID:](v5, "setLiveAssetAudienceUUID:", v12);

    getPlistString(v4, @"Purpose");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", v13);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  -[MADownloadOptions encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion) {
    [v4 encodeObject:requestedProductVersion forKey:@"RequestedProductVersion"];
  }
  [MEMORY[0x189607968] numberWithLong:self->_delayPeriod];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DelayPeriod"];

  [MEMORY[0x189607968] numberWithBool:self->_supervised];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"Supervised"];

  [MEMORY[0x189607968] numberWithBool:self->_allowSameVersion];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"AllowSameVersion"];

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion) {
    [v4 encodeObject:prerequisiteBuildVersion forKey:@"PrerequisiteBuildVersion"];
  }
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion) {
    [v4 encodeObject:prerequisiteProductVersion forKey:@"PrerequisiteProductVersion"];
  }
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType) {
    [v4 encodeObject:prerequisiteReleaseType forKey:@"PrerequisiteReleaseType"];
  }
  [MEMORY[0x189607968] numberWithBool:self->_prerequisiteReleaseTypeIsOverridden];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"PrerequisiteReleaseTypeIsOverridden"];
  v13 = -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  [v4 encodeObject:v13 forKey:@"LiveAssetAudienceUUID"];
  v14 = -[MAMsuDownloadOptions purpose](self, "purpose");
  [v4 encodeObject:v14 forKey:@"Purpose"];
}

- (id)encodeAsPlist
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  v3 = -[MADownloadOptions encodeAsPlist](&v17, sel_encodeAsPlist);
  id v4 = v3;
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion) {
    [v3 setValue:requestedProductVersion forKey:@"RequestedProductVersion"];
  }
  [MEMORY[0x189607968] numberWithLong:self->_delayPeriod];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v6 forKey:@"DelayPeriod"];

  [MEMORY[0x189607968] numberWithBool:self->_supervised];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v7 forKey:@"Supervised"];

  [MEMORY[0x189607968] numberWithBool:self->_allowSameVersion];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v8 forKey:@"AllowSameVersion"];

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion) {
    [v4 setValue:prerequisiteBuildVersion forKey:@"PrerequisiteBuildVersion"];
  }
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion) {
    [v4 setValue:prerequisiteProductVersion forKey:@"PrerequisiteProductVersion"];
  }
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType) {
    [v4 setValue:prerequisiteReleaseType forKey:@"PrerequisiteReleaseType"];
  }
  [MEMORY[0x189607968] numberWithBool:self->_prerequisiteReleaseTypeIsOverridden];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v12 forKey:@"PrerequisiteReleaseTypeIsOverridden"];
  v13 = -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  [v4 setValue:v13 forKey:@"DownloadAuthorizationHeader"];
  v14 = -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  [v4 setValue:v14 forKey:@"LiveAssetAudienceUUID"];

  -[MAMsuDownloadOptions purpose](self, "purpose");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v15 forKey:@"Purpose"];

  return v4;
}

- (void)setPrerequisiteReleaseType:(id)a3
{
  self->_prerequisiteReleaseTypeIsOverridden = 1;
}

- (id)description
{
  objc_super v15 = (void *)NSString;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MAMsuDownloadOptions;
  v3 = -[MADownloadOptions description](&v16, sel_description);
  -[MAMsuDownloadOptions requestedProductVersion](self, "requestedProductVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v5 = -[MAMsuDownloadOptions delayPeriod](self, "delayPeriod");
  BOOL v6 = -[MAMsuDownloadOptions supervised](self, "supervised");
  BOOL v7 = -[MAMsuDownloadOptions allowSameVersion](self, "allowSameVersion");
  v8 = -[MAMsuDownloadOptions prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v9 = -[MAMsuDownloadOptions prerequisiteProductVersion](self, "prerequisiteProductVersion");
  if (self->_prerequisiteReleaseTypeIsOverridden) {
    prerequisiteReleaseType = (const __CFString *)self->_prerequisiteReleaseType;
  }
  else {
    prerequisiteReleaseType = @"(default)";
  }
  -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MAMsuDownloadOptions purpose](self, "purpose");
  [v15 stringWithFormat:@"%@  + MAMsuDownloadOptions reqProdVersion: %@ delayPeriod: %ld managedDevice: %d allowSameVersion: %d prereqBuild: %@ prereqVersion: %@ prereqReleaseType: %@ liveAssetAudienceUUID: %@ purpose: %@", v3, v4, v5, v6, v7, v8, v9, prerequisiteReleaseType, v11, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)requestedProductVersion
{
  return self->_requestedProductVersion;
}

- (void)setRequestedProductVersion:(id)a3
{
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (BOOL)allowSameVersion
{
  return self->_allowSameVersion;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  self->_allowSameVersion = a3;
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
}

- (NSString)prerequisiteReleaseType
{
  return self->_prerequisiteReleaseType;
}

- (BOOL)prerequisiteReleaseTypeIsOverridden
{
  return self->_prerequisiteReleaseTypeIsOverridden;
}

- (void)setPrerequisiteReleaseTypeIsOverridden:(BOOL)a3
{
  self->_prerequisiteReleaseTypeIsOverridden = a3;
}

- (NSString)liveAssetAudienceUUID
{
  return self->_liveAssetAudienceUUID;
}

- (void)setLiveAssetAudienceUUID:(id)a3
{
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (void).cxx_destruct
{
}

@end