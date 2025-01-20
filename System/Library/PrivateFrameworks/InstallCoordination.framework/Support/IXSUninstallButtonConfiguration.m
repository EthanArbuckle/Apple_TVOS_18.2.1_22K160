@interface IXSUninstallButtonConfiguration
- (BOOL)isPreferredButton;
- (IXSUninstallButtonConfiguration)initWithTitle:(id)a3 buttonType:(int)a4;
- (NSDictionary)buttonDefinitionForSB;
- (NSString)title;
- (int)buttonType;
- (int)presentationStyle;
- (void)setIsPreferredButton:(BOOL)a3;
- (void)setPresentationStyle:(int)a3;
@end

@implementation IXSUninstallButtonConfiguration

- (IXSUninstallButtonConfiguration)initWithTitle:(id)a3 buttonType:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXSUninstallButtonConfiguration;
  v8 = -[IXSUninstallButtonConfiguration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_buttonType = a4;
  }

  return v9;
}

- (NSDictionary)buttonDefinitionForSB
{
  id v3 = objc_alloc(&OBJC_CLASS___SBSMutableUserNotificationButtonDefinition);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallButtonConfiguration title](self, "title"));
  id v5 = [v3 initWithTitle:v4];

  if (-[IXSUninstallButtonConfiguration presentationStyle](self, "presentationStyle") == 1)
  {
    uint64_t v6 = 1LL;
LABEL_5:
    [v5 setPresentationStyle:v6];
    goto LABEL_6;
  }

  if (-[IXSUninstallButtonConfiguration presentationStyle](self, "presentationStyle") == 2)
  {
    uint64_t v6 = 2LL;
    goto LABEL_5;
  }

- (NSString)title
{
  return self->_title;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int)a3
{
  self->_presentationStyle = a3;
}

- (int)buttonType
{
  return self->_buttonType;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void)setIsPreferredButton:(BOOL)a3
{
  self->_isPreferredButton = a3;
}

- (void).cxx_destruct
{
}

@end