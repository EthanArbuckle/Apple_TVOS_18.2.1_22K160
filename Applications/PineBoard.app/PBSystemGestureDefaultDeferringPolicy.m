@interface PBSystemGestureDefaultDeferringPolicy
- (PBSystemGestureDefaultDeferringPolicy)initWithRecipeProvider:(id)a3;
- (id)deferredTargetSystemGestureUsingCandidateTypeEnumerator:(id)a3 selectionPolicy:(id)a4;
- (id)recipeProvider;
@end

@implementation PBSystemGestureDefaultDeferringPolicy

- (PBSystemGestureDefaultDeferringPolicy)initWithRecipeProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSystemGestureDefaultDeferringPolicy;
  v5 = -[PBSystemGestureDefaultDeferringPolicy init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id recipeProvider = v5->_recipeProvider;
    v5->_id recipeProvider = v6;
  }

  return v5;
}

- (id)deferredTargetSystemGestureUsingCandidateTypeEnumerator:(id)a3 selectionPolicy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[PBSystemGestureRecipeEnumerator initWithRecipeProvider:typeEnumerator:]( objc_alloc(&OBJC_CLASS___PBSystemGestureRecipeEnumerator),  "initWithRecipeProvider:typeEnumerator:",  self->_recipeProvider,  v7);

  if (v6) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 selectSystemGestureUsingActiveRecipeEnumerator:v8]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[PBSystemGestureRecipeEnumerator nextObject](v8, "nextObject"));
  }
  v10 = (void *)v9;

  return v10;
}

- (id)recipeProvider
{
  return self->_recipeProvider;
}

- (void).cxx_destruct
{
}

@end