@interface TVMusicNowPlayingStateToggleGestureRecognizer
- (TVMusicNowPlayingStateToggleGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)recognizedReason;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setRecognizedReason:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVMusicNowPlayingStateToggleGestureRecognizer

- (int64_t)recognizedReason
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___TVMusicNowPlayingStateToggleGestureRecognizer_recognizedReason);
}

- (void)setRecognizedReason:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___TVMusicNowPlayingStateToggleGestureRecognizer_recognizedReason) = (Class)a3;
}

- (TVMusicNowPlayingStateToggleGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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

  return (TVMusicNowPlayingStateToggleGestureRecognizer *)sub_1000F2828((uint64_t)v7, (uint64_t)a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1000F3144(v5);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1000F3364(v5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1000F3498();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1000F3554();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_1000E0418(0LL, &qword_1002B8448, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_1000F30EC();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1000F35FC(v9);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
}

@end