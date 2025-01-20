@interface LSStashedAppMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isFreeProfileValidated;
- (BOOL)isProfileValidated;
- (BOOL)isUPPValidated;
- (LSStashedAppMetadata)initWithCoder:(id)a3;
- (LSStashedAppMetadata)initWithContext:(LSContext *)a3 unitID:(unsigned int)a4;
- (NSDate)dateOriginallyInstalled;
- (NSDate)dateStashed;
- (NSString)bundleShortVersion;
- (NSString)exactBundleVersion;
- (NSString)signerOrganization;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSStashedAppMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSStashedAppMetadata)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSStashedAppMetadata;
  v4 = -[LSStashedAppMetadata init](&v16, sel_init);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"exactBundleVersion");
    exactBundleVersion = v4->_exactBundleVersion;
    v4->_exactBundleVersion = (NSString *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleShortVersion");
    bundleShortVersion = v4->_bundleShortVersion;
    v4->_bundleShortVersion = (NSString *)v7;

    uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dateStashed");
    dateStashed = v4->_dateStashed;
    v4->_dateStashed = (NSDate *)v9;

    uint64_t v11 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dateOriginallyInstalled");
    dateOriginallyInstalled = v4->_dateOriginallyInstalled;
    v4->_dateOriginallyInstalled = (NSDate *)v11;

    uint64_t v13 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"signerOrganization");
    signerOrganization = v4->_signerOrganization;
    v4->_signerOrganization = (NSString *)v13;

    v4->_validationState = [a3 decodeIntForKey:@"validationState"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSStashedAppMetadata)initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS___LSStashedAppMetadata;
    v6 = -[LSStashedAppMetadata init](&v25, sel_init);
    if (v6)
    {
      uint64_t v7 = [v5 objectForKey:*MEMORY[0x189604E18] ofClass:objc_opt_class()];
      exactBundleVersion = v6->_exactBundleVersion;
      v6->_exactBundleVersion = (NSString *)v7;

      uint64_t v9 = [v5 objectForKey:*MEMORY[0x189604AC8] ofClass:objc_opt_class()];
      bundleShortVersion = v6->_bundleShortVersion;
      v6->_bundleShortVersion = (NSString *)v9;

      [v5 objectForKey:@"StashedAtTimestamp" ofClass:objc_opt_class()];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 longValue];

      uint64_t v13 = [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:(double)v12];
      dateStashed = v6->_dateStashed;
      v6->_dateStashed = (NSDate *)v13;

      [v5 objectForKey:@"StashOriginalInstallTimestamp" ofClass:objc_opt_class()];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 longValue];

      uint64_t v17 = [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:(double)v16];
      dateOriginallyInstalled = v6->_dateOriginallyInstalled;
      v6->_dateOriginallyInstalled = (NSDate *)v17;

      uint64_t v19 = [v5 objectForKey:@"SignerOrganization" ofClass:objc_opt_class()];
      signerOrganization = v6->_signerOrganization;
      v6->_signerOrganization = (NSString *)v19;

      self = (LSStashedAppMetadata *)objc_alloc_init(MEMORY[0x189603FC8]);
      [v5 objectForKey:@"ProfileValidated" ofClass:objc_opt_class()];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21) {
        -[LSStashedAppMetadata setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v21,  @"ProfileValidated");
      }

      [v5 objectForKey:@"UPPValidated" ofClass:objc_opt_class()];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22) {
        -[LSStashedAppMetadata setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v22,  @"UPPValidated");
      }

      [v5 objectForKey:@"FreeProfileValidated" ofClass:objc_opt_class()];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23) {
        -[LSStashedAppMetadata setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v23,  @"FreeProfileValidated");
      }

      v6->_validationState = _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)self);
    }

    else
    {
      self = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (BOOL)isProfileValidated
{
  return self->_validationState != 0;
}

- (BOOL)isUPPValidated
{
  return self->_validationState == 2;
}

- (BOOL)isFreeProfileValidated
{
  return self->_validationState == 3;
}

- (NSString)exactBundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDate)dateStashed
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDate)dateOriginallyInstalled
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)signerOrganization
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end