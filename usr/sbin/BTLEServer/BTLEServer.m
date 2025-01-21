id sub_100004998(void *a1)
{
  os_log_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100038BF4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return [a1 notifyDidStop];
}

void sub_100004C10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100004C34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v29 = WeakRetained;
    if (byte_100070CC0)
    {
      kdebug_trace(730595468, [WeakRetained instanceID], 0, 0, 0);
      id WeakRetained = v29;
    }

    v3 = [WeakRetained groupInit];
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    v4 = [v29 groupStart];
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    v5 = [v29 deviceManagement];
    if (v5)
    {
      v6 = [v29 deviceManagement];
      v7 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v6, v7);
    }

    v8 = [v29 touch];

    if (v8)
    {
      v9 = [v29 touch];
      v10 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v9, v10);
    }

    v11 = (void *)[v29 buttons];

    if (v11)
    {
      v12 = [v29 buttons];
      v13 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v12, v13);
    }

    v14 = (void *)[v29 inertial];

    if (v14)
    {
      v15 = (void *)[v29 inertial];
      v16 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v15, v16);
    }

    v17 = [v29 infrared];

    if (v17)
    {
      v18 = [v29 infrared];
      v19 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v18, v19);
    }

    v20 = [v29 audio];

    if (v20)
    {
      v21 = [v29 audio];
      v22 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v21, v22);
    }

    v23 = [v29 radio];

    if (v23)
    {
      v24 = [v29 radio];
      v25 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v24, v25);
    }

    v26 = [v29 proximity];

    if (v26)
    {
      v27 = [v29 proximity];
      v28 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v27, v28);
    }

    [v29 clearAppleMultitouchDeviceNotification];
    [v29 clearDeviceManagementNotification];
    [v29 clearButtonInterestNotification];
    if ([v29 notificationPort])
    {
      IONotificationPortDestroy((IONotificationPortRef)[v29 notificationPort]);
      [v29 setNotificationPort:0];
    }

    [v29 setQueue:0];
    id WeakRetained = v29;
    if (byte_100070CC0)
    {
      kdebug_trace(730595472, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
      id WeakRetained = v29;
    }
  }
}

void sub_1000053E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_1000053F8(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595336, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  v2 = [*(id *)(a1 + 32) properties];
  v3 = [HIDAppleSiriRemoteDevice getButtonsHIDReportDescriptor:[*(id *)(a1 + 32) productID]];
  id v20 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:2LL hidDescriptor:v3 extendedData:0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v20, 1LL);
  [*(id *)(a1 + 32) setButtons:v4];

  v5 = [*(id *)(a1 + 32) buttons];
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buttons]);
    uint64_t v7 = IOHIDUserDeviceCopyService();

    if ((_DWORD)v7)
    {
      if (!IOServiceAddInterestNotification( (IONotificationPortRef)[*(id *)(a1 + 32) notificationPort],  v7,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1000056DC,  *(void **)(a1 + 32),  (io_object_t *)(*(void *)(a1 + 32) + 60))) {
        [*(id *)(a1 + 32) verifyButtonDriverOpenedByEventSystem:v7];
      }
      IOObjectRelease(v7);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buttons]);
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_1000056F8, *(void *)(a1 + 32));

    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buttons]);
    IOHIDUserDeviceRegisterSetReportCallback(v9, sub_100005714, *(void *)(a1 + 32));

    v10 = [*(id *)(a1 + 32) buttons];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);
  }

  v12 = [DoAPAudioRelayHub instance];
  v13 = (void *)[*(id *)(a1 + 32) peripheral];
  v14 = [v13 identifier];
  v15 = [v14 UUIDString];
  v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  v17 = (void *)[v12 relayWithIdentifier:v15 deviceType:1 properties:v16 codecType:0];
  [*(id *)(a1 + 32) setDoapAudioRelay:v17];

  v18 = *(void **)(a1 + 32);
  v19 = (void *)[v18 doapAudioRelay];
  [v19 setDelegate:v18];

  if (byte_100070CC0) {
    kdebug_trace(730595340, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

void *sub_1000056DC(void *a1, const char *a2, int a3)
{
  if (a3 == -536870608) {
    return [a1 verifyButtonDriverOpenedByEventSystem:a2];
  }
  return a1;
}

id sub_1000056F8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_100005714(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_100005730(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595352, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  v2 = (IONotificationPort *)[*(id *)(a1 + 32) notificationPort];
  v3 = IOServiceMatching("AppleMultitouchDevice");
  if (!IOServiceAddMatchingNotification( v2,  "IOServiceFirstMatch",  v3,  (IOServiceMatchingCallback)sub_100005958,  *(void **)(a1 + 32),  (io_iterator_t *)(*(void *)(a1 + 32) + 52LL))
    && [*(id *)(a1 + 32) amdNotification])
  {
    while (IOIteratorNext((io_iterator_t)[*(id *)(a1 + 32) amdNotification]))
      ;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  v5 = [OBJC_CLASS___HIDAppleSiriRemoteDevice getTouchHIDReportDescriptor];
  id v13 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:v4 locationIdOffset:1LL hidDescriptor:v5 extendedData:0LL];

  v6 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v13, 1LL);
  [*(id *)(a1 + 32) setTouch:v6];

  uint64_t v7 = (void *)[*(id *)(a1 + 32) touch];
  if (v7)
  {
    v8 = [*(id *)(a1 + 32) touch];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_100005998, *(void *)(a1 + 32));

    v9 = [*(id *)(a1 + 32) touch];
    IOHIDUserDeviceRegisterSetReportCallback(v9, sub_1000059B4, *(void *)(a1 + 32));

    v10 = [*(id *)(a1 + 32) touch];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);
  }

  v12 = [*(id *)(a1 + 32) groupTouch];
  dispatch_group_leave(v12);

  if (byte_100070CC0) {
    kdebug_trace(730595356, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

void sub_100005958(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 appleMultitouchDeviceArrived:a2];
  [v3 clearAppleMultitouchDeviceNotification];
}

id sub_100005998(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:241];
}

id sub_1000059B4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:241];
}

void sub_1000059D0(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595344, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  v2 = (IONotificationPort *)[*(id *)(a1 + 32) notificationPort];
  id v3 = IOServiceMatching("AppleEmbeddedBluetoothDeviceManagement");
  if (!IOServiceAddMatchingNotification( v2,  "IOServiceFirstMatch",  v3,  (IOServiceMatchingCallback)sub_100005BFC,  *(void **)(a1 + 32),  (io_iterator_t *)(*(void *)(a1 + 32) + 56LL))
    && [*(id *)(a1 + 32) deviceMgtNotification])
  {
    while (IOIteratorNext((io_iterator_t)[*(id *)(a1 + 32) deviceMgtNotification]))
      ;
  }

  v4 = [*(id *)(a1 + 32) properties];
  v5 = [OBJC_CLASS___HIDAppleSiriRemoteDevice getDeviceManagementHIDReportDescriptor];
  id v13 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:v4 locationIdOffset:0LL hidDescriptor:v5 extendedData:&off_100060070];

  v6 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v13, 1LL);
  [*(id *)(a1 + 32) setDeviceManagement:v6];

  uint64_t v7 = (void *)[*(id *)(a1 + 32) deviceManagement];
  if (v7)
  {
    v8 = [*(id *)(a1 + 32) deviceManagement];
    IOHIDUserDeviceRegisterSetReportCallback(v8, sub_100005C3C, *(void *)(a1 + 32));

    v9 = [*(id *)(a1 + 32) deviceManagement];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v9, sub_100005C58, *(void *)(a1 + 32));

    v10 = [*(id *)(a1 + 32) deviceManagement];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);
  }

  v12 = [*(id *)(a1 + 32) groupDeviceManagement];
  dispatch_group_leave(v12);

  if (byte_100070CC0) {
    kdebug_trace(730595348, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

void sub_100005BFC(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 deviceMgtDriverArrived:a2];
  [v3 clearDeviceManagementNotification];
}

id sub_100005C3C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_100005C58(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_100005C74(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595368, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getInertialHIDReportDescriptor];
  id v11 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:3LL v3:0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v11, 1LL);
  [*(id *)(a1 + 32) setInertial:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inertial]);
  if (v5)
  {
    v6 = (void *)[*(id *)(a1 + 32) inertial];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_100005E38, *(void *)(a1 + 32));

    uint64_t v7 = (void *)[*(id *)(a1 + 32) inertial];
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_100005E54, *(void *)(a1 + 32));

    v8 = [*(id *)(a1 + 32) inertial];
    v9 = (void *)[*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);
  }

  v10 = [*(id *)(a1 + 32) groupInertial];
  dispatch_group_leave(v10);

  if (byte_100070CC0) {
    kdebug_trace(730595372, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_100005E38(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_100005E54(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_100005E70(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595392, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  v2 = (void *)[*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getProximityHIDReportDescriptor];
  id v11 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:7LL hidDescriptor:v3 extendedData:0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v11, 1LL);
  [*(id *)(a1 + 32) setProximity:v4];

  v5 = [*(id *)(a1 + 32) proximity];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) proximity];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_100006034, *(void *)(a1 + 32));

    uint64_t v7 = (void *)[*(id *)(a1 + 32) proximity];
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_100006050, *(void *)(a1 + 32));

    v8 = (void *)[*(id *)(a1 + 32) proximity];
    v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);
  }

  v10 = [*(id *)(a1 + 32) groupProximity];
  dispatch_group_leave(v10);

  if (byte_100070CC0) {
    kdebug_trace(730595396, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_100006034(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_100006050(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000606C(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 5000000000LL);
  if ([*(id *)(a1 + 32) productID] == 614
    || [*(id *)(a1 + 32) productID] == 621)
  {
    id v3 = [*(id *)(a1 + 32) sentHostReadyReport];
    dispatch_semaphore_wait(v3, v2);
  }

  v4 = [*(id *)(a1 + 32) gotDeviceExtendedInfoReport];
  dispatch_semaphore_wait(v4, v2);

  v5 = [*(id *)(a1 + 32) groupInit];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006208;
  block[3] = &unk_10005CB58;
  block[4] = *(void *)(a1 + 32);
  dispatch_group_async(v5, v7, block);

  v8 = [*(id *)(a1 + 32) groupInit];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000063EC;
  v11[3] = &unk_10005CB58;
  v11[4] = *(void *)(a1 + 32);
  dispatch_group_async(v8, v7, v11);

  v9 = [*(id *)(a1 + 32) groupInit];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000065D0;
  v10[3] = &unk_10005CB58;
  v10[4] = *(void *)(a1 + 32);
  dispatch_group_async(v9, v7, v10);
}

void sub_100006208(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595360, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  id v3 = [OBJC_CLASS___HIDAppleSiriRemoteDevice getInfraredHIDReportDescriptor];
  id v10 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:4LL v2 v3 0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1LL);
  [*(id *)(a1 + 32) setInfrared:v4];

  v5 = [*(id *)(a1 + 32) infrared];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) infrared];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_1000063B4, *(void *)(a1 + 32));

    uint64_t v7 = (void *)[*(id *)(a1 + 32) infrared];
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_1000063D0, *(void *)(a1 + 32));

    v8 = (void *)[*(id *)(a1 + 32) infrared];
    v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);
  }

  if (byte_100070CC0) {
    kdebug_trace(730595364, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_1000063B4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_1000063D0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_1000063EC(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595376, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  id v3 = [OBJC_CLASS___HIDAppleSiriRemoteDevice getAudioHIDReportDescriptor];
  id v10 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:5LL hidDescriptor:v3 extendedData:0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1LL);
  [*(id *)(a1 + 32) setAudio:v4];

  v5 = [*(id *)(a1 + 32) audio];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) audio];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_100006598, *(void *)(a1 + 32));

    uint64_t v7 = (void *)[*(id *)(a1 + 32) audio];
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_1000065B4, *(void *)(a1 + 32));

    v8 = [*(id *)(a1 + 32) audio];
    v9 = (void *)[*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);
  }

  if (byte_100070CC0) {
    kdebug_trace(730595380, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_100006598(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_1000065B4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_1000065D0(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595384, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  id v3 = [OBJC_CLASS___HIDAppleSiriRemoteDevice getRadioHIDReportDescriptor];
  id v10 = [OBJC_CLASS___HIDAppleSiriRemoteDevice properties:6LL hidDescriptor:v3 extendedData:0LL];

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1LL);
  [*(id *)(a1 + 32) setRadio:v4];

  v5 = [*(id *)(a1 + 32) radio];
  if (v5)
  {
    v6 = (void *)[*(id *)(a1 + 32) radio];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000677C, *(void *)(a1 + 32));

    uint64_t v7 = (void *)[*(id *)(a1 + 32) radio];
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_100006798, *(void *)(a1 + 32));

    v8 = (void *)[*(id *)(a1 + 32) radio];
    v9 = (void *)[*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);
  }

  if (byte_100070CC0) {
    kdebug_trace(730595388, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_10000677C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_100006798(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_1000067B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if (byte_100070CC0) {
      kdebug_trace(730595400, [WeakRetained instanceID], 0, 0, 0);
    }
    char v7 = -81;
    unsigned int v3 = [v2 setReport:&v7 reportLength:1 reportID:175 reportType:2 keyholeID:240];
    if (v3)
    {
      int v4 = v3;
      v5 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
        sub_100038DB4(v4, v5);
      }
    }

    v6 = [v2 sentHostReadyReport];
    dispatch_semaphore_signal(v6);

    if (byte_100070CC0) {
      kdebug_trace(730595404, [v2 instanceID], 0, 0, 0);
    }
  }
}

void sub_1000068CC(uint64_t a1)
{
  dispatch_time_t v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupInit]);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_CLASS___HIDAppleSiriRemoteDevice;
  [super notifyDidStart];
  [*(id *)(a1 + 32) logHwFwVersions];
  id location = 0LL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  unsigned int v3 = (dispatch_queue_s *)[*(id *)(a1 + 32) queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000069C8;
  v4[3] = &unk_10005CB80;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_1000069B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000069C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained notifyDesiredConnectionParametersDidChange];
    id WeakRetained = v2;
  }
}
}

void sub_100006E94(_Unwind_Exception *a1)
{
}

void sub_100007218( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007234(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0LL;
    if (!notify_get_state(a2, &state64))
    {
      if (state64) {
        [WeakRetained setSleepPeripheralLatency];
      }
      else {
        [WeakRetained setNormalPeripheralLatency];
      }
    }
  }
}

void sub_1000074F0(uint64_t a1)
{
  id v4 = [NSUserDefaults standardUserDefaults];
  id v2 = [v4 objectForKey:@"SleepPeripheralLatency"];

  if (v2) {
    uint64_t v3 = (uint64_t)[v4 integerForKey:@"SleepPeripheralLatency"];
  }
  else {
    uint64_t v3 = 199LL;
  }
  if ([*(id *)(a1 + 32) latency] != (_DWORD)v3)
  {
    [*(id *)(a1 + 32) setLatency:v3];
    [*(id *)(a1 + 32) notifyDesiredConnectionParametersDidChange];
  }
}

void sub_100007620(uint64_t a1)
{
  if (byte_100070CC0) {
    kdebug_trace(730595416, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
  id v4 = [NSUserDefaults standardUserDefaults];
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"NormalPeripheralLatency"]);

  if (v2) {
    uint64_t v3 = (uint64_t)[v4 integerForKey:@"NormalPeripheralLatency"];
  }
  else {
    uint64_t v3 = 80LL;
  }
  if ([*(id *)(a1 + 32) latency] != (_DWORD)v3)
  {
    [*(id *)(a1 + 32) setLatency:v3];
    [*(id *)(a1 + 32) notifyDesiredConnectionParametersDidChange];
  }

  if (byte_100070CC0) {
    kdebug_trace(730595420, [*(id *)(a1 + 32) instanceID], 0, 0, 0);
  }
}

id sub_1000077BC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) latency];
  if ((_DWORD)result)
  {
    [*(id *)(a1 + 32) setLatency:0];
    return [*(id *)(a1 + 32) notifyDesiredConnectionParametersDidChange];
  }

  return result;
}

id sub_1000079E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"buttons";
  uint64_t v4 = v1;
  return [NSDictionary dictionaryWithObjects:forKeys:count:&v4, &v3, 1LL];
}

void sub_100007C60(_Unwind_Exception *a1)
{
}

id sub_100007DA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"proximity";
  uint64_t v4 = v1;
  return [NSDictionary dictionaryWithObjects:forKeys:count:&v4, &v3, 1LL];
}

void sub_10000882C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_100008850(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008860(uint64_t a1)
{
}

id sub_100008868(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
}

id sub_100008878(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
}

id sub_100008A08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"inertial";
  uint64_t v4 = v1;
  return [NSDictionary dictionaryWithObjects:forKeys:count:&v4, &v3, 1LL];
}

void sub_100008CEC(_Unwind_Exception *a1)
{
}

NSDictionary *__cdecl sub_100008D04(id a1)
{
  return (NSDictionary *)&off_1000600D0;
}

id sub_100008D10(uint64_t a1)
{
  uint64_t v4 = @"audio";
  uint64_t v1 = (void *)[*(id *)(a1 + 32) description];
  id v5 = v1;
  id v2 = [NSDictionary dictionaryWithObjects:forKeys:count:v5, v4, 1LL];

  return v2;
}

void sub_10000A1E8(_Unwind_Exception *a1)
{
}

void sub_10000A1FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    uint64_t v5 = 512LL;
    else {
      uint64_t v3 = 188LL;
    }
    if (![WeakRetained getReport:&v6 reportLength:&v5 reportID:v3 reportType:2 keyholeID:240]) {
      [WeakRetained handleDeviceManagementData:&v6 dataLength:v5];
    }
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    uint64_t v5 = 512LL;
    else {
      uint64_t v4 = 187LL;
    }
    if (![WeakRetained getReport:&v6 reportLength:&v5 reportID:v4 reportType:2 keyholeID:240]) {
      [WeakRetained handleDeviceManagementData:&v6 dataLength:v5];
    }
  }
}

