@interface NROnDemandLinkSetupManager
- (void)didUpdatePHSState:(BOOL)a3 llphsActive:(BOOL)a4;
@end

@implementation NROnDemandLinkSetupManager

- (void)didUpdatePHSState:(BOOL)a3 llphsActive:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (qword_1001DC680 != -1) {
    dispatch_once(&qword_1001DC680, &stru_1001AE190);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC678, 0LL))
  {
    if (qword_1001DC680 != -1) {
      dispatch_once(&qword_1001DC680, &stru_1001AE190);
    }
    _NRLogWithArgs( qword_1001DC678,  0LL,  "%s%.30s:%-4d received PHS state update phs:%d/llphs:%d",  ",  "-[NROnDemandLinkSetupManager didUpdatePHSState:llphsActive:]"",  439,  v5,  v4);
  }

  if (!self
    || !self->_subscribedForPHSStateUpdates
    || ((self->_isPHSActive ^ v5) & 1) == 0 && self->_isLLPHSActive == v4)
  {
    return;
  }

  self->_isPHSActive = v5;
  self->_isLLPHSActive = v4;
  if (!v5 && !v4)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FED4;
    block[3] = &unk_1001AFED0;
    v9 = queue;
    objc_copyWeak(&v30, &location);
    dispatch_after(v7, v9, block);

    objc_destroyWeak(&v30);
    p_id location = &location;
LABEL_14:
    objc_destroyWeak(p_location);
    return;
  }

  *(_WORD *)&self->_isPHSProvider = 0;
  objc_opt_self(&OBJC_CLASS___NRLinkDirector);
  if (qword_1001DC878 != -1) {
    dispatch_once(&qword_1001DC878, &stru_1001AEED0);
  }
  id v11 = (id)qword_1001DC870;
  v12 = v11;
  if (v11) {
    v13 = (void *)*((void *)v11 + 6);
  }
  else {
    v13 = 0LL;
  }
  id v14 = v13;
  BOOL v15 = sub_100140244((uint64_t)v14);

  uint64_t v16 = 13LL;
  if (!v15) {
    uint64_t v16 = 14LL;
  }
  *((_BYTE *)&self->super.isa + v16) = 1;
  v17 = sub_100146AFC();
  dispatch_async((dispatch_queue_t)v17, &stru_1001AEA40);

  if (self->_phsSource)
  {
    if (self->_isPHSClient) {
      goto LABEL_24;
    }
LABEL_27:
    if (self->_isPHSProvider) {
      sub_1000101B8((uint64_t)self);
    }
    return;
  }

  v18 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  dispatch_time_t v19 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(from, self);
  id location = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472LL;
  v39 = sub_100012558;
  v40 = &unk_1001B0798;
  objc_copyWeak((id *)&v42, from);
  v20 = v18;
  v41 = v20;
  dispatch_source_set_event_handler(v20, &location);
  dispatch_activate(v20);
  phsSource = self->_phsSource;
  self->_phsSource = (OS_dispatch_source *)v20;
  v22 = v20;

  objc_destroyWeak((id *)&v42);
  objc_destroyWeak(from);
  if (!self->_isPHSClient) {
    goto LABEL_27;
  }
LABEL_24:
  if (self->_browserActivated)
  {
    sub_100010098((uint64_t)self);
    return;
  }

  if (!self->_browser)
  {
    v23 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](v23, "setDispatchQueue:", self->_queue);
    -[RPCompanionLinkClient setControlFlags:](v23, "setControlFlags:", 6LL);
    objc_initWeak(&v44, self);
    id location = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472LL;
    v39 = sub_100012258;
    v40 = &unk_1001AE030;
    objc_copyWeak(&v43, &v44);
    v24 = v23;
    v41 = (dispatch_source_s *)v24;
    v42 = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](v24, "setDeviceFoundHandler:", &location);
    from[0] = _NSConcreteStackBlock;
    from[1] = (id)3221225472LL;
    from[2] = sub_100012354;
    from[3] = &unk_1001AE058;
    objc_copyWeak(&v36, &v44);
    v25 = v24;
    v35 = v25;
    -[RPCompanionLinkClient setDeviceLostHandler:](v25, "setDeviceLostHandler:", from);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100012444;
    v31[3] = &unk_1001AE008;
    objc_copyWeak(&v33, &v44);
    v26 = v25;
    v32 = v26;
    -[RPCompanionLinkClient activateWithCompletion:](v26, "activateWithCompletion:", v31);
    browser = self->_browser;
    self->_browser = v26;
    v28 = v26;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v43);
    p_id location = &v44;
    goto LABEL_14;
  }

- (void).cxx_destruct
{
}

@end