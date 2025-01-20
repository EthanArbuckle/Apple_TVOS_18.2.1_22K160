@interface PBSystemGestureAppSwitcherFailurePolicy
- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6;
@end

@implementation PBSystemGestureAppSwitcherFailurePolicy

- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBSystemGestureAppSwitcherFailurePolicy;
  if (-[PBSystemGestureDefaultFailurePolicy gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:]( &v18,  "gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:",  v10,  a4,  v11,  v12))
  {
    id v13 = v10;
    id v14 = v11;
    BOOL v16 = 1;
    if ([v13 isTypeOf:2])
    {
      if ([v14 isTypeOf:2])
      {
        id v15 = [v14 numberOfTapsRequired];
        if (v15 > [v13 numberOfTapsRequired]) {
          BOOL v16 = 0;
        }
      }
    }
  }

  else
  {
    BOOL v16 = [v12 type] == (id)1;
  }

  return v16;
}

@end