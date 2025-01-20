@interface BTVCLinkAgent
+ (BTVCLinkAgent)sharedBTVCLinkAgent;
- (BOOL)_bleBTVCLinkAdvertiserShouldAdvertise;
- (BOOL)_bleBTVCLinkScannerShouldScan;
- (BOOL)_isAdvertisingEnabled;
- (BOOL)_isAdvertisingEnabled:(unsigned __int8)a3;
- (BOOL)isAdvertisingEnabled:(unsigned __int8)a3;
- (BOOL)isScanningEnabled;
- (BTVCLinkAgent)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getBTVCLinkAdvertiserSet:(unsigned __int8)a3;
- (id)advReportReceiveHandler;
- (id)description;
- (void)_activate;
- (void)_bleBTVCLinkAdvertiserEnsureStarted;
- (void)_bleBTVCLinkAdvertiserEnsureStopped;
- (void)_bleBTVCLinkScannerEnsureStarted;
- (void)_bleBTVCLinkScannerEnsureStopped;
- (void)_invalidate;
- (void)_receivedAdvReport:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5 peerInfo:(id)a6;
- (void)_resetAdvertisingEnable;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)_update;
- (void)activate;
- (void)invalidate;
- (void)leSetAdvertisingSetRandomAddress:(unsigned __int8)a3 address:(id)a4;
- (void)leSetExtendedAdvertisingData:(unsigned __int8)a3 advertisingData:(id)a4;
- (void)leSetExtendedAdvertisingEnable:(BOOL)a3 numSets:(unsigned __int8)a4 advertisingHandles:(char *)a5;
- (void)leSetExtendedAdvertisingParameters:(unsigned __int8)a3 advertisingParameters:(id)a4;
- (void)leSetExtendedScanEnable:(BOOL)a3;
- (void)prefsChanged;
- (void)reset;
- (void)setAdvReportReceiveHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)update;
@end

@implementation BTVCLinkAgent

+ (BTVCLinkAgent)sharedBTVCLinkAgent
{
  if (qword_1008F09E8 != -1) {
    dispatch_once(&qword_1008F09E8, &stru_1008931C0);
  }
  return (BTVCLinkAgent *)(id)qword_1008F7278;
}

- (BTVCLinkAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BTVCLinkAgent;
  v2 = -[BTVCLinkAgent init](&v5, "init");
  if (v2)
  {
    if (qword_1008F09F8 != -1) {
      dispatch_once(&qword_1008F09F8, &stru_1008931E0);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)qword_1008F09F0);
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  id v12 = 0LL;
  NSAppendPrintF(&v12, "-- BTVCLinkAgent --\n");
  id v3 = v12;
  v4 = v3;
  bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
  if (bleBTVCLinkAdvertiser)
  {
    id v11 = v3;
    NSAppendPrintF(&v11, "BLE Advertiser:   %@\n", bleBTVCLinkAdvertiser);
    id v6 = v11;

    v4 = v6;
  }

  if (self->_bleBTVCLinkScanner)
  {
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
    id v10 = v4;
    NSAppendPrintF(&v10, "BLE Scanner:      %@\n", bleBTVCLinkScanner);
    id v7 = v10;

    v4 = v7;
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100361954;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  id v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Activate\n", v14, 2u);
  }

  self->_activated = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    int v4 = 6;
    objc_super v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 6LL);
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    self->_bleBTVCLinkAdvertiseSets = v5;

    do
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___BTVCLinkAdvertiseSet);
      v7->enable = 0;
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      address = v7->address;
      v7->address = v8;

      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      parameters = v7->parameters;
      v7->parameters = v10;

      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      data = v7->data;
      v7->data = v12;

      -[NSMutableArray addObject:](self->_bleBTVCLinkAdvertiseSets, "addObject:", v7);
      --v4;
    }

    while (v4);
  }

  -[BTVCLinkAgent prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100361B00;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  id v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Invalidate\n", v5, 2u);
  }

  -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStopped](self, "_bleBTVCLinkAdvertiserEnsureStopped");
  -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStopped](self, "_bleBTVCLinkScannerEnsureStopped");
  bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
  self->_bleBTVCLinkAdvertiseSets = 0LL;

  self->_activated = 0;
}

- (void)prefsChanged
{
}

- (void)update
{
}

