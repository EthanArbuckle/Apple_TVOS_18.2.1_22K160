@interface CKRecordID
- (CKRecordID)initWithCPLArchiver:(id)a3;
- (id)cplFullDescription;
- (id)cpl_scopedIdentifierWithScopeIdentifier:(id)a3;
- (id)plistArchiveWithCPLArchiver:(id)a3;
@end

@implementation CKRecordID

- (id)cplFullDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cpl_zoneName"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@#%@", v4, v6);

  return v7;
}

- (id)cpl_scopedIdentifierWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  v6 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:",  v4,  v5);

  return v6;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 archiveCursor]);
  [v4 setArchiveCursor:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ownerName]);
  [v8 databaseScope];
  id v11 = v9;
  id v12 = v10;
  if ([v7 isEqualToString:CKCurrentUserDefaultName]
    && ([v11 isEqualToString:CKRecordZoneDefaultName] & 1) != 0)
  {
    unsigned __int8 v13 = [v12 isEqualToString:CKCurrentUserDefaultName];

    if ((v13 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  [v4 encodeObject:v14 forKey:@"recordName"];

  id v15 = v12;
  if ([v11 isEqualToString:CPLPrimaryScopeIdentifier])
  {
    unsigned __int8 v16 = [v15 isEqualToString:CKCurrentUserDefaultName];

    if ((v16 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  [v4 encodeObject:v17 forKey:@"zoneID"];

LABEL_11:
  [v4 setArchiveCursor:v6];

  return v5;
}

- (CKRecordID)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"recordName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(CKRecordZoneID) forKey:@"zoneID"];
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (!v8)
    {
      if (qword_1002964F0 != -1) {
        dispatch_once(&qword_1002964F0, &stru_100241D80);
      }
      id v8 = (id)qword_1002964E8;
    }

    v9 = -[CKRecordID initWithRecordName:zoneID:](self, "initWithRecordName:zoneID:", v6, v8);
  }

  else
  {
    v9 = -[CKRecordID initWithRecordName:](self, "initWithRecordName:", CKCurrentUserDefaultName);
  }

  return v9;
}

@end