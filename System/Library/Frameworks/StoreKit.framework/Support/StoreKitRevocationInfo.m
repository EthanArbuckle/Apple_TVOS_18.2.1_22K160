@interface StoreKitRevocationInfo
- (NSNumber)userID;
- (NSString)bundleID;
- (NSString)productID;
- (StoreKitRevocationInfo)initWithUserID:(id)a3 bundleID:(id)a4 productID:(id)a5;
@end

@implementation StoreKitRevocationInfo

- (StoreKitRevocationInfo)initWithUserID:(id)a3 bundleID:(id)a4 productID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___StoreKitRevocationInfo;
  v12 = -[StoreKitRevocationInfo init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userID, a3);
    objc_storeStrong((id *)&v13->_bundleID, a4);
    objc_storeStrong((id *)&v13->_productID, a5);
  }

  return v13;
}

- (NSNumber)userID
{
  return self->_userID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)productID
{
  return self->_productID;
}

- (void).cxx_destruct
{
}

@end