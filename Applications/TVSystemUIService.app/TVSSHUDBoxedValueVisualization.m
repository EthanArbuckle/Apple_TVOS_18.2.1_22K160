@interface TVSSHUDBoxedValueVisualization
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation TVSSHUDBoxedValueVisualization

- (void)setValue:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_value != location[0])
  {
    objc_storeStrong(&v4->_value, location[0]);
    -[TVSSHUDVisualization _notifyDelegateVisualizationDidChange](v4, "_notifyDelegateVisualizationDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end