- (void)_update
{
  id v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[BTVCLinkAgent _update]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v12, 0xCu);
  }

  if (self->_activated)
  {
    if (-[BTVCLinkAgent _bleBTVCLinkAdvertiserShouldAdvertise](self, "_bleBTVCLinkAdvertiserShouldAdvertise")) {
      -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStarted](self, "_bleBTVCLinkAdvertiserEnsureStarted");
    }
    else {
      -[BTVCLinkAgent _bleBTVCLinkAdvertiserEnsureStopped](self, "_bleBTVCLinkAdvertiserEnsureStopped");
    }
    if (-[BTVCLinkAgent _bleBTVCLinkScannerShouldScan](self, "_bleBTVCLinkScannerShouldScan")) {
      -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStarted](self, "_bleBTVCLinkScannerEnsureStarted");
    }
    else {
      -[BTVCLinkAgent _bleBTVCLinkScannerEnsureStopped](self, "_bleBTVCLinkScannerEnsureStopped");
    }
  }

  else
  {
    int v4 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_100671EC8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

- (void)reset
{
  id v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[BTVCLinkAgent reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v12, 0xCu);
  }

  if (self->_activated)
  {
    if (-[BTVCLinkAgent _isAdvertisingEnabled](self, "_isAdvertisingEnabled"))
    {
      -[BTVCLinkAdvertiser advertisingEnable:](self->_bleBTVCLinkAdvertiser, "advertisingEnable:", 0LL);
      -[BTVCLinkAgent _resetAdvertisingEnable](self, "_resetAdvertisingEnable");
    }

    if (self->_bleBTVCLinkScanEnable) {
      -[BTVCLinkScanner scanEnable:](self->_bleBTVCLinkScanner, "scanEnable:", 0LL);
    }
  }

  else
  {
    int v4 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_100671EFC(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

- (BOOL)isAdvertisingEnabled:(unsigned __int8)a3
{
  return -[BTVCLinkAgent _isAdvertisingEnabled:](self, "_isAdvertisingEnabled:", a3);
}

- (BOOL)_isAdvertisingEnabled:(unsigned __int8)a3
{
  if (self->_bleBTVCLinkAdvertiseSets) {
    return 0;
  }
  int v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", a3));
  if (!v4) {
    return 0;
  }
  BOOL v3 = v4[8] != 0;

  return v3;
}

- (BOOL)_isAdvertisingEnabled
{
  if (self->_bleBTVCLinkAdvertiseSets) {
    return 0;
  }
  int v3 = 0;
  while (1)
  {
    int v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v3));
    if (v4) {
      break;
    }
    if (++v3 == 6) {
      return 0;
    }
  }

  BOOL v5 = v4[8] != 0;

  return v5;
}

- (void)_resetAdvertisingEnable
{
  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    for (int i = 0; i != 6; ++i)
    {
      int v4 = (_BYTE *)objc_claimAutoreleasedReturnValue( -[BTVCLinkAgent _getBTVCLinkAdvertiserSet:]( self,  "_getBTVCLinkAdvertiserSet:",  i));
      if (v4) {
        v4[8] = 0;
      }
    }
  }

- (BOOL)isScanningEnabled
{
  return self->_bleBTVCLinkScanEnable;
}

- (void)leSetAdvertisingSetRandomAddress:(unsigned __int8)a3 address:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[BTVCLinkAgent leSetAdvertisingSetRandomAddress:address:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s, handle:%d address:%@",  (uint8_t *)&v10,  0x1Cu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  uint64_t v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 16) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingParameters:(unsigned __int8)a3 advertisingParameters:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingParameters:advertisingParameters:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s, handle:%d advertisingParameters:%@",  (uint8_t *)&v10,  0x1Cu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  uint64_t v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 24) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingData:(unsigned __int8)a3 advertisingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingData:advertisingData:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s, handle:%d advertisingData:%@",  (uint8_t *)&v10,  0x1Cu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", v4));
  uint64_t v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 32) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingEnable:(BOOL)a3 numSets:(unsigned __int8)a4 advertisingHandles:(char *)a5
{
  LODWORD(v6) = a4;
  BOOL v7 = a3;
  uint64_t v9 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315650;
    v28 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
    __int16 v29 = 1024;
    *(_DWORD *)v30 = v7;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s, enable:%d, numSets:%d",  (uint8_t *)&v27,  0x18u);
  }

  if (self->_bleBTVCLinkAdvertiser)
  {
    if ((_DWORD)v6)
    {
      uint64_t v6 = v6;
      do
      {
        int v10 = (_BYTE *)objc_claimAutoreleasedReturnValue( -[BTVCLinkAgent _getBTVCLinkAdvertiserSet:]( self,  "_getBTVCLinkAdvertiserSet:",  *a5));
        if (v10) {
          v10[8] = v7;
        }

        ++a5;
        --v6;
      }

      while (v6);
    }

    else
    {
      for (int i = 0; i != 6; ++i)
      {
        v20 = (_BYTE *)objc_claimAutoreleasedReturnValue( -[BTVCLinkAgent _getBTVCLinkAdvertiserSet:]( self,  "_getBTVCLinkAdvertiserSet:",  i));
        if (v20) {
          v20[8] = 0;
        }
      }
    }

    if (v7)
    {
      id v21 = objc_msgSend( (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),  "init");
      if (v21)
      {
        for (int j = 0; j != 6; ++j)
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent _getBTVCLinkAdvertiserSet:](self, "_getBTVCLinkAdvertiserSet:", j));
          v24 = (void *)v23;
          if (v23 && *(_BYTE *)(v23 + 8))
          {
            v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v24[2]);
            -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v24[3]);
            -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v24[4]);
            [v21 addObject:v25];
          }
        }
      }

      v26 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315394;
        v28 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
        __int16 v29 = 2112;
        *(void *)v30 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s, payloadFields:%@",  (uint8_t *)&v27,  0x16u);
      }

      -[BTVCLinkAdvertiser setPayloadFields:](self->_bleBTVCLinkAdvertiser, "setPayloadFields:", v21);
    }

    -[BTVCLinkAdvertiser advertisingEnable:](self->_bleBTVCLinkAdvertiser, "advertisingEnable:", v7);
    self->_bleBTVCLinkAdvertiseEnable = v7;
  }

  else
  {
    uint64_t v11 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_100671F30(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

- (void)leSetExtendedScanEnable:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[BTVCLinkAgent leSetExtendedScanEnable:]";
    __int16 v17 = 1024;
    BOOL v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, enable:%d", (uint8_t *)&v15, 0x12u);
  }

  bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  if (bleBTVCLinkScanner)
  {
    -[BTVCLinkScanner scanEnable:](bleBTVCLinkScanner, "scanEnable:", v3);
    self->_bleBTVCLinkScanEnable = v3;
  }

  else
  {
    BOOL v7 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_100671FA4(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

- (id)_getBTVCLinkAdvertiserSet:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_bleBTVCLinkAdvertiseSets, "count") <= a3)
  {
    bleBTVCLinkAdvertiseSets = 0LL;
  }

  else
  {
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    if (bleBTVCLinkAdvertiseSets) {
      bleBTVCLinkAdvertiseSets = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( bleBTVCLinkAdvertiseSets,  "objectAtIndex:",  v3));
    }
  }

  return bleBTVCLinkAdvertiseSets;
}

