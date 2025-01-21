@interface HIDAppleSiriRemoteDevice
+ (id)getAudioHIDReportDescriptor;
+ (id)getButtonsHIDReportDescriptor:(unsigned __int16)a3;
+ (id)getDeviceManagementHIDReportDescriptor;
+ (id)getInertialHIDReportDescriptor;
+ (id)getInfraredHIDReportDescriptor;
+ (id)getProximityHIDReportDescriptor;
+ (id)getRadioHIDReportDescriptor;
+ (id)getTouchHIDReportDescriptor;
+ (id)properties:(id)a3 locationIdOffset:(unsigned int)a4 hidDescriptor:(id)a5 extendedData:(id)a6;
- (BOOL)firstButton;
- (BOOL)matchInstanceIDInHidEventDriver:(unsigned int)a3;
- (DoAPAudioRelay)doapAudioRelay;
- (HIDAppleSiriRemoteDevice)initWithProperties:(id)a3 reports:(id)a4;
- (IONotificationPort)notificationPort;
- (NSDate)lastAudioDate;
- (NSDictionary)properties;
- (NSMutableArray)audioBuffer;
- (NSMutableArray)cachedButtonsAndTimestamps;
- (NSMutableData)inertialData;
- (NSMutableData)touchData;
- (NSMutableSet)pathIDs;
- (NSString)serialNumber;
- (OS_dispatch_group)groupDeviceManagement;
- (OS_dispatch_group)groupInertial;
- (OS_dispatch_group)groupInit;
- (OS_dispatch_group)groupProximity;
- (OS_dispatch_group)groupStart;
- (OS_dispatch_group)groupTouch;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (OS_dispatch_semaphore)gotDeviceExtendedInfoReport;
- (OS_dispatch_semaphore)sentHostReadyReport;
- (id)audio;
- (id)buttons;
- (id)desiredConnectionParameters;
- (id)deviceManagement;
- (id)inertial;
- (id)infrared;
- (id)proximity;
- (id)radio;
- (id)touch;
- (int)connectedStandbyToken;
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7;
- (int)latency;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7 error:(id *)a8;
- (unint64_t)inputReportTimestamp;
- (unsigned)amdNotification;
- (unsigned)buttonData;
- (unsigned)buttonInterestNotification;
- (unsigned)deviceMgtNotification;
- (unsigned)instanceID;
- (unsigned)productID;
- (unsigned)proximityData;
- (void)appleMultitouchDeviceArrived:(unsigned int)a3;
- (void)clearAppleMultitouchDeviceNotification;
- (void)clearButtonInterestNotification;
- (void)clearDeviceManagementNotification;
- (void)dealloc;
- (void)demultiplexInputReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5;
- (void)deviceMgtDriverArrived:(unsigned int)a3;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)extractButtonDataFromReport:(char *)a3 buttonIndex:(unsigned __int8)a4;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleButtonData;
- (void)handleDeviceManagementData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleInertialData;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)handleInputReportDataV1:(id)a3 reportID:(unsigned __int8)a4;
- (void)handleInputReportDataV2:(id)a3 reportID:(unsigned __int8)a4;
- (void)handleProximityData;
- (void)handleTouchData;
- (void)logHwFwVersions;
- (void)logTouchData;
- (void)sendButtonDataToUserDevice:(unsigned __int16)a3 withTimestamp:(unint64_t)a4;
- (void)setAmdNotification:(unsigned int)a3;
- (void)setAudio:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setButtonData:(unsigned __int16)a3;
- (void)setButtonInterestNotification:(unsigned int)a3;
- (void)setButtons:(id)a3;
- (void)setCachedButtonsAndTimestamps:(id)a3;
- (void)setConnectedStandbyToken:(int)a3;
- (void)setDeviceManagement:(id)a3;
- (void)setDeviceMgtNotification:(unsigned int)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setFirstButton:(BOOL)a3;
- (void)setInertial:(id)a3;
- (void)setInfrared:(id)a3;
- (void)setInputReportTimestamp:(unint64_t)a3;
- (void)setLastAudioDate:(id)a3;
- (void)setLatency:(int)a3;
- (void)setNormalPeripheralLatency;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setProximity:(id)a3;
- (void)setProximityData:(unsigned __int8)a3;
- (void)setQueue:(id)a3;
- (void)setRadio:(id)a3;
- (void)setSleepPeripheralLatency;
- (void)setTouch:(id)a3;
- (void)setZeroPeripheralLatency;
- (void)start;
- (void)stop;
- (void)verifyButtonDriverOpenedByEventSystem:(unsigned int)a3;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation HIDAppleSiriRemoteDevice

+ (id)getTouchHIDReportDescriptor
{
  v3[0] = xmmword_100048101;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_100048101 + 15);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v3,  31LL));
}

+ (id)getButtonsHIDReportDescriptor:(unsigned __int16)a3
{
  if ((a3 & 0xFFFE) == 0x314)
  {
    *(_OWORD *)v7 = xmmword_100048140;
    *(_OWORD *)&v7[16] = unk_100048150;
    *(void *)&v7[31] = 0xC00102B201950680LL;
    __int128 v5 = xmmword_100048120;
    __int128 v6 = unk_100048130;
    uint64_t v3 = 71LL;
  }

  else
  {
    __int128 v5 = xmmword_100048167;
    __int128 v6 = unk_100048177;
    *(_OWORD *)v7 = xmmword_100048187;
    *(void *)&v7[15] = 0xC00102B201950680LL;
    uint64_t v3 = 55LL;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v5,  v3,  v5,  v6,  *(_OWORD *)v7,  *(_OWORD *)&v7[16],  *(void *)&v7[32]));
}

+ (id)getInertialHIDReportDescriptor
{
  __int128 v3 = xmmword_10004819E;
  v4[0] = unk_1000481AE;
  *(_OWORD *)((char *)v4 + 15) = unk_1000481BD;
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v3,  47LL));
}

+ (id)getInfraredHIDReportDescriptor
{
  v3[0] = xmmword_1000481CD;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_1000481CD + 15);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v3,  31LL));
}

+ (id)getAudioHIDReportDescriptor
{
  v3[0] = xmmword_1000481EC;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_1000481EC + 15);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v3,  31LL));
}

+ (id)getRadioHIDReportDescriptor
{
  v3[0] = xmmword_10004820B;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_10004820B + 15);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v3,  31LL));
}

+ (id)getDeviceManagementHIDReportDescriptor
{
  __int128 v3 = xmmword_10004822A;
  *(_OWORD *)v4 = unk_10004823A;
  *(_DWORD *)&v4[15] = -1073675598;
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v3,  35LL));
}

