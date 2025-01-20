@interface TVSettingsAmbientMenuItem
+ (id)deepestSelectedItemFromItem:(id)a3;
+ (void)selectItem:(id)a3 unselectItem:(id)a4;
- (BOOL)isSelected;
- (NSArray)childItems;
- (NSString)selectedValue;
- (TVSettingsAmbientMenuItem)initWithTransitionEffectModel:(id)a3;
- (TVSettingsAmbientMenuItem)initWithTransitionStyleModel:(id)a3;
- (TVSettingsAmbientMenuItem)parentMenuItem;
- (id)queryChildItemWithIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedValue:(id)a3;
@end

@implementation TVSettingsAmbientMenuItem

- (TVSettingsAmbientMenuItem)initWithTransitionStyleModel:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientMenuItem;
  v5 = -[TVSettingsAmbientItem initWithModel:](&v23, "initWithModel:", v4);
  if (v5)
  {
    v5->_selected = [v4 isSelected];
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v18 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 effects]);
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[TVSettingsAmbientMenuItem initWithTransitionEffectModel:]( objc_alloc(&OBJC_CLASS___TVSettingsAmbientMenuItem),  "initWithTransitionEffectModel:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
          objc_storeWeak((id *)&v12->_parentMenuItem, v5);
          -[NSMutableArray addObject:](v6, "addObject:", v12);
          if (v5->_selected && -[TVSettingsAmbientMenuItem isSelected](v12, "isSelected"))
          {
            uint64_t v13 = objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem localizedName](v12, "localizedName"));
            selectedValue = v5->_selectedValue;
            v5->_selectedValue = (NSString *)v13;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v9);
    }

    id v15 = -[NSMutableArray count](v6, "count");
    if (v15) {
      id v16 = -[NSMutableArray copy](v6, "copy");
    }
    else {
      id v16 = 0LL;
    }
    objc_storeStrong((id *)&v5->_childItems, v16);
    id v4 = v18;
    if (v15) {
  }
    }

  return v5;
}

- (TVSettingsAmbientMenuItem)initWithTransitionEffectModel:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientMenuItem;
  v5 = -[TVSettingsAmbientItem initWithModel:](&v7, "initWithModel:", v4);
  if (v5) {
    v5->_selected = [v4 isSelected];
  }

  return v5;
}

- (void)setSelectedValue:(id)a3
{
  -[TVSettingsAmbientMenuItem setSelected:](self, "setSelected:", a3 != 0LL);
}

+ (void)selectItem:(id)a3 unselectItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 parentMenuItem]);
  if (v7)
  {
    do
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 parentMenuItem]);

      objc_super v7 = (void *)v8;
    }

    while (v8);
  }

  [v6 setSelectedValue:0];
  id v9 = v6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 parentMenuItem]);

  while (v10)
  {
    if (v10 == v7) {
      break;
    }
    v11 = v10;
    [v10 setSelectedValue:0];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v10 parentMenuItem]);
  }

  [v5 setSelected:1];
  id v16 = v5;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedName]);
  uint64_t v13 = v16;
  while (1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parentMenuItem]);

    if (!v14) {
      break;
    }
    [v14 setSelectedValue:v12];
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 localizedName]);

    uint64_t v13 = v14;
    v12 = (void *)v15;
    if (v14 == v7)
    {
      v14 = v7;
      v12 = (void *)v15;
      break;
    }
  }
}

+ (id)deepestSelectedItemFromItem:(id)a3
{
  id v3 = a3;
  if ([v3 isSelected])
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childItems]);

    if (v5)
    {
      while (1)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 childItems]);
        id v7 = [v6 indexOfObjectPassingTest:&stru_100191A80];

        if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 childItems]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v7]);

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 childItems]);
        id v4 = v9;
        if (!v10) {
          goto LABEL_8;
        }
      }
    }

    id v9 = v4;
  }

  else
  {
    id v9 = 0LL;
  }

- (id)queryChildItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientMenuItem childItems](self, "childItems"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientMenuItem childItems](self, "childItems"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100079444;
    v11[3] = &unk_100191820;
    id v12 = v4;
    id v7 = [v6 indexOfObjectPassingTest:v11];

    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = 0LL;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientMenuItem childItems](self, "childItems"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v7]);
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSString)selectedValue
{
  return self->_selectedValue;
}

- (TVSettingsAmbientMenuItem)parentMenuItem
{
  return (TVSettingsAmbientMenuItem *)objc_loadWeakRetained((id *)&self->_parentMenuItem);
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (void).cxx_destruct
{
}

@end