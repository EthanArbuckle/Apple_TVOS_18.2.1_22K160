@interface CKKSCurrentItemData
- (CKKSCurrentItemData)initWithUUID:(id)a3;
- (NSDate)modificationDate;
- (NSString)uuid;
- (id)description;
- (void)setModificationDate:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CKKSCurrentItemData

- (CKKSCurrentItemData)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemData;
  v5 = -[CKKSCurrentItemData init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[CKKSCurrentItemData setUuid:](v5, "setUuid:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemData uuid](self, "uuid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemData modificationDate](self, "modificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKKSCurrentItemData(%@, mtime: %@)",  v3,  v4));

  return v5;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setModificationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end