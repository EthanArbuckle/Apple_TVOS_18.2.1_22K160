@interface Client
- (_TtC13MediaRemoteUI6Client)init;
- (int64_t)hash;
- (void)connectForBannerPresentation:(id)a3 reply:(id)a4;
- (void)revokeAllBannersWithReply:(id)a3;
- (void)revokeBannerWithIdentifier:(id)a3 withReply:(id)a4;
@end

@implementation Client

- (void)connectForBannerPresentation:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100010A38, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100004C30(v8, (uint64_t)sub_10000872C, v7);

  swift_release(v7);
}

- (void)revokeAllBannersWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100010A10, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  uint64_t v7 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  os_log(_:dso:log:_:_:)( v7,  &_mh_execute_header,  qword_100016D90,  "[MainServer] revokeAllBanners",  29LL,  2LL,  &_swiftEmptyArrayStorage);
  sub_100009600(0x757165722044524DLL, 0xEB00000000747365LL, (uint64_t)sub_10000872C, v5);

  swift_release(v5);
}

- (void)revokeBannerWithIdentifier:(id)a3 withReply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_1000109E8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  v11 = self;
  sub_100004FD0(v7, v9, (uint64_t)sub_100008724, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = UUID.hashValue.getter();

  return v3;
}

- (_TtC13MediaRemoteUI6Client)init
{
  result = (_TtC13MediaRemoteUI6Client *)_swift_stdlib_reportUnimplementedInitializer( "MediaRemoteUI.Client",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI6Client_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end