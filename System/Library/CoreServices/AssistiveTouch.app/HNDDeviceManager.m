@interface HNDDeviceManager
+ (id)sharedManager;
- (BOOL)detectDevices;
- (BOOL)shouldDisableMainPointerStatusForUnitTesting;
- (HNDDeviceDetector)deviceDetector;
- (HNDDeviceManager)init;
- (HNDHandManager)handManager;
- (int64_t)deviceCount;
- (int64_t)deviceCountWithSecondaryButtons;
- (void)_notifyDisplayManagerDeviceCountChanged;
- (void)addDevice:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 didPostEvent:(id)a4;
- (void)device:(id)a3 didUnload:(BOOL)a4;
- (void)deviceDetector:(id)a3 didFindDevice:(__IOHIDDevice *)a4;
- (void)deviceDetector:(id)a3 unloadDevicesPassingTest:(id)a4;
- (void)removeAllDevices;
- (void)removeDevice:(id)a3;
- (void)restartDeviceDetection;
- (void)setDetectDevices:(BOOL)a3;
- (void)setDeviceDetector:(id)a3;
- (void)setHandManager:(id)a3;
- (void)setShouldDisableMainPointerStatusForUnitTesting:(BOOL)a3;
@end

@implementation HNDDeviceManager

+ (id)sharedManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceManager]);

  return v3;
}

- (HNDDeviceManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HNDDeviceManager;
  v2 = -[HNDDeviceManager init](&v11, "init");
  v3 = (HNDDeviceManager *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(0xC1E6CEAF20000000LL);
    *((void *)v2 + 5) = 0x3FE0000000000000LL;
    v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    scrollHysteresisTimer = v3->_scrollHysteresisTimer;
    v3->_scrollHysteresisTimer = v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    devices = v3->_devices;
    v3->_devices = (NSMutableArray *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___HNDDeviceDetector);
    deviceDetector = v3->_deviceDetector;
    v3->_deviceDetector = v8;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDDeviceManager;
  -[HNDDeviceManager dealloc](&v3, "dealloc");
}

- (void)setDetectDevices:(BOOL)a3
{
  if (self->_detectDevices != a3)
  {
    self->_detectDevices = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDeviceManager deviceDetector](self, "deviceDetector"));
    v5 = v4;
    if (self->_detectDevices)
    {
      [v4 setDelegate:self];
      [v5 setDetectDevices:1];
    }

    else
    {
      [v4 setDelegate:0];
      [v5 setDetectDevices:0];
      id v6 = -[NSMutableArray copy](self->_devices, "copy");
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "unload", (void)v12);
          }

          id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v9);
      }

      -[NSMutableArray removeAllObjects](self->_devices, "removeAllObjects");
    }
  }

- (void)restartDeviceDetection
{
  BOOL v3 = -[HNDDeviceManager detectDevices](self, "detectDevices");
  -[HNDDeviceManager setDetectDevices:](self, "setDetectDevices:", 0LL);
  -[HNDDeviceManager setDetectDevices:](self, "setDetectDevices:", v3);
}

- (void)deviceDetector:(id)a3 didFindDevice:(__IOHIDDevice *)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_devices;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      if (v8 == (id)++v10)
      {
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:

    objc_super v11 = +[HNDDevice createNewDevice:](&OBJC_CLASS___HNDDevice, "createNewDevice:", a4);
    id v6 = v11;
    if (v11)
    {
      -[NSMutableArray setDelegate:](v11, "setDelegate:", self);
      id v12 = -[NSMutableArray load](v6, "load");
      if ((_DWORD)v12)
      {
        uint64_t v13 = ASTLogCommon(v12);
        __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Adding device: %@", buf, 0xCu);
        }

        -[NSMutableArray addObject:](self->_devices, "addObject:", v6);
        -[HNDDeviceManager _notifyDisplayManagerDeviceCountChanged](self, "_notifyDisplayManagerDeviceCountChanged");
      }
    }
  }
}

- (void)deviceDetector:(id)a3 unloadDevicesPassingTest:(id)a4
{
  id v5 = a4;
  devices = self->_devices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007BB4;
  v13[3] = &unk_100121C60;
  id v7 = v5;
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](devices, "indexesOfObjectsPassingTest:", v13));
  id v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = ASTLogCommon(v9);
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000AE920((uint64_t)v8, v11);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectsAtIndexes:](self->_devices, "objectsAtIndexes:", v8));
    [v12 makeObjectsPerformSelector:"unload"];
  }
}

