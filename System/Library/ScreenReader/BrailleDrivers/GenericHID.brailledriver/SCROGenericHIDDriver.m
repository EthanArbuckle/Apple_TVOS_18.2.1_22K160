@interface SCROGenericHIDDriver
- (BOOL)_HIDSetMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)_HIDSetMainCells_Legacy:(const char *)a3 length:(int64_t)a4;
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (BOOL)usage:(unsigned int)a3 isSameClassAsUsage:(unsigned int)a4 forUsagePage:(unsigned int)a5;
- (SCROGenericHIDDriver)init;
- (id)_HIDGetInputEvents;
- (id)genericControlRankComparator;
- (id)getInputEvents;
- (id)getRevelantHIDElementsFromRoot;
- (id)modelIdentifier;
- (int)_HIDLoadDriverWithIOElement:(id)a3;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)_mainSizeLegacy;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (unsigned)_eventForGenericControl:(__IOHIDValue *)a3;
- (unsigned)_eventForScreenReaderControl:(__IOHIDValue *)a3;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)_buildRankingTable;
- (void)dealloc;
- (void)setProductId:(unsigned int)a3;
- (void)setVendorId:(unsigned int)a3;
@end

@implementation SCROGenericHIDDriver

- (SCROGenericHIDDriver)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCROGenericHIDDriver;
  v2 = -[SCROGenericHIDDriver init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isDriverLoaded = 0;
    v2->_setMainCellsSEL = "_HIDSetMainCells:length:";
    id v4 = -[SCROGenericHIDDriver methodForSelector:](v2, "methodForSelector:");
    v3->_getInputEventsSEL = "_HIDGetInputEvents";
    v3->_setMainCellsIMP = v4;
    v3->_getInputEventsIMP = -[SCROGenericHIDDriver methodForSelector:](v3, "methodForSelector:");
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    enqueuedEvents = v3->_enqueuedEvents;
    v3->_enqueuedEvents = (NSMutableArray *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
    eventLock = v3->_eventLock;
    v3->_eventLock = v7;

    v3->_numberOfBrailleCells = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCROGenericHIDDriver;
  -[SCROGenericHIDDriver dealloc](&v3, "dealloc");
}

- (unint64_t)interfaceVersion
{
  return 4LL;
}

- (int)loadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transport];
  uint64_t v6 = _SCROD_LOG();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Loading IO element %@ - transport: %@", (uint8_t *)&v11, 0x16u);
  }

  if ((_DWORD)v5 == 8 || (_DWORD)v5 == 4)
  {
    else {
      int v9 = 1;
    }
  }

  else
  {
    int v9 = 3;
  }

  return v9;
}

- (BOOL)unloadDriver
{
  uint64_t v3 = _SCROD_LOG(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Unloading GenericHID Braille Driver", v8, 2u);
  }

  self->_hasBeenUnloaded = 1;
  if (self->_isDriverLoaded)
  {
    self->_isDriverLoaded = 0;
    hidDevice = self->_hidDevice;
    if (hidDevice)
    {
      IOHIDDeviceClose(hidDevice, 0);
      CFRelease(self->_hidDevice);
      self->_hidDevice = 0LL;
    }

    ioSystemFilterClient = self->_ioSystemFilterClient;
    if (ioSystemFilterClient) {
      IOHIDEventSystemClientUnregisterEventFilterCallback(ioSystemFilterClient, sub_2FF0, self, 0LL);
    }
  }

  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return @"com.apple.generic.hid.mobile";
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return self->_isDriverLoaded;
}

- (BOOL)postsKeyboardEvents
{
  return self->_keyboardInputSupported;
}

- (int)brailleInputMode
{
  return 2 * self->_keyboardInputSupported;
}

- (int64_t)_mainSizeLegacy
{
  CFArrayRef v2 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8B50, 0);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = v2;
  int64_t ReportCount = (int64_t)-[__CFArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (ReportCount)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0LL; i != ReportCount; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(__IOHIDElement **)(*((void *)&v9 + 1) + 8 * i);
        if (!IOHIDElementIsArray(v7))
        {
          int64_t ReportCount = IOHIDElementGetReportCount(v7);
          goto LABEL_11;
        }
      }

      int64_t ReportCount = (int64_t)-[__CFArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      if (ReportCount) {
        continue;
      }
      break;
    }
  }

