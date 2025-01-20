@interface BMStreamCKRecordCRDT
- (BMStreamCKCRDT)streamCRDT;
- (BMStreamCKRecordCRDT)initWithStreamCRDT:(id)a3 locationRow:(id)a4 database:(id)a5 queue:(id)a6 maxDeltaSize:(int64_t)a7 sessionContext:(id)a8;
- (BMSyncCRDTLocationRow)locationRow;
- (BMSyncSessionContext)sessionContext;
- (BOOL)mergeDeltas:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4;
- (id)stateVector;
- (int64_t)maxDeltaSize;
- (unint64_t)deltaDeliveryRequirements;
- (void)setMaxDeltaSize:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation BMStreamCKRecordCRDT

- (BMStreamCKRecordCRDT)initWithStreamCRDT:(id)a3 locationRow:(id)a4 database:(id)a5 queue:(id)a6 maxDeltaSize:(int64_t)a7 sessionContext:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___BMStreamCKRecordCRDT;
  v18 = -[BMStreamCKRecordCRDT init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamCRDT, a3);
    objc_storeStrong((id *)&v19->_locationRow, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    objc_storeStrong((id *)&v19->_queue, a6);
    v19->_maxDeltaSize = a7;
    objc_storeStrong((id *)&v19->_sessionContext, a8);
  }

  return v19;
}

- (id)stateVector
{
  if (self->_locationRow)
  {
    db = self->_db;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKRecordCRDT locationRow](self, "locationRow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase stateVectorForLocationRow:](db, "stateVectorForLocationRow:", v4));
  }

  else
  {
    uint64_t v6 = __biome_log_for_category(11LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000400D0(v7);
    }

    v5 = (void *)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampStateVector);
  }

  return v5;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0LL;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v12 = __biome_log_for_category(11LL);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "mergeDeltas delta: %@", buf, 0xCu);
        }

        id v14 = objc_alloc(&OBJC_CLASS___CKAtomBatch);
        id v30 = 0LL;
        id v15 = [v14 initWithMergeableDelta:v11 error:&v30];
        id v16 = v30;
        v8 = v16;
        if (v15) {
          BOOL v17 = v16 == 0LL;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          -[NSMutableArray addObject:](v28, "addObject:", v15);
        }

        else
        {
          uint64_t v18 = __biome_log_for_category(11LL);
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v8;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "Failed to initWithMergeableDelta with error %@",  buf,  0xCu);
          }
        }

        v20 = objc_alloc(&OBJC_CLASS___NSString);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v15 mergeableValueID]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
        objc_super v23 = -[NSString initWithData:encoding:](v20, "initWithData:encoding:", v22, 4LL);
        -[BMSyncSessionContext setOriginatingSiteIdentifier:]( self->_sessionContext,  "setOriginatingSiteIdentifier:",  v23);
      }

      id v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v7);
  }

  else
  {
    v8 = 0LL;
  }

  sessionContext = self->_sessionContext;
  streamCRDT = self->_streamCRDT;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](self->_locationRow, "location"));
  -[BMStreamCKCRDT mergeAtomBatches:sessionContext:forLocation:]( streamCRDT,  "mergeAtomBatches:sessionContext:forLocation:",  v28,  sessionContext,  v26);

  return 1;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](self->_locationRow, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckMergeableValueID]);

  id v66 = 0LL;
  id v9 = [[CKAtomBatch alloc] initWriterWithMergeableValueID:v8 metadata:v6 formatVersion:3 error:&v66];
  id v10 = v66;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = __biome_log_for_category(11LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v71 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003BF0;
    block[3] = &unk_100068AD8;
    block[4] = buf;
    if (qword_10007C2D0 != -1) {
      dispatch_once(&qword_10007C2D0, block);
    }
    os_log_type_t v14 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v14)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    id v15 = "BMStreamCKRecordCRDT: unable to init a CKAtomBatch with initWriterWithMergeableValueID:%@ error:%@";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, buf, 0x16u);
