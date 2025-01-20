@interface CLRouteListener
- (id).cxx_construct;
- (id)initInUniverse:(id)a3 withDelegate:(INotifier *)a4;
- (void)clearLocationData;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)logRoute:(id)a3;
- (void)logState:(id)a3;
- (void)logTransitRoute:(id)a3;
- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4;
- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4;
- (void)navigationListener:(id)a3 didUpdateTransitSummary:(id)a4;
- (void)notifyFromLastInfo;
- (void)onDarwinNotification:(int)a3 data:(id)a4;
@end

@implementation CLRouteListener

- (id)initInUniverse:(id)a3 withDelegate:(INotifier *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLRouteListener;
  v6 = -[CLRouteListener init](&v13, "init");
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    v6->_parentNotifier = a4;
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_silo = (CLDispatchSilo *)[a3 silo];
    *(_BYTE *)(v7 + 8) = 0;
    *(_OWORD *)(v7 + 24) = xmmword_1012E0070;
    *(_OWORD *)(v7 + 40) = xmmword_1012EFEF0;
    *(void *)(v7 + 16) = -[GEONavigationListener initWithQueue:]( [GEONavigationListener alloc],  "initWithQueue:",  [*(id *)(v7 + 80) queue]);
    sub_100EE2800((uint64_t)sub_100511468, v7, *(void **)(v7 + 72), &v12);
    uint64_t v8 = v12;
    uint64_t v12 = 0LL;
    uint64_t v9 = *(void *)(v7 + 64);
    *(void *)(v7 + 64) = v8;
    if (v9)
    {
      (*(void (**)(uint64_t))(*(void *)v9 + 8LL))(v9);
      uint64_t v10 = v12;
      uint64_t v12 = 0LL;
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
      }
    }

    [*(id *)(*(void *)(v7 + 64) + 16) register:*(void *)(*(void *)(v7 + 64) + 8) forNotification:8 registrationInfo:0];
  }

  return (id)v7;
}

- (void)dealloc
{
  self->_geoNavListener = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRouteListener;
  -[CLRouteListener dealloc](&v3, "dealloc");
}

- (void)enable
{
  if (self->_enabled) {
    sub_10123C57C();
  }
  -[GEONavigationListener setDelegate:](self->_geoNavListener, "setDelegate:", self);
  self->_enabled = 1;
  -[GEONavigationListener requestRouteSummary](self->_geoNavListener, "requestRouteSummary");
  -[GEONavigationListener requestTransitSummary](self->_geoNavListener, "requestTransitSummary");
  -[GEONavigationListener requestGuidanceState](self->_geoNavListener, "requestGuidanceState");
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10183E788);
  }
  objc_super v3 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Enabled", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "CLC: Enabled",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener enable]", "%s\n", v4);
  }

- (void)disable
{
  if (self->_enabled)
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    objc_super v3 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Disable", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      v7[0] = 0;
      v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "CLC: Disable",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener disable]", "%s\n", v5);
    }

    self->_enabled = 0;
    -[GEONavigationListener setDelegate:](self->_geoNavListener, "setDelegate:", 0LL);
  }

  else
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    v4 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#Warning CLC: Disable CLRouteListener when already disabled, shutdown?",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      v7[0] = 0;
      v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "#Warning CLC: Disable CLRouteListener when already disabled, shutdown?",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener disable]", "%s\n", v6);
    }
  }

- (void)clearLocationData
{
  self->_lastEtaInSeconds = -1.0;
  self->_lastCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_1012EFEF0;
}