void sub_10000A534( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000A550(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (dispatch_semaphore_s *)[WeakRetained doapAudioStart];
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    uint64_t v7 = dispatch_semaphore_wait(v5, v6);

    if (v7)
    {
      __int128 v8 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_100039518(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out after %lld seconds waiting to start Siri",  10LL));
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      __int128 v26 = v16;
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      __int128 v18 = (void *)[NSError errorWithDomain:NSMachErrorDomain code:-536870186LL userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      id v19 = v4;
      objc_sync_enter(v19);
      __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [v19 setAudioBuffer:v20];

      objc_sync_exit(v19);
    }

    else
    {
      __int128 v21 = (dispatch_queue_s *)[v4 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000A7A0;
      block[3] = &unk_10005CC60;
      objc_copyWeak(&v24, v2);
      id v23 = *(id *)(a1 + 32);
      dispatch_async(v21, block);

      objc_destroyWeak(&v24);
    }
  }
}

void sub_10000A784(_Unwind_Exception *a1)
{
}

void sub_10000A7A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    [v4 setDoapAudioStop:v5];

    objc_sync_exit(v4);
    __int16 v22 = 408;
    id v21 = 0LL;
    unsigned int v6 = [v4 setReport:&v22 reportLength:2 reportID:152 reportType:2 keyholeID:240 error:&v21];
    id v7 = v21;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_100039584();
      }
      id v8 = v4;
      objc_sync_enter(v8);
      [v8 setDoapAudioStop:0];
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [v8 setAudioBuffer:v9];

      objc_sync_exit(v8);
      uint64_t v10 = (dispatch_semaphore_s *)[v8 doapAudioStart];
      dispatch_semaphore_signal(v10);
    }

    else
    {
      uint64_t v10 = (dispatch_semaphore_s *)v4;
      objc_sync_enter(v10);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_semaphore_s audioBuffer](v10, "audioBuffer", 0LL));
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v14);
            __int128 v16 = (void *)[v10 doapAudioRelay];
            [v16 sendAudioFrame:v15];

            uint64_t v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }

        while (v12);
      }

      -[dispatch_semaphore_s setAudioBuffer:](v10, "setAudioBuffer:", 0LL);
      objc_sync_exit(v10);
    }
  }
}

void sub_10000A9FC(_Unwind_Exception *a1)
{
}

LABEL_17:
    v4[2](v4, 0LL);
    __int128 v35 = self;
    objc_sync_enter(v35);
    -[HIDAppleSiriRemoteDevice setDoapAudioStop:](v35, "setDoapAudioStop:", 0LL);
    __int128 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[HIDAppleSiriRemoteDevice setAudioBuffer:](v35, "setAudioBuffer:", v36);

    objc_sync_exit(v35);
    __int128 v37 = (dispatch_semaphore_s *)[v35 doapAudioStart];
    dispatch_semaphore_signal(v37);

    goto LABEL_18;
  }

  __int128 v29 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_1000395EC(v29);
  }
  v41 = NSLocalizedDescriptionKey;
  v42 = @"No doapAudioStop semaphore";
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870165LL,  v30));

  v4[2](v4, v31);
  __int128 v32 = (dispatch_semaphore_s *)[self doapAudioStart];
  dispatch_semaphore_signal(v32);

  __int128 v33 = self;
  objc_sync_enter(v33);
  __int128 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[HIDAppleSiriRemoteDevice setAudioBuffer:](v33, "setAudioBuffer:", v34);

  objc_sync_exit(v33);
LABEL_18:
}

    -[GenericSiriRemoteListener setDoapAudioStop:](self, "setDoapAudioStop:", 0LL);
    v4[2](v4, 0LL);
    v42 = [self doapAudioStart];
    dispatch_semaphore_signal(v42);

    v43 = self;
    objc_sync_enter(v43);
    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[GenericSiriRemoteListener setAudioBuffer:](v43, "setAudioBuffer:", v44);

    objc_sync_exit(v43);
    goto LABEL_18;
  }

  __int128 v29 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_100039BF8(v29, v30, v31, v32, v33, v34, v35, v36);
  }
  v47 = NSLocalizedDescriptionKey;
  v48 = @"No doapAudioStop semaphore";
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870165LL,  v37));

  v4[2](v4, v38);
  v39 = [GenericSiriRemoteListener doapAudioStart];
  dispatch_semaphore_signal(v39);

  v40 = self;
  objc_sync_enter(v40);
  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[GenericSiriRemoteListener setAudioBuffer:](v40, "setAudioBuffer:", v41);

  objc_sync_exit(v40);
LABEL_18:
}

void sub_10000AFB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000AFE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained waitForSiriAudioToStop:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_10000B1EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000B208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v11 = 152;
    id v10 = 0LL;
    unsigned int v4 = [WeakRetained setReport:&v11 reportLength:2 reportID:152 reportType:2 keyholeID:240 error:&v10];
    id v5 = v10;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_100039628();
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      unsigned int v6 = (dispatch_semaphore_s *)[v3 doapAudioStart];
      dispatch_semaphore_signal(v6);

      id v7 = v3;
      objc_sync_enter(v7);
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [v7 setAudioBuffer:v8];

      objc_sync_exit(v7);
    }

    else
    {
      uint64_t v9 = (void *)[NSDate date];
      [v3 setLastAudioDate:v9];

      [v3 waitForSiriAudioToStop:*(void *)(a1 + 32)];
    }
  }
}

void sub_10000B354(_Unwind_Exception *a1)
{
}

void sub_10000B9DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000B9F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000BA2C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000BA40( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000BA64( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000BA74( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10000BA90(id a1)
{
  return a1;
}

BOOL sub_10000BA98()
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 4;
}

BOOL sub_10000BAC0()
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 6;
}

BOOL sub_10000BAE8()
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 1;
}

BOOL sub_10000BB10()
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 9;
}

void sub_10000BB38()
{
  v0 = [NSNotificationCenter defaultCenter];
  id v1 =  [v0 addObserverForName:NSUserDefaultsDidChangeNotification object:0 queue:0 usingBlock:&stru_10005CCA0];

  sub_10000BB94();
}

void sub_10000BB94()
{
  v0 = [NSUserDefaults standardUserDefaults];
  id v1 = [v0 objectForKey:@"EnableSignposts"];

  byte_100070CC0 = [v1 BOOLValue];
}

void sub_10000BC34(id a1)
{
  if (sub_10000BAC0() || sub_10000BAE8() || sub_10000BB10())
  {
    id v1 = objc_alloc_init(&OBJC_CLASS___EndpointManager);
    id v2 = (void *)qword_100070BF8;
    qword_100070BF8 = (uint64_t)v1;
  }

LABEL_4:
}
}
}

void sub_100010768( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100010784( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000107D4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___GenericSiriRemoteListener);
  id v2 = (void *)qword_100070C08;
  qword_100070C08 = (uint64_t)v1;

  if (qword_100070C08)
  {
    _[(id)qword_100070C08 setUpHidHandlers];
  }

  else
  {
    id v3 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_100039AC0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_100010970(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 dataValue];
  [v3 handleAudioData:v4];
}

void sub_1000109B4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (!a3)
  {
    __int128 v16 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Destroying doapAudioRelay for GenericSiriRemote device %@",  (uint8_t *)&v19,  0xCu);
    }

    __int128 v17 = *(void **)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    __int128 v18 = (void *)[v17 doapAudioRelay];
    [v18 invalidate];

    [*v6 setDoapAudioRelay:0];
    uint64_t v12 = 4LL;
    goto LABEL_9;
  }

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  uint64_t v8 = (void *)[v7 doapAudioRelay];

  if (!v8)
  {
    uint64_t v9 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Creating doapAudioRelay for GenericSiriRemote device %@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](&OBJC_CLASS___DoAPAudioRelayHub, "instance"));
    __int16 v11 = (void *)[v5 propertyForKey:@"PhysicalDeviceUniqueID"];
    uint64_t v12 = 2LL;
    uint64_t v13 = (void *)[v10 relayWithIdentifier:v11 deviceType:2 properties:0 codecType:7];
    [*v6 setDoapAudioRelay:v13];

    id v14 = *v6;
    uint64_t v15 = (void *)[*v6 doapAudioRelay];
    [v15 setDelegate:v14];

LABEL_9:
    [*v6 setState:v12];
  }
}

void sub_100010F50(_Unwind_Exception *a1)
{
}

id sub_100010F68(uint64_t a1)
{
  id v4 = @"audio";
  id v1 = [*(id *)(a1 + 32) description];
  id v5 = v1;
  id v2 = [NSDictionary dictionaryWithObjects:forKeys:count:v5, v4, 1];

  return v2;
}

NSDictionary *__cdecl sub_100010FFC(id a1)
{
  return (NSDictionary *)&off_100060170;
}

void sub_100011174(uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)[*(id *)(a1 + 32) doapAudioStart];
  dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
  uint64_t v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    id v5 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_100039B88(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out after %lld seconds waiting to start Siri",  10LL));
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    __int16 v22 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:forKeys:count:&v22, &v21, 1LL];
    uint64_t v15 = (void *)[NSError errorWithDomain:NSMachErrorDomain code:-536870186LL userInfo:v14];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    __int128 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [*(id *)(a1 + 32) setAudioBuffer:v17];

    objc_sync_exit(v16);
  }

  else
  {
    __int128 v18 = (dispatch_queue_s *)[*(id *)(a1 + 32) eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000113A4;
    block[3] = &unk_10005CF10;
    void block[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    dispatch_async(v18, block);
  }

void sub_100011388(_Unwind_Exception *a1)
{
}

void sub_1000113A4(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  [*(id *)(a1 + 32) setDoapAudioStop:v2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer", 0));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v7);
        uint64_t v9 = (void *)[*(id *)(a1 + 32) doapAudioRelay];
        [v9 sendAudioFrame:v8];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  uint64_t v10 = (void *)[*(id *)(a1 + 32) audioBuffer];
  [v10 removeAllObjects];

  [*(id *)(a1 + 32) setAudioBuffer:0];
  objc_sync_exit(v3);
}

void sub_100011528(_Unwind_Exception *a1)
{
}

void sub_100011A94(_Unwind_Exception *a1)
{
}

id sub_100011AB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
}

id sub_100011C48(uint64_t a1)
{
  dispatch_semaphore_t v2 = [NSDate date];
  [*(id *)(a1 + 32) setLastAudioDate:v2];

  return [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
}

void sub_100011DD4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___PolicyManager);
  dispatch_semaphore_t v2 = (void *)qword_100070C18;
  qword_100070C18 = (uint64_t)v1;
}

void sub_100012670(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) service];
  [v2 hidDeviceDidStart];
}

void sub_100012720(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) service];
  [v2 hidDeviceDidStop];
}

void sub_1000127C0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) service];
  [v1 hidDeviceDesiredConnectionParametersDidChange];
}

LABEL_13:
  return (char)v4;
}

    goto LABEL_26;
  }

  if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v10))
  {
    __int128 v17 = -[DoAPAudioRelayHub soundSensorXpcConnection];

    if (v17)
    {
      -[DoAPAudioRelayHub setSoundSensorXpcConnection:](self, "setSoundSensorXpcConnection:", 0LL);
      NSErrorUserInfoKey v25 = 0u;
      __int128 v26 = 0u;
      id v23 = 0u;
      id v24 = 0u;
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays", 0LL));
      __int128 v18 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18)
      {
        int v19 = v18;
        id v20 = *(void *)v24;
        do
        {
          for (j = 0LL; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v11);
            }
            __int16 v22 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)j);
            if ([v22 deviceType] == (id)4) {
              [v22 handleResetStream];
            }
          }

          int v19 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }

        while (v19);
      }

      goto LABEL_13;
    }
  }

uint64_t start(int a1, char *const *a2)
{
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_100012D70);
  dispatch_resume(v4);
  char v5 = 0;
  do
  {
    char v6 = v5;
    int v7 = getopt(a1, a2, "c");
    char v5 = 1;
  }

  while (v7 == 99);
  if (v7 == -1)
  {
    uint64_t v8 = optind;
    sub_10001FCB0("BTLEServer");
    sub_10000BB38();
    if ((v6 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if (a1 != (_DWORD)v8)
      {
        int v10 = v8 - a1;
        __int128 v11 = &a2[v8];
        do
        {
          uint64_t v12 = (uint64_t)*v11++;
          __int128 v13 = [NSString stringWithUTF8String:v12];
          __int128 v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v13);
          [v9 addObject:v14];
        }

        while (!__CFADD__(v10++, 1));
      }

      id v16 = [ConnectionManager instance];
      [v16 connectAlways:v9];
    }

    else
    {
      id v18 = +[BTLEXpcServer instance](&OBJC_CLASS___BTLEXpcServer, "instance");
      id v19 = +[DoAPAudioRelayHub instance](&OBJC_CLASS___DoAPAudioRelayHub, "instance");
      id v20 = +[GenericSiriRemoteListener instance](&OBJC_CLASS___GenericSiriRemoteListener, "instance");
      id v21 = +[LoggingManager instance](&OBJC_CLASS___LoggingManager, "instance");
      if (!sub_10000BA98())
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_100012DCC,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      }
    }

    id v23 = [NSRunLoop currentRunLoop];
    [v23 run];

    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  return v17;
}

void sub_100012D70()
{
  v0 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SIGTERM received, exiting", v1, 2u);
  }

  exit(0);
}

void sub_100012DCC()
{
  v0 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }

  exit(1);
}

void sub_100012E68(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___CattManager);
  id v2 = (void *)qword_100070C28;
  qword_100070C28 = (uint64_t)v1;
}

id sub_1000144A8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleEvent:a2];
}

uint64_t sub_1000149E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  char v5 = objc_alloc(&OBJC_CLASS___NSUUID);
  bytes = xpc_uuid_get_bytes(v4);

  int v7 = -[NSUUID initWithUUIDBytes:](v5, "initWithUUIDBytes:", bytes);
  [v3 addObject:v7];

  return 1LL;
}

void sub_10001652C(_Unwind_Exception *a1)
{
}

uint64_t sub_10001654C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithUTF8String:a2];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  uint64_t v9 = *(void **)(v7 + 8 * v8);
  *(void *)(v7 + 8 * v_Block_object_dispose((const void *)(v1 - 104), 8) = v6;

  int v10 = sub_1000165F4(v5);
  uint64_t v11 = [v10 autorelease];

  uint64_t v12 = a1[6];
  uint64_t v13 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  __int128 v14 = *(void **)(v12 + 8 * v13);
  *(void *)(v12 + 8 * v13) = v11;

  ++*(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  return 1LL;
}

__CFString *sub_1000165F4(void *a1)
{
  id v1 = a1;
  xpc_type_t type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    id v4 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v1));
    id v5 = [v4 UUID];
    goto LABEL_26;
  }

  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v1));
    id v5 = [v6 UUID];
    goto LABEL_26;
  }

  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v1);
    uint64_t v8 = &__kCFBooleanFalse;
    if (value) {
      uint64_t v8 = &__kCFBooleanTrue;
    }
    id v5 = v8;
    goto LABEL_26;
  }

  if (type != (xpc_type_t)&_xpc_type_string)
  {
    if (type == (xpc_type_t)&_xpc_type_data)
    {
      uint64_t v13 = objc_alloc(&OBJC_CLASS___NSData);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      id v5 = -[NSData initWithBytes:length:](v13, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v1));
    }

    else if (type == (xpc_type_t)&_xpc_type_uuid)
    {
      id v5 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v1));
    }

    else if (type == (xpc_type_t)&_xpc_type_array)
    {
      uint64_t v15 = sub_100016D48(v1);
      id v5 = [v15 UUID];
    }

    else if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v16 = sub_100016E68(v1);
      id v5 = [v16 UUID];
    }

    else if (type == (xpc_type_t)&_xpc_type_fd)
    {
      uint64_t v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", xpc_fd_dup(v1));
      id v5 = [v17 UUID];
    }

    else
    {
      if (type != (xpc_type_t)&_xpc_type_double)
      {
        NSLog(@"Unknown XPC type: %p", type);
        id v3 = 0LL;
        goto LABEL_27;
      }

      id v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", xpc_double_get_value(v1));
      id v5 = [v18 UUID];
    }

LABEL_26:
    id v3 = (__CFString *)v5;
    goto LABEL_27;
  }

  uint64_t v9 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v1));
  uint64_t v10 = [v9 autorelease];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = &stru_10005DB20;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  id v3 = v12;

LABEL_27:
  return v3;
}

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100070C38);
}

NSArray *sub_100016D48(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  size_t v3 = 8 * count;
  __chkstk_darwin();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v3);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_10001701C;
  applier[3] = &unk_10005D038;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL);
  xpc_array_apply(v1, applier);
  id v4 = -[NSArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:count:",  (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL),  count);
  if (count)
  {
    do
    {

      v3 -= 8LL;
    }

    while (v3);
  }

  return v4;
}

NSDictionary *sub_100016E68(void *a1)
{
  id v1 = a1;
  size_t count = xpc_dictionary_get_count(v1);
  uint64_t v3 = 8 * count;
  __chkstk_darwin();
  id v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v4, 8 * count);
  __chkstk_darwin();
  bzero(v4, 8 * count);
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  v10[3] = 0LL;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_10001705C;
  applier[3] = &unk_10005D018;
  applier[4] = v10;
  void applier[5] = v4;
  applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  id v5 = -[NSDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjects:forKeys:count:",  v4,  v4,  count);
  _Block_object_dispose(v10, 8);
  if (count)
  {
    uint64_t v6 = 8 * count;
    do
    {

      v6 -= 8LL;
    }

    while (v6);
    uint64_t v7 = v4 - 8;
    do
    {

      v3 -= 8LL;
    }

    while (v3);
  }

  return v5;
}

void sub_100016FFC(_Unwind_Exception *a1)
{
}

uint64_t sub_10001701C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000165F4(a3);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8 * a2);
  *(void *)(v7 + 8 * a2) = v6;

  return 1LL;
}

uint64_t sub_10001705C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithUTF8String:a2];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  uint64_t v9 = *(void **)(v7 + 8 * v8);
  *(void *)(v7 + 8 * v_Block_object_dispose((const void *)(v1 - 104), 8) = v6;

  uint64_t v10 = sub_1000165F4(v5);
  uint64_t v11 = [v10 autorelease];

  uint64_t v12 = a1[6];
  uint64_t v13 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  __int128 v14 = *(void **)(v12 + 8 * v13);
  *(void *)(v12 + 8 * v13) = v11;

  ++*(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  return 1LL;
}

void sub_100017104(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

id sub_100017128(id a1)
{
  return a1;
}

id sub_100017310(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleServerEvent:a2];
}

void sub_10001735C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DoAPAudioRelayHub);
  id v2 = (void *)qword_100070C40;
  qword_100070C40 = (uint64_t)v1;
}

