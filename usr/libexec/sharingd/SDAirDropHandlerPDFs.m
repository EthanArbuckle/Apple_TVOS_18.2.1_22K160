@interface SDAirDropHandlerPDFs
- (BOOL)canHandleTransfer;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerPDFs

- (BOOL)canHandleTransfer
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPDFs;
  if (!-[SDAirDropHandlerGenericFiles canHandleTransfer](&v18, "canHandleTransfer")) {
    return 0;
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) type]);
        int v11 = SFIsPDF(v10);

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPDFs;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x4000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  if (v4 < 2)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPDFs;
    id v14 = -[SDAirDropHandlerGenericFiles suitableContentsDescription](&v18, "suitableContentsDescription");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    unint64_t v5 = v4;
    v19 = @"PDF";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    v20 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v21 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v8));

    LODWORD(v7) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    uint64_t v11 = SFLocalizedStringForKey(v9, v10);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((_DWORD)v7) {
      v13 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v12, v5, v17);
    }
    else {
      v13 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v12, v3, v5);
    }
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v15;
}

@end