@interface CuttlefishCurrentItemSpecifier
+ (BOOL)supportsSecureCoding;
- (CuttlefishCurrentItemSpecifier)initWithCoder:(id)a3;
- (NSString)itemPtrName;
- (NSString)zoneID;
- (id)description;
- (id)init:(id)a3 zoneID:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setItemPtrName:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CuttlefishCurrentItemSpecifier

- (id)init:(id)a3 zoneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CuttlefishCurrentItemSpecifier;
  v9 = -[CuttlefishCurrentItemSpecifier init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemPtrName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier itemPtrName](self, "itemPtrName"));
  [v4 encodeObject:v5 forKey:@"itemPtrName"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier zoneID](self, "zoneID"));
  [v4 encodeObject:v6 forKey:@"zoneID"];
}

- (CuttlefishCurrentItemSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CuttlefishCurrentItemSpecifier;
  v5 = -[CuttlefishCurrentItemSpecifier init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"zoneID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"itemPtrName"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    itemPtrName = v5->_itemPtrName;
    v5->_itemPtrName = (NSString *)v10;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier zoneID](self, "zoneID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier itemPtrName](self, "itemPtrName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CuttlefishCurrentItemSpecifier(%@): %@>",  v3,  v4));

  return v5;
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)itemPtrName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setItemPtrName:(id)a3
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