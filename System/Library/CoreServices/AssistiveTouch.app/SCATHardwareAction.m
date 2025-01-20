@interface SCATHardwareAction
+ (id)actionForHardwareActionString:(id)a3;
+ (id)crownPress:(unint64_t)a3;
+ (id)crownRotationClockwise:(BOOL)a3;
+ (id)topButtonPress:(unint64_t)a3;
+ (void)_performPress:(unint64_t)a3 numberOfPresses:(unint64_t)a4;
- (BOOL)clockwise;
- (unint64_t)actionType;
- (unint64_t)numberOfPresses;
- (void)performAction;
- (void)setActionType:(unint64_t)a3;
- (void)setClockwise:(BOOL)a3;
- (void)setNumberOfPresses:(unint64_t)a3;
@end

@implementation SCATHardwareAction

+ (id)crownPress:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___SCATHardwareAction);
  -[SCATHardwareAction setActionType:](v4, "setActionType:", 0LL);
  -[SCATHardwareAction setNumberOfPresses:](v4, "setNumberOfPresses:", a3);
  return v4;
}

+ (id)crownRotationClockwise:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___SCATHardwareAction);
  -[SCATHardwareAction setActionType:](v4, "setActionType:", 1LL);
  -[SCATHardwareAction setClockwise:](v4, "setClockwise:", v3);
  return v4;
}

+ (id)topButtonPress:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___SCATHardwareAction);
  -[SCATHardwareAction setActionType:](v4, "setActionType:", 2LL);
  -[SCATHardwareAction setNumberOfPresses:](v4, "setNumberOfPresses:", a3);
  return v4;
}

+ (id)actionForHardwareActionString:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"pressCrownToSetUpLater"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToSetUpManually"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToOpenHome"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToContinue"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToBegin"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToTryAgain"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToSelect"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToStart"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToResume"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownAfterInsertsAttached"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownAfterInsertsRemoved"] & 1) != 0
    || [v4 isEqualToString:@"pressCrownForMoreOptions"])
  {
    id v5 = a1;
    uint64_t v6 = 1LL;
LABEL_14:
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 crownPress:v6]);
    goto LABEL_15;
  }

  if (([v4 isEqualToString:@"doublePressCrownToSetUpManually"] & 1) != 0
    || ([v4 isEqualToString:@"doublePressCrownToContinueWithoutLenses"] & 1) != 0
    || [v4 isEqualToString:@"doublePressCrownToCancel"])
  {
    id v5 = a1;
    uint64_t v6 = 2LL;
    goto LABEL_14;
  }

  if ([v4 isEqualToString:@"pressTopButtonToReplayVideo"])
  {
    id v10 = a1;
    uint64_t v11 = 1LL;
  }

  else
  {
    if (![v4 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
    {
      v8 = 0LL;
      goto LABEL_16;
    }

    id v10 = a1;
    uint64_t v11 = 3LL;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v10 topButtonPress:v11]);
LABEL_15:
  v8 = (void *)v7;
LABEL_16:

  return v8;
}

- (void)performAction
{
  unint64_t v3 = -[SCATHardwareAction actionType](self, "actionType");
  if (v3 == 2)
  {
LABEL_4:
    *(void *)&double v5 = objc_opt_class(self, v4).n128_u64[0];
    _objc_msgSend( v7,  "_performPress:numberOfPresses:",  -[SCATHardwareAction actionType](self, "actionType", v5),  -[SCATHardwareAction numberOfPresses](self, "numberOfPresses"));
    return;
  }

  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_4;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  if (-[SCATHardwareAction clockwise](self, "clockwise")) {
    uint64_t v6 = 40LL;
  }
  else {
    uint64_t v6 = -40LL;
  }
  [v8 turnDigitalCrown:v6];
}

+ (void)_performPress:(unint64_t)a3 numberOfPresses:(unint64_t)a4
{
  if (a3 == 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v12 pressLockButtonDown];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v13 liftLockButtonUp];

    if (a4 < 2) {
      return;
    }
    v14 = _NSConcreteStackBlock;
    id v10 = sub_10004282C;
    uint64_t v11 = &v14;
    goto LABEL_7;
  }

  if (!a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v7 pressHomeButtonDown];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v8 liftHomeButtonUp];

    if (a4 >= 2)
    {
      v15 = _NSConcreteStackBlock;
      id v10 = sub_100042818;
      uint64_t v11 = &v15;
LABEL_7:
      v11[1] = (void **)3221225472LL;
      v11[2] = (void **)v10;
      v11[3] = (void **)&unk_100123410;
      v11[4] = (void **)a1;
      v11[5] = (void **)a3;
      v11[6] = (void **)a4;
      AXPerformBlockOnMainThreadAfterDelay(v11, v9, 0.2);
    }
  }

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
}

- (unint64_t)numberOfPresses
{
  return self->_numberOfPresses;
}

- (void)setNumberOfPresses:(unint64_t)a3
{
  self->_numberOfPresses = a3;
}

@end