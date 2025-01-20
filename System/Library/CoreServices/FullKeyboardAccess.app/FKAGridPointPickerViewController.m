@interface FKAGridPointPickerViewController
- (NSArray)cachedKeyCommands;
- (id)keyCommands;
- (void)_handleD:(id)a3;
- (void)_handleDownArrow:(id)a3;
- (void)_handleEscape:(id)a3;
- (void)_handleLeftArrow:(id)a3;
- (void)_handleReturn:(id)a3;
- (void)_handleRightArrow:(id)a3;
- (void)_handleShiftReturn:(id)a3;
- (void)_handleSpace:(id)a3;
- (void)_handleUpArrow:(id)a3;
- (void)loadView;
- (void)setCachedKeyCommands:(id)a3;
@end

@implementation FKAGridPointPickerViewController

- (void)loadView
{
  v3 = objc_opt_new(&OBJC_CLASS___FKAGridPointPickerView);
  -[FKAGridPointPickerViewController setView:](self, "setView:", v3);
}

- (id)keyCommands
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController cachedKeyCommands](self, "cachedKeyCommands"));

  if (!v3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @" ",  0LL,  "_handleSpace:"));
    v15[0] = v14;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @"d",  0LL,  "_handleD:"));
    v15[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @"\r",  0LL,  "_handleReturn:"));
    v15[2] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @"\r",  0x20000LL,  "_handleShiftReturn:"));
    v15[3] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputLeftArrow,  0LL,  "_handleLeftArrow:"));
    v15[4] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputRightArrow,  0LL,  "_handleRightArrow:"));
    v15[5] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputUpArrow,  0LL,  "_handleUpArrow:"));
    v15[6] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputDownArrow,  0LL,  "_handleDownArrow:"));
    v15[7] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputEscape,  0LL,  "_handleEscape:"));
    v15[8] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 9LL));
    -[FKAGridPointPickerViewController setCachedKeyCommands:](self, "setCachedKeyCommands:", v12);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[FKAGridPointPickerViewController cachedKeyCommands]( self,  "cachedKeyCommands"));
}

- (void)_handleSpace:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle space", v13, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController view](self, "view"));
  [v6 selectedScreenPoint];
  double v8 = v7;
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  [v11 dismissPointPickerViewController:self];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  objc_msgSend(v12, "pointPickerViewController:tapScreenPoint:", self, v8, v10);
}

- (void)_handleD:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle D", v13, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController view](self, "view"));
  [v6 selectedScreenPoint];
  double v8 = v7;
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  [v11 dismissPointPickerViewController:self];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  objc_msgSend(v12, "pointPickerViewController:doubleTapScreenPoint:", self, v8, v10);
}

- (void)_handleReturn:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle return", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 drillIn];
}

- (void)_handleShiftReturn:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle shift return", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 drillOut];
}

- (void)_handleLeftArrow:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle left arrow", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 moveSelectionLeft];
}

- (void)_handleRightArrow:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle right arrow", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 moveSelectionRight];
}

- (void)_handleUpArrow:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle up arrow", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 moveSelectionUp];
}

- (void)_handleDownArrow:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle down arrow", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v6 moveSelectionDown];
}

- (void)_handleEscape:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handle escape", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  [v6 dismissPointPickerViewController:self];
}

- (NSArray)cachedKeyCommands
{
  return self->_cachedKeyCommands;
}

- (void)setCachedKeyCommands:(id)a3
{
}

- (void).cxx_destruct
{
}

@end