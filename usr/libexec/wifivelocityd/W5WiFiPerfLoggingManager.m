@interface W5WiFiPerfLoggingManager
- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5;
- (W5WiFiPerfLoggingManager)init;
- (W5WiFiPerfLoggingManager)initWithStatusManager:(id)a3;
- (id)__pendingRequestWithUUID:(id)a3;
- (void)__cancelActiveRequestAndReply:(id)a3;
- (void)__collectNetworkCountersPOST;
- (void)__collectNetworkCountersPRE;
- (void)__collectWiFiCountersPOST;
- (void)__collectWiFiCountersPRE;
- (void)__collectWiFiDeviceConfig;
- (void)__collectWiFiMemoryStatsWithFilename:(id)a3;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3;
- (void)__nextRequest;
- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5;
- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8;
- (void)__setupWatchdogTask;
- (void)__startAWDLPerfLogging;
- (void)__startAWDLQueryTimer;
- (void)__startCoreCaptureTriggerTimerWithInterval:(unint64_t)a3;
- (void)__startNANPerfLogging;
- (void)__startNANQueryTimer;
- (void)__startP2PPerfLogging;
- (void)__startPerfLogging;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5WiFiPerfLoggingManager

- (W5WiFiPerfLoggingManager)initWithStatusManager:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___W5WiFiPerfLoggingManager;
  v4 = -[W5WiFiPerfLoggingManager init](&v11, "init");
  v5 = v4;
  if (!a3) {
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_9;
  }
  v4->_status = (W5StatusManager *)a3;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifivelocity.wifiperf", 0LL);
  v5->_queue = (OS_dispatch_queue *)v6;
  if (!v6) {
    goto LABEL_9;
  }
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5->_pendingRequests = v7;
  if (v7
    && (v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray), (v5->_runningTasks = v8) != 0LL)
    && (v9 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter), (v5->_dateFormatter = v9) != 0LL))
  {
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"HH:mm:ss.SSS");
  }

  else
  {
LABEL_9:

    return 0LL;
  }

  return v5;
}

- (W5WiFiPerfLoggingManager)init
{
  return result;
}

- (void)dealloc
{
  awdlQueryTimer = self->_awdlQueryTimer;
  if (awdlQueryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)awdlQueryTimer);
    dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
    self->_awdlQueryTimer = 0LL;
  }

  nanQueryTimer = self->_nanQueryTimer;
  if (nanQueryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)nanQueryTimer);
    dispatch_release((dispatch_object_t)self->_nanQueryTimer);
    self->_nanQueryTimer = 0LL;
  }

  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  if (coreCaptureTriggerTimer)
  {
    dispatch_source_cancel((dispatch_source_t)coreCaptureTriggerTimer);
    dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
    self->_coreCaptureTriggerTimer = 0LL;
  }

  beginGroup = (dispatch_object_s *)self->_beginGroup;
  if (beginGroup) {
    dispatch_release(beginGroup);
  }
  endGroup = (dispatch_object_s *)self->_endGroup;
  if (endGroup) {
    dispatch_release(endGroup);
  }
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___W5WiFiPerfLoggingManager;
  -[W5WiFiPerfLoggingManager dealloc](&v9, "dealloc");
}

- (void)teardownAndNotify:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E4C4;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)addRequest:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E598;
  v4[3] = &unk_1000D1BA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pendingRequests);
    }
    objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E738;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E94C;
  block[3] = &unk_1000D1BF8;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__startCoreCaptureTriggerTimerWithInterval:(unint64_t)a3
{
  id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  self->_coreCaptureTriggerTimer = v5;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001EC68;
  handler[3] = &unk_1000D1BF8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  a3 *= 1000000000LL;
  dispatch_time_t v7 = dispatch_time(0LL, a3);
  dispatch_source_set_timer((dispatch_source_t)coreCaptureTriggerTimer, v7, a3, 0LL);
  dispatch_resume((dispatch_object_t)self->_coreCaptureTriggerTimer);
}

