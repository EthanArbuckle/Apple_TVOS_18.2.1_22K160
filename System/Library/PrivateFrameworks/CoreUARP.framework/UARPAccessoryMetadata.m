@interface UARPAccessoryMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)accessoryMarketingName;
- (NSString)accessoryModel;
- (NSString)accessoryProductLabel;
- (NSString)companyLegalName;
- (NSString)companyPreferredName;
- (NSString)manufacturerAppBundleID;
- (NSString)manufacturerAppStoreID;
- (NSString)manufacturerName;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSString)vendorName;
- (NSURL)accessoryInstallationGuideURL;
- (UARPAccessoryMetadata)initWithCoder:(id)a3;
- (UARPAccessoryMetadata)initWithProductGroup:(id)a3 productNumber:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)accessoryCapability;
- (unint64_t)accessoryCategoryNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryCapability:(unint64_t)a3;
- (void)setAccessoryCategoryNumber:(unint64_t)a3;
- (void)setAccessoryInstallationGuideURL:(id)a3;
- (void)setAccessoryMarketingName:(id)a3;
- (void)setAccessoryModel:(id)a3;
- (void)setAccessoryProductLabel:(id)a3;
- (void)setCompanyLegalName:(id)a3;
- (void)setCompanyPreferredName:(id)a3;
- (void)setManufacturerAppBundleID:(id)a3;
- (void)setManufacturerAppStoreID:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation UARPAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAccessoryMetadata)initWithProductGroup:(id)a3 productNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPAccessoryMetadata;
  v9 = -[UARPAccessoryMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_productGroup, a3);
    objc_storeStrong((id *)&v10->_productNumber, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[UARPAccessoryMetadata initWithProductGroup:productNumber:]( objc_alloc(&OBJC_CLASS___UARPAccessoryMetadata),  "initWithProductGroup:productNumber:",  self->_productGroup,  self->_productNumber);
  -[UARPAccessoryMetadata setVendorName:](v4, "setVendorName:", self->_vendorName);
  -[UARPAccessoryMetadata setCompanyLegalName:](v4, "setCompanyLegalName:", self->_companyLegalName);
  -[UARPAccessoryMetadata setCompanyPreferredName:](v4, "setCompanyPreferredName:", self->_companyPreferredName);
  -[UARPAccessoryMetadata setAccessoryMarketingName:](v4, "setAccessoryMarketingName:", self->_accessoryMarketingName);
  -[UARPAccessoryMetadata setAccessoryProductLabel:](v4, "setAccessoryProductLabel:", self->_accessoryProductLabel);
  -[UARPAccessoryMetadata setAccessoryInstallationGuideURL:]( v4,  "setAccessoryInstallationGuideURL:",  self->_accessoryInstallationGuideURL);
  -[UARPAccessoryMetadata setAccessoryCategoryNumber:]( v4,  "setAccessoryCategoryNumber:",  self->_accessoryCategoryNumber);
  -[UARPAccessoryMetadata setAccessoryCapability:](v4, "setAccessoryCapability:", self->_accessoryCapability);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  productGroup = self->_productGroup;
  id v5 = a3;
  [v5 encodeObject:productGroup forKey:@"productGroup"];
  [v5 encodeObject:self->_productNumber forKey:@"productNumber"];
  [v5 encodeObject:self->_vendorName forKey:@"vendorName"];
  [v5 encodeObject:self->_companyLegalName forKey:@"companyLegalName"];
  [v5 encodeObject:self->_companyPreferredName forKey:@"companyPreferredName"];
  [v5 encodeObject:self->_accessoryMarketingName forKey:@"accessoryMarketingName"];
  [v5 encodeObject:self->_accessoryProductLabel forKey:@"accessoryProductLabel"];
  [v5 encodeObject:self->_accessoryInstallationGuideURL forKey:@"accessoryInstallationGuideURL"];
  [v5 encodeInteger:self->_accessoryCategoryNumber forKey:@"accessoryCategoryNumber"];
  [v5 encodeInteger:self->_accessoryCapability forKey:@"accessoryCapability"];
}

- (UARPAccessoryMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productGroup"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productNumber"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[UARPAccessoryMetadata initWithProductGroup:productNumber:](self, "initWithProductGroup:productNumber:", v5, v6);
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v7->_vendorName;
    v7->_vendorName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companyLegalName"];
    companyLegalName = v7->_companyLegalName;
    v7->_companyLegalName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companyPreferredName"];
    companyPreferredName = v7->_companyPreferredName;
    v7->_companyPreferredName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryMarketingName"];
    accessoryMarketingName = v7->_accessoryMarketingName;
    v7->_accessoryMarketingName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryProductLabel"];
    accessoryProductLabel = v7->_accessoryProductLabel;
    v7->_accessoryProductLabel = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryInstallationGuideURL"];
    accessoryInstallationGuideURL = v7->_accessoryInstallationGuideURL;
    v7->_accessoryInstallationGuideURL = (NSURL *)v18;

    v7->_accessoryCategoryNumber = [v4 decodeIntegerForKey:@"accessoryCategoryNumber"];
    v7->_accessoryCapability = [v4 decodeIntegerForKey:@"accessoryCapability"];
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"productGroup=%@, productNumber=%@, vendorName=%@, companyLegalName=%@, companyPreferredName=%@, accessoryMarketingName=%@, productLabel=%@, accessoryCategoryNumber=%llu, accessoryInstallationGuideURL=%@", self->_productGroup, self->_productNumber, self->_vendorName, self->_companyLegalName, self->_companyPreferredName, self->_accessoryMarketingName, self->_accessoryProductLabel, self->_accessoryCategoryNumber, self->_accessoryInstallationGuideURL];
}

- (unint64_t)accessoryCategoryNumber
{
  return self->_accessoryCategoryNumber;
}

- (void)setAccessoryCategoryNumber:(unint64_t)a3
{
  self->_accessoryCategoryNumber = a3;
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)manufacturerAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setManufacturerAppBundleID:(id)a3
{
}

- (NSString)manufacturerAppStoreID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setManufacturerAppStoreID:(id)a3
{
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)accessoryModel
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAccessoryModel:(id)a3
{
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setVendorName:(id)a3
{
}

- (NSString)companyLegalName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCompanyLegalName:(id)a3
{
}

- (NSString)companyPreferredName
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCompanyPreferredName:(id)a3
{
}

- (NSString)accessoryMarketingName
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAccessoryMarketingName:(id)a3
{
}

- (NSString)accessoryProductLabel
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAccessoryProductLabel:(id)a3
{
}

- (NSURL)accessoryInstallationGuideURL
{
  return (NSURL *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAccessoryInstallationGuideURL:(id)a3
{
}

- (unint64_t)accessoryCapability
{
  return self->_accessoryCapability;
}

- (void)setAccessoryCapability:(unint64_t)a3
{
  self->_accessoryCapability = a3;
}

- (void).cxx_destruct
{
}

@end