LABEL_10:
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100070C38);
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v10)
      && !+[DoAPAudioRelayHub applicationIDIsSiri:](&OBJC_CLASS___DoAPAudioRelayHub, "applicationIDIsSiri:", string))
    {
      if (!_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v11)
        || !+[DoAPAudioRelayHub applicationIDIsSoundSensor:]( &OBJC_CLASS___DoAPAudioRelayHub,  "applicationIDIsSoundSensor:",  string))
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003A224();
        }
        goto LABEL_18;
      }

      id v19 = [self soundSensorXpcConnection];

      if (v19)
      {
        id v20 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003A194(v20, self);
        }
        id v21 = [self soundSensorXpcConnection];
        xpc_connection_set_event_handler(v21, &stru_10005D0B8);

        __int16 v22 = -[DoAPAudioRelayHub soundSensorXpcConnection];
        xpc_connection_cancel(v22);
      }

      -[DoAPAudioRelayHub setSoundSensorXpcConnection:](self, "setSoundSensorXpcConnection:", v4);
      id v23 = [self soundSensorXpcConnection];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100017AA4;
      v24[3] = &unk_10005CFC8;
      v24[4] = self;
      xpc_connection_set_event_handler(v23, v24);

      uint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

      if (v12)
      {
        uint64_t v13 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003A104(v13, self);
        }
        __int128 v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        xpc_connection_set_event_handler(v14, &stru_10005D098);

        uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        xpc_connection_cancel(v15);
      }

      -[DoAPAudioRelayHub setSiriXpcConnection:](self, "setSiriXpcConnection:", v4);
      id v16 = [self siriXpcConnection];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100017A34;
      handler[3] = &unk_10005CFC8;
      handler[4] = self;
      xpc_connection_set_event_handler(v16, handler);

      uint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    }

    id v18 = v17;
    xpc_connection_resume(v17);

LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100070C38);
    goto LABEL_21;
  }

  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003A2B4();
  }
LABEL_21:
}
}

void sub_1000179D0(id a1, OS_xpc_object *a2)
{
  id v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - Event handler fired for previously torn down siri XPC connection",  v3,  2u);
  }

id sub_100017A34(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

void sub_100017A40(id a1, OS_xpc_object *a2)
{
  id v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - Event handler fired for previously torn down sound sensor XPC connection",  v3,  2u);
  }

id sub_100017AA4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

LABEL_25:
}
}

LABEL_24:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100070C38);
}

LABEL_11:
  return v6;
}

  return v6;
}

    self = v9;
    id v19 = self;
    goto LABEL_12;
  }

  id v19 = 0LL;
LABEL_12:

  return v19;
}

    self = v9;
    id v23 = self;
    goto LABEL_12;
  }

  id v23 = 0LL;
LABEL_12:

  return v23;
}

  return v4;
}

  return (char)v6;
}

void sub_1000190C0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001961C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSKeyedArchiver);
    -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", v3, @"kMsgArgError");

    uint64_t v7 = @"kMsgArgError";
    id v5 = [v4 encodedData];
    uint64_t v8 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  [*(id *)(a1 + 32) sendMsg:"TransportDidStart" args:v6];
}

void sub_10001975C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSKeyedArchiver);
    -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", v3, @"kMsgArgError");

    uint64_t v7 = @"kMsgArgError";
    id v5 = [v4 encodedData];
    uint64_t v8 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  [*(id *)(a1 + 32) sendMsg:"TransportDidStop" args:v6];
}

id sub_100019C6C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleServerEvent:a2];
}

void sub_100019CB8(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___LoggingManager);
  id v2 = (void *)qword_100070C50;
  qword_100070C50 = (uint64_t)v1;
}

void sub_100019D44(_Unwind_Exception *a1)
{
}

id sub_100019F44(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

void sub_10001A6D8(_Unwind_Exception *a1)
{
}

void sub_10001A6F4(uint64_t a1)
{
  uint64_t v2 = [NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( *(void *)(a1 + 32),  "logRetrievalComplete",  0LL,  0LL,  420.0);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + _Block_object_dispose((const void *)(v1 - 104), 8) = v2;

  id v5 = [UARPServiceUARPControllerManager instance];
  [v5 startTapToRadar];
}

BOOL sub_10001AB38(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003A89C(v6, v5, v4);
    }
  }

  return 1;
}

void sub_10001AD00(_Unwind_Exception *a1)
{
}

void sub_10001ADE0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___ConnectionManager);
  uint64_t v2 = (void *)qword_100070C60;
  qword_100070C60 = (uint64_t)v1;
}

LABEL_22:
          -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v27);
          goto LABEL_23;
        }

        if (v32)
        {
          __int128 v33 = v31;
          __int128 v34 = (void *)[v27 name];
          *(_DWORD *)buf = 138412290;
          v46 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Bluetooth is restricted. Outgoing connection to %@ not allowed.",  buf,  0xCu);
        }
}

      goto LABEL_25;
    }

    v54 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003AA84(v54);
    }
  }

  else
  {
    v49 = [v28 hasTag:@"needsMFiAuthentication4.0"];

    if (v49)
    {
      v50 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v50;
        v52 = [self mfiPeripheral];
        *(_DWORD *)buf = 138412290;
        v58 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Posting auth failed notification for: %@",  buf,  0xCu);
      }

      __int128 v33 = (const __CFDictionary *)[NSNotificationCenter defaultCenter];
      v53 = [self mfiPeripheral];
      -[__CFDictionary postNotificationName:object:userInfo:]( v33,  "postNotificationName:object:userInfo:",  @"AuthenticationServiceAuthDidFailNotification",  v53,  0LL);

      goto LABEL_22;
    }
  }

        return;
      }
    }

    else
    {
    }

    if (-[HIDService allInputReportsReady](self, "allInputReportsReady")
      && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      sub_10003B0AC();
    }

    goto LABEL_22;
  }

  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
  uint64_t v10 = (void *)[v9 value];

  if (v10) {
    goto LABEL_10;
  }
}

    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSData);
    return v17;
  }

  uint64_t v12 = a3 - 3;
  if (a3 < 3)
  {
    __int128 v14 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      sub_10003D174(a3, v14);
      if (a3) {
        goto LABEL_15;
      }
    }

    else if (a3)
    {
      goto LABEL_15;
    }

    goto LABEL_22;
  }

  uint64_t v13 = 1;
LABEL_16:
  __chkstk_darwin();
  bzero((char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0LL), a3);
  id v20 = 0LL;
  id v21 = 0LL;
  id v19 = 0LL;
  -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( self,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v12,  &v19,  4LL,  1LL,  0LL,  -[NSString length](self, "length"),  &v20);
  if (v13)
  {
    uint64_t v15 = v19;
    id v16 = (char *)&v19 + v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    *(_WORD *)id v16 = -32542;
    v16[2] = -90;
    id v19 = v15 + 3;
  }

  if (a5) {
    *a5 = v21 != 0;
  }
  uint64_t v17 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v19,  v19));
  return v17;
}

LABEL_23:
        __int128 v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      __int128 v35 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
      id v24 = v35;
    }

    while (v35);
  }

  -[ConnectionManager setPeripherals:](self, "setPeripherals:", v22);
}
}

LABEL_20:
}

LABEL_36:
}

id sub_10001D930(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 identifier];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = (void *)[v5 UUIDString];
  id v7 = [v4 isEqual:v6];

  return v7;
}

void sub_10001E3EC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a4;
  id v9 = [v4 outputStream];
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  [v9 write:v7 maxLength:v8];
}

void sub_10001E468(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a4;
  id v9 = [v4 outputStream];
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  [v9 write:v7 maxLength:v8];
}

LABEL_28:
}

id sub_10001F78C(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:0];
}

id sub_10001F8CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:1];
}

id sub_10001F9F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:0];
}

void sub_10001FC9C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001FCB0(char *category)
{
  os_log_t v1 = os_log_create("com.apple.bluetooth", category);
  uint64_t v2 = (void *)qword_100070CC8;
  qword_100070CC8 = (uint64_t)v1;
}

void sub_100020D14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100020D2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100020D3C(uint64_t a1)
{
}

void sub_100020D44(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a3;
  id v8 = [a2 UUID];
  unsigned int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    *a4 = 1;
  }
}

void sub_100020F4C(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
}

void sub_100021074( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002108C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isStarted] & 1) == 0)
  {
    id v7 = [v6 priority];
    if (v7 >= [*(id *)(a1 + 32) startPriority])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      id v8 = [v6 priority];
      if (v8 == [*(id *)(a1 + 32) startPriority])
      {
        unsigned int v9 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          uint64_t v11 = (void *)[v5 UUID];
          uint64_t v12 = (void *)[*(id *)(a1 + 32) peripheral];
          uint64_t v13 = (void *)[v12 name];
          int v15 = 138412546;
          id v16 = v11;
          __int16 v17 = 2112;
          id v18 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting service %@ on peripheral %@",  (uint8_t *)&v15,  0x16u);
        }

        __int128 v14 = (void *)[*(id *)(a1 + 32) startingClientServices];
        [v14 addObject:v6];

        [v6 start];
      }
    }
  }
}

void sub_1000215A0(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
}

void sub_100021B24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

id sub_100021B48(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result = [a3 isPrimary];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_100023A58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 setIsValid:0];
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSError errorWithDomain:CBErrorDomain code:3 userInfo:0];
  [v5 signalCommandCondition:v4 error:v6];
}

LABEL_30:
}

uint64_t sub_100025438(uint64_t a1)
{
  return IOAllowPowerChange((io_connect_t)[*(id *)(a1 + 32) pmService], *(void *)(a1 + 40));
}

void sub_1000257BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000257D4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  if (![a3 type] && (objc_msgSend(v7, "isNotifying") & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_10002598C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000259B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000259C0(uint64_t a1)
{
}

void sub_1000259C8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v9 = a2;
  id v8 = a3;
  if (*(_DWORD *)(a1 + 40) == [v8 ID]
    && *(_DWORD *)(a1 + 44) == [v8 type])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100025C84( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100025CC0()
{
  return [v0 type];
}

id sub_100025CCC()
{
  return [v0 ID];
}

LABEL_40:
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v10)
      {
LABEL_42:

        -[ClientService notifyDidStart](self, "notifyDidStart");
        break;
      }
    }
  }
}

LABEL_38:
        __int128 v14 = (char *)v14 + 1;
      }

      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }

    while (v11);
  }

  v41 = -[DoAPClientService SupportedCodecsCharacteristic];
  if (v41)
  {
    v42 = -[DoAPClientService SelectedCodecCharacteristic];

    id v9 = v51;
    if (v42)
    {
      v43 = -[DoAPClientService StartStreamingCharacteristic];

      if (v43)
      {
        v44 = [self StopStreamingCharacteristic];

        if (v44)
        {
          v45 = [self SendDataCharacteristic];

          if (v45)
          {
            v46 = -[DoAPClientService EventIndicatorCharacteristic];

            if (!v46 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
              sub_10003B9F4();
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            sub_10003B9C8();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
        {
          sub_10003B99C();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        sub_10003B970();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      sub_10003B944();
    }
  }

  else
  {
    id v9 = v51;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003B918();
    }
  }

LABEL_2:
}
}

LABEL_16:
      -[DoAPClientService createDoAPDevice](self, "createDoAPDevice");
      goto LABEL_2;
    }

    if (v10 == v8) {
      goto LABEL_16;
    }
    id v20 = [self StartStreamingCharacteristic];
    id v21 = v8;
    if ((id)v20 != v8)
    {
      __int16 v22 = (void *)v20;
      id v23 = [self StopStreamingCharacteristic];
      id v24 = v8;
      if ((id)v23 != v8)
      {
        NSErrorUserInfoKey v25 = (void *)v23;
        __int128 v26 = [self SendDataCharacteristic];
        if ((id)v26 != v8)
        {
          __int128 v27 = (void *)v26;
          __int128 v28 = -[DoAPClientService EventIndicatorCharacteristic];

          if (v28 != v8) {
            goto LABEL_2;
          }
LABEL_41:
          v47 = (void *)[v8 value];
          v48 = [DataInputStream inputStreamWithData:byteOrder:v47];

          v66 = 0;
          [v48 readUint16:&v66];
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v49 = [self doapDevices];
          v50 = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v50)
          {
            v51 = v50;
            v52 = *(void *)v59;
            do
            {
              for (j = 0LL; j != v51; j = (char *)j + 1)
              {
                if (*(void *)v59 != v52) {
                  objc_enumerationMutation(v49);
                }
                v54 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
                v55 = [v54 streamID];
                if (v55 == v66)
                {
                  goto LABEL_52;
                }
              }

              v51 = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
            }

            while (v51);
          }

LABEL_52:
          goto LABEL_2;
        }

        id v24 = v25;
      }

      id v21 = v22;
    }

    goto LABEL_41;
  }

void sub_10002A108( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10002A11C()
{
  return v0;
}

void sub_10002A16C(id a1)
{
  if (!sub_10000BA98())
  {
    os_log_t v1 = objc_alloc_init(&OBJC_CLASS___ServerServiceManager);
    uint64_t v2 = (void *)qword_100070C80;
    qword_100070C80 = (uint64_t)v1;
  }

void sub_10002A518(id a1, CBMutableService *a2, ServerService *a3, BOOL *a4)
{
}

id sub_10002A9DC(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 peripheralManagerDidUpdateState:*(void *)(a1 + 32)];
}

void sub_10002B334(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 UUID];
  id v6 = [v5 UUIDString];
  unsigned int v7 = [v6 isEqualToString:CBUUIDAppleNotificationCenterServiceString];

  if (v7) {
    [v8 peripheralManager:*(void *)(a1 + 32) central:*(void *)(a1 + 40) didUpdateANCSAuthorization:*(unsigned __int8 *)(a1 + 48)];
  }
}

void sub_10002B540( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002B554(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10002B9B8(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Stop DoAPSoundSensorRemoteDevice - Queue is clean",  v7,  2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0LL;
}

id sub_10002BDF0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  os_log_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 codec];
    uint64_t v3 = v5;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return [v2 selectCodec:v3];
}

id sub_10002BE3C(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___DoAPSoundSensorRemoteDevice;
  return [super notifyDidStart];
}

void sub_10002C104(_Unwind_Exception *a1)
{
}

void sub_10002C698(_Unwind_Exception *a1)
{
}

id sub_10002C6AC(uint64_t a1)
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) doapAudioStop]);

  if (!v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    [*(id *)(a1 + 32) setDoapAudioStop:v3];
  }

  return _[*(id *)(a1 + 32) waitForSoundSensorAudioToStop:&stru_10005D558];
}

void sub_10002CC84(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___BTLEXpcServer);
  objc_super v2 = (void *)qword_100070C90;
  qword_100070C90 = (uint64_t)v1;
}

id sub_10002D4B8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleEvent:a2];
}

void sub_10002DAC4(id a1)
{
  os_log_t v1 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Creating UARPServiceUARPControllerManager",  v4,  2u);
  }

  objc_super v2 = objc_opt_new(&OBJC_CLASS___UARPServiceUARPControllerManager);
  dispatch_semaphore_t v3 = (void *)qword_100070CA8;
  qword_100070CA8 = (uint64_t)v2;
}

void sub_10002E530(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  dispatch_semaphore_t v3 = (void *)[v2 uarpServiceForAccessoryUuid:v4];
  [v3 sendData:*(void *)(a1 + 48)];
}

void sub_10002EDFC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10002EE10(void *a1, const char *a2)
{
  return [a1 UTF8String];
}

void sub_10002F178(uint64_t a1)
{
  objc_super v2 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Stop DoAPSiriRemoteDevice - Queue is clean",  v7,  2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0LL;
}

id sub_10002F5F4(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  os_log_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 codec];
    uint64_t v3 = v5;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return [v2 selectCodec:v3];
}

id sub_10002F640(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___DoAPSiriRemoteDevice;
  return [super notifyDidStart];
}

void sub_10002F908(_Unwind_Exception *a1)
{
}

void sub_10002FBCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && (unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 error]), v5, !v5))
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    if ([*(id *)(a1 + 32) state] == 2)
    {
      id v9 = (os_log_s *)(id)qword_100070CC8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [*(id *)(a1 + 32) peripheral];
        uint64_t v11 = (void *)[v10 identifier];
        uint64_t v12 = (void *)[v11 UUIDString];
        int v17 = 138477827;
        id v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - activateSiri: SiriActivation success for ID %{private}@ received while Active",  (uint8_t *)&v17,  0xCu);
      }
    }

    else if ([*(id *)(a1 + 32) state] == 3)
    {
      uint64_t v13 = (os_log_s *)(id)qword_100070CC8;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v14 = (void *)[*(id *)(a1 + 32) peripheral];
        int v15 = (void *)[v14 identifier];
        id v16 = [v15 UUIDString];
        int v17 = 138477827;
        id v18 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - activateSiri: SiriActivation succeeded for ID %{private}@",  (uint8_t *)&v17,  0xCu);
      }

      [*(id *)(a1 + 32) doapStateSet:4];
    }

    objc_sync_exit(v8);
  }

  else
  {
    id v6 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003CCB8(v6, v4);
    }
    if ([*(id *)(a1 + 32) state] == 5)
    {
      unsigned int v7 = (dispatch_semaphore_s *)[*(id *)(a1 + 32) doapAudioStart];
      dispatch_semaphore_signal(v7);
    }

    [*(id *)(a1 + 32) stopStreaming:6];
    [*(id *)(a1 + 32) clearState];
  }
}

void sub_10002FE28(_Unwind_Exception *a1)
{
}

void sub_10002FFDC(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  id v3 = [v2 error];

  id v4 = (void *)qword_100070CC8;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003CD4C(v4, v2);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - SiriCancellation success",  v5,  2u);
  }
}

void sub_100030414(_Unwind_Exception *a1)
{
}

id sub_100030428(uint64_t a1)
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) doapAudioStop]);

  if (!v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    [*(id *)(a1 + 32) setDoapAudioStop:v3];
  }

  return [*(id *)(a1 + 32) waitForSiriAudioToStop:&stru_10005D650];
}

