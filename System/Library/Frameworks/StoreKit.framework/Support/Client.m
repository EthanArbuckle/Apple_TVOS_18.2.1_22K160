@interface Client
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)processInfo;
- (AMSURLRequestEncoder)urlRequestEncoder;
- (AMSURLSession)urlSession;
- (BOOL)canMakePayments;
- (BOOL)hasEverHadIAPs;
- (BOOL)hasMIDBasedSINF;
- (BOOL)isAlmond;
- (BOOL)isAppStoreSigned;
- (BOOL)isBeta;
- (BOOL)isClip;
- (NSString)accountMediaType;
- (NSString)callerBundleID;
- (NSString)currentAccountToken;
- (NSString)localizedName;
- (NSString)objc_clientDescription;
- (NSString)requestBundleID;
- (NSString)requestBundleVersion;
- (NSString)signerOrganization;
- (NSString)vendorName;
- (NSURL)callerBundleURL;
- (NSUUID)deviceVendorID;
- (_TtC9storekitd6Client)init;
- (_TtC9storekitd6Client)initWithAuditTokenData:(id)a3;
- (_TtC9storekitd6Client)initWithBundleIdentifier:(id)a3;
- (_TtC9storekitd6Client)initWithConnection:(id)a3 overridesDictionary:(id)a4;
- (_TtC9storekitd6Client)initWithURL:(id)a3 overridesDictionary:(id)a4;
- (char)objc_clientType;
- (id)queryWith:(BOOL)a3 customReceiptURL:(id)a4;
- (unint64_t)storeExternalVersionID;
- (unint64_t)storeItemID;
@end

@implementation Client

- (ACAccount)account
{
  v2 = self;
  sub_1000DF90C();
  v4 = v3;

  return (ACAccount *)v4;
}

- (NSString)accountMediaType
{
  v2 = self;
  id v3 = sub_1000DF87C();

  return (NSString *)v3;
}

- (AMSBagProtocol)bag
{
  v2 = self;
  sub_1000DEA24();
  v4 = v3;

  return (AMSBagProtocol *)v4;
}

- (NSString)callerBundleID
{
  return (NSString *)sub_1000E0EAC((uint64_t)self, (uint64_t)a2, sub_1000DFF2C);
}

- (NSURL)callerBundleURL
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000DFFD8();
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (BOOL)canMakePayments
{
  uint64_t v2 = self;
  sub_1000E0044();
  char v4 = v3;

  return v4 & 1;
}