+ (id)getProximityHIDReportDescriptor
{
  v3[0] = xmmword_10004824D;
  v3[1] = unk_10004825D;
  char v4 = -64;
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v3,  33LL));
}

+ (id)properties:(id)a3 locationIdOffset:(unsigned int)a4 hidDescriptor:(id)a5 extendedData:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 mutableCopy];
  v13 = v12;
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:@"ReportDescriptor"];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"ExtendedData"];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"LocationID"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 unsignedLongValue] + a4));
  [v13 setObject:v15 forKeyedSubscript:@"LocationID"];

  return v13;
}

- (HIDAppleSiriRemoteDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038B84(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (byte_100070CC0) {
    kdebug_trace(730595328LL, dword_100070BD8, 0LL, 0LL, 0LL);
  }
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
  v16 = -[HIDBluetoothDevice initWithProperties:reports:](&v59, "initWithProperties:reports:", v6, v7);
  v17 = v16;
  if (v16)
  {
    int v18 = dword_100070BD8++;
    v16->_instanceID = v18;
    v16->_firstButton = 1;
    v19 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v17->_instanceID));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, @"InstanceID");

    objc_storeStrong((id *)&v17->_properties, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ProductID"]);
    v17->_productID = (unsigned __int16)[v21 unsignedIntValue];

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SerialNumber"]);
    serialNumber = v17->_serialNumber;
    v17->_serialNumber = (NSString *)v22;

    v17->_latency = 0;
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    audioBuffer = v17->_audioBuffer;
    v17->_audioBuffer = v24;

    v17->_connectedStandbyToken = -1;
    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pathIDs = v17->_pathIDs;
    v17->_pathIDs = v26;

    v28 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 512LL);
    touchData = v17->_touchData;
    v17->_touchData = v28;

    v30 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 512LL);
    inertialData = v17->_inertialData;
    v17->_inertialData = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cachedButtonsAndTimestamps = v17->_cachedButtonsAndTimestamps;
    v17->_cachedButtonsAndTimestamps = v32;

    dispatch_group_t v34 = dispatch_group_create();
    groupInit = v17->_groupInit;
    v17->_groupInit = (OS_dispatch_group *)v34;

    dispatch_group_t v36 = dispatch_group_create();
    groupStart = v17->_groupStart;
    v17->_groupStart = (OS_dispatch_group *)v36;

    dispatch_group_t v38 = dispatch_group_create();
    groupDeviceManagement = v17->_groupDeviceManagement;
    v17->_groupDeviceManagement = (OS_dispatch_group *)v38;

    dispatch_group_t v40 = dispatch_group_create();
    groupTouch = v17->_groupTouch;
    v17->_groupTouch = (OS_dispatch_group *)v40;

    dispatch_group_t v42 = dispatch_group_create();
    groupInertial = v17->_groupInertial;
    v17->_groupInertial = (OS_dispatch_group *)v42;

    dispatch_group_t v44 = dispatch_group_create();
    groupProximity = v17->_groupProximity;
    v17->_groupProximity = (OS_dispatch_group *)v44;

    BOOL v46 = v17->_groupInit
       && v17->_groupStart
       && v17->_groupDeviceManagement
       && v17->_groupTouch
       && v17->_groupInertial
       && v17->_groupProximity;
    dispatch_semaphore_t v47 = dispatch_semaphore_create(0LL);
    gotDeviceExtendedInfoReport = v17->_gotDeviceExtendedInfoReport;
    v17->_gotDeviceExtendedInfoReport = (OS_dispatch_semaphore *)v47;

    dispatch_semaphore_t v49 = dispatch_semaphore_create(0LL);
    sentHostReadyReport = v17->_sentHostReadyReport;
    v17->_sentHostReadyReport = (OS_dispatch_semaphore *)v49;

    dispatch_semaphore_t v51 = dispatch_semaphore_create(1LL);
    doapAudioStart = v17->_doapAudioStart;
    v17->_doapAudioStart = (OS_dispatch_semaphore *)v51;

    if (!v17->_gotDeviceExtendedInfoReport || !v17->_sentHostReadyReport || !v17->_doapAudioStart) {
      BOOL v46 = 0;
    }
    v53 = -[HIDBluetoothDevice allocHIDQueue](v17, "allocHIDQueue");
    queue = v17->_queue;
    v17->_queue = v53;

    char v55 = 0;
    if (v46 && v17->_queue)
    {
      v56 = IONotificationPortCreate(kIOMainPortDefault);
      v17->_notificationPort = v56;
      if (v56)
      {
        IONotificationPortSetDispatchQueue(v56, (dispatch_queue_t)v17->_queue);
        dispatch_set_context((dispatch_object_t)v17->_queue, v17);
        dispatch_set_finalizer_f((dispatch_object_t)v17->_queue, (dispatch_function_t)sub_100004998);
        char v55 = 1;
      }

      else
      {
        char v55 = 0;
      }
    }

    if (byte_100070CC0) {
      kdebug_trace(730595332LL, v17->_instanceID, 0LL, 0LL, 0LL);
    }
    if ((v55 & 1) == 0)
    {
      notificationPort = v17->_notificationPort;
      if (notificationPort)
      {
        IONotificationPortDestroy(notificationPort);
        v17->_notificationPort = 0LL;
      }

      v17 = 0LL;
    }
  }

  return v17;
}

- (void)dealloc
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038C64(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (self->_doapAudioRelay) {
    -[HIDAppleSiriRemoteDevice stop](self, "stop");
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice dealloc](&v11, "dealloc");
}