- (void)__startPerfLogging
{
  id v3 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"tcpdump.pcap")];
  v43[0] = @"-n";
  v43[1] = @"-p";
  v43[2] = @"-i";
  v43[3] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v43[4] = @"-s";
  v43[5] = @"300";
  v43[6] = @"-w";
  v43[7] = v3;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10001F6CC;
  v35[3] = &unk_1000D1C20;
  v35[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10001F770;
  v34[3] = &unk_1000D1C48;
  v34[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/sbin/tcpdump",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 8LL),  v35,  v34);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v4 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_inout.txt")];
  v42[0] = @"-I";
  v42[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v42[2] = @"-w";
  v42[3] = @"1";
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10001F78C;
  v33[3] = &unk_1000D1C20;
  v33[4] = self;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10001F830;
  v32[3] = &unk_1000D1C48;
  v32[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 4LL),  v4,  v33,  v32);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v5 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_queue.txt")];
  v41[0] = @"-I";
  v41[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v41[2] = @"-w";
  v41[3] = @"1";
  v41[4] = @"-qq";
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001F84C;
  v31[3] = &unk_1000D1C20;
  v31[4] = self;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10001F8F0;
  v30[3] = &unk_1000D1C48;
  v30[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 5LL),  v5,  v31,  v30);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v6 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_tcp.txt")];
  v40[0] = @"-I";
  v40[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v40[2] = @"-w";
  v40[3] = @"1";
  v40[4] = @"-s";
  v40[5] = @"-p";
  v40[6] = @"tcp";
  v28[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10001F90C;
  v29[3] = &unk_1000D1C20;
  v29[4] = self;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10001F9B0;
  v28[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 7LL),  v6,  v29,  v28);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v7 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"netstat_udp.txt")];
  v39[0] = @"-I";
  v39[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v39[2] = @"-w";
  v39[3] = @"1";
  v39[4] = @"-s";
  v39[5] = @"-p";
  v39[6] = @"udp";
  uint64_t v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 7LL);
  v26[4] = self;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10001F9CC;
  v27[3] = &unk_1000D1C20;
  v27[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001FA70;
  v26[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  v8,  v7,  v27,  v26);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v9 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), @"nettop.txt")];
  v24[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10001FA8C;
  v25[3] = &unk_1000D1C20;
  v25[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001FB30;
  v24[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/bin/nettop",  &off_1000E3018,  v9,  v25,  v24);
  id v10 = -[NSDictionary objectForKeyedSubscript:]( -[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"),  "objectForKeyedSubscript:",  @"WiFiStatsSampleInterval");
  if (v10)
  {
    v38[0] = @"-vrftsR";
    v38[1] = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v10 integerValue]);
    __int128 v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL);
  }

  else
  {
    __int128 v11 = (NSArray *)&off_1000E3030;
  }

  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v12 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"wifistats.txt");
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001FB4C;
  v23[3] = &unk_1000D1C20;
  v23[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001FBF0;
  v22[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/local/bin/wifistats",  v11,  v12,  v23,  v22);
  id v13 = -[NSDictionary objectForKeyedSubscript:]( -[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"),  "objectForKeyedSubscript:",  @"PowermetricsCPUSampleInterval");
  if (v13) {
    id v14 = [v13 integerValue];
  }
  else {
    id v14 = 0LL;
  }
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  id v15 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"powermetrics.txt");
  v37[0] = @"-b";
  v37[1] = @"/usr/local/bin/powermetrics";
  v37[2] = @"-i";
  v37[3] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v14);
  v37[4] = @"--samplers";
  v37[5] = @"cpu_power,tasks,network,interrupts";
  v37[6] = @"--show-usage-summary";
  v37[7] = @"--show-plimits";
  v37[8] = @"--show-process-qos";
  v37[9] = @"--show-process-netstats";
  v37[10] = @"--show-process-energy";
  v37[11] = @"--show-process-samp-norm";
  v37[12] = @"--show-process-gpu";
  v37[13] = @"--show-process-io";
  v37[14] = @"--show-process-wait-times";
  v37[15] = @"-u";
  v37[16] = v15;
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001FC0C;
  v21[3] = &unk_1000D1C20;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001FCB0;
  v20[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/sbin/taskpolicy",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 17LL),  v21,  v20);
  if (objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"),  "objectForKeyedSubscript:",  @"IncludeArtrace"),  "BOOLValue"))
  {
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v16 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"wifiperf.artrace");
    v36[0] = @"-o";
    v36[1] = v16;
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001FCCC;
    v19[3] = &unk_1000D1C20;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001FD70;
    v18[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/local/bin/artrace",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL),  v19,  v18);
  }

  id v17 = -[NSDictionary objectForKeyedSubscript:]( -[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"),  "objectForKeyedSubscript:",  @"CoreCaptureTriggerInterval");
  if (v17) {
    -[W5WiFiPerfLoggingManager __startCoreCaptureTriggerTimerWithInterval:]( self,  "__startCoreCaptureTriggerTimerWithInterval:",  [v17 unsignedIntegerValue]);
  }
}

- (void)__startAWDLPerfLogging
{
  id v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
  if (v3)
  {
    id v4 = v3;
    -[W5WiFiPerfLoggingManager __startAWDLQueryTimer](self, "__startAWDLQueryTimer");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v5 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"io80211.pcap")];
    v28[0] = v4;
    v28[1] = @"-logf='vv el+ set'";
    v28[2] = @"-quiet";
    v28[3] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"-outfile=%@", v5);
    v28[4] = @"-dlog";
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000204A4;
    v22[3] = &unk_1000D1C20;
    v22[4] = self;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100020548;
    v21[3] = &unk_1000D1C48;
    v21[4] = self;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 5LL),  v22,  v21);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v6 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"tcpdump.pcap")];
    v27[0] = @"-n";
    v27[1] = @"-p";
    v27[2] = @"-i";
    v27[3] = v4;
    v27[4] = @"-s";
    void v27[5] = @"300";
    v27[6] = @"-w";
    v27[7] = v6;
    v19[4] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100020564;
    v20[3] = &unk_1000D1C20;
    v20[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100020608;
    v19[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/sbin/tcpdump",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 8LL),  v20,  v19);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v7 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_inout.txt")];
    v26[0] = @"-I";
    v26[1] = v4;
    v26[2] = @"-w";
    v26[3] = @"1";
    v17[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100020624;
    v18[3] = &unk_1000D1C20;
    v18[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000206C8;
    v17[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL),  v7,  v18,  v17);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_queue.txt")];
    v25[0] = @"-I";
    v25[1] = v4;
    v25[2] = @"-w";
    v25[3] = @"1";
    v25[4] = @"-qq";
    +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 5LL);
    v16[9] = self;
    v16[10] = _NSConcreteStackBlock;
    v16[11] = 3221225472LL;
    v16[12] = sub_1000206E4;
    v16[13] = &unk_1000D1C20;
    v16[14] = self;
    v16[5] = _NSConcreteStackBlock;
    v16[6] = 3221225472LL;
    v16[7] = sub_100020788;
    v16[8] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v8 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_tcp.txt")];
    v24[0] = @"-I";
    v24[1] = v4;
    v24[2] = @"-w";
    v24[3] = @"1";
    v24[4] = @"-s";
    void v24[5] = @"-p";
    v24[6] = @"tcp";
    v15[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000207A4;
    v16[3] = &unk_1000D1C20;
    v16[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100020848;
    v15[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 7LL),  v8,  v16,  v15);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v9 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_udp.txt")];
    v23[0] = @"-I";
    v23[1] = v4;
    v23[2] = @"-w";
    v23[3] = @"1";
    v23[4] = @"-s";
    void v23[5] = @"-p";
    v23[6] = @"udp";
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100020864;
    v14[3] = &unk_1000D1C20;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100020908;
    v13[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 7LL),  v9,  v14,  v13);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v10 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"nettop.txt")];
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100020924;
    v12[3] = &unk_1000D1C20;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000209C8;
    v11[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/bin/nettop",  &off_1000E3048,  v10,  v12,  v11);
  }

