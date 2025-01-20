@interface objc_MessageServerResponse
- (BOOL)shouldAllowDeveloperControl;
- (NSURL)url;
- (_TtC9storekitd26objc_MessageServerResponse)init;
- (_TtC9storekitd26objc_MessageServerResponse)initWithUrl:(id)a3 shouldAllowDevloperControl:(BOOL)a4 messageType:(id)a5;
- (int64_t)messageType;
@end

@implementation objc_MessageServerResponse

- (NSURL)url
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000CFD94((uint64_t)v5);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (BOOL)shouldAllowDeveloperControl
{
  return sub_1000CFDF8() & 1;
}

- (int64_t)messageType
{
  return sub_1000CFE28();
}

- (_TtC9storekitd26objc_MessageServerResponse)initWithUrl:(id)a3 shouldAllowDevloperControl:(BOOL)a4 messageType:(id)a5
{
  uint64_t v8 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v11 = type metadata accessor for URL(0LL);
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v11 = type metadata accessor for URL(0LL);
    uint64_t v12 = 1LL;
  }

  sub_10007D0AC((uint64_t)v10, v12, 1LL, v11);
  id v13 = a5;
  return (_TtC9storekitd26objc_MessageServerResponse *)sub_1000CFE38((uint64_t)v10, a4, a5);
}

- (_TtC9storekitd26objc_MessageServerResponse)init
{
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC9storekitd26objc_MessageServerResponse_url;
  uint64_t v3 = sub_100086318();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end