- (int64_t)mainSize
{
  if (self->_isLegacy) {
    return -[SCROGenericHIDDriver _mainSizeLegacy](self, "_mainSizeLegacy");
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v2 = [&off_8BF0 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v2)
  {
    id v3 = v2;
    unint64_t v4 = 0LL;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(&off_8BF0);
        }
        uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v31[0] = @"UsagePage";
        v31[1] = @"Usage";
        v32[0] = &off_8530;
        v32[1] = v6;
        v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL,  v20));
        CFArrayRef v8 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v7, 0);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v9 = v8;
        id v10 = -[__CFArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
        if (v10)
        {
          id v11 = v10;
          uint64_t ReportCount = 0LL;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v9);
              }
              v15 = *(__IOHIDElement **)(*((void *)&v22 + 1) + 8LL * (void)j);
              if (!IOHIDElementIsArray(v15) && ReportCount-- < 1)
              {
                uint64_t ReportCount = IOHIDElementGetReportCount(v15);
                v4 += IOHIDElementGetReportCount(v15);
              }
            }

            id v11 = -[__CFArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
          }

          while (v11);
        }
      }

      id v3 = [&off_8BF0 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v3);
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  unint64_t numberOfBrailleCells = self->_numberOfBrailleCells;
  if (v4 >= numberOfBrailleCells) {
    int64_t v18 = self->_numberOfBrailleCells;
  }
  else {
    int64_t v18 = v4;
  }
  if (numberOfBrailleCells == 0x7FFFFFFFFFFFFFFFLL) {
    return v4;
  }
  else {
    return v18;
  }
}

- (int64_t)statusSize
{
  return 0LL;
}

- (id)getInputEvents
{
  return (id)((uint64_t (*)(SCROGenericHIDDriver *, SEL))self->_getInputEventsIMP)( self,  self->_getInputEventsSEL);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  return ((uint64_t (*)(SCROGenericHIDDriver *, SEL, const char *, int64_t))self->_setMainCellsIMP)( self,  self->_setMainCellsSEL,  a3,  a4);
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (int)_HIDLoadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  CFArrayRef v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  if (!v8)
  {
    uint64_t v39 = _SCROD_LOG(0LL, v7);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v40 = "Failed to load GenericHID braille driver because we have no bundle identifier";
LABEL_35:
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
    }

- (BOOL)_HIDSetMainCells_Legacy:(const char *)a3 length:(int64_t)a4
{
  CFArrayRef v6 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8BA0, 0);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v7 = v6;
  id v8 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v39;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(__IOHIDElement **)(*((void *)&v38 + 1) + 8LL * (void)v12);
        if (!IOHIDElementIsArray(v13) && v10-- < 1)
        {
          uint32_t ReportCount = IOHIDElementGetReportCount(v13);
          CFIndex LogicalMin = IOHIDElementGetLogicalMin(v13);
          CFIndex LogicalMax = IOHIDElementGetLogicalMax(v13);
          int64_t v19 = LogicalMax - LogicalMin;
          if (LogicalMax - LogicalMin <= 254)
          {
            uint64_t v20 = _SCROD_LOG(LogicalMax, v18);
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              int64_t v43 = v19;
              _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "Braille display does not support 8 dots, has maximum range of - %ld",  buf,  0xCu);
            }
          }

          uint64_t v22 = IOHIDElementGetReportCount(v13);
          if (v22 < a4)
          {
            uint64_t v24 = _SCROD_LOG(v22, v23);
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              uint32_t v26 = IOHIDElementGetReportCount(v13);
              *(_DWORD *)buf = 134218240;
              int64_t v43 = a4;
              __int16 v44 = 2048;
              uint64_t v45 = v26;
              _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "Braille display does not support writing %ld cells -- truncating to %ld",  buf,  0x16u);
            }
          }

          uint64_t v10 = ReportCount;
          uint64_t v27 = mach_absolute_time();
          __int128 v28 = IOHIDValueCreateWithBytes(0LL, v13, v27, (const uint8_t *)a3, a4);
          if (v28)
          {
            __int128 v29 = v28;
            IOReturn v30 = IOHIDDeviceSetValue(self->_hidDevice, v13, v28);
            CFRelease(v29);
            if (v30)
            {
              uint64_t v33 = _SCROD_LOG(v31, v32);
              uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_DEFAULT,  "Failed to set value for display cell element",  buf,  2u);
              }
            }
          }
        }

        __int128 v12 = (char *)v12 + 1;
      }

      while (v9 != v12);
      id v35 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
      id v9 = v35;
    }

    while (v35);
  }

  return 1;
}

