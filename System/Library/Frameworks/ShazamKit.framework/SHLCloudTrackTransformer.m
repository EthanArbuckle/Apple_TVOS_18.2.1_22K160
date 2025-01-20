@interface SHLCloudTrackTransformer
+ (id)baseCloudRecordFromTrack:(id)a3 usingEncryption:(BOOL)a4;
+ (id)cloudBackedItemFromLibraryTrack:(id)a3 usingEncryption:(BOOL)a4;
+ (id)libraryTrackFromCloudBackedItem:(id)a3 usingEncryption:(BOOL)a4;
@end

@implementation SHLCloudTrackTransformer

+ (id)libraryTrackFromCloudBackedItem:(id)a3 usingEncryption:(BOOL)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 record]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordType]);
  unsigned int v7 = [v6 isEqualToString:@"Track"];

  if (v7)
  {
    if (a4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"RecognitionIdentifier"]);

      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ShazamKey"]);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"RecognitionIdentifier"]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ShazamKey"]);
    }

    v13 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    [v5 encodeSystemFieldsWithCoder:v13];
    v14 = objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v13, "encodedData"));
    v16 = -[SHLLibraryItemMetadata initWithEncodedSystemData:](v14, "initWithEncodedSystemData:", v15);

    if (a4)
    {
      v17 = objc_alloc(&OBJC_CLASS___SHLMutableLibraryTrack);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 recordName]);
      v20 = -[SHLLibraryTrack initWithIdentifier:metadata:](v17, "initWithIdentifier:metadata:", v19, v16);

      -[SHLLibraryTrack setRecognitionIdentifier:](v20, "setRecognitionIdentifier:", v9);
      v21 = -[SHLShazamKey initWithKey:](objc_alloc(&OBJC_CLASS___SHLShazamKey), "initWithKey:", v11);
      -[SHLLibraryTrack setShazamKey:](v20, "setShazamKey:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Date"]);
      -[SHLLibraryTrack setDate:](v20, "setDate:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"Title"]);
      -[SHLLibraryTrack setTitle:](v20, "setTitle:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"Subtitle"]);
      -[SHLLibraryTrack setSubtitle:](v20, "setSubtitle:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"ProviderIdentifier"]);
      -[SHLLibraryTrack setProviderIdentifier:](v20, "setProviderIdentifier:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"ProviderName"]);
      -[SHLLibraryTrack setProviderName:](v20, "setProviderName:", v31);

LABEL_12:
      v38 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"Location"]);
      -[SHLLibraryTrack setLocation:](v20, "setLocation:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AssociatedGroupIdentifier"]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 recordID]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 recordName]);
      -[SHLLibraryTrack setAssociatedGroupIdentifier:](v20, "setAssociatedGroupIdentifier:", v42);

      v53 = v11;
      v52 = v16;
      if (a4)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"Labels"]);
      }

      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Labels"]);
      }

      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v45 = v44;
      id v46 = [v45 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = *(void *)v55;
        do
        {
          for (i = 0LL; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v55 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = -[SHLLibraryLabel initWithName:]( objc_alloc(&OBJC_CLASS___SHLLibraryLabel),  "initWithName:",  *(void *)(*((void *)&v54 + 1) + 8LL * (void)i));
            if (-[SHLLibraryLabel type](v50, "type")) {
              -[SHLLibraryTrack addLabel:](v20, "addLabel:", v50);
            }
          }

          id v47 = [v45 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }

        while (v47);
      }

      id v12 = -[SHLMutableLibraryTrack copy](v20, "copy");
      v11 = v53;
      v16 = v52;
      goto LABEL_25;
    }

    id v12 = 0LL;
    if (v9 && v11)
    {
      v32 = -[SHLShazamKey initWithKey:](objc_alloc(&OBJC_CLASS___SHLShazamKey), "initWithKey:", v11);
      if (v32)
      {
        v33 = v32;
        v20 = -[SHLLibraryTrack initWithRecognitionIdentifier:shazamKey:metadata:]( objc_alloc(&OBJC_CLASS___SHLMutableLibraryTrack),  "initWithRecognitionIdentifier:shazamKey:metadata:",  v9,  v32,  v16);

        v34 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Date"]);
        -[SHLLibraryTrack setDate:](v20, "setDate:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Title"]);
        -[SHLLibraryTrack setTitle:](v20, "setTitle:", v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Subtitle"]);
        -[SHLLibraryTrack setSubtitle:](v20, "setSubtitle:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ProviderIdentifier"]);
        -[SHLLibraryTrack setProviderIdentifier:](v20, "setProviderIdentifier:", v37);

        v30 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ProviderName"]);
        -[SHLLibraryTrack setProviderName:](v20, "setProviderName:", v30);
        goto LABEL_12;
      }

      id v12 = 0LL;
    }

