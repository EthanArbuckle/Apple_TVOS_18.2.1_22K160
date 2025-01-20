@interface SHMediaLibraryItemMapper
+ (id)libraryGroupFromShazamLibraryGroup:(id)a3;
+ (id)libraryTrackFromShazamLibraryTrack:(id)a3;
+ (id)shazamLibraryGroupFromLibraryGroup:(id)a3;
+ (id)shazamLibraryTrackFromLibraryTrack:(id)a3;
@end

@implementation SHMediaLibraryItemMapper

+ (id)shazamLibraryTrackFromLibraryTrack:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedSystemData]);
    v8 = -[SHLLibraryItemMetadata initWithEncodedSystemData:](v5, "initWithEncodedSystemData:", v7);

    v9 = objc_alloc(&OBJC_CLASS___SHLMutableLibraryTrack);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v11 = -[SHLLibraryTrack initWithIdentifier:metadata:](v9, "initWithIdentifier:metadata:", v10, v8);
  }

  else
  {
    v12 = objc_alloc(&OBJC_CLASS___SHLMutableLibraryTrack);
    v8 = (SHLLibraryItemMetadata *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v11 = -[SHLLibraryTrack initWithIdentifier:](v12, "initWithIdentifier:", v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 shazamKey]);
  if (!v13)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A valid Shazam track requires a ShazamID. Library item (%@) is missing a ShazamID.",  v37));
    id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v38,  0LL));

    objc_exception_throw(v39);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 shazamKey]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 validatedKey]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SHLShazamKey keyWithValue:](&OBJC_CLASS___SHLShazamKey, "keyWithValue:", v15));
  -[SHLLibraryTrack setShazamKey:](v11, "setShazamKey:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 recognitionIdentifier]);
  -[SHLLibraryTrack setRecognitionIdentifier:](v11, "setRecognitionIdentifier:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);
  -[SHLLibraryTrack setDate:](v11, "setDate:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  -[SHLLibraryTrack setTitle:](v11, "setTitle:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitle]);
  -[SHLLibraryTrack setSubtitle:](v11, "setSubtitle:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 providerIdentifier]);
  -[SHLLibraryTrack setProviderIdentifier:](v11, "setProviderIdentifier:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 providerName]);
  -[SHLLibraryTrack setProviderName:](v11, "setProviderName:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedGroupIdentifier]);
  -[SHLLibraryTrack setAssociatedGroupIdentifier:](v11, "setAssociatedGroupIdentifier:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 location]);
  -[SHLLibraryTrack setLocation:](v11, "setLocation:", v24);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 labels]);
  id v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      v29 = 0LL;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v29);
        v31 = objc_alloc(&OBJC_CLASS___SHLLibraryLabel);
        uint64_t v32 = objc_claimAutoreleasedReturnValue([v30 name]);
        v33 = -[SHLLibraryLabel initWithName:](v31, "initWithName:", v32);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labels](v11, "labels"));
        LOBYTE(v32) = [v34 containsObject:v33];

        if ((v32 & 1) == 0) {
          -[SHLLibraryTrack addLabel:](v11, "addLabel:", v33);
        }

        v29 = (char *)v29 + 1;
      }

      while (v27 != v29);
      id v27 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v27);
  }

  id v35 = -[SHLMutableLibraryTrack copy](v11, "copy");
  return v35;
}

+ (id)libraryTrackFromShazamLibraryTrack:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 metadata]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHMediaLibraryItemMetadata);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedSystemData]);
    id v4 = [v5 initWithEncodedSystemData:v7];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 labels]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "labels", 0));
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v14);
        id v16 = objc_alloc(&OBJC_CLASS___SHMediaLibraryLabel);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
        id v18 = [v16 initWithName:v17];

        [v9 addObject:v18];
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v12);
  }

  v19 = objc_alloc(&OBJC_CLASS___SHMediaLibraryTrack);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v21 = [v9 copy];
  id v22 = -[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:]( v19,  "_initWithIdentifier:metadata:labels:",  v20,  v4,  v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 shazamKey]);
  if (v23)
  {
    id v24 = objc_alloc(&OBJC_CLASS___SHShazamKey);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v3 shazamKey]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 validatedKey]);
    id v27 = [v24 initWithKey:v26];
    [v22 setShazamKey:v27];
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v3 providerIdentifier]);
  [v22 setProviderIdentifier:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 providerName]);
  [v22 setProviderName:v29];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
  [v22 setCreationDate:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 recognitionIdentifier]);
  [v22 setRecognitionIdentifier:v31];

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  [v22 setTitle:v32];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitle]);
  [v22 setSubtitle:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedGroupIdentifier]);
  [v22 setAssociatedGroupIdentifier:v34];

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v3 location]);
  [v22 setLocation:v35];

  return v22;
}

+ (id)shazamLibraryGroupFromLibraryGroup:(id)a3
{
  id v4 = a3;
  id v5 = (SHLLibraryItemMetadata *)objc_claimAutoreleasedReturnValue([v4 metadata]);

  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedSystemData]);
    id v5 = -[SHLLibraryItemMetadata initWithEncodedSystemData:](v6, "initWithEncodedSystemData:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToSave]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracksToSave", 0));
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 shazamLibraryTrackFromLibraryTrack:*(void *)(*((void *)&v22 + 1) + 8 * (void)v15)]);
        [v10 addObject:v16];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  v17 = objc_alloc(&OBJC_CLASS___SHLLibraryGroup);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v19 = [v10 copy];
  id v20 = -[SHLLibraryGroup _initWithIdentifier:metadata:tracksToSave:]( v17,  "_initWithIdentifier:metadata:tracksToSave:",  v18,  v5,  v19);

  return v20;
}

+ (id)libraryGroupFromShazamLibraryGroup:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 metadata]);

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___SHMediaLibraryItemMetadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedSystemData]);
    id v5 = [v6 initWithEncodedSystemData:v8];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToSave]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracksToSave", 0));
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 libraryTrackFromShazamLibraryTrack:*(void *)(*((void *)&v22 + 1) + 8 * (void)v15)]);
        [v10 addObject:v16];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  v17 = objc_alloc(&OBJC_CLASS___SHMediaLibraryGroup);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v19 = [v10 copy];
  id v20 = -[SHMediaLibraryGroup _initWithIdentifier:metadata:tracksToSave:]( v17,  "_initWithIdentifier:metadata:tracksToSave:",  v18,  v5,  v19);

  return v20;
}

@end