- (BOOL)_HIDSetMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isLegacy) {
    return -[SCROGenericHIDDriver _HIDSetMainCells_Legacy:length:](self, "_HIDSetMainCells_Legacy:length:");
  }
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v42 = [&off_8C08 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v51;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(&off_8C08);
        }
        uint64_t v44 = v6;
        uint64_t v7 = *(void *)(*((void *)&v50 + 1) + 8 * v6);
        v59[0] = @"UsagePage";
        v59[1] = @"Usage";
        v60[0] = &off_8530;
        v60[1] = v7;
        int64_t v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL,  v41));
        CFArrayRef v8 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v43, 0);
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        id v9 = v8;
        id v10 = -[__CFArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = 0LL;
          uint64_t v13 = *(void *)v47;
          do
          {
            for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v47 != v13) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(__IOHIDElement **)(*((void *)&v46 + 1) + 8LL * (void)i);
              if (!IOHIDElementIsArray(v15) && v12-- < 1)
              {
                uint32_t ReportCount = IOHIDElementGetReportCount(v15);
                CFIndex LogicalMin = IOHIDElementGetLogicalMin(v15);
                CFIndex LogicalMax = IOHIDElementGetLogicalMax(v15);
                int64_t v21 = LogicalMax - LogicalMin;
                if (LogicalMax - LogicalMin <= 254)
                {
                  uint64_t v22 = _SCROD_LOG(LogicalMax, v20);
                  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    int64_t v55 = v21;
                    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "Braille display does not support 8 dots, has maximum range of - %ld",  buf,  0xCu);
                  }
                }

                uint64_t v24 = IOHIDElementGetReportCount(v15);
                int64_t numberOfBrailleCells = self->_numberOfBrailleCells;
                else {
                  int64_t v27 = self->_numberOfBrailleCells;
                }
                uint64_t v28 = v27 & ~(v27 >> 63);
                if (numberOfBrailleCells == 0x7FFFFFFFFFFFFFFFLL) {
                  int64_t v29 = v24;
                }
                else {
                  int64_t v29 = v28;
                }
                if (a4 > v29)
                {
                  uint64_t v30 = _SCROD_LOG(v24, v25);
                  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218240;
                    int64_t v55 = a4;
                    __int16 v56 = 2048;
                    int64_t v57 = v29;
                    _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "Braille display does not support writing %ld cells -- truncating to %ld",  buf,  0x16u);
                  }

                  a4 = v29;
                }

                uint64_t v32 = mach_absolute_time();
                uint64_t v33 = IOHIDValueCreateWithBytes(0LL, v15, v32, (const uint8_t *)a3, a4);
                if (v33)
                {
                  uint64_t v34 = v33;
                  IOReturn v35 = IOHIDDeviceSetValue(self->_hidDevice, v15, v33);
                  CFRelease(v34);
                  if (v35)
                  {
                    uint64_t v38 = _SCROD_LOG(v36, v37);
                    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  "Failed to set value for display cell element",  buf,  2u);
                    }
                  }
                }

                uint64_t v12 = ReportCount;
                a3 += a4;
              }
            }

            id v11 = -[__CFArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
          }

          while (v11);
        }

        uint64_t v6 = v44 + 1;
      }

      while ((id)(v44 + 1) != v42);
      id v42 = [&off_8C08 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }

    while (v42);
  }

  return 1;
}

