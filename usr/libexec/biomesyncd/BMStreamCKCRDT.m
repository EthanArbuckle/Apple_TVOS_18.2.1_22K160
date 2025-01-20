@interface BMStreamCKCRDT
- (BMStreamCKCRDT)initWithStreamConfiguration:(id)a3 locationAssignerPolicy:(id)a4 localSiteIdentifier:(id)a5 database:(id)a6 changeReporter:(id)a7 account:(id)a8;
- (BMStreamConfiguration)streamConfiguration;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)addAtomToAtomBatch:(id)a3 ifChunkerAllows:(id)a4 fromAtomTableRecord:(id)a5 atomValueData:(id)a6 version:(unsigned __int8)a7 atomValueVersion:(int64_t)a8;
- (BOOL)deleteAtOrBeforeHighestDeletedLocation:(id)a3;
- (BOOL)deleteLocationsUpToTTLAtTombstone:(id)a3 siteIdentifier:(id)a4;
- (BOOL)deletedExpiredBufferedLocationsForSiteIdentifier:(id)a3;
- (BOOL)handleDeleteAtomRow:(id)a3 usingPruner:(id)a4 outBookmark:(id *)a5 outTombstoneBookmark:(id *)a6;
- (BOOL)writeAtomValue:(id)a3 fromAtomRow:(id)a4 usingWriter:(id)a5 outBookmark:(id *)a6;
- (id)atomValueFromEvent:(id)a3 ofType:(unint64_t)a4 version:(int64_t)a5;
- (id)bookmarkForAtomRow:(id)a3;
- (id)ckAtomTableRecordForEvent:(id)a3 ofType:(unint64_t)a4 atBookmark:(id)a5 previousTableRecord:(id)a6 siteIdentifier:(id)a7;
- (id)clockVector;
- (id)newEnumeratorStartingAfterBookmark:(id)a3 reader:(id)a4;
- (id)rangeClockVector;
- (id)readerForSiteIdentifier:(id)a3;
- (id)tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:(id)a3 fromDatastore:(id)a4;
- (void)addAtomWithValueData:(id)a3 toAtomBatch:(id)a4 fromAtomTableRecord:(id)a5 version:(unsigned __int8)a6 atomValueVersion:(int64_t)a7;
- (void)atomsForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6 enumerateWithBlock:(id)a7;
- (void)handleDeletedLocation:(id)a3 deleteCKRecord:(BOOL)a4;
- (void)ingestNewChangesForSite:(id)a3 transportType:(unint64_t)a4;
- (void)ingestNewChangesFromAllSitesInVectorClock:(id)a3 transportType:(unint64_t)a4;
- (void)mergeAtomBatch:(id)a3 sessionContext:(id)a4;
- (void)mergeAtomBatches:(id)a3 sessionContext:(id)a4 forLocation:(id)a5;
- (void)populateAtomBatch:(id)a3 withAtomsInClockVector:(id)a4 forLocation:(id)a5 ckFormatVersion:(unsigned __int8)a6 valueVersion:(int64_t)a7 chunker:(id)a8;
- (void)setMetricsCollector:(id)a3;
- (void)setStreamConfiguration:(id)a3;
@end

@implementation BMStreamCKCRDT

- (BMStreamCKCRDT)initWithStreamConfiguration:(id)a3 locationAssignerPolicy:(id)a4 localSiteIdentifier:(id)a5 database:(id)a6 changeReporter:(id)a7 account:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v36 = a7;
  id v19 = a8;
  if (v15)
  {
    if (v18) {
      goto LABEL_3;
    }
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v33 handleFailureInMethod:a2, self, @"BMStreamCKCRDT.m", 55, @"Invalid parameter not satisfying: %@", @"streamConfiguration" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v34 handleFailureInMethod:a2, self, @"BMStreamCKCRDT.m", 56, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

LABEL_3:
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___BMStreamCKCRDT;
  v20 = -[BMStreamCKCRDT init](&v37, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_streamConfiguration, a3);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v15 syncIdentifier]);
    syncIdentifier = v21->_syncIdentifier;
    v21->_syncIdentifier = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v15 streamIdentifier]);
    streamIdentifier = v21->_streamIdentifier;
    v21->_streamIdentifier = (NSString *)v24;

    v26 = (NSString *)[v17 copy];
    localSiteIdentifier = v21->_localSiteIdentifier;
    v21->_localSiteIdentifier = v26;

    objc_storeStrong((id *)&v21->_db, a6);
    v28 = -[BMStreamCRDTLocationBuilder initWithAssignerPolicy:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocationBuilder),  "initWithAssignerPolicy:",  v16);
    locationBuilder = v21->_locationBuilder;
    v21->_locationBuilder = v28;

    v30 = objc_opt_new(&OBJC_CLASS___NSCache);
    locationRowCache = v21->_locationRowCache;
    v21->_locationRowCache = v30;

    objc_storeStrong((id *)&v21->_changeReporter, a7);
    objc_storeStrong((id *)&v21->_account, a8);
  }

  return v21;
}