- (void)notifyFromLastInfo
{
  if (self->_lastEtaInSeconds != -1.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v4 = self->_lastEtaInSeconds + self->_lastEtaAbsTime;
    if (Current < v4)
    {
      double v5 = v4 - Current;
      self->_lastEtaInSeconds = v5;
      self->_lastEtaAbsTime = Current;
      (*((void (**)(INotifier *, $AB5116BA7E623E054F959CECB034F4E7 *, double))self->_parentNotifier->var0 + 2))( self->_parentNotifier,  &self->_lastCoordinate,  v5);
      return;
    }

    self->_lastEtaInSeconds = -1.0;
  }

  (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10183E788);
  }
  v6 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enabled = self->_enabled;
    BOOL v8 = [a4 transportType] == 1;
    unsigned int v9 = [a4 hasDestination];
    BOOL v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    BOOL v34 = enabled;
    __int16 v35 = 1026;
    BOOL v36 = v8;
    __int16 v37 = 1026;
    unsigned int v38 = v9;
    __int16 v39 = 1026;
    BOOL v40 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CLC: Received a route, %{public}d,%{public}d,%{public}d,%{public}d",  buf,  0x1Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    uint64_t v18 = qword_101934838;
    BOOL v19 = self->_enabled;
    BOOL v20 = [a4 transportType] == 1;
    unsigned int v21 = [a4 hasDestination];
    BOOL v22 = self->_lastEtaInSeconds == -1.0;
    v26[0] = 67240960;
    v26[1] = v19;
    __int16 v27 = 1026;
    BOOL v28 = v20;
    __int16 v29 = 1026;
    unsigned int v30 = v21;
    __int16 v31 = 1026;
    BOOL v32 = v22;
    v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  0LL,  "CLC: Received a route, %{public}d,%{public}d,%{public}d,%{public}d",  v26,  26);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener navigationListener:didUpdateRouteSummary:]", "%s\n", v23);
  }

  if (self->_enabled)
  {
    -[CLRouteListener logRoute:](self, "logRoute:", a4);
    if ([a4 transportType] == 1)
    {
      [a4 travelTime];
      self->_lastEtaInSeconds = v11;
      self->_lastEtaAbsTime = CFAbsoluteTimeGetCurrent();
      if ([a4 hasDestination])
      {
        objc_msgSend(objc_msgSend(objc_msgSend(a4, "destination"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v12;
        id v13 = [a4 destination];
      }

      else
      {
        if (![a4 hasOrigin])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          v16 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#Warning CLC: Starting route without an appoximate location",  buf,  2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            LOWORD(v26[0]) = 0;
            LODWORD(v25) = 2;
            v24 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "#Warning CLC: Starting route without an appoximate location",  v26,  v25);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLRouteListener navigationListener:didUpdateRouteSummary:]",  "%s\n",  v24);
          }

          goto LABEL_20;
        }

        objc_msgSend(objc_msgSend(objc_msgSend(a4, "origin"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v14;
        id v13 = [a4 origin];
      }

      objc_msgSend(objc_msgSend(v13, "latLng"), "lng");
      self->_lastCoordinate.longitude = v15;
LABEL_20:
      parentNotifier = self->_parentNotifier;
      [a4 travelTime];
      (*((void (**)(INotifier *, $AB5116BA7E623E054F959CECB034F4E7 *))parentNotifier->var0 + 2))( parentNotifier,  &self->_lastCoordinate);
      return;
    }

    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }

- (void)navigationListener:(id)a3 didUpdateTransitSummary:(id)a4
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10183E788);
  }
  v6 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLC: Received a transit route", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    v8[0] = 0;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: Received a transit route",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener navigationListener:didUpdateTransitSummary:]", "%s\n", v7);
  }

  if (self->_enabled) {
    -[CLRouteListener logTransitRoute:](self, "logTransitRoute:", a4);
  }
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10183E788);
  }
  v6 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enabled = self->_enabled;
    BOOL v8 = [a4 guidanceLevel] != 2;
    unsigned int v9 = [a4 hasGuidanceLevel];
    BOOL v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    BOOL v33 = enabled;
    __int16 v34 = 1026;
    BOOL v35 = v8;
    __int16 v36 = 1026;
    unsigned int v37 = v9;
    __int16 v38 = 1026;
    BOOL v39 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CLC: Received a state change, %{public}d,%{public}d,%{public}d,%{public}d",  buf,  0x1Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    uint64_t v17 = qword_101934838;
    BOOL v18 = self->_enabled;
    BOOL v19 = [a4 guidanceLevel] != 2;
    unsigned int v20 = [a4 hasGuidanceLevel];
    BOOL v21 = self->_lastEtaInSeconds == -1.0;
    int v24 = 67240960;
    BOOL v25 = v18;
    __int16 v26 = 1026;
    BOOL v27 = v19;
    __int16 v28 = 1026;
    unsigned int v29 = v20;
    __int16 v30 = 1026;
    BOOL v31 = v21;
    BOOL v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  0LL,  "CLC: Received a state change, %{public}d,%{public}d,%{public}d,%{public}d",  &v24,  26);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener navigationListener:didUpdateGuidanceState:]", "%s\n", v22);
  }

  if (self->_enabled)
  {
    -[CLRouteListener logState:](self, "logState:", a4);
    if (self->_lastEtaInSeconds != -1.0
      && [a4 hasGuidanceLevel]
      && [a4 guidanceLevel] != 2)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }

    if ([a4 hasNavigationState])
    {
      parentNotifier = self->_parentNotifier;
      id v12 = [a4 navigationState];
      int v13 = (int)v12;
      if (v12 >= 9)
      {
        if (qword_101934830 != -1) {
          dispatch_once(&qword_101934830, &stru_10183E788);
        }
        double v15 = (os_log_s *)qword_101934838;
        if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          BOOL v33 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CLC: Received a unsupported GEONavigationState, %d",  buf,  8u);
        }

        BOOL v16 = sub_1002921D0(115, 0);
        id v14 = 0LL;
        if (v16)
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          int v24 = 67109120;
          BOOL v25 = v13;
          v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  16LL,  "CLC: Received a unsupported GEONavigationState, %d",  &v24);
          sub_10029211C( "Generic",  1LL,  0,  0LL,  "CLClientNavigationState GEONavigationStateToCLClientNavigationState(const GEONavigationState)",  "%s\n",  v23);
          id v14 = 0LL;
        }
      }

      else
      {
        id v14 = v12;
      }

      (*((void (**)(INotifier *, id))parentNotifier->var0 + 4))(parentNotifier, v14);
    }
  }

