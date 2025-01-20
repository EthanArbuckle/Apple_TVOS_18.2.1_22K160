@interface SUCoreRollbackDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)rollbackEligible;
- (NSString)productBuildVersion;
- (NSString)productVersion;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (SUCoreRollbackDescriptor)init;
- (SUCoreRollbackDescriptor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRollbackEligible:(BOOL)a3;
@end

@implementation SUCoreRollbackDescriptor

- (SUCoreRollbackDescriptor)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SUCoreRollbackDescriptor;
  v2 = -[SUCoreRollbackDescriptor init](&v21, sel_init);
  if (v2)
  {
    [MEMORY[0x189612770] sharedDevice];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 splatCryptex1RestoreVersion];
    restoreVersion = v2->_restoreVersion;
    v2->_restoreVersion = (NSString *)v4;

    v6 = (void *)NSString;
    [MEMORY[0x189612770] sharedDevice];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 splatCryptex1ProductVersion];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 splatCryptex1ProductVersionExtra];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v6 stringWithFormat:@"%@ %@", v8, v10];
    productVersion = v2->_productVersion;
    v2->_productVersion = (NSString *)v11;

    [MEMORY[0x189612770] sharedDevice];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 splatCryptex1BuildVersion];
    productBuildVersion = v2->_productBuildVersion;
    v2->_productBuildVersion = (NSString *)v14;

    [MEMORY[0x189612770] sharedDevice];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 splatCryptex1ReleaseType];
    releaseType = v2->_releaseType;
    v2->_releaseType = (NSString *)v17;

    [MEMORY[0x189612770] sharedDevice];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_rollbackEligible = [v19 hasEligibleRollback];
  }

  return v2;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  v6 = -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v7 = -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  BOOL v8 = -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible");
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = (void *)[v3 initWithFormat:@"restoreVersion:%@ productVersion:%@ producBuildVersion:%@ releaseType:%@ rollbackEligible:%@", v4, v5, v6, v7, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollbackDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUCoreRollbackDescriptor;
  v5 = -[SUCoreRollbackDescriptor init](&v11, sel_init);
  if (v5)
  {
    -[SUCoreRollbackDescriptor setRollbackEligible:]( v5,  "setRollbackEligible:",  [v4 decodeBoolForKey:@"rollbackEligible"]);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restoreVersion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setRestoreVersion:](v5, "setRestoreVersion:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setProductVersion:](v5, "setProductVersion:", v7);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v8);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setReleaseType:](v5, "setReleaseType:", v9);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible"),  @"rollbackEligible");
  v5 = -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  [v4 encodeObject:v5 forKey:@"restoreVersion"];
  v6 = -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  [v4 encodeObject:v6 forKey:@"productVersion"];
  v7 = -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  [v4 encodeObject:v7 forKey:@"productBuildVersion"];

  -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"releaseType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[SUCoreRollbackDescriptor init]( +[SUCoreRollbackDescriptor allocWithZone:](&OBJC_CLASS___SUCoreRollbackDescriptor, "allocWithZone:"),  "init");
  -[SUCoreRollbackDescriptor setRollbackEligible:]( v5,  "setRollbackEligible:",  -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible"));
  v6 = -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  v7 = (void *)[v6 copyWithZone:a3];
  -[SUCoreRollbackDescriptor setRestoreVersion:](v5, "setRestoreVersion:", v7);

  -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  -[SUCoreRollbackDescriptor setProductVersion:](v5, "setProductVersion:", v9);
  v10 = -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  objc_super v11 = (void *)[v10 copyWithZone:a3];
  -[SUCoreRollbackDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v11);
  v12 = -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  v13 = (void *)[v12 copyWithZone:a3];
  -[SUCoreRollbackDescriptor setReleaseType:](v5, "setReleaseType:", v13);

  return v5;
}

- (BOOL)rollbackEligible
{
  return self->_rollbackEligible;
}

- (void)setRollbackEligible:(BOOL)a3
{
  self->_rollbackEligible = a3;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end