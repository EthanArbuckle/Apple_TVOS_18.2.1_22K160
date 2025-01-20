@interface CKKSPCSIdentityQuery
+ (BOOL)supportsSecureCoding;
- (CKKSPCSIdentityQuery)initWithCoder:(id)a3;
- (CKKSPCSIdentityQuery)initWithServiceNumber:(id)a3 accessGroup:(id)a4 publicKey:(id)a5 zoneID:(id)a6;
- (NSNumber)serviceNumber;
- (NSString)accessGroup;
- (NSString)publicKey;
- (NSString)zoneID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setServiceNumber:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSPCSIdentityQuery

- (CKKSPCSIdentityQuery)initWithServiceNumber:(id)a3 accessGroup:(id)a4 publicKey:(id)a5 zoneID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSPCSIdentityQuery;
  v15 = -[CKKSPCSIdentityQuery init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceNumber, a3);
    objc_storeStrong((id *)&v16->_accessGroup, a4);
    objc_storeStrong((id *)&v16->_publicKey, a5);
    objc_storeStrong((id *)&v16->_zoneID, a6);
  }

  return v16;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[CKKSPCSIdentityQuery zoneID](self, "zoneID");
  v5 = -[CKKSPCSIdentityQuery serviceNumber](self, "serviceNumber");
  [v3 stringWithFormat:@"<CKKSPCSIdentityQuery(%@): %@>", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CKKSPCSIdentityQuery serviceNumber](self, "serviceNumber");
  [v4 encodeObject:v5 forKey:@"serviceNumber"];
  v6 = -[CKKSPCSIdentityQuery accessGroup](self, "accessGroup");
  [v4 encodeObject:v6 forKey:@"accessGroup"];
  v7 = -[CKKSPCSIdentityQuery zoneID](self, "zoneID");
  [v4 encodeObject:v7 forKey:@"zoneID"];

  -[CKKSPCSIdentityQuery publicKey](self, "publicKey");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"publicKey"];
}

- (CKKSPCSIdentityQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSPCSIdentityQuery;
  v5 = -[CKKSPCSIdentityQuery init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceNumber"];
    serviceNumber = v5->_serviceNumber;
    v5->_serviceNumber = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v12;
  }

  return v5;
}

- (NSNumber)serviceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setServiceNumber:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)publicKey
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end