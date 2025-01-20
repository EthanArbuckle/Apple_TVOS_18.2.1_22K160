@interface TGraphSampler
+ (id)sharedInstance;
- (BOOL)shouldLogSensor:(__CFString *)a3;
- (BOOL)shouldLogSensorForLiteMode:(__CFString *)a3;
- (TGraphSampler)init;
- (__CFString)getTGraphData:(int)a3;
- (void)addtGraphDataSource:(id)a3;
- (void)dealloc;
- (void)genTGraphData;
- (void)genTGraphHeader;
- (void)logToPowerlog;
- (void)setProduct:(id)a3 withComponents:(id)a4 andHotspotSupervisors:(id)a5;
- (void)setTGraphDataString:(__CFString *)a3;
- (void)updateAppleCareState:(int)a3 value:(int)a4;
- (void)updateLiteModePowerLogDictionaryForSensors;
- (void)updatePowerLogDictionaryForSensors;
- (void)updatePowerlogLiteMode:(int64_t)a3 pressureLevel:(int64_t)a4;
- (void)updatePowerlogMiscState:(int)a3 value:(int)a4;
- (void)updateSubkeyController:(id)a3 forControlList:(id)a4;
@end

@implementation TGraphSampler

+ (id)sharedInstance
{
  if (qword_10007C430 != -1) {
    dispatch_once(&qword_10007C430, &stru_100061480);
  }
  return (id)qword_10007C438;
}

- (TGraphSampler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TGraphSampler;
  v2 = -[TGraphSampler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->productObj = 0LL;
    v2->listofComponentControl = 0LL;
    v2->listOfSupervisorControl = 0LL;
    v2->extratGraphDataSources = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    v3->tGraphDataString = 0LL;
    v3->isInternal = 0;
    v3->lastLogTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v3->_powerlogSubkeyController_Hotspots = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_HS");
    v3->_powerlogSubkeyController_Components = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_CP");
    v3->_powerlogSubkeyController_Sensors = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_S1");
    v3->_powerlogSubkeyController_MiscInternalState = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_EX");
    v3->_powerlogSubkeyController_MiscExternalState = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_S2");
    v3->_powerlogSubkeyController_LiteMode = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_Lite");
    v3->_powerlogSubkeyController_HiP = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_HiP");
    v3->_powerlogSubkeyController_Sensors_Components = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]( objc_alloc(&OBJC_CLASS___PowerlogSubkeyController),  "initForSubkey:",  @"TGraph_SC");
    v3->_powerlogQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.powerlog", 0LL);
    uint64_t v4 = 0LL;
    v3->_appleCareState = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  5LL);
    do
      -[NSMutableArray setObject:atIndexedSubscript:]( v3->_appleCareState,  "setObject:atIndexedSubscript:",  &off_100067C08,  v4++);
    while (v4 != 5);
    v3->_appleCareStateLastLogged = -[NSArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithArray:",  v3->_appleCareState);
  }

  return v3;
}

- (void)setProduct:(id)a3 withComponents:(id)a4 andHotspotSupervisors:(id)a5
{
  productObj = self->productObj;
  if (productObj) {
    CFRelease(productObj);
  }
  listofComponentControl = self->listofComponentControl;
  if (listofComponentControl) {
    CFRelease(listofComponentControl);
  }
  listOfSupervisorControl = self->listOfSupervisorControl;
  if (listOfSupervisorControl) {
    CFRelease(listOfSupervisorControl);
  }
  self->productObj = (CommonProduct *)a3;
  self->listofComponentControl = (NSMutableArray *)a4;
  self->listOfSupervisorControl = (NSMutableArray *)a5;
  self->isInternal = sub_100022CCC();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TGraphSampler;
  -[TGraphSampler dealloc](&v3, "dealloc");
}

- (void)addtGraphDataSource:(id)a3
{
  extratGraphDataSources = self->extratGraphDataSources;
  if (extratGraphDataSources) {
    CFArrayAppendValue(extratGraphDataSources, a3);
  }
}

- (void)updateSubkeyController:(id)a3 forControlList:(id)a4
{
  if (a3)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v6 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(a4);
          }
          objc_msgSend( a3,  "setIntValue:forKey:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "getPowerlogFieldCurrentValue"),  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "getPowerlogKey"));
          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }
  }

