@interface DMDPayloadContext
- (NSDictionary)assetProvidersByPayloadIdentifier;
- (NSString)organizationIdentifier;
- (void)setAssetProvidersByPayloadIdentifier:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDPayloadContext

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSDictionary)assetProvidersByPayloadIdentifier
{
  return self->_assetProvidersByPayloadIdentifier;
}

- (void)setAssetProvidersByPayloadIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end