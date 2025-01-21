@interface IXSUninstallAlertConfiguration
- (IXSUninstallAlertConfiguration)initWithTitle:(id)a3 message:(id)a4;
- (NSDictionary)alertParameters;
- (NSMutableArray)actionDefinitions;
- (NSMutableArray)buttonDefinitions;
- (NSString)message;
- (NSString)title;
- (id)actionForButtonAtIndex:(unint64_t)a3;
- (unint64_t)numButtons;
- (void)addButtonDefinition:(id)a3 forAction:(id)a4;
- (void)setActionDefinitions:(id)a3;
- (void)setButtonDefinitions:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IXSUninstallAlertConfiguration

- (IXSUninstallAlertConfiguration)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IXSUninstallAlertConfiguration;
  v8 = -[IXSUninstallAlertConfiguration init](&v12, "init");
  if (v8)
  {
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[IXSUninstallAlertConfiguration setButtonDefinitions:](v8, "setButtonDefinitions:", v9);

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[IXSUninstallAlertConfiguration setActionDefinitions:](v8, "setActionDefinitions:", v10);

    -[IXSUninstallAlertConfiguration setTitle:](v8, "setTitle:", v6);
    -[IXSUninstallAlertConfiguration setMessage:](v8, "setMessage:", v7);
  }

  return v8;
}

- (void)addButtonDefinition:(id)a3 forAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 buttonType];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration buttonDefinitions](self, "buttonDefinitions"));
  [v8 addObject:v7];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration actionDefinitions](self, "actionDefinitions"));
  id v9 = objc_retainBlock(v6);

  [v10 addObject:v9];
}

- (id)actionForButtonAtIndex:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration actionDefinitions](self, "actionDefinitions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3]);

  return v5;
}

- (unint64_t)numButtons
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration buttonDefinitions](self, "buttonDefinitions"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSDictionary)alertParameters
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration buttonDefinitions](self, "buttonDefinitions", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) buttonDefinitionForSB]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v6);
  }

  v19[0] = kCFUserNotificationAlertHeaderKey;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration title](self, "title"));
  v20[0] = v10;
  v19[1] = kCFUserNotificationAlertMessageKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlertConfiguration message](self, "message"));
  v20[1] = v11;
  v20[2] = &__kCFBooleanTrue;
  v19[2] = SBUserNotificationAllowMenuButtonDismissal;
  v19[3] = SBUserNotificationDismissOnLock;
  v20[3] = &__kCFBooleanTrue;
  v19[4] = SBSUserNotificationButtonDefinitionsKey;
  id v12 = -[NSMutableArray copy](v3, "copy");
  v20[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  5LL));

  return (NSDictionary *)v13;
}

- (NSMutableArray)buttonDefinitions
{
  return self->_buttonDefinitions;
}

- (void)setButtonDefinitions:(id)a3
{
}

- (NSMutableArray)actionDefinitions
{
  return self->_actionDefinitions;
}

- (void)setActionDefinitions:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end