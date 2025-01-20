@interface TSKViewController
- (BOOL)popBackToViewControllerOfType:(Class)a3;
- (id)accessibilityPreviousViewController;
@end

@implementation TSKViewController

- (BOOL)popBackToViewControllerOfType:(Class)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSKViewController navigationController](self, "navigationController"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
        {
          BOOL v11 = 1;
          id v12 = [v4 popToViewController:v10 animated:1];
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)accessibilityPreviousViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSKViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:"));
  }

  return v5;
}

@end