@interface NowPlayingMusicBarsView
- (BOOL)_hasBaseline;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView)initWithCoder:(id)a3;
- (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView)initWithFrame:(CGRect)a3;
- (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView)initWithCoder:(id)a3;
- (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingMusicBarsView

- (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView *)sub_1000F6424( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView_musicBars;
  id v6 = objc_allocWithZone((Class)&OBJC_CLASS___TVMusicBarsView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7TVMusicP33_886719967E40BE861C5DA0980FD1C5D323NowPlayingMusicBarsView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/NowPlayingCompactMetadataView.swift",  43LL,  2LL,  120LL,  0);
  __break(1u);
  return result;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView_musicBars) bottomAnchor];
}

- (BOOL)_hasBaseline
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView_musicBars));
}

- (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView *)sub_1000FEA94( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView_musicBars;
  id v6 = objc_allocWithZone((Class)&OBJC_CLASS___TVMusicBarsView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7TVMusicP33_929125DE8AD11E947D081D2DBFC9D91A23NowPlayingMusicBarsView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/NowPlayingContentView.swift",  35LL,  2LL,  655LL,  0);
  __break(1u);
  return result;
}

@end