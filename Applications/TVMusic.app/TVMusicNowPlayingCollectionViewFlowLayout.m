@interface TVMusicNowPlayingCollectionViewFlowLayout
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (TVMusicNowPlayingCollectionViewFlowLayout)init;
- (TVMusicNowPlayingCollectionViewFlowLayout)initWithCoder:(id)a3;
@end

@implementation TVMusicNowPlayingCollectionViewFlowLayout

- (TVMusicNowPlayingCollectionViewFlowLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = -[TVMusicNowPlayingCollectionViewFlowLayout init](&v4, "init");
  -[TVMusicNowPlayingCollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1LL);
  -[TVMusicNowPlayingCollectionViewFlowLayout setMinimumLineSpacing:](v2, "setMinimumLineSpacing:", 40.0);
  -[TVMusicNowPlayingCollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:]( v2,  "_setWantsRightToLeftHorizontalMirroringIfNeeded:",  0LL);

  return v2;
}

- (TVMusicNowPlayingCollectionViewFlowLayout)initWithCoder:(id)a3
{
  result = (TVMusicNowPlayingCollectionViewFlowLayout *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/NowPlayingCollectionViewLayout.swift",  44LL,  2LL,  22LL,  0);
  __break(1u);
  return result;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

@end