+ (id)cloudBackedItemFromLibraryTrack:(id)a3 usingEncryption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([a1 baseCloudRecordFromTrack:v6 usingEncryption:v4]);
  if (v7)
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recognitionIdentifier]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 shazamKey]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 validatedKey]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v11 setObject:v8 forKeyedSubscript:@"RecognitionIdentifier"];

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v12 setObject:v10 forKeyedSubscript:@"ShazamKey"];

      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v14 setObject:v13 forKeyedSubscript:@"Date"];

      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 providerIdentifier]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v16 setObject:v15 forKeyedSubscript:@"ProviderIdentifier"];

      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 providerName]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v18 setObject:v17 forKeyedSubscript:@"ProviderName"];

      v19 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v20 setObject:v19 forKeyedSubscript:@"Title"];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 subtitle]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v22 setObject:v21 forKeyedSubscript:@"Subtitle"];
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v6 compoundIdentifier]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v24 recognitionIdentifier]);

      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 compoundIdentifier]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 shazamKey]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v26 validatedKey]);

      [v7 setObject:v8 forKeyedSubscript:@"RecognitionIdentifier"];
      [v7 setObject:v10 forKeyedSubscript:@"ShazamKey"];
      v27 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
      [v7 setObject:v27 forKeyedSubscript:@"Date"];

      v28 = (void *)objc_claimAutoreleasedReturnValue([v6 providerIdentifier]);
      [v7 setObject:v28 forKeyedSubscript:@"ProviderIdentifier"];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v6 providerName]);
      [v7 setObject:v29 forKeyedSubscript:@"ProviderName"];

      v30 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      [v7 setObject:v30 forKeyedSubscript:@"Title"];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 subtitle]);
      [v7 setObject:v21 forKeyedSubscript:@"Subtitle"];
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 labels]);
    id v32 = [v31 count];

    if (v32)
    {
      v62 = v10;
      v33 = v8;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v6 labels]);
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v34 count]));

      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      v36 = (void *)objc_claimAutoreleasedReturnValue([v6 labels]);
      id v37 = [v36 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v64;
        do
        {
          for (i = 0LL; i != v38; i = (char *)i + 1)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v63 + 1) + 8 * (void)i) name]);
            [v35 addObject:v41];
          }

          id v38 = [v36 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }

        while (v38);
      }

      id v42 = [v35 copy];
      if (v4)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
        [v43 setObject:v42 forKeyedSubscript:@"Labels"];
      }

      else
      {
        [v7 setObject:v42 forKeyedSubscript:@"Labels"];
      }

      v8 = v33;

      v10 = v62;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
    [v44 coordinate];
    BOOL v45 = CLLocationCoordinate2DIsValid(v68);

    if (v45)
    {
      id v46 = (CLLocation *)objc_claimAutoreleasedReturnValue([v6 location]);
      id v47 = v46;
      if (!v4)
      {
        -[CLLocation coordinate](v46, "coordinate");
        double v49 = round(v48 * 100.0) / 100.0;

        v50 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
        [v50 coordinate];
        double v52 = round(v51 * 100.0) / 100.0;

        id v47 = -[CLLocation initWithLatitude:longitude:]( objc_alloc(&OBJC_CLASS___CLLocation),  "initWithLatitude:longitude:",  v49,  v52);
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedValues]);
      [v53 setObject:v47 forKeyedSubscript:@"Location"];
    }

    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedGroupIdentifier]);

    if (v54)
    {
      __int128 v55 = objc_alloc(&OBJC_CLASS___CKRecordID);
      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedGroupIdentifier]);
      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 zoneID]);
      v59 = -[CKRecordID initWithRecordName:zoneID:](v55, "initWithRecordName:zoneID:", v56, v58);

      v60 = -[CKReference initWithRecordID:action:]( objc_alloc(&OBJC_CLASS___CKReference),  "initWithRecordID:action:",  v59,  1LL);
      [v7 setObject:v60 forKeyedSubscript:@"AssociatedGroupIdentifier"];
    }

    v23 = -[SHLCloudBackedItem initWithRecord:](objc_alloc(&OBJC_CLASS___SHLCloudBackedItem), "initWithRecord:", v7);
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

+ (id)baseCloudRecordFromTrack:(id)a3 usingEncryption:(BOOL)a4
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedSystemData]);
    uint64_t v17 = 0LL;
    v9 = -[NSKeyedUnarchiver initForReadingFromData:error:](v6, "initForReadingFromData:error:", v8, &v17);

    v10 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v9);
    -[NSKeyedUnarchiver finishDecoding](v9, "finishDecoding");
  }

  else
  {
    v11 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 shazamLibraryZone]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
    v9 = -[CKRecordID initWithRecordName:zoneID:](v11, "initWithRecordName:zoneID:", v12, v15);

    v10 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"Track",  v9);
  }

  return v10;
}

@end