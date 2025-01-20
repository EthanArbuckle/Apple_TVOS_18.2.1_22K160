@interface TVCRDConferenceRoomDisplayViewController
- (CGRect)_HUDFrameForPosition:(unint64_t)a3;
- (TVCRDConferenceRoomDisplayViewController)initWithDisplayStyle:(unint64_t)a3;
- (TVSUIConferenceRoomDisplaySmallView)crdSmallView;
- (unint64_t)HUDPosition;
- (unint64_t)style;
- (void)_moveHUDToPosition:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateCRDView;
- (void)_updateHUDPostion;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHUDPosition:(unint64_t)a3;
- (void)startHUDMovement;
- (void)stopHUDMovement;
- (void)viewDidLayoutSubviews;
@end

@implementation TVCRDConferenceRoomDisplayViewController

- (TVCRDConferenceRoomDisplayViewController)initWithDisplayStyle:(unint64_t)a3
{
  SEL v19 = a2;
  unint64_t v18 = a3;
  id location = 0LL;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVCRDConferenceRoomDisplayViewController;
  id location = -[TVCRDConferenceRoomDisplayViewController init](&v17, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    *((void *)location + 3) = v18;
    *((void *)location + 4) = qword_10000DC98;
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    id v16 = +[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface");
    [v16 addObserver:location forKeyPath:@"networkName" options:0 context:off_10000DCA0];
    v3 =  +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance");
    v4 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v3;

    [*((id *)location + 2) addObserver:location forKeyPath:@"conferenceRoomDisplayMessage" options:0 context:off_10000DCA8];
    objc_initWeak(&from, location);
    v21 = @"UserAssignedDeviceName";
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL);
    v7 = &_dispatch_main_q;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_100002608;
    v13 = &unk_100008500;
    objc_copyWeak(&v14, &from);
    MGRegisterForUpdates(v8, 0LL, v7, &v9);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_storeStrong(&v16, 0LL);
  }

  v6 = (TVCRDConferenceRoomDisplayViewController *)location;
  objc_storeStrong(&location, 0LL);
  return v6;
}

- (void)dealloc
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = +[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface");
  [location[0] removeObserver:v4 forKeyPath:@"networkName" context:off_10000DCA0];
  -[PBSConferenceRoomDisplaySettings removeObserver:forKeyPath:context:]( v4->_conferenceRoomDisplaySettings,  "removeObserver:forKeyPath:context:",  v4,  @"conferenceRoomDisplayMessage",  off_10000DCA8);
  if (v4->_HUDPositionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v4->_HUDPositionTimer);
    objc_storeStrong((id *)&v4->_HUDPositionTimer, 0LL);
  }

  objc_storeStrong(location, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVCRDConferenceRoomDisplayViewController;
  -[TVCRDConferenceRoomDisplayViewController dealloc](&v2, "dealloc");
}

- (void)loadView
{
  v13 = self;
  v12[1] = (id)a2;
  if (self->_style == 1)
  {
    v8 = objc_alloc(&OBJC_CLASS___UIView);
    v9 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
    -[UIScreen bounds](v9, "bounds");
    v12[0] = -[UIView initWithFrame:](v8, "initWithFrame:", v2, v3, v4, v5);

    id v10 = v12[0];
    int v11 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    objc_msgSend(v10, "setBackgroundColor:");

    -[TVCRDConferenceRoomDisplayViewController setView:](v13, "setView:", v12[0]);
    v6 = objc_alloc_init(&OBJC_CLASS___TVSUIConferenceRoomDisplaySmallView);
    crdSmallView = v13->_crdSmallView;
    v13->_crdSmallView = v6;

    [v12[0] addSubview:v13->_crdSmallView];
    -[TVCRDConferenceRoomDisplayViewController _moveHUDToPosition:animated:]( v13,  "_moveHUDToPosition:animated:",  qword_10000DC98,  0LL);
    objc_storeStrong(v12, 0LL);
  }

  -[TVCRDConferenceRoomDisplayViewController _updateCRDView](v13, "_updateCRDView");
}