- (void)stop
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038CD4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  objc_super v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v11);

  uint64_t v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));

  if (v13)
  {
    uint64_t v14 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));
    dispatch_semaphore_signal(v14);
  }

  objc_sync_exit(v12);

  -[HIDAppleSiriRemoteDevice setButtonData:](v12, "setButtonData:", 0LL);
  -[HIDAppleSiriRemoteDevice handleButtonData](v12, "handleButtonData");
  if (-[HIDAppleSiriRemoteDevice proximityData](v12, "proximityData"))
  {
    -[HIDAppleSiriRemoteDevice setProximityData:](v12, "setProximityData:", 0LL);
    -[HIDAppleSiriRemoteDevice handleProximityData](v12, "handleProximityData");
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](v12, "doapAudioRelay"));
  [v15 invalidate];

  -[HIDAppleSiriRemoteDevice setDoapAudioRelay:](v12, "setDoapAudioRelay:", 0LL);
  v20.receiver = v12;
  v20.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice stop](&v20, "stop");
  id location = 0LL;
  objc_initWeak(&location, v12);
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](v12, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C34;
  block[3] = &unk_10005CB30;
  objc_copyWeak(&v18, &location);
  block[4] = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)start
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038D44(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice start](&v37, "start");
  objc_super v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupDeviceManagement](self, "groupDeviceManagement"));
  dispatch_group_enter(v11);

  uint64_t v12 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupTouch](self, "groupTouch"));
  dispatch_group_enter(v12);

  uint64_t v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
  dispatch_group_enter(v13);

  uint64_t v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupProximity](self, "groupProximity"));
  dispatch_group_enter(v14);

  uint64_t v15 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000053F8;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_group_async(v15, v17, block);

  id v18 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100005730;
  v35[3] = &unk_10005CB58;
  v35[4] = self;
  dispatch_group_async(v18, v17, v35);

  v19 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000059D0;
  v34[3] = &unk_10005CB58;
  v34[4] = self;
  dispatch_group_async(v19, v17, v34);

  if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 788
    || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 789)
  {
    if (byte_100070CC0) {
      kdebug_trace(730595368LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
    }
    objc_super v20 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
    dispatch_group_leave(v20);

    if (byte_100070CC0) {
      kdebug_trace(730595372LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
    }
  }

  else
  {
    v21 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100005C74;
    v33[3] = &unk_10005CB58;
    v33[4] = self;
    dispatch_group_async(v21, v17, v33);
  }

  uint64_t v22 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100005E70;
  v32[3] = &unk_10005CB58;
  v32[4] = self;
  dispatch_group_async(v22, v17, v32);

  v23 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10000606C;
  v31[3] = &unk_10005CB58;
  v31[4] = self;
  dispatch_group_async(v23, v17, v31);

  if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 614
    || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 621)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    v24 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupStart](self, "groupStart"));
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000067B4;
    v28[3] = &unk_10005CB80;
    objc_copyWeak(&v29, &location);
    dispatch_group_async(v24, v25, v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  v26 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupStart](self, "groupStart"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000068CC;
  v27[3] = &unk_10005CB58;
  v27[4] = self;
  dispatch_group_async(v26, v17, v27);
}

- (void)clearAppleMultitouchDeviceNotification
{
  if (-[HIDAppleSiriRemoteDevice amdNotification](self, "amdNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice amdNotification](self, "amdNotification"));
    -[HIDAppleSiriRemoteDevice setAmdNotification:](self, "setAmdNotification:", 0LL);
  }

- (void)clearDeviceManagementNotification
{
  if (-[HIDAppleSiriRemoteDevice deviceMgtNotification](self, "deviceMgtNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice deviceMgtNotification](self, "deviceMgtNotification"));
    -[HIDAppleSiriRemoteDevice setDeviceMgtNotification:](self, "setDeviceMgtNotification:", 0LL);
  }

- (void)clearButtonInterestNotification
{
  if (-[HIDAppleSiriRemoteDevice buttonInterestNotification](self, "buttonInterestNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice buttonInterestNotification](self, "buttonInterestNotification"));
    -[HIDAppleSiriRemoteDevice setButtonInterestNotification:](self, "setButtonInterestNotification:", 0LL);
  }

- (BOOL)matchInstanceIDInHidEventDriver:(unsigned int)a3
{
  kern_return_t ParentEntry;
  BOOL v9;
  io_object_t v10;
  kern_return_t v11;
  io_object_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  io_registry_entry_t entry;
  io_registry_entry_t parent;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"SerialNumber", kCFAllocatorDefault, 0);
  if (CFProperty
    && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice serialNumber](self, "serialNumber")),
        unsigned int v7 = [v6 isEqualToString:CFProperty],
        v6,
        v7))
  {
    parent = 0;
    ParentEntry = IORegistryEntryGetParentEntry(a3, "IOService", &parent);
    uint64_t v9 = 0;
    uint64_t v10 = parent;
    if (!ParentEntry && parent)
    {
      entry = 0;
      objc_super v11 = IORegistryEntryGetParentEntry(parent, "IOService", &entry);
      uint64_t v9 = 0;
      uint64_t v12 = entry;
      if (!v11 && entry)
      {
        uint64_t v13 = (void *)IORegistryEntryCreateCFProperty(entry, @"InstanceID", kCFAllocatorDefault, 0);
        uint64_t v14 = v13;
        if (v13
          && (uint64_t v15 = [v13 unsignedIntValue],
              v15 == -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID")))
        {
          v16 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
            sub_100038E34(v16, self);
          }
          uint64_t v9 = 1;
        }

        else
        {
          uint64_t v9 = 0;
        }

        uint64_t v12 = entry;
      }

      IOObjectRelease(v12);
      uint64_t v10 = parent;
    }

    IOObjectRelease(v10);
  }

  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)verifyButtonDriverOpenedByEventSystem:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"DeviceOpenedByEventSystem", kCFAllocatorDefault, 0);
  if ([CFProperty BOOLValue])
  {
    v16 = CFProperty;
    uint64_t v5 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "HID event system ready to dispatch keyboard/button events",  buf,  2u);
    }

    -[HIDAppleSiriRemoteDevice clearButtonInterestNotification](self, "clearButtonInterestNotification");
    uint64_t v6 = self;
    objc_sync_enter(v6);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v6, "cachedButtonsAndTimestamps"));
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
          uint64_t v14 = (os_log_s *)(id)qword_100070CC8;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v15 = [v12 unsignedIntValue];
            *(_DWORD *)buf = 67109120;
            unsigned int v22 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Send cached button 0x%04X", buf, 8u);
          }

          -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:]( v6,  "sendButtonDataToUserDevice:withTimestamp:",  (unsigned __int16)[v12 unsignedIntValue],  [v13 unsignedLongLongValue]);
        }

        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v8);
    }

    -[HIDAppleSiriRemoteDevice setCachedButtonsAndTimestamps:](v6, "setCachedButtonsAndTimestamps:", 0LL);
    objc_sync_exit(v6);

    CFProperty = v16;
  }
}

