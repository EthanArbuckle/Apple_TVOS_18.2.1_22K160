@interface CuttlefishPCSServiceIdentifier
+ (BOOL)supportsSecureCoding;
- (CuttlefishPCSServiceIdentifier)initWithCoder:(id)a3;
- (NSData)PCSPublicKey;
- (NSNumber)PCSServiceID;
- (NSString)zoneID;
- (id)description;
- (id)init:(id)a3 PCSPublicKey:(id)a4 zoneID:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setPCSPublicKey:(id)a3;
- (void)setPCSServiceID:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CuttlefishPCSServiceIdentifier

- (id)init:(id)a3 PCSPublicKey:(id)a4 zoneID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CuttlefishPCSServiceIdentifier;
  v12 = -[CuttlefishPCSServiceIdentifier init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_PCSServiceID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier PCSPublicKey](self, "PCSPublicKey"));
  [v4 encodeObject:v5 forKey:@"pcsPublicKey"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier PCSServiceID](self, "PCSServiceID"));
  [v4 encodeObject:v6 forKey:@"pcsServiceID"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier zoneID](self, "zoneID"));
  [v4 encodeObject:v7 forKey:@"zoneID"];
}

- (CuttlefishPCSServiceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CuttlefishPCSServiceIdentifier;
  v5 = -[CuttlefishPCSServiceIdentifier init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"zoneID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"pcsServiceID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    PCSServiceID = v5->_PCSServiceID;
    v5->_PCSServiceID = (NSNumber *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"pcsPublicKey"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    PCSPublicKey = v5->_PCSPublicKey;
    v5->_PCSPublicKey = (NSData *)v13;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier zoneID](self, "zoneID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier PCSServiceID](self, "PCSServiceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CuttlefishPCSServiceIdentifier(%@): %@>",  v3,  v4));

  return v5;
}

- (NSNumber)PCSServiceID
{
  return (NSNumber *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPCSServiceID:(id)a3
{
}

- (NSData)PCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPCSPublicKey:(id)a3
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