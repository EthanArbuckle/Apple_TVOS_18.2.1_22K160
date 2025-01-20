@interface SCATPointPicker
+ (SCATPointPicker)pointPickerWithMode:(int64_t)a3 menu:(id)a4;
+ (id)mostSuitablePointPickerWithMenu:(id)a3;
- (BOOL)allowsSelectionRefinement;
- (BOOL)hasPickedPoint;
- (BOOL)isRefiningPoint;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldRescanAfterTap;
- (CGPoint)lastReceivedPoint;
- (CGPoint)pickedPoint;
- (CGPoint)pickedPointInDeviceCoordinates;
- (NSValue)realPickedPoint;
- (SCATMenu)menu;
- (SCATPointPickerDelegate)delegate;
- (id)_initWithMenu:(id)a3;
- (id)description;
- (id)identifier;
- (int64_t)pickerType;
- (unint64_t)refinementCount;
- (unsigned)currentDisplayID;
- (void)_savePoint:(CGPoint)a3 andNotifyDelegate:(BOOL)a4;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)moveToPoint:(CGPoint)a3;
- (void)refineSelectedPoint;
- (void)resetRefinedSelectedPoint;
- (void)scannerManager:(id)a3 didActivateElement:(id)a4;
- (void)setCurrentDisplayID:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedPoint:(CGPoint)a3;
- (void)setMenu:(id)a3;
- (void)setRealPickedPoint:(id)a3;
- (void)setRefinementCount:(unint64_t)a3;
- (void)setShouldKeepScannerAwake:(BOOL)a3;
@end

@implementation SCATPointPicker

+ (id)mostSuitablePointPickerWithMenu:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATPointPicker pointPickerWithMode:menu:]( SCATPointPicker,  "pointPickerWithMode:menu:",  [v4 assistiveTouchPreferredPointPicker],  v3));

  return v5;
}

+ (SCATPointPicker)pointPickerWithMode:(int64_t)a3 menu:(id)a4
{
  return 0LL;
}

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATPointPicker;
  v5 = -[SCATPointPicker init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_menu, v4);
    v6->_currentDisplayID = 1;
  }

  return v6;
}

- (id)description
{
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATPointPicker hasPickedPoint](self, "hasPickedPoint")));
  -[SCATPointPicker pickedPoint](self, "pickedPoint");
  v7 = NSStringFromCGPoint(v14);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[SCATPointPicker pickedPointInDeviceCoordinates](self, "pickedPointInDeviceCoordinates");
  v9 = NSStringFromCGPoint(v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATPointPicker allowsSelectionRefinement](self, "allowsSelectionRefinement")));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. HasPoint:%@ localPoint:%@ screenCoordPoint:%@ AllowsRefine:%@",  v5,  self,  v6,  v8,  v10,  v11));

  return v12;
}

- (void)_savePoint:(CGPoint)a3 andNotifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", a3.x, a3.y));
  -[SCATPointPicker setRealPickedPoint:](self, "setRealPickedPoint:", v6);

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
    char v8 = objc_opt_respondsToSelector(v7, "pointPicker:didPickPoint:");

    if ((v8 & 1) != 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATPointPicker delegate](self, "delegate"));
      -[SCATPointPicker pickedPoint](self, "pickedPoint");
      objc_msgSend(v9, "pointPicker:didPickPoint:", self);
    }
  }

- (void)moveToPoint:(CGPoint)a3
{
}

- (BOOL)isRefiningPoint
{
  return -[SCATPointPicker refinementCount](self, "refinementCount") != 0;
}

- (BOOL)hasPickedPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker realPickedPoint](self, "realPickedPoint"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (CGPoint)pickedPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPicker realPickedPoint](self, "realPickedPoint"));
  [v2 CGPointValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)pickedPointInDeviceCoordinates
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "scatUIContextForDisplayID:",  -[SCATPointPicker currentDisplayID](self, "currentDisplayID")));

  -[SCATPointPicker pickedPoint](self, "pickedPoint");
  +[HNDScreen convertPoint:fromView:](&OBJC_CLASS___HNDScreen, "convertPoint:fromView:", v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)allowsSelectionRefinement
{
  return 0;
}

- (id)identifier
{
  return off_100157158[0];
}

- (void)refineSelectedPoint
{
  if (!-[SCATPointPicker hasPickedPoint](self, "hasPickedPoint")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATPointPicker.m",  174LL,  "-[SCATPointPicker refineSelectedPoint]",  @"You should not refineSelectedPoint if there is no picked point to go off of");
  }
  ++self->_refinementCount;
}

- (void)resetRefinedSelectedPoint
{
  self->_refinementCount = 0LL;
}

- (BOOL)shouldRescanAfterTap
{
  return 0;
}

- (void)scannerManager:(id)a3 didActivateElement:(id)a4
{
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  if (a6) {
    objc_msgSend(a3, "beginScanningWithFocusContext:", 0, a4, a5);
  }
}

- (SCATPointPickerDelegate)delegate
{
  return (SCATPointPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSValue)realPickedPoint
{
  return self->_realPickedPoint;
}

- (void)setRealPickedPoint:(id)a3
{
}

- (unint64_t)refinementCount
{
  return self->_refinementCount;
}

- (void)setRefinementCount:(unint64_t)a3
{
  self->_refinementCount = a3;
}

- (BOOL)shouldKeepScannerAwake
{
  return self->_shouldKeepScannerAwake;
}

- (void)setShouldKeepScannerAwake:(BOOL)a3
{
  self->_shouldKeepScannerAwake = a3;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

- (CGPoint)lastReceivedPoint
{
  double x = self->_lastReceivedPoint.x;
  double y = self->_lastReceivedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastReceivedPoint:(CGPoint)a3
{
  self->_lastReceivedPoint = a3;
}

- (unsigned)currentDisplayID
{
  return self->_currentDisplayID;
}

- (void)setCurrentDisplayID:(unsigned int)a3
{
  self->_currentDisplayID = a3;
}

- (SCATMenu)menu
{
  return (SCATMenu *)objc_loadWeakRetained((id *)&self->_menu);
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
}

@end