@interface CuttlefishCurrentItem
+ (BOOL)supportsSecureCoding;
- (CKRecord)item;
- (CuttlefishCurrentItem)initWithCoder:(id)a3;
- (CuttlefishCurrentItemSpecifier)itemPtr;
- (id)description;
- (id)init:(id)a3 item:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setItemPtr:(id)a3;
@end

@implementation CuttlefishCurrentItem

- (id)init:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CuttlefishCurrentItem;
  v9 = -[CuttlefishCurrentItem init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemPtr, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItem itemPtr](self, "itemPtr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CuttlefishCurrentItem(%@)>",  v2));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItem itemPtr](self, "itemPtr"));
  [v4 encodeObject:v5 forKey:@"itemPtr"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItem item](self, "item"));
  [v4 encodeObject:v6 forKey:@"item"];
}

- (CuttlefishCurrentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CuttlefishCurrentItem;
  v5 = -[CuttlefishCurrentItem init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(CKRecord) forKey:@"item"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    item = v5->_item;
    v5->_item = (CKRecord *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(CuttlefishCurrentItemSpecifier) forKey:@"itemPtr"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    itemPtr = v5->_itemPtr;
    v5->_itemPtr = (CuttlefishCurrentItemSpecifier *)v10;
  }

  return v5;
}

- (CuttlefishCurrentItemSpecifier)itemPtr
{
  return (CuttlefishCurrentItemSpecifier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setItemPtr:(id)a3
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