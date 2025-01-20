@interface CKKSCurrentItemQuery
+ (BOOL)supportsSecureCoding;
- (CKKSCurrentItemQuery)initWithCoder:(id)a3;
- (CKKSCurrentItemQuery)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)zoneID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCurrentItemQuery

- (CKKSCurrentItemQuery)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemQuery;
  v12 = -[CKKSCurrentItemQuery init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_accessGroup, a4);
    objc_storeStrong((id *)&v13->_zoneID, a5);
  }

  return v13;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[CKKSCurrentItemQuery zoneID](self, "zoneID");
  v5 = -[CKKSCurrentItemQuery accessGroup](self, "accessGroup");
  v6 = -[CKKSCurrentItemQuery identifier](self, "identifier");
  [v3 stringWithFormat:@"<CKKSCurrentItemQuery(%@-%@): %@>", v4, v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CKKSCurrentItemQuery identifier](self, "identifier");
  [v4 encodeObject:v5 forKey:@"identifier"];
  v6 = -[CKKSCurrentItemQuery accessGroup](self, "accessGroup");
  [v4 encodeObject:v6 forKey:@"accessGroup"];

  -[CKKSCurrentItemQuery zoneID](self, "zoneID");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"zoneID"];
}

- (CKKSCurrentItemQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemQuery;
  v5 = -[CKKSCurrentItemQuery init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v10;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
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