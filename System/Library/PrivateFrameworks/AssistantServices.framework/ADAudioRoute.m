@interface ADAudioRoute
- (ADAudioRoute)initWithAudioDeviceID:(unsigned int)a3;
- (BOOL)isBluetooth;
- (NSString)destination;
- (NSString)deviceName;
- (NSString)source;
- (NSString)uid;
@end

@implementation ADAudioRoute

- (ADAudioRoute)initWithAudioDeviceID:(unsigned int)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADAudioRoute;
  v4 = -[ADAudioRoute init](&v23, "init");
  if (!v4) {
    return v4;
  }
  v29 = 0LL;
  uint64_t v30 = (uint64_t)&v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100067698;
  v33 = sub_1000676A8;
  id v34 = 0LL;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  uint64_t v26 = (uint64_t)sub_100068404;
  v27 = &unk_1004EEE28;
  v28 = &v29;
  sub_100068470(a3, 0x676C6F626C6D6F64LL, 0, &v24);
  v5 = (NSString *)*(id *)(v30 + 40);
  _Block_object_dispose(&v29, 8);

  deviceName = v4->_deviceName;
  v4->_deviceName = v5;

  v29 = 0LL;
  uint64_t v30 = (uint64_t)&v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100067698;
  v33 = sub_1000676A8;
  id v34 = 0LL;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  uint64_t v26 = (uint64_t)sub_1000685B0;
  v27 = &unk_1004EEE28;
  v28 = &v29;
  sub_100068470(a3, 0x676C6F6275696420LL, 0, &v24);
  id v7 = *(id *)(v30 + 40);
  _Block_object_dispose(&v29, 8);

  v8 = (NSString *)[v7 mutableCopy];
  uid = v4->_uid;
  v4->_uid = v8;

  v24 = 0LL;
  uint64_t v25 = (uint64_t)&v24;
  uint64_t v26 = 0x2020000000LL;
  LODWORD(v27) = 0;
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  uint64_t v31 = (uint64_t)sub_10006861C;
  v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004EEE50;
  v33 = (void (*)(uint64_t))&v24;
  sub_10006862C(a3, 0x676C6F627472616ELL, 0, &v29);
  int v10 = *(_DWORD *)(v25 + 24);
  _Block_object_dispose(&v24, 8);
  BOOL v12 = v10 == 1651275109 || v10 == 1651271009;
  v4->_isBluetooth = v12;
  if (sub_10006875C(a3))
  {
    v24 = 0LL;
    uint64_t v25 = (uint64_t)&v24;
    uint64_t v26 = 0x2020000000LL;
    LODWORD(v27) = 0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    uint64_t v31 = (uint64_t)sub_100068810;
    v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004EEE50;
    v33 = (void (*)(uint64_t))&v24;
    sub_10006862C(a3, 0x696E707473737263LL, 0, &v29);
    int v13 = *(_DWORD *)(v25 + 24);
    _Block_object_dispose(&v24, 8);
    if (v10 <= 1651275108)
    {
      if (!v10)
      {
        v14 = 0LL;
        goto LABEL_25;
      }

      if (v10 == 1651274862)
      {
        v15 = @"MicrophoneWired";
        if (v13 != 1701669219) {
          v15 = 0LL;
        }
        if (v13 == 1768778083) {
          v14 = @"MicrophoneBuiltIn";
        }
        else {
          v14 = (__CFString *)v15;
        }
        goto LABEL_25;
      }
    }

    else
    {
      switch(v10)
      {
        case 1651275109:
          v14 = @"BluetoothHFP";
          goto LABEL_25;
        case 1818848869:
          v14 = @"LineIn";
          goto LABEL_25;
        case 1970496032:
          v14 = @"USBAudio";
LABEL_25:
          objc_storeStrong((id *)&v4->_source, v14);
          goto LABEL_26;
      }
    }

    v14 = @"ADAudioSessionPortOther";
    goto LABEL_25;
  }

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)uid
{
  return self->_uid;
}

- (BOOL)isBluetooth
{
  return self->_isBluetooth;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
}

@end