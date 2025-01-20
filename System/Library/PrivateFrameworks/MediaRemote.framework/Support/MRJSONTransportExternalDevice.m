@interface MRJSONTransportExternalDevice
- (BOOL)isPaired;
- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3;
@end

@implementation MRJSONTransportExternalDevice

- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3
{
  uint64_t v3 = qword_1003FDDA0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003FDDA0, &stru_10039DEA8);
  }
  id v5 = objc_alloc(&OBJC_CLASS___MRExternalJSONClientConnection);
  id v6 = [v5 initWithConnection:v4 queue:qword_1003FDD98];

  return v6;
}

- (BOOL)isPaired
{
  return 1;
}

  ;
}

@end