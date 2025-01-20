@interface CuttlefishPCSIdentity
+ (BOOL)supportsSecureCoding;
- (CKRecord)item;
- (CuttlefishPCSIdentity)initWithCoder:(id)a3;
- (CuttlefishPCSServiceIdentifier)service;
- (id)description;
- (id)init:(id)a3 item:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setService:(id)a3;
@end

@implementation CuttlefishPCSIdentity

- (id)init:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CuttlefishPCSIdentity;
  v9 = -[CuttlefishPCSIdentity init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSIdentity service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CuttlefishPCSIdentity(%@)>",  v2));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSIdentity service](self, "service"));
  [v4 encodeObject:v5 forKey:@"service"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSIdentity item](self, "item"));
  [v4 encodeObject:v6 forKey:@"item"];
}

- (CuttlefishPCSIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CuttlefishPCSIdentity;
  v5 = -[CuttlefishPCSIdentity init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(CuttlefishPCSServiceIdentifier) forKey:@"service"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    service = v5->_service;
    v5->_service = (CuttlefishPCSServiceIdentifier *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(CKRecord) forKey:@"item"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    item = v5->_item;
    v5->_item = (CKRecord *)v10;
  }

  return v5;
}

- (CuttlefishPCSServiceIdentifier)service
{
  return (CuttlefishPCSServiceIdentifier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setService:(id)a3
{
}

- (CKRecord)item
{
  return (CKRecord *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setItem:(id)a3
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