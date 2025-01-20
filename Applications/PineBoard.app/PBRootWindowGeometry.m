@interface PBRootWindowGeometry
- (CGRect)bounds;
- (CGRect)fullDisplayBounds;
- (PBRootWindowGeometry)initWithDisplayConfiguration:(id)a3 fallbackGeometry:(id)a4;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
@end

@implementation PBRootWindowGeometry

- (PBRootWindowGeometry)initWithDisplayConfiguration:(id)a3 fallbackGeometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  Class v10 = NSClassFromString(@"FBSDisplayConfiguration");
  if (!v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100279DEC(a2);
    }
LABEL_12:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x10009EC0CLL);
  }

  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBSDisplayConfigurationClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100279DEC(a2);
    }
    goto LABEL_12;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBRootWindowGeometry;
  v11 = -[PBRootWindowGeometry init](&v22, "init");
  if (v11)
  {
    [v8 bounds];
    v11->_bounds.origin.x = v12;
    v11->_bounds.origin.y = v13;
    v11->_bounds.size.width = v14;
    v11->_bounds.size.height = v15;
    if (sub_1001C9E00())
    {
      [v8 fullDisplayBounds];
      v11->_fullDisplayBounds.origin.x = v16;
      v11->_fullDisplayBounds.origin.y = v17;
      v11->_fullDisplayBounds.size.width = v18;
      v11->_fullDisplayBounds.size.height = v19;
    }
  }

  return v11;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)fullDisplayBounds
{
  double x = self->_fullDisplayBounds.origin.x;
  double y = self->_fullDisplayBounds.origin.y;
  double width = self->_fullDisplayBounds.size.width;
  double height = self->_fullDisplayBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

  ;
}

@end