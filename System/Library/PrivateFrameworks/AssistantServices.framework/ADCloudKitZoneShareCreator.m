@interface ADCloudKitZoneShareCreator
- (ADCloudKitZoneShareCreator)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5;
- (void)_setupZoneSharing:(id)a3;
- (void)deleteZoneShare:(BOOL)a3 markForReinvitation:(BOOL)a4 completion:(id)a5;
- (void)fetchZoneShare:(id)a3;
- (void)saveZoneShare:(id)a3 completion:(id)a4;
@end

@implementation ADCloudKitZoneShareCreator

- (ADCloudKitZoneShareCreator)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADCloudKitZoneShareCreator;
  v12 = -[ADCloudKitZoneShareCreator init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_container, a4);
    objc_storeStrong((id *)&v13->_zoneInfo, a5);
  }

  return v13;
}

- (void)_setupZoneSharing:(id)a3
{
  id v4 = a3;
  zoneInfo = self->_zoneInfo;
  if (zoneInfo
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](zoneInfo, "zone")),
        v6,
        v6))
  {
    v7 = objc_alloc(&OBJC_CLASS___CKShare);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](self->_zoneInfo, "zone"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    id v10 = -[CKShare initWithRecordZoneID:](v7, "initWithRecordZoneID:", v9);

    -[CKShare setParticipantVisibility:](v10, "setParticipantVisibility:", 2LL);
    id v11 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
    v22 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v13 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v11,  "initWithRecordsToSave:recordIDsToDelete:",  v12,  0LL);

    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_10017A534;
    v19 = &unk_1004FB748;
    v20 = self;
    id v21 = v4;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v13, "setModifyRecordsCompletionBlock:", &v16);
    -[CKModifyRecordsOperation setQualityOfService:](v13, "setQualityOfService:", 17LL, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    [v14 addOperation:v13];
  }

  else
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4020LL));
    if (v4) {
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v15);
    }
  }
}

- (void)deleteZoneShare:(BOOL)a3 markForReinvitation:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A198;
  block[3] = &unk_1004F3C80;
  block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)fetchZoneShare:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100179D30;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)saveZoneShare:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v15 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v10 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v8,  "initWithRecordsToSave:recordIDsToDelete:",  v9,  0LL);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100179C24;
  v13[3] = &unk_1004F3C58;
  id v14 = v6;
  id v11 = v6;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v10, "setModifyRecordsCompletionBlock:", v13);
  -[CKModifyRecordsOperation setQualityOfService:](v10, "setQualityOfService:", 17LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
  [v12 addOperation:v10];
}

- (void).cxx_destruct
{
}

@end