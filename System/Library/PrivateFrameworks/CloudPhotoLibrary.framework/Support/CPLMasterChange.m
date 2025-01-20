@interface CPLMasterChange
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3;
- (id)dropExpungedResources:(id)a3 withExpungeableResourceStates:(id)a4;
- (id)expungeableResourceStatesFromCKRecord:(id)a3;
- (void)addExpungeableResourceStateToCKRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLMasterChange

- (void)addExpungeableResourceStateToCKRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange expungeableResourceStates](self, "expungeableResourceStates"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v11 = sub_1000896D4((uint64_t)CPLCloudKitResourceKeys, (uint64_t)[v10 resourceType]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12
          && +[CPLResource resourceTypeSupportsResourceExpunge:]( CPLResource,  "resourceTypeSupportsResourceExpunge:",  [v10 resourceType]))
        {
          if ([v10 expungedState])
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 expungedState]));
            uint64_t v14 = sub_100089C1C((uint64_t)v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            [v4 setObject:v13 forKey:v15];
          }

          else
          {
            uint64_t v16 = sub_100089C1C((uint64_t)v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
            [v4 setObject:0 forKey:v13];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }
}

- (id)expungeableResourceStatesFromCKRecord:(id)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_10009ADC8;
  v13 = sub_10009ADD8;
  id v14 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009ADE0;
  v6[3] = &unk_1002421D0;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  uint64_t v8 = &v9;
  +[CPLResource enumerateResourceTypesWithBlock:](&OBJC_CLASS___CPLResource, "enumerateResourceTypesWithBlock:", v6);
  id v4 = [(id)v10[5] copy];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)dropExpungedResources:(id)a3 withExpungeableResourceStates:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  __int128 v20 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v5;
  id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v8 = v23;
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          while (2)
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
              id v14 = [v13 resourceType];
              if (v14 == [v7 resourceType])
              {
                if ([v13 expungedState] == (id)2
                  || (v15 = (void *)objc_claimAutoreleasedReturnValue([v13 expungedDate]),
                      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
                      id v17 = [v15 compare:v16],
                      v16,
                      v15,
                      v17 == (id)-1LL))
                {

                  goto LABEL_18;
                }
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        -[NSMutableArray addObject:](v20, "addObject:", v7);
LABEL_18:
        ;
      }

      id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v24);
  }

  id v18 = -[NSMutableArray copy](v20, "copy");
  return v18;
}

- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3
{
  return (a3 < 0x19) & (0x1C60702u >> a3);
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"itemType"]);
  -[CPLMasterChange setItemType:](v4, "setItemType:", v6);

  id v7 = objc_msgSend( v5,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"filenameEnc",  objc_opt_class(NSString));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CPLMasterChange setFilename:](v4, "setFilename:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"originalCreationDate"]);
  -[CPLMasterChange setCreationDate:](v4, "setCreationDate:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"importDate"]);
  -[CPLMasterChange setImportDate:](v4, "setImportDate:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"importGroupId"]);
  -[CPLMasterChange setImportGroupIdentifier:](v4, "setImportGroupIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"mediaMetaDataType"]);
  -[CPLMasterChange setMediaMetaDataType:](v4, "setMediaMetaDataType:", v12);

  id v13 = objc_msgSend( v5,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"mediaMetaDataEnc",  objc_opt_class(NSData));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[CPLMasterChange setMediaMetaData:](v4, "setMediaMetaData:", v14);

  id v15 = objc_msgSend( v5,  "cpl_objectForKey:validateClass:",  @"originalOrientation",  objc_opt_class(NSNumber));
  uint64_t v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v16;
  if (!v16) {
    uint64_t v16 = &off_10025A1A0;
  }
  -[CPLMasterChange setOriginalOrientation:](v4, "setOriginalOrientation:", [v16 integerValue]);

  id v18 = objc_msgSend( v5,  "cpl_objectForKey:validateClass:",  @"fullSizeJPEGSource",  objc_opt_class(NSNumber));
  __int128 v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v18);
  __int128 v20 = v19;
  if (!v19) {
    __int128 v19 = &off_10025A1A0;
  }
  -[CPLMasterChange setFullSizeJPEGSource:](v4, "setFullSizeJPEGSource:", [v19 unsignedIntegerValue]);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"originatingFingerprint"]);
  -[CPLMasterChange setOriginatingFingerprint:](v4, "setOriginatingFingerprint:", v21);

  id v22 = objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"importedBy", objc_opt_class(NSNumber));
  id v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v22);
  id v24 = v23;
  if (!v23) {
    id v23 = &off_10025A1A0;
  }
  -[CPLMasterChange setImportedBy:](v4, "setImportedBy:", (__int16)[v23 integerValue]);

  id v25 = objc_msgSend( v5,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"importedByBundleIdentifierEnc",  objc_opt_class(NSString));
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[CPLMasterChange setImportedByBundleIdentifier:](v4, "setImportedByBundleIdentifier:", v26);

  id v27 = objc_msgSend( v5,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"importedByDisplayNameEnc",  objc_opt_class(NSString));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[CPLMasterChange setImportedByDisplayName:](v4, "setImportedByDisplayName:", v28);

  id v29 = objc_msgSend( v5,  "cpl_objectForKey:validateClass:",  @"videoFrameRate",  objc_opt_class(NSNumber));
  __int128 v30 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v29);
  __int128 v31 = v30;
  if (!v30) {
    __int128 v30 = &off_10025A1A0;
  }
  -[CPLMasterChange setVideoFrameRate:]( v4,  "setVideoFrameRate:",  (__int16)[v30 integerValue]);

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"codec"]);
  -[CPLMasterChange setCodec:](v4, "setCodec:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue( -[CPLMasterChange expungeableResourceStatesFromCKRecord:]( v4,  "expungeableResourceStatesFromCKRecord:",  v5));
  -[CPLMasterChange setExpungeableResourceStates:](v4, "setExpungeableResourceStates:", v33);

  id v36 = (id)objc_claimAutoreleasedReturnValue(-[CPLMasterChange resources](v4, "resources"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange expungeableResourceStates](v4, "expungeableResourceStates"));
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[CPLMasterChange dropExpungedResources:withExpungeableResourceStates:]( v4,  "dropExpungedResources:withExpungeableResourceStates:",  v36,  v34));
  -[CPLMasterChange setResources:](v4, "setResources:", v35);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  id v7 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerprintContext]);
  if (-[CPLMasterChange hasChangeType:](v7, "hasChangeType:", 2LL))
  {
    if ((-[CPLMasterChange isFullRecord](v7, "isFullRecord") & 1) != 0)
    {
      id v9 = 0LL;
    }

    else
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[CPLMasterChange attachedDiffTracker](v7, "attachedDiffTracker"));

      if (v9)
      {
        if ((-[CPLMasterChange isFullRecord](v7, "isFullRecord") & 1) == 0
          && ![v9 areObjectsDifferentOnProperty:@"itemType" changeType:2])
        {
          goto LABEL_12;
        }

        char v10 = 0;
LABEL_9:
        if (-[CPLMasterChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"itemType"))
          && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange itemType](v7, "itemType")),
              v11,
              v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange itemType](v7, "itemType"));
          [v44 setObject:v12 forKey:@"itemType"];

          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CPLMasterChange dataClassType](v7, "dataClassType")));
          [v44 setObject:v13 forKey:@"dataClassType"];

          if ((v10 & 1) == 0) {
            goto LABEL_12;
          }
        }

        else if ((v10 & 1) == 0)
        {
LABEL_12:
          if ((-[CPLMasterChange isFullRecord](v7, "isFullRecord") & 1) == 0
            && ![v9 areObjectsDifferentOnProperty:@"filename" changeType:2])
          {
            goto LABEL_20;
          }

          char v14 = 0;
LABEL_17:
          if (-[CPLMasterChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"filename"))
            && (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange filename](v7, "filename")),
                id v16 = [v15 length],
                v15,
                v16))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange filename](v7, "filename"));
            [v44 setLegacyEncryptedObject:v17 forKey:@"filenameEnc"];

            if ((v14 & 1) == 0) {
              goto LABEL_20;
            }
          }

          else if ((v14 & 1) == 0)
          {
LABEL_20:
            if ((-[CPLMasterChange isFullRecord](v7, "isFullRecord") & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"creationDate" changeType:2])
            {
              goto LABEL_29;
            }

            char v18 = 0;
LABEL_25:
            if (-[CPLMasterChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"creationDate")))
            {
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMasterChange creationDate](v7, "creationDate"));
              [v44 setObject:v19 forKey:@"originalCreationDate"];

              if ((v18 & 1) != 0)
              {
LABEL_27:
                char v20 = 1;
                goto LABEL_32;
              }
            }

            else if ((v18 & 1) != 0)
            {
              goto LABEL_27;
            }

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 0;
}

@end