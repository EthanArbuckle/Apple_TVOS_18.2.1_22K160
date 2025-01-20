@interface DownloadManager
- (_TtC7parsecd15DownloadManager)init;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)bagChangeNotificationWithNotification:(id)a3;
@end

@implementation DownloadManager

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10006EB34();
}

- (_TtC7parsecd15DownloadManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  uint64_t v11 = type metadata accessor for URLRequest(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v15 = _Block_copy(a6);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a5);
  _Block_copy(v15);
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  sub_1000730A4((uint64_t)v16, v17, (uint64_t)v14, (char *)v18, (void (**)(void, void, void))v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_100073ED0();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_10007543C();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end