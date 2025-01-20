@interface CLATVAirplayMonitor
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)power;
- (CLATVAirplayMonitor)init;
- (CLTimer)scanDeliveryDelayTimer;
- (NSMutableArray)bufferedDevices;
- (NSMutableSet)clients;
- (WPAirPlaySolo)airplaySolo;
- (void)addClient:(id)a3;
- (void)airPlaySolo:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)airPlaySolo:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)airPlaySoloDidUpdateState:(id)a3;
- (void)airPlaySoloStartedScanning:(id)a3;
- (void)airPlaySoloStoppedScanning:(id)a3;
- (void)beginService;
- (void)beginServiceWithAirPlaySolo:(id)a3;
- (void)dealloc;
- (void)endService;
- (void)getPowerWithCompletion:(id)a3;
- (void)releaseData;
- (void)removeClient:(id)a3;
- (void)sendBufferedScanNotifications;
- (void)setAirplaySolo:(id)a3;
- (void)setBufferedDevices:(id)a3;
- (void)setClients:(id)a3;
- (void)setPower:(BOOL)a3;
- (void)setScanDeliveryDelayTimer:(id)a3;
- (void)startMonitoringDevicesForClient:(id)a3;
- (void)startScan;
- (void)stopMonitoringDevicesForClient:(id)a3;
- (void)stopScan;
- (void)withClients:(id)a3;
@end

@implementation CLATVAirplayMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997868 != -1) {
    dispatch_once(&qword_101997868, &stru_101843A80);
  }
  return (id)qword_101997860;
}

- (void)beginService
{
}

- (void)beginServiceWithAirPlaySolo:(id)a3
{
  -[CLATVAirplayMonitor setPower:]( self,  "setPower:",  -[WPAirPlaySolo state](-[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"), "state") == (id)3);
  -[CLATVAirplayMonitor setScanDeliveryDelayTimer:]( self,  "setScanDeliveryDelayTimer:",  objc_msgSend(objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo"), "newTimer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1005FB454;
  v5[3] = &unk_10181A288;
  v5[4] = self;
  -[CLTimer setHandler:]( -[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"),  "setHandler:",  v5);
  -[CLATVAirplayMonitor setBufferedDevices:]( self,  "setBufferedDevices:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
}

- (void)endService
{
}

- (void)releaseData
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLATVAirplayMonitor;
  -[CLATVAirplayMonitor dealloc](&v3, "dealloc");
}

- (void)addClient:(id)a3
{
}

- (void)removeClient:(id)a3
{
}

- (void)startMonitoringDevicesForClient:(id)a3
{
}

- (void)stopMonitoringDevicesForClient:(id)a3
{
  if (-[NSMutableSet count](-[CLATVAirplayMonitor clients](self, "clients"), "count") == (id)1) {
    -[CLATVAirplayMonitor stopScan](self, "stopScan");
  }
  -[CLATVAirplayMonitor removeClient:](self, "removeClient:", a3);
}

- (void)getPowerWithCompletion:(id)a3
{
}

- (CLATVAirplayMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLATVAirplayMonitor;
  return -[CLATVAirplayMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLATVAirplayMonitorServiceProtocol,  &OBJC_PROTOCOL___CLATVAirplayMonitorClientProtocol);
}

- (void)withClients:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  clients = self->_clients;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
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
          objc_enumerationMutation(clients);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (void)startScan
{
  if (!-[NSMutableSet count](-[CLATVAirplayMonitor clients](self, "clients"), "count"))
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    objc_super v3 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#Warning Got a request for a scan but no one is interested. Ignoring",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    LOWORD(v7[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  0LL,  "#Warning Got a request for a scan but no one is interested. Ignoring",  v7,  2,  v7[0]);
LABEL_21:
    id v6 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLATVAirplayMonitor startScan]", "%s\n", v4);
    if (v6 != buf) {
      free(v6);
    }
    return;
  }

  if (-[CLATVAirplayMonitor power](self, "power"))
  {
    -[WPAirPlaySolo startConnectionlessScanningWithData:]( -[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"),  "startConnectionlessScanningWithData:",  &off_1018D6878);
    -[CLTimer setNextFireTime:]( -[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"),  "setNextFireTime:",  (*(double *)&qword_101997858 + j__CFAbsoluteTimeGetCurrent_1() * 1000.0) / 1000.0);
    return;
  }

  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101843AC8);
  }
  unint64_t v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Bluetooth is OFF, ignoring request to scan",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    LOWORD(v7[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Bluetooth is OFF, ignoring request to scan",  v7,  2,  v7[0]);
    goto LABEL_21;
  }

- (void)stopScan
{
}

- (void)sendBufferedScanNotifications
{
  if (-[NSMutableArray count](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "count"))
  {
    id v3 = -[NSMutableArray copy](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "copy");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1005FBBAC;
    v4[3] = &unk_101843AA8;
    v4[4] = self;
    v4[5] = v3;
    -[CLATVAirplayMonitor withClients:](self, "withClients:", v4);

    -[NSMutableArray removeAllObjects]( -[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"),  "removeAllObjects");
  }

- (void)airPlaySoloDidUpdateState:(id)a3
{
  -[CLATVAirplayMonitor setPower:](self, "setPower:", [a3 state] == (id)3);
}

- (void)airPlaySolo:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101843AC8);
  }
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380931;
      id v29 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
      __int16 v30 = 2081;
      id v31 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Found device %{private}s withData: %{private}s",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101843AC8);
      }
      uint64_t v21 = qword_101934A48;
      *(_DWORD *)v25 = 136380931;
      *(void *)&v25[4] = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
      __int16 v26 = 2081;
      id v27 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  2LL,  "Found device %{private}s withData: %{private}s",  v25,  22);
      v23 = (uint8_t *)v22;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v22);
      if (v23 != buf) {
        free(v23);
      }
    }
  }

  if (a4)
  {
    id v9 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloAdvertisingData];
    if (v9 && (__int128 v10 = v9, [v9 length]))
    {
      if ((unint64_t)[v10 length] > 5)
      {
        uint64_t v16 = *(unsigned int *)((char *)[v10 bytes] + 2);
        id v17 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloRSSI];
        if (v17) {
          id v18 = [v17 intValue];
        }
        else {
          id v18 = 0LL;
        }
        id v19 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloAdvertisingChannel];
        if (v19) {
          uint64_t v20 = (uint64_t)[v19 intValue];
        }
        else {
          uint64_t v20 = 0xFFFFFFFFLL;
        }
        -[NSMutableArray addObject:]( -[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"),  "addObject:",   -[CLATVAirplayDevice initWithTimestamp:RSSI:uuid:ipv4:channel:]( objc_alloc(&OBJC_CLASS___CLATVAirplayDevice),  "initWithTimestamp:RSSI:uuid:ipv4:channel:",  v18,  a4,  v16,  v20,  j__CFAbsoluteTimeGetCurrent_1()));
      }

      else
      {
        if (qword_101934A40 != -1) {
          dispatch_once(&qword_101934A40, &stru_101843AC8);
        }
        __int128 v11 = (os_log_s *)qword_101934A48;
        if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Not enough data provided for advertisement data. Ignoring",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934A40 != -1) {
            dispatch_once(&qword_101934A40, &stru_101843AC8);
          }
          *(_WORD *)v25 = 0;
          LODWORD(v24) = 2;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Not enough data provided for advertisement data. Ignoring",  v25,  v24,  *(void *)v25);
LABEL_35:
          v15 = (uint8_t *)v12;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v12);
          if (v15 != buf) {
            free(v15);
          }
        }
      }
    }

    else
    {
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101843AC8);
      }
      __int128 v13 = (os_log_s *)qword_101934A48;
      if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "No IP address provided. Ignoring device",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934A40 != -1) {
          dispatch_once(&qword_101934A40, &stru_101843AC8);
        }
        *(_WORD *)v25 = 0;
        LODWORD(v24) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "No IP address provided. Ignoring device",  v25,  v24,  *(void *)v25);
        goto LABEL_35;
      }
    }
  }

  else
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    v14 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Found a device but its UUID is nil", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101843AC8);
      }
      *(_WORD *)v25 = 0;
      LODWORD(v24) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Found a device but its UUID is nil",  v25,  v24,  *(void *)v25);
      goto LABEL_35;
    }
  }

