@interface SDAirDropHandlerKeynoteLiveLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerKeynoteLiveLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerKeynoteLiveLinks

- (SDAirDropHandlerKeynoteLiveLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerKeynoteLiveLinks;
  return -[SDAirDropHandler initWithTransfer:](&v4, "initWithTransfer:", a3);
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerKeynoteLiveLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x20000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FAD18));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
}

- (void)updatePossibleActions
{
  webLinksHandler = self->_webLinksHandler;
  if (webLinksHandler)
  {
    -[SDAirDropHandlerGenericLinks updatePossibleActions](webLinksHandler, "updatePossibleActions");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_webLinksHandler, "setCompletionHandler:", v4);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerKeynoteLiveLinks;
    -[SDAirDropHandlerGenericLinks updatePossibleActions](&v5, "updatePossibleActions");
  }

- (void).cxx_destruct
{
}

@end