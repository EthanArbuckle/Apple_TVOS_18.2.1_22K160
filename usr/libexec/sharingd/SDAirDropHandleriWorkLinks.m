@interface SDAirDropHandleriWorkLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriWorkLinks)initWithTransfer:(id)a3;
- (id)bundleProxyForiWorkURL:(id)a3;
- (id)documentName;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandleriWorkLinks

- (SDAirDropHandleriWorkLinks)initWithTransfer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriWorkLinks;
  v5 = -[SDAirDropHandler initWithTransfer:](&v10, "initWithTransfer:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 completedURLs]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriWorkLinks bundleProxyForiWorkURL:](v5, "bundleProxyForiWorkURL:", v7));
    -[SDAirDropHandler setBundleProxy:](v5, "setBundleProxy:", v8);
  }

  return v5;
}

- (BOOL)canHandleTransfer
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriWorkLinks;
  if (!-[SDAirDropHandlerGenericLinks canHandleTransfer](&v19, "canHandleTransfer"))
  {
    v3 = objc_alloc(&OBJC_CLASS___SDAirDropHandlerWebLinks);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v5 = -[SDAirDropHandlerWebLinks initWithTransfer:](v3, "initWithTransfer:", v4);
    webLinksHandler = self->_webLinksHandler;
    self->_webLinksHandler = v5;

    if (!-[SDAirDropHandlerWebLinks canHandleTransfer](self->_webLinksHandler, "canHandleTransfer")) {
      return 0;
    }
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 completedURLs]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v15 + 1) + 8 * (void)i) isiWorkURL])
        {
          BOOL v13 = 0;
          goto LABEL_13;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriWorkLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x10000000;
}

- (id)bundleProxyForiWorkURL:(id)a3
{
  id v4 = a3;
  if (![v4 isiWorkURL])
  {
    v8 = 0LL;
    goto LABEL_14;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iWorkApplicationName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 capitalizedString]);

  if ([v6 isEqual:@"Pages"])
  {
    v7 = @"com.apple.Pages";
  }

  else if ([v6 isEqual:@"Numbers"])
  {
    v7 = @"com.apple.Numbers";
  }

  else
  {
    if (![v6 isEqual:@"Keynote"])
    {
      v8 = 0LL;
      goto LABEL_10;
    }

    v7 = @"com.apple.Keynote";
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v7));
LABEL_10:
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appState]);
  unsigned int v10 = [v9 isInstalled];

  if (v10)
  {
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue([v8 localizedName]);
    appName = self->_appName;
    self->_appName = v11;
  }

  else
  {
    objc_storeStrong((id *)&self->_appName, v6);
    appName = (NSString *)v8;
    v8 = 0LL;
  }

LABEL_14:
  return v8;
}

- (id)documentName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 completedURLs]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iWorkDocumentName]);
  return v5;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriWorkLinks documentName](self, "documentName"));
  v6 = (void *)v5;
  if (v4 == 1 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FAE38));
    uint64_t v9 = SFLocalizedStringForKey(v7, v8);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v10,  v3,  self->_appName,  v6));
  }

  else
  {
    objc_super v19 = @"IWORK_LINK";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    v20 = v12;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v14));

    uint64_t v16 = SFLocalizedStringForKey(v7, v15);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v17,  v3,  v4,  self->_appName));
  }

  return v11;
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
    v5.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriWorkLinks;
    -[SDAirDropHandlerGenericLinks updatePossibleActions](&v5, "updatePossibleActions");
  }

- (void).cxx_destruct
{
}

@end