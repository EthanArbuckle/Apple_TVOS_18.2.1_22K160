@interface CLLocationCorrectiveCompensator
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocationCorrectiveCompensator)init;
- (void)beginService;
- (void)endService;
- (void)snapLocation:(id)a3 withReply:(id)a4;
@end

@implementation CLLocationCorrectiveCompensator

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019972E0 != -1) {
    dispatch_once(&qword_1019972E0, &stru_101842938);
  }
  return (id)qword_1019972D8;
}

- (CLLocationCorrectiveCompensator)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationCorrectiveCompensator;
  return -[CLLocationCorrectiveCompensator initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationCorrectiveCompensatorProtocol,  &OBJC_PROTOCOL___CLLocationCorrectiveCompensatorClientProtocol);
}

- (void)beginService
{
  self->_coarseLocationProvider = objc_alloc_init(&OBJC_CLASS___GEOCoarseLocationProvider);
}

- (void)endService
{
  self->_coarseLocationProvider = 0LL;
}

- (void)snapLocation:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v34 = 0u;
    memset(v35, 0, 28);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    memset(buf, 0, sizeof(buf));
  }

  __int128 v26 = v33;
  __int128 v27 = v34;
  *(_OWORD *)v28 = v35[0];
  *(_OWORD *)&v28[12] = *(_OWORD *)((char *)v35 + 12);
  v25[2] = *(_OWORD *)&buf[32];
  v25[3] = v30;
  v25[4] = v31;
  v25[5] = v32;
  v25[0] = *(_OWORD *)buf;
  v25[1] = *(_OWORD *)&buf[16];
  id v6 = objc_msgSend( [GEOLocation alloc],  "initWithGEOCoordinate:",  COERCE_DOUBLE(*(_OWORD *)buf >> 32),  *(double *)((char *)v25 + 12));
  v7 = v6;
  if (v6)
  {
    [v6 setTimestamp:*(double *)((char *)&v25[4] + 12)];
    [v7 setAltitude:(int)*(double *)((char *)&v25[1] + 12)];
    [v7 setHorizontalAccuracy:*(double *)((char *)&v25[1] + 4)];
    [v7 setVerticalAccuracy:*(double *)((char *)&v25[2] + 4)];
    if (*(_DWORD *)&v28[4] == 1) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = 2 * (*(_DWORD *)&v28[4] == 2);
    }
    [v7 setReferenceFrame:v8];
  }

  id v9 = v7;
  if (v9)
  {
    id v10 = v9;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842980);
    }
    v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)buf = 68289539LL;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(void *)&buf[26] = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Location #compensation gonna be Snapping, Input:%{private, location:CLClientLocation}.*P}",  buf,  0x22u);
    }

    coarseLocationProvider = self->_coarseLocationProvider;
    id v13 = objc_msgSend(objc_msgSend(-[CLLocationCorrectiveCompensator universe](self, "universe"), "silo"), "queue");
    v14[1] = 3221225472LL;
    __int128 v21 = v26;
    __int128 v22 = v27;
    v23[0] = *(_OWORD *)v28;
    *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)&v28[12];
    __int128 v17 = v25[2];
    __int128 v18 = v25[3];
    __int128 v19 = v25[4];
    __int128 v20 = v25[5];
    __int128 v15 = v25[0];
    v14[0] = _NSConcreteStackBlock;
    v14[2] = sub_1005D25F4;
    v14[3] = &unk_101842960;
    __int128 v16 = v25[1];
    v14[4] = a4;
    -[GEOCoarseLocationProvider fetchCoarseEquivalentForLocation:callbackQueue:callback:]( coarseLocationProvider,  "fetchCoarseEquivalentForLocation:callbackQueue:callback:",  v10,  v13,  v14);
  }

  else
  {
    v24[6] = xmmword_101339690;
    v24[7] = xmmword_1013396A0;
    memset(&v24[8], 0, 28);
    v24[2] = xmmword_101339650;
    v24[3] = xmmword_101339660;
    v24[4] = xmmword_101339670;
    v24[5] = xmmword_101339680;
    v24[0] = xmmword_101339630;
    v24[1] = xmmword_101339640;
    (*((void (**)(id, CLLocation *, uint64_t, void))a4 + 2))( a4,  -[CLLocation initWithClientLocation:](objc_alloc(&OBJC_CLASS___CLLocation), "initWithClientLocation:", v24),  1LL,  0LL);
  }

@end