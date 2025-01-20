@interface CSDAVCMoments
- (CSDAVCMomentsDelegate)delegate;
- (_TtC13callservicesd13CSDAVCMoments)init;
- (_TtC13callservicesd13CSDAVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6;
- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5;
- (int)activeRequestCount;
- (int)pendingRequestCount;
- (int64_t)streamToken;
- (unsigned)capabilities;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 url:(id)a5 error:(id)a6;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSDAVCMoments

- (CSDAVCMomentsDelegate)delegate
{
  return (CSDAVCMomentsDelegate *)(id)sub_1002A6C7C();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_1002A6CD8((uint64_t)a3);
}

- (_TtC13callservicesd13CSDAVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v11 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v11 = 0LL;
  }

  swift_unknownObjectRetain(a5);
  id v12 = a6;
  return (_TtC13callservicesd13CSDAVCMoments *)sub_1002A6D0C(a3, v9, v11, (uint64_t)a5, a6);
}

- (int64_t)streamToken
{
  v2 = self;
  id v3 = sub_1002A6ED8();

  return (int64_t)v3;
}

- (unsigned)capabilities
{
  v2 = self;
  unsigned int v3 = sub_1002A6FA0((SEL *)&selRef_capabilities);

  return v3;
}

- (int)activeRequestCount
{
  v2 = self;
  int v3 = sub_1002A6FA0((SEL *)&selRef_activeRequestCount);

  return v3;
}

- (int)pendingRequestCount
{
  v2 = self;
  int v3 = sub_1002A6FA0((SEL *)&selRef_pendingRequestCount);

  return v3;
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5
{
  v6 = (void *)a3;
  if (a5)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = self;
  id v12 = sub_1002A6FC0(v6, a4, v8, v10);

  swift_bridgeObjectRelease(v10);
  return v12;
}

- (_TtC13callservicesd13CSDAVCMoments)init
{
}

- (void).cxx_destruct
{
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = self;
  sub_1002A7170((uint64_t)v7, v4);
}

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 url:(id)a5 error:(id)a6
{
  uint64_t v7 = sub_1001AFF14((uint64_t *)&unk_100447DE0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = 1LL;
  }

  sub_1001A9670((uint64_t)v9, v11, 1LL, v10);
  sub_100213054((uint64_t)v9);
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7
{
  uint64_t v13 = sub_1001AFF14((uint64_t *)&unk_100447DE0);
  uint64_t v14 = __chkstk_darwin(v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  v18 = (char *)&v27 - v17;
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v19 = type metadata accessor for URL(0LL);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v19 = type metadata accessor for URL(0LL);
    uint64_t v20 = 1LL;
  }

  uint64_t v21 = 1LL;
  sub_1001A9670((uint64_t)v18, v20, 1LL, v19);
  if (a6)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v21 = 0LL;
  }

  uint64_t v22 = type metadata accessor for URL(0LL);
  sub_1001A9670((uint64_t)v16, v21, 1LL, v22);
  id v23 = a3;
  id v24 = a4;
  id v25 = a7;
  v26 = self;
  sub_1002A73DC((uint64_t)v26, (uint64_t)v24, (uint64_t)v18, (uint64_t)v16, a7);

  sub_100213054((uint64_t)v16);
  sub_100213054((uint64_t)v18);
}

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002A76DC();
}

@end