- (void)deviceMgtDriverArrived:(unsigned int)a3
{
  uint64_t v5 = IOIteratorNext(a3);
  if ((_DWORD)v5)
  {
    uint64_t v6 = v5;
    do
    {
      if (-[HIDAppleSiriRemoteDevice matchInstanceIDInHidEventDriver:](self, "matchInstanceIDInHidEventDriver:", v6))
      {
        unsigned int v7 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
          sub_100038EB0(v12, v7, self, &v13);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", @"181E"));
        unsigned int v10 = [v8 isSupportingService:v9];

        if (v10) {
          CFBooleanRef v11 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v11 = kCFBooleanFalse;
        }
        IORegistryEntrySetCFProperty(v6, @"BondManagement", v11);
      }

      uint64_t v6 = IOIteratorNext(a3);
    }

    while ((_DWORD)v6);
  }

- (void)appleMultitouchDeviceArrived:(unsigned int)a3
{
  io_object_t v5 = IOIteratorNext(a3);
  if (v5)
  {
    uint64_t v6 = _NSConcreteStackBlock;
    unsigned int v7 = sub_100007234;
    do
    {
      io_registry_entry_t parent = 0;
      if (IORegistryEntryGetParentEntry(v5, "IOService", &parent)) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = parent == 0;
      }
      if (!v8 && -[HIDAppleSiriRemoteDevice matchInstanceIDInHidEventDriver:](self, "matchInstanceIDInHidEventDriver:"))
      {
        uint64_t v9 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
          sub_100038F24(&buf, v19, v9);
        }
        if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 614
          || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 621
          || -[HIDBluetoothDevice state](self, "state") > 2)
        {
          -[HIDAppleSiriRemoteDevice setNormalPeripheralLatency](self, "setNormalPeripheralLatency");
        }

        else
        {
          id location = 0LL;
          objc_initWeak(&location, self);
          unsigned int v10 = v6;
          v15[0] = v6;
          v15[1] = 3221225472LL;
          CFBooleanRef v11 = v7;
          v15[2] = v7;
          v15[3] = &unk_10005CBA8;
          objc_copyWeak(&v16, &location);
          uint64_t v12 = objc_retainBlock(v15);
          unsigned int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
          uint32_t v14 = notify_register_dispatch( "com.apple.PineBoard.RemoteConnectedStandbyAvailabilityDidChange",  &self->_connectedStandbyToken,  v13,  v12);

          if (!v14) {
            ((void (*)(void *, void))v12[2])( v12,  -[HIDAppleSiriRemoteDevice connectedStandbyToken](self, "connectedStandbyToken"));
          }

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
          uint64_t v6 = v10;
          unsigned int v7 = v11;
        }
      }

      io_object_t v5 = IOIteratorNext(a3);
    }

    while (v5);
  }

- (id)desiredConnectionParameters
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038F60(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (-[HIDBluetoothDevice state](self, "state") == 2)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
    id v11 = -[HIDBluetoothDevice desiredConnectionParameters](&v24, "desiredConnectionParameters");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v12 setPreferredPeripheralLatency:[self latency]];
    [v12 setMaxPeripheralLatency:[self latency]];
    [v12 setMinCELength:6];
    [v12 setMaxDeferment:1];
    LODWORD(v13) = 15.0;
    [v12 setMinInterval:v13];
    LODWORD(v14) = 15.0;
    [v12 setPreferredInterval:v14];
    unsigned int v15 = -[HIDAppleSiriRemoteDevice latency](self, "latency");
    if (v15)
    {
      if (v15 == 199)
      {
        float v16 = (float)(int)([v12 preferredPeripheralLatency] + 1);
        [v12 preferredInterval];
        float v18 = (float)((float)(v17 * v16) * 4.0) + 1.0;
      }

      else
      {
        [v12 preferredInterval];
        float v18 = (float)(v20 * 5.0) * (float)(int)([v12 preferredPeripheralLatency] + 1);
      }

      uint64_t v19 = (int)v18;
    }

    else
    {
      uint64_t v19 = 2000LL;
    }

    [v12 setTimeout:v19];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"ConnectionTimeout"]);

    if (v22) {
      [v12 setTimeout:[v21 integerForKey:@"ConnectionTimeout"]];
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)setSleepPeripheralLatency
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038FD0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000074F0;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)setNormalPeripheralLatency
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039040(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007620;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)setZeroPeripheralLatency
{
  __int128 v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_1000390B0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000077BC;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)sendButtonDataToUserDevice:(unsigned __int16)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v5 = a3;
  if (-[HIDAppleSiriRemoteDevice firstButton](self, "firstButton") && byte_100070CC0) {
    kdebug_trace(730595424LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
  }
  if (-[HIDBluetoothDevice state](self, "state") < 3
    || (unsigned int v7 = -[HIDBluetoothDevice state](self, "state"), !(_DWORD)v5) && v7 == 3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v5));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000079E4;
    v17[3] = &unk_10005CBD0;
    id v18 = v8;
    id v10 = v8;
    [v9 logBlock:v17];

    if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 788
      || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 789)
    {
      uint8_t report = -5;
      *(_WORD *)report_1 = v5;
      id v11 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice buttons](self, "buttons"));
      uint64_t v12 = v11;
      uint64_t v13 = a4;
      CFIndex v14 = 3LL;
    }

    else
    {
      uint8_t report = -6;
      report_1[0] = v5;
      id v11 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice buttons](self, "buttons"));
      uint64_t v12 = v11;
      uint64_t v13 = a4;
      CFIndex v14 = 2LL;
    }

    IOHIDUserDeviceHandleReportWithTimeStamp(v11, v13, &report, v14);
  }

  if (-[HIDAppleSiriRemoteDevice firstButton](self, "firstButton"))
  {
    if (byte_100070CC0) {
      kdebug_trace(730595428LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
    }
    -[HIDAppleSiriRemoteDevice setFirstButton:](self, "setFirstButton:", 0LL);
  }

- (void)handleButtonData
{
  __int128 v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039120(v3, self);
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](self, "cachedButtonsAndTimestamps"));

  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v5, "cachedButtonsAndTimestamps"));

    if (v6)
    {
      unsigned int v7 = (os_log_s *)(id)qword_100070CC8;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint8_t buf = 67109120;
        unsigned int v14 = -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cache button 0x%04X", buf, 8u);
      }

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v5, "cachedButtonsAndTimestamps"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData")));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[HIDAppleSiriRemoteDevice inputReportTimestamp](v5, "inputReportTimestamp", v9)));
      v12[1] = v10;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
      [v8 addObject:v11];
    }

    else
    {
      -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:]( v5,  "sendButtonDataToUserDevice:withTimestamp:",  -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData"),  -[HIDAppleSiriRemoteDevice inputReportTimestamp](v5, "inputReportTimestamp"));
    }

    objc_sync_exit(v5);
  }

  else
  {
    -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:]( self,  "sendButtonDataToUserDevice:withTimestamp:",  -[HIDAppleSiriRemoteDevice buttonData](self, "buttonData"),  -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp"));
  }

- (void)handleProximityData
{
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    __int128 v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupProximity](self, "groupProximity"));
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[HIDAppleSiriRemoteDevice proximityData](self, "proximityData")));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100007DA4;
    v9[3] = &unk_10005CBD0;
    id v10 = v4;
    id v6 = v4;
    [v5 logBlock:v9];

    report[0] = 1;
    report[1] = -[HIDAppleSiriRemoteDevice proximityData](self, "proximityData");
    unsigned int v7 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice proximity](self, "proximity"));
    IOHIDUserDeviceHandleReportWithTimeStamp( v7,  -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp"),  report,  2LL);
  }