- (void)__startAWDLQueryTimer
{
  id v3 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl_%@", @"apple80211.txt")];
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v3,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v3,  0LL,  0LL);
  self->_awdlQueryFileHandle =  +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v3);
  id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  self->_awdlQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100020B5C;
  handler[3] = &unk_1000D1BF8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  awdlQueryTimer = self->_awdlQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100020C80;
  v8[3] = &unk_1000D1BF8;
  v8[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)awdlQueryTimer, v8);
  id v6 = self->_awdlQueryTimer;
  dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume((dispatch_object_t)self->_awdlQueryTimer);
}

- (void)__startNANPerfLogging
{
  id v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
  if (v3)
  {
    id v4 = v3;
    -[W5WiFiPerfLoggingManager __startNANQueryTimer](self, "__startNANQueryTimer");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v5 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"io80211.pcap")];
    v24[0] = v4;
    v24[1] = @"-logf='vv el+ set'";
    v24[2] = @"-quiet";
    v24[3] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"-outfile=%@", v5);
    v24[4] = @"-dlog";
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000211F8;
    v19[3] = &unk_1000D1C20;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002129C;
    v18[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 5LL),  v19,  v18);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v6 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"tcpdump.pcap")];
    v23[0] = @"-n";
    v23[1] = @"-p";
    v23[2] = @"-i";
    v23[3] = v4;
    v23[4] = @"-s";
    void v23[5] = @"300";
    v23[6] = @"-w";
    void v23[7] = v6;
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000212B8;
    v17[3] = &unk_1000D1C20;
    v17[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002135C;
    v16[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/usr/sbin/tcpdump",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 8LL),  v17,  v16);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v7 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_queue.txt")];
    v22[0] = @"-I";
    v22[1] = v4;
    v22[2] = @"-w";
    v22[3] = @"1";
    v22[4] = @"-qq";
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100021378;
    v15[3] = &unk_1000D1C20;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002141C;
    v14[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL),  v7,  v15,  v14);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v8 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_tcp.txt")];
    v21[0] = @"-I";
    v21[1] = v4;
    v21[2] = @"-w";
    v21[3] = @"1";
    v21[4] = @"-s";
    void v21[5] = @"-p";
    v21[6] = @"tcp";
    v12[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100021438;
    v13[3] = &unk_1000D1C20;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000214DC;
    v12[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 7LL),  v8,  v13,  v12);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    id v9 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@", v4, @"netstat_udp.txt")];
    v20[0] = @"-I";
    v20[1] = v4;
    v20[2] = @"-w";
    v20[3] = @"1";
    v20[4] = @"-s";
    void v20[5] = @"-p";
    v20[6] = @"udp";
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000214F8;
    v11[3] = &unk_1000D1C20;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002159C;
    v10[3] = &unk_1000D1C48;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:",  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 7LL),  v9,  v11,  v10);
  }

