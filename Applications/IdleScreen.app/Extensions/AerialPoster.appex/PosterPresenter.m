@interface PosterPresenter
- (_TtC12AerialPoster15PosterPresenter)init;
- (id)looksForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didReceiveEvent:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
- (void)service:(id)a3 didUpdateSnapshotWithTraits:(unint64_t)a4;
@end

@implementation PosterPresenter

- (_TtC12AerialPoster15PosterPresenter)init
{
  return (_TtC12AerialPoster15PosterPresenter *)sub_100007248();
}

- (void).cxx_destruct
{
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_100007434(a3, a4);

  swift_unknownObjectRelease(a4);
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = a5;
  v8 = self;
  sub_1000086C4((uint64_t)a3, a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4);
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008EA0((uint64_t)a3);
}

- (void)renderer:(id)a3 didReceiveEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = self;
  sub_1000095D4((uint64_t)a3, a4);
}

  ;
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  id v6 = self;
  sub_100009FB0();

  swift_unknownObjectRelease(a4);
}

  ;
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = a5;
  v8 = self;
  sub_10000A040();

  swift_unknownObjectRelease(a4);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v9 = sub_10000A0F0();

  sub_10000E750();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

  ;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = a5;
  v8 = self;
  sub_10000A1B4();

  swift_unknownObjectRelease(a4);
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  id v4 = a3;
  uint64_t v9 = _Block_copy(a4);
  id v5 = self;
  id v6 = (void *)swift_allocObject(&unk_100014EB0, 40LL, 7LL);
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_100003424((uint64_t)&unk_100019F48, (uint64_t)v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000A468();
}

- (void)service:(id)a3 didUpdateSnapshotWithTraits:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10000A4D8((uint64_t)a3, a4);
}

@end