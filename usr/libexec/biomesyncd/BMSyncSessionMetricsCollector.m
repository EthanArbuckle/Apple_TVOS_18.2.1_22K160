@interface BMSyncSessionMetricsCollector
- (BMSyncSessionMetricsCollector)initWithDatabase:(id)a3;
- (id)sessionContext;
- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 ownerSite:(id)a5 originatingSite:(id)a6 eventCreatedAt:(double)a7 sessionContext:(id)a8;
- (void)recordMessageToDeviceIdentifier:(id)a3 reachable:(BOOL)a4 bytes:(unint64_t)a5 isReciprocal:(BOOL)a6 sessionContext:(id)a7;
- (void)recordSessionEnd:(id)a3 lastSyncDate:(id)a4;
- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6;
@end

@implementation BMSyncSessionMetricsCollector

- (BMSyncSessionMetricsCollector)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BMSyncSessionMetricsCollector;
  v6 = -[BMSyncSessionMetricsCollector init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v7->_atomMergeResultsRecorded = 0LL;
  }

  return v7;
}

- (id)sessionContext
{
  v2 = objc_opt_new(&OBJC_CLASS___BMSyncSessionContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  -[BMSyncSessionContext setSessionID:](v2, "setSessionID:", v4);

  -[BMSyncSessionContext setMessageID:](v2, "setMessageID:", 0LL);
  return v2;
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
}

- (void)recordSessionEnd:(id)a3 lastSyncDate:(id)a4
{
  id v10 = a3;
  if (a4)
  {
    id v6 = a4;
    v7 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v6);
    double v9 = v8;
  }

  else
  {
    double v9 = -1.0;
  }

  -[BMSyncDatabase recordSessionEnd:timeSincePreviousSync:]( self->_database,  "recordSessionEnd:timeSincePreviousSync:",  v10,  v9);
}

- (void)recordMessageToDeviceIdentifier:(id)a3 reachable:(BOOL)a4 bytes:(unint64_t)a5 isReciprocal:(BOOL)a6 sessionContext:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setMessageID:", (char *)objc_msgSend(v13, "messageID") + 1);
    id v15 = [v14 messageID];
    database = self->_database;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionID]);
    -[BMSyncDatabase recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:]( database,  "recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:",  v12,  v17,  v15,  v10,  a5,  v8);
  }

  else
  {
    uint64_t v18 = __biome_log_for_category(11LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000402A4(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 ownerSite:(id)a5 originatingSite:(id)a6 eventCreatedAt:(double)a7 sessionContext:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (!v17)
  {
    uint64_t v22 = __biome_log_for_category(11LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000402A4(v20, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_11;
  }

  unint64_t atomMergeResultsRecorded = self->_atomMergeResultsRecorded;
  if (!atomMergeResultsRecorded) {
    unint64_t atomMergeResultsRecorded = -[BMSyncDatabase countAtomMergeResultRecords]( self->_database,  "countAtomMergeResultRecords");
  }
  self->_unint64_t atomMergeResultsRecorded = atomMergeResultsRecorded + 1;
  if (atomMergeResultsRecorded >= 0x186A1)
  {
    uint64_t v19 = __biome_log_for_category(11LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    *(void *)buf = 0LL;
    v36 = buf;
    uint64_t v37 = 0x2020000000LL;
    char v38 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000063A4;
    block[3] = &unk_100068AD8;
    block[4] = buf;
    if (qword_10007C2E8 != -1) {
      dispatch_once(&qword_10007C2E8, block);
    }
    os_log_type_t v21 = v36[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v20, v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "exceeded limit for recording atom merge results", buf, 2u);
    }

- (void).cxx_destruct
{
}

@end