void sub_100030B4C(_Unwind_Exception *a1)
{
}

void sub_100030B7C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)qword_100070CC8;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriMyriad Score accepted", v6, 2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003CEF8();
  }
}

void sub_100030C1C(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  BOOL v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned __int8 v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - DoAP Button Press and Hold complete: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100030CC4(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  BOOL v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned __int8 v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "DoAPSiri - DoAP Button Release complete: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100030E6C(uint64_t a1)
{
  objc_super v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) doapAudioStart]);
  dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
  uint64_t v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    unsigned __int8 v5 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003CF88(v5, v6, v7);
    }
    id v8 = [NSString stringWithFormat:@"Timed out after %lld seconds waiting to start Siri", 10LL];
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v21 = v8;
    id v9 = [NSDictionary dictionaryWithObjects:forKeys:count:&v21, &v20, 1LL];
    id v10 = [NSError errorWithDomain:NSMachErrorDomain code:-536870186LL userInfo:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    uint64_t v12 = (void *)[*(id *)(a1 + 32) audioBuffer];
    [v12 removeAllObjects];

    objc_sync_exit(v11);
    uint64_t v13 = (dispatch_semaphore_s *)[*(id *)(a1 + 32) doapAudioStart];
    dispatch_semaphore_signal(v13);

    id v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    [*(id *)(a1 + 32) doapStateSet:2];
    objc_sync_exit(v14);

    [*(id *)(a1 + 32) clearState];
  }

  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    int v17 = *(dispatch_queue_s **)(v15 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000310CC;
    block[3] = &unk_10005CF10;
    void block[4] = v15;
    id v19 = v16;
    dispatch_async(v17, block);
  }

void sub_1000310AC(_Unwind_Exception *a1)
{
}

void sub_1000310CC(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  dispatch_time_t v3 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setDoapAudioStop:v2];

  uint64_t v4 = *(_BYTE **)(a1 + 32);
  if (v4[56] || v4[57])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    unsigned __int8 v5 = (void *)[*(id *)(a1 + 32) audioBuffer];

    if (v5)
    {
      id v6 = *v3;
      objc_sync_enter(v6);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v7 = (void *)[*v3 audioBuffer];
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
            uint64_t v12 = (void *)[*v3 doapAudioRelay];
            [v12 sendAudioFrame:v11];
          }

          id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v8);
      }

      uint64_t v13 = (void *)[*v3 audioBuffer];
      [v13 removeAllObjects];

      objc_sync_exit(v6);
    }

    id v14 = *v3;
    objc_sync_enter(v14);
    [*v3 doapStateSet:5];
    objc_sync_exit(v14);
  }

  else
  {
    unsigned int v15 = [v4 startStreaming];
    if (v15)
    {
      signed int v16 = v15;
      int v17 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003CFF8(a1 + 32, v17);
      }
      id v18 = [NSString stringWithFormat:@"Fail to send DoAP StartStream message - device state(%d)",  [*v3 state]];
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      __int128 v30 = v18;
      id v19 = [NSDictionary dictionaryWithObjects:forKeys:count:&v30, &v29, 1LL];
      id v14 = [NSError errorWithDomain:NSMachErrorDomain code:v16 userInfo:v19];

      [*v3 setDoapAudioStop:0];
      NSErrorUserInfoKey v20 = [*v3 doapAudioStart];
      dispatch_semaphore_signal(v20);
    }

    else
    {
      id v14 = 0LL;
    }

    id v21 = [*v3 audioBuffer];

    if (v21)
    {
      id v22 = *v3;
      objc_sync_enter(v22);
      id v23 = [*v3 audioBuffer];
      [v23 removeAllObjects];

      objc_sync_exit(v22);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100031400(_Unwind_Exception *a1)
{
}

void sub_100031990(_Unwind_Exception *a1)
{
}

id sub_1000319B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
}

void sub_100031AC4(uint64_t a1)
{
  dispatch_semaphore_t v2 = (void **)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 32) state];
  uint64_t v4 = *v2;
  if (v3 == 5)
  {
    unsigned int v5 = [v4 stopStreaming:0];
    if (v5)
    {
      signed int v6 = v5;
      uint64_t v7 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D0F8((uint64_t)v2, v7);
      }
      id v8 = (id *)(a1 + 32);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Fail to send DoAP StopStream message - device state(%d)",  [*(id *)(a1 + 32) state]));
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      id v19 = v9;
      id v10 = [NSDictionary dictionaryWithObjects:forKeys:count:&v19, &v18, 1LL];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v6,  v10));

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      uint64_t v12 = (dispatch_semaphore_s *)[*(id *)(a1 + 32) doapAudioStart];
      dispatch_semaphore_signal(v12);

      id v13 = *v8;
      objc_sync_enter(v13);
      id v14 = [*v8 audioBuffer];
      [v14 removeAllObjects];

      objc_sync_exit(v13);
    }

    else
    {
      signed int v16 = [NSDate date];
      [*(id *)(a1 + 32) setLastAudioDate:v16];

      [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
    }
  }

  else if ([v4 state] == 4)
  {
    [*(id *)(a1 + 32) stopStreaming:6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) audioBuffer]);
    [v15 removeAllObjects];

    objc_sync_exit(obj);
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }

void sub_100031D90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100032040(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_10003204C(uint64_t a1, void *a2)
{
  return a2;
}

id sub_100032058()
{
  return [v0 state];
}

id sub_1000339C0()
{
  return [v0 authInfo];
}

void sub_1000339CC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_1000339D8()
{
  return v0;
}

uint64_t sub_1000339E4()
{
  return v0;
}

  ;
}

const void *sub_1000339FC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, v1);
}

LABEL_18:
      id v13 = (char *)v13 + 1;
    }

    while (v11 != v13);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }

  while (v11);
LABEL_20:

  -[ClientService notifyDidStart](self, "notifyDidStart");
  id v23 = [self batteryLevelCharacteristic];

  if (!v23)
  {
    __int128 v24 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003D914(v24);
    }
  }

void sub_100034DDC(uint64_t a1)
{
  id v3 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 40)];
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
  [v2 setObject:v3 forKeyedSubscript:@"Current Capacity"];
}

void sub_100034FDC(uint64_t a1)
{
  unsigned int v2 = *(_BYTE *)(a1 + 40) & 3;
  if (v2 >= 2)
  {
    if (v2 == 2)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
      id v3 = v4;
      unsigned int v5 = &__kCFBooleanFalse;
    }

    else
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
      id v3 = v4;
      unsigned int v5 = &__kCFBooleanTrue;
    }

    [v4 setObject:v5 forKeyedSubscript:@"Is Present"];
  }

  else
  {
    id v3 = [*(id *)(a1 + 32) powerSourceDetails];
    [v3 removeObjectForKey:@"Is Present"];
  }

  unsigned int v6 = (*(unsigned __int8 *)(a1 + 40) >> 2) & 3;
  if (v6 >= 2)
  {
    if (v6 == 2)
    {
      id v8 = [*(id *)(a1 + 32) powerSourceDetails];
      uint64_t v7 = v8;
      uint64_t v9 = @"AC Power";
    }

    else
    {
      id v8 = [*(id *)(a1 + 32) powerSourceDetails];
      uint64_t v7 = v8;
      uint64_t v9 = @"Battery Power";
    }

    [v8 setObject:v9 forKeyedSubscript:@"Power Source State"];
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
    [v7 removeObjectForKey:@"Power Source State"];
  }

  unsigned int v10 = (*(unsigned __int8 *)(a1 + 40) >> 4) & 3;
  if (v10 >= 2)
  {
    if (v10 == 2)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
      uint64_t v12 = &__kCFBooleanFalse;
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerSourceDetails]);
      uint64_t v12 = &__kCFBooleanTrue;
    }

    id v13 = v11;
    [v11 setObject:v12 forKeyedSubscript:@"Is Charging"];
  }

  else
  {
    id v13 = [*(id *)(a1 + 32) powerSourceDetails];
    [v13 removeObjectForKey:@"Is Charging"];
  }
}

void sub_100035BE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100035C40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100035DCC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  id v3 = [*(id *)(a1 + 32) service];
  [v3 doapDeviceDidStart];
}

void sub_100035E40(_Unwind_Exception *a1)
{
}

void sub_100035EAC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) doapStateSet:8];
  objc_sync_exit(v2);

  id v3 = [*(id *)(a1 + 32) service];
  [v3 doapDeviceDidStop];
}

void sub_100035F10(_Unwind_Exception *a1)
{
}

void sub_100036158(_Unwind_Exception *a1)
{
}

void sub_1000362C4(_Unwind_Exception *a1)
{
}

id sub_100038920(void *a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return _[a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

id sub_100038938(void *a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return _[a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

void sub_100038B84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038BF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038C64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038CD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038D44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038DB4(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 175;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "error 0x%08X with set feature reportID 0x%02x",  (uint8_t *)v2,  0xEu);
  sub_10000B9EC();
}

void sub_100038E34(void *a1, void *a2)
{
  id v3 = sub_10000BA90(a1);
  [a2 instanceID];
  sub_10000BA84();
  sub_10000BA40((void *)&_mh_execute_header, v4, v5, "match for instance ID %u", v6, v7, v8, v9, v10);

  sub_10000B9EC();
}

void sub_100038EB0(uint8_t *a1, void *a2, void *a3, unsigned int *a4)
{
  uint64_t v7 = a2;
  unsigned int v8 = [a3 instanceID];
  *(_DWORD *)a1 = 67109120;
  *a4 = v8;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Matched device management driver. Set Bond Management for instance ID %u",  a1,  8u);
}

void sub_100038F24(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Matched AppleMultitouchDevice", buf, 2u);
}

void sub_100038F60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038FD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039040( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000390B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039120(void *a1, void *a2)
{
  id v3 = sub_10000BA90(a1);
  [a2 buttonData];
  sub_10000BA84();
  sub_10000BA40((void *)&_mh_execute_header, v4, v5, "Button 0x%04X", v6, v7, v8, v9, v10);

  sub_10000B9EC();
}

void sub_1000391A0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003920C()
{
}

void sub_10003926C(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_10000BA90(a1);
  [a2 productID];
  sub_10000BA84();
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Input report for unknown productID 0x%02x",  v4,  8u);

  sub_10000B9EC();
}

void sub_1000392F8()
{
}

void sub_100039358(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  sub_10000BA2C((void *)&_mh_execute_header, a2, a3, "Invalid report ID 0x%02X expecting 0x%02X", 67109376, v3);
  sub_10000B9EC();
}

void sub_1000393CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003943C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000394AC()
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "Invalid input report ID 0x%02X descriptor 0x%02X: both audio and inertial data present in descriptor",  v2,  v3);
  sub_10000B9EC();
}

void sub_100039518( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039584()
{
}

void sub_1000395EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Stopping Siri session immediately.", v1, 2u);
  sub_10000BA24();
}

void sub_100039628()
{
}

void sub_10003968C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to register endpoint %@ with error %@",  (uint8_t *)&v3,  0x16u);
  sub_10000B9EC();
}

void sub_10003970C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039770( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000397D4()
{
}

void sub_100039800()
{
}

void sub_10003982C()
{
}

void sub_100039858()
{
}

void sub_100039884()
{
}

void sub_1000398B0()
{
}

void sub_1000398DC()
{
}

void sub_100039908()
{
}

void sub_100039934()
{
}

void sub_100039960()
{
}

void sub_10003998C()
{
}

void sub_1000399B8()
{
}

void sub_1000399E4()
{
}

void sub_100039A10()
{
}

void sub_100039A3C()
{
}

void sub_100039A68()
{
}

void sub_100039A94()
{
}

void sub_100039AC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039AF0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039B58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039B88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039BF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039C28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "activeHIDDeviceCount: %lu -> %lu",  (uint8_t *)&v3,  0x16u);
}

void sub_100039CAC()
{
}

void sub_100039D10()
{
}

void sub_100039D70()
{
}

void sub_100039DD0(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100017128(a1);
  uint64_t v4 = (void *)[a2 connection];
  sub_100017110();
  sub_100017104((void *)&_mh_execute_header, v3, v5, "XPC client disconnection: %@", v6);

  sub_10001711C();
}

void sub_100039E5C(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100017128(a1);
  uint64_t v4 = (void *)[a2 description];
  sub_100017110();
  sub_100017104((void *)&_mh_execute_header, v3, v5, "Received XPC message: %@", v6);

  sub_10001711C();
}

void sub_100039EE8(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100017128(a1);
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_100017110();
  sub_100017104( (void *)&_mh_execute_header,  v3,  v5,  "handleUARPAACPTransportChangeMsg received from buds for UUID: %s",  v6);

  sub_10001711C();
}

void sub_100039F7C(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100017128(a1);
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_100017110();
  __int16 v7 = 2048;
  uint64_t v8 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "handleUARPDataOverAACPMsg got data, uuid: %s length: %lu",  v6,  0x16u);
}

void sub_10003A03C()
{
}

void sub_10003A0A0()
{
}

void sub_10003A104(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 siriXpcConnection];
  sub_100017110();
  sub_1000190C0( (void *)&_mh_execute_header,  v3,  v5,  "DoAPAudioRelayHub previous Siri XPC connection still exists (%p). Tear that down.",  v6);

  sub_10001711C();
}

void sub_10003A194(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 soundSensorXpcConnection];
  sub_100017110();
  sub_1000190C0( (void *)&_mh_execute_header,  v3,  v5,  "DoAPAudioRelayHub previous Sound Sensor XPC connection still exists (%p). Tear that down.",  v6);

  sub_10001711C();
}

void sub_10003A224()
{
}

void sub_10003A288()
{
}

void sub_10003A2B4()
{
}

void sub_10003A2E0()
{
}

void sub_10003A30C()
{
}

void sub_10003A338()
{
}

void sub_10003A364()
{
}

void sub_10003A3C8()
{
}

void sub_10003A42C()
{
}

void sub_10003A458()
{
}

void sub_10003A484()
{
}

void sub_10003A4B0()
{
}

void sub_10003A4DC()
{
}

void sub_10003A508()
{
}

void sub_10003A534()
{
}

void sub_10003A560()
{
}

void sub_10003A5CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A5FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A62C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A65C()
{
}

void sub_10003A6BC()
{
}

void sub_10003A71C()
{
}

void sub_10003A77C()
{
}

void sub_10003A7DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "LoggingManager - handleLogRetrievalRequest Invalid args",  v1,  2u);
}

void sub_10003A81C(uint8_t *a1, void *a2, void *a3, void *a4)
{
  __int16 v7 = a2;
  uint64_t v8 = (void *)[a3 path];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "LoggingManager - Ignoring %@", a1, 0xCu);
}

void sub_10003A89C(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = (void *)[a2 localizedDescription];
  __int16 v7 = [a3 path];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "logRetrievalComplete - Failed to enumerate. Error: %@, Path: %@",  (uint8_t *)&v8,  0x16u);
}

void sub_10003A96C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)[a2 name];
  sub_10001FC9C( (void *)&_mh_execute_header,  v5,  v6,  "Ignore peripheral %@ disconnection event",  v7,  v8,  v9,  v10,  2u);

  sub_10001711C();
}

void sub_10003A9F8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)[a2 name];
  sub_10001FC9C( (void *)&_mh_execute_header,  v5,  v6,  "Connection timed out for peripheral %@...",  v7,  v8,  v9,  v10,  2u);

  sub_10001711C();
}

void sub_10003AA84(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not tracking an Mfi peripheral", v1, 2u);
}

void sub_10003AAC4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Properties did change : %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10003AB38(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "data with size %ld read : %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10003ABBC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to remove pipe %@ as we weren't tracking it",  (uint8_t *)&v2,  0xCu);
}

void sub_10003AC30(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)[a2 pipe];
  __int16 v5 = (void *)[v4 output];
  uint64_t v6 = (void *)[v5 streamError];
  uint64_t v7 = (void *)[v6 localizedDescription];
  int v9 = 138412290;
  uint64_t v10 = v7;
  sub_1000190C0((void *)&_mh_execute_header, v3, v8, "Encountered stream error while sending data: %@", (uint8_t *)&v9);
}

void sub_10003AD0C(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = (void *)[a3 description];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to deserialize JSON message: %@",  a1,  0xCu);
}

void sub_10003AD8C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)[a2 pipe];
  int v6 = 138412290;
  uint64_t v7 = v4;
  sub_1000190C0( (void *)&_mh_execute_header,  v3,  v5,  "Received unexpected end of input stream on pipe %@",  (uint8_t *)&v6);
}

void sub_10003AE28(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  int v6 = (void *)[a2 name];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error discovering services on peripheral %@: %@",  (uint8_t *)&v7,  0x16u);
}

void sub_10003AEE8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = a2;
  uint64_t v5 = (void *)[v3 UUID];
  int v6 = (void *)[*(id *)(a1 + 40) name];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Service %@ has timed out on peripheral %@",  (uint8_t *)&v7,  0x16u);
}

void sub_10003AFB8()
{
}

void sub_10003AFE4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B048( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B0AC()
{
}

void sub_10003B0D8()
{
}

void sub_10003B104()
{
}

void sub_10003B130()
{
}

void sub_10003B15C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [a3 reportTypeToString:sub_100025CC0()];
  objc_claimAutoreleasedReturnValue(v6);
  sub_100025CCC();
  sub_100025CA8();
  sub_100025C84((void *)&_mh_execute_header, v7, v8, "Did set %@ report for ID #%u", v9, v10, v11, v12, v13);

  sub_100025C98();
}

void sub_10003B1F0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [a3 reportTypeToString:sub_100025CC0()];
  objc_claimAutoreleasedReturnValue(v6);
  sub_100025CCC();
  sub_100025CA8();
  sub_100025C84( (void *)&_mh_execute_header,  v7,  v8,  "Started notifications on %@ report for ID #%u",  v9,  v10,  v11,  v12,  v13);

  sub_100025C98();
}

void sub_10003B284()
{
}

void sub_10003B2B0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B314()
{
}

void sub_10003B340()
{
}

void sub_10003B36C(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not find %@ report characteristic for ID #%u",  buf,  0x12u);
}

void sub_10003B3D0()
{
}

void sub_10003B430()
{
}

void sub_10003B490()
{
}

void sub_10003B4F0()
{
}