- (void)__startNANQueryTimer
{
  id v3 = [objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:-[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"nan_%@", @"apple80211.txt")];
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v3,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v3,  0LL,  0LL);
  self->_nanQueryFileHandle =  +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v3);
  id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  self->_nanQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100021730;
  handler[3] = &unk_1000D1BF8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  nanQueryTimer = self->_nanQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002183C;
  v8[3] = &unk_1000D1BF8;
  v8[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)nanQueryTimer, v8);
  id v6 = self->_nanQueryTimer;
  dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume((dispatch_object_t)self->_nanQueryTimer);
}

- (void)__startP2PPerfLogging
{
}

- (void)__setupWatchdogTask
{
  id v3 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"( ");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  runningTasks = self->_runningTasks;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( runningTasks,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(runningTasks);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%d ",  [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) processIdentifier]);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( runningTasks,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
    }

    while (v6);
  }

  -[NSMutableString appendString:](v3, "appendString:", @""));
  id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CHILDPIDS=%@; while kill -0 %d; do sleep 10; done; for PID in ${CHILDPIDS[@]}; do kill -9 $PID; done;",
         v3,
         -[NSProcessInfo processIdentifier]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "processIdentifier"));
  v16[0] = @"-c";
  v16[1] = v9;
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100021A78;
  v11[3] = &unk_1000D1C20;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100021B10;
  v10[3] = &unk_1000D1C48;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/bin/sh",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL),  v11,  v10);
}

