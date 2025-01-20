@interface PosterPresenter
- (_TtC19PortraitClockPoster15PosterPresenter)init;
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
@end

@implementation PosterPresenter

- (_TtC19PortraitClockPoster15PosterPresenter)init
{
  return (_TtC19PortraitClockPoster15PosterPresenter *)sub_10000694C();
}

- (void).cxx_destruct
{
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_100006B24(a3, a4);

  swift_unknownObjectRelease(a4);
}

  ;
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = a5;
  v8 = self;
  sub_100007D1C();

  swift_unknownObjectRelease(a4);
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100007DCC((uint64_t)a3);
}

- (void)renderer:(id)a3 didReceiveEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = self;
  sub_10000848C((uint64_t)a3, a4);
}

  ;
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  id v6 = self;
  sub_100008DA0();

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
  sub_100008E30();

  swift_unknownObjectRelease(a4);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v9 = sub_100008EE0();

  sub_10000B6A0();
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
  sub_100008FA4();

  swift_unknownObjectRelease(a4);
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  id v4 = a3;
  uint64_t v9 = _Block_copy(a4);
  id v5 = self;
  id v6 = (void *)swift_allocObject(&unk_100014ED0, 40LL, 7LL);
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_100009258((uint64_t)&unk_100019C18, (uint64_t)v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100009390();
}

@end