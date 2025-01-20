@interface UIViewController
- (id)recursiveDescription;
- (void)addDescriptionToString:(id)a3 indentLevel:(int64_t)a4;
@end

@implementation UIViewController

- (id)recursiveDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", &stru_C750));
  -[UIViewController addDescriptionToString:indentLevel:](self, "addDescriptionToString:indentLevel:", v3, 0LL);
  return v3;
}

- (void)addDescriptionToString:(id)a3 indentLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([&stru_C750 stringByPaddingToLength:a4 withString:@" " startingAtIndex:0]);
  [v6 appendString:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController debugDescription](self, "debugDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  [v9 frame];
  v10 = NSStringFromCGRect(v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v6 appendFormat:@"%@, %@", v8, v11];

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers"));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    int64_t v16 = a4 + 1;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v17);
        [v6 appendFormat:@"\n%@>", v7];
        [v18 addDescriptionToString:v6 indentLevel:v16];
        v17 = (char *)v17 + 1;
      }

      while (v14 != v17);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }
}

@end