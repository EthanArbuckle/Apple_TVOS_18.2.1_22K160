@interface UIView
- (id)_accessibilityHeaderViewsForCommonTVPhotosCells;
@end

@implementation UIView

- (id)_accessibilityHeaderViewsForCommonTVPhotosCells
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___UIView;
  id v3 = -[UIView accessibilityHeaderElements](&v29, "accessibilityHeaderElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXGuaranteedMutableArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = AXSafeClassFromString(@"TVPPhotoLibraryTitleView");
  uint64_t v8 = AXSafeClassFromString(@"TVPhotoBannerBrowserView");
  char v28 = 0;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIView, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeValueForKey:](self, "safeValueForKey:", @"superview"));
  uint64_t v12 = __UIAccessibilityCastAsClass(v10, v11, 1LL, &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v28) {
    abort();
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subviews", 0));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v19, v7) & 1) != 0)
        {
          [v6 insertObject:v19 atIndex:0];
          goto LABEL_16;
        }

        if ((objc_opt_isKindOfClass(v19, v8) & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accessibilityHeaderElements]);
          id v21 = [v20 mutableCopy];

          if ([v21 count])
          {
            [v21 addObjectsFromArray:v6];
            id v22 = v21;

            v6 = v22;
          }

          goto LABEL_16;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

@end