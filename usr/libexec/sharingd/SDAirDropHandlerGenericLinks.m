@interface SDAirDropHandlerGenericLinks
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (LSAppLink)appLink;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)setAppLink:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerGenericLinks

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericLinks;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x4000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericLinks appLink](self, "appLink"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 targetApplicationProxy]);
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  }
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedName]);
  unint64_t v10 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v22 = @"GENERIC_LINK";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  v24 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v13));

  uint64_t v16 = SFLocalizedStringForKey(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v10 == 1) {
    v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v3, v9, v21);
  }
  else {
    v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v3, v10, v9);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  return v19;
}

- (void)updatePossibleActions
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericLinks;
  -[SDAirDropHandler updatePossibleActions](&v14, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericLinks appLink](self, "appLink"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 targetApplicationProxy]);
  if (v4)
  {
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

    if (!v4) {
      return;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  id location = 0LL;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  unint64_t v10 = sub_10008402C;
  v11 = &unk_1005CB070;
  objc_copyWeak(&v12, &location);
  [v5 setActionHandler:&v8];
  uint64_t v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v15,  1LL,  v8,  v9,  v10,  v11));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v7 setPossibleActions:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (void)setAppLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end