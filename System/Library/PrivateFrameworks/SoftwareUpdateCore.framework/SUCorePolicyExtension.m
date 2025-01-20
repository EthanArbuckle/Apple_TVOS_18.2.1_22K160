@interface SUCorePolicyExtension
+ (BOOL)supportsSecureCoding;
- (SUCorePolicyExtension)init;
- (SUCorePolicyExtension)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
@end

@implementation SUCorePolicyExtension

- (SUCorePolicyExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtension;
  return -[SUCorePolicyExtension init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyExtension)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtension;
  return -[SUCorePolicyExtension init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtension);
}

- (id)extensionName
{
  return @"SUCorePolicyExtension";
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)summary
{
  return @"SUCorePolicyExtension";
}

- (id)description
{
  return @"SUCorePolicyExtension";
}

@end