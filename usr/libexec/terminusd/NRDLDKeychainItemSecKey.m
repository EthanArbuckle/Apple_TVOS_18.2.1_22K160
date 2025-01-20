@interface NRDLDKeychainItemSecKey
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation NRDLDKeychainItemSecKey

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0LL, 16LL);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDLDKeychainItemSecKey;
  -[NRDLDKeychainItemSecKey dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRDLDKeychainItemSecKey;
  id v4 = -[NRDLDKeychainItem copyWithZone:](&v9, "copyWithZone:", a3);
  v6 = v4;
  if (!self)
  {
    secKeyRef = 0LL;
    if (!v4) {
      return v6;
    }
    goto LABEL_3;
  }

  secKeyRef = self->_secKeyRef;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_nonatomic(v4, v5, secKeyRef, 16LL);
  return v6;
}

@end