void sub_10003B550(unsigned __int8 a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "kDoAPCodecAttributeIDAllocMethod - Read length (%u) exceeded data length (%u)",  v2, v3) = 1024;
  HIWORD(sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "kDoAPCodecAttributeIDAllocMethod - Read length (%u) exceeded data length (%u)",  v2, v3) = a1;
  sub_10000BA2C( (void *)&_mh_execute_header,  a2,  a3,  "kDoAPCodecAttributeIDBitrate - Read length (%u) exceeded data length (%u)",  67109376,  v3);
  sub_10000B9EC();
}

void sub_10003B5C8()
{
}

void sub_10003B628()
{
}

void sub_10003B688()
{
}

void sub_10003B6E8()
{
}

void sub_10003B748()
{
}

void sub_10003B7A8()
{
}

void sub_10003B808()
{
}

void sub_10003B868(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error creating DoAP device", buf, 2u);
}

void sub_10003B8A4(unsigned __int8 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "DoAP Number of stream client %u",  (uint8_t *)v2,  8u);
  sub_10000BA24();
}

void sub_10003B918()
{
}

void sub_10003B944()
{
}

void sub_10003B970()
{
}

void sub_10003B99C()
{
}

void sub_10003B9C8()
{
}

void sub_10003B9F4()
{
}

void sub_10003BA20(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  [a2 UUID];
  id v4 = [sub_10002A11C() uuidToString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10002A108( (void *)&_mh_execute_header,  v6,  v7,  "DoAP Started notifications on %@ characteristic",  v8,  v9,  v10,  v11,  2u);

  sub_100025C98();
}

void sub_10003BAC0(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100017128(a1);
  [a2 UUID];
  id v4 = [sub_10002A11C() uuidToString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "DoAP Missing CCCD for %@ chracteristic",  (uint8_t *)&v6,  0xCu);

  sub_100025C98();
}

void sub_10003BB70(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  [a2 UUID];
  id v4 = [sub_10002A11C() uuidToString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10002A108((void *)&_mh_execute_header, v6, v7, "DoAP Found CCCD for %@ chracteristic", v8, v9, v10, v11, 2u);

  sub_100025C98();
}

void sub_10003BC10()
{
}

void sub_10003BC48()
{
}

void sub_10003BCA8()
{
}

void sub_10003BD08(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 2);
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "DoAP Receive data, packet#[%d] payload length %d",  (uint8_t *)v4,  0xEu);
  sub_10000B9EC();
}

void sub_10003BD8C()
{
  LOWORD(sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "Read length (%u) exceeded data length (%u). Could not get value length.",  v2, v3) = 1024;
  HIWORD(sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "Read length (%u) exceeded data length (%u). Could not get value length.",  v2, v3) = v0;
  sub_10000BA2C( (void *)&_mh_execute_header,  v0,  v1,  "DoAP Received payload length(%d) is different to sent length(%d)",  v2,  v3);
  sub_10000B9EC();
}

void sub_10003BDF8()
{
}

void sub_10003BE58()
{
}

void sub_10003BE84(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = (void *)[a2 characteristic];
  uint64_t v7 = (void *)[v6 UUID];
  uint64_t v8 = (void *)[a2 value];
  int v9 = 134218498;
  uint64_t v10 = a3;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Responding with result %ld to request on characteristic %@: %@",  (uint8_t *)&v9,  0x20u);
}

void sub_10003BF74(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  uint64_t v4 = (void *)[a2 pendingUpdates];
  [v4 count];
  sub_10002B540((void *)&_mh_execute_header, v5, v6, "Queued update, %lu pending", v7, v8, v9, v10, 0);

  sub_10001711C();
}

void sub_10003C000(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_100017128(a1);
  uint64_t v6 = (void *)[a2 UUID];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  sub_10002B554((void *)&_mh_execute_header, v5, v7, "Updating value on characteristic %@: %@", (uint8_t *)&v8);
}

void sub_10003C0B0(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (os_log_s *)sub_100017128(a1);
  uint64_t v6 = (void *)[a2 central];
  uint64_t v7 = (void *)[a3 nameForCentral:v6];
  int v8 = (void *)[a2 characteristic];
  uint64_t v9 = (void *)[v8 UUID];
  int v11 = 138412546;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v9;
  sub_10002B554( (void *)&_mh_execute_header,  v5,  v10,  "Central %@ sent a read request on characteristic %@",  (uint8_t *)&v11);
}

void sub_10003C1A4(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  uint64_t v4 = (void *)[a2 pendingUpdates];
  [v4 count];
  sub_10002B540((void *)&_mh_execute_header, v5, v6, "Ready to send updates, %lu pending", v7, v8, v9, v10, 0);

  sub_10001711C();
}

void sub_10003C230( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C260( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C2C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C328( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C358( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C3BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C3EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Bluetooth is restricted", v1, 2u);
}

void sub_10003C42C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = (void *)[a2 UUID];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error publishing service %@: %@",  (uint8_t *)&v7,  0x16u);
}

void sub_10003C4E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C550( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C5B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "XPC client does not have the proper entitlement, cancelling",  v1,  2u);
}

void sub_10003C5F8()
{
}

void sub_10003C658()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "addAccessory failed! uarpAccessory:%@ uarpAssetID:%@",  v2,  0x16u);
  sub_10000B9EC();
}

void sub_10003C6D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C704()
{
}

void sub_10003C764()
{
}

void sub_10003C7C4()
{
}

void sub_10003C824(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  id v4 = [a2 UUIDString];
  sub_10002EE10(v4, v5);
  sub_100017110();
  sub_10002B540((void *)&_mh_execute_header, v6, v7, "addUARPTransportDict: adding UUID: %s", v8, v9, v10, v11, v12);

  sub_10001711C();
}

void sub_10003C8AC(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  id v4 = [a2 UUIDString];
  sub_10002EE10(v4, v5);
  sub_100017110();
  sub_10002B540( (void *)&_mh_execute_header,  v6,  v7,  "getAndRemoveFromUARPTransportDict: did not find anything for UUID: %s",  v8,  v9,  v10,  v11,  v12);

  sub_10001711C();
}

void sub_10003C934(void *a1, void *a2)
{
  id v3 = sub_100017128(a1);
  id v4 = [a2 UUIDString];
  sub_10002EE10(v4, v5);
  sub_100017110();
  sub_10002B540( (void *)&_mh_execute_header,  v6,  v7,  "getAndRemoveFromUARPTransportDict: got for UUID: %s",  v8,  v9,  v10,  v11,  v12);

  sub_10001711C();
}

void sub_10003C9BC(void *a1, void *a2, void *a3)
{
  id v5 = sub_100017128(a1);
  id v6 = [a2 UUIDString];
  [v6 UTF8String];
  [a3 length];
  sub_10002EDFC( (void *)&_mh_execute_header,  v7,  v8,  "relayAACPUARP - accessory UUID:%s msgLength:%lu",  v9,  v10,  v11,  v12,  2u);

  sub_100025C98();
}

void sub_10003CA6C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 length];
  sub_10002EDFC( (void *)&_mh_execute_header,  v5,  v6,  "sendMessageToAccessory - accessory:%@ msgLength:%lu",  v7,  v8,  v9,  v10,  2u);

  sub_100025C98();
}

void sub_10003CB00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CB30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CB60()
{
}

void sub_10003CB8C()
{
}

void sub_10003CBF0()
{
}

void sub_10003CC54()
{
}

void sub_10003CCB8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)[a2 error];
  sub_100017110();
  sub_1000190C0((void *)&_mh_execute_header, v3, v5, "DoAPSiri - activateSiri: SiriActivation failed: %@", v6);

  sub_10001711C();
}

void sub_10003CD4C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)[a2 error];
  sub_100017110();
  sub_1000190C0((void *)&_mh_execute_header, v3, v5, "DoAPSiri - SiriCancellation failed with error:%@", v6);

  sub_10001711C();
}

void sub_10003CDDC()
{
}

void sub_10003CE08()
{
}

void sub_10003CE6C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 state];
  sub_10000BA84();
  sub_100032040((void *)&_mh_execute_header, v3, v4, "DoAPSiri - Doap state %d mismatch for Button Event", v5);

  sub_10000B9EC();
}

void sub_10003CEF8()
{
}

void sub_10003CF5C()
{
}

void sub_10003CF88(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = 10LL;
  sub_1000190C0( (void *)&_mh_execute_header,  a1,  a3,  "DoAPSiri - Timed out after %lld seconds waiting to start Siri",  (uint8_t *)&v3);
  sub_10000B9EC();
}

void sub_10003CFF8(uint64_t a1, void *a2)
{
  sub_10000B9EC();
}

void sub_10003D074()
{
}

void sub_10003D0A0()
{
}

void sub_10003D0CC()
{
}

void sub_10003D0F8(uint64_t a1, void *a2)
{
  sub_10000B9EC();
}

void sub_10003D174(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Ignoring request to add ellipsis as there is insufficient space. bufferMaxLength = %lu",  (uint8_t *)&v2,  0xCu);
}

void sub_10003D1E8(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100017128(a1);
  uint64_t v4 = (void *)[a2 peripheral];
  uint64_t v5 = (void *)[v4 name];
  uint8_t v6 = (void *)[a2 versionCharacteristic];
  uint64_t v7 = (void *)[v6 value];
  int v9 = 138412546;
  uint64_t v10 = v5;
  sub_1000339B0();
  sub_1000339CC((void *)&_mh_execute_header, v3, v8, "Invalid version for peripheral %@: %@", (uint8_t *)&v9);

  sub_10003399C();
}

void sub_10003D2B8()
{
  id v3 = [(id)sub_1000339D8() peripheral];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 name];
  uint64_t v5 = (const __CFDictionary *)sub_1000339C0();
  sub_1000339FC(v5);
  sub_1000339B0();
  sub_10002EDFC( (void *)&_mh_execute_header,  v6,  v7,  "Issuing challenge for peripheral %@: %@",  v8,  v9,  v10,  v11,  2u);

  sub_10003399C();
}

void sub_10003D35C(void *a1)
{
  id v2 = [(id)sub_1000339E4() peripheral];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)[v3 name];
  sub_100017110();
  sub_10001FC9C((void *)&_mh_execute_header, v5, v6, "Certificate invalid for peripheral %@", v7, v8, v9, v10, v11);

  sub_100025C98();
}

void sub_10003D3F0()
{
  id v3 = [(id)sub_1000339D8() peripheral];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 name];
  uint64_t v5 = (const __CFDictionary *)sub_1000339C0();
  sub_1000339FC(v5);
  sub_1000339B0();
  sub_10002EDFC((void *)&_mh_execute_header, v6, v7, "Read certificate for peripheral %@: %@", v8, v9, v10, v11, 2u);

  sub_10003399C();
}

void sub_10003D494()
{
}

void sub_10003D4C0(void *a1)
{
  id v2 = [(id)sub_1000339E4() peripheral];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)[v3 name];
  sub_100017110();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Received notification that the response is ready for peripheral %@",  v5,  0xCu);

  sub_100025C98();
}

void sub_10003D564(void *a1)
{
  id v2 = [(id)sub_1000339E4() peripheral];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)[v3 name];
  sub_100017110();
  sub_10001FC9C( (void *)&_mh_execute_header,  v5,  v6,  "Challenge response invalid for peripheral %@",  v7,  v8,  v9,  v10,  v11);

  sub_100025C98();
}

void sub_10003D5F8()
{
  id v3 = [(id)sub_1000339D8() peripheral];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 name];
  uint64_t v5 = (const __CFDictionary *)sub_1000339C0();
  sub_1000339FC(v5);
  sub_1000339B0();
  sub_10002EDFC((void *)&_mh_execute_header, v6, v7, "Read response for peripheral %@: %@", v8, v9, v10, v11, 2u);

  sub_10003399C();
}

void sub_10003D69C(void *a1)
{
  id v2 = [(id)sub_1000339E4() peripheral];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)[v3 name];
  sub_100017110();
  sub_10001FC9C( (void *)&_mh_execute_header,  v5,  v6,  "Still no response notification, attempting a last ditch read on peripheral %@",  v7,  v8,  v9,  v10,  v11);

  sub_100025C98();
}

void sub_10003D730(void *a1, void *a2)
{
  uint64_t v4 = (os_log_s *)sub_100017128(a1);
  [a2 authStateString];
  id v5 = [(id)sub_1000339D8() peripheral];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)[v6 name];
  int v9 = 138412546;
  uint64_t v10 = v2;
  sub_1000339B0();
  sub_1000339CC( (void *)&_mh_execute_header,  v4,  v8,  "Authentication has timed out (%@) on peripheral %@",  (uint8_t *)&v9);

  sub_100025C98();
}

void sub_10003D7E8()
{
}

void sub_10003D814()
{
}

void sub_10003D840()
{
}

void sub_10003D86C()
{
  id v3 = [(id)sub_1000339D8() peripheral];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)[v4 name];
  sub_100017110();
  __int16 v8 = 2112;
  uint64_t v9 = v0;
  sub_1000339CC((void *)&_mh_execute_header, v1, v6, "Failed to read challenge response for peripheral %@: %@", v7);

  sub_100025C98();
}

void sub_10003D914(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Missing battery level characteristic",  v1,  2u);
}

void sub_10003D954(void *a1, void *a2, int a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = (void *)[a2 peripheral];
  uint64_t v7 = (void *)[v6 name];
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 1024;
  int v11 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to update the power source for peripheral %@: 0x%X",  (uint8_t *)&v8,  0x12u);
}

void sub_10003DA20(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "DoAP eventIndicator write value - Invalid event type(0x%02x)",  (uint8_t *)v2,  8u);
}

void sub_10003DA94(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "eventIndicator for SoundSensorClient not implemented yet",  v1,  2u);
}

void sub_10003DAD4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DB38( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DB9C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported UARP accessory!", v1, 2u);
}

void sub_10003DBDC(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "peripheral:didUpdateNotificationStateForCharacteristic: loggingSuperbinaryURL %@",  (uint8_t *)&v3,  0xCu);
  sub_10000B9EC();
}

void sub_10003DC50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_EventIndicatorCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 EventIndicatorCharacteristic];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:options:error:];
}

id objc_msgSend_L2CAPChannels(void *a1, const char *a2, ...)
{
  return _[a1 L2CAPChannels];
}

id objc_msgSend_SelectedCodecCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SelectedCodecCharacteristic];
}

id objc_msgSend_SendDataCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SendDataCharacteristic];
}

id objc_msgSend_StartStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 StartStreamingCharacteristic];
}

id objc_msgSend_StopStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 StopStreamingCharacteristic];
}

id objc_msgSend_SupportedCodecsCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SupportedCodecsCharacteristic];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8DataWithMaxLength_ellipsis_isTruncated_(void *a1, const char *a2, ...)
{
  return [a1 UTF8DataWithMaxLength:ellipsis:isTruncated:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return [a1 UUIDWithString:];
}

id objc_msgSend__createPacket_payloadOffset_payloadLength_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createPacket:payloadOffset:payloadLength:payload:");
}

id objc_msgSend__createUARPLogPath(void *a1, const char *a2, ...)
{
  return _[a1 _createUARPLogPath];
}

id objc_msgSend__extractHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractHeader:");
}

id objc_msgSend__extractPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPayload:");
}

id objc_msgSend__getUARPLogPath(void *a1, const char *a2, ...)
{
  return _[a1 _getUARPLogPath];
}

id objc_msgSend__packetizeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_packetizeData:");
}

id objc_msgSend__parseRecvdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseRecvdData:");
}

id objc_msgSend__prepareForFirmwareDownload(void *a1, const char *a2, ...)
{
  return _[a1 _prepareForFirmwareDownload];
}

id objc_msgSend_accessoryCategoryCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 accessoryCategoryCharacteristic];
}

id objc_msgSend_accessoryReachable_(void *a1, const char *a2, ...)
{
  return [a1 accessoryReachable:];
}

id objc_msgSend_accessoryUnreachable_(void *a1, const char *a2, ...)
{
  return [a1 accessoryUnreachable:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateHIDPolicy(void *a1, const char *a2, ...)
{
  return _[a1 activateHIDPolicy];
}

id objc_msgSend_activateSiri_(void *a1, const char *a2, ...)
{
  return [a1 activateSiri:];
}

id objc_msgSend_activeHIDDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 activeHIDDeviceCount];
}

id objc_msgSend_activeHIDDeviceCountDidChange_(void *a1, const char *a2, ...)
{
  return [a1 activeHIDDeviceCountDidChange:];
}

id objc_msgSend_addAccessory_assetID_(void *a1, const char *a2, ...)
{
  return [a1 addAccessory:assetID:];
}

id objc_msgSend_addCodec_(void *a1, const char *a2, ...)
{
  return [a1 addCodec:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:a2 selector:a3 name:a4 object:a5];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addPipe_(void *a1, const char *a2, ...)
{
  return [a1 addPipe:];
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return [a1 addService:];
}

id objc_msgSend_addUARPTransportDict_UARPAACPSupported_(void *a1, const char *a2, ...)
{
  return [a1 addUARPTransportDict:UARPAACPSupported:];
}

id objc_msgSend_allInputReportsReady(void *a1, const char *a2, ...)
{
  return _[a1 allInputReportsReady];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allocHIDQueue(void *a1, const char *a2, ...)
{
  return _[a1 allocHIDQueue];
}

id objc_msgSend_allocQueue(void *a1, const char *a2, ...)
{
  return _[a1 allocQueue];
}

id objc_msgSend_allowInRestrictedMode_(void *a1, const char *a2, ...)
{
  return [a1 allowInRestrictedMode:];
}

id objc_msgSend_amdNotification(void *a1, const char *a2, ...)
{
  return _[a1 amdNotification];
}

id objc_msgSend_analyzeConnectionError_peripheral_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeConnectionError:peripheral:info:");
}

id objc_msgSend_analyzeError_(void *a1, const char *a2, ...)
{
  return [a1 analyzeError:];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:length:];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appleMultitouchDeviceArrived_(void *a1, const char *a2, ...)
{
  return [a1 appleMultitouchDeviceArrived:];
}

id objc_msgSend_applicationIDIsSiri_(void *a1, const char *a2, ...)
{
  return [a1 applicationIDIsSiri:];
}

id objc_msgSend_applicationIDIsSoundSensor_(void *a1, const char *a2, ...)
{
  return [a1 applicationIDIsSoundSensor:];
}

id objc_msgSend_applyStagedFirmwareOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 applyStagedFirmwareOnAccessoryList:withUserIntent:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetSolicitationComplete(void *a1, const char *a2, ...)
{
  return _[a1 assetSolicitationComplete];
}

id objc_msgSend_audio(void *a1, const char *a2, ...)
{
  return _[a1 audio];
}

id objc_msgSend_audioBuffer(void *a1, const char *a2, ...)
{
  return _[a1 audioBuffer];
}

id objc_msgSend_authInProgress(void *a1, const char *a2, ...)
{
  return _[a1 authInProgress];
}

id objc_msgSend_authInfo(void *a1, const char *a2, ...)
{
  return _[a1 authInfo];
}

id objc_msgSend_authState(void *a1, const char *a2, ...)
{
  return _[a1 authState];
}

id objc_msgSend_authStateString(void *a1, const char *a2, ...)
{
  return _[a1 authStateString];
}

id objc_msgSend_authTimer(void *a1, const char *a2, ...)
{
  return _[a1 authTimer];
}

id objc_msgSend_authenticationDidFail(void *a1, const char *a2, ...)
{
  return _[a1 authenticationDidFail];
}

id objc_msgSend_authenticationDidSucceed(void *a1, const char *a2, ...)
{
  return _[a1 authenticationDidSucceed];
}

id objc_msgSend_batteryLevelCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelCharacteristic];
}

