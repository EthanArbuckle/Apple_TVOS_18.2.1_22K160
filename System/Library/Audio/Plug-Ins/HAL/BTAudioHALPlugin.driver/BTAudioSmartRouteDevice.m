@interface BTAudioSmartRouteDevice
- (BOOL)isFormatChangeMapEmpty;
- (BTAudioSmartRouteDevice)init;
- (BTAudioSmartRouteDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4;
- (id).cxx_construct;
- (int)ownership;
- (unsigned)updateFormatChangeMap:(unsigned int)a3 newformat:(unsigned int)a4 processID:(int)a5;
- (void)clearFormatChangeMap;
- (void)dealloc;
- (void)setOwnership:(int)a3;
- (void)updateSession:(id)a3 isStart:(BOOL)a4 isInput:(BOOL)a5;
@end

@implementation BTAudioSmartRouteDevice

- (void)dealloc
{
  mFormatDict = self->_mFormatDict;
  if (mFormatDict) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteDevice;
  -[BTAudioSmartRouteDevice dealloc](&v4, "dealloc");
}

- (BTAudioSmartRouteDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteDevice;
  return -[BTAudioSmartRouteDevice init](&v3, "init");
}

- (BTAudioSmartRouteDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteDevice;
  v6 = -[BTAudioSmartRouteDevice init](&v9, "init");
  v6->_deviceID = a3;
  v6->_bdAddr = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a4);
  v6->_session = 0LL;
  v6->_mFormatDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v7 = (os_log_s *)qword_95A98;
  if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Initialize Bluetooth Audio device in Route Manager %@ ", buf, 0xCu);
  }

  return v6;
}

- (void)clearFormatChangeMap
{
  mFormatDict = self->_mFormatDict;
  objc_super v4 = (os_log_s *)qword_95A98;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT);
  if (mFormatDict)
  {
    if (v5)
    {
      int v6 = 138412290;
      v7 = mFormatDict;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "kBluetoothAudioDevicePropertyFormat removeAllObjects %@",  (uint8_t *)&v6,  0xCu);
      mFormatDict = self->_mFormatDict;
    }

    -[NSMutableDictionary removeAllObjects](mFormatDict, "removeAllObjects");
  }

  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "kBluetoothAudioDevicePropertyFormat skip removeAllObjects",  (uint8_t *)&v6,  2u);
  }

- (BOOL)isFormatChangeMapEmpty
{
  objc_super v3 = (os_log_s *)qword_95A98;
  if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
  {
    mFormatDict = self->_mFormatDict;
    int v6 = 138412290;
    v7 = mFormatDict;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "HFPStereo check FormatDict %@", (uint8_t *)&v6, 0xCu);
  }

  return -[NSMutableDictionary count](self->_mFormatDict, "count") == 0LL;
}

- (unsigned)updateFormatChangeMap:(unsigned int)a3 newformat:(unsigned int)a4 processID:(int)a5
{
  if (self->_mFormatDict)
  {
    uint64_t v5 = *(void *)&a4;
    if (a3 != 1 && a4 == 1)
    {
      v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%u",  *(void *)&a5);
      v8 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 1LL);
      if (v7) {
        BOOL v9 = v8 == 0LL;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mFormatDict, "setObject:forKeyedSubscript:", v8, v7);

        v10 = (os_log_s *)qword_95A98;
        if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
        {
          mFormatDict = self->_mFormatDict;
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = mFormatDict;
          _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "kBluetoothAudioDevicePropertyFormat dict add %@",  (uint8_t *)&buf,  0xCu);
        }
      }

      return 2;
    }

    if (a3 == 1 && (a4 & 0xFFFFFFFD) == 0)
    {
      v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%u",  *(void *)&a5);
      v21 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5);
      if (v20)
      {
        if (v21)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mFormatDict,  "setObject:forKeyedSubscript:",  v21,  v20);

          v22 = (os_log_s *)qword_95A98;
          if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
          {
            v23 = self->_mFormatDict;
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v23;
            _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "kBluetoothAudioDevicePropertyFormat dict remove %@",  (uint8_t *)&buf,  0xCu);
          }
        }
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v30 = 0x2020000000LL;
      int v31 = 1;
      v24 = self->_mFormatDict;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_2BB84;
      v28[3] = &unk_822D0;
      v28[4] = &buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v24, "enumerateKeysAndObjectsUsingBlock:", v28);
      unsigned int v25 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);
      _Block_object_dispose(&buf, 8);
      return v25;
    }
  }

  else
  {
    v12 = (os_log_s *)qword_95A98;
    if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_ERROR)) {
      sub_5C25C(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  v26 = (os_log_s *)qword_95A98;
  if (!os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT)) {
    return 2;
  }
  LOWORD(buf) = 0;
  unsigned int v25 = 2;
  _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "kBluetoothAudioDevicePropertyFormat per process check ignore",  (uint8_t *)&buf,  2u);
  return v25;
}

