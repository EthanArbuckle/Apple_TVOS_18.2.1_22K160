@interface BMDistributedSyncManager
- (BMDistributedSyncManager)initWithStreamConfiguration:(id)a3 streamCRDT:(id)a4 database:(id)a5 localSiteIdentifier:(id)a6 changeReporter:(id)a7;
- (BMStreamCKCRDT)streamCRDT;
- (BMStreamConfiguration)streamConfiguration;
- (BMSyncDatabase)db;
- (NSString)localSiteIdentifier;
- (id)atomBatchesForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6;
- (id)clockVector;
- (id)deletedLocations;
- (id)rangeClockVector;
- (void)mergeAtomBatch:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5;
- (void)updateClockVectorByUnionWithUnseenSiteIdentifiers:(id)a3;
@end

@implementation BMDistributedSyncManager

- (BMDistributedSyncManager)initWithStreamConfiguration:(id)a3 streamCRDT:(id)a4 database:(id)a5 localSiteIdentifier:(id)a6 changeReporter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___BMDistributedSyncManager;
  v18 = -[BMDistributedSyncManager init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamConfiguration, a3);
    objc_storeStrong((id *)&v19->_streamCRDT, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    v20 = (NSString *)[v16 copy];
    localSiteIdentifier = v19->_localSiteIdentifier;
    v19->_localSiteIdentifier = v20;

    objc_storeStrong((id *)&v19->_changeReporter, a7);
  }

  return v19;
}

- (void)updateClockVectorByUnionWithUnseenSiteIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v7 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_localSiteIdentifier, "dataUsingEncoding:", 4LL));
  id v9 = [v7 initWithIdentifier:v8];

  v31 = v9;
  -[NSMutableSet addObject:](v5, "addObject:", v9);
  db = self->_db;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncIdentifier](self->_streamConfiguration, "syncIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase CKAtomRowSiteIdentifiersForStreamIdentifier:]( db,  "CKAtomRowSiteIdentifiersForStreamIdentifier:",  v11));

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v17);
        id v19 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dataUsingEncoding:4]);
        id v21 = [v19 initWithIdentifier:v20];
        -[NSMutableSet addObject:](v5, "addObject:", v21);

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v15);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 allSiteIdentifiers]);
  -[NSMutableSet unionSet:](v6, "unionSet:", v22);

  -[NSMutableSet minusSet:](v5, "minusSet:", v6);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  objc_super v23 = v5;
  id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v27);
        id v29 = sub_100005454(0LL);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        [v4 addClockValuesInIndexSet:v30 forSiteIdentifier:v28];

        v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
    }

    while (v25);
  }
}

- (id)clockVector
{
  return -[BMStreamCKCRDT clockVector](self->_streamCRDT, "clockVector");
}

- (id)rangeClockVector
{
  return -[BMStreamCKCRDT rangeClockVector](self->_streamCRDT, "rangeClockVector");
}

- (void)mergeAtomBatch:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  uint64_t v10 = __biome_log_for_category(11LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "mergeAtomBatches: %lu deletedLocations: %@",  buf,  0x16u);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        id v17 = objc_autoreleasePoolPush();
        -[BMStreamCKCRDT handleDeletedLocation:deleteCKRecord:]( self->_streamCRDT,  "handleDeletedLocation:deleteCKRecord:",  v16,  0LL);
        changeReporter = self->_changeReporter;
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 streamName]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v16 siteIdentifier]);
        -[BMSyncChangeReporter streamUpdatedForStreamName:deviceIdentifier:error:]( changeReporter,  "streamUpdatedForStreamName:deviceIdentifier:error:",  v19,  v20,  0LL);

        objc_autoreleasePoolPop(v17);
      }

      id v13 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    }

    while (v13);
  }

  uint64_t v21 = __biome_log_for_category(11LL);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamIdentifier](self->_streamConfiguration, "streamIdentifier"));
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Merging atom batches into %@", buf, 0xCu);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v39 = v8;
  id v24 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v44;
    v27 = &BMDevicePlatformFromModelString_ptr;
    do
    {
      uint64_t v28 = 0LL;
      do
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v39);
        }
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)v28);
        v30 = objc_autoreleasePoolPush();
        id v31 = objc_alloc((Class)v27[48]);
        id v42 = 0LL;
        id v32 = [v31 initWithData:v29 error:&v42];
        id v33 = v42;
        if (v33) {
          BOOL v34 = 1;
        }
        else {
          BOOL v34 = v32 == 0LL;
        }
        if (v34)
        {
          uint64_t v35 = __biome_log_for_category(11LL);
          __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000LL;
          char v52 = 16;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10002CE24;
          block[3] = &unk_100068AD8;
          block[4] = buf;
          if (qword_10007C378 != -1) {
            dispatch_once(&qword_10007C378, block);
          }
          os_log_type_t v37 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
          _Block_object_dispose(buf, 8);
          if (os_log_type_enabled(v36, v37))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v29;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to instantiate CKAtomBatch, %@, %@", buf, 0x16u);
          }

          v27 = &BMDevicePlatformFromModelString_ptr;
        }

        else
        {
          -[BMStreamCKCRDT mergeAtomBatch:sessionContext:]( self->_streamCRDT,  "mergeAtomBatch:sessionContext:",  v32,  v38);
        }

        objc_autoreleasePoolPop(v30);
        uint64_t v28 = (char *)v28 + 1;
      }

      while (v25 != v28);
      id v25 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }

    while (v25);
  }
}

- (id)atomBatchesForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6
{
  uint64_t v6 = a4;
  id v9 = a5;
  id v10 = a3;
  -[BMDistributedSyncManager updateClockVectorByUnionWithUnseenSiteIdentifiers:]( self,  "updateClockVectorByUnionWithUnseenSiteIdentifiers:",  v10);
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  streamCRDT = self->_streamCRDT;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002CF24;
  v16[3] = &unk_100069888;
  id v17 = v11;
  id v13 = v11;
  -[BMStreamCKCRDT atomsForChangesSinceClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:]( streamCRDT,  "atomsForChangesSinceClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:",  v10,  v6,  v9,  2LL,  v16);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v13));
  return v14;
}

- (id)deletedLocations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncIdentifier](self->_streamConfiguration, "syncIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase highestDeletedLocationsForStream:](self->_db, "highestDeletedLocationsForStream:", v3));

  return v4;
}

- (NSString)localSiteIdentifier
{
  return self->_localSiteIdentifier;
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
}

@end