- (void)_bleBTVCLinkAdvertiserEnsureStarted
{
  if (!self->_bleBTVCLinkAdvertiser)
  {
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAgent] BLE BTVCLink advertiser start\n",  v6,  2u);
    }

    uint64_t v4 = -[BTVCLinkAdvertiser initWithType:](objc_alloc(&OBJC_CLASS___BTVCLinkAdvertiser), "initWithType:", 2LL);
    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
    self->_bleBTVCLinkAdvertiser = v4;

    -[BTVCLinkAdvertiser setDispatchQueue:](self->_bleBTVCLinkAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    self->_bleBTVCLinkAdvertiseEnable = 0;
    -[BTVCLinkAdvertiser activateWithCompletion:]( self->_bleBTVCLinkAdvertiser,  "activateWithCompletion:",  &stru_100893200);
  }

- (void)_bleBTVCLinkAdvertiserEnsureStopped
{
  if (self->_bleBTVCLinkAdvertiser)
  {
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAgent] BLE BTVCLink advertiser stop\n",  v6,  2u);
    }

    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
  }

  else
  {
    bleBTVCLinkAdvertiser = 0LL;
  }

  -[BTVCLinkAdvertiser invalidate](bleBTVCLinkAdvertiser, "invalidate");
  self->_bleBTVCLinkAdvertiseEnable = 0;
  BOOL v5 = self->_bleBTVCLinkAdvertiser;
  self->_bleBTVCLinkAdvertiser = 0LL;
}

- (BOOL)_bleBTVCLinkAdvertiserShouldAdvertise
{
  return !self->_systemWillPowerDown;
}

