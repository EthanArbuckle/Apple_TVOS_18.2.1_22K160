@interface FKACrosshairPointPickerViewController
- (NSArray)cachedKeyCommands;
- (id)keyCommands;
- (void)_handleCommandDownArrow:(id)a3;
- (void)_handleCommandLeftArrow:(id)a3;
- (void)_handleCommandRightArrow:(id)a3;
- (void)_handleCommandUpArrow:(id)a3;
- (void)_handleD:(id)a3;
- (void)_handleDownArrow:(id)a3;
- (void)_handleEscape:(id)a3;
- (void)_handleLeftArrow:(id)a3;
- (void)_handleRightArrow:(id)a3;
- (void)_handleShiftDownArrow:(id)a3;
- (void)_handleShiftLeftArrow:(id)a3;
- (void)_handleShiftRightArrow:(id)a3;
- (void)_handleShiftUpArrow:(id)a3;
- (void)_handleSpace:(id)a3;
- (void)_handleUpArrow:(id)a3;
- (void)loadView;
- (void)setCachedKeyCommands:(id)a3;
@end

@implementation FKACrosshairPointPickerViewController

- (void)loadView
{
  v3 = objc_opt_new(&OBJC_CLASS___FKACrosshairPointPickerView);
  -[FKACrosshairPointPickerViewController setView:](self, "setView:", v3);
}

- (id)keyCommands
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController cachedKeyCommands](self, "cachedKeyCommands"));

  if (!v3)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @" ",  0LL,  "_handleSpace:"));
    v21[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  @"d",  0LL,  "_handleD:"));
    v21[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputLeftArrow,  0LL,  "_handleLeftArrow:"));
    v21[2] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputLeftArrow,  0x20000LL,  "_handleShiftLeftArrow:"));
    v21[3] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputLeftArrow,  0x100000LL,  "_handleCommandLeftArrow:"));
    v21[4] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputRightArrow,  0LL,  "_handleRightArrow:"));
    v21[5] = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputRightArrow,  0x20000LL,  "_handleShiftRightArrow:"));
    v21[6] = v14;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputRightArrow,  0x100000LL,  "_handleCommandRightArrow:"));
    v21[7] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputUpArrow,  0LL,  "_handleUpArrow:"));
    v21[8] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputUpArrow,  0x20000LL,  "_handleShiftUpArrow:"));
    v21[9] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputUpArrow,  0x100000LL,  "_handleCommandUpArrow:"));
    v21[10] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputDownArrow,  0LL,  "_handleDownArrow:"));
    v21[11] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputDownArrow,  0x20000LL,  "_handleShiftDownArrow:"));
    v21[12] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputDownArrow,  0x100000LL,  "_handleCommandDownArrow:"));
    v21[13] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithInput:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithInput:modifierFlags:action:",  UIKeyInputEscape,  0LL,  "_handleEscape:"));
    v21[14] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 15LL));
    -[FKACrosshairPointPickerViewController setCachedKeyCommands:](self, "setCachedKeyCommands:", v12);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[FKACrosshairPointPickerViewController cachedKeyCommands]( self,  "cachedKeyCommands"));
}

- (void)_handleSpace:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate", a3));
  [v4 dismissPointPickerViewController:self];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 selectedScreenPoint];
  objc_msgSend(v6, "pointPickerViewController:tapScreenPoint:", self);
}

- (void)_handleD:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate", a3));
  [v4 dismissPointPickerViewController:self];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 selectedScreenPoint];
  objc_msgSend(v6, "pointPickerViewController:doubleTapScreenPoint:", self);
}

- (void)_handleLeftArrow:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v3 moveLeft];
}

- (void)_handleShiftLeftArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 increaseXPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveLeft];
}

- (void)_handleCommandLeftArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 decreaseXPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveLeft];
}

- (void)_handleRightArrow:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v3 moveRight];
}

- (void)_handleShiftRightArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 increaseXPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveRight];
}

- (void)_handleCommandRightArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 decreaseXPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveRight];
}

- (void)_handleUpArrow:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v3 moveUp];
}

- (void)_handleShiftUpArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 increaseYPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveUp];
}

- (void)_handleCommandUpArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 decreaseYPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveUp];
}

- (void)_handleDownArrow:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v3 moveDown];
}

- (void)_handleShiftDownArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 increaseYPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveDown];
}

- (void)_handleCommandDownArrow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView", a3));
  [v4 decreaseYPrecision];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKACrosshairPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 moveDown];
}

- (void)_handleEscape:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FKAPointPickerViewController delegate](self, "delegate", a3));
  [v4 dismissPointPickerViewController:self];
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