- (void)handleTouchData
{
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    id v3 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    uint64_t v4 = (const uint8_t *)[v3 bytes];

    int v5 = *v4;
    if (v5 == 96 && byte_100070CC0 != 0) {
      kdebug_trace(730595436LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
    }
    unsigned int v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupTouch](self, "groupTouch"));
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v8 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touch](self, "touch"));
    uint64_t v9 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    IOHIDUserDeviceHandleReportWithTimeStamp(v8, v9, v4, (CFIndex)[v10 length]);

    if (v5 == 96)
    {
      if (byte_100070CC0) {
        kdebug_trace(730595440LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
      }
    }

    -[HIDAppleSiriRemoteDevice logTouchData](self, "logTouchData");
  }

- (void)logTouchData
{
  id v3 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  uint64_t v4 = (unsigned __int8 *)[v3 bytes];

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  if ([v5 length] == (id)12)
  {

    goto LABEL_4;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  id v7 = [v6 length];

  if (v7 == (id)19)
  {
LABEL_4:
    unsigned __int8 v8 = v4[11];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    if ([v9 length] == (id)19) {
      int v70 = v4[18] & 7;
    }
    else {
      int v70 = 0;
    }

    if ((v4[11] & 8) != 0) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = 2;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    if ([v11 length] == (id)19)
    {
      if ((v4[18] & 8) != 0) {
        char v12 = 1;
      }
      else {
        char v12 = 2;
      }
      unsigned __int8 v67 = v12;
    }

    else
    {
      unsigned __int8 v67 = 0;
    }

    unsigned int v13 = v4[2];
    int v14 = v4[3];
    unint64_t v15 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    uint64_t v16 = qword_100070BE8;
    float v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    int v18 = v8 & 7;
    uint64_t v19 = (v13 >> 1) | (v14 << 7);
    if ([v17 count])
    {
    }

    else
    {

      unint64_t v20 = 0LL;
      unsigned int v72 = 0;
      if (v18 == 3 || v70 == 3) {
        goto LABEL_22;
      }
    }

    unint64_t v20 = v15 - v16;
    unsigned int v72 = v19 - dword_100070BF0;
LABEL_22:
    unint64_t v69 = v20;
    int v71 = v8 & 7;
    unsigned int v21 = dword_100070BE0;
    if (!dword_100070BE0)
    {
      mach_timebase_info((mach_timebase_info_t)&dword_100070BDC);
      unsigned int v21 = dword_100070BE0;
    }

    uint64_t v68 = dword_100070BDC;
    dword_100070BF0 = v19;
    qword_100070BE8 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    if (v18 == 4) {
      goto LABEL_36;
    }
    if (v18 == 3)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v10));
      unsigned int v24 = [v22 containsObject:v23];

      if (v24)
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003920C();
        }
        goto LABEL_36;
      }

      dispatch_group_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v10));
      [v34 addObject:v35];
    }

    else
    {
      dispatch_group_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v10));
      [v34 removeObject:v35];
    }

LABEL_36:
    dispatch_group_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    BOOL v37 = [v36 length] == (id)19;

    if (v37 && v70 != 4)
    {
      if (v70 == 3)
      {
        dispatch_group_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v67));
        unsigned int v40 = [v38 containsObject:v39];

        if (v40)
        {
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003920C();
          }
        }

        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
          dispatch_group_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v67));
          [v43 addObject:v44];
        }
      }

      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
        dispatch_group_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v67));
        [v41 removeObject:v42];
      }
    }

    uint64_t v75 = 0LL;
    v76 = &v75;
    uint64_t v77 = 0x3032000000LL;
    v78 = sub_100008850;
    v79 = sub_100008860;
    id v80 = 0LL;
    v83[0] = @"touch";
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v45 description]);
    v84[0] = v46;
    v83[1] = @"fwTimestampMs";
    dispatch_semaphore_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v19));
    v84[1] = v47;
    v83[2] = @"fwTimestampDeltaMs";
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v72));
    unint64_t v49 = v69 * v68 / v21;
    v84[2] = v48;
    v83[3] = @"inputReportDeltaMs";
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v49 / 0xF4240));
    v84[3] = v50;
    v83[4] = @"numTouches";
    dispatch_semaphore_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v51 count]));
    v84[4] = v52;
    id v80 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  5LL));

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_100008878;
    v73[3] = &unk_10005CBF8;
    v73[4] = &v75;
    [v53 logBlock:v73];

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    BOOL v55 = [v54 count] == 0;

    if (!v55)
    {
      if (15 * (((double)v72 + 7.5) / 0xF) < 0x10)
      {
        BOOL v64 = v70 == 3 || v71 == 3 || v49 >= 0x989680;
        if (!v64 || v49 >= 0x1406F40)
        {
          v65 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v66 = v76[5];
            *(_DWORD *)uint8_t buf = 138412290;
            uint64_t v82 = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Delayed multitouch data: %@",  buf,  0xCu);
          }
        }
      }

      else
      {
        v56 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_1000391A0((uint64_t)&v76, v56, v57, v58, v59, v60, v61, v62);
        }
      }
    }

    _Block_object_dispose(&v75, 8);

    return;
  }

  v25 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  v27 = -[NSMutableString initWithFormat:]( v25,  "initWithFormat:",  @"{length = %lu, bytes = 0x",  [v26 length]);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  id v29 = [v28 length];

  if (v29)
  {
    unint64_t v30 = 0LL;
    do
    {
      -[NSMutableString appendFormat:](v27, "appendFormat:", @"%02x", v4[v30]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      ++v30;
      id v32 = [v31 length];
    }

    while (v30 < (unint64_t)v32);
  }

  -[NSMutableString appendString:](v27, "appendString:", @"}");
  uint64_t v75 = 0LL;
  v76 = &v75;
  uint64_t v77 = 0x3032000000LL;
  v78 = sub_100008850;
  v79 = sub_100008860;
  id v80 = 0LL;
  v85 = @"touch";
  v86 = v27;
  id v80 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100008868;
  v74[3] = &unk_10005CBF8;
  v74[4] = &v75;
  [v33 logBlock:v74];

  _Block_object_dispose(&v75, 8);
}