- (void)device:(id)a3 didUnload:(BOOL)a4
{
  if (a4)
  {
    -[NSMutableArray removeObject:](self->_devices, "removeObject:", a3);
    -[HNDDeviceManager _notifyDisplayManagerDeviceCountChanged](self, "_notifyDisplayManagerDeviceCountChanged");
  }

- (void)device:(id)a3 didPostEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ASTLogCommon(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000AE994((uint64_t)v6, (uint64_t)v7, v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDeviceManager handManager](self, "handManager"));
  [v10 touchSpeedMultiplier];
  double v12 = v11;
  unsigned int v13 = [v7 type];
  if (v13 - 1 < 2)
  {
    [v10 handleButtonEvent:v7];
  }

  else if (v13 == 4)
  {
    [v7 deltaY];
    [v7 setDeltaY:v21 * 25.0];
    [v7 deltaY];
    self->_scrollAmount = (uint64_t)(v22 + (double)self->_scrollAmount);
    if ((-[AXDispatchTimer isPending](self->_scrollHysteresisTimer, "isPending") & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDeviceManager handManager](self, "handManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 currentDisplayManager]);
      [v24 screenPoint];
      double v26 = v25;
      double v28 = v27;

      v31[0] = 0LL;
      v31[1] = v31;
      v31[2] = 0x3032000000LL;
      v31[3] = sub_100007E70;
      v31[4] = sub_100007E80;
      id v32 = (id)objc_claimAutoreleasedReturnValue( +[AXUIElement uiApplicationAtCoordinate:]( &OBJC_CLASS___AXUIElement,  "uiApplicationAtCoordinate:",  v26,  v28));
      scrollHysteresisTimer = self->_scrollHysteresisTimer;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100007E88;
      v30[3] = &unk_100121C88;
      *(double *)&v30[6] = v26;
      *(double *)&v30[7] = v28;
      v30[4] = self;
      v30[5] = v31;
      -[AXDispatchTimer afterDelay:processBlock:](scrollHysteresisTimer, "afterDelay:processBlock:", v30, 0.025);
      _Block_object_dispose(v31, 8);
    }
  }

  else if (v13 == 3)
  {
    [v7 deltaX];
    [v7 setDeltaX:v14 * self->_allowedMoveRate];
    [v7 deltaY];
    [v7 setDeltaY:v15 * self->_allowedMoveRate];
    [v7 deltaX];
    [v7 setDeltaX:v12 * v16];
    [v7 deltaY];
    [v7 setDeltaY:v12 * v17];
    [v7 deltaX];
    double v19 = v18;
    [v7 deltaY];
    objc_msgSend(v10, "moveFingerByDelta:", v19, v20);
  }
}

- (int64_t)deviceCountWithSecondaryButtons
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = self->_devices;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "secondaryButton", (void)v9);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v4);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (void)addDevice:(id)a3
{
}

- (void)removeDevice:(id)a3
{
}

- (void)removeAllDevices
{
}

- (int64_t)deviceCount
{
  return (int64_t)-[NSMutableArray count](self->_devices, "count");
}

- (void)_notifyDisplayManagerDeviceCountChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDeviceManager handManager](self, "handManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008228;
  v4[3] = &unk_100121CB0;
  v4[4] = self;
  [v3 enumerateDisplayManagersWithBlock:v4];
}

- (BOOL)detectDevices
{
  return self->_detectDevices;
}

- (HNDHandManager)handManager
{
  return (HNDHandManager *)objc_loadWeakRetained((id *)&self->_handManager);
}

- (void)setHandManager:(id)a3
{
}

- (HNDDeviceDetector)deviceDetector
{
  return self->_deviceDetector;
}

- (void)setDeviceDetector:(id)a3
{
}

- (BOOL)shouldDisableMainPointerStatusForUnitTesting
{
  return self->_shouldDisableMainPointerStatusForUnitTesting;
}

- (void)setShouldDisableMainPointerStatusForUnitTesting:(BOOL)a3
{
  self->_shouldDisableMainPointerStatusForUnitTesting = a3;
}

- (void).cxx_destruct
{
}

@end