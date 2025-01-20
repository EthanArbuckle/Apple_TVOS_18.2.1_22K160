@interface DialogProducingIntentHandler
- (NSString)description;
- (_TtC23AudioFlowDelegatePlugin28DialogProducingIntentHandler)init;
- (void)handlePlayMedia:(INPlayMediaIntent *)a3 completion:(id)a4;
@end

@implementation DialogProducingIntentHandler

- (void)handlePlayMedia:(INPlayMediaIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_6C5C(&qword_287688);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_26E0F8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_26E120, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_287698;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_26E148, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_2876A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_BBB3C((uint64_t)v9, (uint64_t)&unk_2876B8, (uint64_t)v14);
  swift_release(v17);
}

- (NSString)description
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC23AudioFlowDelegatePlugin28DialogProducingIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DialogProducingIntentHandler();
  return -[DialogProducingIntentHandler init](&v3, "init");
}

@end