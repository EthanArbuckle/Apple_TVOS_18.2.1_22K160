@interface NRDLDDataClassKeychainItems
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NRDLDDataClassKeychainItems

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if (self) {
    remotePublicKey = self->_remotePublicKey;
  }
  else {
    remotePublicKey = 0LL;
  }
  v6 = remotePublicKey;
  id v7 = -[NRDLDKeychainItemSecKey copy](v6, "copy");
  if (v4) {
    objc_storeStrong(v4 + 1, v7);
  }

  if (self) {
    localPrivateKey = self->_localPrivateKey;
  }
  else {
    localPrivateKey = 0LL;
  }
  v9 = localPrivateKey;
  id v10 = -[NRDLDKeychainItemSecKey copy](v9, "copy");
  if (v4) {
    objc_storeStrong(v4 + 2, v10);
  }

  if (self) {
    dhLocalPrivateKey = self->_dhLocalPrivateKey;
  }
  else {
    dhLocalPrivateKey = 0LL;
  }
  v12 = dhLocalPrivateKey;
  id v13 = -[NRDLDKeychainItemSecKey copy](v12, "copy");
  if (v4) {
    objc_storeStrong(v4 + 4, v13);
  }

  if (self) {
    sharedSecret = self->_sharedSecret;
  }
  else {
    sharedSecret = 0LL;
  }
  v15 = sharedSecret;
  id v16 = -[NRDLDKeychainItemData copy](v15, "copy");
  if (v4) {
    objc_storeStrong(v4 + 3, v16);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end