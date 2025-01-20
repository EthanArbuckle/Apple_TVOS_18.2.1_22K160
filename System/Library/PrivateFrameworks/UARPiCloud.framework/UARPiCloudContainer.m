@interface UARPiCloudContainer
- (BOOL)isCHIPContainer;
- (BOOL)requiresPrefForSigningBeta;
- (CKContainer)container;
- (CKDatabase)database;
- (CKServerChangeToken)databaseChangeToken;
- (NSData)verificationCertificate;
- (NSDictionary)verificationCertificates;
- (NSMutableSet)updatedRecords;
- (NSMutableSet)updatedZones;
- (NSString)containerID;
- (UARPiCloudContainer)initWithContainerID:(id)a3;
- (id)publicKey;
- (void)createContainerWithIdentifier:(id)a3;
- (void)processVerificationCertificateRecord:(id)a3;
- (void)setDatabaseChangeToken:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setUpdatedRecords:(id)a3;
- (void)setUpdatedZones:(id)a3;
- (void)setVerificationCertificate:(id)a3;
- (void)setVerificationCertificates:(id)a3;
@end

@implementation UARPiCloudContainer

- (UARPiCloudContainer)initWithContainerID:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UARPiCloudContainer;
  v5 = -[UARPiCloudContainer init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UARPiCloudContainer createContainerWithIdentifier:](v5, "createContainerWithIdentifier:", v4);
    if (!v6->_container)
    {
      v15 = 0LL;
      goto LABEL_6;
    }

    uint64_t v7 = [v4 copy];
    containerID = v6->_containerID;
    v6->_containerID = (NSString *)v7;

    uint64_t v9 = -[CKContainer publicCloudDatabase](v6->_container, "publicCloudDatabase");
    database = v6->_database;
    v6->_database = (CKDatabase *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    updatedZones = v6->_updatedZones;
    v6->_updatedZones = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    updatedRecords = v6->_updatedRecords;
    v6->_updatedRecords = v13;
  }

  v15 = v6;
LABEL_6:

  return v15;
}

- (void)createContainerWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (CFPreferencesGetAppBooleanValue(@"developmentEnvironment", @"com.apple.UARPiCloud", 0LL))
  {
    int v5 = 1;
  }

  else
  {
    v6 = (void *)CFPreferencesCopyValue( @"developmentEnvironment",  @"com.apple.UARPiCloud",  @"mobile",  (CFStringRef)*MEMORY[0x189605190]);
    int v5 = [v6 BOOLValue];
  }

  if ([v4 containsString:@"com.apple.chip"])
  {
    [MEMORY[0x189604030] fileURLWithPath:@"/Library/Managed Preferences/mobile/com.apple.UARPiCloud.plist"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = 0LL;
    v8 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfURL:v7 error:&v15];
    id v9 = v15;
    if (v8)
    {
      [v8 objectForKey:@"developmentEnvironment"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        int v5 = [v10 BOOLValue];
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v17 = "-[UARPiCloudContainer createContainerWithIdentifier:]";
      __int16 v18 = 2112;
      v19 = v7;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Failed to read managedPrefs at %@ error %@",  buf,  0x20u);
    }
  }

  if (v5) {
    uint64_t v11 = 2LL;
  }
  else {
    uint64_t v11 = 1LL;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x189602160]) initWithContainerIdentifier:v4 environment:v11];
  v13 = (CKContainer *)[objc_alloc(MEMORY[0x189602158]) initWithContainerID:v12];
  container = self->_container;
  self->_container = v13;
}

- (void)setUpdatedZones:(id)a3
{
  id v4 = (NSMutableSet *)[a3 mutableCopy];
  updatedZones = self->_updatedZones;
  self->_updatedZones = v4;
}

- (NSMutableSet)updatedZones
{
  return self->_updatedZones;
}

- (void)setUpdatedRecords:(id)a3
{
  id v4 = (NSMutableSet *)[a3 mutableCopy];
  updatedRecords = self->_updatedRecords;
  self->_updatedRecords = v4;
}

- (NSMutableSet)updatedRecords
{
  return self->_updatedRecords;
}

- (void)setDatabaseChangeToken:(id)a3
{
  id v4 = (CKServerChangeToken *)a3;
  if (!-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer") && v4)
  {
    id v9 = 0LL;
    [MEMORY[0x1896078F8] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v9;
    [NSString stringWithFormat:@"%@_%@", self->_containerID, @"Database"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v5, v7);
  }

  databaseChangeToken = self->_databaseChangeToken;
  self->_databaseChangeToken = v4;
}

- (CKServerChangeToken)databaseChangeToken
{
  if (!-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer"))
  {
    [NSString stringWithFormat:@"%@_%@", self->_containerID, @"Database"];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v3;
    if (!self->_databaseChangeToken)
    {
      uint64_t v5 = getEntryForKey(v3);
      if (v5)
      {
        id v6 = (void *)v5;
        id v11 = 0LL;
        [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
        uint64_t v7 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
        id v8 = v11;
        databaseChangeToken = self->_databaseChangeToken;
        self->_databaseChangeToken = v7;
      }
    }
  }

  return self->_databaseChangeToken;
}

- (void)setVerificationCertificate:(id)a3
{
  id v4 = (NSData *)a3;
  if (v4)
  {
    [NSString stringWithFormat:@"%@_%@", self->_containerID, @"VerificationCertificate"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v4, v5);
  }

  verificationCertificate = self->_verificationCertificate;
  self->_verificationCertificate = v4;
}

- (void)setPublicKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [NSString stringWithFormat:@"%@_%@", self->_containerID, @"PublicKey"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v4, v5);
  }

  id publicKey = self->_publicKey;
  self->_id publicKey = v4;
}

- (NSData)verificationCertificate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  verificationCertificate = self->_verificationCertificate;
  if (!verificationCertificate)
  {
    getEntryForKey(v3);
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_verificationCertificate;
    self->_verificationCertificate = v5;

    verificationCertificate = self->_verificationCertificate;
  }

  uint64_t v7 = verificationCertificate;

  return v7;
}

- (id)publicKey
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id publicKey = self->_publicKey;
  if (!publicKey)
  {
    getEntryForKey(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_publicKey;
    self->_id publicKey = v5;

    id publicKey = self->_publicKey;
  }

  id v7 = publicKey;

  return v7;
}

- (BOOL)requiresPrefForSigningBeta
{
  return -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.uarp.uat")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.uarp.staging.uat")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.uarp.beta")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.uarp.staging.beta")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.uarp.staging")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.chip.staging");
}

- (BOOL)isCHIPContainer
{
  return -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.chip")
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", @"com.apple.chip.staging");
}

- (void)processVerificationCertificateRecord:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer"))
  {
    [v4 objectForKey:@"certificate"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)MEMORY[0x1896078D8];
      [v5 dataUsingEncoding:4];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = 0LL;
      [v7 JSONObjectWithData:v8 options:0 error:&v12];
      id v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      id v10 = v12;
      verificationCertificates = self->_verificationCertificates;
      self->_verificationCertificates = v9;

      if (v10 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v10;
        _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create _verificationCertificates with error: %@",  buf,  0xCu);
      }
    }
  }
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (CKDatabase)database
{
  return (CKDatabase *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSDictionary)verificationCertificates
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setVerificationCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end