id objc_msgSend_batteryPowerStateCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 batteryPowerStateCharacteristic];
}

id objc_msgSend_batteryPowerStateString_(void *a1, const char *a2, ...)
{
  return [a1 batteryPowerStateString:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonData(void *a1, const char *a2, ...)
{
  return _[a1 buttonData];
}

id objc_msgSend_buttonInterestNotification(void *a1, const char *a2, ...)
{
  return _[a1 buttonInterestNotification];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_byteOrder(void *a1, const char *a2, ...)
{
  return _[a1 byteOrder];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedButtonsAndTimestamps(void *a1, const char *a2, ...)
{
  return _[a1 cachedButtonsAndTimestamps];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelPeripheralConnection_force_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnection:force:];
}

id objc_msgSend_cancelPeripheralConnection_options_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnection:options:];
}

id objc_msgSend_cancelSiri(void *a1, const char *a2, ...)
{
  return _[a1 cancelSiri];
}

id objc_msgSend_cancelStream(void *a1, const char *a2, ...)
{
  return _[a1 cancelStream];
}

id objc_msgSend_cattPeripheral(void *a1, const char *a2, ...)
{
  return _[a1 cattPeripheral];
}

id objc_msgSend_central(void *a1, const char *a2, ...)
{
  return _[a1 central];
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return _[a1 centralManager];
}

id objc_msgSend_centralManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 centralManagerStateString];
}

id objc_msgSend_centrals(void *a1, const char *a2, ...)
{
  return _[a1 centrals];
}

id objc_msgSend_certificate1Characteristic(void *a1, const char *a2, ...)
{
  return _[a1 certificate1Characteristic];
}

id objc_msgSend_certificate2Characteristic(void *a1, const char *a2, ...)
{
  return _[a1 certificate2Characteristic];
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 certificateSerialNumber];
}

id objc_msgSend_challengeResponseCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 challengeResponseCharacteristic];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return _[a1 characteristic];
}

id objc_msgSend_characteristicForReportID_reportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristicForReportID:reportType:");
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _[a1 characteristics];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_clearAppleMultitouchDeviceNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearAppleMultitouchDeviceNotification];
}

id objc_msgSend_clearButtonInterestNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearButtonInterestNotification];
}

id objc_msgSend_clearDeviceManagementNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearDeviceManagementNotification];
}

id objc_msgSend_clearEvent(void *a1, const char *a2, ...)
{
  return _[a1 clearEvent];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return _[a1 clearState];
}

id objc_msgSend_clientService_desiresConnectionParameters_(void *a1, const char *a2, ...)
{
  return [a1 clientService:desiresConnectionParameters:];
}

id objc_msgSend_clientServiceDidStart_(void *a1, const char *a2, ...)
{
  return [a1 clientServiceDidStart:];
}

id objc_msgSend_clientServiceForUUID_(void *a1, const char *a2, ...)
{
  return [a1 clientServiceForUUID:];
}

id objc_msgSend_clientServiceManagerMap(void *a1, const char *a2, ...)
{
  return _[a1 clientServiceManagerMap];
}

id objc_msgSend_clientServiceMap(void *a1, const char *a2, ...)
{
  return _[a1 clientServiceMap];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return _[a1 codec];
}

id objc_msgSend_codecList(void *a1, const char *a2, ...)
{
  return _[a1 codecList];
}

id objc_msgSend_codecs(void *a1, const char *a2, ...)
{
  return _[a1 codecs];
}

id objc_msgSend_commandCondition(void *a1, const char *a2, ...)
{
  return _[a1 commandCondition];
}

id objc_msgSend_commandError(void *a1, const char *a2, ...)
{
  return _[a1 commandError];
}

id objc_msgSend_commandPending(void *a1, const char *a2, ...)
{
  return _[a1 commandPending];
}

id objc_msgSend_commandValue(void *a1, const char *a2, ...)
{
  return _[a1 commandValue];
}

id objc_msgSend_connectAlways_(void *a1, const char *a2, ...)
{
  return [a1 connectAlways:];
}

id objc_msgSend_connectAlwaysIdentifiersMap(void *a1, const char *a2, ...)
{
  return _[a1 connectAlwaysIdentifiersMap];
}

id objc_msgSend_connectDevice_quickDisconnectEnabled_(void *a1, const char *a2, ...)
{
  return [a1 connectDevice:YES];
}

id objc_msgSend_connectOnce_(void *a1, const char *a2, ...)
{
  return [a1 connectOnce:];
}

id objc_msgSend_connectOnceIdentifiersMap(void *a1, const char *a2, ...)
{
  return _[a1 connectOnceIdentifiersMap];
}

id objc_msgSend_connectOnceNoTimeoutIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 connectOnceNoTimeoutIdentifiers];
}

id objc_msgSend_connectPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 connectPeripheral:];
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return [a1 connectPeripheral:options:];
}

id objc_msgSend_connectedStandbyToken(void *a1, const char *a2, ...)
{
  return _[a1 connectedStandbyToken];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionAssertion(void *a1, const char *a2, ...)
{
  return _[a1 connectionAssertion];
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return _[a1 connectionUUID];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createConnectionWithType_andIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 createConnectionWithType:andIdentifier:];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDoAPDevice(void *a1, const char *a2, ...)
{
  return _[a1 createDoAPDevice];
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_createHIDDeviceIfEverythingReady(void *a1, const char *a2, ...)
{
  return _[a1 createHIDDeviceIfEverythingReady];
}

id objc_msgSend_createReportInfo_(void *a1, const char *a2, ...)
{
  return [a1 createReportInfo:];
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _[a1 createServices];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return _[a1 dataValue];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:length:freeWhenDone:];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_deactivateHIDPolicy(void *a1, const char *a2, ...)
{
  return _[a1 deactivateHIDPolicy];
}

id objc_msgSend_decOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _[a1 decOpportunisticConnection];
}

id objc_msgSend_decomposeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 decomposeToURL:error:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_demultiplexInputReport_reportLength_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "demultiplexInputReport:reportLength:reportID:");
}

id objc_msgSend_denylistedIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 denylistedIdentifiers];
}

id objc_msgSend_deregisterForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _[a1 deregisterForPowerManagementEvents];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return _[a1 descriptors];
}

id objc_msgSend_desiredConnectionParameters(void *a1, const char *a2, ...)
{
  return _[a1 desiredConnectionParameters];
}

id objc_msgSend_destroyConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 destroyConnectionWithUUID:];
}

id objc_msgSend_destroyDoAPDevice(void *a1, const char *a2, ...)
{
  return _[a1 destroyDoAPDevice];
}

id objc_msgSend_destroyHIDDevice(void *a1, const char *a2, ...)
{
  return _[a1 destroyHIDDevice];
}

id objc_msgSend_destroyServices(void *a1, const char *a2, ...)
{
  return _[a1 destroyServices];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceManagement(void *a1, const char *a2, ...)
{
  return _[a1 deviceManagement];
}

id objc_msgSend_deviceManagementEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 deviceManagementEndpoint];
}

id objc_msgSend_deviceMgtDriverArrived_(void *a1, const char *a2, ...)
{
  return [a1 deviceMgtDriverArrived:];
}

id objc_msgSend_deviceMgtNotification(void *a1, const char *a2, ...)
{
  return _[a1 deviceMgtNotification];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return [a1 disconnectDevice:];
}

id objc_msgSend_disconnectPeripheral_force_(void *a1, const char *a2, ...)
{
  return [a1 disconnectPeripheral:force:];
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverDescriptorsForCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 discoverDescriptorsForCharacteristic:];
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return [a1 discoverServices:nil];
}

id objc_msgSend_doapAudioDidStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioDidStop:");
}

id objc_msgSend_doapAudioRelay(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioRelay];
}

id objc_msgSend_doapAudioRelays(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioRelays];
}

id objc_msgSend_doapAudioStart(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioStart];
}

id objc_msgSend_doapAudioStop(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioStop];
}

id objc_msgSend_doapAudioWillStart_(void *a1, const char *a2, ...)
{
  return [a1 doapAudioWillStart:];
}

id objc_msgSend_doapDeviceDidStart(void *a1, const char *a2, ...)
{
  return _[a1 doapDeviceDidStart];
}

id objc_msgSend_doapDeviceDidStop(void *a1, const char *a2, ...)
{
  return _[a1 doapDeviceDidStop];
}

id objc_msgSend_doapDeviceWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return [a1 doapDeviceWithCodecs:streamID:];
}

id objc_msgSend_doapDevices(void *a1, const char *a2, ...)
{
  return _[a1 doapDevices];
}

id objc_msgSend_doapStateNameFor_(void *a1, const char *a2, ...)
{
  return [a1 doapStateNameFor:];
}

id objc_msgSend_doapStateSet_(void *a1, const char *a2, ...)
{
  return [a1 doapStateSet:];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_downloadAvailableFirmwareUpdate_assetID_withUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 downloadAvailableFirmwareUpdate:assetID:withUserIntent:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_endpointForPipe_(void *a1, const char *a2, ...)
{
  return [a1 endpointForPipe:];
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return _[a1 endpointUUID];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_eventIndicator_(void *a1, const char *a2, ...)
{
  return [a1 eventIndicator:];
}

id objc_msgSend_eventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return [a1 eventIndicator:eventValue:];
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return _[a1 eventQueue];
}

id objc_msgSend_extractBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 extractBatteryLevel];
}

id objc_msgSend_extractBatteryPowerState(void *a1, const char *a2, ...)
{
  return _[a1 extractBatteryPowerState];
}

id objc_msgSend_extractButtonDataFromReport_buttonIndex_(void *a1, const char *a2, ...)
{
  return [a1 extractButtonDataFromReport:buttonIndex:];
}

id objc_msgSend_extractIDs(void *a1, const char *a2, ...)
{
  return _[a1 extractIDs];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 firmwareRevision];
}

id objc_msgSend_firstButton(void *a1, const char *a2, ...)
{
  return _[a1 firstButton];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 fwRevisionCharacteristic];
}

id objc_msgSend_getAndRemoveFromUARPTransportDict_(void *a1, const char *a2, ...)
{
  return [a1 getAndRemoveFromUARPTransportDict:];
}

id objc_msgSend_getAudioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getAudioHIDReportDescriptor];
}

id objc_msgSend_getButtonsHIDReportDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 getButtonsHIDReportDescriptor:];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:length:];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:maxLength:usedLength:encoding:options:range:remainingRange:];
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:range:];
}

id objc_msgSend_getDeviceManagementHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getDeviceManagementHIDReportDescriptor];
}

id objc_msgSend_getInertialHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getInertialHIDReportDescriptor];
}

id objc_msgSend_getInfraredHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getInfraredHIDReportDescriptor];
}

id objc_msgSend_getProximityHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getProximityHIDReportDescriptor];
}

id objc_msgSend_getRadioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getRadioHIDReportDescriptor];
}

id objc_msgSend_getReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:");
}

id objc_msgSend_getReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 getReportData:reportID:reportType:error:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_getTouchHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getTouchHIDReportDescriptor];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_gotDeviceExtendedInfoReport(void *a1, const char *a2, ...)
{
  return _[a1 gotDeviceExtendedInfoReport];
}

id objc_msgSend_groupDeviceManagement(void *a1, const char *a2, ...)
{
  return _[a1 groupDeviceManagement];
}

id objc_msgSend_groupInertial(void *a1, const char *a2, ...)
{
  return _[a1 groupInertial];
}

id objc_msgSend_groupInit(void *a1, const char *a2, ...)
{
  return _[a1 groupInit];
}

id objc_msgSend_groupProximity(void *a1, const char *a2, ...)
{
  return _[a1 groupProximity];
}

id objc_msgSend_groupStart(void *a1, const char *a2, ...)
{
  return _[a1 groupStart];
}

id objc_msgSend_groupTouch(void *a1, const char *a2, ...)
{
  return _[a1 groupTouch];
}

id objc_msgSend_handleAudioData_(void *a1, const char *a2, ...)
{
  return [a1 handleAudioData:];
}

id objc_msgSend_handleAudioData_dataLength_(void *a1, const char *a2, ...)
{
  return [a1 handleAudioData:dataLength:];
}

id objc_msgSend_handleButtonData(void *a1, const char *a2, ...)
{
  return _[a1 handleButtonData];
}

id objc_msgSend_handleCheckInMsg_applicationID_(void *a1, const char *a2, ...)
{
  return [a1 handleCheckInMsg:applicationID:];
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return [a1 handleConnection:];
}

id objc_msgSend_handleDeviceManagementData_dataLength_(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceManagementData:dataLength:];
}

id objc_msgSend_handleDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleDisconnection];
}

id objc_msgSend_handleDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 handleDisconnection:];
}

id objc_msgSend_handleEventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return [a1 handleEventIndicator:eventValue:];
}

id objc_msgSend_handleInertialData(void *a1, const char *a2, ...)
{
  return _[a1 handleInertialData];
}

id objc_msgSend_handleInputData_targetDevice_(void *a1, const char *a2, ...)
{
  return [a1 handleInputData:targetDevice:];
}

id objc_msgSend_handleInputReportData_reportID_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReportData:reportID:timestamp:");
}

id objc_msgSend_handleInputReportDataV1_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReportDataV1:reportID:");
}

id objc_msgSend_handleInputReportDataV2_reportID_(void *a1, const char *a2, ...)
{
  return [a1 handleInputReportDataV2:reportID:];
}

id objc_msgSend_handleLogRetrievalRequest_(void *a1, const char *a2, ...)
{
  return [a1 handleLogRetrievalRequest:];
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return [a1 handleMsg:];
}

id objc_msgSend_handlePowerManagementNotification_notificationID_(void *a1, const char *a2, ...)
{
  return [a1 handlePowerManagementNotification:notificationID:];
}

id objc_msgSend_handleProximityData(void *a1, const char *a2, ...)
{
  return _[a1 handleProximityData];
}

id objc_msgSend_handleResetStream(void *a1, const char *a2, ...)
{
  return _[a1 handleResetStream];
}

id objc_msgSend_handleStartStream(void *a1, const char *a2, ...)
{
  return _[a1 handleStartStream];
}

id objc_msgSend_handleStartStreaming(void *a1, const char *a2, ...)
{
  return _[a1 handleStartStreaming];
}

id objc_msgSend_handleStopStream(void *a1, const char *a2, ...)
{
  return _[a1 handleStopStream];
}

id objc_msgSend_handleStopStreaming_(void *a1, const char *a2, ...)
{
  return [a1 handleStopStreaming:];
}

id objc_msgSend_handleTouchData(void *a1, const char *a2, ...)
{
  return _[a1 handleTouchData];
}

id objc_msgSend_handleXpcDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 handleXpcDisconnection:];
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 hardwareRevision];
}

id objc_msgSend_hasIDs(void *a1, const char *a2, ...)
{
  return _[a1 hasIDs];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasTag_(void *a1, const char *a2, ...)
{
  return [a1 hasTag:];
}

id objc_msgSend_hidControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hidControlPointCharacteristic];
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return _[a1 hidDevice];
}

id objc_msgSend_hidDeviceDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDesiredConnectionParametersDidChange];
}

id objc_msgSend_hidDeviceDidStart(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDidStart];
}

id objc_msgSend_hidDeviceDidStop(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDidStop];
}

id objc_msgSend_hidDeviceProperties(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceProperties];
}

id objc_msgSend_hidDeviceWithProperties_reports_(void *a1, const char *a2, ...)
{
  return [a1 hidDeviceWithProperties:reports:];
}

id objc_msgSend_hidInformationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hidInformationCharacteristic];
}

id objc_msgSend_hidProperties(void *a1, const char *a2, ...)
{
  return _[a1 hidProperties];
}

id objc_msgSend_hub(void *a1, const char *a2, ...)
{
  return _[a1 hub];
}

id objc_msgSend_hwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hwRevisionCharacteristic];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 identifierForConnectionWithUUID:];
}

id objc_msgSend_incOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _[a1 incOpportunisticConnection];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_inertial(void *a1, const char *a2, ...)
{
  return _[a1 inertial];
}

id objc_msgSend_inertialData(void *a1, const char *a2, ...)
{
  return _[a1 inertialData];
}

id objc_msgSend_infrared(void *a1, const char *a2, ...)
{
  return _[a1 infrared];
}

id objc_msgSend_initWithByteOrder_(void *a1, const char *a2, ...)
{
  return [a1 initWithByteOrder:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:encoding:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return [a1 initWithCodecs:streamID:];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:encoding:];
}

id objc_msgSend_initWithDelegate_pipe_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:nil pipe:nil];
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:nil queue:nil];
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:nil queue:nil options:nil];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithHardwareID_uuid_(void *a1, const char *a2, ...)
{
  return [a1 initWithHardwareID:uuid];
}

id objc_msgSend_initWithID_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:];
}

id objc_msgSend_initWithID_type_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:type:];
}