- (void)_bleBTVCLinkScannerEnsureStarted
{
  if (self->_bleBTVCLinkScanner)
  {
    -[BTVCLinkAgent _bleUpdateScanner:](self, "_bleUpdateScanner:");
  }

  else
  {
    self->_bleBTVCLinkScanEnable = 0;
    id location = 0LL;
    objc_initWeak(&location, self);
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAgent] BLE BTVCLink scanner start\n",  buf,  2u);
    }

    uint64_t v4 = -[BTVCLinkScanner initWithType:](objc_alloc(&OBJC_CLASS___BTVCLinkScanner), "initWithType:", 2LL);
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
    self->_bleBTVCLinkScanner = v4;

    -[BTVCLinkScanner setDispatchQueue:](self->_bleBTVCLinkScanner, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003629E0;
    v6[3] = &unk_100893228;
    objc_copyWeak(&v7, &location);
    -[BTVCLinkScanner setAdvReportReceiveHandler:](self->_bleBTVCLinkScanner, "setAdvReportReceiveHandler:", v6);
    -[BTVCLinkAgent _bleUpdateScanner:](self, "_bleUpdateScanner:", self->_bleBTVCLinkScanner);
    -[BTVCLinkScanner activateWithCompletion:](self->_bleBTVCLinkScanner, "activateWithCompletion:", &stru_100893248);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)_bleBTVCLinkScannerEnsureStopped
{
  if (self->_bleBTVCLinkScanner)
  {
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAgent] BLE BTVCLink scanner stop\n",  v6,  2u);
    }

    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  }

  else
  {
    bleBTVCLinkScanner = 0LL;
  }

  -[BTVCLinkScanner invalidate](bleBTVCLinkScanner, "invalidate");
  self->_bleBTVCLinkScanEnable = 0;
  BOOL v5 = self->_bleBTVCLinkScanner;
  self->_bleBTVCLinkScanner = 0LL;
}

- (BOOL)_bleBTVCLinkScannerShouldScan
{
  return !self->_systemWillPowerDown;
}

