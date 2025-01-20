@interface FBSSceneTransitionContext
- (void)pb_addAdditionalActions:(id)a3;
@end

@implementation FBSSceneTransitionContext

- (void)pb_addAdditionalActions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBSSceneTransitionContext actions](self, "actions"));
    id v6 = [v5 mutableCopy];

    if (v6) {
      [v6 addObjectsFromArray:v4];
    }
    else {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v4));
    }
    id v7 = [v6 copy];
    -[FBSSceneTransitionContext setActions:](self, "setActions:", v7);
  }
}

@end