@interface FinderStateTrampoline
- (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline)init;
- (void)disableFinderModeWithCompletion:(id)a3;
- (void)enableFinderModeWithCompletion:(id)a3;
- (void)fetchFinderState:(id)a3;
- (void)setActiveCache:(int64_t)a3 completion:(id)a4;
- (void)start;
- (void)stateInfoWithCompletion:(id)a3;
@end

@implementation FinderStateTrampoline

- (void)start
{
  v3 = self;
  id v5 = (id)static OS_os_log.default.getter(v3);
  uint64_t v4 = static os_log_type_t.default.getter(v5);
  os_log(_:dso:log:type:_:)( "Kickstarting daemon for finding state manager callback",  54LL,  2LL,  &_mh_execute_header,  v5,  v4,  _swiftEmptyArrayStorage);
}

- (void)enableFinderModeWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100972600, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_1001B9018();
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter(v6);
  uint64_t v8 = static os_log_type_t.default.getter(v7);
  os_log(_:dso:log:type:_:)( "Trampolining enableFinderMode",  29LL,  2LL,  &_mh_execute_header,  v7,  v8,  _swiftEmptyArrayStorage);

  sub_100013044( (uint64_t)v6 + OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation,  (uint64_t)v11);
  uint64_t v9 = v12;
  uint64_t v10 = v13;
  sub_100012ED8(v11, v12);
  (*(void (**)(uint64_t (*)(void), uint64_t, uint64_t, uint64_t))(v10 + 8))( sub_10009C9E4,  v5,  v9,  v10);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)disableFinderModeWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009725D8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_1001B9018();
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter(v6);
  uint64_t v8 = static os_log_type_t.default.getter(v7);
  os_log(_:dso:log:type:_:)( "Trampolining disableFinderMode",  30LL,  2LL,  &_mh_execute_header,  v7,  v8,  _swiftEmptyArrayStorage);

  sub_100013044( (uint64_t)v6 + OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation,  (uint64_t)v11);
  uint64_t v9 = v12;
  uint64_t v10 = v13;
  sub_100012ED8(v11, v12);
  (*(void (**)(uint64_t (*)(void), uint64_t, uint64_t, uint64_t))(v10 + 16))( sub_10009C9E4,  v5,  v9,  v10);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)fetchFinderState:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009725B0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100691A7C((uint64_t)sub_1002DAFF8, v5);

  swift_release();
}

- (void)stateInfoWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100972560, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_100013044( (uint64_t)self + OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation,  (uint64_t)v11);
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  sub_100012ED8(v11, v12);
  uint64_t v8 = swift_allocObject(&unk_100972588, 32LL, 7LL);
  *(void *)(v8 + 16) = sub_10009C458;
  *(void *)(v8 + 24) = v5;
  uint64_t v9 = *(void (**)(void (*)(void *, char), uint64_t, uint64_t, uint64_t))(v7 + 24);
  uint64_t v10 = self;
  swift_retain();
  v9(sub_10069301C, v8, v6, v7);
  swift_release();
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)setActiveCache:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100972538, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_100691DA8(a3, (uint64_t)sub_10009C044, v7);

  swift_release();
}

- (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline)init
{
  result = (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.FinderStateTrampoline",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation));
}

@end