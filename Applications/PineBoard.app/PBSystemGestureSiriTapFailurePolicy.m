@interface PBSystemGestureSiriTapFailurePolicy
- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6;
@end

@implementation PBSystemGestureSiriTapFailurePolicy

- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBSystemGestureSiriTapFailurePolicy;
  if (-[PBSystemGestureDefaultFailurePolicy gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:]( &v16,  "gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:",  a3,  a4,  v10,  a6))
  {
    id v11 = v10;
    if ([v11 isTypeOf:6])
    {
      [v11 minimumPressDuration];
      char IsZero = BSFloatIsZero(v12);

      char v14 = IsZero ^ 1;
    }

    else
    {

      char v14 = 1;
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

@end