- (void)handleInertialData
{
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    id v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertial](self, "inertial"));
    if (v4)
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100008A08;
      v14[3] = &unk_10005CBD0;
      id v15 = v6;
      id v13 = v6;
      [v7 logBlock:v14];

      unsigned __int8 v8 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertial](self, "inertial"));
      uint64_t v9 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
      id v10 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
      id v11 = (const uint8_t *)[v10 bytes];
      char v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
      IOHIDUserDeviceHandleReportWithTimeStamp(v8, v9, v11, (CFIndex)[v12 length]);
    }
  }

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (!v7) {
    return;
  }
  unsigned int v8 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v8 - 788 >= 2)
  {
    if (v8 == 621 && !a4) {
      goto LABEL_14;
    }
  }

  else if (a3 && a4 >= 5 && !a3[4])
  {
LABEL_14:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    [v16 logBlock:&stru_10005CC38];

    char v12 = self;
    objc_sync_enter(v12);
    float v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));

    if (v17)
    {
      int v18 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));
      dispatch_semaphore_signal(v18);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v12, "audioBuffer"));
    [v19 removeAllObjects];

    objc_sync_exit(v12);
    goto LABEL_19;
  }

  if (a3 && a4 >= 1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[HIDAppleSiriRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100008D10;
    v22[3] = &unk_10005CBD0;
    char v12 = v10;
    v23 = v12;
    [v11 logBlock:v22];

    id v13 = self;
    objc_sync_enter(v13);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v13, "audioBuffer"));

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v13, "audioBuffer"));
      [v15 addObject:v12];
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](v13, "doapAudioRelay"));
      [v15 sendAudioFrame:v12];
    }

    objc_sync_exit(v13);
LABEL_19:
  }

  unsigned int v20 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v20 == 621 || v20 == 614)
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    [v21 removeAllObjects];
  }

- (void)handleDeviceManagementData:(char *)a3 dataLength:(int64_t)a4
{
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    id v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupDeviceManagement](self, "groupDeviceManagement"));
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    device = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice deviceManagement](self, "deviceManagement"));
    uint64_t v8 = mach_absolute_time();
    IOHIDUserDeviceHandleReportWithTimeStamp(device, v8, (const uint8_t *)a3, a4);
  }

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  -[HIDAppleSiriRemoteDevice setInputReportTimestamp:](self, "setInputReportTimestamp:", a5);
  unsigned int v9 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v9 - 788 < 2)
  {
    -[HIDAppleSiriRemoteDevice handleInputReportDataV2:reportID:](self, "handleInputReportDataV2:reportID:", v8, v6);
  }

  else if (v9 == 621 || v9 == 614)
  {
    -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v8, v6);
  }

  else
  {
    id v10 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003926C(v10, self);
    }
  }
}

- (void)handleInputReportDataV1:(id)a3 reportID:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = (char *)[v6 length];
  id v8 = v7 + 1;
  unsigned int v9 = (char *)&v12 - ((unint64_t)(v7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v9, (size_t)(v7 + 1));
  *unsigned int v9 = v4;
  [v6 getBytes:v9 + 1 length:[v6 length]];

  switch(v4)
  {
    case 96:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      [v10 setLength:0];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      [v11 appendBytes:v9 length:v8];

      -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      break;
    case 224:
      -[HIDAppleSiriRemoteDevice handleDeviceManagementData:dataLength:]( self,  "handleDeviceManagementData:dataLength:",  v9,  v8);
      break;
    case 252:
      -[HIDAppleSiriRemoteDevice demultiplexInputReport:reportLength:reportID:]( self,  "demultiplexInputReport:reportLength:reportID:",  v9,  v8,  252LL);
      break;
    default:
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_1000392F8();
      }
      break;
  }