- (void)airPlaySoloStartedScanning:(id)a3
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101843AC8);
  }
  id v3 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo started scanning", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "AirPlaySolo started scanning",  v6,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLATVAirplayMonitor airPlaySoloStartedScanning:]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)airPlaySoloStoppedScanning:(id)a3
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101843AC8);
  }
  id v3 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo stopped scanning", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "AirPlaySolo stopped scanning",  v6,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLATVAirplayMonitor airPlaySoloStoppedScanning:]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)airPlaySolo:(id)a3 failedToStartScanningWithError:(id)a4
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101843AC8);
  }
  unint64_t v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = [a4 description];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "Failed to start AirPlaySolo scanning. %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101843AC8);
    }
    uint64_t v6 = qword_101934A48;
    int v9 = 138543362;
    id v10 = [a4 description];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  17LL,  "Failed to start AirPlaySolo scanning. %{public}@",  &v9,  12);
    uint64_t v8 = (uint8_t *)v7;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLATVAirplayMonitor airPlaySolo:failedToStartScanningWithError:]",  "%s\n",  v7);
    if (v8 != buf) {
      free(v8);
    }
  }

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (WPAirPlaySolo)airplaySolo
{
  return self->_airplaySolo;
}

- (void)setAirplaySolo:(id)a3
{
}

- (BOOL)power
{
  return self->_power;
}

- (void)setPower:(BOOL)a3
{
  self->_power = a3;
}

- (CLTimer)scanDeliveryDelayTimer
{
  return self->_scanDeliveryDelayTimer;
}

- (void)setScanDeliveryDelayTimer:(id)a3
{
}

- (NSMutableArray)bufferedDevices
{
  return self->_bufferedDevices;
}

- (void)setBufferedDevices:(id)a3
{
}

@end