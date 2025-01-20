@interface PBSystemGestureSiriPreheatPolicy
- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
@end

@implementation PBSystemGestureSiriPreheatPolicy

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6
{
  return 0;
}

@end