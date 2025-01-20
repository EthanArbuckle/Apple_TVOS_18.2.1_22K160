@interface CHIPAccessoriesRecord
- (BOOL)createAccessoryMetadata:(id)a3;
- (CHIPAccessoriesRecord)initWithCKRecord:(id)a3;
- (NSString)accessoryListSignature;
- (NSString)installationGuideURLString;
- (NSString)stonehengeCertificateID;
- (UARPAccessoryMetadata)accessoryMetadata;
@end

@implementation CHIPAccessoriesRecord

- (CHIPAccessoriesRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CHIPAccessoriesRecord;
  self = -[CHIPAccessoriesRecord init](&v20, sel_init);
  if (!self) {
    goto LABEL_8;
  }
  v5 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
  log = self->_log;
  self->_log = v5;

  [v4 recordType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 isEqualToString:@"CHIPAccessory"];

  if (!v8) {
    goto LABEL_9;
  }
  [v4 objectForKey:@"signatureV2"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)[v9 copy];
  accessoryListSignature = self->_accessoryListSignature;
  self->_accessoryListSignature = v10;

  if (!self->_accessoryListSignature) {
    goto LABEL_9;
  }
  [v4 objectForKey:@"verificationCertificateKey"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSString *)[v12 copy];
  stonehengeCertificateID = self->_stonehengeCertificateID;
  self->_stonehengeCertificateID = v13;

  if (!self->_stonehengeCertificateID) {
    goto LABEL_9;
  }
  [v4 objectForKey:@"accessoryInstallationGuideURL"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSString *)[v15 copy];
  installationGuideURLString = self->_installationGuideURLString;
  self->_installationGuideURLString = v16;

  if (-[CHIPAccessoriesRecord createAccessoryMetadata:](self, "createAccessoryMetadata:", v4)
    && self->_accessoryMetadata)
  {
LABEL_8:
    self = self;
    v18 = self;
  }

  else
  {
LABEL_9:
    v18 = 0LL;
  }

  return v18;
}

- (BOOL)createAccessoryMetadata:(id)a3
{
  id v4 = a3;
  [v4 recordID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 recordName];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 componentsSeparatedByString:@"-"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 count];
  if (v8 == 2)
  {
    [v7 firstObject];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastObject];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UARPAccessoryMetadata *)[objc_alloc(MEMORY[0x18960E7A8]) initWithProductGroup:v9 productNumber:v10];
    accessoryMetadata = self->_accessoryMetadata;
    self->_accessoryMetadata = v11;

    [v4 objectForKey:@"accessoryCategoryNumber"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryCategoryNumber:]( self->_accessoryMetadata,  "setAccessoryCategoryNumber:",  [v13 unsignedLongLongValue]);

    [v4 objectForKey:@"accessoryMarketingName"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryMarketingName:](self->_accessoryMetadata, "setAccessoryMarketingName:", v14);

    [v4 objectForKey:@"accessoryProductLabelV2"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryProductLabel:](self->_accessoryMetadata, "setAccessoryProductLabel:", v15);

    [v4 objectForKey:@"vendorName"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setVendorName:](self->_accessoryMetadata, "setVendorName:", v16);

    [v4 objectForKey:@"companyLegalName"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setCompanyLegalName:](self->_accessoryMetadata, "setCompanyLegalName:", v17);

    [v4 objectForKey:@"companyPreferredName"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setCompanyPreferredName:](self->_accessoryMetadata, "setCompanyPreferredName:", v18);

    -[UARPAccessoryMetadata setAccessoryCapability:](self->_accessoryMetadata, "setAccessoryCapability:", 16LL);
    if (self->_installationGuideURLString)
    {
      objc_msgSend(MEMORY[0x189604030], "URLWithString:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPAccessoryMetadata setAccessoryInstallationGuideURL:]( self->_accessoryMetadata,  "setAccessoryInstallationGuideURL:",  v19);
    }
  }

  return v8 == 2;
}

- (UARPAccessoryMetadata)accessoryMetadata
{
  return (UARPAccessoryMetadata *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)accessoryListSignature
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)stonehengeCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)installationGuideURLString
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end