- (void)logRoute:(id)a3
{
  if ([a3 hasTransportType])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    double v4 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v5 = [a3 transportType];
      id v6 = [a3 transportType];
      else {
        uint64_t v7 = off_10183E810[(int)v6];
      }
      *(_DWORD *)buf = 67174915;
      LODWORD(v31[0]) = v5;
      WORD2(v31[0]) = 2113;
      *(void *)((char *)v31 + 6) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "CLC: Route type        : %{private}d, %{private}@",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v14 = qword_101934838;
      unsigned int v15 = [a3 transportType];
      id v16 = [a3 transportType];
      else {
        uint64_t v17 = off_10183E810[(int)v16];
      }
      int v28 = 67174915;
      LODWORD(v29[0]) = v15;
      WORD2(v29[0]) = 2113;
      *(void *)((char *)v29 + 6) = v17;
      __int16 v26 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  2LL,  "CLC: Route type        : %{private}d, %{private}@",  &v28,  18);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logRoute:]", "%s\n", v26);
    }
  }

  if ([a3 hasOrigin])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    BOOL v8 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v31[0] = "Has origin";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLC: Route origin      : %{public}s", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      int v28 = 136446210;
      v29[0] = "Has origin";
      LODWORD(v27) = 12;
      BOOL v18 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: Route origin      : %{public}s",  &v28,  v27);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logRoute:]", "%s\n", v18);
    }
  }

  if ([a3 hasDestination])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    unsigned int v9 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v31[0] = "Has destination";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Route destination : %{public}s", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      int v28 = 136446210;
      v29[0] = "Has destination";
      LODWORD(v27) = 12;
      BOOL v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: Route destination : %{public}s",  &v28,  v27);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logRoute:]", "%s\n", v19);
    }
  }

  if ([a3 hasDestinationName])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    BOOL v10 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [a3 destinationName];
      *(_DWORD *)buf = 138477827;
      v31[0] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "CLC: Route dest name   : %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v20 = qword_101934838;
      id v21 = [a3 destinationName];
      int v28 = 138477827;
      v29[0] = v21;
      LODWORD(v27) = 12;
      BOOL v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  2LL,  "CLC: Route dest name   : %{private}@",  &v28,  v27);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logRoute:]", "%s\n", v22);
    }
  }

  if ([a3 hasTravelTime])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    id v12 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      [a3 travelTime];
      *(_DWORD *)buf = 134283521;
      v31[0] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "CLC: Route travel time : %{private}.01lf",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v23 = qword_101934838;
      [a3 travelTime];
      int v28 = 134283521;
      v29[0] = v24;
      LODWORD(v27) = 12;
      BOOL v25 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  2LL,  "CLC: Route travel time : %{private}.01lf",  &v28,  v27);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logRoute:]", "%s\n", v25);
    }
  }