- (BOOL)shouldLogSensor:(__CFString *)a3
{
  LODWORD(v4) = -[HidSensors shouldRetrieveSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "shouldRetrieveSensor:",  a3);
  if ((_DWORD)v4)
  {
    CFComparisonResult v4 = CFStringCompare(a3, @"Th0x", 0LL);
    if (v4)
    {
      unint64_t v5 = 0LL;
      do
      {
        unint64_t v6 = v5;
        if (v5 == 10) {
          break;
        }
        CFComparisonResult v7 = CFStringCompare(a3, *(&off_1000613C0 + v5 + 1), 0LL);
        unint64_t v5 = v6 + 1;
      }

      while (v7);
      LOBYTE(v4) = v6 > 9;
    }
  }

  return v4;
}

- (BOOL)shouldLogSensorForLiteMode:(__CFString *)a3
{
  if (CFStringCompare(a3, @"TG0B", 0LL) == kCFCompareEqualTo) {
    return 1;
  }
  unint64_t v4 = 0LL;
  do
  {
    unint64_t v5 = v4;
    if (v4 == 12) {
      break;
    }
    CFComparisonResult v6 = CFStringCompare(a3, *(&off_100061418 + v4 + 1), 0LL);
    unint64_t v4 = v5 + 1;
  }

  while (v6);
  return v5 < 0xC;
}

- (void)updatePowerLogDictionaryForSensors
{
  if (self->_powerlogSubkeyController_Sensors)
  {
    int v3 = -[CommonProduct totalSensors](self->productObj, "totalSensors");
    if (v3 >= 1)
    {
      CFIndex v4 = 0LL;
      uint64_t v5 = v3;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"),  v4);
        if (ValueAtIndex)
        {
          CFComparisonResult v7 = ValueAtIndex;
          if (-[TGraphSampler shouldLogSensor:](self, "shouldLogSensor:", ValueAtIndex)) {
            -[PowerlogSubkeyController setIntValue:forKey:]( self->_powerlogSubkeyController_Sensors,  "setIntValue:forKey:",  dword_10007D05C[v4],  v7);
          }
        }

        ++v4;
      }

      while (v5 != v4);
    }

    -[PowerlogSubkeyController setIntValue:forKey:]( self->_powerlogSubkeyController_Sensors,  "setIntValue:forKey:",  sub_100021C84(),  @"PG0B");
  }

- (void)updateLiteModePowerLogDictionaryForSensors
{
  if (!self->gotDataToLogToLiteMode && self->_powerlogSubkeyController_Sensors_Components)
  {
    int v3 = -[CommonProduct totalSensors](self->productObj, "totalSensors");
    if (v3 >= 1)
    {
      CFIndex v4 = 0LL;
      uint64_t v5 = v3;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"),  v4);
        if (!ValueAtIndex
          || !-[TGraphSampler shouldLogSensorForLiteMode:](self, "shouldLogSensorForLiteMode:", ValueAtIndex))
        {
          goto LABEL_16;
        }

        int v7 = dword_10007D05C[v4];
        uint64_t v8 = (char *)self + 4 * v4;
        int v9 = *((_DWORD *)v8 + 16);
        __int16 v10 = v7 - v9;
        if (v7 - v9 < 0) {
          __int16 v10 = v9 - v7;
        }
        if (v9 < dword_1000748C4) {
          break;
        }
        if ((v10 & 0xFFFCu) >= 0x64) {
          goto LABEL_15;
        }
LABEL_16:
        if (v5 == ++v4) {
          goto LABEL_17;
        }
      }

      if (v7 < dword_1000748C4 || (v10 & 0xFFFCu) <= 0x63) {
        goto LABEL_16;
      }
LABEL_15:
      self->gotDataToLogToLiteMode = 1;
      -[PowerlogSubkeyController setIntValue:forKey:]( self->_powerlogSubkeyController_Sensors_Components,  "setIntValue:forKey:");
      *((_DWORD *)v8 + 16) = dword_10007D05C[v4];
      goto LABEL_16;
    }

- (void)setTGraphDataString:(__CFString *)a3
{
  tGraphDataString = self->tGraphDataString;
  if (tGraphDataString) {
    CFRelease(tGraphDataString);
  }
  if (a3) {
    CFComparisonResult v6 = (__CFString *)CFRetain(a3);
  }
  else {
    CFComparisonResult v6 = 0LL;
  }
  self->tGraphDataString = v6;
}

- (__CFString)getTGraphData:(int)a3
{
  if (a3 == 2)
  {
    -[TGraphSampler genTGraphData](self, "genTGraphData");
  }

  else if (a3 == 1)
  {
    -[TGraphSampler genTGraphHeader](self, "genTGraphHeader");
  }

  else
  {
    -[TGraphSampler setTGraphDataString:](self, "setTGraphDataString:", @"Invalid Key");
    CFIndex v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039978(v4);
    }
  }

  return self->tGraphDataString;
}

