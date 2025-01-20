@interface TVSSVideoMicSensorDefaultProvider
- (AVCaptureDevice)continuityCaptureDevice;
- (NSString)connectedDeviceName;
- (TVSSContinuityCameraSessionObserver)continuityCameraSessionObserver;
- (TVSSSensorActivityController)sensorActivityController;
- (TVSSVideoMicAppInfo)cameraAppInfo;
- (TVSSVideoMicAppInfo)micAppInfo;
- (TVSSVideoMicSensorDefaultProvider)initWithSensorActivityController:(id)a3;
- (id)onCameraAppChange;
- (id)onContinuityCameraConnectionChange;
- (id)onMicAppChange;
- (void)dealloc;
- (void)sensorActivityControllerDidUpdate:(id)a3;
- (void)setCameraAppInfo:(id)a3;
- (void)setContinuityCameraSessionObserver:(id)a3;
- (void)setMicAppInfo:(id)a3;
- (void)setOnCameraAppChange:(id)a3;
- (void)setOnContinuityCameraConnectionChange:(id)a3;
- (void)setOnMicAppChange:(id)a3;
- (void)setSensorActivityController:(id)a3;
@end

@implementation TVSSVideoMicSensorDefaultProvider

- (TVSSVideoMicSensorDefaultProvider)initWithSensorActivityController:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0LL;
  v14.receiver = v3;
  v14.super_class = (Class)&OBJC_CLASS___TVSSVideoMicSensorDefaultProvider;
  v16 = -[TVSSVideoMicSensorDefaultProvider init](&v14, "init");
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    v4 = (TVSSVideoMicAppInfo *)[location[0] activeCameraAppInfo];
    cameraAppInfo = v16->_cameraAppInfo;
    v16->_cameraAppInfo = v4;

    v6 = (TVSSVideoMicAppInfo *)[location[0] activeMicAppInfo];
    micAppInfo = v16->_micAppInfo;
    v16->_micAppInfo = v6;

    objc_storeStrong((id *)&v16->_sensorActivityController, location[0]);
    v8 =  +[TVSSContinuityCameraSessionObserver sharedInstance]( &OBJC_CLASS___TVSSContinuityCameraSessionObserver,  "sharedInstance");
    continuityCameraSessionObserver = v16->_continuityCameraSessionObserver;
    v16->_continuityCameraSessionObserver = v8;

    v13 = -[TVSSContinuityCameraSessionObserver observerSet](v16->_continuityCameraSessionObserver, "observerSet");
    id v10 = -[TVSObserverSet addObserver:](v13, "addObserver:", v16);

    -[TVSSSensorActivityController addObserver:](v16->_sensorActivityController, "addObserver:", v16);
  }

  v12 = v16;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v12;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = -[TVSSContinuityCameraSessionObserver observerSet](self->_continuityCameraSessionObserver, "observerSet");
  -[TVSObserverSet removeObserver:](v2, "removeObserver:", v5);

  -[TVSSSensorActivityController removeObserver:](v5->_sensorActivityController, "removeObserver:", v5);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSVideoMicSensorDefaultProvider;
  -[TVSSVideoMicSensorDefaultProvider dealloc](&v3, "dealloc");
}

- (AVCaptureDevice)continuityCaptureDevice
{
  return -[TVSSContinuityCameraSessionObserver continuityCaptureDevice]( self->_continuityCameraSessionObserver,  "continuityCaptureDevice",  a2,  self);
}

- (NSString)connectedDeviceName
{
  return -[TVSSContinuityCameraSessionObserver connectedDeviceName]( self->_continuityCameraSessionObserver,  "connectedDeviceName",  a2,  self);
}

- (void)sensorActivityControllerDidUpdate:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = [location[0] activeCameraAppInfo];
  id v8 = [v16 bundleIdentifier];
  id v9 = -[TVSSVideoMicAppInfo bundleIdentifier](v18->_cameraAppInfo, "bundleIdentifier");
  char v14 = 0;
  BOOL v10 = 0;
  if ((objc_msgSend(v8, "isEqual:") & 1) == 0)
  {
    id v15 = -[TVSSVideoMicSensorDefaultProvider onCameraAppChange](v18, "onCameraAppChange");
    char v14 = 1;
    BOOL v10 = v15 != 0LL;
  }

  if ((v14 & 1) != 0) {

  }
  if (v10)
  {
    -[TVSSVideoMicSensorDefaultProvider setCameraAppInfo:](v18, "setCameraAppInfo:", v16);
    v7 = (void (**)(id, id)) -[TVSSVideoMicSensorDefaultProvider onCameraAppChange]( v18,  "onCameraAppChange");
    v7[2](v7, v16);
  }

  id v13 = [location[0] activeMicAppInfo];
  id v4 = [v13 bundleIdentifier];
  id v5 = -[TVSSVideoMicAppInfo bundleIdentifier](v18->_micAppInfo, "bundleIdentifier");
  char v11 = 0;
  BOOL v6 = 0;
  if ((objc_msgSend(v4, "isEqual:") & 1) == 0)
  {
    id v12 = -[TVSSVideoMicSensorDefaultProvider onMicAppChange](v18, "onMicAppChange");
    char v11 = 1;
    BOOL v6 = v12 != 0LL;
  }

  if ((v11 & 1) != 0) {

  }
  if (v6)
  {
    -[TVSSVideoMicSensorDefaultProvider setMicAppInfo:](v18, "setMicAppInfo:", v13);
    objc_super v3 = (void (**)(id, id))-[TVSSVideoMicSensorDefaultProvider onMicAppChange](v18, "onMicAppChange");
    v3[2](v3, v13);
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)onContinuityCameraConnectionChange
{
  return self->_onContinuityCameraConnectionChange;
}

- (void)setOnContinuityCameraConnectionChange:(id)a3
{
}

- (TVSSVideoMicAppInfo)cameraAppInfo
{
  return self->_cameraAppInfo;
}

- (void)setCameraAppInfo:(id)a3
{
}

- (id)onCameraAppChange
{
  return self->_onCameraAppChange;
}

- (void)setOnCameraAppChange:(id)a3
{
}

- (TVSSVideoMicAppInfo)micAppInfo
{
  return self->_micAppInfo;
}

- (void)setMicAppInfo:(id)a3
{
}

- (id)onMicAppChange
{
  return self->_onMicAppChange;
}

- (void)setOnMicAppChange:(id)a3
{
}

- (TVSSSensorActivityController)sensorActivityController
{
  return self->_sensorActivityController;
}

- (void)setSensorActivityController:(id)a3
{
}

- (TVSSContinuityCameraSessionObserver)continuityCameraSessionObserver
{
  return self->_continuityCameraSessionObserver;
}

- (void)setContinuityCameraSessionObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end