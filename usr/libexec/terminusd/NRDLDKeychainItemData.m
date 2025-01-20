@interface NRDLDKeychainItemData
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NRDLDKeychainItemData

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRDLDKeychainItemData;
  v4 = -[NRDLDKeychainItem copyWithZone:](&v9, "copyWithZone:", a3);
  if (self) {
    secretData = self->_secretData;
  }
  else {
    secretData = 0LL;
  }
  v6 = secretData;
  id v7 = -[NSData copy](v6, "copy");
  if (v4) {
    objc_storeStrong(v4 + 2, v7);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end