- (void)genTGraphHeader
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, @"Thermal State");
  CFIndex Count = CFArrayGetCount( -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys"));
  CFIndex v5 = CFArrayGetCount( -[HidSensors synthSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "synthSensorKeys"));
  v57 = self;
  signed int v6 = -[CommonProduct powerSensors](self->productObj, "powerSensors");
  CFIndex v7 = Count - v6;
  if (v7 < 1)
  {
    CFIndex v20 = 0LL;
  }

  else
  {
    signed int v55 = v6;
    CFIndex v8 = 0LL;
    int v9 = CFSTR("(");
    __int16 v10 = &byte_10007CF58;
    do
    {
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v9);
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"),  v8);
      CFStringAppend(MutableCopy, ValueAtIndex);
      CFStringAppend(MutableCopy, @""));
      __int128 v13 = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys"),  v8);
      CFStringAppend(MutableCopy, v13);
      CFArrayAppendValue(Mutable, MutableCopy);
      if (*v10)
      {
        uint64_t v14 = -[HidSensors getFilterTimeConstantForSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getFilterTimeConstantForSensor:",  v8);
        if ((_DWORD)v14)
        {
          uint64_t v15 = v14;
          v16 = v10;
          v17 = v9;
          v18 = CFStringCreateMutableCopy(0LL, 0LL, MutableCopy);
          CFStringAppendFormat(v18, 0LL, @"_f%u", v15);
          CFArrayAppendValue(Mutable, v18);
          v19 = v18;
          int v9 = v17;
          __int16 v10 = v16;
          CFRelease(v19);
        }
      }

      CFRelease(MutableCopy);
      ++v8;
    }

    while (v7 != v8);
    CFIndex v20 = v7;
    signed int v6 = v55;
  }

  uint64_t v21 = v6;
  CFIndex v22 = v7 + v5;
  if (v5 >= 1)
  {
    uint64_t v54 = v6;
    CFIndex v56 = v20;
    CFIndex v23 = 0LL;
    do
    {
      v24 = CFStringCreateMutableCopy(0LL, 0LL, @"(");
      v25 = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"),  v7 + v23);
      CFStringAppend(v24, v25);
      CFStringAppend(v24, @""));
      v26 = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors synthSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "synthSensorKeys"),  v23);
      CFStringAppend(v24, v26);
      CFArrayAppendValue(Mutable, v24);
      CFRelease(v24);
      ++v23;
    }

    while (v7 + v23 < v22);
    uint64_t v21 = v54;
    CFIndex v20 = v56 + v23;
  }

  CFIndex v27 = v20 + v21;
  if (v22 < v20 + v21)
  {
    do
    {
      v28 = CFStringCreateMutableCopy(0LL, 0LL, @"(");
      v29 = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"),  v5 + v7);
      CFStringAppend(v28, v29);
      CFStringAppend(v28, @""));
      v30 = (const __CFString *)CFArrayGetValueAtIndex( -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys"),  v7);
      CFStringAppend(v28, v30);
      CFArrayAppendValue(Mutable, v28);
      CFRelease(v28);
      ++v7;
    }

    while (v5 + v7 < v27);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  listOfSupervisorControl = v57->listOfSupervisorControl;
  id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v63 != v34) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        v36 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        if ((int)[v36 numberOfFields] >= 1)
        {
          uint64_t v37 = 0LL;
          do
          {
            id v38 = [v36 copyHeaderForIndex:v37];
            CFArrayAppendValue(Mutable, v38);
            if (v38) {
              CFRelease(v38);
            }
            uint64_t v37 = (v37 + 1);
          }

          while ((int)v37 < (int)[v36 numberOfFields]);
        }
      }

      id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
    }

    while (v33);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  listofComponentControl = v57->listofComponentControl;
  id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v59;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(listofComponentControl);
        }
        v44 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
        if ((int)[v44 numberOfFields] >= 1)
        {
          uint64_t v45 = 0LL;
          do
          {
            id v46 = [v44 copyHeaderForIndex:v45];
            CFArrayAppendValue(Mutable, v46);
            if (v46) {
              CFRelease(v46);
            }
            uint64_t v45 = (v45 + 1);
          }

          while ((int)v45 < (int)[v44 numberOfFields]);
        }
      }

      id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
    }

    while (v41);
  }

  extratGraphDataSources = v57->extratGraphDataSources;
  if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
  {
    CFIndex v48 = 0LL;
    do
    {
      v49 = (void *)CFArrayGetValueAtIndex(v57->extratGraphDataSources, v48);
      if ((int)[v49 numberOfFields] >= 1)
      {
        uint64_t v50 = 0LL;
        do
        {
          id v51 = [v49 copyHeaderForIndex:v50];
          if (v51)
          {
            v52 = v51;
            CFArrayAppendValue(Mutable, v51);
            CFRelease(v52);
          }

          uint64_t v50 = (v50 + 1);
        }

        while ((int)v50 < (int)[v49 numberOfFields]);
      }

      ++v48;
    }

    while (CFArrayGetCount(v57->extratGraphDataSources) > v48);
  }

  CFStringRef v53 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, Mutable, @", ");
  -[TGraphSampler setTGraphDataString:](v57, "setTGraphDataString:", v53);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v53) {
    CFRelease(v53);
  }
}