- (void)viewDidLayoutSubviews
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVCRDConferenceRoomDisplayViewController;
  -[TVCRDConferenceRoomDisplayViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  if (v8->_style == 1)
  {
    -[TVCRDConferenceRoomDisplayViewController _HUDFrameForPosition:](v8, "_HUDFrameForPosition:", v8->_HUDPosition);
    -[TVSUIConferenceRoomDisplaySmallView setFrame:](v8->_crdSmallView, "setFrame:", v2, v3, v4, v5);
  }

- (void)startHUDMovement
{
  v15 = (dispatch_object_t *)self;
  location[1] = (id)a2;
  if (!self->_HUDPositionTimer)
  {
    objc_initWeak(location, v15);
    double v5 = &_dispatch_main_q;
    dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
    dispatch_object_t v3 = v15[1];
    v15[1] = v2;

    source = (dispatch_source_s *)v15[1];
    dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(*(double *)&qword_10000DCB0 * 1000000000.0));
    dispatch_source_set_timer(source, v4, (unint64_t)(*(double *)&qword_10000DCB0 * 1000000000.0), 0x3B9ACA00uLL);
    SEL v7 = (dispatch_source_s *)v15[1];
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    int v11 = sub_100002B44;
    v12 = &unk_100008528;
    objc_copyWeak(&v13, location);
    dispatch_source_set_event_handler(v7, &v8);
    dispatch_resume(v15[1]);
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }

- (void)stopHUDMovement
{
  if (self->_HUDPositionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_HUDPositionTimer);
    objc_storeStrong((id *)&self->_HUDPositionTimer, 0LL);
    -[TVCRDConferenceRoomDisplayViewController _moveHUDToPosition:animated:]( self,  "_moveHUDToPosition:animated:",  qword_10000DC98,  1LL);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  int v10 = a6;
  if (a6 == off_10000DCA0 || v10 == off_10000DCA8)
  {
    -[TVCRDConferenceRoomDisplayViewController _updateCRDView](v14, "_updateCRDView");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVCRDConferenceRoomDisplayViewController;
    -[TVCRDConferenceRoomDisplayViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateCRDView
{
  objc_super v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[TVSDevice userDeviceName](&OBJC_CLASS___TVSDevice, "userDeviceName");
  id v2 = +[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface");
  id v4 = [v2 networkName];

  id location =  -[PBSConferenceRoomDisplaySettings conferenceRoomDisplayMessage]( v6->_conferenceRoomDisplaySettings,  "conferenceRoomDisplayMessage");
  if (v6->_style == 1)
  {
    -[TVSUIConferenceRoomDisplaySmallView setDeviceName:](v6->_crdSmallView, "setDeviceName:", v5[0]);
    -[TVSUIConferenceRoomDisplaySmallView setNetworkName:](v6->_crdSmallView, "setNetworkName:", v4);
    -[TVSUIConferenceRoomDisplaySmallView setCustomText:](v6->_crdSmallView, "setCustomText:", location);
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
}

- (void)_updateHUDPostion
{
}

- (void)_moveHUDToPosition:(unint64_t)a3 animated:(BOOL)a4
{
  v25 = self;
  SEL v24 = a2;
  v23 = (void *)a3;
  BOOL v22 = a4;
  -[TVCRDConferenceRoomDisplayViewController setHUDPosition:](self, "setHUDPosition:", a3);
  if (v22)
  {
    objc_initWeak(&location, v25);
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    unint64_t v18 = sub_1000030C0;
    SEL v19 = &unk_100008528;
    objc_copyWeak(&v20, &location);
    objc_super v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_10000311C;
    id v13 = &unk_100008550;
    objc_copyWeak(v14, &location);
    v14[1] = v23;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x20000LL,  &v15,  &v9,  0.4,  0.0);
    objc_destroyWeak(v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  else
  {
    v8 = -[TVCRDConferenceRoomDisplayViewController crdSmallView](v25, "crdSmallView");
    -[TVCRDConferenceRoomDisplayViewController _HUDFrameForPosition:](v25, "_HUDFrameForPosition:", v23);
    -[TVSUIConferenceRoomDisplaySmallView setFrame:](v8, "setFrame:", v4, v5, v6, v7);
  }

- (CGRect)_HUDFrameForPosition:(unint64_t)a3
{
  id v7 = -[TVCRDConferenceRoomDisplayViewController view](self, "view");
  [v7 bounds];
  CGRectGetWidth(v11);

  id v8 = -[TVCRDConferenceRoomDisplayViewController view](self, "view");
  [v8 bounds];
  CGRectGetHeight(v12);

  -[TVSUIConferenceRoomDisplaySmallView sizeThatFits:]( self->_crdSmallView,  "sizeThatFits:",  CGSizeZero.width,  CGSizeZero.height);
  if (a3 <= 4) {
    __asm { BR              X8 }
  }

  sub_10000358C();
  sub_1000035B8();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

  ;
}

  ;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)HUDPosition
{
  return self->_HUDPosition;
}

- (void)setHUDPosition:(unint64_t)a3
{
  self->_HUDPosition = a3;
}

- (TVSUIConferenceRoomDisplaySmallView)crdSmallView
{
  return self->_crdSmallView;
}

- (void).cxx_destruct
{
}

@end