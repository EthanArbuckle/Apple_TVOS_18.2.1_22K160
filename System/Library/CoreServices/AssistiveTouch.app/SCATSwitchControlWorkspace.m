@interface SCATSwitchControlWorkspace
+ (id)sharedWorkspace;
- (BOOL)isScannerActive;
- (BOOL)isScannerPaused;
- (CGPoint)headTrackingPoint;
- (SCATElement)currentElement;
- (SCATSwitchControlWorkspace)init;
- (int)scannerType;
- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)accessibilityManager:(id)a3 mediaDidBegin:(__CFData *)a4;
- (void)dealloc;
- (void)scannerManager:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)scannerManager:(id)a3 willUnfocusFromContext:(id)a4;
- (void)scannerManagerDidBecomeActive:(id)a3;
- (void)scannerManagerDidBecomeInactive:(id)a3;
- (void)scannerManagerDidPause:(id)a3;
@end

@implementation SCATSwitchControlWorkspace

+ (id)sharedWorkspace
{
  if (qword_1001576C8 != -1) {
    dispatch_once(&qword_1001576C8, &stru_100123930);
  }
  return (id)qword_1001576C0;
}

- (SCATSwitchControlWorkspace)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATSwitchControlWorkspace;
  v2 = -[SCATSwitchControlWorkspace init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    [v3 addObserver:v2];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    [v4 addObserver:v2];

    *(_WORD *)&v2->_isScannerActive = 0;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATSwitchControlWorkspace;
  -[SCATSwitchControlWorkspace dealloc](&v5, "dealloc");
}

- (SCATElement)currentElement
{
  return self->_currentFocusedElement;
}

- (int)scannerType
{
  return self->_scannerType;
}

- (CGPoint)headTrackingPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pointPicker]);
  [v3 lastReceivedPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  if (a4 == 1)
  {
    if (_AXSAutomationEnabled())
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      double v9 = v8;
      v10 = @"SwitchControlDidReceiveScreenChange";
      goto LABEL_7;
    }
  }

  else if (a4 == 3 && _AXSAutomationEnabled())
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    double v9 = v8;
    v10 = @"SwitchControlDidReceiveLayoutChange";
LABEL_7:
    [v8 postNotificationName:@"SwitchControlEventOccurred" object:v10];
  }
}

- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4
{
  if (_AXSAutomationEnabled(self, a2, a3, a4))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v4 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlApplicationDidChange"];
  }

- (void)accessibilityManager:(id)a3 mediaDidBegin:(__CFData *)a4
{
  if (_AXSAutomationEnabled(self, a2, a3, a4))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v4 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlMediaBeginPlaying"];
  }

- (void)scannerManager:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v12 = a4;
  if (_AXSAutomationEnabled(v12, v6, v7, v8))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v9 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlFocusElementDidChange"];
  }

  v10 = (SCATElement *)objc_claimAutoreleasedReturnValue([v12 element]);
  currentFocusedElement = self->_currentFocusedElement;
  self->_currentFocusedElement = v10;
}

- (void)scannerManager:(id)a3 willUnfocusFromContext:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 activeScannerDriver]);
  self->_isScannerPaused = [v5 isPaused];
}

- (void)scannerManagerDidPause:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled(v4, v5, v6, v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerDidPause"];
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerActive = [v9 isActive];

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerPaused = [v10 isPaused];
}

- (void)scannerManagerDidBecomeActive:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled(v4, v5, v6, v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerBecameActive"];
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerActive = [v9 isActive];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerPaused = [v10 isPaused];

  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_scannerType = [v11 driverType];
}

- (void)scannerManagerDidBecomeInactive:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled(v4, v5, v6, v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerBecameInactive"];
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerActive = [v9 isActive];

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 activeScannerDriver]);
  self->_isScannerPaused = [v10 isPaused];
}

- (BOOL)isScannerActive
{
  return self->_isScannerActive;
}

- (BOOL)isScannerPaused
{
  return self->_isScannerPaused;
}

- (void).cxx_destruct
{
}

@end