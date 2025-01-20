@interface ClientServerInstance
- (void)createSessionWith:(int64_t)a3;
- (void)destroySessionFor:(int64_t)a3;
- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4;
- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4;
- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6;
- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6;
- (void)setWithConfiguration:(id)a3 for:(int64_t)a4;
- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4;
- (void)startSessionFor:(int64_t)a3;
- (void)stopSessionFor:(int64_t)a3;
- (void)validateFor:(int64_t)a3 completion:(id)a4;
@end

@implementation ClientServerInstance

- (void)createSessionWith:(int64_t)a3
{
}

- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4
{
}

- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10003D6A8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_retain(self);
  sub_100008624( a3,  (uint64_t)sub_10000B6F8,  v7,  (uint64_t)&unk_10003D6D0,  (uint64_t)sub_10000B744,  (uint64_t)&unk_10003D6E8);
  swift_release(self);
  swift_release(v7);
}

- (void)setWithConfiguration:(id)a3 for:(int64_t)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  swift_retain(self);
  sub_100007D38(v6, a4);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
}

- (void)validateFor:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10003D568, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_retain(self);
  sub_100008624( a3,  (uint64_t)sub_10000B65C,  v7,  (uint64_t)&unk_10003D590,  (uint64_t)sub_10000B670,  (uint64_t)&unk_10003D5A8);
  swift_release(self);
  swift_release(v7);
}

- (void)startSessionFor:(int64_t)a3
{
}

- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6
{
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  swift_retain(self);
  sub_100008F54(v10, a4, a5, a6);
  swift_release(self);
  swift_bridgeObjectRelease(v10);
}

- (void)stopSessionFor:(int64_t)a3
{
}

- (void)destroySessionFor:(int64_t)a3
{
}

- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_10003D3B0, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  swift_retain(self);
  sub_10000A460(a3, a4, a5, (uint64_t)sub_10000B5CC, v11);
  swift_release(self);
  swift_release(v11);
}

- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10003D338, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_retain(self);
  sub_10000AC5C(a3, (uint64_t)sub_10000B5AC, v7);
  swift_release(self);
  swift_release(v7);
}

@end