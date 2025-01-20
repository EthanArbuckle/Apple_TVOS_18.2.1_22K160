@interface CKShare
- (AMSDCloudDataRecordIdentifier)identifier;
- (NSString)hashedDescription;
@end

@implementation CKShare

- (AMSDCloudDataRecordIdentifier)identifier
{
  return (AMSDCloudDataRecordIdentifier *)-[CKShare recordID](self, "recordID");
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKShare identifier](self, "identifier"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@",  v3,  self,  v6));

  return (NSString *)v7;
}

@end