@interface AXPrefsBridge
+ (void)voiceSelectionForLanguageCode:(NSString *)a3 completionHandler:(id)a4;
- (_TtC15assistivetouchd13AXPrefsBridge)init;
@end

@implementation AXPrefsBridge

+ (void)voiceSelectionForLanguageCode:(NSString *)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_1001253B0, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_1001253D8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100157428;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_100125400, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100157438;
  v13[5] = v12;
  v14 = a3;
  uint64_t v15 = sub_1000ADC6C((uint64_t)v8, (uint64_t)&unk_100157448, (uint64_t)v13);
  swift_release(v15);
}

- (_TtC15assistivetouchd13AXPrefsBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXPrefsBridge();
  return -[AXPrefsBridge init](&v3, "init");
}

@end