- (void)_receivedAdvReport:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5 peerInfo:(id)a6
{
  id v60 = a4;
  id v56 = a5;
  id v57 = a6;
  int v80 = 0;
  uint64_t v8 = (os_log_s *)(id)qword_1008F7710;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v60 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s report count %d", buf, 0x12u);
  }

  if ([v60 count])
  {
    unint64_t v61 = 0LL;
    v72 = 0LL;
    while (1)
    {
      uint64_t v9 = v72;
      if ((unint64_t)[v60 count] <= v61)
      {
LABEL_60:
        if (v80)
        {
          v53 = (os_log_s *)qword_1008F7710;
          if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%s ADV data missing field %@\n",  buf,  0x16u);
          }
        }

        goto LABEL_63;
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectAtIndex:"));

      v72 = (void *)v10;
      if (!v10)
      {
        v50 = (os_log_s *)qword_1008F7710;
        if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v61;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s ADV data [%d] is empty", buf, 0x12u);
        }

        goto LABEL_30;
      }

      __int128 v120 = 0u;
      __int128 v121 = 0u;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      memset(buf, 0, sizeof(buf));
      uint64_t v79 = 0LL;
      uint64_t NSNumber = NSDictionaryGetNSNumber(v10, @"et", &v80);
      v78 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
      if (v80) {
        break;
      }
      uint64_t v12 = NSDictionaryGetNSNumber(v10, @"at", &v80);
      v77 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_34;
      }

      CFTypeID TypeID = CFDataGetTypeID();
      uint64_t TypedValue = CFDictionaryGetTypedValue(v10, @"pa", TypeID, &v80);
      id v70 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_36;
      }

      uint64_t v15 = NSDictionaryGetNSNumber(v10, @"pPHY", &v80);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_38;
      }

      uint64_t v16 = NSDictionaryGetNSNumber(v10, @"sPHY", &v80);
      v69 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_39;
      }

      uint64_t v17 = NSDictionaryGetNSNumber(v10, @"aSID", &v80);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_40;
      }

      uint64_t v18 = NSDictionaryGetNSNumber(v10, @"tp", &v80);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_41;
      }

      uint64_t v19 = NSDictionaryGetNSNumber(v10, @"rssi", &v80);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_42;
      }

      uint64_t v20 = NSDictionaryGetNSNumber(v10, @"pai", &v80);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_43;
      }

      uint64_t v21 = NSDictionaryGetNSNumber(v10, @"dat", &v80);
      v64 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_44;
      }

      uint64_t v22 = NSDictionaryGetNSNumber(v10, @"da", &v80);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if (v80)
      {
        int v48 = 0;
        goto LABEL_45;
      }

      uint64_t v23 = NSDictionaryGetNSNumber(v10, @"dtl", &v80);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (v80 || (CFDictionaryGetData(v10, @"data", buf, 256LL, &v79, &v80), v80))
      {
        int v48 = 0;
        int v47 = 7;
      }

      else
      {
        id v70 = v70;
        v59 = (uint64_t *)[v70 bytes];
        v24 = (os_log_s *)(id)qword_1008F7710;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v75 = [v78 intValue];
          unsigned int v73 = [v77 intValue];
          uint64_t v25 = *v59;
          unsigned int v26 = [v71 intValue];
          unsigned int v27 = [v69 intValue];
          unsigned int v28 = [v68 intValue];
          unsigned int v29 = [v67 intValue];
          unsigned int v30 = [v66 intValue];
          unsigned int v31 = [v65 intValue];
          unsigned int v32 = [v64 intValue];
          id v33 = [v63 longLongValue];
          unsigned int v34 = [v62 intValue];
          *(_DWORD *)v81 = 136318210;
          v82 = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          __int16 v83 = 1024;
          unsigned int v84 = v75;
          __int16 v85 = 1024;
          unsigned int v86 = v73;
          __int16 v87 = 2048;
          uint64_t v88 = v25;
          __int16 v89 = 1024;
          unsigned int v90 = v26;
          __int16 v91 = 1024;
          unsigned int v92 = v27;
          __int16 v93 = 1024;
          unsigned int v94 = v28;
          __int16 v95 = 1024;
          unsigned int v96 = v29;
          __int16 v97 = 1024;
          unsigned int v98 = v30;
          __int16 v99 = 1024;
          unsigned int v100 = v31;
          __int16 v101 = 1024;
          unsigned int v102 = v32;
          __int16 v103 = 2048;
          id v104 = v33;
          __int16 v105 = 1024;
          unsigned int v106 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s EventType:0x%04X, AddressType:0x%02X, PeerAddress:%llX, primaryPHY:0x%02X, secondaryPHY:0x%02X, advertisi ngSID:0x%02X, txPower:0x%02X, rssi:0x%02X, periodicAdvInterval:0x%02X, directAddressType:0x%02X, directAddre ss:0x%llX, DataLength:%d",  v81,  0x5Cu);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent advReportReceiveHandler](self, "advReportReceiveHandler"));
        BOOL v36 = v35 == 0LL;

        if (!v36)
        {
          v37 = (void (**)(void, void, void, void, void, void, void, void, void, void, _DWORD, void, void, void))objc_claimAutoreleasedReturnValue(-[BTVCLinkAgent advReportReceiveHandler](self, "advReportReceiveHandler"));
          unsigned __int16 v38 = (unsigned __int16)[v78 intValue];
          unsigned __int8 v76 = [v77 intValue];
          uint64_t v74 = *v59;
          unsigned __int8 v39 = [v71 intValue];
          unsigned __int8 v40 = [v69 intValue];
          unsigned __int8 v41 = [v68 intValue];
          unsigned __int8 v42 = [v67 intValue];
          unsigned __int8 v43 = [v66 intValue];
          unsigned __int16 v44 = (unsigned __int16)[v65 intValue];
          unsigned __int8 v45 = [v64 intValue];
          id v46 = [v63 longLongValue];
          LOBYTE(v55) = [v62 intValue];
          BYTE4(v54) = v45;
          WORD1(v54) = v44;
          LOBYTE(v54) = v43;
          ((void (**)(void, void, void, uint64_t, void, void, void, void, uint64_t, id, int, uint8_t *, id, id))v37)[2]( v37,  v38,  v76,  v74,  v39,  v40,  v41,  v42,  v54,  v46,  v55,  buf,  v56,  v57);
        }

        int v47 = 0;
        int v48 = 1;
      }

      v49 = v62;
LABEL_26:

      if (!v48)
      {
        if (v47 == 7)
        {
          uint64_t v9 = v72;
        }

        else
        {
          BOOL v52 = v47 == 2;
          uint64_t v9 = v72;
          if (!v52) {
            goto LABEL_63;
          }
        }

        goto LABEL_60;
      }

- (void)_systemWillSleep
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100363908;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100363974;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end