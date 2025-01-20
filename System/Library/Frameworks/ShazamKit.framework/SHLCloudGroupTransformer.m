@interface SHLCloudGroupTransformer
+ (id)baseCloudRecordFromGroup:(id)a3;
+ (id)cloudBackedItemFromLibraryGroup:(id)a3;
+ (id)libraryGroupFromCloudBackedItem:(id)a3;
@end

@implementation SHLCloudGroupTransformer

+ (id)libraryGroupFromCloudBackedItem:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 record]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"Group"];

  if (v6)
  {
    v7 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 record]);
    [v8 encodeSystemFieldsWithCoder:v7];

    v9 = objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v7, "encodedData"));
    v11 = -[SHLLibraryItemMetadata initWithEncodedSystemData:](v9, "initWithEncodedSystemData:", v10);

    v12 = objc_alloc(&OBJC_CLASS___SHLLibraryGroup);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v3 record]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recordID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recordName]);
    v16 = -[SHLLibraryGroup initWithIdentifier:metadata:](v12, "initWithIdentifier:metadata:", v15, v11);
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

+ (id)cloudBackedItemFromLibraryGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 baseCloudRecordFromGroup:a3]);
  if (v3) {
    v4 = -[SHLCloudBackedItem initWithRecord:](objc_alloc(&OBJC_CLASS___SHLCloudBackedItem), "initWithRecord:", v3);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

+ (id)baseCloudRecordFromGroup:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedSystemData]);
    uint64_t v16 = 0LL;
    v8 = -[NSKeyedUnarchiver initForReadingFromData:error:](v5, "initForReadingFromData:error:", v7, &v16);

    v9 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v8);
    -[NSKeyedUnarchiver finishDecoding](v8, "finishDecoding");
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___CKRecordID);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamLibraryZone]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    v8 = -[CKRecordID initWithRecordName:zoneID:](v10, "initWithRecordName:zoneID:", v11, v14);

    v9 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"Group",  v8);
  }

  return v9;
}

@end