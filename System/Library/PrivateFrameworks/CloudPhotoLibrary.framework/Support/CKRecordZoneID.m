@interface CKRecordZoneID
- (CKRecordZoneID)initWithCPLArchiver:(id)a3;
- (CKRecordZoneID)initWithCPLScopeIdentifier:(id)a3;
- (id)cpl_zoneName;
- (id)plistArchiveWithCPLArchiver:(id)a3;
@end

@implementation CKRecordZoneID

- (id)cpl_zoneName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
  if (v3 && ![v3 isEqualToString:CKCurrentUserDefaultName]) {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[CPLScopedIdentifier descriptionWithScopeIdentifier:identifier:]( &OBJC_CLASS___CPLScopedIdentifier,  "descriptionWithScopeIdentifier:identifier:",  v3,  v4));
  }
  else {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (CKRecordZoneID)initWithCPLScopeIdentifier:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopedIdentifier scopedIdentifierWithString:includeScopeIndex:defaultScopeIdentifier:]( &OBJC_CLASS___CPLScopedIdentifier,  "scopedIdentifierWithString:includeScopeIndex:defaultScopeIdentifier:",  a3,  0LL,  CKCurrentUserDefaultName));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  v7 = -[CKRecordZoneID initWithZoneName:ownerName:](self, "initWithZoneName:ownerName:", v5, v6);

  return v7;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 archiveCursor]);
  [v4 setArchiveCursor:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
  [v4 encodeObject:v7 forKey:@"zoneName"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
  if (-[CKRecordZoneID databaseScope](self, "databaseScope"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKRecordZoneID databaseScope](self, "databaseScope")));
    [v4 encodeObject:v9 forKey:@"databaseScope"];
  }

  [v4 setArchiveCursor:v6];

  return v5;
}

- (CKRecordZoneID)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"zoneName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ownerName"];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  v10 = CKCurrentUserDefaultName;
  if (v8) {
    v10 = (NSString *)v8;
  }
  v11 = v10;

  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"databaseScope"];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13 && [v13 integerValue]) {
    v14 = -[CKRecordZoneID initWithZoneName:ownerName:databaseScope:]( self,  "initWithZoneName:ownerName:databaseScope:",  v6,  v11,  [v13 integerValue]);
  }
  else {
    v14 = -[CKRecordZoneID initWithZoneName:ownerName:](self, "initWithZoneName:ownerName:", v6, v11);
  }
  v15 = v14;

  return v15;
}

@end