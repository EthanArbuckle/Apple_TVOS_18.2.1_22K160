@interface SCATModernMenuSimpleSheet
- (NSArray)storedMenuItems;
- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItemDictionaryArray:(id)a4;
- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItems:(id)a4;
- (id)makeMenuItemsIfNeeded;
- (void)setStoredMenuItems:(id)a3;
@end

@implementation SCATModernMenuSimpleSheet

- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItemDictionaryArray:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SCATModernMenuSimpleSheet;
  v7 = -[SCATModernMenuSheet initWithMenu:](&v28, "initWithMenu:", a3);
  if (v7)
  {
    id v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      uint64_t v12 = AXSSwitchControlMenuItemEnabledKey;
      uint64_t v13 = AXSSwitchControlMenuItemTypeKey;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v12, v22));
          unsigned int v17 = [v16 BOOLValue];

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](v7, "menu"));
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v18,  v19,  v7));
            [v23 addObjectsFromArray:v20];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v10);
    }

    -[SCATModernMenuSimpleSheet setStoredMenuItems:](v7, "setStoredMenuItems:", v23);
    id v6 = v22;
  }

  return v7;
}

- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItems:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATModernMenuSimpleSheet;
  v7 = -[SCATModernMenuSheet initWithMenu:](&v10, "initWithMenu:", a3);
  id v8 = v7;
  if (v7) {
    -[SCATModernMenuSimpleSheet setStoredMenuItems:](v7, "setStoredMenuItems:", v6);
  }

  return v8;
}

- (id)makeMenuItemsIfNeeded
{
  return -[SCATModernMenuSimpleSheet storedMenuItems](self, "storedMenuItems");
}

- (NSArray)storedMenuItems
{
  return self->_storedMenuItems;
}

- (void)setStoredMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end