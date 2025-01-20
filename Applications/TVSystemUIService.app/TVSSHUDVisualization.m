@interface TVSSHUDVisualization
- (NSString)title;
- (TVSSHUDVisualizationDelegate)delegate;
- (UIColor)color;
- (void)_notifyDelegateVisualizationDidChange;
- (void)setColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVSSHUDVisualization

- (void)setTitle:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v6->_title != location[0])
  {
    v3 = (NSString *)[location[0] copy];
    title = v6->_title;
    v6->_title = v3;

    -[TVSSHUDVisualization _notifyDelegateVisualizationDidChange](v6, "_notifyDelegateVisualizationDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (UIColor)color
{
  if (self->_color) {
    return self->_color;
  }
  else {
    return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  }
}

- (void)setColor:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_color != location[0])
  {
    objc_storeStrong((id *)&v4->_color, location[0]);
    -[TVSSHUDVisualization _notifyDelegateVisualizationDidChange](v4, "_notifyDelegateVisualizationDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_notifyDelegateVisualizationDidChange
{
  v3 = self;
  location[1] = (id)a2;
  location[0] = -[TVSSHUDVisualization delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(location[0], "visualizationDidChange:") & 1) != 0) {
    [location[0] visualizationDidChange:v3];
  }
  objc_storeStrong(location, 0LL);
}

- (NSString)title
{
  return self->_title;
}

- (TVSSHUDVisualizationDelegate)delegate
{
  return (TVSSHUDVisualizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end