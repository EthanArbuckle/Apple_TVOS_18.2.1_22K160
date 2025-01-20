@interface TVSSScreenRecordingController
- (BOOL)screenRecordingActive;
- (RPScreenRecorder)screenRecorder;
- (TVSSScreenRecordingController)init;
- (void)_presentExportOptionsWithURL:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
- (void)setScreenRecorder:(id)a3;
- (void)startScreenRecording;
- (void)stopScreenRecordingWithPresentingViewController:(id)a3 completion:(id)a4;
@end

@implementation TVSSScreenRecordingController

- (TVSSScreenRecordingController)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSScreenRecordingController;
  v8 = -[TVSSScreenRecordingController init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = +[RPScreenRecorder sharedRecorder](&OBJC_CLASS___RPScreenRecorder, "sharedRecorder");
    screenRecorder = v8->_screenRecorder;
    v8->_screenRecorder = v2;

    -[RPScreenRecorder setSystemRecording:](v8->_screenRecorder, "setSystemRecording:", 1LL);
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (BOOL)screenRecordingActive
{
  return -[RPScreenRecorder isRecording](self->_screenRecorder, "isRecording", a2, self);
}

- (void)startScreenRecording
{
}

- (void)stopScreenRecordingWithPresentingViewController:(id)a3 completion:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  objc_initWeak(&v14, v17);
  screenRecorder = v17->_screenRecorder;
  objc_super v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1000550D4;
  v10 = &unk_1001B7FF8;
  objc_copyWeak(&v13, &v14);
  id v11 = location[0];
  id v12 = v15;
  -[RPScreenRecorder stopSystemRecordingWithURLHandler:](screenRecorder, "stopSystemRecordingWithURLHandler:", &v6);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentExportOptionsWithURL:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v41 = 0LL;
  objc_storeStrong(&v41, a4);
  id v40 = 0LL;
  objc_storeStrong(&v40, a5);
  id v8 = TVSSInternalLocalizedString(@"TVSSScreenRecordingTitle");
  id v7 = TVSSInternalLocalizedString(@"TVSSScreenRecordingAlertMessage");
  v39 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8);

  v9 = v39;
  id v11 = TVSSInternalLocalizedString(@"TVSSScreenRecordingAlertAirDropButtonTitle");
  v32[1] = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_100055700;
  v36 = &unk_1001B8020;
  id v37 = location[0];
  id v38 = v40;
  v10 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11);
  -[UIAlertController addAction:](v9, "addAction:");

  id v12 = v39;
  id v14 = TVSSInternalLocalizedString(@"TVSSScreenRecordingAlertiCloudButtonTitle");
  v26[1] = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  v29 = sub_1000558F8;
  v30 = &unk_1001B8020;
  id v31 = location[0];
  v32[0] = v40;
  id v13 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL);
  -[UIAlertController addAction:](v12, "addAction:");

  id v15 = v39;
  id v17 = TVSSInternalLocalizedString(@"TVSSScreenRecordingAlertRadarButtonTitle");
  v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  v23 = sub_100055C34;
  v24 = &unk_1001B8020;
  id v25 = location[0];
  v26[0] = v40;
  v16 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL);
  -[UIAlertController addAction:](v15, "addAction:");

  v18 = v39;
  v19 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL);
  -[UIAlertController addAction:](v18, "addAction:");

  [v41 presentViewController:v39 animated:1 completion:0];
  objc_storeStrong(v26, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(v32, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong((id *)&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(location, 0LL);
}

- (RPScreenRecorder)screenRecorder
{
  return self->_screenRecorder;
}

- (void)setScreenRecorder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end