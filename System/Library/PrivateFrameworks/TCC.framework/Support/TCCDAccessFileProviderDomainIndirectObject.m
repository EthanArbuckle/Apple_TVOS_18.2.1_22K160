@interface TCCDAccessFileProviderDomainIndirectObject
- (NSString)fileProviderDomainID;
- (TCCDAccessFileProviderDomainIndirectObject)initWithFileProviderDomainID:(id)a3;
- (id)description;
@end

@implementation TCCDAccessFileProviderDomainIndirectObject

- (TCCDAccessFileProviderDomainIndirectObject)initWithFileProviderDomainID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TCCDAccessFileProviderDomainIndirectObject;
  v6 = -[TCCDAccessIndirectObject initWithType:](&v9, "initWithType:", 2LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileProviderDomainID, a3);
  }

  return v7;
}

- (id)description
{
  return -[NSString copy](self->_fileProviderDomainID, "copy");
}

- (NSString)fileProviderDomainID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end