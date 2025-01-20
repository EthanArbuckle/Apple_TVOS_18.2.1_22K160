@interface ExclaveAddressSpace
- (NSNumber)addressSpaceId;
- (NSNumber)layoutId;
- (NSString)name;
- (void)setAddressSpaceId:(id)a3;
- (void)setLayoutId:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ExclaveAddressSpace

- (NSNumber)addressSpaceId
{
  return self->_addressSpaceId;
}

- (void)setAddressSpaceId:(id)a3
{
}

- (NSNumber)layoutId
{
  return self->_layoutId;
}

- (void)setLayoutId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end