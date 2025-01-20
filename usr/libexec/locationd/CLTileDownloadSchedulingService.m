@interface CLTileDownloadSchedulingService
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)hasRegisteredForCellularConnectivity;
- (BOOL)hasRegisteredForWifiConnectivity;
- (CLTileDownloadSchedulingService)init;
- (NSMutableArray)clients;
- (void)beginService;
- (void)dealloc;
- (void)endService;
- (void)requestForSchedulingTileDownload:(id)a3;
- (void)scheduleDownloadsWithCellularConnectivity;
- (void)scheduleDownloadsWithWifiConnectivity;
- (void)setClients:(id)a3;
- (void)setHasRegisteredForCellularConnectivity:(BOOL)a3;
- (void)setHasRegisteredForWifiConnectivity:(BOOL)a3;
- (void)stopListeningForForScheduledTileDownload:(id)a3;
@end

@implementation CLTileDownloadSchedulingService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997370 != -1) {
    dispatch_once(&qword_101997370, &stru_101843190);
  }
  return (id)qword_101997368;
}

- (CLTileDownloadSchedulingService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTileDownloadSchedulingService;
  return -[CLTileDownloadSchedulingService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTileDownloadSchedulingServiceProtocol,  &OBJC_PROTOCOL___CLTileDownloadSchedulingClientProtocol);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTileDownloadSchedulingService;
  -[CLTileDownloadSchedulingService dealloc](&v3, "dealloc");
}

- (void)beginService
{
}

- (void)endService
{
}

- (void)requestForSchedulingTileDownload:(id)a3
{
  if ((-[NSMutableArray containsObject:]( -[CLTileDownloadSchedulingService clients](self, "clients"),  "containsObject:",  a3) & 1) != 0)
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_1018431B0);
    }
    unint64_t v5 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#tiledownloadscheduler, warning, client is re-subscribing",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_1018431B0);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "#tiledownloadscheduler, warning, client is re-subscribing");
LABEL_23:
      v9 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileDownloadSchedulingService requestForSchedulingTileDownload:]",  "%s\n",  v6);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

  else
  {
    -[NSMutableArray addObject:](-[CLTileDownloadSchedulingService clients](self, "clients"), "addObject:", a3);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_1018431B0);
    }
    v7 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "#tiledownloadscheduler, add client, count, %ld",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_1018431B0);
      }
      uint64_t v8 = qword_101934838;
      -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  2LL,  "#tiledownloadscheduler, add client, count, %ld",  &v10);
      goto LABEL_23;
    }
  }

  if (!-[CLTileDownloadSchedulingService hasRegisteredForWifiConnectivity](self, "hasRegisteredForWifiConnectivity")) {
    -[CLTileDownloadSchedulingService scheduleDownloadsWithWifiConnectivity]( self,  "scheduleDownloadsWithWifiConnectivity");
  }
  if (!-[CLTileDownloadSchedulingService hasRegisteredForCellularConnectivity]( self,  "hasRegisteredForCellularConnectivity")) {
    -[CLTileDownloadSchedulingService scheduleDownloadsWithCellularConnectivity]( self,  "scheduleDownloadsWithCellularConnectivity");
  }
}

- (void)stopListeningForForScheduledTileDownload:(id)a3
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_1018431B0);
  }
  v4 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v11 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "#tiledownloadscheduler, client unsubscribe, count, %{public}ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_1018431B0);
    }
    uint64_t v5 = qword_101934838;
    int v8 = 134349056;
    id v9 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  2LL,  "#tiledownloadscheduler, client unsubscribe, count, %{public}ld",  &v8,  12);
    v7 = (uint8_t *)v6;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileDownloadSchedulingService stopListeningForForScheduledTileDownload:]",  "%s\n",  v6);
    if (v7 != buf) {
      free(v7);
    }
  }

- (void)scheduleDownloadsWithWifiConnectivity
{
  if (!-[CLTileDownloadSchedulingService hasRegisteredForWifiConnectivity](self, "hasRegisteredForWifiConnectivity"))
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    sub_1005E3774(v3, 2LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1005E3860;
    handler[3] = &unk_101831AF8;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadWifiReachability", v3, handler);
    xpc_release(v3);
    -[CLTileDownloadSchedulingService setHasRegisteredForWifiConnectivity:]( self,  "setHasRegisteredForWifiConnectivity:",  1LL);
  }

- (void)scheduleDownloadsWithCellularConnectivity
{
  if (!-[CLTileDownloadSchedulingService hasRegisteredForCellularConnectivity]( self,  "hasRegisteredForCellularConnectivity"))
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    sub_1005E3774(v3, 1LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1005E3ED4;
    handler[3] = &unk_101831AF8;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadCellReachability", v3, handler);
    xpc_release(v3);
    -[CLTileDownloadSchedulingService setHasRegisteredForCellularConnectivity:]( self,  "setHasRegisteredForCellularConnectivity:",  1LL);
  }

- (NSMutableArray)clients
{
  result = self->_clients;
  if (!result)
  {
    result = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_clients = result;
  }

  return result;
}

- (void)setClients:(id)a3
{
}

- (BOOL)hasRegisteredForWifiConnectivity
{
  return self->_hasRegisteredForWifiConnectivity;
}

- (void)setHasRegisteredForWifiConnectivity:(BOOL)a3
{
  self->_hasRegisteredForWifiConnectivity = a3;
}

- (BOOL)hasRegisteredForCellularConnectivity
{
  return self->_hasRegisteredForCellularConnectivity;
}

- (void)setHasRegisteredForCellularConnectivity:(BOOL)a3
{
  self->_hasRegisteredForCellularConnectivity = a3;
}

@end