- (NSString)currentAccountToken
{
  uint64_t v2 = self;
  sub_1000E07B4();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (NSUUID)deviceVendorID
{
  uint64_t v2 = sub_10007B1FC(&qword_10032A3D0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000E0CEC((uint64_t)v4);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  Class isa = 0LL;
  if (sub_10007D824((uint64_t)v4, 1LL, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }

  return (NSUUID *)isa;
}

- (BOOL)hasEverHadIAPs
{
  return sub_1000E0D3C() & 1;
}

- (BOOL)isAlmond
{
  return sub_1000E0D6C() & 1;
}

- (BOOL)isAppStoreSigned
{
  return sub_1000E0D9C() & 1;
}

- (BOOL)isBeta
{
  return sub_1000E0DCC() & 1;
}

- (BOOL)isClip
{
  return 0;
}

- (NSString)localizedName
{
  return (NSString *)sub_1000E0EAC((uint64_t)self, (uint64_t)a2, sub_1000E0DEC);
}

- (BOOL)hasMIDBasedSINF
{
  return sub_1000E0E34() & 1;
}

- (AMSProcessInfo)processInfo
{
  uint64_t v2 = self;
  id v3 = sub_1000DF468();

  return (AMSProcessInfo *)v3;
}

- (NSString)requestBundleID
{
  return (NSString *)sub_1000E0EAC((uint64_t)self, (uint64_t)a2, sub_1000E0E7C);
}

- (NSString)requestBundleVersion
{
  return (NSString *)sub_1000E0EAC((uint64_t)self, (uint64_t)a2, sub_1000E0EDC);
}

- (NSString)signerOrganization
{
  return (NSString *)sub_1000E1040((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9storekitd6Client_signerOrganization);
}

- (unint64_t)storeExternalVersionID
{
  return sub_1000E0F38();
}

- (unint64_t)storeItemID
{
  return sub_1000E0F68();
}

- (AMSURLRequestEncoder)urlRequestEncoder
{
  uint64_t v2 = self;
  sub_1000DF9D4();
  uint64_t v4 = v3;

  return (AMSURLRequestEncoder *)v4;
}

- (AMSURLSession)urlSession
{
  uint64_t v2 = self;
  sub_1000DF67C();
  uint64_t v4 = v3;

  return (AMSURLSession *)v4;
}

- (NSString)vendorName
{
  return (NSString *)sub_1000E1040((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9storekitd6Client_vendorName);
}

- (_TtC9storekitd6Client)initWithConnection:(id)a3 overridesDictionary:(id)a4
{
  if (a4)
  {
    type metadata accessor for SKClientOverridesKey(0LL);
    uint64_t v7 = v6;
    sub_10007ACCC( &qword_100329068,  (uint64_t (*)(uint64_t))type metadata accessor for SKClientOverridesKey,  (uint64_t)&unk_10027A228);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, (char *)&type metadata for Any + 8);
  }

  id v8 = a3;
  sub_1000E10AC();
  return result;
}

- (_TtC9storekitd6Client)initWithURL:(id)a3 overridesDictionary:(id)a4
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    type metadata accessor for SKClientOverridesKey(0LL);
    uint64_t v8 = v7;
    sub_10007ACCC( &qword_100329068,  (uint64_t (*)(uint64_t))type metadata accessor for SKClientOverridesKey,  (uint64_t)&unk_10027A228);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8);
  }

  sub_1000E1D7C();
  return result;
}

- (_TtC9storekitd6Client)initWithBundleIdentifier:(id)a3
{
  return result;
}

- (_TtC9storekitd6Client)initWithAuditTokenData:(id)a3
{
  id v4 = a3;
  static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  sub_1000E38A0();
  return result;
}

- (id)queryWith:(BOOL)a3 customReceiptURL:(id)a4
{
  uint64_t v6 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v9 = type metadata accessor for URL(0LL);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = type metadata accessor for URL(0LL);
    uint64_t v10 = 1LL;
  }

  sub_10007D0AC((uint64_t)v8, v10, 1LL, v9);
  v11 = self;
  sub_1000DED8C();
  uint64_t v13 = v12;

  sub_100085298((uint64_t)v8, (uint64_t *)&unk_10032A1C0);
  type metadata accessor for SKServerKey(0LL);
  sub_10007ACCC( &qword_100329078,  (uint64_t (*)(uint64_t))type metadata accessor for SKServerKey,  (uint64_t)&unk_10027A268);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  return isa;
}

- (_TtC9storekitd6Client)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = sub_1000E98B4();
  v4(v3);
  sub_100085298((uint64_t)self + OBJC_IVAR____TtC9storekitd6Client_deviceVendorID, &qword_10032A3D0);
  sub_1000E94A0(OBJC_IVAR____TtC9storekitd6Client_localizedName);
  sub_1000E94A0(OBJC_IVAR____TtC9storekitd6Client_requestBundleID);
  sub_1000E94A0(OBJC_IVAR____TtC9storekitd6Client_requestBundleVersion);
  sub_100085298((uint64_t)self + OBJC_IVAR____TtC9storekitd6Client_serverOverride, &qword_10032B578);
  sub_1000E94A0(OBJC_IVAR____TtC9storekitd6Client_signerOrganization);
  swift_bridgeObjectRelease(*(void *)&self->auditToken[OBJC_IVAR____TtC9storekitd6Client_vendorName]);
}

- (char)objc_clientType
{
  uint64_t v2 = self;
  sub_1000DFAF0();
  char v4 = v3;

  return v4;
}

- (NSString)objc_clientDescription
{
  uint64_t v2 = self;
  sub_1000E7F00();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end