- (void)logTransitRoute:(id)a3
{
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v3 = [a3 possibleStops];
  id v4 = [v3 countByEnumeratingWithState:&v94 objects:v103 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v95;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v95 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)v7);
        if (qword_101934830 != -1) {
          dispatch_once(&qword_101934830, &stru_10183E788);
        }
        unsigned int v9 = (os_log_s *)qword_101934838;
        if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Transit Stop:", buf, 2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          LOWORD(v99) = 0;
          LODWORD(v87) = 2;
          uint64_t v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: Transit Stop:",  &v99,  v87);
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v17);
        }

        if ([v8 hasStopID])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          BOOL v10 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [v8 stopID];
            *(_DWORD *)buf = 134283521;
            id v102 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v18 = qword_101934838;
            id v19 = [v8 stopID];
            int v99 = 134283521;
            id v100 = v19;
            LODWORD(v87) = 12;
            uint64_t v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  2LL,  "CLC:     ID  : %{private}llu",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v20);
          }
        }

        if ([v8 hasCoordinate])
        {
          id v12 = [v8 coordinate];
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          uint64_t v13 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            [v12 lat];
            *(_DWORD *)buf = 134283521;
            id v102 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLC:     LAT : %{private}lf", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v21 = qword_101934838;
            [v12 lat];
            int v99 = 134283521;
            id v100 = v22;
            LODWORD(v87) = 12;
            uint64_t v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  2LL,  "CLC:     LAT : %{private}lf",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v23);
          }

          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          unsigned int v15 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            [v12 lng];
            *(_DWORD *)buf = 134283521;
            id v102 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLC:     LON : %{private}lf", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v24 = qword_101934838;
            [v12 lng];
            int v99 = 134283521;
            id v100 = v25;
            LODWORD(v87) = 12;
            __int16 v26 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v24,  2LL,  "CLC:     LON : %{private}lf",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v26);
          }
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v27 = [v3 countByEnumeratingWithState:&v94 objects:v103 count:16];
      id v5 = v27;
    }

    while (v27);
  }

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id obja = [a3 scheduledLinks];
  id v28 = [obja countByEnumeratingWithState:&v90 objects:v98 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v91;
    do
    {
      BOOL v31 = 0LL;
      do
      {
        if (*(void *)v91 != v30) {
          objc_enumerationMutation(obja);
        }
        BOOL v32 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)v31);
        if (qword_101934830 != -1) {
          dispatch_once(&qword_101934830, &stru_10183E788);
        }
        BOOL v33 = (os_log_s *)qword_101934838;
        if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "CLC: Transit Link:", buf, 2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          LOWORD(v99) = 0;
          LODWORD(v87) = 2;
          v56 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: Transit Link:",  &v99,  v87);
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v56);
        }

        if ([v32 hasLineID])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          __int16 v34 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            id v35 = [v32 lineID];
            *(_DWORD *)buf = 134283521;
            id v102 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v57 = qword_101934838;
            id v58 = [v32 lineID];
            int v99 = 134283521;
            id v100 = v58;
            LODWORD(v87) = 12;
            v59 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v57,  2LL,  "CLC:     ID  : %{private}llu",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v59);
          }
        }

        if ([v32 hasScheduledDeparture])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          __int16 v36 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            [v32 scheduledDeparture];
            *(_DWORD *)buf = 134283521;
            id v102 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "CLC:     DEP : %{private}lf", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v60 = qword_101934838;
            [v32 scheduledDeparture];
            int v99 = 134283521;
            id v100 = v61;
            LODWORD(v87) = 12;
            v62 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v60,  2LL,  "CLC:     DEP : %{private}lf",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v62);
          }
        }

        if ([v32 hasScheduledArrival])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          __int16 v38 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            [v32 scheduledArrival];
            *(_DWORD *)buf = 134283521;
            id v102 = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "CLC:     ARR : %{private}lf", buf, 0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            uint64_t v63 = qword_101934838;
            [v32 scheduledArrival];
            int v99 = 134283521;
            id v100 = v64;
            LODWORD(v87) = 12;
            v65 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v63,  2LL,  "CLC:     ARR : %{private}lf",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v65);
          }
        }

        if ([v32 hasStopFrom])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          BOOL v40 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "CLC:     Stop From :", buf, 2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            LOWORD(v99) = 0;
            LODWORD(v87) = 2;
            v66 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC:     Stop From :",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v66);
          }

          if (objc_msgSend(objc_msgSend(v32, "stopFrom"), "hasStopID"))
          {
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v41 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              id v42 = objc_msgSend(objc_msgSend(v32, "stopFrom"), "stopID");
              *(_DWORD *)buf = 134283521;
              id v102 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "CLC:         ID  : %{private}llu",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v68 = qword_101934838;
              id v69 = objc_msgSend(objc_msgSend(v32, "stopFrom"), "stopID");
              int v99 = 134283521;
              id v100 = v69;
              LODWORD(v87) = 12;
              v70 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v68,  2LL,  "CLC:         ID  : %{private}llu",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v70);
            }
          }

          if (objc_msgSend(objc_msgSend(v32, "stopFrom"), "hasCoordinate"))
          {
            id v43 = objc_msgSend(objc_msgSend(v32, "stopFrom"), "coordinate");
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v44 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              [v43 lat];
              *(_DWORD *)buf = 134283521;
              id v102 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "CLC:         LAT : %{private}lf",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v71 = qword_101934838;
              [v43 lat];
              int v99 = 134283521;
              id v100 = v72;
              LODWORD(v87) = 12;
              v73 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v71,  2LL,  "CLC:         LAT : %{private}lf",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v73);
            }

            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v46 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              [v43 lng];
              *(_DWORD *)buf = 134283521;
              id v102 = v47;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "CLC:         LON : %{private}lf",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v74 = qword_101934838;
              [v43 lng];
              int v99 = 134283521;
              id v100 = v75;
              LODWORD(v87) = 12;
              v76 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v74,  2LL,  "CLC:         LON : %{private}lf",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v76);
            }
          }
        }

        if ([v32 hasStopTo])
        {
          if (qword_101934830 != -1) {
            dispatch_once(&qword_101934830, &stru_10183E788);
          }
          v48 = (os_log_s *)qword_101934838;
          if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "CLC:     Stop To :", buf, 2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            LOWORD(v99) = 0;
            LODWORD(v87) = 2;
            v67 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC:     Stop To :",  &v99,  v87);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v67);
          }

          if (objc_msgSend(objc_msgSend(v32, "stopTo"), "hasStopID"))
          {
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v49 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              id v50 = objc_msgSend(objc_msgSend(v32, "stopTo"), "stopID");
              *(_DWORD *)buf = 134283521;
              id v102 = v50;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "CLC:         ID  : %{private}llu",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v77 = qword_101934838;
              id v78 = objc_msgSend(objc_msgSend(v32, "stopTo"), "stopID");
              int v99 = 134283521;
              id v100 = v78;
              LODWORD(v87) = 12;
              v79 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v77,  2LL,  "CLC:         ID  : %{private}llu",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v79);
            }
          }

          if (objc_msgSend(objc_msgSend(v32, "stopFrom"), "hasCoordinate"))
          {
            id v51 = objc_msgSend(objc_msgSend(v32, "stopTo"), "coordinate");
            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v52 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              [v51 lat];
              *(_DWORD *)buf = 134283521;
              id v102 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "CLC:         LAT : %{private}lf",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v80 = qword_101934838;
              [v51 lat];
              int v99 = 134283521;
              id v100 = v81;
              LODWORD(v87) = 12;
              v82 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v80,  2LL,  "CLC:         LAT : %{private}lf",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v82);
            }

            if (qword_101934830 != -1) {
              dispatch_once(&qword_101934830, &stru_10183E788);
            }
            v54 = (os_log_s *)qword_101934838;
            if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
            {
              [v51 lng];
              *(_DWORD *)buf = 134283521;
              id v102 = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "CLC:         LON : %{private}lf",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934830 != -1) {
                dispatch_once(&qword_101934830, &stru_10183E788);
              }
              uint64_t v83 = qword_101934838;
              [v51 lng];
              int v99 = 134283521;
              id v100 = v84;
              LODWORD(v87) = 12;
              v85 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v83,  2LL,  "CLC:         LON : %{private}lf",  &v99,  v87);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logTransitRoute:]", "%s\n", v85);
            }
          }
        }

        BOOL v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      id v86 = [obja countByEnumeratingWithState:&v90 objects:v98 count:16];
      id v29 = v86;
    }

    while (v86);
  }

