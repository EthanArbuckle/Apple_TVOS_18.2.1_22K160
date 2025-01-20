@interface CPLPlaceholderRecord
- (CPLPlaceholderRecord)initWithCKRecord:(id)a3 scopedIdentifier:(id)a4;
- (id)allRelatedCKRecordsInZoneID:(id)a3 identifier:(id)a4;
@end

@implementation CPLPlaceholderRecord

- (CPLPlaceholderRecord)initWithCKRecord:(id)a3 scopedIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  id v9 = CPLRecordChangeClassForCKRecordType(v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ckPropertyForRelatedIdentifier]);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v10]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___CKReference);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 recordName]);

        v11 = (void *)v14;
        goto LABEL_7;
      }

      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
      {
LABEL_7:
        if (v11) {
          id v17 = [v9 relatedRecordClass];
        }
        else {
          id v17 = 0LL;
        }
        goto LABEL_12;
      }
    }

    id v17 = 0LL;
    v11 = 0LL;
LABEL_12:
    self =  -[CPLPlaceholderRecord initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:]( self,  "initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:",  v9,  v7,  v17,  v11);

    v15 = self;
    goto LABEL_13;
  }

  v15 = 0LL;
LABEL_13:

  return v15;
}

- (id)allRelatedCKRecordsInZoneID:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CPLPlaceholderRecord recordClass](self, "recordClass");
  id v9 = CKRecordTypeForCPLRecordChangeClass((uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    v11 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v7,  v6);
    uint64_t v12 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v10,  v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPlaceholderRecord relatedIdentifier](self, "relatedIdentifier"));
    if (!v13) {
      goto LABEL_6;
    }
    id v14 = CKRecordTypeForCPLRecordChangeClass((uint64_t)-[CPLPlaceholderRecord relatedRecordClass]( self,  "relatedRecordClass"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    if (!v15) {
      goto LABEL_6;
    }
    uint64_t v16 = (void *)v15;
    id v17 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v13,  v6);
    v18 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v16,  v17);
    [v8 setRelatedValueOnRecord:v12 fromRelatedRecord:v18];

    if (v18)
    {
      v22[0] = v12;
      v22[1] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
    }

    else
    {
LABEL_6:
      v21 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    }
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

@end