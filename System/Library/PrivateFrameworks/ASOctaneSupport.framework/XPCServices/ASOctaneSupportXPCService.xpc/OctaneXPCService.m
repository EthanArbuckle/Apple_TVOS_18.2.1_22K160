@interface OctaneXPCService
- (_TtC25ASOctaneSupportXPCService16OctaneXPCService)init;
- (void)appRemovedWithBundleID:(id)a3 withReply:(id)a4;
- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4;
- (void)buyProductWithID:(id)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)clearOverridesForBundleID:(id)a3 withReply:(id)a4;
- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(NSString *)a5 withReply:(id)a6;
- (void)deleteAllTransactionsForBundleID:(id)a3 withRelpy:(id)a4;
- (void)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)generateSKANPostbackSignature:(id)a3 withReply:(id)a4;
- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)getPortWithReply:(id)a3;
- (void)getStorefrontForBundleID:(id)a3 withReply:(id)a4;
- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)getTransactionDataForBundleID:(id)a3 withReply:(id)a4;
- (void)messageForBundleID:(id)a3 withReply:(id)a4;
- (void)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4 withReply:(id)a5;
- (void)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)registerForEventOfType:(int64_t)a3 filterData:(id)a4 withReply:(id)a5;
- (void)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)setStorefront:(id)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(NSString *)a4 needsConsent:(BOOL)a5 withReply:(id)a6;
- (void)startServingConfiguration:(id)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)unregisterForEventWithIdentifier:(id)a3;
@end

@implementation OctaneXPCService

- (void)appRemovedWithBundleID:(id)a3 withReply:(id)a4
{
}

- (void)buyProductWithID:(id)a3 bundleID:(id)a4 withReply:(id)a5
{
}

- (void)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
}

- (void)clearOverridesForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
}

- (void)deleteAllTransactionsForBundleID:(id)a3 withRelpy:(id)a4
{
}

- (void)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5 withReply:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v16 = v15;
  _Block_copy(v10);
  v17 = self;
  sub_10015802C(v11, v13, a4, v14, v16, (uint64_t)v17, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)getPortWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100158258((int)v5, v4);
  _Block_release(v4);
}

- (void)getStorefrontForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)getTransactionDataForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStorefront:(id)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)startServingConfiguration:(id)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  _Block_copy(v8);
  uint64_t v12 = self;
  sub_1001588C8(a3, v9, v11, (int)v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
}

- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v16 = v15;
  _Block_copy(v10);
  v17 = self;
  sub_100158BC8(v11, v13, a4, v14, v16, (uint64_t)v17, (void (**)(void, void))v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)registerForEventOfType:(int64_t)a3 filterData:(id)a4 withReply:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a4;
  uint64_t v14 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v12 = v11;

  uint64_t v13 = swift_allocObject(&unk_10028ABF0, 24LL, 7LL);
  *(void *)(v13 + 16) = v8;
  sub_100158D58(a3, v10, v12, (uint64_t)sub_10016073C, v13);
  swift_release();
  sub_10003A9EC(v10, v12);
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v9 = self;
  sub_100159120((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)messageForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4 withReply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;
  _Block_copy(v8);
  id v12 = a4;
  uint64_t v13 = self;
  sub_1001594A0(v9, v11, v12, (uint64_t)v13, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(NSString *)a4 needsConsent:(BOOL)a5 withReply:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_10028ABC8, 56LL, 7LL);
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(_BYTE *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  id v12 = a4;
  uint64_t v13 = self;
  sub_100159B88((uint64_t)&unk_1002B6FD0, v11);
}

- (void)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(NSString *)a5 withReply:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_10028AB50, 56LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  id v12 = a5;
  uint64_t v13 = self;
  sub_100159B88((uint64_t)&unk_1002B6FA0, v11);
}

- (void)generateSKANPostbackSignature:(id)a3 withReply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  LODWORD(a3) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_100159E0C((int)a3, (int)v7, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
}

- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10015A158(v8, v10, (int)v11, v6);
  _Block_release(v6);
  sub_10003A9EC(v8, v10);
}

- (_TtC25ASOctaneSupportXPCService16OctaneXPCService)init
{
  return (_TtC25ASOctaneSupportXPCService16OctaneXPCService *)sub_10015FF6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ASOctaneSupportXPCService16OctaneXPCService_serverQueue));
}

@end