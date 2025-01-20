@interface CKRecordZone
- (BOOL)isDefaultRecordZone;
- (NSString)hashedDescription;
@end

@implementation CKRecordZone

- (BOOL)isDefaultRecordZone
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecordZone defaultRecordZone](&OBJC_CLASS___CKRecordZone, "defaultRecordZone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  return v8;
}

- (NSString)hashedDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hashedDescription]);

  return (NSString *)v3;
}

@end