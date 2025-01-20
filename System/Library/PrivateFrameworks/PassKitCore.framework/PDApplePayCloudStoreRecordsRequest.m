@interface PDApplePayCloudStoreRecordsRequest
- (NSSet)transactionSourceIdentifiers;
- (id)description;
- (void)setTransactionSourceIdentifiers:(id)a3;
@end

@implementation PDApplePayCloudStoreRecordsRequest

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = -[PDCloudStoreRecordsRequest requestType](self, "requestType");
  if (v5 - 1 > 7) {
    v6 = @"token";
  }
  else {
    v6 = *(&off_100652218 + v5 - 1);
  }
  [v4 appendFormat:@"type: '%@'; ", v6];
  if (-[PDCloudStoreRecordsRequest useLastChangeToken](self, "useLastChangeToken")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 appendFormat:@"use last token: '%@'; ", v7];
  if (-[PDCloudStoreRecordsRequest shouldSaveToken](self, "shouldSaveToken")) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v4 appendFormat:@"should save token: '%@'; ", v8];
  if (-[PDCloudStoreRecordsRequest storeChangesInDatabase](self, "storeChangesInDatabase")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v4 appendFormat:@"store changes: '%@'; ", v9];
  if (-[PDCloudStoreRecordsRequest returnRecords](self, "returnRecords")) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v4 appendFormat:@"return records: '%@'; ", v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest groupName](self, "groupName"));
  [v4 appendFormat:@"group name: '%@'; ", v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest groupNameSuffix](self, "groupNameSuffix"));
  [v4 appendFormat:@"group name suffix: '%@'; ", v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest ckQuery](self, "ckQuery"));
  [v4 appendFormat:@"ckQuery: '%@'; ", v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
  [v4 appendFormat:@"zoneName: '%@'; ", v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 containerName]);
  [v4 appendFormat:@"containerName: '%@'; ", v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreRecordsRequest transactionSourceIdentifiers]( self,  "transactionSourceIdentifiers"));
  [v4 appendFormat:@"transactionSourceIdentifiers: '%@'; ", v18];

  if (-[PDCloudStoreRecordsRequest ignoreExistingRecordHash](self, "ignoreExistingRecordHash"))
  {
    if (-[PDCloudStoreRecordsRequest ignoreExistingRecordHash](self, "ignoreExistingRecordHash")) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    [v4 appendFormat:@"ignoreExistingRecordHash: '%@'; ", v19];
  }

  [v4 appendString:@">"];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));

  return v20;
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end