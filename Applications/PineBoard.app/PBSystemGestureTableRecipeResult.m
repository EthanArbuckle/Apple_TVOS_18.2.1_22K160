@interface PBSystemGestureTableRecipeResult
+ (id)resultWithGestureRecognizerDescriptor:(id)a3 systemGestureRecipe:(id)a4;
- (PBGestureRecognizerDescriptor)gestureRecognizerDescriptor;
- (PBSystemGestureRecipe)systemGestureRecipe;
@end

@implementation PBSystemGestureTableRecipeResult

+ (id)resultWithGestureRecognizerDescriptor:(id)a3 systemGestureRecipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    id v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    objc_storeStrong((id *)v8 + 2, a4);
  }

  return v8;
}

- (PBGestureRecognizerDescriptor)gestureRecognizerDescriptor
{
  return self->_gestureRecognizerDescriptor;
}

- (PBSystemGestureRecipe)systemGestureRecipe
{
  return self->_systemGestureRecipe;
}

- (void).cxx_destruct
{
}

@end