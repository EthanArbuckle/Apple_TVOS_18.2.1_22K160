@interface SDAirDropHandlerPodcastsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerPodcastsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerPodcastsLinks

- (SDAirDropHandlerPodcastsLinks)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPodcastsLinks;
  v3 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v6,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.podcasts");
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

  return v3;
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPodcastsLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x4000000000LL;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FAD90));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
}

@end