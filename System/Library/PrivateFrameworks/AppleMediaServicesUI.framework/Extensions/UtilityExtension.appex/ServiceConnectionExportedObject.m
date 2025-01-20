@interface ServiceConnectionExportedObject
- (void)bootstrapWithAccount:(id)a3 bagData:(id)a4 clientInfo:(id)a5 mediaClientData:(id)a6 metricsContextData:(id)a7 url:(id)a8 completion:(id)a9;
- (void)performWithRequestData:(id)a3 completion:(id)a4;
- (void)setUpWithCompletion:(id)a3;
- (void)tearDownWithCompletion:(id)a3;
- (void)updateWithAccount:(id)a3 completion:(id)a4;
@end

@implementation ServiceConnectionExportedObject

- (void)bootstrapWithAccount:(id)a3 bagData:(id)a4 clientInfo:(id)a5 mediaClientData:(id)a6 metricsContextData:(id)a7 url:(id)a8 completion:(id)a9
{
  id v38 = a3;
  v36 = self;
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v40 = *(void *)(v16 - 8);
  uint64_t v41 = v16;
  __chkstk_darwin(v16, v17);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v20 = _Block_copy(a9);
  id v39 = a3;
  id v21 = a4;
  id v37 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  swift_retain(self);
  uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v27 = v26;

  uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v22);
  unint64_t v30 = v29;

  uint64_t v31 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);
  unint64_t v33 = v32;

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v24);
  _Block_copy(v20);
  v34 = v36;
  v35 = v37;
  sub_100034AF4(v38, v25, v27, v37, v28, v30, v31, v33, (uint64_t)v19, (unint64_t)v36, v20);
  _Block_release(v20);
  sub_100024968(v31, v33);
  sub_100024968(v28, v30);
  sub_100024968(v25, v27);

  swift_release(v34);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v41);
}

- (void)performWithRequestData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain(self);
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_100036714(v8, v10, (uint64_t)self, v6);
  _Block_release(v6);
  sub_100024968(v8, v10);
  swift_release(self);
}

- (void)setUpWithCompletion:(id)a3
{
}

- (void)tearDownWithCompletion:(id)a3
{
}

- (void)updateWithAccount:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain(self);
  sub_100037854(a3, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_release(self);
}

@end