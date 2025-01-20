@interface LyricsViewDataSourceMusicKit
- (BOOL)hasStoreLyrics;
- (NSString)artistName;
- (NSString)libraryLyricsText;
- (NSString)songTitle;
- (_TtC7TVMusic28LyricsViewDataSourceMusicKit)init;
- (void)getLyricsTTMLWithCompletion:(id)a3;
@end

@implementation LyricsViewDataSourceMusicKit

- (NSString)songTitle
{
  return (NSString *)sub_100112D7C(self, (uint64_t)a2, (void (*)(void))&Song.title.getter);
}

- (NSString)artistName
{
  return (NSString *)sub_100112D7C(self, (uint64_t)a2, (void (*)(void))&Song.artistName.getter);
}

- (NSString)libraryLyricsText
{
  return (NSString *)0LL;
}

- (BOOL)hasStoreLyrics
{
  v2 = self;
  char v3 = Song.hasLyrics.getter();

  return v3 & 1;
}

- (void)getLyricsTTMLWithCompletion:(id)a3
{
}

- (_TtC7TVMusic28LyricsViewDataSourceMusicKit)init
{
  result = (_TtC7TVMusic28LyricsViewDataSourceMusicKit *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.LyricsViewDataSourceMusicKit",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7TVMusic28LyricsViewDataSourceMusicKit_song;
  uint64_t v3 = type metadata accessor for Song(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end