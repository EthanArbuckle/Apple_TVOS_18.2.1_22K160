@interface CPLCKPhotosSharedLibraryOperation
+ (id)exitSharedLibraryOperationWithZoneID:(id)a3 retentionPolicy:(int64_t)a4 exitType:(int64_t)a5 exitSource:(int64_t)a6 stopAt:(int64_t)a7 participantUserIDsToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10;
+ (id)getNextBatchToMoveOperationWithZoneID:(id)a3 batchSize:(int64_t)a4 completionHandler:(id)a5;
+ (id)moveBatchSharedLibraryOperationWithZoneID:(id)a3 batchSize:(int)a4 operationID:(id)a5 completionHandler:(id)a6;
+ (id)sendExitMoveBatchFeedbackWithMoveBatchOperationID:(id)a3 moveBatchID:(id)a4 exitZoneID:(id)a5 feedbackItems:(id)a6 completionHandler:(id)a7;
+ (id)sendExitStatusFeedbackWithOperationID:(id)a3 shareID:(id)a4 status:(int64_t)a5 completionHandler:(id)a6;
+ (id)silentMoverServerRampOperationWithOperationID:(id)a3 completionHandler:(id)a4;
- (CPLCKPhotosSharedLibraryOperation)init;
@end

@implementation CPLCKPhotosSharedLibraryOperation

+ (id)silentMoverServerRampOperationWithOperationID:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v8 = swift_allocObject(&unk_1002455F8, 24LL, 7LL);
  *(void *)(v8 + 16) = v5;
  v9 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC021silentMoverServerRampG004withG2ID17completionHandlerSo010CKDatabaseG0CSSSg_ySb_AIs5Int64VSbs5Int32VS6bs5Error_pSgtctFZ_0( v6,  (uint64_t)a3,  (uint64_t)sub_10011C55C,  v8);
  swift_release(v8);
  swift_bridgeObjectRelease(a3);
  return v9;
}

+ (id)getNextBatchToMoveOperationWithZoneID:(id)a3 batchSize:(int64_t)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject(&unk_1002455D0, 24LL, 7LL);
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  _s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC18getNextBatchToMove4with9batchSize17completionHandlerSo010CKDatabaseG0CSo14CKRecordZoneIDC_SiySaySSGSg_SSSgANSbs5Error_pSgtctFZ_0( v9,  a4,  (uint64_t)sub_10011C554,  v8);
  v11 = v10;

  swift_release(v8);
  return v11;
}

+ (id)moveBatchSharedLibraryOperationWithZoneID:(id)a3 batchSize:(int)a4 operationID:(id)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v11;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v12 = swift_allocObject(&unk_1002455A8, 24LL, 7LL);
  *(void *)(v12 + 16) = v9;
  id v13 = a3;
  v14 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC09moveBatchefG04with9batchSize11operationID17completionHandlerSo010CKDatabaseG0CSo012CKRecordZoneN0C_s5Int32VSSSgySb_SbA2Os5Int64VSaySSGSgs5Error_pSgtctFZ_0( v13,  a4,  v10,  (uint64_t)a5,  (uint64_t)sub_10011C52C,  v12);

  swift_release(v12);
  swift_bridgeObjectRelease(a5);
  return v14;
}

+ (id)exitSharedLibraryOperationWithZoneID:(id)a3 retentionPolicy:(int64_t)a4 exitType:(int64_t)a5 exitSource:(int64_t)a6 stopAt:(int64_t)a7 participantUserIDsToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  v16 = _Block_copy(a10);
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a8, &type metadata for String);
  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a9, &type metadata for String);
  uint64_t v19 = swift_allocObject(&unk_100245580, 24LL, 7LL);
  *(void *)(v19 + 16) = v16;
  id v20 = a3;
  sub_10011BB60(v20, a4, a5, a6, a7, v17, v18, (uint64_t)sub_10011C524, v19);
  v22 = v21;

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v18);
  swift_release(v19);
  return v22;
}

+ (id)sendExitMoveBatchFeedbackWithMoveBatchOperationID:(id)a3 moveBatchID:(id)a4 exitZoneID:(id)a5 feedbackItems:(id)a6 completionHandler:(id)a7
{
  v11 = _Block_copy(a7);
  if (!a3)
  {
    uint64_t v12 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0LL;
    goto LABEL_6;
  }

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v13;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v15;
LABEL_6:
  uint64_t v16 = sub_1000BED3C(&qword_100294FE8);
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v16);
  uint64_t v18 = swift_allocObject(&unk_100245558, 24LL, 7LL);
  *(void *)(v18 + 16) = v11;
  id v19 = a5;
  id v20 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC25sendExitMoveBatchFeedback04withjkG2ID04movekN008exitZoneN013feedbackItems17completionHandlerSo010CKDatabaseG0CSSSg_ALSo08CKRecordqN0CSaySo0defijkL4Item_pGySb_s5Error_pSgtctFZ_0( v12,  (unint64_t)a3,  v14,  (unint64_t)a4,  v19,  v17,  (uint64_t)sub_100113E88,  v18);

  swift_bridgeObjectRelease(v17);
  swift_release(v18);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
  return v20;
}

+ (id)sendExitStatusFeedbackWithOperationID:(id)a3 shareID:(id)a4 status:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v11;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v12 = swift_allocObject(&unk_100245530, 24LL, 7LL);
  *(void *)(v12 + 16) = v9;
  id v13 = a4;
  uint64_t v14 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC22sendExitStatusFeedback04withG2ID5share6status17completionHandlerSo010CKDatabaseG0CSSSg_So012CKRecordZoneM0CSo011CPLCKSharedfiJ0VySb_s5Error_pSgtctFZ_0( v10,  (unint64_t)a3,  v13,  a5,  (uint64_t)sub_100113E04,  v12);

  swift_release(v12);
  swift_bridgeObjectRelease(a3);
  return v14;
}

- (CPLCKPhotosSharedLibraryOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CPLCKPhotosSharedLibraryOperation();
  return -[CPLCKPhotosSharedLibraryOperation init](&v3, "init");
}

@end