@interface SCATXYAxisPointPicker
+ (unint64_t)minimumNumberOfCycles;
- (BOOL)allowsSelectionRefinement;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)isRefiningPoint;
- (BOOL)pauseForNumberOfCycles:(unint64_t)a3;
- (BOOL)providesElements;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldRescanAfterTap;
- (BOOL)usesTwoLevelRefinement;
- (SCATFocusContext)sweepFocusContext;
- (id)_initWithMenu:(id)a3;
- (int64_t)pickerType;
- (unint64_t)pickerPhase;
- (void)_handleScannerUIWillHide:(id)a3;
- (void)_handleScannerUIWillShow:(id)a3;
- (void)_updateVisualProviderWithMenu:(id)a3;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)didGetPhaseChangingAction;
- (void)didSweepOverPoint:(CGPoint)a3;
- (void)setPickerPhase:(unint64_t)a3;
- (void)setSweepFocusContext:(id)a3;
- (void)setUsesTwoLevelRefinement:(BOOL)a3;
- (void)visualProviderDidDismiss;
- (void)visualProviderDidPresent;
- (void)visualProviderDidUpdate;
@end

@implementation SCATXYAxisPointPicker

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATXYAxisPointPicker;
  id v5 = -[SCATPointPicker _initWithMenu:](&v9, "_initWithMenu:", v4);
  v6 = v5;
  if (v5)
  {
    [v5 _updateVisualProviderWithMenu:v4];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v6 selector:"_handleScannerUIWillHide:" name:off_100156CB8 object:0];
    [v7 addObserver:v6 selector:"_handleScannerUIWillShow:" name:off_100156CC0 object:0];
  }

  return v6;
}

- (void)_updateVisualProviderWithMenu:(id)a3
{
  id v4 = a3;
  id v5 = -[SCATXYAxisPointPickerViewController initWithElementManager:menu:]( objc_alloc(&OBJC_CLASS___SCATXYAxisPointPickerViewController),  "initWithElementManager:menu:",  self,  v4);

  -[SCATElementManager setVisualProvider:](self, "setVisualProvider:", v5);
}

+ (unint64_t)minimumNumberOfCycles
{
  return 1LL;
}

- (void)didSweepOverPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisPointPicker sweepFocusContext](self, "sweepFocusContext"));
  unsigned __int8 v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisPointPicker sweepFocusContext](self, "sweepFocusContext"));

    if (v8)
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
      char v10 = objc_opt_respondsToSelector(v9, "pointPicker:didSweepOutOfFocusContext:isRefiningPoint:");

      if ((v10 & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisPointPicker sweepFocusContext](self, "sweepFocusContext"));
        objc_msgSend( v11,  "pointPicker:didSweepOutOfFocusContext:isRefiningPoint:",  self,  v12,  -[SCATXYAxisPointPicker isRefiningPoint](self, "isRefiningPoint"));

        -[SCATXYAxisPointPicker setSweepFocusContext:](self, "setSweepFocusContext:", 0LL);
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "elementAtPoint:", x, y));

    if (v19)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 activeElementManager]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v19,  v15,  0LL,  0LL));

      -[SCATXYAxisPointPicker setSweepFocusContext:](self, "setSweepFocusContext:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
      LOBYTE(v15) = objc_opt_respondsToSelector(v17, "pointPicker:didSweepIntoFocusContext:isRefiningPoint:");

      if ((v15 & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
        objc_msgSend( v18,  "pointPicker:didSweepIntoFocusContext:isRefiningPoint:",  self,  v16,  -[SCATXYAxisPointPicker isRefiningPoint](self, "isRefiningPoint"));
      }
    }

    else
    {
      -[SCATXYAxisPointPicker setSweepFocusContext:](self, "setSweepFocusContext:", 0LL);
    }
  }

- (BOOL)pauseForNumberOfCycles:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
  LOBYTE(a3) = [v5 pointPicker:self pauseForNumberOfCycles:a3];

  return a3;
}

- (BOOL)isRefiningPoint
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATXYAxisPointPicker;
  unint64_t v4 = -[SCATXYAxisPointPicker pickerPhase](self, "pickerPhase");
  return (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v4 - 5 < 2;
}

