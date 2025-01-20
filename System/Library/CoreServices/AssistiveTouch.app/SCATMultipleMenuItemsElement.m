@interface SCATMultipleMenuItemsElement
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (NSArray)menuItems;
- (NSString)identifier;
- (SCATMultipleMenuItemsElementDelegate)delegate;
- (id)description;
- (void)scatDidBecomeFocused:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMenuItems:(id)a3;
@end

@implementation SCATMultipleMenuItemsElement

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (void)scatDidBecomeFocused:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement menuItems](self, "menuItems", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    if (v3) {
      uint64_t v9 = 2LL;
    }
    else {
      uint64_t v9 = 0LL;
    }
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setStyle:v9];
        v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement delegate](self, "delegate"));
  [v11 multipleMenuItemsElement:self didBecomeHighlighted:v3];
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 == 2010)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement menuItems](self, "menuItems"));
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) flash];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement delegate](self, "delegate"));
    [v9 didActivateMultipleMenuItemsElement:self];

    return 1;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___SCATMultipleMenuItemsElement;
    return -[SCATSimpleElement scatPerformAction:](&v11, "scatPerformAction:");
  }

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATMultipleMenuItemsElement;
  id v3 = -[SCATMultipleMenuItemsElement description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement menuItems](self, "menuItems"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement identifier](self, "identifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMultipleMenuItemsElement delegate](self, "delegate"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingFormat:@" - menu items %@, identifier %@, delegate %@", v5, v6, v7]);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (SCATMultipleMenuItemsElementDelegate)delegate
{
  return (SCATMultipleMenuItemsElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end