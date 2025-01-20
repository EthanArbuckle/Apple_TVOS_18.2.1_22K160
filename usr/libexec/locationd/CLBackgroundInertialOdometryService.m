@interface CLBackgroundInertialOdometryService
+ (BOOL)isAvailable;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLBackgroundInertialOdometryService)init;
- (NSArray)attitude;
- (NSMutableSet)activeClients;
- (id).cxx_construct;
- (id)sessionForClient:(id)a3;
- (void)beginService;
- (void)dealloc;
- (void)endService;
- (void)isAvailableWithReply:(id)a3;
- (void)onBackgroundBatchData:(const BackgroundInertialOdometryBatch *)a3;
- (void)setActiveClients:(id)a3;
- (void)setAttitude:(id)a3;
- (void)startBackgroundInertialOdometryUpdatesForClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5;
- (void)stopBackgroundInertialOdometryUpdatesForClient:(id)a3;
- (void)toggleUpdates;
@end

@implementation CLBackgroundInertialOdometryService

+ (BOOL)isAvailable
{
  uint64_t v2 = sub_1004F2598();
  char v3 = sub_1004F9770(v2);
  if ((v3 & 1) == 0)
  {
    if (qword_101934790 != -1) {
      dispatch_once(&qword_101934790, &stru_101836450);
    }
    v4 = (os_log_s *)qword_101934798;
    if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Background InertialOdometry not supported",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934790 != -1) {
        dispatch_once(&qword_101934790, &stru_101836450);
      }
      v7[0] = 0;
      v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934798,  16LL,  "Background InertialOdometry not supported",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLBackgroundInertialOdometryService isAvailable]", "%s\n", v6);
    }
  }

  return v3;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995680 != -1) {
    dispatch_once(&qword_101995680, &stru_101836410);
  }
  return (id)qword_101995678;
}

- (CLBackgroundInertialOdometryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBackgroundInertialOdometryService;
  return -[CLBackgroundInertialOdometryService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceProtocol,  &OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceClientProtocol);
}

- (void)dealloc
{
  self->_activeClients = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBackgroundInertialOdometryService;
  -[CLBackgroundInertialOdometryService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  if (!self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    id v3 = objc_msgSend(-[CLBackgroundInertialOdometryService universe](self, "universe"), "silo");
    v4 = (Dispatcher *)operator new(0x38uLL);
    sub_1003DE40C(v4, v3, (uint64_t)sub_1003DD3BC, (uint64_t)self, 0LL);
    value = self->_backgroundBatchDispatcher.__ptr_.__value_;
    self->_backgroundBatchDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v6 = sub_100358938(0);
    sub_1006DCB40(v6, 51, (uint64_t)self->_backgroundBatchDispatcher.__ptr_.__value_, -1.0);
  }

  -[CLBackgroundInertialOdometryService setActiveClients:]( self,  "setActiveClients:",  objc_alloc_init(&OBJC_CLASS___NSMutableSet));
  -[CLBackgroundInertialOdometryService setAttitude:](self, "setAttitude:", 0LL);
  if (!self->_geomagneticModelClient.__ptr_.__value_)
  {
    id v7 = -[CLBackgroundInertialOdometryService universe](self, "universe");
    v8 = operator new(0x18uLL);
    v8[1] = 0LL;
    v8[2] = 0LL;
    void *v8 = v7;
    sub_1003DE94C(&self->_geomagneticModelClient, v8);
  }

  self->_isStatic = 0;
  self->_rotationArbitraryToTrueNorth = 0.0;
  self->_double trajectorySampleInterval = 0.0;
  *(_DWORD *)buf = 0;
  sub_101206C88(v14, "BackgroundInertialOdometrySampleInterval", buf, 0);
  if (v15 >= 0.1 && v15 <= 10.0)
  {
    self->_double trajectorySampleInterval = v15;
    if (qword_101934790 != -1) {
      dispatch_once(&qword_101934790, &stru_101836450);
    }
    v10 = (os_log_s *)qword_101934798;
    if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_DEFAULT))
    {
      double trajectorySampleInterval = self->_trajectorySampleInterval;
      *(_DWORD *)buf = 134217984;
      double v19 = trajectorySampleInterval;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Background InertialOdometry interval set to %f [s]",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934790 != -1) {
        dispatch_once(&qword_101934790, &stru_101836450);
      }
      double v12 = self->_trajectorySampleInterval;
      int v16 = 134217984;
      double v17 = v12;
      v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934798,  0LL,  "Background InertialOdometry interval set to %f [s]",  COERCE_DOUBLE(&v16));
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBackgroundInertialOdometryService beginService]", "%s\n", v13);
    }
  }

  -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
}