- (void)handleInputReportDataV2:(id)a3 reportID:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = v6;
  switch(v4)
  {
    case 250:
      id v8 = [v6 length];
      __chkstk_darwin();
      id v10 = &v22[-v9];
      bzero(&v22[-v9], (size_t)v8);
      [v7 getBytes:v10 length:v8];
      -[HIDAppleSiriRemoteDevice handleAudioData:dataLength:](self, "handleAudioData:dataLength:", v10, v8);
      break;
    case 251:
      unsigned __int16 v24 = 0;
      [v6 getBytes:&v24 length:2];
      -[HIDAppleSiriRemoteDevice setButtonData:](self, "setButtonData:", v24);
      -[HIDAppleSiriRemoteDevice handleButtonData](self, "handleButtonData");
      break;
    case 252:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      [v16 setLength:0];

      char v23 = -5;
      float v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      [v17 appendBytes:&v23 length:1];

      int v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      [v18 appendData:v7];

      -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      break;
    case 253:
      if ([v6 length] == (id)1)
      {
        [v7 getBytes:&self->_proximityData length:1];
        -[HIDAppleSiriRemoteDevice handleProximityData](self, "handleProximityData");
      }

      break;
    case 254:
      uint64_t v19 = (char *)[v6 length] + 1;
      __chkstk_darwin();
      id v21 = &v22[-v20];
      bzero(&v22[-v20], (size_t)v19);
      _BYTE *v21 = -32;
      [v7 getBytes:v21 + 1 length:[v7 length]];
      -[HIDAppleSiriRemoteDevice handleDeviceManagementData:dataLength:]( self,  "handleDeviceManagementData:dataLength:",  v21,  v19);
      break;
    default:
      if (v4 == 96)
      {
        id v11 = (char *)[v6 length] + 1;
        __chkstk_darwin();
        id v13 = &v22[-v12];
        bzero(&v22[-v12], (size_t)v11);
        _BYTE *v13 = 96;
        [v7 getBytes:v13 + 1 length:[v7 length]];
        int v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
        [v14 setLength:0];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
        [v15 appendBytes:v13 length:v11];

        -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      }

      else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        sub_1000392F8();
      }

      break;
  }
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  return -[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]( self,  "setReport:reportLength:reportID:reportType:keyholeID:error:",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  a7,  0LL);
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v15 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint8_t buf = 136316162;
    v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    __int16 v28 = 1024;
    int v29 = v9;
    __int16 v30 = 1024;
    int v31 = v11;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld",  buf,  0x28u);
  }

  int v16 = -536870206;
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    BOOL v17 = a4 > 0 && a3 == 0LL;
    if (!v17 && v11 <= 0xFF)
    {
      if ((_DWORD)v9 == 241 && -[HIDAppleSiriRemoteDevice latency](self, "latency") == 199)
      {
        int v16 = -536870173;
      }

      else
      {
        int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  a4,  0LL));
        if (byte_100070CC0) {
          kdebug_trace( 730595452LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v11,  v9,  0LL);
        }
        int v16 = -[HIDBluetoothDevice setReportData:reportID:reportType:error:]( self,  "setReportData:reportID:reportType:error:",  v18,  v9,  v10,  a8);
        if (byte_100070CC0) {
          kdebug_trace( 730595456LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v11,  v9,  0LL);
        }

        if (!v16)
        {
          unsigned int v22 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 136315906;
            v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
            __int16 v28 = 1024;
            int v29 = v9;
            __int16 v30 = 1024;
            int v31 = v11;
            __int16 v32 = 1024;
            int v33 = v10;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s keyholeID 0x%02x reportID 0x%02x reportType %d success",  buf,  0x1Eu);
          }

          return 0;
        }
      }
    }
  }

  else
  {
    int v16 = -536870185;
  }

  uint64_t v19 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint8_t buf = 136316418;
    v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    __int16 v28 = 1024;
    int v29 = v9;
    __int16 v30 = 1024;
    int v31 = v11;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    __int16 v36 = 1024;
    int v37 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld failure 0x%08X",  buf,  0x2Eu);
    if (!a8) {
      return v16;
    }
  }

  else if (!a8)
  {
    return v16;
  }

  if (!*a8)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld",  v9,  v11,  v10,  a4));
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v25 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    *a8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v16,  v21));
  }

  return v16;
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v13 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      int64_t v15 = *a4;
    }
    else {
      int64_t v15 = 0LL;
    }
    *(_DWORD *)uint8_t buf = 136316162;
    v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
    __int16 v51 = 1024;
    int v52 = v7;
    __int16 v53 = 1024;
    int v54 = v9;
    __int16 v55 = 1024;
    int v56 = v8;
    __int16 v57 = 2048;
    int64_t v58 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s keyholeID 0x%02x reportID 0x%02x reportType %d length %ld",  buf,  0x28u);
  }

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    int v14 = -536870206;
    if (a3 && a4)
    {
      if (*a4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v14 = -536870168;
      }

      else if (*a4 < 1)
      {
        int v14 = -536870169;
      }

      else if ((_DWORD)v7 == 241 && -[HIDAppleSiriRemoteDevice latency](self, "latency") == 199)
      {
        int v14 = -536870173;
      }

      else
      {
        if (byte_100070CC0) {
          kdebug_trace( 730595444LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v9,  v7,  1LL);
        }
        v48[0] = -16;
        v48[1] = v9;
        int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v48,  2LL,  0LL));
        BOOL v17 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
        {
          int64_t v43 = *a4;
          *(_DWORD *)uint8_t buf = 136316162;
          v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
          __int16 v51 = 1024;
          int v52 = v7;
          __int16 v53 = 1024;
          int v54 = v9;
          __int16 v55 = 1024;
          int v56 = v8;
          __int16 v57 = 2048;
          int64_t v58 = v43;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld",  buf,  0x28u);
        }

        int v14 = -[HIDBluetoothDevice setReportData:reportID:reportType:error:]( self,  "setReportData:reportID:reportType:error:",  v16,  240LL,  v8,  0LL);
        if (byte_100070CC0) {
          kdebug_trace( 730595448LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v9,  v7,  1LL);
        }
        int v18 = (os_log_s *)qword_100070CC8;
        if (v14)
        {
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            int64_t v19 = *a4;
            *(_DWORD *)uint8_t buf = 136316418;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            __int16 v51 = 1024;
            int v52 = v7;
            __int16 v53 = 1024;
            int v54 = v9;
            __int16 v55 = 1024;
            int v56 = v8;
            __int16 v57 = 2048;
            int64_t v58 = v19;
            __int16 v59 = 1024;
            int v60 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X",  buf,  0x2Eu);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
            sub_10003943C(v18, v20, v21, v22, v23, v24, v25, v26);
          }
          if (byte_100070CC0) {
            kdebug_trace( 730595444LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v9,  v7,  0LL);
          }
          v27 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
          {
            int64_t v44 = *a4;
            *(_DWORD *)uint8_t buf = 136316162;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            __int16 v51 = 1024;
            int v52 = v7;
            __int16 v53 = 1024;
            int v54 = v9;
            __int16 v55 = 1024;
            int v56 = v8;
            __int16 v57 = 2048;
            int64_t v58 = v44;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld",  buf,  0x28u);
          }

          id v47 = 0LL;
          int v14 = -[HIDBluetoothDevice getReportData:reportID:reportType:error:]( self,  "getReportData:reportID:reportType:error:",  &v47,  v7,  v8,  0LL);
          id v46 = v47;
          if (byte_100070CC0) {
            kdebug_trace( 730595448LL,  -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"),  v9,  v7,  0LL);
          }
          __int16 v28 = (os_log_s *)qword_100070CC8;
          if (v14)
          {
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
            {
              int64_t v45 = *a4;
              *(_DWORD *)uint8_t buf = 136316418;
              v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
              __int16 v51 = 1024;
              int v52 = v7;
              __int16 v53 = 1024;
              int v54 = v9;
              __int16 v55 = 1024;
              int v56 = v8;
              __int16 v57 = 2048;
              int64_t v58 = v45;
              __int16 v59 = 1024;
              int v60 = v14;
              _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X",  buf,  0x2Eu);
            }

            int v29 = v46;
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              sub_1000393CC(v28, v30, v31, v32, v33, v34, v35, v36);
            }
            int v29 = v46;
            [v46 getBytes:a3 length:*a4];
            if (*a3 == (_DWORD)v9)
            {
              unint64_t v37 = *a4;
              id v38 = [v46 length];
              int v14 = 0;
              else {
                int64_t v39 = v37;
              }
              *a4 = v39;
            }

            else
            {
              unsigned int v40 = (os_log_s *)qword_100070CC8;
              if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
                sub_100039358((uint64_t)a3, v9, v40);
              }
              int v14 = -536870160;
            }
          }
        }
      }
    }
  }

  else
  {
    int v14 = -536870185;
  }

  if ((_DWORD)v9 == 219 && (_DWORD)v7 == 241)
  {
    v41 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[HIDAppleSiriRemoteDevice gotDeviceExtendedInfoReport]( self,  "gotDeviceExtendedInfoReport"));
    dispatch_semaphore_signal(v41);

    if (byte_100070CC0) {
      kdebug_trace(730595432LL, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0LL, 0LL, 0LL);
    }
  }

  return v14;
}

- (void)extractButtonDataFromReport:(char *)a3 buttonIndex:(unsigned __int8)a4
{
}

