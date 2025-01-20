@interface PBSystemGestureDefaultFailurePolicy
- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6;
@end

@implementation PBSystemGestureDefaultFailurePolicy

- (BOOL)gestureRecognizer:(id)a3 ofRecipe:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5 ofRecipe:(id)a6
{
  id v7 = a3;
  id v8 = a5;
  if (![v8 isTypeOf:6]
    || ([v8 minimumPressDuration], !BSFloatIsZero(v9)))
  {
    id v14 = v7;
    if ([v14 isTypeOf:6])
    {
      [v14 minimumPressDuration];
      int IsZero = BSFloatIsZero(v15);

      if (IsZero)
      {
        id v17 = [v14 _numberOfPressBeganRequired];
        if (v17 <= [v8 _numberOfPressBeganRequired]) {
          goto LABEL_19;
        }
        [v14 _minimumPressDuration];
        double v19 = v18;
        [v8 _minimumPressDuration];
        if (v19 >= v20) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v21 = [v14 type];
    if (v21 >= [v8 type])
    {
      id v23 = [v14 type];
      if (v23 != [v8 type]) {
        goto LABEL_19;
      }
      id v24 = [v14 _numberOfPressBeganRequired];
      if (v24 >= [v8 _numberOfPressBeganRequired]) {
        goto LABEL_19;
      }
    }

    goto LABEL_15;
  }

  if (![v7 isTypeOf:2]
    || (id v10 = [v7 _numberOfPressBeganRequired], v10 >= objc_msgSend(v8, "_numberOfPressBeganRequired"))
    || ([v7 _minimumPressDuration], double v12 = v11, objc_msgSend(v8, "_minimumPressDuration"), v12 > v13))
  {
LABEL_19:
    BOOL v22 = 0;
    goto LABEL_20;
  }

@end