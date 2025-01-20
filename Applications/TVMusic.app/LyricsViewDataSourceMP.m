@interface LyricsViewDataSourceMP
- (BOOL)hasStoreLyrics;
- (NSString)artistName;
- (NSString)libraryLyricsText;
- (NSString)songTitle;
- (_TtC7TVMusic22LyricsViewDataSourceMP)init;
- (_TtC7TVMusic22LyricsViewDataSourceMP)initWithSong:(id)a3;
- (void)getLyricsTTMLWithCompletion:(id)a3;
@end

@implementation LyricsViewDataSourceMP

- (_TtC7TVMusic22LyricsViewDataSourceMP)initWithSong:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic22LyricsViewDataSourceMP_song) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LyricsViewDataSourceMP();
  id v4 = a3;
  return -[LyricsViewDataSourceMP init](&v6, "init");
}

- (NSString)songTitle
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic22LyricsViewDataSourceMP_song);
  v3 = self;
  id v4 = [v2 title];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    unint64_t v7 = v6;
  }

  else
  {

    unint64_t v7 = 0xE000000000000000LL;
  }

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (NSString)artistName
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic22LyricsViewDataSourceMP_song);
  v3 = self;
  id v4 = [v2 artist];
  if (v4 && (v5 = v4, id v6 = [v4 name], v5, v6))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v8 = v7;

    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }

  else
  {

    NSString v9 = 0LL;
  }

  return (NSString *)v9;
}

- (NSString)libraryLyricsText
{
  v2 = self;
  sub_1001133B0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (BOOL)hasStoreLyrics
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic22LyricsViewDataSourceMP_song);
  uint64_t v3 = self;
  uint64_t v4 = (_TtC7TVMusic22LyricsViewDataSourceMP *)[v2 lyrics];
  if (v4)
  {
    NSString v5 = v4;
    unsigned __int8 v6 = -[LyricsViewDataSourceMP hasStoreLyrics](v4, "hasStoreLyrics");

    uint64_t v3 = v5;
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)getLyricsTTMLWithCompletion:(id)a3
{
}

- (_TtC7TVMusic22LyricsViewDataSourceMP)init
{
  result = (_TtC7TVMusic22LyricsViewDataSourceMP *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.LyricsViewDataSourceMP",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end