- (BOOL)usesTwoLevelRefinement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v4 = [v3 switchControlPointPickerSelectionStyle] != (id)1
    && -[SCATPointPicker refinementCount](self, "refinementCount") == 0;

  return v4;
}

- (void)setPickerPhase:(unint64_t)a3
{
  self->_pickerPhase = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  [v5 updateWithPhase:a3 withPicker:self];
}

- (int64_t)pickerType
{
  return 1LL;
}

- (BOOL)shouldRescanAfterTap
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectActionHandler]);
  char v4 = [v3 isPending] ^ 1;

  return v4;
}

- (BOOL)allowsSelectionRefinement
{
  return 1;
}

- (BOOL)providesElements
{
  return 0;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v5 = a3;
  if ([v5 action] == (id)100
    || [v5 action] == (id)103
    || [v5 action] == (id)109
    || [v5 action] == (id)104
    || [v5 action] == (id)105)
  {
    -[SCATXYAxisPointPicker didGetPhaseChangingAction](self, "didGetPhaseChangingAction");
    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldKeepScannerAwake
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATXYAxisPointPicker;
  if (-[SCATPointPicker shouldKeepScannerAwake](&v6, "shouldKeepScannerAwake")
    || (id)-[SCATXYAxisPointPicker pickerPhase](self, "pickerPhase") != (id)1)
  {
    return 1;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  BOOL v4 = [v3 numberOfCycles] == 0;

  return v4;
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (!-[SCATXYAxisPointPicker isRefiningPoint](self, "isRefiningPoint"))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___SCATXYAxisPointPicker;
    -[SCATPointPicker didFetchElements:foundNewElements:currentFocusContext:didChangeActiveElementManager:]( &v12,  "didFetchElements:foundNewElements:currentFocusContext:didChangeActiveElementManager:",  v10,  v8,  v11,  v6);
  }
}

- (void)visualProviderDidPresent
{
}

- (void)visualProviderDidUpdate
{
}

- (void)visualProviderDidDismiss
{
}

- (void)didGetPhaseChangingAction
{
  else {
    unsigned int v3 = 0;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 switchControlPointPickerSelectionStyle];

  switch(-[SCATXYAxisPointPicker pickerPhase](self, "pickerPhase"))
  {
    case 0uLL:
      uint64_t v6 = 1LL;
      break;
    case 1uLL:
      BOOL v7 = v3 == 0;
      uint64_t v8 = 4LL;
      uint64_t v9 = 2LL;
      goto LABEL_11;
    case 2uLL:
      BOOL v10 = v5 == (id)2;
      uint64_t v11 = 3LL;
      goto LABEL_15;
    case 3uLL:
      uint64_t v6 = 4LL;
      break;
    case 4uLL:
      BOOL v7 = v3 == 0;
      uint64_t v8 = 7LL;
      uint64_t v9 = 5LL;
LABEL_11:
      if (v7) {
        uint64_t v6 = v8;
      }
      else {
        uint64_t v6 = v9;
      }
      break;
    case 5uLL:
      BOOL v10 = v5 == (id)2;
      uint64_t v11 = 6LL;
LABEL_15:
      if (v10) {
        uint64_t v6 = v11;
      }
      else {
        uint64_t v6 = v11 + 1;
      }
      break;
    case 6uLL:
      uint64_t v6 = 7LL;
      break;
    default:
      uint64_t v6 = 0LL;
      break;
  }

  -[SCATXYAxisPointPicker setPickerPhase:](self, "setPickerPhase:", v6);
}

- (void)_handleScannerUIWillHide:(id)a3
{
}

- (void)_handleScannerUIWillShow:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider", a3));
  unsigned int v5 = [v4 isDisplayed];

  if (v5) {
    -[SCATXYAxisPointPicker setPickerPhase:](self, "setPickerPhase:", 1LL);
  }
}

- (SCATFocusContext)sweepFocusContext
{
  return self->_sweepFocusContext;
}

- (void)setSweepFocusContext:(id)a3
{
}

- (void)setUsesTwoLevelRefinement:(BOOL)a3
{
  self->_usesTwoLevelRefinement = a3;
}

- (unint64_t)pickerPhase
{
  return self->_pickerPhase;
}

- (void).cxx_destruct
{
}

@end