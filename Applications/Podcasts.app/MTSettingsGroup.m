@interface MTSettingsGroup
+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settings:(id)a5;
+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settingsHandler:(id)a5;
+ (id)footerAttributedString:(id)a3;
+ (id)footerAttributedString:(id)a3 additionalAttributeName:(id)a4 additionalAttributeValue:(id)a5 additionalAttributeRange:(_NSRange)a6;
- (MTSettingHeaderAction)headerAction;
- (NSArray)groupSettings;
- (NSAttributedString)groupFooter;
- (NSString)groupTitle;
- (double)customHeaderHeight;
- (id)settingsHandler;
- (void)setCustomHeaderHeight:(double)a3;
- (void)setGroupFooter:(id)a3;
- (void)setGroupSettings:(id)a3;
- (void)setGroupTitle:(id)a3;
- (void)setHeaderAction:(id)a3;
- (void)setSettingsHandler:(id)a3;
@end

@implementation MTSettingsGroup

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settings:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___MTSettingsGroup);
  -[MTSettingsGroup setGroupTitle:](v10, "setGroupTitle:", v7);
  -[MTSettingsGroup setGroupFooter:](v10, "setGroupFooter:", v8);
  -[MTSettingsGroup setGroupSettings:](v10, "setGroupSettings:", v9);
  -[MTSettingsGroup setCustomHeaderHeight:](v10, "setCustomHeaderHeight:", 0.0);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v15), "setGroup:", v10, (void)v17);
        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v13);
  }

  return v10;
}

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settingsHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___MTSettingsGroup);
  -[MTSettingsGroup setGroupTitle:](v10, "setGroupTitle:", v9);

  -[MTSettingsGroup setGroupFooter:](v10, "setGroupFooter:", v8);
  -[MTSettingsGroup setSettingsHandler:](v10, "setSettingsHandler:", v7);

  -[MTSettingsGroup setCustomHeaderHeight:](v10, "setCustomHeaderHeight:", 0.0);
  return v10;
}

+ (id)footerAttributedString:(id)a3
{
  id v3 = a3;
  v4 = -[NSMutableAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:attributes:",  v3,  0LL);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIListContentConfiguration groupedFooterConfiguration]( &OBJC_CLASS___UIListContentConfiguration,  "groupedFooterConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textProperties]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resolvedColor]);
  -[NSMutableAttributedString addAttribute:value:range:]( v4,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v7,  0LL,  -[NSMutableAttributedString length](v4, "length"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](&OBJC_CLASS___UIFont, "sectionFooterFont"));
  -[NSMutableAttributedString addAttribute:value:range:]( v4,  "addAttribute:value:range:",  NSFontAttributeName,  v8,  0LL,  -[NSMutableAttributedString length](v4, "length"));

  return v4;
}

+ (id)footerAttributedString:(id)a3 additionalAttributeName:(id)a4 additionalAttributeValue:(id)a5 additionalAttributeRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup footerAttributedString:]( &OBJC_CLASS___MTSettingsGroup,  "footerAttributedString:",  v12));

  v15 = -[NSMutableAttributedString initWithAttributedString:](v13, "initWithAttributedString:", v14);
  -[NSMutableAttributedString addAttribute:value:range:](v15, "addAttribute:value:range:", v11, v10, location, length);

  return v15;
}

- (NSArray)groupSettings
{
  groupSettings = (uint64_t (**)(void *, SEL))self->_groupSettings;
  if (!groupSettings)
  {
    groupSettings = (uint64_t (**)(void *, SEL))self->_settingsHandler;
    if (groupSettings)
    {
      uint64_t v4 = groupSettings[2](groupSettings, a2);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue(v4);
      v6 = self->_groupSettings;
      self->_groupSettings = v5;

      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v7 = self->_groupSettings;
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          id v11 = 0LL;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "setGroup:", self, (void)v13);
            id v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
        }

        while (v9);
      }

      groupSettings = (uint64_t (**)(void *, SEL))self->_groupSettings;
    }
  }

  return (NSArray *)groupSettings;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
}

- (NSAttributedString)groupFooter
{
  return self->_groupFooter;
}

- (void)setGroupFooter:(id)a3
{
}

- (void)setGroupSettings:(id)a3
{
}

- (id)settingsHandler
{
  return self->_settingsHandler;
}

- (void)setSettingsHandler:(id)a3
{
}

- (MTSettingHeaderAction)headerAction
{
  return self->_headerAction;
}

- (void)setHeaderAction:(id)a3
{
}

- (double)customHeaderHeight
{
  return self->_customHeaderHeight;
}

- (void)setCustomHeaderHeight:(double)a3
{
  self->_customHeaderHeight = a3;
}

- (void).cxx_destruct
{
}

@end