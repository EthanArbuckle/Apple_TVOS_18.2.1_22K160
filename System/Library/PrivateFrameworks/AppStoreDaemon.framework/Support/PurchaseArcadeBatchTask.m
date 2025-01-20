@interface PurchaseArcadeBatchTask
- (ASDPurchaseResponse)purchaseResponse;
- (_TtC9appstored23PurchaseArcadeBatchTask)init;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemIDs:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithoutKeepAlive;
- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 purchase:(AMSPurchase *)a4 purchaseQueue:(AMSPurchaseQueue *)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
- (void)setPurchaseResponse:(id)a3;
@end

@implementation PurchaseArcadeBatchTask

- (ASDPurchaseResponse)purchaseResponse
{
  return (ASDPurchaseResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                        + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse));
}

- (void)setPurchaseResponse:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse) = (Class)a3;
  id v3 = a3;
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemIDs:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v12 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int64);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemIDs) = v12;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_additionalBuyParams) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_client);
  uint64_t *v15 = v13;
  v15[1] = v14;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_logKey) = (Class)a6;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemMetadata) = 0LL;
  v18.receiver = self;
  v18.super_class = ObjectType;
  id v16 = a6;
  return -[Task init](&v18, "init");
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6
{
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for Int64,  (char *)&type metadata for Any + 8,  &protocol witness table for Int64);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  if (a5)
  {
    a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v11 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v12 = a6;
  uint64_t v13 = (_TtC9appstored23PurchaseArcadeBatchTask *)sub_100063FA4(v9, (uint64_t)a4, (uint64_t)a5, v11, v12);

  return v13;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003DF400, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DF428, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100459D08;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject(&unk_1003DF450, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100459D10;
  v12[5] = v11;
  uint64_t v13 = self;
  uint64_t v14 = sub_100083C10((uint64_t)v7, (uint64_t)&unk_100459D18, (uint64_t)v12);
  swift_release(v14);
}

- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 purchase:(AMSPurchase *)a4 purchaseQueue:(AMSPurchaseQueue *)a5 completion:(id)a6
{
  uint64_t v11 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject(&unk_1003DF310, 56LL, 7LL);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  v17 = (void *)swift_allocObject(&unk_1003DF338, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_100459CD8;
  v17[5] = v15;
  objc_super v18 = (void *)swift_allocObject(&unk_1003DF360, 48LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_1004584A0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  uint64_t v23 = sub_100083C10((uint64_t)v13, (uint64_t)&unk_100459580, (uint64_t)v18);
  swift_release(v23);
}

- (_TtC9appstored23PurchaseArcadeBatchTask)init
{
  result = (_TtC9appstored23PurchaseArcadeBatchTask *)_swift_stdlib_reportUnimplementedInitializer( "appstored.PurchaseArcadeBatchTask",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithoutKeepAlive
{
  result = (_TtC9appstored23PurchaseArcadeBatchTask *)_swift_stdlib_reportUnimplementedInitializer( "appstored.PurchaseArcadeBatchTask",  33LL,  "init(withoutKeepAlive:)",  23LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_additionalBuyParams));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemMetadata));
  swift_bridgeObjectRelease(*(id *)((char *)&self->super.super.super._private
                                  + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_client));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_logKey));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse));
}

@end