- (id)bookmarkForAtomRow:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 segmentName]);

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 segmentName]);
    id v9 = objc_msgSend( v6,  "initWithStream:segment:iterationStartTime:offset:",  streamIdentifier,  v8,  objc_msgSend(v4, "segmentOffset"),  1.79769313e308);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)newEnumeratorStartingAfterBookmark:(id)a3 reader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v18 = 0LL;
    id v8 = [v6 newEnumeratorFromBookmark:v5 options:7 error:&v18];
    id v9 = v18;
    v10 = v9;
    if (v8)
    {
      id v11 = [v8 nextEvent];
    }

    else if (BMStorageErrorGetErrno(v9) == 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 segmentName]);
      [v7 timestampFromSegmentName:v12];
      double v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      [v15 timeIntervalSinceReferenceDate];
      id v8 = [v7 newEnumeratorFromStartTime:-1 endTime:-1 maxEvents:7 lastN:v14 options:v16];
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = [v6 newEnumeratorFromStartTime:7 options:0.0];
  }

  return v8;
}

- (id)ckAtomTableRecordForEvent:(id)a3 ofType:(unint64_t)a4 atBookmark:(id)a5 previousTableRecord:(id)a6 siteIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_localSiteIdentifier, "dataUsingEncoding:", 4LL));
  id v17 = [[CKDistributedSiteIdentifier alloc] initWithIdentifier:v16];
  id v18 = (CKDistributedTimestamp *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase latestDistributedTimestampForSiteIdentifier:inStream:]( self->_db,  "latestDistributedTimestampForSiteIdentifier:inStream:",  self->_localSiteIdentifier,  self->_syncIdentifier));
  if (!v18) {
    id v18 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( objc_alloc(&OBJC_CLASS___CKDistributedTimestamp),  "initWithSiteIdentifierObject:clockValue:",  v17,  0LL);
  }
  id v66 = v17;
  id v19 = objc_alloc(&OBJC_CLASS___CKDistributedTimestamp);
  v20 = (char *)-[CKDistributedTimestamp clockValue](v18, "clockValue") + 1;
  v21 = v19;
  uint64_t v22 = v66;
  v23 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( v21,  "initWithSiteIdentifierObject:clockValue:",  v66,  v20);
  if (a4 == 2)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:]( self->_db,  "ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:",  v13,  2LL,  self->_localSiteIdentifier,  self->_syncIdentifier));
    if (!v35)
    {
      v65 = v23;
      v41 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:]( self->_db,  "ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:",  v13,  0LL,  v15,  self->_syncIdentifier));
      if (v41)
      {
        v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v41 location]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 location]);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v44 ckMergeableValueIDWithFormatVersion:0]);

        v45 = objc_alloc(&OBJC_CLASS___CKAtomReference);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v42 timestamp]);
        v57 = -[CKAtomReference initWithMergeableValueID:timestamp:type:]( v45,  "initWithMergeableValueID:timestamp:type:",  v59,  v46,  0LL);

        v47 = objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v42 location]);
        id v63 = v12;
        v49 = (void *)objc_claimAutoreleasedReturnValue([v42 location]);
        v61 = v16;
        id v50 = v14;
        v51 = (void *)objc_claimAutoreleasedReturnValue([v13 segmentName]);
        v23 = v65;
        id v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:]( v47,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:",  v48,  v65,  v49,  v57,  2,  v51,  [v13 offset]);

        id v14 = v50;
        double v16 = v61;

        id v12 = v63;
        uint64_t v22 = v66;

        goto LABEL_15;
      }

      db = self->_db;
      v53 = (void *)objc_claimAutoreleasedReturnValue([v13 segmentName]);
      LODWORD(db) = -[BMSyncDatabase containsCKAtomRowWithSegment:inStream:]( db,  "containsCKAtomRowWithSegment:inStream:",  v53,  self->_syncIdentifier);

      if (!(_DWORD)db)
      {
        id v36 = 0LL;
        v23 = v65;
        goto LABEL_15;
      }

      uint64_t v54 = __biome_log_for_category(11LL);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      *(void *)buf = 0LL;
      v69 = buf;
      uint64_t v70 = 0x2020000000LL;
      char v71 = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100011B14;
      block[3] = &unk_100068AD8;
      block[4] = buf;
      v23 = v65;
      if (qword_10007C310 != -1) {
        dispatch_once(&qword_10007C310, block);
      }
      os_log_type_t v56 = v69[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v55, v56))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "delete must reference a corresponding append", buf, 2u);
      }

      id v36 = 0LL;
      goto LABEL_14;
    }
  }

  else if (!a4)
  {
    v60 = v16;
    locationBuilder = self->_locationBuilder;
    syncIdentifier = self->_syncIdentifier;
    [v12 timestamp];
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[BMStreamCRDTLocationBuilder locationWithStreamName:siteIdentifier:timestamp:]( locationBuilder,  "locationWithStreamName:siteIdentifier:timestamp:",  syncIdentifier,  v15));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_locationRowCache, "objectForKey:", v26));
    if (!v27)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase insertLocationIfNotExists:withState:]( self->_db,  "insertLocationIfNotExists:withState:",  v26,  2LL));
      -[NSCache setObject:forKey:](self->_locationRowCache, "setObject:forKey:", v27, v26);
    }

    id v58 = v15;
    id v62 = v12;
    v64 = v23;
    if (v14)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v14 location]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 location]);
      v30 = v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 ckMergeableValueIDWithFormatVersion:0]);

      v32 = objc_alloc(&OBJC_CLASS___CKAtomReference);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v30 timestamp]);
      v34 = -[CKAtomReference initWithMergeableValueID:timestamp:type:]( v32,  "initWithMergeableValueID:timestamp:type:",  v31,  v33,  0LL);
    }

    else
    {
      v34 = 0LL;
      v30 = 0LL;
    }

    objc_super v37 = objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v30 location]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v13 segmentName]);
    id v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:]( v37,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:",  v27,  v64,  v38,  v34,  0,  v39,  [v13 offset]);

    v23 = v64;
    double v16 = v60;
    id v12 = v62;
    id v14 = v30;
    id v15 = v58;
LABEL_14:
    uint64_t v22 = v66;
    goto LABEL_15;
  }

  id v36 = 0LL;