- (void)__nextRequest
{
  if (!self->_activeRequest && -[NSMutableArray count](self->_pendingRequests, "count"))
  {
    self->_activeRequest = (W5WiFiPerfLoggingRequest *)objc_msgSend( -[NSMutableArray firstObject]( self->_pendingRequests,  "firstObject"),  "copy");
    -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0LL);
    beginGroup = (dispatch_object_s *)self->_beginGroup;
    if (beginGroup) {
      dispatch_release(beginGroup);
    }
    self->_beginGroup = (OS_dispatch_group *)dispatch_group_create();
    endGroup = (dispatch_object_s *)self->_endGroup;
    if (endGroup) {
      dispatch_release(endGroup);
    }
    self->_endGroup = (OS_dispatch_group *)dispatch_group_create();
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/run/com.apple.wifivelocity/wifiperf",  0LL,  0LL,  0LL);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  0,  0,  0);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/run/com.apple.wifivelocity/wifiperf",  0LL,  0LL,  0LL);
    id v5 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"thermtune.csv");
    v9[0] = @"--tGraphLogFile";
    v9[1] = v5;
    +[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/local/bin/thermtune",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL),  0LL);
    -[W5WiFiPerfLoggingManager __collectWiFiCountersPRE](self, "__collectWiFiCountersPRE");
    -[W5WiFiPerfLoggingManager __collectNetworkCountersPRE](self, "__collectNetworkCountersPRE");
    -[W5WiFiPerfLoggingManager __collectWiFiMemoryStatsWithFilename:]( self,  "__collectWiFiMemoryStatsWithFilename:",  @"wifi_memory_usage_pre.txt");
    -[W5WiFiPerfLoggingManager __startPerfLogging](self, "__startPerfLogging");
    if (objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"),  "objectForKeyedSubscript:",  @"IncludeP2P"),  "BOOLValue")) {
      -[W5WiFiPerfLoggingManager __startP2PPerfLogging](self, "__startP2PPerfLogging");
    }
    queue = (dispatch_queue_s *)self->_queue;
    id v6 = self->_beginGroup;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100021D3C;
    v8[3] = &unk_1000D1BF8;
    v8[4] = self;
    dispatch_group_notify((dispatch_group_t)v6, queue, v8);
  }

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v12 = a4;
  if (a7)
  {
    id v15 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [v15 appendFormat:@"%@ %@\n", objc_msgSend(a5, "lastPathComponent"), objc_msgSend(a6, "componentsJoinedByString:", @" ")];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v15, "dataUsingEncoding:", 4));
  }

  id v16 = [a3 offsetInFile];
  id v17 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (v8)
  {
    v18 = v17;
    id v19 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v19 appendFormat:@"BEGIN: %@, END: 00:00:00.000\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18)];
    [v19 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
    if (v12) {
      id v20 = 0LL;
    }
    else {
      id v20 = a3;
    }
    if (v12) {
      id v21 = a3;
    }
    else {
      id v21 = 0LL;
    }
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a5,  a6,  v20,  v21,  0LL,  0LL,  10.0,  0LL);
    [a3 seekToFileOffset:v16];
    id v22 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v22 appendFormat:@"BEGIN: %@, END: %@\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:]( self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"))];
    [v22 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v22, "dataUsingEncoding:", 4));
    [a3 seekToEndOfFile];
LABEL_18:
    objc_msgSend(a3, "writeData:", objc_msgSend(@"\n", "dataUsingEncoding:", 4));
    return;
  }

  if (v12) {
    id v23 = 0LL;
  }
  else {
    id v23 = a3;
  }
  if (v12) {
    id v24 = a3;
  }
  else {
    id v24 = 0LL;
  }
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a5,  a6,  v23,  v24,  0LL,  0LL,  10.0,  0LL);
  if (v9) {
    goto LABEL_18;
  }
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  a4,  0LL,  @"/usr/local/bin/wl",  a3,  v7,  v6);
  }

  else if (v7)
  {
    id v11 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v11 appendString:@"--------------------------------------------------------------------\n"];
    [v11 appendFormat:@"%@ %@ -- NOT ASSOCIATED, NOOP\n", objc_msgSend(@"/usr/local/bin/wl", "lastPathComponent"), objc_msgSend(a3, "componentsJoinedByString:", @" ")];
    [v11 appendString:@"--------------------------------------------------------------------\n\n"];
    objc_msgSend(a4, "writeData:", objc_msgSend(v11, "dataUsingEncoding:", 4));
  }

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (!-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID")) {
    return 0;
  }
  if (a4) {
    return +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/local/bin/wl",  a3,  a4,  0LL);
  }
  if (a5) {
    return +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/usr/local/bin/wl",  a3,  a5,  0LL);
  }
  else {
    return 0;
  }
}

