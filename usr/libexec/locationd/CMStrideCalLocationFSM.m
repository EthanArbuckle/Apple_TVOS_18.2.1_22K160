@interface CMStrideCalLocationFSM
- (CMStrideCalLocationFSMDelegate)delegate;
- (int)locationState;
- (int)originDeviceToGpsSource:(int)a3 locationType:(int)a4;
- (void)dealloc;
- (void)feedGpsOdometerData:(const NotificationData *)a3;
- (void)feedLocationData:(const void *)a3;
- (void)feedPedometerData:(const NotificationData *)a3;
- (void)requestTransitionToLocationState:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CMStrideCalLocationFSM

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMStrideCalLocationFSM;
  -[CMStrideCalLocationFSM dealloc](&v3, "dealloc");
}

- (void)requestTransitionToLocationState:(int)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101862B28);
  }
  v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    int fLocationState = self->fLocationState;
    *(_DWORD *)buf = 67109376;
    int v19 = fLocationState;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fLocationState %d state %d", buf, 0xEu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101862B28);
    }
    int v11 = self->fLocationState;
    v15[0] = 67109376;
    v15[1] = v11;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "fLocationState %d state %d",  v15,  14);
    v13 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalLocationFSM requestTransitionToLocationState:]", "%s\n", v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  int v7 = self->fLocationState;
  if (v7 != a3 && (a3 == 1 || v7))
  {
    fTrackFinder = self->fTrackFinder;
    if (a3 < 2)
    {
      -[CalTrackFinder stop](fTrackFinder, "stop");

      self->fTrackFinder = 0LL;
    }

    else if (!fTrackFinder)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___CalTrackFinder);
      self->fTrackFinder = v9;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100973B48;
      v14[3] = &unk_101862B08;
      v14[4] = self;
      -[CalTrackFinder setCalTrackHandler:](v9, "setCalTrackHandler:", v14);
    }

    uint64_t v10 = self->fLocationState;
    self->int fLocationState = a3;
    if ((objc_opt_respondsToSelector( -[CMStrideCalLocationFSM delegate](self, "delegate"),  "fsm:didTransitionFromState:toState:") & 1) != 0) {
      -[CMStrideCalLocationFSMDelegate fsm:didTransitionFromState:toState:]( -[CMStrideCalLocationFSM delegate](self, "delegate"),  "fsm:didTransitionFromState:toState:",  self,  v10,  self->fLocationState);
    }
  }

- (int)originDeviceToGpsSource:(int)a3 locationType:(int)a4
{
  int v6 = sub_1001B9A1C();
  int v7 = 4 * (a4 == 3);
  if (a4 == 1) {
    int v7 = 2;
  }
  if (a4 == 3) {
    int v8 = 3;
  }
  else {
    int v8 = 0;
  }
  if (a4 == 1) {
    int v8 = 1;
  }
  if (a3 != 1) {
    int v8 = 0;
  }
  if (a3 != 2) {
    int v7 = v8;
  }
  if (a4 == 3) {
    int v9 = 3;
  }
  else {
    int v9 = 0;
  }
  if (a4 == 1)
  {
    int v9 = 1;
    int v10 = 2;
  }

  else
  {
    int v10 = 4 * (a4 == 3);
  }

  if (a3 != 1) {
    int v10 = 0;
  }
  if (a3 == 2) {
    int v10 = v9;
  }
  if (v6) {
    return v10;
  }
  else {
    return v7;
  }
}

- (void)feedLocationData:(const void *)a3
{
  if (self->fLocationState >= 2 && (*((_DWORD *)a3 + 24) | 2) == 3)
  {
    int v5 = -[CMStrideCalLocationFSM originDeviceToGpsSource:locationType:]( self,  "originDeviceToGpsSource:locationType:",  *((unsigned int *)a3 + 128));
    if (self->fSource != v5)
    {
      self->fSource = v5;
      if ((objc_opt_respondsToSelector(-[CMStrideCalLocationFSM delegate](self, "delegate"), "fsm:didUpdateSource:") & 1) != 0) {
        -[CMStrideCalLocationFSMDelegate fsm:didUpdateSource:]( -[CMStrideCalLocationFSM delegate](self, "delegate"),  "fsm:didUpdateSource:",  self,  self->fSource);
      }
    }

    double v6 = *(double *)((char *)a3 + 76);
    int v7 = objc_alloc(&OBJC_CLASS___CLLocation);
    __int128 v8 = *((_OWORD *)a3 + 7);
    v12[6] = *((_OWORD *)a3 + 6);
    v12[7] = v8;
    v13[0] = *((_OWORD *)a3 + 8);
    *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)a3 + 140);
    __int128 v9 = *((_OWORD *)a3 + 3);
    v12[2] = *((_OWORD *)a3 + 2);
    v12[3] = v9;
    __int128 v10 = *((_OWORD *)a3 + 5);
    v12[4] = *((_OWORD *)a3 + 4);
    v12[5] = v10;
    __int128 v11 = *((_OWORD *)a3 + 1);
    v12[0] = *(_OWORD *)a3;
    v12[1] = v11;
    -[CalTrackFinder updateGpsLocationBuffer:gpsSource:]( self->fTrackFinder,  "updateGpsLocationBuffer:gpsSource:",  -[CLLocation initWithClientLocation:](v7, "initWithClientLocation:", v12),  self->fSource);
    if ((objc_opt_respondsToSelector( -[CMStrideCalLocationFSM delegate](self, "delegate"),  "fsm:didUpdateLocationAtTime:") & 1) != 0) {
      -[CMStrideCalLocationFSMDelegate fsm:didUpdateLocationAtTime:]( -[CMStrideCalLocationFSM delegate](self, "delegate"),  "fsm:didUpdateLocationAtTime:",  self,  v6);
    }
  }

- (void)feedGpsOdometerData:(const NotificationData *)a3
{
  if (self->fLocationState >= 2)
  {
    __int128 v3 = *((_OWORD *)a3 + 9);
    v9[8] = *((_OWORD *)a3 + 8);
    v9[9] = v3;
    __int128 v4 = *((_OWORD *)a3 + 11);
    v9[10] = *((_OWORD *)a3 + 10);
    v9[11] = v4;
    __int128 v5 = *((_OWORD *)a3 + 5);
    v9[4] = *((_OWORD *)a3 + 4);
    v9[5] = v5;
    __int128 v6 = *((_OWORD *)a3 + 7);
    v9[6] = *((_OWORD *)a3 + 6);
    v9[7] = v6;
    __int128 v7 = *((_OWORD *)a3 + 1);
    v9[0] = *(_OWORD *)a3;
    v9[1] = v7;
    __int128 v8 = *((_OWORD *)a3 + 3);
    v9[2] = *((_OWORD *)a3 + 2);
    v9[3] = v8;
    -[CalTrackFinder updateGpsOdometerBuffer:](self->fTrackFinder, "updateGpsOdometerBuffer:", v9);
  }

- (void)feedPedometerData:(const NotificationData *)a3
{
  if (self->fLocationState >= 2)
  {
    memcpy(v4, a3, sizeof(v4));
    -[CalTrackFinder updatePedometerBuffer:](self->fTrackFinder, "updatePedometerBuffer:", v4);
  }

- (int)locationState
{
  return self->fLocationState;
}

- (CMStrideCalLocationFSMDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalLocationFSMDelegate *)a3;
}

@end