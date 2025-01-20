@interface SDAirDropHandleriBooksItems
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriBooksItems)initWithTransfer:(id)a3;
- (id)defaultOpenActionBundleID;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriBooksItems

- (SDAirDropHandleriBooksItems)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriBooksItems;
  v3 = -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:]( &v9,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.iBooks");
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v3, "bundleProxy"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v4, "bundleProxy"));
      v10 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
      -[SDAirDropHandlerGenericFiles setAvailableApplications:](v4, "setAvailableApplications:", v7);
    }
  }

  return v4;
}

- (BOOL)canHandleTransfer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  [v5 count];

  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriBooksItems;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x24000;
}

- (id)defaultOpenActionBundleID
{
  return 0LL;
}

@end