- (void)endService
{
  if (self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100358938(0);
    sub_1006DD2A0(v3, 51, (uint64_t)self->_backgroundBatchDispatcher.__ptr_.__value_);
    value = self->_backgroundBatchDispatcher.__ptr_.__value_;
    self->_backgroundBatchDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
  }

  -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
}

- (void)isAvailableWithReply:(id)a3
{
}

- (void)startBackgroundInertialOdometryUpdatesForClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  if (+[CLBackgroundInertialOdometryService isAvailable]( &OBJC_CLASS___CLBackgroundInertialOdometryService,  "isAvailable"))
  {
    if (-[CLBackgroundInertialOdometryService sessionForClient:](self, "sessionForClient:", a3))
    {
      if (qword_101934790 != -1) {
        dispatch_once(&qword_101934790, &stru_101836450);
      }
      v9 = (os_log_s *)qword_101934798;
      if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Client has already started background InertialOdometry updates",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934790 != -1) {
          dispatch_once(&qword_101934790, &stru_101836450);
        }
        v22[0] = 0;
        v21 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934798,  16LL,  "Client has already started background InertialOdometry updates",  v22,  2);
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLBackgroundInertialOdometryService startBackgroundInertialOdometryUpdatesForClient:withIdentifier:usingReferenceFrame:]",  "%s\n",  v21);
      }
    }

    else
    {
      v10 = -[CLBackgroundInertialOdometryClientSession initWithClient:withIdentifier:usingReferenceFrame:atMachContinuousTime:]( objc_alloc(&OBJC_CLASS___CLBackgroundInertialOdometryClientSession),  "initWithClient:withIdentifier:usingReferenceFrame:atMachContinuousTime:",  a3,  a4,  a5,  sub_101171D4C());
      if (self->_isStatic && -[CLBackgroundInertialOdometryService attitude](self, "attitude"))
      {
        v11 = objc_alloc(&OBJC_CLASS___CMOdometry);
        id v12 = -[NSArray objectAtIndexedSubscript:]( -[CLBackgroundInertialOdometryService attitude](self, "attitude"),  "objectAtIndexedSubscript:",  0LL);
        id v13 = -[NSArray objectAtIndexedSubscript:]( -[CLBackgroundInertialOdometryService attitude](self, "attitude"),  "objectAtIndexedSubscript:",  1LL);
        id v14 = -[NSArray objectAtIndexedSubscript:]( -[CLBackgroundInertialOdometryService attitude](self, "attitude"),  "objectAtIndexedSubscript:",  2LL);
        id v15 = -[NSArray objectAtIndexedSubscript:]( -[CLBackgroundInertialOdometryService attitude](self, "attitude"),  "objectAtIndexedSubscript:",  3LL);
        float rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
        double v17 = sub_101171D4C();
        double v18 = v17;
        *(float *)&double v17 = rotationArbitraryToTrueNorth;
        double v19 = -[CMOdometry initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:]( v11,  "initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quater nionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:",  &off_1018D7378,  &off_1018D7378,  &off_1018D7378,  &off_1018D7378,  &off_1018D7378,  &off_1018D7378,  v17,  v18,  v12,  v13,  v14,  v15,  1LL);
        v20 = v19;
        if (v10->_referenceFrame == 8) {
          -[CMOdometry rotateArbitraryToTrueNorth](v19, "rotateArbitraryToTrueNorth");
        }
        -[CLBackgroundInertialOdometryServiceClientProtocol onBackgroundInertialOdometryState:]( -[CLBackgroundInertialOdometryClientSession client](v10, "client"),  "onBackgroundInertialOdometryState:",  v20);
      }

      -[NSMutableSet addObject:]( -[CLBackgroundInertialOdometryService activeClients](self, "activeClients"),  "addObject:",  v10);

      -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
    }
  }

