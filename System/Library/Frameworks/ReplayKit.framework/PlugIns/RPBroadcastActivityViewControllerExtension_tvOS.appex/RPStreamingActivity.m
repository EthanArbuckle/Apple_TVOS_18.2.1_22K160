@interface RPStreamingActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (RPStreamingActivity)initWithApplicationExtension:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)applicationExtension;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation RPStreamingActivity

- (RPStreamingActivity)initWithApplicationExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPStreamingActivity;
  v6 = -[RPStreamingActivity init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationExtension, a3);
  }

  return v7;
}

+ (int64_t)activityCategory
{
  return 1LL;
}

- (id)activityType
{
  return -[NSExtension identifier](self->_applicationExtension, "identifier");
}

- (id)activityTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension infoDictionary](self->_applicationExtension, "infoDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:_kCFBundleDisplayNameKey]);

  return v3;
}

- (id)activityImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension icons](self->_applicationExtension, "icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___RPStreamingActivityKey);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)prepareWithActivityItems:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPStreamingActivity;
  -[RPStreamingActivity prepareWithActivityItems:](&v3, "prepareWithActivityItems:", a3);
}

- (id)applicationExtension
{
  return self->_applicationExtension;
}

- (void).cxx_destruct
{
}

@end