@interface CKRecordID
- (id)syd_shortDescription;
@end

@implementation CKRecordID

- (id)syd_shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKRecordID recordName=%@ zone=%@>",  v3,  v5));

  return v6;
}

@end