- (void)genTGraphData
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    CFIndex v4 = Mutable;
    sub_100011288( Mutable,  @"%d",  50 * -[CommonProduct thermalState](self->productObj, "thermalState"));
    if (-[CommonProduct totalSensors](self->productObj, "totalSensors") >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        sub_100011288(v4, @"%d", dword_10007D05C[v5]);
        if (byte_10007CF58
          && -[HidSensors getFilterTimeConstantForSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getFilterTimeConstantForSensor:",  v5))
        {
          sub_100011288(v4, @"%d", dword_10007CF5C[v5]);
        }

        ++v5;
      }

      while (v5 < -[CommonProduct totalSensors](self->productObj, "totalSensors"));
    }

    if (-[CommonProduct powerSensors](self->productObj, "powerSensors") >= 1)
    {
      uint64_t v6 = 0LL;
      do
        sub_1000112F4(v4, @"%f", *((double *)&xmmword_10007D478 + v6++));
      while (v6 < -[CommonProduct powerSensors](self->productObj, "powerSensors"));
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    listOfSupervisorControl = self->listOfSupervisorControl;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(listOfSupervisorControl);
          }
          __int128 v12 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ((int)[v12 numberOfFields] >= 1)
          {
            uint64_t v13 = 0LL;
            do
            {
              id v14 = [v12 copyFieldCurrentValueForIndex:v13];
              CFArrayAppendValue(v4, v14);
              if (v14) {
                CFRelease(v14);
              }
              uint64_t v13 = (v13 + 1);
            }

            while ((int)v13 < (int)[v12 numberOfFields]);
          }
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      }

      while (v9);
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    listofComponentControl = self->listofComponentControl;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(listofComponentControl);
          }
          CFIndex v20 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          if ((int)[v20 numberOfFields] >= 1)
          {
            uint64_t v21 = 0LL;
            do
            {
              id v22 = [v20 copyFieldCurrentValueForIndex:v21];
              CFArrayAppendValue(v4, v22);
              if (v22) {
                CFRelease(v22);
              }
              uint64_t v21 = (v21 + 1);
            }

            while ((int)v21 < (int)[v20 numberOfFields]);
          }
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v17);
    }

    extratGraphDataSources = self->extratGraphDataSources;
    if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
    {
      CFIndex v24 = 0LL;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->extratGraphDataSources, v24);
        if ((int)[ValueAtIndex numberOfFields] >= 1)
        {
          uint64_t v26 = 0LL;
          do
          {
            id v27 = [ValueAtIndex copyFieldCurrentValueForIndex:v26];
            CFArrayAppendValue(v4, v27);
            if (v27) {
              CFRelease(v27);
            }
            uint64_t v26 = (v26 + 1);
          }

          while ((int)v26 < (int)[ValueAtIndex numberOfFields]);
        }

        ++v24;
      }

      while (CFArrayGetCount(self->extratGraphDataSources) > v24);
    }

    CFStringRef v28 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v4, @", ");
    CFStringRef v29 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @", %@", v28);
    -[TGraphSampler setTGraphDataString:](self, "setTGraphDataString:", v29);
    if (v28) {
      CFRelease(v28);
    }
    if (v29) {
      CFRelease(v29);
    }
    CFRelease(v4);
  }

  else
  {
    v30 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000399B8(v30);
    }
  }