LABEL_15:

  return v36;
}

- (id)atomValueFromEvent:(id)a3 ofType:(unint64_t)a4 version:(int64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 frame]);
  if ([v9 state] != 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 frame]);
    unsigned int v11 = [v10 state];

    if (v11 == 2) {
      goto LABEL_5;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 frame]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 data]);

    if (v12) {
      goto LABEL_6;
    }
    uint64_t v20 = __biome_log_for_category(11LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 16;
    block = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_100011DC4;
    v28 = &unk_100068AD8;
    p___int128 buf = &buf;
    if (qword_10007C318 != -1) {
      dispatch_once(&qword_10007C318, &block);
    }
    os_log_type_t v21 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled((os_log_t)v9, v21))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 frame]);
      unsigned int v23 = [v22 state];
      if (v23 >= 6) {
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BMFrameStateUnknown(%lu)",  v23,  block,  v26,  v27,  v28,  p_buf,  (void)buf));
      }
      else {
        uint64_t v24 = off_100069178[v23];
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  v21,  "Expected no-data frame to be delete or pre-delete, but frame was %{public}@",  (uint8_t *)&buf,  0xCu);
    }
  }

LABEL_5:
  id v12 = 0LL;
LABEL_6:
  id v13 = objc_alloc(&OBJC_CLASS___BMStoreEventAtomValue);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 frame]);
  id v15 = [v14 dataVersion];
  [v8 timestamp];
  double v16 = -[BMStoreEventAtomValue initWithEventData:dataVersion:dataTimestamp:]( v13,  "initWithEventData:dataVersion:dataTimestamp:",  v12,  v15);

  id v17 = -[BMSyncAtomValue initWithAtomType:value:version:]( objc_alloc(&OBJC_CLASS___BMSyncAtomValue),  "initWithAtomType:value:version:",  a4,  v16,  a5);
  return v17;
}

- (BOOL)handleDeleteAtomRow:(id)a3 usingPruner:(id)a4 outBookmark:(id *)a5 outTombstoneBookmark:(id *)a6
{
  id v10 = a4;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([a3 causalReference]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 timestamp]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase ckAtomRowWithTimestamp:inStream:]( self->_db,  "ckAtomRowWithTimestamp:inStream:",  v12,  self->_syncIdentifier));
  if ([v13 type])
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v32 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000120B8;
    block[3] = &unk_100068AD8;
    block[4] = buf;
    if (qword_10007C320 != -1) {
      dispatch_once(&qword_10007C320, block);
    }
    os_log_type_t v16 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = [v13 type];
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "appendRecord %@ is of unexpected type %lu", buf, 0x16u);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT bookmarkForAtomRow:](self, "bookmarkForAtomRow:", v13));
  id v19 = v18;
  if (!v18
    || (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 segmentName]),
        unsigned int v21 = [v20 isEqual:@"DOA"],
        v20,
        v21))
  {
    uint64_t v22 = __biome_log_for_category(11LL);
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@",  buf,  0xCu);
    }

    if (!a5) {
      goto LABEL_19;
    }
    id v24 = 0LL;
LABEL_18:
    *a5 = v24;
LABEL_19:
    BOOL v28 = 1;
    goto LABEL_20;
  }

  uint64_t v25 = __biome_log_for_category(11LL);
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&buf[4] = v19;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
  }

  unsigned int v27 = [v10 deleteEventAtBookmark:v19 outTombstoneBookmark:a6];
  BOOL v28 = v27;
  if (a5 && v27)
  {
    id v24 = v19;
    goto LABEL_18;
  }

- (BOOL)writeAtomValue:(id)a3 fromAtomRow:(id)a4 usingWriter:(id)a5 outBookmark:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([a3 value]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 eventData]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 eventData]);
    id v14 = [v11 dataVersion];
    [v11 dataTimestamp];
    if (Current == 0.0) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    unsigned __int8 v16 = [v10 _writeEventData:v13 dataVersion:v14 timestamp:a6 outBookmark:Current];
  }

  else
  {
    uint64_t v17 = __biome_log_for_category(11LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 timestamp]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bm_description"));
      int v22 = 138412290;
      unsigned int v23 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Dropping atom %@ because it is dead on arrival",  (uint8_t *)&v22,  0xCu);
    }

    unsigned __int8 v16 = 1;
  }

  return v16;
}

- (BOOL)addAtomToAtomBatch:(id)a3 ifChunkerAllows:(id)a4 fromAtomTableRecord:(id)a5 atomValueData:(id)a6 version:(unsigned __int8)a7 atomValueVersion:(int64_t)a8
{
  uint64_t v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v15) {
    unsigned __int8 v18 = [v15 canAddAtomWithData:v17];
  }
  else {
    unsigned __int8 v18 = 1;
  }
  -[BMStreamCKCRDT addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:]( self,  "addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:",  v17,  v14,  v16,  v9,  a8);
  [v15 didAddAtomWithData:v17];

  return v18;
}

