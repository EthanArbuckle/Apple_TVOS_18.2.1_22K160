@interface CAAnimationGroup
+ (id)pb_groupWithAnimations:(id)a3;
@end

@implementation CAAnimationGroup

+ (id)pb_groupWithAnimations:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "pb_durationIncludingDelay");
        if (v9 > v7) {
          double v7 = v9;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = 0.0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](&OBJC_CLASS___CAAnimationGroup, "animation"));
  [v10 setAnimations:v3];
  [v10 setDuration:v7];

  return v10;
}

@end