- (void)setOwnership:(int)a3
{
  if (self->_ownership == a3) {
    goto LABEL_9;
  }
  if ((a3 & 0xFFFFFFFD) == 0) {
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    int v6 = (os_log_s *)qword_95A98;
    if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_ERROR)) {
      sub_5C28C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_7:
    char v5 = 0;
    goto LABEL_8;
  }

  char v5 = 1;
LABEL_8:
  self->_int ownership = a3;
  unsigned int deviceID = self->_deviceID;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_2BD10;
  v18[3] = &unk_81F28;
  v18[4] = self;
  char v19 = v5;
  sub_3E3BC(qword_962E8, deviceID, v18);
LABEL_9:
  uint64_t v15 = (os_log_s *)qword_95A98;
  if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
  {
    bdAddr = self->_bdAddr;
    int ownership = self->_ownership;
    *(_DWORD *)__int128 buf = 138412546;
    v21 = bdAddr;
    __int16 v22 = 1024;
    int v23 = ownership;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Update Ownership on  %@ -> %d", buf, 0x12u);
  }

- (void)updateSession:(id)a3 isStart:(BOOL)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  session = self->_session;
  if (a4)
  {
    if (!session)
    {
      uint64_t v9 = (os_log_s *)qword_95A98;
      if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v23 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "updateSession Create Session", v23, 2u);
      }

      uint64_t v10 = -[BTAudioSmartRouteSession initWithbundleID:]( objc_alloc(&OBJC_CLASS___BTAudioSmartRouteSession),  "initWithbundleID:",  a3);
      self->_session = v10;
      -[BTAudioSmartRouteSession setIsOutput:](v10, "setIsOutput:", 0LL);
      -[BTAudioSmartRouteSession setIsInput:](self->_session, "setIsInput:", 0LL);
    }

    uint64_t v11 = self->_session;
    if (v5) {
      -[BTAudioSmartRouteSession setIsInput:](v11, "setIsInput:", 1LL);
    }
    else {
      -[BTAudioSmartRouteSession setIsOutput:](v11, "setIsOutput:", 1LL);
    }
    uint64_t v12 = (os_log_s *)qword_95A98;
    if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v13 = @"Input";
      }
      else {
        uint64_t v13 = @"Output";
      }
      if (-[BTAudioSmartRouteSession isInput](self->_session, "isInput")) {
        uint64_t v14 = @"true";
      }
      else {
        uint64_t v14 = @"false";
      }
      unsigned int v15 = -[BTAudioSmartRouteSession isOutput](self->_session, "isOutput");
      *(_DWORD *)int v23 = 138413314;
      if (v15) {
        uint64_t v16 = @"true";
      }
      else {
        uint64_t v16 = @"false";
      }
      *(void *)&v23[4] = a3;
      __int16 v24 = 1024;
      int v25 = 1;
      __int16 v26 = 2112;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 2112;
      int v31 = v16;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "updateSession startIO %@ isStart %d isInput %@ SInput %@, SOutput %@",  v23,  0x30u);
    }
  }

  else
  {
    if (a5) {
      -[BTAudioSmartRouteSession setIsInput:](session, "setIsInput:", 0LL);
    }
    else {
      -[BTAudioSmartRouteSession setIsOutput:](session, "setIsOutput:", 0LL);
    }
    uint64_t v17 = (os_log_s *)qword_95A98;
    if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v18 = @"Input";
      }
      else {
        uint64_t v18 = @"Output";
      }
      if (-[BTAudioSmartRouteSession isInput](self->_session, "isInput")) {
        char v19 = @"true";
      }
      else {
        char v19 = @"false";
      }
      unsigned int v20 = -[BTAudioSmartRouteSession isOutput](self->_session, "isOutput");
      *(_DWORD *)int v23 = 138413314;
      if (v20) {
        v21 = @"true";
      }
      else {
        v21 = @"false";
      }
      *(void *)&v23[4] = a3;
      __int16 v24 = 1024;
      int v25 = 0;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2112;
      int v31 = v21;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "updateSession stopIO %@ isStart %d isInput %@ SInput %@, SOutput %@",  v23,  0x30u);
    }

    if (!-[BTAudioSmartRouteSession isInput](self->_session, "isInput", *(void *)v23)
      && !-[BTAudioSmartRouteSession isOutput](self->_session, "isOutput"))
    {

      __int16 v22 = (os_log_s *)qword_95A98;
      if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v23 = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "updateSession Release Session", v23, 2u);
      }

      self->_session = 0LL;
    }
  }

- (int)ownership
{
  return self->_ownership;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end