- (void)demultiplexInputReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  [v8 setLength:0];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
  [v9 setLength:0];

  if (a3)
  {
    unsigned int v10 = a3[1];
    switch(v10 >> 5)
    {
      case 0u:
        goto LABEL_4;
      case 1u:
        -[HIDAppleSiriRemoteDevice setProximityData:](self, "setProximityData:", (a3[2] >> 6) & 1);
        -[HIDAppleSiriRemoteDevice handleProximityData](self, "handleProximityData");
LABEL_4:
        -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:]( self,  "extractButtonDataFromReport:buttonIndex:",  a3,  2LL);
        if ((v10 & 0x10) == 0 || ((v10 >> 2) & 3) == 0) {
          __asm { BR              X10 }
        }

        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_1000394AC();
        }
        return;
      case 6u:
        if (a4 < 3) {
          return;
        }
        id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3 + 2, a4 - 2));
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:]( self,  "handleInputReportDataV1:reportID:",  v12,  224LL,  v12);
        goto LABEL_18;
      case 7u:
        if (a4 == 5)
        {
          if (-[HIDAppleSiriRemoteDevice productID](self, "productID") != 621) {
            return;
          }
          -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:]( self,  "extractButtonDataFromReport:buttonIndex:",  a3,  2LL);
          uint64_t v11 = a3 + 4;
        }

        else
        {
          if (a4 != 4 || -[HIDAppleSiriRemoteDevice productID](self, "productID") != 614) {
            return;
          }
          -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:]( self,  "extractButtonDataFromReport:buttonIndex:",  a3,  2LL);
          uint64_t v11 = a3 + 3;
        }

        id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v11, 1LL));
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:]( self,  "handleInputReportDataV1:reportID:",  v14,  96LL,  v14);
LABEL_18:

        break;
      default:
        return;
    }
  }

- (void)logHwFwVersions
{
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
    int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000A1FC;
    block[3] = &unk_10005CB30;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_after(v3, v4, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (void)doapAudioWillStart:(id)a3
{
  id v4 = a3;
  if (-[HIDBluetoothDevice state](self, "state") < 3)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A550;
    v9[3] = &unk_10005CC60;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  else
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Apple Siri Remote stopped (disconnected)"));
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v14 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[HIDBluetoothDevice state](self, "state") >= 3)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Apple Siri Remote stopped (disconnected)"));
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    int64_t v45 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    v4[2](v4, v7);
    uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
  [v9 timeIntervalSinceNow];
  double v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    uint64_t v25 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
      [v27 timeIntervalSinceNow];
      *(_DWORD *)uint8_t buf = 134217984;
      *(double *)&uint8_t buf[4] = fabs(v28) * 1000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Have not received audio data for %f ms. Stop Siri session.",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v12)
  {
    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    int v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_time_t v17 = dispatch_time(0LL, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    uint64_t v18 = dispatch_semaphore_wait(v16, v17);

    int64_t v19 = (void *)qword_100070CC8;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        uint64_t v21 = v19;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        [v22 timeIntervalSinceNow];
        *(_DWORD *)uint8_t buf = 134217984;
        *(double *)&uint8_t buf[4] = fabs(v23) * 1000.0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received Siri audio data %f ms ago.",  buf,  0xCu);
      }

      *(void *)uint8_t buf = 0LL;
      objc_initWeak((id *)buf, self);
      uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10000AFE8;
      v38[3] = &unk_10005CC60;
      objc_copyWeak(&v40, (id *)buf);
      int64_t v39 = v4;
      dispatch_async(v24, v38);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      goto LABEL_18;
    }

    if (v20)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Received empty audio input report. Stop Siri session.",  buf,  2u);
    }

- (void)doapAudioDidStop:(id)a3
{
  id v4 = a3;
  if (-[HIDBluetoothDevice state](self, "state") < 3)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000B208;
    v10[3] = &unk_10005CC60;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  else
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Apple Siri Remote stopped (disconnected)"));
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    double v15 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870185LL,  v6));

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
    uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);
  }
}

- (int)latency
{
  return self->_latency;
}

- (void)setLatency:(int)a3
{
  self->_latency = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSMutableArray)cachedButtonsAndTimestamps
{
  return self->_cachedButtonsAndTimestamps;
}

- (void)setCachedButtonsAndTimestamps:(id)a3
{
}

- (unsigned)buttonData
{
  return self->_buttonData;
}

- (void)setButtonData:(unsigned __int16)a3
{
  self->_buttonData = a3;
}

- (unsigned)proximityData
{
  return self->_proximityData;
}

- (void)setProximityData:(unsigned __int8)a3
{
  self->_proximityData = a3;
}

- (NSMutableSet)pathIDs
{
  return self->_pathIDs;
}

- (NSMutableData)touchData
{
  return self->_touchData;
}

- (NSMutableData)inertialData
{
  return self->_inertialData;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (unint64_t)inputReportTimestamp
{
  return self->_inputReportTimestamp;
}

- (void)setInputReportTimestamp:(unint64_t)a3
{
  self->_inputReportTimestamp = a3;
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (BOOL)firstButton
{
  return self->_firstButton;
}

- (void)setFirstButton:(BOOL)a3
{
  self->_firstButton = a3;
}

- (int)connectedStandbyToken
{
  return self->_connectedStandbyToken;
}

- (void)setConnectedStandbyToken:(int)a3
{
  self->_connectedStandbyToken = a3;
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_group)groupInit
{
  return self->_groupInit;
}

- (OS_dispatch_group)groupStart
{
  return self->_groupStart;
}

- (OS_dispatch_group)groupDeviceManagement
{
  return self->_groupDeviceManagement;
}

- (OS_dispatch_group)groupTouch
{
  return self->_groupTouch;
}

- (OS_dispatch_group)groupInertial
{
  return self->_groupInertial;
}

- (OS_dispatch_group)groupProximity
{
  return self->_groupProximity;
}

- (OS_dispatch_semaphore)sentHostReadyReport
{
  return self->_sentHostReadyReport;
}

- (OS_dispatch_semaphore)gotDeviceExtendedInfoReport
{
  return self->_gotDeviceExtendedInfoReport;
}

- (id)deviceManagement
{
  return self->_deviceManagement;
}

- (void)setDeviceManagement:(id)a3
{
}

- (id)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (id)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (id)inertial
{
  return self->_inertial;
}

- (void)setInertial:(id)a3
{
}

- (id)infrared
{
  return self->_infrared;
}

- (void)setInfrared:(id)a3
{
}

- (id)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (id)radio
{
  return self->_radio;
}

- (void)setRadio:(id)a3
{
}

- (id)proximity
{
  return self->_proximity;
}

- (void)setProximity:(id)a3
{
}

- (unsigned)amdNotification
{
  return self->_amdNotification;
}

- (void)setAmdNotification:(unsigned int)a3
{
  self->_amdNotification = a3;
}

- (unsigned)deviceMgtNotification
{
  return self->_deviceMgtNotification;
}

- (void)setDeviceMgtNotification:(unsigned int)a3
{
  self->_deviceMgtNotification = a3;
}

- (unsigned)buttonInterestNotification
{
  return self->_buttonInterestNotification;
}

- (void)setButtonInterestNotification:(unsigned int)a3
{
  self->_buttonInterestNotification = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (void).cxx_destruct
{
}

@end