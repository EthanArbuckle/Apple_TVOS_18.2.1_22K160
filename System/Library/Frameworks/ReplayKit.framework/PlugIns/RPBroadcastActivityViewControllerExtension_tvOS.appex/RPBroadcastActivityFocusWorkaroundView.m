@interface RPBroadcastActivityFocusWorkaroundView
- (BOOL)canBecomeFirstResponder;
@end

@implementation RPBroadcastActivityFocusWorkaroundView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end