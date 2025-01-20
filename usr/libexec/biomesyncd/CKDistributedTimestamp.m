@interface CKDistributedTimestamp
- (id)bm_description;
@end

@implementation CKDistributedTimestamp

- (id)bm_description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDistributedTimestamp siteIdentifierObject](self, "siteIdentifierObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  id v5 = [v4 bytes];
  v6 = objc_alloc(&OBJC_CLASS___NSString);
  if (v5) {
    v7 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"%.8s:%lu",  [v4 bytes],  -[CKDistributedTimestamp clockValue](self, "clockValue"));
  }
  else {
    v7 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"(null):%lu",  -[CKDistributedTimestamp clockValue](self, "clockValue"),  v10);
  }
  v8 = v7;

  return v8;
}

@end