id objc_msgSend_initWithIdentifier_deviceType_properties_codecType_hub_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:deviceType:properties:codecType:hub:];
}

id objc_msgSend_initWithLocationType_remoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocationType:remoteURL:];
}

id objc_msgSend_initWithManager_peripheral_service_(void *a1, const char *a2, ...)
{
  return [a1 initWithManager:peripheral:service:];
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:options:queue:delegate:];
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:nil count:0];
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:count:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 initWithPeripheral:];
}

id objc_msgSend_initWithProperties_reports_(void *a1, const char *a2, ...)
{
  return [a1 initWithProperties:reports:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithValue_byteOrder_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:byteOrder:];
}

id objc_msgSend_initWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:a2 characteristic:a3 centrals:a4];
}

id objc_msgSend_initWithVendorIDSource_vendorID_productID_productVersion_(void *a1, const char *a2, ...)
{
  return [a1 initWithVendorIDSource:vendorID:productID:productVersion:];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_inputReportTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 inputReportTimestamp];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return _[a1 inputStream];
}

id objc_msgSend_inputStreamWithData_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithData:];
}

id objc_msgSend_inputStreamWithData_byteOrder_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithData:byteOrder:];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return _[a1 instanceID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAccessoryCategoryPencil_(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryCategoryPencil:];
}

id objc_msgSend_isAlwaysConnecting_(void *a1, const char *a2, ...)
{
  return [a1 isAlwaysConnecting:];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEventIndicatorNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEventIndicatorNotificationEnabled];
}

id objc_msgSend_isHubConnected(void *a1, const char *a2, ...)
{
  return _[a1 isHubConnected];
}

id objc_msgSend_isLinkEncrypted(void *a1, const char *a2, ...)
{
  return _[a1 isLinkEncrypted];
}

id objc_msgSend_isNotifying(void *a1, const char *a2, ...)
{
  return _[a1 isNotifying];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _[a1 isPrimary];
}

id objc_msgSend_isSendDataNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSendDataNotificationEnabled];
}

id objc_msgSend_isSendingData(void *a1, const char *a2, ...)
{
  return _[a1 isSendingData];
}

id objc_msgSend_isStartStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isStartStreamingNotificationEnabled];
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return _[a1 isStarted];
}

id objc_msgSend_isStopStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isStopStreamingNotificationEnabled];
}

id objc_msgSend_isSupportingService_(void *a1, const char *a2, ...)
{
  return [a1 isSupportingService:];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isXpcConnectedForDeviceType_(void *a1, const char *a2, ...)
{
  return [a1 isXpcConnectedForDeviceType:];
}

id objc_msgSend_issueChallenge(void *a1, const char *a2, ...)
{
  return _[a1 issueChallenge];
}

id objc_msgSend_lastAudioDate(void *a1, const char *a2, ...)
{
  return _[a1 lastAudioDate];
}

id objc_msgSend_latency(void *a1, const char *a2, ...)
{
  return _[a1 latency];
}

id objc_msgSend_launchServer(void *a1, const char *a2, ...)
{
  return _[a1 launchServer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logBlock_(void *a1, const char *a2, ...)
{
  return [a1 logBlock:];
}

id objc_msgSend_logHwFwVersions(void *a1, const char *a2, ...)
{
  return _[a1 logHwFwVersions];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerName];
}

id objc_msgSend_manufacturerNameCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerNameCharacteristic];
}

id objc_msgSend_matchInstanceIDInHidEventDriver_(void *a1, const char *a2, ...)
{
  return [a1 matchInstanceIDInHidEventDriver:];
}

id objc_msgSend_maxCELength(void *a1, const char *a2, ...)
{
  return _[a1 maxCELength];
}

id objc_msgSend_maxDeferment(void *a1, const char *a2, ...)
{
  return _[a1 maxDeferment];
}

id objc_msgSend_maxInterval(void *a1, const char *a2, ...)
{
  return _[a1 maxInterval];
}

id objc_msgSend_maxPayloadSize(void *a1, const char *a2, ...)
{
  return _[a1 maxPayloadSize];
}

id objc_msgSend_maxPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 maxPeripheralLatency];
}

id objc_msgSend_maximumWriteValueLengthForType_(void *a1, const char *a2, ...)
{
  return [a1 maximumWriteValueLengthForType:];
}

id objc_msgSend_mfiAuthChannel(void *a1, const char *a2, ...)
{
  return _[a1 mfiAuthChannel];
}

id objc_msgSend_mfiPeripheral(void *a1, const char *a2, ...)
{
  return _[a1 mfiPeripheral];
}

id objc_msgSend_minCELength(void *a1, const char *a2, ...)
{
  return _[a1 minCELength];
}

id objc_msgSend_minInterval(void *a1, const char *a2, ...)
{
  return _[a1 minInterval];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _[a1 modelNumber];
}

id objc_msgSend_modelNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 modelNumberCharacteristic];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_msgIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 msgIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForCentral_(void *a1, const char *a2, ...)
{
  return [a1 nameForCentral:];
}

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return _[a1 notificationPort];
}

id objc_msgSend_notifyDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyDesiredConnectionParametersDidChange];
}

id objc_msgSend_notifyDidStart(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStart];
}

id objc_msgSend_notifyDidStartIfEverythingReady(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStartIfEverythingReady];
}

id objc_msgSend_notifyDidStop(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStop];
}

id objc_msgSend_notifyListeners_(void *a1, const char *a2, ...)
{
  return [a1 notifyListeners:];
}

id objc_msgSend_notifyPrimaryBudSide_device_(void *a1, const char *a2, ...)
{
  return [a1 notifyPrimaryBudSide:device:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:YES];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openL2CAPChannel_(void *a1, const char *a2, ...)
{
  return [a1 openL2CAPChannel:];
}

id objc_msgSend_opportunisticRefCount(void *a1, const char *a2, ...)
{
  return _[a1 opportunisticRefCount];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return _[a1 output];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return _[a1 outputStream];
}

id objc_msgSend_parseTLVCodecList_dataLength_streamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseTLVCodecList:dataLength:streamID:");
}

id objc_msgSend_parseTLVCodecValue_dataLength_codecStruct_(void *a1, const char *a2, ...)
{
  return [a1 parseTLVCodecValue:dataLength:codecStruct:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathIDs(void *a1, const char *a2, ...)
{
  return _[a1 pathIDs];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_pendingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pendingUpdates];
}

id objc_msgSend_performMFiAuth_(void *a1, const char *a2, ...)
{
  return [a1 performMFiAuth:];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _[a1 peripheral];
}

id objc_msgSend_peripheral_didDiscoverCharacteristicsForService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverCharacteristicsForService:error:");
}

id objc_msgSend_peripheral_didDiscoverDescriptorsForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverDescriptorsForCharacteristic:error:");
}

id objc_msgSend_peripheral_didDiscoverServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverServices:");
}

id objc_msgSend_peripheral_didModifyServices_(void *a1, const char *a2, ...)
{
  return [a1 peripheral:didModifyServices:];
}

id objc_msgSend_peripheral_didUpdateNotificationStateForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateNotificationStateForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateValueForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateValueForDescriptor:error:");
}

id objc_msgSend_peripheral_didWriteValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didWriteValueForCharacteristic:error:");
}

id objc_msgSend_peripheralForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 peripheralForIdentifier:];
}

id objc_msgSend_peripheralManager(void *a1, const char *a2, ...)
{
  return _[a1 peripheralManager];
}

id objc_msgSend_peripheralManager_central_didSubscribeToCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didSubscribeToCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUnsubscribeFromCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didUnsubscribeFromCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUpdateANCSAuthorization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didUpdateANCSAuthorization:");
}

id objc_msgSend_peripheralManager_didAddService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didAddService:error:");
}

id objc_msgSend_peripheralManager_didReceiveReadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didReceiveReadRequest:");
}

id objc_msgSend_peripheralManager_didReceiveWriteRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didReceiveWriteRequests:");
}

id objc_msgSend_peripheralManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 peripheralManagerStateString];
}

id objc_msgSend_peripherals(void *a1, const char *a2, ...)
{
  return _[a1 peripherals];
}

id objc_msgSend_persistanceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 persistanceAssertion];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return _[a1 pipe];
}

id objc_msgSend_pipe_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return [a1 pipe:didReceiveMessage:];
}

id objc_msgSend_pipeManager(void *a1, const char *a2, ...)
{
  return _[a1 pipeManager];
}

id objc_msgSend_pipes(void *a1, const char *a2, ...)
{
  return _[a1 pipes];
}

id objc_msgSend_pmIsSuspended(void *a1, const char *a2, ...)
{
  return _[a1 pmIsSuspended];
}

id objc_msgSend_pmNotificationPort(void *a1, const char *a2, ...)
{
  return _[a1 pmNotificationPort];
}

id objc_msgSend_pmService(void *a1, const char *a2, ...)
{
  return _[a1 pmService];
}

id objc_msgSend_pnpIDCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 pnpIDCharacteristic];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:nil object:nil];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_powerSourceDetails(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceDetails];
}

id objc_msgSend_powerSourceID(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceID];
}

id objc_msgSend_preferredInterval(void *a1, const char *a2, ...)
{
  return _[a1 preferredInterval];
}

id objc_msgSend_preferredPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 preferredPeripheralLatency];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_processIncomingData_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 processIncomingData:forEndpointWithUUID:];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_properties_locationIdOffset_hidDescriptor_extendedData_(void *a1, const char *a2, ...)
{
  return [a1 properties:locationIdOffset:hidDescriptor:extendedData:];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 propertyForKey:];
}

id objc_msgSend_proximity(void *a1, const char *a2, ...)
{
  return _[a1 proximity];
}

id objc_msgSend_proximityData(void *a1, const char *a2, ...)
{
  return _[a1 proximityData];
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return _[a1 publish];
}

id objc_msgSend_queryCompleteForAccessory_hwFusingType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryCompleteForAccessory:hwFusingType:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_radio(void *a1, const char *a2, ...)
{
  return _[a1 radio];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_read_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 read:maxLength:];
}

id objc_msgSend_readReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 readReportData:reportID:reportType:error:];
}

id objc_msgSend_readUint16_(void *a1, const char *a2, ...)
{
  return [a1 readUint16:];
}

id objc_msgSend_readUint8_(void *a1, const char *a2, ...)
{
  return [a1 readUint8:];
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 readValueForCharacteristic:];
}

id objc_msgSend_readValueForDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 readValueForDescriptor:];
}

id objc_msgSend_receiveMessage_length_(void *a1, const char *a2, ...)
{
  return [a1 receiveMessage:length:];
}

id objc_msgSend_receivedMessage(void *a1, const char *a2, ...)
{
  return _[a1 receivedMessage];
}

id objc_msgSend_recvDataFromAccessory_data_error_(void *a1, const char *a2, ...)
{
  return [a1 recvDataFromAccessory:data:error:];
}

id objc_msgSend_recvDataMessage(void *a1, const char *a2, ...)
{
  return _[a1 recvDataMessage];
}

id objc_msgSend_recvDataOverAACP_(void *a1, const char *a2, ...)
{
  return [a1 recvDataOverAACP:];
}

id objc_msgSend_refreshConnectionAssertion(void *a1, const char *a2, ...)
{
  return _[a1 refreshConnectionAssertion];
}

id objc_msgSend_refreshPeripherals(void *a1, const char *a2, ...)
{
  return _[a1 refreshPeripherals];
}

id objc_msgSend_refreshPersistanceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 refreshPersistanceAssertion];
}

id objc_msgSend_registerEndpoint_type_priority_(void *a1, const char *a2, ...)
{
  return [a1 registerEndpoint:type:priority:];
}

id objc_msgSend_registerForConnectionEventsWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 registerForConnectionEventsWithOptions:];
}

id objc_msgSend_registerForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _[a1 registerForPowerManagementEvents];
}

id objc_msgSend_registerServices(void *a1, const char *a2, ...)
{
  return _[a1 registerServices];
}

id objc_msgSend_registerUARPService_withUARPAccessory_withUARPAssetID_(void *a1, const char *a2, ...)
{
  return [a1 registerUARPService:withUARPAccessory:withUARPAssetID:];
}

id objc_msgSend_relayAACPUARP_uarpMsg_error_(void *a1, const char *a2, ...)
{
  return [a1 relayAACPUARP:uarpMsg:error:];
}

id objc_msgSend_relayForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 relayForIdentifier:];
}

id objc_msgSend_relayWithIdentifier_deviceType_properties_codecType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayWithIdentifier:deviceType:properties:codecType:");
}

id objc_msgSend_removeAccessory_(void *a1, const char *a2, ...)
{
  return [a1 removeAccessory:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 removeFromRunLoop:nil forMode:NSDefaultRunLoopMode];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return [a1 removeOpportunisticConnection:];
}

id objc_msgSend_removePipe_(void *a1, const char *a2, ...)
{
  return [a1 removePipe:];
}

id objc_msgSend_removeService_(void *a1, const char *a2, ...)
{
  return [a1 removeService:];
}

id objc_msgSend_reportMapCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 reportMapCharacteristic];
}

id objc_msgSend_reportTypeToString_(void *a1, const char *a2, ...)
{
  return [a1 reportTypeToString:];
}

id objc_msgSend_reportsHaveMultipleReportIDs_(void *a1, const char *a2, ...)
{
  return [a1 reportsHaveMultipleReportIDs:];
}

id objc_msgSend_requestLeaEasyPair_deviceIdentifier_deviceTags_(void *a1, const char *a2, ...)
{
  return [a1 requestLeaEasyPair:deviceIdentifier:deviceTags:];
}

id objc_msgSend_requestLeaStoreBondingInfo_rand_ltk_irk_name_device_(void *a1, const char *a2, ...)
{
  return [a1 requestLeaStoreBondingInfo:rand:ltk:irk:name:device:];
}

id objc_msgSend_requestPairStateForDevice_(void *a1, const char *a2, ...)
{
  return [a1 requestPairStateForDevice:];
}

id objc_msgSend_requestStoreLinkKey_name_device_(void *a1, const char *a2, ...)
{
  return [a1 requestStoreLinkKey:name:device:];
}

id objc_msgSend_requestStoreLinkKeyExtended_name_device_deviceServiceMask_classOfDevice_(void *a1, const char *a2, ...)
{
  return [a1 requestStoreLinkKeyExtended:name:device:deviceServiceMask:classOfDevice:];
}

id objc_msgSend_requestVersionInfo_cloudAccount_(void *a1, const char *a2, ...)
{
  return [a1 requestVersionInfo:nil cloudAccount:nil];
}

id objc_msgSend_requestedUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 requestedUUIDs];
}

id objc_msgSend_requireServicesAndMFi_(void *a1, const char *a2, ...)
{
  return [a1 requireServicesAndMFi:YES];
}

id objc_msgSend_respondToLeaEasyPair_device_(void *a1, const char *a2, ...)
{
  return [a1 respondToLeaEasyPair:device:];
}

id objc_msgSend_respondToLeaStoreBondingInfo_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToLeaStoreBondingInfo:device:");
}

id objc_msgSend_respondToPairState_device_(void *a1, const char *a2, ...)
{
  return [a1 respondToPairState:device:];
}

id objc_msgSend_respondToRequest_withResult_(void *a1, const char *a2, ...)
{
  return [a1 respondToRequest:withResult:];
}

id objc_msgSend_respondToStoreLinkKey_device_(void *a1, const char *a2, ...)
{
  return [a1 respondToStoreLinkKey:device:];
}

id objc_msgSend_respondVersionInfo_cloudAccount_easyPairingStatus_(void *a1, const char *a2, ...)
{
  return [a1 respondVersionInfo:cloudAccount:easyPairingStatus:];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_(void *a1, const char *a2, ...)
{
  return [a1 retrieveConnectedPeripheralsWithServices:];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return [a1 retrieveConnectedPeripheralsWithServices:allowAll:];
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _[a1 retrievePairedPeers];
}

id objc_msgSend_retrievePairingInfoForPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 retrievePairingInfoForPeripheral:];
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 retrievePeripheralsWithIdentifiers:];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_scalablePipeManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 scalablePipeManagerStateString];
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 scheduleInRunLoop:forMode:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:0 target:nil selector:nil userInfo:nil repeats:NO];
}

id objc_msgSend_selectCodec_(void *a1, const char *a2, ...)
{
  return [a1 selectCodec:];
}

id objc_msgSend_sendAudioFrame_(void *a1, const char *a2, ...)
{
  return [a1 sendAudioFrame:];
}

id objc_msgSend_sendButtonDataToUserDevice_withTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 sendButtonDataToUserDevice:withTimestamp:];
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return [a1 sendData:];
}

id objc_msgSend_sendDevMgmtPipeConnectedMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendDevMgmtPipeConnectedMsg];
}

id objc_msgSend_sendDevMgmtPipeDisconnectedMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendDevMgmtPipeDisconnectedMsg:];
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return [a1 sendMsg:args:];
}

id objc_msgSend_sendMsgIfCheckedIn_args_forClient_(void *a1, const char *a2, ...)
{
  return [a1 sendMsgIfCheckedIn:args:forClient:];
}

id objc_msgSend_sendNextQueuedMessage(void *a1, const char *a2, ...)
{
  return _[a1 sendNextQueuedMessage];
}

id objc_msgSend_sendSetConnectionParametersMsg_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 sendSetConnectionParametersMsg:forPeer:];
}

id objc_msgSend_sentHostReadyReport(void *a1, const char *a2, ...)
{
  return _[a1 sentHostReadyReport];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serialNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberCharacteristic];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _[a1 serverConnection];
}

id objc_msgSend_serverServiceMap(void *a1, const char *a2, ...)
{
  return _[a1 serverServiceMap];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryCategoryCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryCategoryCharacteristic:];
}

id objc_msgSend_setActiveHIDDeviceCount_(void *a1, const char *a2, ...)
{
  return [a1 setActiveHIDDeviceCount:];
}

id objc_msgSend_setAudio_(void *a1, const char *a2, ...)
{
  return [a1 setAudio:];
}

id objc_msgSend_setAudioBuffer_(void *a1, const char *a2, ...)
{
  return [a1 setAudioBuffer:];
}

id objc_msgSend_setAuthInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setAuthInProgress:YES];
}