- (void)__collectWiFiMemoryStatsWithFilename:(id)a3
{
  id v4 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  a3);
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v4,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v4,  0LL,  0LL);
  id v5 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v4);
  if (v5)
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v5,  1LL,  @"/usr/local/bin/easyperf",  &off_1000E30D8,  1LL,  1LL);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v5,  @"/usr/bin/heap",  &off_1000E30F0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v5,  @"/usr/bin/vmmap",  &off_1000E3108);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v5,  @"/usr/bin/footprint",  &off_1000E3120);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v5,  @"/usr/bin/zprint",  0LL);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v5,  @"/usr/local/bin/jetsam_priority",  &off_1000E3138);
  }

  -[NSFileHandle closeFile](v5, "closeFile");
}

- (void)__collectNetworkCountersPRE
{
  id v3 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"network_counters_pre.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v3,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v3,  0LL,  0LL);
  id v4 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  if (v4)
  {
    +[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/local/bin/netusage",  &off_1000E3150,  0LL);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/local/bin/netusage",  &off_1000E3168);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3180);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3198);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E31B0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E31C8);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E31E0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/bin/nettop",  &off_1000E31F8);
  }

  -[NSFileHandle closeFile](v4, "closeFile");
}

- (void)__collectNetworkCountersPOST
{
  id v3 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"network_counters_post.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v3,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v3,  0LL,  0LL);
  id v4 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  if (v4)
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/local/bin/netusage",  &off_1000E3210);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3228);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3240);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3258);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3270);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/sbin/netstat",  &off_1000E3288);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v4,  @"/usr/bin/nettop",  &off_1000E32A0);
  }

  -[NSFileHandle closeFile](v4, "closeFile");
}

- (void)__collectWiFiCountersPRE
{
  id v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v3)
  {
    id v4 = v3;
    id v5 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
    BOOL v6 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
    id v7 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"wifi_counters_pre.txt");
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v7,  0LL);
    -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v7,  0LL,  0LL);
    BOOL v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
    if (v8)
    {
      BOOL v9 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E32B8,  0LL,  v9);
      id v10 = -[NSString componentsSeparatedByString:](  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v9,  4LL),  "componentsSeparatedByString:",  @" ");
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E32D0,  0LL,  0LL);
      if (-[NSArray containsObject:](v10, "containsObject:", @"bcntrim")) {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E32E8,  0LL,  0LL);
      }
      if (-[NSArray containsObject:](v10, "containsObject:", @"ops")) {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3300,  0LL,  0LL);
      }
      if (-[NSArray containsObject:](v10, "containsObject:", @"rsdb"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3318,  0LL,  0LL);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3330,  0LL,  0LL);
        if (-[NSArray containsObject:](v10, "containsObject:", @"tdmtx")) {
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3348,  0LL,  0LL);
        }
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3360,  v8);
        id v11 = &off_1000E3378;
      }

      else
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3390,  0LL,  0LL);
        id v11 = &off_1000E33A8;
      }

      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  v11,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E33C0,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E33D8,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E33F0,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3408,  v8);
      v19[0] = v4;
      v19[1] = @"-leaky_ap_stats=0";
      +[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL),  0LL);
      v18[0] = v4;
      v18[1] = @"-dbg=getmimops";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
      v17[0] = v4;
      v17[1] = @"-dbg=print_packets";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
      v16[0] = v4;
      v16[1] = @"-dbg=print_peers";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
      v15[0] = v4;
      v15[1] = @"-dbg=m";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
      v14[0] = v4;
      v14[1] = @"-dbg=proptx";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
      if (v5)
      {
        v13[0] = v5;
        v13[1] = @"-dbg=print_peers";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
      }

      if (v6)
      {
        v12[0] = v6;
        v12[1] = @"-dbg=print_peers";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
      }
    }
  }

  else
  {
    BOOL v8 = 0LL;
  }

  -[NSFileHandle closeFile](v8, "closeFile");
}

