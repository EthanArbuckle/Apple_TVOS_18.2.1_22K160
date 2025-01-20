@interface UpdatableApp
- (BOOL)hasEvidOverride;
- (BOOL)isB2BCustomApp;
- (NSNumber)downloaderDSID;
- (NSNumber)purchaserDSID;
- (NSNumber)storeExternalVersionID;
- (NSNumber)storeItemID;
- (NSNumber)storefrontID;
- (NSString)description;
@end

@implementation UpdatableApp

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ bundleID: %@ itemID: %@ }",  self->_bundleID,  self->_storeItemID);
}

- (NSNumber)downloaderDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)hasEvidOverride
{
  return self->_hasEvidOverride;
}

- (BOOL)isB2BCustomApp
{
  return self->_isB2BCustomApp;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSNumber)storeExternalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSNumber)storeItemID
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSNumber)storefrontID
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end