- (void)updatePowerlogMiscState:(int)a3 value:(int)a4
{
  if (a3 <= 6)
  {
    uint64_t v7 = (uint64_t)*(&off_100061388 + a3);
    if (byte_10007CB30)
    {
      id v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = "-[TGraphSampler updatePowerlogMiscState:value:]";
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        __int16 v18 = 1024;
        int v19 = a4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> %s: key %@, value %d", buf, 0x1Cu);
      }
    }

    uint64_t v9 = 45LL;
    if (a3 != 2 && a3 != 4)
    {
      if (!self->isInternal) {
        return;
      }
      uint64_t v9 = 44LL;
    }

    Class v10 = (&self->super.isa)[v9];
    if (v10)
    {
      powerlogQueue = (dispatch_queue_s *)self->_powerlogQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000114C0;
      block[3] = &unk_100060CD0;
      int v13 = a4;
      block[4] = v10;
      block[5] = v7;
      dispatch_async(powerlogQueue, block);
    }
  }

- (void)updatePowerlogLiteMode:(int64_t)a3 pressureLevel:(int64_t)a4
{
  if (!gettimeofday(&v10, 0LL))
  {
    uint64_t v7 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v10.tv_usec / 1000000.0 + (double)v10.tv_sec),  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3),  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4),  0LL);
    powerlogQueue = (dispatch_queue_s *)self->_powerlogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000115C4;
    block[3] = &unk_1000614A8;
    block[4] = self;
    block[5] = v7;
    dispatch_async(powerlogQueue, block);
  }

- (void)updateAppleCareState:(int)a3 value:(int)a4
{
  if (a3 <= 4)
  {
    if (byte_10007CB30)
    {
      uint64_t v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v13 = "-[TGraphSampler updateAppleCareState:value:]";
        __int16 v14 = 1024;
        int v15 = a3;
        __int16 v16 = 1024;
        int v17 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: stateType %d, value %d",  buf,  0x18u);
      }
    }

    powerlogQueue = (dispatch_queue_s *)self->_powerlogQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100011718;
    v9[3] = &unk_100060C58;
    v9[4] = self;
    int v10 = a3;
    int v11 = a4;
    dispatch_async(powerlogQueue, v9);
  }

- (void)logToPowerlog
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v4 = v3 - self->lastLogTimestamp;
  powerlogQueue = (dispatch_queue_s *)self->_powerlogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000118AC;
  block[3] = &unk_1000614D0;
  block[4] = self;
  dispatch_async(powerlogQueue, block);
  uint64_t v6 = (dispatch_queue_s *)self->_powerlogQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000119D4;
  v13[3] = &unk_1000614F8;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v3;
  dispatch_async(v6, v13);
  -[TGraphSampler updateLiteModePowerLogDictionaryForSensors](self, "updateLiteModePowerLogDictionaryForSensors");
  BOOL v7 = qword_10007CB28
    || -[CommonProduct maxControlEffort](self->productObj, "maxControlEffort") > 0
    || self->gotDataToLogToLiteMode;
  int v8 = ++dword_10007C440;
  if (byte_10007C444) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  if (v9) {
    int v10 = 3;
  }
  else {
    int v10 = 63;
  }
  if ((v10 & v8) == 0)
  {
    byte_10007C444 = v7;
    int v11 = (dispatch_queue_s *)self->_powerlogQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100011A28;
    v12[3] = &unk_1000614D0;
    v12[4] = self;
    dispatch_async(v11, v12);
  }

@end