@interface CPLCKUtilitiesOperation
+ (id)deleteAllZonesWithCompletionHandler:(id)a3;
+ (id)deleteZoneWithName:(id)a3 completionHandler:(id)a4;
- (CPLCKUtilitiesOperation)init;
@end

@implementation CPLCKUtilitiesOperation

+ (id)deleteZoneWithName:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject(&unk_1002454B8, 24LL, 7LL);
  *(void *)(v9 + 16) = v5;
  v10 = (void *)_s22CloudKitImplementation23CPLCKUtilitiesOperationC10deleteZone8withName17completionHandlerSo010CKDatabaseE0CSS_ySb_s5Error_pSgtctFZ_0( v6,  v8,  (uint64_t)sub_100113E88,  v9);
  swift_bridgeObjectRelease(v8);
  swift_release(v9);
  return v10;
}

+ (id)deleteAllZonesWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject(&unk_100245490, 24LL, 7LL);
  *(void *)(v4 + 16) = v3;
  v5 = (void *)_s22CloudKitImplementation23CPLCKUtilitiesOperationC14deleteAllZones17completionHandlerSo010CKDatabaseE0CySb_s5Error_pSgtc_tFZ_0( (uint64_t)sub_100113E04,  v4);
  swift_release(v4);
  return v5;
}

- (CPLCKUtilitiesOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CPLCKUtilitiesOperation();
  return -[CPLCKUtilitiesOperation init](&v3, "init");
}

@end