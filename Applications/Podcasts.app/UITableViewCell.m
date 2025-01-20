@interface UITableViewCell
- (id)floatingContentView;
@end

@implementation UITableViewCell

- (id)floatingContentView
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell subviews](self, "subviews", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        uint64_t v7 = objc_opt_class(&OBJC_CLASS____UIFloatingContentView);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

@end