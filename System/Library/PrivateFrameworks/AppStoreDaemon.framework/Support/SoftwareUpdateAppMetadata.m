@interface SoftwareUpdateAppMetadata
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SoftwareUpdateAppMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[SoftwareUpdateAppMetadata init]( +[SoftwareUpdateAppMetadata allocWithZone:](&OBJC_CLASS___SoftwareUpdateAppMetadata, "allocWithZone:", a3),  "init");
  objc_storeStrong((id *)&v4->_itemID, self->_itemID);
  objc_storeStrong((id *)&v4->_externalVersionID, self->_externalVersionID);
  return v4;
}

- (void).cxx_destruct
{
}

@end