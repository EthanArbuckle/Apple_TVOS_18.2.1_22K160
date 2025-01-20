@interface SRCarPlayVisualResponseViewController
- (void)cancelSpeechSynthesis;
- (void)emitInstrumentationEvent:(id)a3;
- (void)hideBackgroundBehindSiri;
- (void)informHostOfBackgroundColor:(id)a3;
- (void)informHostOfBackgroundMaterial:(int64_t)a3;
- (void)informHostOfViewResize:(CGSize)a3;
- (void)navigateWithAceCommand:(id)a3;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performShowResponse:(id)a3;
- (void)restartSpeechSynthesis;
- (void)scrollViewDidScroll:(id)a3;
- (void)snippetFocusDidChange:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SRCarPlayVisualResponseViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100059328();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet));
  sub_100053404((uint64_t)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet));
}

- (void)performAceCommand:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10005D0E4((uint64_t)v5, 0, (uint64_t)v6);
}

- (void)performShowResponse:(id)a3
{
  id v5 = a3;
  v9 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  sub_10005A8A4();
  sub_100053258(v6, v8);
}

- (void)navigateWithResponseData:(id)a3
{
  id v5 = a3;
  v12 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_10004ADF0(v9, (uint64_t)qword_1000D9988);
  os_log_type_t v11 = static os_log_type_t.info.getter(v10);
  sub_1000681D8(v11, 0x10uLL, 0xD00000000000001CLL, 0x800000010008B270LL, 0xD00000000000004ELL, 0x800000010008B180LL);
  sub_10005A8A4();
  sub_100053258(v6, v8);
}

- (void)navigateWithAceCommand:(id)a3
{
  uint64_t v4 = qword_1000D8A20;
  id v5 = a3;
  uint64_t v9 = self;
  if (v4 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_10004ADF0(v6, (uint64_t)qword_1000D9988);
  os_log_type_t v8 = static os_log_type_t.info.getter(v7);
  sub_1000681D8(v8, 0x10uLL, 0xD00000000000001ALL, 0x800000010008B160LL, 0xD00000000000004ELL, 0x800000010008B180LL);
  swift_getObjectType(v5);
  sub_10005D0E4((uint64_t)v5, 1, (uint64_t)v9);
}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_10005AD40(width, height);
}

- (void)informHostOfBackgroundColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10005B10C(a3);
}

- (void)informHostOfBackgroundMaterial:(int64_t)a3
{
  uint64_t v4 = self;
  sub_10005B334(a3);
}

- (void)cancelSpeechSynthesis
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  a2);
  if (Strong)
  {
    uint64_t v5 = Strong;
    uint64_t v6 = *((void *)v3 + 1);
    swift_getObjectType(Strong);
    uint64_t v7 = *(void (**)(void))(*(void *)(v6 + 8) + 16LL);
    os_log_type_t v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }

- (void)restartSpeechSynthesis
{
  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  a2);
  if (Strong)
  {
    uint64_t v5 = Strong;
    uint64_t v6 = *((void *)v3 + 1);
    swift_getObjectType(Strong);
    uint64_t v7 = *(void (**)(void))(*(void *)(v6 + 8) + 48LL);
    os_log_type_t v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }

- (void)snippetFocusDidChange:(int64_t)a3
{
  uint64_t v4 = self;
  sub_10005B708(a3);
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10005B8BC(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10005D79C();
}

- (void)hideBackgroundBehindSiri
{
  v2 = self;
  sub_10005C35C();
}

@end