@interface TVHPhotosSlideshowViewControllerFactory
+ (id)_imageProxiesForMediaItems:(id)a3 mediaLibrary:(id)a4;
+ (id)viewControllerWithMediaItems:(id)a3 mediaLibrary:(id)a4 showSettings:(BOOL)a5;
@end

@implementation TVHPhotosSlideshowViewControllerFactory

+ (id)viewControllerWithMediaItems:(id)a3 mediaLibrary:(id)a4 showSettings:(BOOL)a5
{
  BOOL v5 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _imageProxiesForMediaItems:a3 mediaLibrary:a4]);
  if ([v6 count])
  {
    if (v5)
    {
      id v7 = [[TVSlideshowSettingsViewController alloc] initWithImageProxies:v6];
    }

    else
    {
      id v7 = [[TVSlideshowMarimbaViewController alloc] initWithImageProxies:v6 options:0 displayThemeOptions:0];
      [v7 setDisplaysTransitionStyleOptions:1];
      [v7 setUpdatePlaybackOnThemeSelection:1];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)_imageProxiesForMediaItems:(id)a3 mediaLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12);
        v14 = objc_alloc(&OBJC_CLASS___TVImageProxy);
        v15 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v14,  "initWithObject:imageLoader:groupType:",  v13,  v6,  0LL,  (void)v18);
        -[NSMutableArray addObject:](v7, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  id v16 = -[NSMutableArray copy](v7, "copy");
  return v16;
}

@end