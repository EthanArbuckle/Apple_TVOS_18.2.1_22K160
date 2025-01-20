@interface SharePlayAttributionViewModel
- (MPCPlayerResponseParticipant)_participant;
- (MPCPlayerResponseParticipant)participant;
- (_TtC7TVMusic29SharePlayAttributionViewModel)init;
- (id)makeView;
- (void)setParticipant:(id)a3;
- (void)set_participant:(id)a3;
@end

@implementation SharePlayAttributionViewModel

- (MPCPlayerResponseParticipant)_participant
{
  return (MPCPlayerResponseParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__participant));
}

- (void)set_participant:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__participant);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__participant) = (Class)a3;
  id v5 = a3;
  v6 = self;
  sub_100125D08(v4);
}

- (MPCPlayerResponseParticipant)participant
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB928);
  v8 = self;
  uint64_t v4 = sub_1000DF308( &qword_1002B89E0,  type metadata accessor for SharePlayAttributionViewModel,  (uint64_t)&unk_1001EB90C);
  id v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  v6 = (MPCPlayerResponseParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v5->super.isa
                                                                               + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__participant));

  return v6;
}

- (void)setParticipant:(id)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB928);
  v8 = self;
  sub_1000DF308(&qword_1002B89E0, type metadata accessor for SharePlayAttributionViewModel, (uint64_t)&unk_1001EB90C);
  id v6 = a3;
  v7 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_1000FF150);

  swift_release(KeyPath);
}

- (id)makeView
{
  uint64_t v2 = qword_1002B71C0;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_1002B71C0, sub_100143D6C);
  }
  v7[0] = (id)qword_1002C5E58;
  v7[1] = v3;
  v7[2] = static SafeAreaRegions.all.getter(v7[0]);
  char v8 = static Edge.Set.all.getter();
  id v4 = objc_allocWithZone((Class)sub_1000DFE10(&qword_1002B89C8));
  id v5 = (void *)_UIHostingView.init(rootView:)(v7);
  dispatch thunk of _UIHostingView.invalidatesIntrinsicContentSizeOnIdealSizeChange.setter(1LL);

  return v5;
}

- (_TtC7TVMusic29SharePlayAttributionViewModel)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__participant) = 0LL;
  v3 = (char *)self + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__image;
  uint64_t v4 = type metadata accessor for SharePlayAttributionViewModel.ImageType(0LL);
  id v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL);
  v5(v3, 1LL, 1LL, v4);
  uint64_t v6 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v5)(v3, 1LL, 1LL, v4);
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__displayName);
  void *v7 = 0LL;
  v7[1] = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__updateImageTask) = 0LL;
  ObservationRegistrar.init()(v6);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SharePlayAttributionViewModel(0LL);
  return -[SharePlayAttributionViewModel init](&v9, "init");
}

- (void).cxx_destruct
{
  sub_1000E03B4((uint64_t)self + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__image, &qword_1002BA848);
  swift_bridgeObjectRelease(*(void *)&self->_participant[OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__displayName]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel__updateImageTask));
  v3 = (char *)self + OBJC_IVAR____TtC7TVMusic29SharePlayAttributionViewModel___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end