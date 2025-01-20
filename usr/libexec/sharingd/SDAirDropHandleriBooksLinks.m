@interface SDAirDropHandleriBooksLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriBooksLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriBooksLinks

- (SDAirDropHandleriBooksLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriBooksLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.iBooks");
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
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriBooksLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x400000000LL;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FAF10));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
}

@end