- (void)addAtomWithValueData:(id)a3 toAtomBatch:(id)a4 fromAtomTableRecord:(id)a5 version:(unsigned __int8)a6 atomValueVersion:(int64_t)a7
{
  unsigned int v8 = a6;
  unsigned int v11 = (void **)a3;
  id v12 = a4;
  id v13 = (void **)a5;
  uint64_t v14 = __biome_log_for_category(11LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100040E68();
  }

  if (v8 > 2)
  {
    uint64_t v20 = _NSConcreteStackBlock;
    id v16 = sub_1000127CC;
    id v17 = &v20;
  }

  else
  {
    unsigned int v21 = _NSConcreteStackBlock;
    id v16 = sub_100012418;
    id v17 = &v21;
  }

  v17[1] = (void **)3221225472LL;
  v17[2] = (void **)v16;
  v17[3] = (void **)&unk_100069018;
  v17[4] = v13;
  v17[5] = v11;
  v17[6] = (void **)a7;
  unsigned __int8 v18 = v11;
  id v19 = v13;
  [v12 appendAtomWithBlock:v17];
}

- (id)readerForSiteIdentifier:(id)a3
{
  id v4 = a3;
  else {
    id v5 = v4;
  }
  account = self->_account;
  streamConfiguration = self->_streamConfiguration;
  id v8 = v5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](streamConfiguration, "storeConfig"));
  id v10 = v9;
  if (account) {
    id v11 = [v9 copyWithAccount:self->_account remoteName:v8];
  }
  else {
    id v11 = [v9 copyWithRemoteName:v8];
  }
  id v12 = v11;

  id v13 = objc_alloc(&OBJC_CLASS___BMStreamDatastore);
  streamIdentifier = self->_streamIdentifier;
  id v15 = -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass");
  id v16 = [v13 initWithStream:streamIdentifier permission:0 config:v12 includeTombstones:1 eventDataClass:v15 useCase:BMUseCaseSync];

  return v16;
}

- (void)ingestNewChangesFromAllSitesInVectorClock:(id)a3 transportType:(unint64_t)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v16 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 allSiteIdentifiers]);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v10);
        id v12 = objc_autoreleasePoolPush();
        id v13 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        id v15 = -[NSString initWithData:encoding:](v13, "initWithData:encoding:", v14, 4LL);

        -[BMStreamCKCRDT ingestNewChangesForSite:transportType:]( self,  "ingestNewChangesForSite:transportType:",  v15,  a4);
        -[NSCache removeAllObjects](self->_locationRowCache, "removeAllObjects");

        objc_autoreleasePoolPop(v12);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }
}

- (id)tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:(id)a3 fromDatastore:(id)a4
{
  id v6 = a4;
  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  id v28 = 0LL;
  unsigned int v9 = -[BMSyncDatabase getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:]( db,  "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:",  a3,  syncIdentifier,  &v28,  &v29);
  id v10 = v28;
  if (v9)
  {
    id v11 = objc_alloc(&OBJC_CLASS___BMStoreBookmark);
    id v12 = [v11 initWithStream:self->_streamIdentifier segment:v10 iterationStartTime:v29 offset:1.79769313e308];
    uint64_t v13 = __biome_log_for_category(11LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (NSString *)objc_claimAutoreleasedReturnValue([v12 segmentName]);
      id v16 = [v12 offset];
      streamIdentifier = self->_streamIdentifier;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 config]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 remoteName]);
      *(_DWORD *)__int128 buf = 138413058;
      uint64_t v31 = v15;
      __int16 v32 = 2048;
      id v33 = v16;
      __int16 v34 = 2112;
      v35 = streamIdentifier;
      __int16 v36 = 2112;
      objc_super v37 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Starting tombstone enumerator from segment %@ offset %lu for stream %@ site %@",  buf,  0x2Au);
    }

    id v20 = [v6 newTombstoneEnumeratorFromBookmark:v12];
    id v21 = [v20 nextEvent];
  }

  else
  {
    uint64_t v22 = __biome_log_for_category(11LL);
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = self->_streamIdentifier;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 config]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteName]);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Starting tombstone enumerator from 0 for stream %@ site %@",  buf,  0x16u);
    }

    id v20 = [v6 newTombstoneEnumeratorFromStartTime:0.0];
  }

  return v20;
}