- (void)stopBackgroundInertialOdometryUpdatesForClient:(id)a3
{
  if (+[CLBackgroundInertialOdometryService isAvailable]( &OBJC_CLASS___CLBackgroundInertialOdometryService,  "isAvailable"))
  {
    id v5 = -[CLBackgroundInertialOdometryService sessionForClient:](self, "sessionForClient:", a3);
    if (v5)
    {
      -[NSMutableSet removeObject:]( -[CLBackgroundInertialOdometryService activeClients](self, "activeClients"),  "removeObject:",  v5);
      -[CLBackgroundInertialOdometryService toggleUpdates](self, "toggleUpdates");
    }

    else
    {
      if (qword_101934790 != -1) {
        dispatch_once(&qword_101934790, &stru_101836450);
      }
      uint64_t v6 = (os_log_s *)qword_101934798;
      if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Client has not started background InertialOdometry updates",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934790 != -1) {
          dispatch_once(&qword_101934790, &stru_101836450);
        }
        v8[0] = 0;
        id v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934798,  16LL,  "Client has not started background InertialOdometry updates",  v8,  2);
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLBackgroundInertialOdometryService stopBackgroundInertialOdometryUpdatesForClient:]",  "%s\n",  v7);
      }
    }
  }

- (void)onBackgroundBatchData:(const BackgroundInertialOdometryBatch *)a3
{
  if (-[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count")
    && a3->var14[1])
  {
    uint64_t v5 = 0LL;
    v69 = a3;
    do
    {
      uint64_t v6 = &a3->var0 + v5;
      int v7 = *((unsigned __int8 *)&a3->var12[4] + v5 + 1);
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472LL;
      v82 = sub_1003DDFF0;
      v83 = &unk_101836430;
      char v84 = v7;
      if (v7)
      {
        if (qword_101934790 != -1) {
          dispatch_once(&qword_101934790, &stru_101836450);
        }
        v8 = (os_log_s *)qword_101934798;
        if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DeviceMotion uninitialized", buf, 2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934790 != -1) {
            dispatch_once(&qword_101934790, &stru_101836450);
          }
          __int16 v80 = 0;
          LODWORD(v54) = 2;
          v53 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934798,  0LL,  "DeviceMotion uninitialized",  &v80,  v54);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBackgroundInertialOdometryService onBackgroundBatchData:]",  "%s\n",  v53);
        }
      }

      uint64_t v9 = v6[201];
      BOOL v10 = v6[201] == 0;
      if (v6[201]) {
        BOOL isStatic = self->_isStatic;
      }
      else {
        BOOL isStatic = 1;
      }
      BOOL v12 = !self->_isStatic;
      uint64_t v13 = 2LL * v10;
      self->_BOOL isStatic = v9;
      if (v12) {
        uint64_t v13 = v9;
      }
      uint64_t v68 = v13;
      uint64_t v55 = v5;
      id v14 = (char *)a3 + 4 * v5;
      LODWORD(v4) = *(_DWORD *)(v14 + 133);
      v66 = v14 + 133;
      v86[0] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4);
      LODWORD(v15) = *(_DWORD *)(v14 + 149);
      v65 = v14 + 149;
      v86[1] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15);
      LODWORD(v16) = *(_DWORD *)(v14 + 165);
      v64 = v14 + 165;
      v86[2] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v16);
      LODWORD(v17) = *(_DWORD *)(v14 + 181);
      v67 = v14 + 181;
      v86[3] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17);
      -[CLBackgroundInertialOdometryService setAttitude:]( self,  "setAttitude:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v86, 4LL));
      double v4 = *(float *)((char *)&a3->var12[2] + 1) - *((double *)self->_geomagneticModelClient.__ptr_.__value_ + 1);
      *(float *)&double v4 = v4;
      self->_float rotationArbitraryToTrueNorth = *(float *)&v4;
      if (!isStatic || !self->_isStatic)
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        obj = -[CLBackgroundInertialOdometryService activeClients](self, "activeClients");
        id v71 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v85,  16LL);
        if (v71)
        {
          uint64_t v63 = *(void *)v77;
          double v18 = (char *)&v69->var4[2] + v55 + 1;
          double v19 = (char *)v69 + 4 * v55;
          v58 = v19 + 33;
          v57 = v19 + 49;
          v56 = v19 + 65;
          v62 = v19 + 85;
          v60 = v19 + 117;
          v61 = v19 + 101;
          do
          {
            for (i = 0LL; i != v71; i = (char *)i + 1)
            {
              if (*(void *)v77 != v63) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
              v74 = objc_alloc(&OBJC_CLASS___CMOdometry);
              if ((*v18 & 1) != 0)
              {
                LODWORD(v22) = *v58;
                v23 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v22);
              }

              else
              {
                v23 = 0LL;
              }

              uint64_t v73 = v82((uint64_t)v81, (uint64_t)v23);
              if ((*v18 & 2) != 0)
              {
                LODWORD(v24) = *v57;
                v25 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v24);
              }

              else
              {
                v25 = 0LL;
              }

              v75 = v21;
              uint64_t v72 = v82((uint64_t)v81, (uint64_t)v25);
              if ((*v18 & 4) != 0)
              {
                LODWORD(v26) = *v56;
                v27 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26);
              }

              else
              {
                v27 = 0LL;
              }

              uint64_t v28 = v82((uint64_t)v81, (uint64_t)v27);
              LODWORD(v29) = *v62;
              v30 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v29);
              uint64_t v31 = v82((uint64_t)v81, (uint64_t)v30);
              LODWORD(v32) = *v61;
              v33 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v32);
              uint64_t v34 = v82((uint64_t)v81, (uint64_t)v33);
              LODWORD(v35) = *v60;
              v36 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v35);
              uint64_t v37 = v82((uint64_t)v81, (uint64_t)v36);
              LODWORD(v38) = *v66;
              v39 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v38);
              uint64_t v40 = v82((uint64_t)v81, (uint64_t)v39);
              LODWORD(v41) = *v65;
              v42 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v41);
              uint64_t v43 = v82((uint64_t)v81, (uint64_t)v42);
              LODWORD(v44) = *v64;
              v45 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v44);
              uint64_t v46 = v82((uint64_t)v81, (uint64_t)v45);
              LODWORD(v47) = *v67;
              v48 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v47);
              uint64_t v49 = v82((uint64_t)v81, (uint64_t)v48);
              *(float *)&double v50 = v50;
              v51 = -[CMOdometry initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:]( v74,  "initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ: quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:",  v73,  v72,  v28,  v31,  v34,  v37,  v50,  (double)*(unint64_t *)(&v69->var0 + 8 * v55 + 1) * 0.000001,  v40,  v43,  v46,  v49,  v68);
              v52 = v51;
              if (v75[1] == 8LL) {
                -[CMOdometry rotateArbitraryToTrueNorth](v51, "rotateArbitraryToTrueNorth");
              }
              objc_msgSend(objc_msgSend(v75, "client"), "onBackgroundInertialOdometryState:", v52);

              double v18 = (char *)&v69->var4[2] + v55 + 1;
            }

            id v71 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v85,  16LL);
          }

          while (v71);
        }
      }

      uint64_t v5 = v55 + 1;
      a3 = v69;
    }

    while (v55 + 1 < (unint64_t)v69->var14[1]);
  }