- (void)__collectWiFiCountersPOST
{
  id v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (!v3)
  {
    BOOL v8 = 0LL;
    goto LABEL_16;
  }

  id v4 = v3;
  id v5 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
  BOOL v6 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
  id v7 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"wifi_counters_post.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v7,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v7,  0LL,  0LL);
  BOOL v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
  if (v8)
  {
    BOOL v9 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3420,  0LL,  v9);
    id v10 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL),  "componentsSeparatedByString:",  @" ");
    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3438,  v8);
    if (-[NSArray containsObject:](v10, "containsObject:", @"rsdb"))
    {
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3450,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3468,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3480,  v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3498,  v8);
      if (!-[NSArray containsObject:](v10, "containsObject:", @"tdmtx"))
      {
LABEL_8:
        if (-[NSArray containsObject:](v10, "containsObject:", @"bcntrim")) {
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E34F8,  v8);
        }
        if (-[NSArray containsObject:](v10, "containsObject:", @"ops")) {
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3510,  v8);
        }
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3528,  v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3540,  v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3558,  v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3570,  v8);
        v19[0] = v4;
        v19[1] = @"-leaky_ap_stats";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
        v18[0] = v4;
        v18[1] = @"-dbg=getmimops";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
        v17[0] = v4;
        v17[1] = @"-dbg=print_packets";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
        v16[0] = v4;
        v16[1] = @"-dbg=print_peers";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
        v15[0] = v4;
        v15[1] = @"-dbg=m";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
        v14[0] = v4;
        v14[1] = @"-dbg=proptx";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
        if (v5)
        {
          v13[0] = v5;
          v13[1] = @"-dbg=print_peers";
          -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
        }

        if (v6)
        {
          v12[0] = v6;
          v12[1] = @"-dbg=print_peers";
          -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
        }

        goto LABEL_16;
      }

      id v11 = &off_1000E34B0;
    }

    else
    {
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E34C8,  v8);
      id v11 = &off_1000E34E0;
    }

    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  v11,  v8);
    goto LABEL_8;
  }

- (void)__collectWiFiDeviceConfig
{
  id v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend( objc_msgSend( @"/var/run/com.apple.wifivelocity/wifiperf",  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")),  "stringByAppendingPathComponent:",  @"wifi_device_config.txt");
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v5,  0LL);
    -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v5,  0LL,  0LL);
    BOOL v6 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v5);
    if (v6)
    {
      id v7 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
      v29[0] = v4;
      v29[1] = @"-cardcap";
      +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL),  v7,  0LL);
      BOOL v8 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL),  "componentsSeparatedByString:",  @"\n");
      -[NSMutableData setLength:](v7, "setLength:", 0LL);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3588,  0LL,  v7);
      BOOL v9 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL),  "componentsSeparatedByString:",  @" ");
      v28[0] = v4;
      v28[1] = @"-driver_ver";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
      v27[0] = v4;
      v27[1] = @"-hardware_ver";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
      v26[0] = v4;
      v26[1] = @"-ssid";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
      v25[0] = v4;
      v25[1] = @"-bssid";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
      v24[0] = v4;
      v24[1] = @"-rssi";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
      v23[0] = v4;
      v23[1] = @"-noise";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
      v22[0] = v4;
      v22[1] = @"-channel";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
      v21[0] = v4;
      v21[1] = @"-authtype";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
      v20[0] = v4;
      v20[1] = @"-country_code";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
      v19[0] = v4;
      v19[1] = @"-rateset";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
      v18[0] = v4;
      v18[1] = @"-leaky_ap_stats_mode";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
      v17[0] = v4;
      v17[1] = @"-cardcap";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
      v16[0] = v4;
      v16[1] = @"-dbg=mimopsstatus";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
      if (-[NSArray containsObject:](v8, "containsObject:", @"roam"))
      {
        v15[0] = v4;
        v15[1] = @"-dbg=print-roam";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
      }

      if (-[NSArray containsObject:](v8, "containsObject:", @"ocl"))
      {
        v14[0] = v4;
        v14[1] = @"-dbg=ocl_status";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
        v13[0] = v4;
        v13[1] = @"-dbg=ocl_rssi_threshold";
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
      }

      if (-[NSArray containsObject:](v8, "containsObject:", @"awdl")) {
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  &off_1000E35A0);
      }
      if (-[NSArray containsObject:](v8, "containsObject:", @"timesync")) {
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  &off_1000E35B8);
      }
      v12[0] = v4;
      v12[1] = @"-dbg=bgscan-private-mac";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
      v11[0] = v4;
      v11[1] = @"-dbg=dtim";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
      v10[0] = v4;
      v10[1] = @"-dbg=private-mac";
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v6,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E35D0,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E35E8,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3600,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3618,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3630,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3648,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3660,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3678,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3690,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E36A8,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E36C0,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E36D8,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E36F0,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3708,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3720,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3738,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3750,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3768,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3780,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3798,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E37B0,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E37C8,  v6);
      if (-[NSArray containsObject:](v9, "containsObject:", @"ampdu")) {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E37E0,  v6);
      }
      if (-[NSArray containsObject:](v9, "containsObject:", @"amsdu")) {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E37F8,  v6);
      }
      if (-[NSArray containsObject:](v9, "containsObject:", @"ocl"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3810,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3828,  v6);
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"txcap")) {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3840,  v6);
      }
      if (-[NSArray containsObject:](v9, "containsObject:", @"mim_ps"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3858,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3870,  v6);
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"ops"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3888,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E38A0,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E38B8,  v6);
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"nap"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E38D0,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E38E8,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3900,  v6);
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"bcntrim"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3918,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3930,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3948,  v6);
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"rsdb"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3960,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3978,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3990,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E39A8,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E39C0,  v6);
        if (-[NSArray containsObject:](v9, "containsObject:", @"tdmtx"))
        {
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E39D8,  v6);
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E39F0,  v6);
        }
      }

      if (-[NSArray containsObject:](v9, "containsObject:", @"tvpm"))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3A08,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3A20,  v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3A38,  v6);
      }

      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3A50,  v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3A68,  v6);
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  -[NSFileHandle closeFile](v6, "closeFile");
}