- (id)_HIDGetInputEvents
{
  id v3 = -[NSMutableArray copy](self->_enqueuedEvents, "copy");
  -[NSMutableArray removeAllObjects](self->_enqueuedEvents, "removeAllObjects");
  -[NSLock unlock](self->_eventLock, "unlock");
  return v3;
}

- (unsigned)_eventForScreenReaderControl:(__IOHIDValue *)a3
{
  Element = IOHIDValueGetElement(a3);
  int Usage = IOHIDElementGetUsage(Element);
  if (!Usage) {
    return 0;
  }
  if (IOHIDValueGetIntegerValue(a3) <= 0) {
    int v6 = 6;
  }
  else {
    int v6 = 65542;
  }
  return v6 | (16 * Usage) | 0x3000;
}

- (unsigned)_eventForGenericControl:(__IOHIDValue *)a3
{
  Element = IOHIDValueGetElement(a3);
  uint64_t Cookie = IOHIDElementGetCookie(Element);
  if (qword_D1F8 != -1) {
    dispatch_once(&qword_D1F8, &stru_8290);
  }
  genericControlRanking = self->_genericControlRanking;
  CFArrayRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", Cookie));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](genericControlRanking, "objectForKey:", v8));

  if ([v9 controlType] == (char *)&dword_0 + 1)
  {
    int v10 = 0x40000;
    id v11 = &off_8C20;
  }

  else if ([v9 controlType] == (char *)&dword_0 + 2)
  {
    int v10 = 393216;
    id v11 = &off_8C38;
  }

  else
  {
    if ([v9 controlType]
      || (unsigned int v16 = [v9 finalRank],
          id v11 = &off_8C50,
          (unint64_t)[&off_8C50 count] <= v16))
    {
      unsigned int v15 = 0;
      goto LABEL_15;
    }

    int v10 = 0x20000;
  }

  if (IOHIDValueGetIntegerValue(a3) <= 0) {
    int v12 = 6;
  }
  else {
    int v12 = 65542;
  }
  id v13 = [v9 finalRank];
  unsigned int v14 = v12 | (16 * sub_4BF8((uint64_t)v13, v13, v11)) & 0xF9FFF0;
  unsigned int v15 = ((v14 | ([v9 finalRank] << 24)) + 0x1000000) | v10;
LABEL_15:

  return v15;
}