- (void)ingestNewChangesForSite:(id)a3 transportType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ingestChangesForSite: %@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT readerForSiteIdentifier:](self, "readerForSiteIdentifier:", v5));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000LL;
  id v62 = sub_1000134A0;
  id v63 = sub_1000134B0;
  id v64 = (id)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase latestCKAtomRowOfType:forSiteIdentifier:inStream:]( self->_db,  "latestCKAtomRowOfType:forSiteIdentifier:inStream:",  0LL,  v5,  self->_syncIdentifier));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[BMStreamCKCRDT bookmarkForAtomRow:]( self,  "bookmarkForAtomRow:",  *(void *)(*((void *)&buf + 1) + 40LL)));
  id v10 = -[BMStreamCKCRDT newEnumeratorStartingAfterBookmark:reader:]( self,  "newEnumeratorStartingAfterBookmark:reader:",  v9,  v8);

  id v11 = -[BMSyncDatabaseTransactionBatcher initWithDatabase:transcationBatchSize:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseTransactionBatcher),  "initWithDatabase:transcationBatchSize:",  self->_db,  100LL);
  uint64_t v49 = 0LL;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_1000134A0;
  v53 = sub_1000134B0;
  id v54 = (id)objc_claimAutoreleasedReturnValue([v10 nextEvent]);
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_1000134A0;
  v47 = sub_1000134B0;
  id v48 = 0LL;
  if (v50[5] && ([v5 isEqualToString:self->_localSiteIdentifier] & 1) == 0)
  {
    uint64_t v15 = __biome_log_for_category(11LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    *(void *)&__int128 v55 = 0LL;
    *((void *)&v55 + 1) = &v55;
    uint64_t v56 = 0x2020000000LL;
    LOBYTE(v57) = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000134B8;
    block[3] = &unk_100068AD8;
    block[4] = &v55;
    if (qword_10007C328 != -1) {
      dispatch_once(&qword_10007C328, block);
    }
    os_log_type_t v17 = *(_BYTE *)(*((void *)&v55 + 1) + 24LL);
    _Block_object_dispose(&v55, 8);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(v55) = 138412290;
      *(void *)((char *)&v55 + 4) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "observed new data from non-local site %@",  (uint8_t *)&v55,  0xCu);
    }
  }

  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000134CC;
    v36[3] = &unk_100069040;
    v39 = &v49;
    p___int128 buf = &buf;
    v36[4] = self;
    id v37 = v5;
    v41 = &v43;
    id v38 = v10;
    unsigned __int8 v12 = -[BMSyncDatabaseTransactionBatcher executeOperationWithBlock:](v11, "executeOperationWithBlock:", v36);

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = __biome_log_for_category(11LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100040EF4();
      }
      goto LABEL_19;
    }
  }

  __int128 v18 = (void *)v44[5];
  v44[5] = 0LL;

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[BMStreamCKCRDT tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:fromDatastore:]( self,  "tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:fromDatastore:",  v5,  v8));
  *(void *)&__int128 v55 = 0LL;
  *((void *)&v55 + 1) = &v55;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_1000134A0;
  id v58 = sub_1000134B0;
  id v59 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1000134A0;
  __int16 v34 = sub_1000134B0;
  id v35 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001390C;
  v23[3] = &unk_100069068;
  uint64_t v14 = v19;
  id v24 = v14;
  uint64_t v25 = self;
  unsigned int v27 = &v30;
  id v28 = &v55;
  id v20 = v5;
  id v26 = v20;
  uint64_t v29 = &v43;
  if (-[BMSyncDatabaseTransactionBatcher executeOperationWithBlock:](v11, "executeOperationWithBlock:", v23))
  {
    -[BMSyncDatabase saveLatestTombstoneBookmark:forSiteIdentifier:inStream:]( self->_db,  "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:",  v31[5],  v20,  self->_syncIdentifier);
    -[BMStreamCKCRDT deleteLocationsUpToTTLAtTombstone:siteIdentifier:]( self,  "deleteLocationsUpToTTLAtTombstone:siteIdentifier:",  *(void *)(*((void *)&v55 + 1) + 40LL),  v20);
    -[BMStreamCKCRDT deletedExpiredBufferedLocationsForSiteIdentifier:]( self,  "deletedExpiredBufferedLocationsForSiteIdentifier:",  v20);
  }

  else
  {
    uint64_t v21 = __biome_log_for_category(11LL);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100040EC8();
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v55, 8);

LABEL_19:
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&buf, 8);
}

- (BOOL)deleteLocationsUpToTTLAtTombstone:(id)a3 siteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "deleteLocationsUpToTTLAtTombstone: %@, siteIdentifier: %@",  (uint8_t *)&v19,  0x16u);
    }

    id v10 = objc_alloc(&OBJC_CLASS___BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 segmentName]);
    id v13 = objc_msgSend( v10,  "initWithStream:segment:iterationStartTime:offset:",  streamIdentifier,  v12,  objc_msgSend(v6, "offset"),  1.79769313e308);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 segmentName]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](self->_streamConfiguration, "storeConfig"));
    LODWORD(streamIdentifier) = +[BMFrameStore getSegmentVersion:config:stream:]( &OBJC_CLASS___BMFrameStore,  "getSegmentVersion:config:stream:",  v14,  v15,  self->_streamIdentifier);

    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:]( self->_db,  "computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:",  v13,  v7,  self->_syncIdentifier,  (_DWORD)streamIdentifier == 9));
    if (v16) {
      BOOL v17 = -[BMStreamCKCRDT deleteAtOrBeforeHighestDeletedLocation:]( self,  "deleteAtOrBeforeHighestDeletedLocation:",  v16);
    }
    else {
      BOOL v17 = 1;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)deletedExpiredBufferedLocationsForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = __biome_log_for_category(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "deletedExpiredBufferedLocationsForSiteIdentifier: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v7 = -[BMSyncDatabase highestLocationWithBufferedAtomsOlderThan:forSiteIdentifier:inStream:]( self->_db,  "highestLocationWithBufferedAtomsOlderThan:forSiteIdentifier:inStream:",  v4,  self->_syncIdentifier,  CFAbsoluteTimeGetCurrent() + -2419200.0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8) {
    BOOL v9 = -[BMStreamCKCRDT deleteAtOrBeforeHighestDeletedLocation:](self, "deleteAtOrBeforeHighestDeletedLocation:", v8);
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)deleteAtOrBeforeHighestDeletedLocation:(id)a3
{
  id v4 = a3;
  -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v4, 3LL);
  db = self->_db;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  -[BMSyncDatabase updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:]( db,  "updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:",  v6);

  BOOL v7 = -[BMSyncDatabase deleteAllAtomsAtOrBeforeLocation:](self->_db, "deleteAllAtomsAtOrBeforeLocation:", v4);
  if (v7)
  {
    -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v4, 4LL);
    uint64_t v8 = self->_db;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    -[BMSyncDatabase markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:]( v8,  "markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:",  v9);

    -[BMSyncDatabase removeAllDeletedLocationsBeforeHighestDeletedLocation:]( self->_db,  "removeAllDeletedLocationsBeforeHighestDeletedLocation:",  v4);
  }

  else
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100040F20();
    }
  }

  return v7;
}

