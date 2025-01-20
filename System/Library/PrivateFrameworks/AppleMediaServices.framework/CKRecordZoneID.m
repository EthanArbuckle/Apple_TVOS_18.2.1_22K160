@interface CKRecordZoneID
- (NSString)hashedDescription;
@end

@implementation CKRecordZoneID

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
  uint64_t v8 = AMSHashIfNeeded(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p name = %@ | owner = %@>",  v3,  self,  v6,  v9));

  return (NSString *)v10;
}

@end