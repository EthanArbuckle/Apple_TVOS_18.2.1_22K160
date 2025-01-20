@interface SDAirDropHandleriTunesStoreLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriTunesStoreLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriTunesStoreLinks

- (SDAirDropHandleriTunesStoreLinks)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriTunesStoreLinks;
  v3 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v6,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.MobileStore");
  v4 = v3;
  if (v3) {
    -[SDAirDropHandler setBundleProxy:](v3, "setBundleProxy:", 0LL);
  }
  return v4;
}

- (id)candidateIdentifiers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  -[NSMutableArray addObject:](v3, "addObject:", @"com.apple.Music");
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
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriTunesStoreLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x1000000000LL;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemsDescriptionAdvanced]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 metaData]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemsDescriptionAdvanced]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"SFAirDropActivitySubjectiTunesStoreLinkType"]);
    v12 = (char *)[v11 integerValue];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 completedURLs]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    v12 = (char *)SFiTunesStoreLinkType();
  }

  else {
    v13 = off_1005CF890[(void)(v12 - 1)];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v13));
  uint64_t v16 = SFLocalizedStringForKey(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v17, v3));

  return v18;
}

@end