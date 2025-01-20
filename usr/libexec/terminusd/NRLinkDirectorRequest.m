@interface NRLinkDirectorRequest
- (NRLinkDirectorRequest)init;
- (id)description;
- (void)dealloc;
@end

@implementation NRLinkDirectorRequest

- (NRLinkDirectorRequest)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NRLinkDirectorRequest;
  v2 = -[NRLinkDirectorRequest init](&v16, "init");
  if (!v2)
  {
    id v7 = sub_100100840();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16LL);

    if (IsLevelEnabled)
    {
      id v9 = sub_100100840();
      _NRLogWithArgs(v9, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRLinkDirectorRequest init]"", 43);
    }

    uint64_t v10 = _os_log_pack_size(12LL);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v12 = __error();
    uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRLinkDirectorRequest init]";
    id v14 = sub_100100840();
    _NRLogAbortWithPack(v14, v11);
  }

  v3 = v2;
  v2->_requiredLinkType = 0;
  cancelIfLinkTypeReady = v2->_cancelIfLinkTypeReady;
  v2->_cancelIfLinkTypeReady = 0LL;

  v3->_type = 0;
  v3->_allowsSuspendedLink = 0;
  do
    unint64_t v5 = __ldxr(&qword_1001DC228);
  while (__stxr(v5 + 1, &qword_1001DC228));
  v3->_uniqueIndex = v5;
  return v3;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = v3;
  if (self)
  {
    unint64_t uniqueIndex = self->_uniqueIndex;
    v6 = "Invalid";
    switch(self->_type)
    {
      case 0u:
        goto LABEL_14;
      case 1u:
        v6 = "UpdateWiFiAddress";
        goto LABEL_14;
      case 2u:
        v6 = "PreferWiFiEnable";
        goto LABEL_14;
      case 3u:
        v6 = "PreferWiFiDisable";
        goto LABEL_14;
      case 4u:
        v6 = "StopWiFi";
        goto LABEL_14;
      case 5u:
        v6 = "SuspendBluetooth";
        goto LABEL_14;
      case 6u:
        v6 = "Timer";
        goto LABEL_14;
      case 7u:
        v6 = "TimerPreferWiFiTimeout";
        goto LABEL_14;
      case 8u:
        v6 = "StopQuickRelay";
        goto LABEL_14;
      case 9u:
        v6 = "PreferWiFiAckEnable";
        goto LABEL_14;
      case 0xAu:
        v6 = "PreferWiFiAckDisable";
        goto LABEL_14;
      case 0xBu:
        v6 = "UpdateAWDLAddress";
        goto LABEL_14;
      default:
        v8 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"[Request %llu %@",  self->_uniqueIndex,  @"Unknown");
        uint64_t requiredLinkType = self->_requiredLinkType;
        if (!self->_requiredLinkType) {
          goto LABEL_17;
        }
        goto LABEL_16;
    }
  }

  unint64_t uniqueIndex = 0LL;
  v6 = "Invalid";
LABEL_14:
  id v7 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v6);
  v8 = -[NSMutableString initWithFormat:](v4, "initWithFormat:", @"[Request %llu %@", uniqueIndex, v7);

  if (self)
  {
    uint64_t requiredLinkType = self->_requiredLinkType;
    if (self->_requiredLinkType)
    {
LABEL_16:
      StringFromNRLinkType = (void *)createStringFromNRLinkType(requiredLinkType);
      -[NSMutableString appendFormat:](v8, "appendFormat:", @" %@", StringFromNRLinkType);
    }

- (void)dealloc
{
  if (qword_1001DC988 != -1) {
    dispatch_once(&qword_1001DC988, &stru_1001AFA58);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC980, 1LL))
  {
    if (qword_1001DC988 != -1) {
      dispatch_once(&qword_1001DC988, &stru_1001AFA58);
    }
    _NRLogWithArgs( qword_1001DC980,  1LL,  "%s%.30s:%-4d Dealloc: %@",  ",  "-[NRLinkDirectorRequest dealloc]"",  113LL,  self);
  }

  if (self)
  {
    source = self->_source;
    if (source)
    {
      dispatch_source_cancel((dispatch_source_t)source);
      v4 = self->_source;
      self->_source = 0LL;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkDirectorRequest;
  -[NRLinkDirectorRequest dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
}

@end