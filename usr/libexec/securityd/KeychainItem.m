@interface KeychainItem
- (KeychainItem)initWithAccessGroup:(id)a3;
- (NSString)accessGroup;
- (void)setAccessGroup:(id)a3;
@end

@implementation KeychainItem

- (KeychainItem)initWithAccessGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KeychainItem;
  v6 = -[KeychainItem init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessGroup, a3);
  }

  return v7;
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end