- (void)logState:(id)a3
{
  if ([a3 hasGuidanceLevel])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    id v4 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [a3 guidanceLevel];
      else {
        uint64_t v6 = off_10183E7A8[(int)v5];
      }
      *(_DWORD *)buf = 138543362;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLC: Guidance Level   : %{public}@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v13 = qword_101934838;
      id v14 = [a3 guidanceLevel];
      else {
        unsigned int v15 = off_10183E7A8[(int)v14];
      }
      int v26 = 138543362;
      id v27 = v15;
      BOOL v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  2LL,  "CLC: Guidance Level   : %{public}@",  &v26,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logState:]", "%s\n", v22);
    }
  }

  if ([a3 hasNavigationState])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    uint64_t v7 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a3 navigationState];
      else {
        unsigned int v9 = off_10183E7C8[(int)v8];
      }
      *(_DWORD *)buf = 138543362;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLC: Navigation State : %{public}@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v16 = qword_101934838;
      id v17 = [a3 navigationState];
      else {
        uint64_t v18 = off_10183E7C8[(int)v17];
      }
      int v26 = 138543362;
      id v27 = v18;
      LODWORD(v25) = 12;
      uint64_t v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v16,  2LL,  "CLC: Navigation State : %{public}@",  &v26,  v25);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logState:]", "%s\n", v23);
    }
  }

  if ([a3 hasTrackedTransportType])
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    BOOL v10 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [a3 trackedTransportType];
      else {
        id v12 = off_10183E810[(int)v11];
      }
      *(_DWORD *)buf = 138477827;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "CLC: Transport Type   : %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      uint64_t v19 = qword_101934838;
      id v20 = [a3 trackedTransportType];
      else {
        uint64_t v21 = off_10183E810[(int)v20];
      }
      int v26 = 138477827;
      id v27 = v21;
      LODWORD(v25) = 12;
      uint64_t v24 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  2LL,  "CLC: Transport Type   : %{private}@",  &v26,  v25);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener logState:]", "%s\n", v24);
    }
  }

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  if (a3 == 8)
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183E788);
    }
    id v5 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLC: navigation stopped", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183E788);
      }
      v7[0] = 0;
      uint64_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "CLC: navigation stopped",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRouteListener onDarwinNotification:data:]", "%s\n", v6);
    }

    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }

- (void).cxx_destruct
{
  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0LL;
  return self;
}

@end