- (void)populateAtomBatch:(id)a3 withAtomsInClockVector:(id)a4 forLocation:(id)a5 ckFormatVersion:(unsigned __int8)a6 valueVersion:(int64_t)a7 chunker:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  BOOL v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000142D8;
  v30[3] = &unk_100069090;
  __int16 v21 = v17;
  uint64_t v31 = v21;
  uint64_t v32 = self;
  id v22 = v18;
  id v33 = v22;
  int64_t v36 = a7;
  id v23 = v13;
  id v34 = v23;
  id v24 = v14;
  id v35 = v24;
  unsigned __int8 v37 = a6;
  -[BMSyncDatabase atomRowsInTimestampClockVector:forLocation:inStream:enumerateWithBlock:]( db,  "atomRowsInTimestampClockVector:forLocation:inStream:enumerateWithBlock:",  v16,  v15,  syncIdentifier,  v30);

  id v29 = 0LL;
  [v23 finishWritingWithError:&v29];
  id v25 = v29;
  if (v25)
  {
    uint64_t v26 = __biome_log_for_category(11LL);
    unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100040F80();
    }
  }

  objc_msgSend(v24, "setMoreComing:", objc_msgSend(v24, "moreComing"));
}

- (void)atomsForChangesSinceClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6 enumerateWithBlock:(id)a7
{
  unsigned int v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = objc_autoreleasePoolPush();
  -[BMStreamCKCRDT ingestNewChangesFromAllSitesInVectorClock:transportType:]( self,  "ingestNewChangesFromAllSitesInVectorClock:transportType:",  v12,  a6);
  objc_autoreleasePoolPop(v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT rangeClockVector](self, "rangeClockVector"));
  uint64_t v17 = __biome_log_for_category(11LL);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100041040();
  }

  [v16 minusVector:v12];
  id v19 = v16;
  uint64_t v20 = __biome_log_for_category(11LL);
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    streamIdentifier = self->_streamIdentifier;
    *(_DWORD *)__int128 buf = 138412802;
    id v40 = v19;
    __int16 v41 = 2048;
    v42 = (NSString *)v10;
    __int16 v43 = 2112;
    v44 = streamIdentifier;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "generating atom batch with timestamps to fill for clock: %@, version: %lu, stream: %@",  buf,  0x20u);
  }

  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  id v38 = 0LL;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase activeLocationsInClockVector:inStream:error:]( db,  "activeLocationsInClockVector:inStream:error:",  v19,  syncIdentifier,  &v38));
  id v25 = (NSString *)v38;
  if (v25)
  {
    uint64_t v26 = __biome_log_for_category(11LL);
    unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = self->_syncIdentifier;
      *(_DWORD *)__int128 buf = 138412802;
      id v40 = v19;
      __int16 v41 = 2112;
      v42 = v32;
      __int16 v43 = 2112;
      v44 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "error fetching active locations for clockVector: %@ stream: %@ error: %@",  buf,  0x20u);
    }
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100014DA0;
  v33[3] = &unk_1000690B8;
  v33[4] = self;
  id v34 = v19;
  char v37 = v10;
  id v35 = v13;
  id v36 = v14;
  id v28 = v14;
  id v29 = v13;
  id v30 = v19;
  [v24 enumerateObjectsUsingBlock:v33];
}