- (void)_buildRankingTable
{
  if (!self->_genericControlRanking)
  {
    id v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    genericControlRanking = self->_genericControlRanking;
    self->_genericControlRanking = v3;

    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v71 = self;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v74 = (void *)objc_claimAutoreleasedReturnValue(-[SCROGenericHIDDriver getRevelantHIDElementsFromRoot](self, "getRevelantHIDElementsFromRoot"));
    id obj = (id)objc_claimAutoreleasedReturnValue([v74 allKeys]);
    id v76 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
    if (v76)
    {
      uint64_t v73 = *(void *)v87;
      do
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v87 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v78 = v5;
          int v6 = *(void **)(*((void *)&v86 + 1) + 8 * v5);
          uint64_t v7 = (__IOHIDElement *)[v74 objectForKey:v6];
          uint64_t Usage = IOHIDElementGetUsage(v7);
          uint64_t UsagePage = IOHIDElementGetUsagePage(v7);
          int v10 = objc_alloc_init(&OBJC_CLASS___SCROGenericHIDControlInfo);
          -[SCROGenericHIDControlInfo setUsage:](v10, "setUsage:", Usage);
          int v77 = UsagePage;
          -[SCROGenericHIDControlInfo setUsagePage:](v10, "setUsagePage:", UsagePage);
          -[SCROGenericHIDControlInfo setCookie:](v10, "setCookie:", [v6 unsignedIntegerValue]);
          IOHIDElementRef Parent = IOHIDElementGetParent(v7);
          if (Parent)
          {
            int v12 = Parent;
            int v13 = 0;
            unsigned int v14 = 0LL;
            int v80 = Usage;
            do
            {
              if (IOHIDElementGetType(v12) == kIOHIDElementTypeCollection)
              {
                if (!v14) {
                  unsigned int v14 = v12;
                }
                uint64_t v15 = IOHIDElementGetUsage(v12);
                uint32_t v16 = IOHIDElementGetUsagePage(v12);
                if (v16 == 10)
                {
                  if (!-[SCROGenericHIDControlInfo instanceNumber](v10, "instanceNumber")) {
                    -[SCROGenericHIDControlInfo setInstanceNumber:](v10, "setInstanceNumber:", v15);
                  }
                }

                else if (v16 == 65 && !-[SCROGenericHIDControlInfo collectionUsage](v10, "collectionUsage"))
                {
                  -[SCROGenericHIDControlInfo setCollectionUsage:](v10, "setCollectionUsage:", v15);
                }

                if (v12 == v14 && Usage >= 0x21C && Usage <= 0x21E)
                {
                  CFArrayRef Children = IOHIDElementGetChildren(v12);
                  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(Children);
                  __int128 v82 = 0u;
                  __int128 v83 = 0u;
                  __int128 v84 = 0u;
                  __int128 v85 = 0u;
                  id v19 = [v18 countByEnumeratingWithState:&v82 objects:v90 count:16];
                  if (v19)
                  {
                    id v20 = v19;
                    uint64_t v21 = *(void *)v83;
                    do
                    {
                      for (uint64_t i = 0LL; i != v20; uint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v83 != v21) {
                          objc_enumerationMutation(v18);
                        }
                        uint64_t v23 = *(__IOHIDElement **)(*((void *)&v82 + 1) + 8LL * (void)i);
                        uint32_t v24 = IOHIDElementGetUsage(v23);
                        uint32_t v25 = IOHIDElementGetUsagePage(v23);
                        BOOL v27 = v24 == 542 && v25 == 65;
                        v13 |= v27;
                      }

                      id v20 = [v18 countByEnumeratingWithState:&v82 objects:v90 count:16];
                    }

                    while (v20);
                  }

                  unsigned int v14 = v12;
                  LODWORD(Usage) = v80;
                }
              }

              int v12 = IOHIDElementGetParent(v12);
            }

            while (v12);
          }

          else
          {
            int v13 = 0;
          }

          if (v77 == 65)
          {
            else {
              uint64_t v28 = 2LL;
            }
            -[SCROGenericHIDControlInfo setControlType:](v10, "setControlType:", v28);
          }

          [v75 addObject:v10];

          uint64_t v5 = v78 + 1;
        }

        while ((id)(v78 + 1) != v76);
        id v76 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
      }

      while (v76);
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v75 indexesOfObjectsPassingTest:&stru_82F8]);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v75 indexesOfObjectsPassingTest:&stru_8318]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v75 indexesOfObjectsPassingTest:&stru_8338]);
    __int16 v81 = (void *)v29;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v75 objectsAtIndexes:v29]);
    id v33 = [v32 mutableCopy];

    __int16 v79 = (void *)v30;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v75 objectsAtIndexes:v30]);
    id v35 = [v34 mutableCopy];

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v75 objectsAtIndexes:v31]);
    id v37 = [v36 mutableCopy];

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCROGenericHIDDriver genericControlRankComparator](v71, "genericControlRankComparator"));
    [v33 sortUsingComparator:v38];

    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[SCROGenericHIDDriver genericControlRankComparator](v71, "genericControlRankComparator"));
    [v35 sortUsingComparator:v39];

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCROGenericHIDDriver genericControlRankComparator](v71, "genericControlRankComparator"));
    [v37 sortUsingComparator:v40];

    if ([v33 count])
    {
      uint64_t v41 = 0LL;
      unsigned int v42 = 1;
      do
      {
        uint64_t v43 = [v33 count] + ~(_DWORD)v41;
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:v41]);
        [v44 setFinalRank:v43];

        uint64_t v45 = v71->_genericControlRanking;
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:v41]);
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:v41]);
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v47 cookie]));
        -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v46, v48);

        uint64_t v41 = v42;
        BOOL v49 = (unint64_t)[v33 count] > v42++;
      }

      while (v49);
    }

    if ([v35 count])
    {
      uint64_t v50 = 0LL;
      unsigned int v51 = 1;
      do
      {
        uint64_t v52 = [v35 count] + ~(_DWORD)v50;
        __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v50]);
        [v53 setFinalRank:v52];

        v54 = v71->_genericControlRanking;
        int64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v50]);
        __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v50]);
        int64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v56 cookie]));
        -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v55, v57);

        uint64_t v50 = v51;
        BOOL v49 = (unint64_t)[v35 count] > v51++;
      }

      while (v49);
    }

    if ([v37 count])
    {
      uint64_t v58 = 0LL;
      unsigned int v59 = 1;
      do
      {
        unint64_t v60 = (unint64_t)[v37 count] + ~v58;
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v58]);
        unsigned int v62 = [v61 usage];

        if (v62 - 533 >= 5) {
          unsigned int v63 = 0;
        }
        else {
          unsigned int v63 = v62 - 533;
        }
        if (v62 - 528 <= 4) {
          unsigned int v64 = v62 - 528;
        }
        else {
          unsigned int v64 = v63;
        }
        uint64_t v65 = 5 * (v60 / 5) + v64;
        v66 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v58]);
        [v66 setFinalRank:v65];

        __int128 v67 = v71->_genericControlRanking;
        __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v58]);
        __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v58]);
        __int128 v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v69 cookie]));
        -[NSMutableDictionary setObject:forKey:](v67, "setObject:forKey:", v68, v70);

        uint64_t v58 = v59;
        BOOL v49 = (unint64_t)[v37 count] > v59++;
      }

      while (v49);
    }
  }

