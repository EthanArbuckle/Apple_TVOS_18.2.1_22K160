@interface CPLCKResourceDownloadOperation
+ (id)assetDownloadOperationFor:(id)a3 key:(id)a4 fingerPrint:(id)a5 downloadType:(int64_t)a6 timeRange:(id *)a7 completionBlock:(id)a8;
+ (id)downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 downloadType:(int64_t)a5 perRecordProgressBlock:(id)a6 perRecordCompletionBlock:(id)a7 completionBlock:(id)a8;
+ (id)fetchDerivativesUploadConfigurationWithCompletionBlock:(id)a3;
+ (id)fetchRawDerivativesUploadConfigurationWithCompletionBlock:(id)a3;
+ (id)inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 downloadType:(int64_t)a7 completionBlock:(id)a8;
+ (id)streamOperationForRecordID:(id)a3 key:(id)a4 downloadType:(int64_t)a5 filename:(id)a6 timeRange:(id *)a7 mediaRequestHints:(id)a8 completionBlock:(id)aBlock;
- (CPLCKResourceDownloadOperation)init;
@end

@implementation CPLCKResourceDownloadOperation

+ (id)downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 downloadType:(int64_t)a5 perRecordProgressBlock:(id)a6 perRecordCompletionBlock:(id)a7 completionBlock:(id)a8
{
  v13 = _Block_copy(a6);
  v14 = _Block_copy(a7);
  v15 = _Block_copy(a8);
  uint64_t v16 = sub_1000CE284(0LL, &qword_100291F00, &OBJC_CLASS___CKRecordID_ptr);
  uint64_t v17 = sub_1000CE284(0LL, &qword_100291F08, &OBJC_CLASS___CPLEngineResourceDownloadTask_ptr);
  unint64_t v18 = sub_1000CDF00();
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v16, v17, v18);
  uint64_t v20 = swift_allocObject(&unk_100244028, 24LL, 7LL);
  *(void *)(v20 + 16) = v13;
  uint64_t v21 = swift_allocObject(&unk_100244050, 24LL, 7LL);
  *(void *)(v21 + 16) = v14;
  uint64_t v22 = swift_allocObject(&unk_100244078, 24LL, 7LL);
  *(void *)(v22 + 16) = v15;
  id v23 = a4;
  sub_1000CBF60( v19,  (uint64_t)v23,  a5,  (uint64_t)sub_1000CDF58,  v20,  (uint64_t)sub_1000CDF68,  v21,  (uint64_t)sub_1000CDF8C,  v22);
  v25 = v24;

  swift_bridgeObjectRelease(v19);
  swift_release(v20);
  swift_release(v21);
  swift_release(v22);
  return v25;
}

+ (id)streamOperationForRecordID:(id)a3 key:(id)a4 downloadType:(int64_t)a5 filename:(id)a6 timeRange:(id *)a7 mediaRequestHints:(id)a8 completionBlock:(id)aBlock
{
  int64_t var3 = a7->var1.var3;
  v26[0] = a7->var0.var0;
  v26[1] = *(void *)&a7->var0.var1;
  __int128 v27 = *(_OWORD *)&a7->var0.var3;
  uint64_t v28 = *(void *)&a7->var1.var1;
  int64_t v29 = var3;
  v15 = _Block_copy(aBlock);
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = v17;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v21 = v20;
  if (a8) {
    a8 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a8,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  uint64_t v22 = swift_allocObject(&unk_100244000, 24LL, 7LL);
  *(void *)(v22 + 16) = v15;
  id v23 = a3;
  v24 = sub_1000CCEC4(v23, v16, v18, a5, v19, v21, (uint64_t)v26, (uint64_t)a8, (uint64_t)sub_1000CDEF8, v22);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
  swift_release(v22);
  swift_bridgeObjectRelease(a8);
  return v24;
}

+ (id)inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 downloadType:(int64_t)a7 completionBlock:(id)a8
{
  v13 = _Block_copy(a8);
  uint64_t v14 = swift_allocObject(&unk_100243FD8, 24LL, 7LL);
  *(void *)(v14 + 16) = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = _s22CloudKitImplementation30CPLCKResourceDownloadOperationC08inMemoryeF03for8resource6record4keys12downloadType15completionBlockSo010CKDatabaseF0CSo10CKRecordIDC_So11CPLResourceCSo20CPLPlaceholderRecordCSo08CPLCloudB12ResourceKeysCSo0deN0Vy10Foundation4DataVSg_SSSgSbs5Error_pSgtctFZ_0( v15,  v16,  (uint64_t)v17,  v18,  a7,  (uint64_t)sub_1000CDEF0,  v14);

  swift_release(v14);
  return v19;
}

+ (id)fetchDerivativesUploadConfigurationWithCompletionBlock:(id)a3
{
  return sub_1000C9AB4( (int)a1,  (int)a2,  a3,  (uint64_t)&unk_100243FB0,  (uint64_t)sub_1000CDED8,  _s22CloudKitImplementation30CPLCKResourceDownloadOperationC35fetchDerivativesUploadConfiguration15completionBlockSo010CKDatabaseF0CySo20CPLDerivativesFilterCSg_s5Error_pSgtc_tFZ_0);
}

+ (id)assetDownloadOperationFor:(id)a3 key:(id)a4 fingerPrint:(id)a5 downloadType:(int64_t)a6 timeRange:(id *)a7 completionBlock:(id)a8
{
  int64_t var3 = a7->var1.var3;
  v24[0] = a7->var0.var0;
  v24[1] = *(void *)&a7->var0.var1;
  __int128 v25 = *(_OWORD *)&a7->var0.var3;
  uint64_t v26 = *(void *)&a7->var1.var1;
  int64_t v27 = var3;
  v13 = _Block_copy(a8);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v19 = v18;
  uint64_t v20 = swift_allocObject(&unk_100243F88, 24LL, 7LL);
  *(void *)(v20 + 16) = v13;
  id v21 = a3;
  uint64_t v22 = sub_1000CD988(v21, v14, v16, v17, v19, a6, (uint64_t)v24, (uint64_t)sub_1000CEE2C, v20);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  swift_release(v20);
  return v22;
}

+ (id)fetchRawDerivativesUploadConfigurationWithCompletionBlock:(id)a3
{
  return sub_1000C9AB4( (int)a1,  (int)a2,  a3,  (uint64_t)&unk_100243F60,  (uint64_t)sub_1000CDED0,  _s22CloudKitImplementation30CPLCKResourceDownloadOperationC38fetchRawDerivativesUploadConfiguration15completionBlockSo010CKDatabaseF0CySSSg_s5Error_pSgtc_tFZ_0);
}

- (CPLCKResourceDownloadOperation)init
{
  result = (CPLCKResourceDownloadOperation *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000039LL,  0x80000001001D1760LL,  "CloudKitImplementation/CPLCKResourceDownloadOperation.swift",  59LL,  2LL,  763LL,  0);
  __break(1u);
  return result;
}

@end