- (void)handleDeletedLocation:(id)a3 deleteCKRecord:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = __biome_log_for_category(11LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "handleDeletedLocation: %@",  (uint8_t *)&buf,  0xCu);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 siteIdentifier]);
  else {
    unsigned int v10 = v9;
  }
  id v11 = v10;
  BOOL v12 = self->_account == 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](self->_streamConfiguration, "storeConfig"));
  id v14 = v13;
  if (v12) {
    id v15 = [v13 copyWithRemoteName:v11];
  }
  else {
    id v15 = [v13 copyWithAccount:self->_account remoteName:v11];
  }
  id v16 = v15;

  id v17 = objc_msgSend( [BMStreamDatastorePruner alloc],  "initWithStream:config:eventDataClass:",  self->_streamIdentifier,  v16,  -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_db, "locationRowWithLocation:", v6));
  id v19 = v18;
  if (v18 && [v18 state] != (id)4)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000LL;
    id v35 = sub_1000134A0;
    id v36 = sub_1000134B0;
    id v37 = 0LL;
    db = self->_db;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10001534C;
    v30[3] = &unk_1000690E0;
    void v30[4] = self;
    id v31 = v17;
    p___int128 buf = &buf;
    -[BMSyncDatabase atomsAtOrBeforeLocation:ofType:enumerateWithBlock:]( db,  "atomsAtOrBeforeLocation:ofType:enumerateWithBlock:",  v19,  0LL,  v30);
    -[BMSyncDatabase saveLatestTombstoneBookmark:forSiteIdentifier:inStream:]( self->_db,  "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:",  *(void *)(*((void *)&buf + 1) + 40LL),  v9,  self->_syncIdentifier);
    -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v19, 3LL);
    id v23 = self->_db;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 location]);
    -[BMSyncDatabase updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:]( v23,  "updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:",  v24);

    if (-[BMSyncDatabase deleteAllAtomsAtOrBeforeLocation:](self->_db, "deleteAllAtomsAtOrBeforeLocation:", v19))
    {
      -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v19, 4LL);
      id v25 = self->_db;
      if (v4)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 location]);
        -[BMSyncDatabase deleteCKRecordsAtOrBeforeLocation:](v25, "deleteCKRecordsAtOrBeforeLocation:", v26);
      }

      else
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 location]);
        -[BMSyncDatabase markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:]( v25,  "markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:",  v26);
      }

      -[BMSyncDatabase removeAllDeletedLocationsBeforeHighestDeletedLocation:]( self->_db,  "removeAllDeletedLocationsBeforeHighestDeletedLocation:",  v19);
    }

    _Block_object_dispose(&buf, 8);
  }

  else if ([v19 state] == (id)3 || objc_msgSend(v19, "state") == (id)4)
  {
    uint64_t v20 = __biome_log_for_category(11LL);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "deleted location already handled",  (uint8_t *)&buf,  2u);
    }
  }

  else
  {
    uint64_t v27 = __biome_log_for_category(11LL);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "location we haven't yet observed is now deleted %@",  (uint8_t *)&buf,  0xCu);
    }

    id v29 =  -[BMSyncDatabase insertLocationIfNotExists:withState:]( self->_db,  "insertLocationIfNotExists:withState:",  v6,  4LL);
  }
}

- (void)mergeAtomBatch:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 mergeableValueID]);
  unsigned int v10 = -[BMStreamCRDTLocation initWithCKMergeableValueID:](v8, "initWithCKMergeableValueID:", v9);

  if (v10)
  {
    id v13 = v6;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    -[BMStreamCKCRDT mergeAtomBatches:sessionContext:forLocation:]( self,  "mergeAtomBatches:sessionContext:forLocation:",  v11,  v7,  v10);
  }

  else
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100041178(v6, v11);
    }
  }
}

- (void)mergeAtomBatches:(id)a3 sessionContext:(id)a4 forLocation:(id)a5
{
  id v60 = a3;
  id v67 = a4;
  id v8 = a5;
  id v66 = v8;
  if (v8)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_db, "locationRowWithLocation:", v8));
    db = self->_db;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v66 siteIdentifier]);
    id v59 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:]( db,  "highestDeletedLocationForSiteIdentifier:inStream:",  v10,  self->_syncIdentifier));

    if ([v68 state] == (id)1)
    {
      uint64_t v11 = __biome_log_for_category(11LL);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v68;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received missing location %@", buf, 0xCu);
      }

      -[BMSyncDatabase updateLocationState:forLocation:](self->_db, "updateLocationState:forLocation:", 2LL, v68);
