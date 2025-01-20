@interface TVMusicNowPlayingInteractionGestureRecognizer
- (TVMusicNowPlayingInteractionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVMusicNowPlayingInteractionGestureRecognizer

- (TVMusicNowPlayingInteractionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v7, 0, sizeof(v7));
  }

  return (TVMusicNowPlayingInteractionGestureRecognizer *)sub_10016DFD4((uint64_t)v7, (uint64_t)a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v12 = self;
  [v5 _digitizerLocation];
  v6 = (char *)v12 + OBJC_IVAR___TVMusicNowPlayingInteractionGestureRecognizer_startLocation;
  *(void *)v6 = v7;
  *((void *)v6 + 1) = v8;
  v6[16] = 0;
  [v5 _digitizerLocation];
  v9 = (char *)v12 + OBJC_IVAR___TVMusicNowPlayingInteractionGestureRecognizer_currentLocation;
  *(void *)v9 = v10;
  *((void *)v9 + 1) = v11;
  v9[16] = 0;
  -[TVMusicNowPlayingInteractionGestureRecognizer setState:](v12, "setState:", 1LL);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_10016E548(v5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  uint64_t v7 = self;
  unint64_t v6 = (unint64_t)-[TVMusicNowPlayingInteractionGestureRecognizer state](v7, "state");
  if (v6 <= 2) {
    -[TVMusicNowPlayingInteractionGestureRecognizer setState:](v7, "setState:", qword_1001EDE90[v6]);
  }
  -[TVMusicNowPlayingInteractionGestureRecognizer setState:](v7, "setState:", 2LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  unint64_t v6 = self;
  sub_10016E5EC();
}

@end