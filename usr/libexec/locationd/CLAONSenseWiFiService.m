@interface CLAONSenseWiFiService
+ (_TtC10CLAONSense21CLAONSenseWiFiService)shared;
- (BOOL)isAvailable;
- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 error:(id *)a4 callback:(id)a5;
- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 intervalSec:(float)a4 error:(id *)a5 callback:(id)a6;
- (_TtC10CLAONSense21CLAONSenseWiFiService)init;
@end

@implementation CLAONSenseWiFiService

+ (_TtC10CLAONSense21CLAONSenseWiFiService)shared
{
  if (qword_1019A0528 != -1) {
    swift_once(&qword_1019A0528, sub_1010684BC);
  }
  return (_TtC10CLAONSense21CLAONSenseWiFiService *)(id)qword_1019A4158;
}

- (BOOL)isAvailable
{
  return isAvailable()();
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 intervalSec:(float)a4 error:(id *)a5 callback:(id)a6
{
  uint64_t v10 = sub_10015E6AC(&qword_101993110);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  v13 = _Block_copy(a6);
  uint64_t v15 = type metadata accessor for ALResultOptions(0LL, v14);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  id v16 = a3;
  v17 = self;
  v20[4] = 0;
  sub_101069F00(v16, v18, LODWORD(a4));
  sub_10015E7F8((uint64_t)v12, &qword_101993110);

  _Block_release(v13);
  return 1;
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 error:(id *)a4 callback:(id)a5
{
  uint64_t v8 = sub_10015E6AC(&qword_101993110);
  __chkstk_darwin(v8);
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject(&unk_101898478, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  v13 = *(double (**)(uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xC8);
  id v14 = a3;
  uint64_t v15 = self;
  swift_retain(v12);
  double v16 = v13(sub_10106A550, v12);
  uint64_t v17 = type metadata accessor for ALResultOptions(0LL, v16);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v10, 1LL, 1LL, v17);
  v20[4] = 1;
  sub_101069F00(v14, v18, 0x100000000uLL);
  sub_10015E7F8((uint64_t)v10, &qword_101993110);
  swift_release(v12);

  return 1;
}

- (_TtC10CLAONSense21CLAONSenseWiFiService)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_requester) = 0LL;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_desc);
  void *v3 = 0LL;
  v3[1] = 0LL;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback);
  v5 = (objc_class *)type metadata accessor for CLAONSenseWiFiService();
  void *v4 = 0LL;
  v4[1] = 0LL;
  v7.receiver = self;
  v7.super_class = v5;
  return -[CLAONSenseWiFiService init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end