LABEL_6:
      v65 = (void *)objc_claimAutoreleasedReturnValue([v66 siteIdentifier]);
      id v64 = objc_opt_new(&OBJC_CLASS___NSCache);
      id v63 = objc_opt_new(&OBJC_CLASS___NSCache);
      uint64_t v101 = 0LL;
      v102 = &v101;
      uint64_t v103 = 0x2020000000LL;
      char v104 = 0;
      uint64_t v97 = 0LL;
      v98 = &v97;
      uint64_t v99 = 0x2020000000LL;
      char v100 = 0;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      id obj = v60;
      id v13 = [obj countByEnumeratingWithState:&v93 objects:v109 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v94;
LABEL_8:
        uint64_t v15 = 0LL;
        while (1)
        {
          if (*(void *)v94 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v93 + 1) + 8 * v15);
          id v17 = objc_autoreleasePoolPush();
          uint64_t v18 = __biome_log_for_category(11LL);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v16 count];
            *(_DWORD *)__int128 buf = 134218242;
            *(void *)&uint8_t buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Merging %llu atoms with location %@",  buf,  0x16u);
          }

          if ((uint64_t)[v16 count] < 1)
          {
            int v23 = 3;
          }

          else
          {
            __int16 v21 = -[BMSyncDatabaseTransactionBatcher initWithDatabase:transcationBatchSize:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseTransactionBatcher),  "initWithDatabase:transcationBatchSize:",  self->_db,  50LL);
            v85[0] = _NSConcreteStackBlock;
            v85[1] = 3221225472LL;
            v85[2] = sub_100016034;
            v85[3] = &unk_100069108;
            id v22 = v21;
            v86 = v22;
            v87 = self;
            id v88 = v67;
            id v89 = v65;
            v90 = v64;
            v91 = v63;
            id v92 = v68;
            [v16 enumerateAtomsWithOptions:0 usingBlock:v85];
            if (-[BMSyncDatabaseTransactionBatcher markAllOperationsComplete](v22, "markAllOperationsComplete"))
            {
              int v23 = 0;
            }

            else
            {
              uint64_t v24 = __biome_log_for_category(11LL);
              id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                sub_10004122C(&v83, v84, v25);
              }

              int v23 = 1;
            }
          }

          objc_autoreleasePoolPop(v17);
          if (v23 != 3)
          {
            if (v23) {
              break;
            }
          }

          if (v13 == (id)++v15)
          {
            id v13 = [obj countByEnumeratingWithState:&v93 objects:v109 count:16];
            if (v13) {
              goto LABEL_8;
            }
            goto LABEL_25;
          }
        }
      }

      else
      {
LABEL_25:

        else {
          uint64_t v26 = v65;
        }
        id obj = v26;
        streamConfiguration = self->_streamConfiguration;
        if (self->_account)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](streamConfiguration, "storeConfig"));
          id v29 = [v28 copyWithAccount:self->_account remoteName:obj];
        }

        else
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](streamConfiguration, "storeConfig"));
          id v29 = [v28 copyWithRemoteName:obj];
        }

        __int16 v43 = v29;

        id v44 = objc_msgSend( [BMStreamDatastoreWriter alloc],  "initWithStream:config:eventDataClass:",  self->_streamIdentifier,  v43,  -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
        id v45 = objc_msgSend( [BMStreamDatastorePruner alloc],  "initWithStream:config:eventDataClass:",  self->_streamIdentifier,  v43,  -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
        uint64_t v46 = objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT readerForSiteIdentifier:](self, "readerForSiteIdentifier:", v65));
        v47 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase latestCKAtomRowOfType:forSiteIdentifier:inStream:]( self->_db,  "latestCKAtomRowOfType:forSiteIdentifier:inStream:",  0LL,  v65,  self->_syncIdentifier));
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT bookmarkForAtomRow:](self, "bookmarkForAtomRow:", v47));
        id v49 = -[BMStreamCKCRDT newEnumeratorStartingAfterBookmark:reader:]( self,  "newEnumeratorStartingAfterBookmark:reader:",  v48,  v46);
        uint64_t v61 = (void *)v46;

        *(void *)__int128 buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v106 = sub_1000134A0;
        v107 = sub_1000134B0;
        id v108 = (id)objc_claimAutoreleasedReturnValue([v49 nextEvent]);
        if (*(void *)(*(void *)&buf[8] + 40LL))
        {
          id v50 = self->_db;
          syncIdentifier = self->_syncIdentifier;
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472LL;
          v80[2] = sub_10001665C;
          v80[3] = &unk_100069130;
          v82 = buf;
          v80[4] = self;
          id v81 = v49;
          -[BMSyncDatabase atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:]( v50,  "atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:",  v65,  syncIdentifier,  v80);
        }

        v78[0] = 0LL;
        v78[1] = v78;
        v78[2] = 0x3032000000LL;
        v78[3] = sub_1000134A0;
        v78[4] = sub_1000134B0;
        id v79 = 0LL;
        v52 = self->_db;
        v53 = self->_syncIdentifier;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = sub_100016984;
        v69[3] = &unk_100069158;
        id v70 = v67;
        char v71 = self;
        v75 = v78;
        v76 = &v101;
        id v54 = v44;
        id v72 = v54;
        v77 = &v97;
        id v55 = v45;
        id v73 = v55;
        id v56 = v65;
        id v74 = v56;
        -[BMSyncDatabase atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:]( v52,  "atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:",  v56,  v53,  v69);
        if (*((_BYTE *)v98 + 24)) {
          -[BMSyncChangeReporter userDeletesForStreamName:deviceIdentifier:error:]( self->_changeReporter,  "userDeletesForStreamName:deviceIdentifier:error:",  self->_streamIdentifier,  v56,  0LL);
        }
        if (*((_BYTE *)v102 + 24)) {
          -[BMSyncChangeReporter streamUpdatedForStreamName:deviceIdentifier:error:]( self->_changeReporter,  "streamUpdatedForStreamName:deviceIdentifier:error:",  self->_streamIdentifier,  v56,  0LL);
        }

        _Block_object_dispose(v78, 8);
        _Block_object_dispose(buf, 8);
      }

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v101, 8);

      uint64_t v34 = (os_log_s *)v65;
      goto LABEL_49;
    }

    if ([v68 state] == (id)3 || objc_msgSend(v68, "state") == (id)4)
    {
      uint64_t v33 = __biome_log_for_category(11LL);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v68;
        id v35 = "Location is not active %@ skipping merge to not resurrect a dead location";
        id v36 = v34;
        uint32_t v37 = 12;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
      }
    }

    else
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v59 location]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 day]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v66 day]);
      id v41 = [v39 compare:v40];

      if (v41 != (id)1)
      {
        if (!v68)
        {
          uint64_t v57 = __biome_log_for_category(11LL);
          id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "First time observing location %@",  buf,  0xCu);
          }

          v68 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase insertLocationIfNotExists:withState:]( self->_db,  "insertLocationIfNotExists:withState:",  v66,  2LL));
        }

        goto LABEL_6;
      }

      uint64_t v42 = __biome_log_for_category(11LL);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v66;
        id v35 = "Highest deleted location %@ is past incoming location %@";
        id v36 = v34;
        uint32_t v37 = 22;
        goto LABEL_36;
      }
    }

- (id)clockVector
{
  return -[BMSyncDatabase legacyTimestampClockVectorForStreamName:]( self->_db,  "legacyTimestampClockVectorForStreamName:",  self->_syncIdentifier);
}

- (id)rangeClockVector
{
  return -[BMSyncDatabase rangeClockVectorForStreamName:]( self->_db,  "rangeClockVectorForStreamName:",  self->_syncIdentifier);
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (void)setStreamConfiguration:(id)a3
{
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end