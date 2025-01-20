@interface CKRecordID
- (NSString)hashedDescription;
- (NSString)name;
@end

@implementation CKRecordID

- (NSString)name
{
  return -[CKRecordID recordName](self, "recordName");
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID name](self, "name"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneIdentifier](self, "zoneIdentifier"));
  uint64_t v8 = AMSHashIfNeeded(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p name = %@ | zoneIdentifier = %@",  v3,  self,  v6,  v9));

  return (NSString *)v10;
}

@end