@interface TVMusicNowPlayingPlayerControlsView
+ (NSString)didSelectContextMenuNotification;
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithCoder:(id)a3;
- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithFrame:(CGRect)a3;
- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithFrame:(CGRect)a3 player:(id)a4 presentation:(id)a5;
- (id)soundIdentifierForFocusUpdateInContext:(id)a3;
- (void)layoutSubviews;
@end

@implementation TVMusicNowPlayingPlayerControlsView

+ (NSString)didSelectContextMenuNotification
{
  return (NSString *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7260,  (id *)&qword_1002C5F38,  (uint64_t)sub_10019CDC8);
}

- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithFrame:(CGRect)a3 player:(id)a4 presentation:(id)a5
{
  return (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView *)sub_10019CE18( a4,  a5,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (id)soundIdentifierForFocusUpdateInContext:(id)a3
{
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_suppressFocusSounds))
    v3 = (id *)&UIFocusSoundIdentifierNone;
  else {
    v3 = (id *)&UIFocusSoundIdentifierDefault;
  }
  return *v3;
}

- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithCoder:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_suppressFocusSounds) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_vocalControlObserver) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_vocalAttenuationAvailableObserver) = 0LL;
  id v4 = a3;

  result = (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/NowPlayingControlsView.swift",  36LL,  2LL,  671LL,  0);
  __break(1u);
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000DFE10(&qword_1002B8A00);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1001E9180;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_contentView);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()((__n128)xmmword_1001E9180);
  id v6 = v5;
  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for TVMusicNowPlayingPlayerControlsView();
  -[TVMusicNowPlayingPlayerControlsView layoutSubviews](&v2, "layoutSubviews");
}

- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)initWithFrame:(CGRect)a3
{
  result = (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.TVMusicNowPlayingPlayerControlsView",  43LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_playerObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_viewPresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_contentView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_vocalControlObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView_vocalAttenuationAvailableObserver));
}

@end