- (void)toggleUpdates
{
  id v3 = -[NSMutableSet count](-[CLBackgroundInertialOdometryService activeClients](self, "activeClients"), "count");
  if (qword_101934790 != -1) {
    dispatch_once(&qword_101934790, &stru_101836450);
  }
  double v4 = (os_log_s *)qword_101934798;
  if (os_log_type_enabled((os_log_t)qword_101934798, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v11 = -[NSMutableSet count]( -[CLBackgroundInertialOdometryService activeClients](self, "activeClients"),  "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of BIO clients: %{public}d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934790 != -1) {
      dispatch_once(&qword_101934790, &stru_101836450);
    }
    uint64_t v7 = qword_101934798;
    v9[0] = 67240192;
    v9[1] = -[NSMutableSet count]( -[CLBackgroundInertialOdometryService activeClients](self, "activeClients"),  "count");
    v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  0LL,  "Number of BIO clients: %{public}d",  v9,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBackgroundInertialOdometryService toggleUpdates]", "%s\n", v8);
  }

  uint64_t v5 = sub_100358938(0);
  sub_100360224(v5, v3 != 0LL, self->_trajectorySampleInterval);
  value = self->_geomagneticModelClient.__ptr_.__value_;
  if (v3)
  {
    sub_100B5BDCC((uint64_t)value);
  }

  else
  {
    sub_100B5C1BC((uint64_t)value);
    self->_BOOL isStatic = 0;
    -[CLBackgroundInertialOdometryService setAttitude:](self, "setAttitude:", 0LL);
    self->_float rotationArbitraryToTrueNorth = 0.0;
  }

- (id)sessionForClient:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v4 = -[CLBackgroundInertialOdometryService activeClients](self, "activeClients", 0LL);
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
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
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 client] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
}

- (NSArray)attitude
{
  return self->_attitude;
}

- (void)setAttitude:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_backgroundBatchDispatcher.__ptr_.__value_;
  self->_backgroundBatchDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end