- (id)getRevelantHIDElementsFromRoot
{
  CFArrayRef v2 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8BC8, 0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v2;
  id v25 = -[__CFArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
  if (v25)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v4;
        uint64_t v5 = *(void *)(*((void *)&v32 + 1) + 8 * v4);
        int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        [v6 addObject:v5];
        if ([v6 count])
        {
          BOOL v27 = v6;
          do
          {
            uint64_t v7 = (__IOHIDElement *)[v6 firstObject];
            [v6 removeObjectAtIndex:0];
            CFArrayRef Children = IOHIDElementGetChildren(v7);
            id v9 = (void *)objc_claimAutoreleasedReturnValue(Children);
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v10)
            {
              id v11 = v10;
              uint64_t v12 = *(void *)v29;
              do
              {
                for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v29 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  unsigned int v14 = *(__IOHIDElement **)(*((void *)&v28 + 1) + 8LL * (void)i);
                  uint32_t Usage = IOHIDElementGetUsage(v14);
                  uint32_t UsagePage = IOHIDElementGetUsagePage(v14);
                  if (Usage < 0x21F && Usage > 0x20F && UsagePage == 65 || UsagePage == 9)
                  {
                    id v20 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  IOHIDElementGetCookie(v14));
                    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                    [v3 setObject:v14 forKey:v21];
                  }
                }

                id v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }

              while (v11);
            }

            int v6 = v27;
            [v27 addObjectsFromArray:v9];
          }

          while ([v27 count]);
        }

        uint64_t v4 = v26 + 1;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = -[__CFArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
    }

    while (v25);
  }

  return v3;
}

- (BOOL)usage:(unsigned int)a3 isSameClassAsUsage:(unsigned int)a4 forUsagePage:(unsigned int)a5
{
  return a3 == a4
      || a5 == 9
      || a5 == 65 && (a3 - 528 <= 4 && a4 - 528 < 5 || a3 - 533 <= 4 && a4 - 533 < 5 || a3 - 540 <= 2 && a4 - 540 < 3);
}

- (id)genericControlRankComparator
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_57EC;
  v5[3] = &unk_8360;
  v5[4] = self;
  CFArrayRef v2 = objc_retainBlock(v5);
  id v3 = objc_retainBlock(v2);

  return v3;
}

- (unsigned)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(unsigned int)a3
{
  self->_vendorId = a3;
}

- (unsigned)productId
{
  return self->_productId;
}

- (void)setProductId:(unsigned int)a3
{
  self->_productId = a3;
}

- (void).cxx_destruct
{
}

@end