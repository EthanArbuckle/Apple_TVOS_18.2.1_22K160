@interface MTActionController
- (MTColorTheme)colorTheme;
- (id)createMoreAction;
- (void)setAvailableActions:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setupActions;
@end

@implementation MTActionController

- (void)setColorTheme:(id)a3
{
  v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[MTColorTheme isEqual:](colorTheme, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorTheme, a3);
      -[MTActionController setupActions](self, "setupActions");
      v5 = v8;
    }
  }
}

- (void)setAvailableActions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTActionController;
  -[IMActionController setAvailableActions:](&v4, "setAvailableActions:", a3);
  -[MTActionController setupActions](self, "setupActions");
}

- (void)setupActions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F902C;
  v4[3] = &unk_100243990;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (id)createMoreAction
{
  return +[MTMoreActionSheetAction action](&OBJC_CLASS___MTMoreActionSheetAction, "action");
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
}

@end