- (void)__cancelActiveRequestAndReply:(id)a3
{
  if (self->_activeRequest)
  {
    coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
    if (coreCaptureTriggerTimer)
    {
      dispatch_source_cancel((dispatch_source_t)coreCaptureTriggerTimer);
      dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
      self->_coreCaptureTriggerTimer = 0LL;
    }

    awdlQueryTimer = self->_awdlQueryTimer;
    if (awdlQueryTimer)
    {
      dispatch_source_cancel((dispatch_source_t)awdlQueryTimer);
      dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
      self->_awdlQueryTimer = 0LL;
    }

    nanQueryTimer = self->_nanQueryTimer;
    if (nanQueryTimer)
    {
      dispatch_source_cancel((dispatch_source_t)nanQueryTimer);
      dispatch_release((dispatch_object_t)self->_nanQueryTimer);
      self->_nanQueryTimer = 0LL;
    }

    +[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/local/bin/thermtune",  &off_1000E3A80,  0LL);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    runningTasks = self->_runningTasks;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( runningTasks,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(runningTasks);
          }
          kill((pid_t)[*(id *)(*((void *)&v16 + 1) + 8 * (void)i) processIdentifier], 9);
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( runningTasks,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_runningTasks, "removeAllObjects");
    -[W5WiFiPerfLoggingManager __collectWiFiCountersPOST](self, "__collectWiFiCountersPOST");
    -[W5WiFiPerfLoggingManager __collectNetworkCountersPOST](self, "__collectNetworkCountersPOST");
    -[W5WiFiPerfLoggingManager __collectWiFiMemoryStatsWithFilename:]( self,  "__collectWiFiMemoryStatsWithFilename:",  @"wifi_memory_usage_post.txt");
    -[W5WiFiPerfLoggingManager __collectWiFiDeviceConfig](self, "__collectWiFiDeviceConfig");
    endGroup = self->_endGroup;
    queue = (dispatch_queue_s *)self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_100023F84;
    v15[3] = &unk_1000D1B80;
    v15[4] = self;
    void v15[5] = a3;
    dispatch_group_notify((dispatch_group_t)endGroup, queue, v15);
  }

  else
  {
    -[W5WiFiPerfLoggingManager __nextRequest](self, "__nextRequest");
    if (a3) {
      (*((void (**)(id, void))a3 + 2))(a3, 0LL);
    }
  }

@end