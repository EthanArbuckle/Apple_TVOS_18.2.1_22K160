@interface ProtectionMonitor
- (_TtC6SiriTV17ProtectionMonitor)init;
- (void)dealloc;
- (void)didEnterBackgroundWithNotification:(id)a3;
- (void)nowPlayingAppPlaybackStateDidChangeWithNotification:(id)a3;
- (void)nowPlayingInfoDidChangeWithNotification:(id)a3;
- (void)pictureInPictureStateDidChangeWithNotification:(id)a3;
- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)willEnterForegroundWithNotification:(id)a3;
@end

@implementation ProtectionMonitor

- (_TtC6SiriTV17ProtectionMonitor)init
{
  return (_TtC6SiriTV17ProtectionMonitor *)sub_1CA8C();
}

- (void)dealloc
{
  v2 = self;
  sub_1CD98();
}

- (void).cxx_destruct
{
}

- (void)nowPlayingAppPlaybackStateDidChangeWithNotification:(id)a3
{
}

- (void)nowPlayingInfoDidChangeWithNotification:(id)a3
{
}

- (void)pictureInPictureStateDidChangeWithNotification:(id)a3
{
}

- (void)didEnterBackgroundWithNotification:(id)a3
{
}

- (void)willEnterForegroundWithNotification:(id)a3
{
}

- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  sub_1EC34();
}

@end