LABEL_12:

    if (a4)
    {
      id v11 = v11;
      v20 = 0LL;
      *a4 = v11;
    }

    else
    {
      v20 = 0LL;
    }

    goto LABEL_46;
  }

  streamCRDT = self->_streamCRDT;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsVector]);
  -[BMStreamCKCRDT populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:]( streamCRDT,  "populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:",  v9,  v17,  self->_locationRow,  3LL,  1LL,  0LL);

  id v64 = 0LL;
  [v9 finishWritingWithError:&v64];
  id v18 = v64;
  if (v18)
  {
    id v11 = v18;
    uint64_t v19 = __biome_log_for_category(11LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v71 = 16;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_100003C04;
    v63[3] = &unk_100068AD8;
    v63[4] = buf;
    if (qword_10007C2D8 != -1) {
      dispatch_once(&qword_10007C2D8, v63);
    }
    os_log_type_t v14 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v14)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    id v15 = "BMStreamCKRecordCRDT: unable to complete a CKAtomBatch with finishWritingWithError:%@ error:%@";
    goto LABEL_11;
  }

  int64_t maxDeltaSize = self->_maxDeltaSize;
  id v62 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 splitWithMaximumSize:maxDeltaSize error:&v62]);
  id v23 = v62;
  if (v23)
  {
    uint64_t v24 = __biome_log_for_category(11LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10004014C(v25, v26, v27);
    }

    v20 = 0LL;
    if (a4) {
      *a4 = v23;
    }
  }

  else
  {
    v50 = a4;
    id v52 = v9;
    v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    v51 = v22;
    id obj = v22;
    id v29 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v59;
      while (2)
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          __int128 v33 = v28;
          if (*(void *)v59 != v31) {
            objc_enumerationMutation(obj);
          }
          __int128 v34 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
          id v56 = 0LL;
          [v34 size:&v57 error:&v56];
          id v35 = v56;
          uint64_t v36 = __biome_log_for_category(11LL);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          v38 = v37;
          if (v35)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              sub_100040110(v67, &v68, v38);
            }
          }

          else if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v57));
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "BMStreamCKRecordCRDT: split into batch of size %@",  buf,  0xCu);
          }

          id v40 = objc_alloc(&OBJC_CLASS___CKMergeableDelta);
          id v55 = 0LL;
          id v41 = [v40 initWithAtomBatch:v34 error:&v55];
          id v42 = v55;
          if (v42)
          {
            v45 = v42;
            uint64_t v46 = __biome_log_for_category(11LL);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            char v71 = 16;
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472LL;
            v54[2] = sub_100003C18;
            v54[3] = &unk_100068AD8;
            v54[4] = buf;
            if (qword_10007C2E0 != -1) {
              dispatch_once(&qword_10007C2E0, v54);
            }
            id v22 = v51;
            os_log_type_t v48 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v47, v48))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  v48,  "BMStreamCKRecordCRDT: unable to init a CKMergeableDelta with initWithAtomBatch:%@ error:%@",  buf,  0x16u);
            }

            if (v50) {
              id *v50 = v45;
            }

            v20 = 0LL;
            id v9 = v52;
            id v23 = 0LL;
            v28 = v33;
            goto LABEL_44;
          }

          v28 = v33;
          -[NSMutableArray addObject:](v33, "addObject:", v41);
        }

        id v30 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    uint64_t v43 = __biome_log_for_category(11LL);
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "*** deltas: %@", buf, 0xCu);
    }

    v20 = v28;
    id v22 = v51;
    id v9 = v52;
    id v23 = 0LL;
LABEL_44:
  }

  id v11 = 0LL;
LABEL_46:

  return v20;
}

- (unint64_t)deltaDeliveryRequirements
{
  return 1LL;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncCRDTLocationRow)locationRow
{
  return self->_locationRow;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)maxDeltaSize
{
  return self->_maxDeltaSize;
}

- (void)setMaxDeltaSize:(int64_t)a3
{
  self->_int64_t maxDeltaSize = a3;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void).cxx_destruct
{
}

@end