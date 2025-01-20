@interface MTTVUserSwitchOverlayWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation MTTVUserSwitchOverlayWindow

- (BOOL)_wantsFocusEngine
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end