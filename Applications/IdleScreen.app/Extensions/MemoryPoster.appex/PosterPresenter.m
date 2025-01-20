@interface PosterPresenter
- (_TtC12MemoryPoster15PosterPresenter)init;
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

- (_TtC12MemoryPoster15PosterPresenter)init
{
  return (_TtC12MemoryPoster15PosterPresenter *)sub_10000F7FC();
}

- (void).cxx_destruct
{
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_10000F9E8(a3, a4);

  swift_unknownObjectRelease(a4);
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = a5;
  v8 = self;
  sub_100011F48((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4);
}

- (void)renderer:(id)a3 didReceiveEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = self;
  sub_1000126F8(a3, a4);
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100013428((uint64_t)a3);
}

  ;
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  id v6 = self;
  sub_100013BE8();

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
  sub_100013C78();

  swift_unknownObjectRelease(a4);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v9 = sub_100013D28();

  sub_100019ED8();
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
  sub_100013DEC();

  swift_unknownObjectRelease(a4);
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  id v4 = a3;
  uint64_t v9 = _Block_copy(a4);
  id v5 = self;
  id v6 = (void *)swift_allocObject(&unk_1000215F0, 40LL, 7LL);
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_100004D14((uint64_t)&unk_100026138, (uint64_t)v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000140A0();
}

- (void)service:(id)a3 didUpdateSnapshotWithTraits:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100014110((uint64_t)a3, a4);
}

@end