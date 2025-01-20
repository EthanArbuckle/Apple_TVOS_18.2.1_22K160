@interface TypeToSiriViewCoordinator
- (void)siriTVKeyboardViewControllerStartRequestWithText:(id)a3;
- (void)siriTVKeyboardViewDidAppearFromLongPressBringUpWithView:(id)a3;
@end

@implementation TypeToSiriViewCoordinator

- (void)siriTVKeyboardViewDidAppearFromLongPressBringUpWithView:(id)a3
{
  id v4 = a3;
  swift_retain(self);
  sub_65248();

  swift_release(self);
}

- (void)siriTVKeyboardViewControllerStartRequestWithText:(id)a3
{
  v5 = v4;
  swift_retain(self);
  sub_65330();
  swift_release(self);
  swift_bridgeObjectRelease(v5, v6, v7, v8, v9, v10, v11, v12);
}

@end