id objc_msgSend_setAuthState_(void *a1, const char *a2, ...)
{
  return [a1 setAuthState:];
}

id objc_msgSend_setAuthTimer_(void *a1, const char *a2, ...)
{
  return [a1 setAuthTimer:];
}

id objc_msgSend_setAutoDownloadAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setAutoDownloadAllowed:YES];
}

id objc_msgSend_setBatteryLevelCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryLevelCharacteristic:];
}

id objc_msgSend_setBatteryPowerStateCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryPowerStateCharacteristic:];
}

id objc_msgSend_setButtonData_(void *a1, const char *a2, ...)
{
  return [a1 setButtonData:];
}

id objc_msgSend_setButtons_(void *a1, const char *a2, ...)
{
  return [a1 setButtons:];
}

id objc_msgSend_setCachedButtonsAndTimestamps_(void *a1, const char *a2, ...)
{
  return [a1 setCachedButtonsAndTimestamps:];
}

id objc_msgSend_setCertificate1Characteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCertificate1Characteristic:];
}

id objc_msgSend_setCertificate2Characteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificate2Characteristic:");
}

id objc_msgSend_setChallengeResponseCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setChallengeResponseCharacteristic:];
}

id objc_msgSend_setCodec_(void *a1, const char *a2, ...)
{
  return [a1 setCodec:];
}

id objc_msgSend_setCommandError_(void *a1, const char *a2, ...)
{
  return [a1 setCommandError:];
}

id objc_msgSend_setCommandPending_(void *a1, const char *a2, ...)
{
  return [a1 setCommandPending:];
}

id objc_msgSend_setCommandValue_(void *a1, const char *a2, ...)
{
  return [a1 setCommandValue:];
}

id objc_msgSend_setConnectAlwaysIdentifiersMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectAlwaysIdentifiersMap:");
}

id objc_msgSend_setConnectionAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionAssertion:];
}

id objc_msgSend_setConnectionAuthenticated_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionAuthenticated:state:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionUUID:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDenylistedIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDenylistedIdentifiers:");
}

id objc_msgSend_setDesiredConnectionLatency_forPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredConnectionLatency:forPeripheral:];
}

id objc_msgSend_setDeviceManagement_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManagement:];
}

id objc_msgSend_setDeviceManagementEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManagementEndpoint:];
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceMatching:];
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceNotificationHandler:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDoapAudioRelay_(void *a1, const char *a2, ...)
{
  return [a1 setDoapAudioRelay:];
}

id objc_msgSend_setDoapAudioStop_(void *a1, const char *a2, ...)
{
  return [a1 setDoapAudioStop:];
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return [a1 setEndpointUUID:];
}

id objc_msgSend_setEventIndicatorCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setEventIndicatorCharacteristic:];
}

id objc_msgSend_setFirstButton_(void *a1, const char *a2, ...)
{
  return [a1 setFirstButton:];
}

id objc_msgSend_setFwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setFwRevisionCharacteristic:];
}

id objc_msgSend_setHidControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHidControlPointCharacteristic:];
}

id objc_msgSend_setHidDevice_(void *a1, const char *a2, ...)
{
  return [a1 setHidDevice:];
}

id objc_msgSend_setHidInformationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHidInformationCharacteristic:];
}

id objc_msgSend_setHighPriorityLink_burstTime_(void *a1, const char *a2, ...)
{
  return [a1 setHighPriorityLink:burstTime:];
}

id objc_msgSend_setHighPriorityStream_duration_(void *a1, const char *a2, ...)
{
  return [a1 setHighPriorityStream:duration:];
}

id objc_msgSend_setHwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHwRevisionCharacteristic:];
}

id objc_msgSend_setInertial_(void *a1, const char *a2, ...)
{
  return [a1 setInertial:];
}

id objc_msgSend_setInfrared_(void *a1, const char *a2, ...)
{
  return [a1 setInfrared:];
}

id objc_msgSend_setInputElementHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInputElementHandler:];
}

id objc_msgSend_setInputElementMatching_(void *a1, const char *a2, ...)
{
  return [a1 setInputElementMatching:];
}

id objc_msgSend_setInputReportTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setInputReportTimestamp:];
}

id objc_msgSend_setIsEventIndicatorNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsEventIndicatorNotificationEnabled:YES];
}

id objc_msgSend_setIsPrimary_(void *a1, const char *a2, ...)
{
  return [a1 setIsPrimary:YES];
}

id objc_msgSend_setIsSendDataNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsSendDataNotificationEnabled:];
}

id objc_msgSend_setIsSendingData_(void *a1, const char *a2, ...)
{
  return [a1 setIsSendingData:YES];
}

id objc_msgSend_setIsStartStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsStartStreamingNotificationEnabled:];
}

id objc_msgSend_setIsStarted_(void *a1, const char *a2, ...)
{
  return [a1 setIsStarted:];
}

id objc_msgSend_setIsStopStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsStopStreamingNotificationEnabled:];
}

id objc_msgSend_setIsStreaming_(void *a1, const char *a2, ...)
{
  return [a1 setIsStreaming:];
}

id objc_msgSend_setIsValid_(void *a1, const char *a2, ...)
{
  return [a1 setIsValid:];
}

id objc_msgSend_setLastAudioDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastAudioDate:];
}

id objc_msgSend_setLatency_(void *a1, const char *a2, ...)
{
  return [a1 setLatency:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setManufacturerNameCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setManufacturerNameCharacteristic:];
}

id objc_msgSend_setMaxCELength_(void *a1, const char *a2, ...)
{
  return [a1 setMaxCELength:];
}

id objc_msgSend_setMaxDeferment_(void *a1, const char *a2, ...)
{
  return [a1 setMaxDeferment:];
}

id objc_msgSend_setMaxInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMaxInterval:];
}

id objc_msgSend_setMaxPayloadSize_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPayloadSize:];
}

id objc_msgSend_setMaxPeripheralLatency_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPeripheralLatency:];
}

id objc_msgSend_setMfiAuthChannel_(void *a1, const char *a2, ...)
{
  return [a1 setMfiAuthChannel:];
}

id objc_msgSend_setMfiPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setMfiPeripheral:];
}

id objc_msgSend_setMfiVoucher_(void *a1, const char *a2, ...)
{
  return [a1 setMfiVoucher:];
}

id objc_msgSend_setMinCELength_(void *a1, const char *a2, ...)
{
  return [a1 setMinCELength:];
}

id objc_msgSend_setMinInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMinInterval:];
}

id objc_msgSend_setModelNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setModelNumberCharacteristic:];
}

id objc_msgSend_setNormalPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 setNormalPeripheralLatency];
}

id objc_msgSend_setNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationEnabled:YES];
}

id objc_msgSend_setNotificationPort_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationPort:];
}

id objc_msgSend_setNotify_forCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setNotify:forCharacteristic:];
}

id objc_msgSend_setNotifyValue_forCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setNotifyValue:forCharacteristic:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return [a1 setOffset:];
}

id objc_msgSend_setOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticConnection:];
}

id objc_msgSend_setOpportunisticConnection_forAccessoryUUID_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticConnection:forAccessoryUUID:];
}

id objc_msgSend_setOpportunisticRefCount_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticRefCount:];
}

id objc_msgSend_setPeerChannel_(void *a1, const char *a2, ...)
{
  return [a1 setPeerChannel:];
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setPeripheral:];
}

id objc_msgSend_setPeripherals_(void *a1, const char *a2, ...)
{
  return [a1 setPeripherals:];
}

id objc_msgSend_setPersist_(void *a1, const char *a2, ...)
{
  return [a1 setPersist:];
}

id objc_msgSend_setPersistanceAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setPersistanceAssertion:];
}

id objc_msgSend_setPmIsSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setPmIsSuspended:];
}

id objc_msgSend_setPmNotifier_(void *a1, const char *a2, ...)
{
  return [a1 setPmNotifier:];
}

id objc_msgSend_setPmService_(void *a1, const char *a2, ...)
{
  return [a1 setPmService:];
}

id objc_msgSend_setPnpIDCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setPnpIDCharacteristic:];
}

id objc_msgSend_setPowerSourceDetails_(void *a1, const char *a2, ...)
{
  return [a1 setPowerSourceDetails:];
}

id objc_msgSend_setPreferredInterval_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredInterval:];
}

id objc_msgSend_setPreferredPeripheralLatency_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPeripheralLatency:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProximity_(void *a1, const char *a2, ...)
{
  return [a1 setProximity:];
}

id objc_msgSend_setProximityData_(void *a1, const char *a2, ...)
{
  return [a1 setProximityData:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setRadio_(void *a1, const char *a2, ...)
{
  return [a1 setRadio:];
}

id objc_msgSend_setReceivedMessage_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedMessage:];
}

id objc_msgSend_setRecvDataMessage_(void *a1, const char *a2, ...)
{
  return [a1 setRecvDataMessage:];
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:reportID:reportType:keyholeID:];
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_error_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:reportID:reportType:keyholeID:error:];
}

id objc_msgSend_setReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 setReportData:reportID:reportType:error:];
}

id objc_msgSend_setReportMapCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setReportMapCharacteristic:];
}

id objc_msgSend_setSelectedCodecCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedCodecCharacteristic:];
}

id objc_msgSend_setSendDataCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSendDataCharacteristic:];
}

id objc_msgSend_setSerialNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSerialNumberCharacteristic:];
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return [a1 setServerConnection:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setShouldPersist_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPersist:YES];
}

id objc_msgSend_setSiriXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setSiriXpcConnection:];
}

id objc_msgSend_setSleepPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 setSleepPeripheralLatency];
}

id objc_msgSend_setSoundSensorXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setSoundSensorXpcConnection:];
}

id objc_msgSend_setStartPriority_(void *a1, const char *a2, ...)
{
  return [a1 setStartPriority:];
}

id objc_msgSend_setStartStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setStartStreamingCharacteristic:];
}

id objc_msgSend_setStartTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setStartTimeout:];
}

id objc_msgSend_setStartTimer_(void *a1, const char *a2, ...)
{
  return [a1 setStartTimer:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStopStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setStopStreamingCharacteristic:];
}

id objc_msgSend_setSupportedCodecsCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSupportedCodecsCharacteristic:];
}

id objc_msgSend_setSwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSwRevisionCharacteristic:];
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setTimeout:];
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return [a1 setTouch:];
}

id objc_msgSend_setTryCount_(void *a1, const char *a2, ...)
{
  return [a1 setTryCount:];
}

id objc_msgSend_setTxDataQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTxDataQueue:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUarpAccessory_(void *a1, const char *a2, ...)
{
  return [a1 setUarpAccessory:];
}

id objc_msgSend_setUarpAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUarpAssetID:");
}

id objc_msgSend_setUarpDataControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUarpDataControlPointCharacteristic:];
}

id objc_msgSend_setUarpOverAACP_(void *a1, const char *a2, ...)
{
  return [a1 setUarpOverAACP:];
}

id objc_msgSend_setUdiForMedicalDevicesCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUdiForMedicalDevicesCharacteristic:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVersionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setVersionCharacteristic:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setXpcConnection:];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _[a1 sharedPairingAgent];
}

id objc_msgSend_shouldPersist(void *a1, const char *a2, ...)
{
  return _[a1 shouldPersist];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signalCommandCondition_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalCommandCondition:error:");
}

id objc_msgSend_siriXpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 siriXpcConnection];
}

id objc_msgSend_softwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 softwareRevision];
}

id objc_msgSend_soundSensorXpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 soundSensorXpcConnection];
}

id objc_msgSend_stageFirmwareUpdateOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 stageFirmwareUpdateOnAccessoryList:withUserIntent:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startClientServices(void *a1, const char *a2, ...)
{
  return _[a1 startClientServices];
}

id objc_msgSend_startPersonalizationHelperService_entitlement_(void *a1, const char *a2, ...)
{
  return [a1 startPersonalizationHelperService:entitlement:];
}

id objc_msgSend_startPriority(void *a1, const char *a2, ...)
{
  return _[a1 startPriority];
}

id objc_msgSend_startStream_(void *a1, const char *a2, ...)
{
  return [a1 startStream:];
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return _[a1 startStreaming];
}

id objc_msgSend_startStreaming_(void *a1, const char *a2, ...)
{
  return [a1 startStreaming:];
}

id objc_msgSend_startTapToRadar(void *a1, const char *a2, ...)
{
  return _[a1 startTapToRadar];
}

id objc_msgSend_startTapToRadar_(void *a1, const char *a2, ...)
{
  return [a1 startTapToRadar:];
}

id objc_msgSend_startTimeout(void *a1, const char *a2, ...)
{
  return _[a1 startTimeout];
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return _[a1 startTimer];
}

id objc_msgSend_startingClientServices(void *a1, const char *a2, ...)
{
  return _[a1 startingClientServices];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopStream_(void *a1, const char *a2, ...)
{
  return [a1 stopStream:];
}

id objc_msgSend_stopStreaming_(void *a1, const char *a2, ...)
{
  return [a1 stopStreaming:];
}

id objc_msgSend_stopTapToRadar(void *a1, const char *a2, ...)
{
  return _[a1 stopTapToRadar];
}

id objc_msgSend_storeDeviceSettings_inEarEnable_doubleTapMode_deviceSettings_deviceName_device_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDeviceSettings:inEarEnable:doubleTapMode:deviceSettings:deviceName:device:");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _[a1 stream];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamID(void *a1, const char *a2, ...)
{
  return _[a1 streamID];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:encoding:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_supportedCommands(void *a1, const char *a2, ...)
{
  return _[a1 supportedCommands];
}

id objc_msgSend_swRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 swRevisionCharacteristic];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_tag_(void *a1, const char *a2, ...)
{
  return [a1 tag:];
}

id objc_msgSend_tapToRadarIsOngoing(void *a1, const char *a2, ...)
{
  return _[a1 tapToRadarIsOngoing];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchData(void *a1, const char *a2, ...)
{
  return _[a1 touchData];
}

id objc_msgSend_tryCount(void *a1, const char *a2, ...)
{
  return _[a1 tryCount];
}

id objc_msgSend_txDataQueue(void *a1, const char *a2, ...)
{
  return _[a1 txDataQueue];
}

id objc_msgSend_txMessageQueue(void *a1, const char *a2, ...)
{
  return _[a1 txMessageQueue];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uarpAACPTransportAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uarpAACPTransportAvailability];
}

id objc_msgSend_uarpAccessory(void *a1, const char *a2, ...)
{
  return _[a1 uarpAccessory];
}

id objc_msgSend_uarpAssetID(void *a1, const char *a2, ...)
{
  return _[a1 uarpAssetID];
}

id objc_msgSend_uarpController(void *a1, const char *a2, ...)
{
  return _[a1 uarpController];
}

id objc_msgSend_uarpDataControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 uarpDataControlPointCharacteristic];
}

id objc_msgSend_uarpLogPath(void *a1, const char *a2, ...)
{
  return _[a1 uarpLogPath];
}

id objc_msgSend_uarpOverAACP(void *a1, const char *a2, ...)
{
  return _[a1 uarpOverAACP];
}

id objc_msgSend_uarpServiceForAccessoryUuid_(void *a1, const char *a2, ...)
{
  return [a1 uarpServiceForAccessoryUuid:];
}

id objc_msgSend_udiForMedicalDevices(void *a1, const char *a2, ...)
{
  return _[a1 udiForMedicalDevices];
}

id objc_msgSend_udiForMedicalDevicesCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 udiForMedicalDevicesCharacteristic];
}

id objc_msgSend_unexpectedDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 unexpectedDisconnection:];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregisterAllEndpoints(void *a1, const char *a2, ...)
{
  return _[a1 unregisterAllEndpoints];
}

id objc_msgSend_unregisterUARPService_withUARPAccessory_(void *a1, const char *a2, ...)
{
  return [a1 unregisterUARPService:withUARPAccessory:];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_updateAvailabilityStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateAvailabilityStatus];
}

id objc_msgSend_updatePeripheral_options_(void *a1, const char *a2, ...)
{
  return [a1 updatePeripheral:options:];
}

id objc_msgSend_updatePowerSource_(void *a1, const char *a2, ...)
{
  return [a1 updatePowerSource:];
}

id objc_msgSend_updateValue_forCharacteristic_onSubscribedCentrals_(void *a1, const char *a2, ...)
{
  return [a1 updateValue:forCharacteristic:onSubscribedCentrals:];
}

id objc_msgSend_updateWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return [a1 updateWithValue:characteristic:centrals:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_uuidToString_(void *a1, const char *a2, ...)
{
  return [a1 uuidToString];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 valueTimestamp];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_vendorIDSource(void *a1, const char *a2, ...)
{
  return _[a1 vendorIDSource];
}

id objc_msgSend_vendorIDSourceString(void *a1, const char *a2, ...)
{
  return _[a1 vendorIDSourceString];
}

id objc_msgSend_verifyButtonDriverOpenedByEventSystem_(void *a1, const char *a2, ...)
{
  return [a1 verifyButtonDriverOpenedByEventSystem:YES];
}

id objc_msgSend_verifyCertificateIsUnique(void *a1, const char *a2, ...)
{
  return _[a1 verifyCertificateIsUnique];
}

id objc_msgSend_verifyChallenge(void *a1, const char *a2, ...)
{
  return _[a1 verifyChallenge];
}

id objc_msgSend_versionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 versionCharacteristic];
}

id objc_msgSend_waitForSiriAudioToStop_(void *a1, const char *a2, ...)
{
  return [a1 waitForSiriAudioToStop:];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDate:];
}

id objc_msgSend_wasUUIDRequestedForLogRetrieval_(void *a1, const char *a2, ...)
{
  return [a1 wasUUIDRequestedForLogRetrieval:];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 write:maxLength:];
}

id objc_msgSend_writeControlPointCommand_(void *a1, const char *a2, ...)
{
  return [a1 writeControlPointCommand:];
}

id objc_msgSend_writeData_forCharacteristic_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:forCharacteristic:withResponse:");
}

id objc_msgSend_writeReportData_reportID_reportType_withResponse_error_(void *a1, const char *a2, ...)
{
  return [a1 writeReportData:reportID:reportType:withResponse:error:];
}

id objc_msgSend_writeValue_forCharacteristic_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeValue:forCharacteristic:type:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return _[a1 xpcServer];
}