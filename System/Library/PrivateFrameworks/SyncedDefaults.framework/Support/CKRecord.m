@interface CKRecord
- (id)syd_shortDescription;
@end

@implementation CKRecord

- (id)syd_shortDescription
{
  if (os_variant_has_internal_content("com.apple.kvs"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord modifiedByDevice](self, "modifiedByDevice"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" modifiedBy='%@'",  v3));
  }

  else
  {
    v4 = &stru_10004DCD0;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordChangeTag](self, "recordChangeTag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKRecord type=%@ recordName=%@ zone=%@ etag=%@%@>",  v5,  v7,  v10,  v11,  v4));

  return v12;
}

@end