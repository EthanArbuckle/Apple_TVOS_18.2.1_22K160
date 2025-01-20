@interface SDAirDropHandlerAppStoreLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerAppStoreLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerAppStoreLinks

- (SDAirDropHandlerAppStoreLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerAppStoreLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.AppStore");
}

- (id)candidateIdentifiers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  -[NSMutableArray addObject:](v3, "addObject:", @"com.apple.TVAppStore");
  return v3;
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (id)singleItemActionTitle
{
  return (id)SFLocalizedStringForKey(@"VIEW_BUTTON_TITLE", a2);
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerAppStoreLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | (unint64_t)&_mh_execute_header;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemsDescription]);
  if ([v6 length])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metaData]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemsDescription]);
  }

  else
  {
    v9 = 0LL;
  }

  if (v9) {
    v10 = &off_1005FAE50;
  }
  else {
    v10 = &off_1005FAE68;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v10));
  unsigned int v12 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  uint64_t v14 = SFLocalizedStringForKey(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v12) {
    v16 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v15, v9, v19);
  }
  else {
    v16 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v15, v3, v9);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

@end