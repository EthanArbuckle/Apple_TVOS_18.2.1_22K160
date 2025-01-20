@interface CKKSCurrentItemQueryResult
+ (BOOL)supportsSecureCoding;
- (CKKSCurrentItemQueryResult)initWithCoder:(id)a3;
- (CKKSCurrentItemQueryResult)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5 decryptedRecord:(id)a6;
- (NSDictionary)decryptedRecord;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)zoneID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setDecryptedRecord:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCurrentItemQueryResult

- (CKKSCurrentItemQueryResult)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5 decryptedRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemQueryResult;
  v15 = -[CKKSCurrentItemQueryResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_accessGroup, a4);
    objc_storeStrong((id *)&v16->_zoneID, a5);
    objc_storeStrong((id *)&v16->_decryptedRecord, a6);
  }

  return v16;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[CKKSCurrentItemQueryResult zoneID](self, "zoneID");
  v5 = -[CKKSCurrentItemQueryResult accessGroup](self, "accessGroup");
  v6 = -[CKKSCurrentItemQueryResult identifier](self, "identifier");
  [v3 stringWithFormat:@"<CKKSCurrentItemQueryResult(%@-%@): %@>", v4, v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CKKSCurrentItemQueryResult identifier](self, "identifier");
  [v4 encodeObject:v5 forKey:@"identifier"];
  v6 = -[CKKSCurrentItemQueryResult accessGroup](self, "accessGroup");
  [v4 encodeObject:v6 forKey:@"accessGroup"];
  v7 = -[CKKSCurrentItemQueryResult zoneID](self, "zoneID");
  [v4 encodeObject:v7 forKey:@"zoneID"];

  -[CKKSCurrentItemQueryResult decryptedRecord](self, "decryptedRecord");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"decryptedRecord"];
}

- (CKKSCurrentItemQueryResult)initWithCoder:(id)a3
{
  v19[5] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemQueryResult;
  v5 = -[CKKSCurrentItemQueryResult init](&v18, sel_init);
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

    id v12 = (void *)MEMORY[0x189604010];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v19 count:5];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setWithArray:v13];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"decryptedRecord"];
    decryptedRecord = v5->_decryptedRecord;
    v5->_decryptedRecord = (NSDictionary *)v15;
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

- (NSDictionary)decryptedRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDecryptedRecord:(id)a3
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