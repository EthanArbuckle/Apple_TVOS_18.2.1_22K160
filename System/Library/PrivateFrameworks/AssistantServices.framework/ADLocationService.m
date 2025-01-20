@interface ADLocationService
+ (id)sharedService;
- (ADLocationManager)locationManager;
- (ADLocationService)initWithDispatchQueue:(id)a3;
- (ADLocationService)initWithDispatchQueue:(id)a3 locationManager:(id)a4 isSiriLocationServicesPromptingEnabled:(BOOL)a5;
- (OS_dispatch_queue)dispatchQueue;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)dismissTCCDialogIfNeeded;
- (void)dismissTCCDialogIfNeeded:(id)a3;
- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5;
- (void)locationManager:(id)a3 wantsToSetRequestOrigin:(id)a4;
- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation ADLocationService

- (ADLocationService)initWithDispatchQueue:(id)a3 locationManager:(id)a4 isSiriLocationServicesPromptingEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADLocationService;
  v11 = -[ADLocationService init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_isSiriLocationServicesPromptingEnabled = a5;
    objc_storeStrong((id *)&v11->_dispatchQueue, a3);
    objc_storeStrong((id *)&v12->_locationManager, a4);
    -[ADLocationManager setDelegate:](v12->_locationManager, "setDelegate:", v12);
  }

  return v12;
}

- (ADLocationService)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  id v5 = +[AFFeatureFlags isStationaryDeviceLocationManagerEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isStationaryDeviceLocationManagerEnabled");
  if ((_DWORD)v5 && (AFIsHorseman(v5, v6) & 1) != 0) {
    v7 = &off_1004E54A0;
  }
  else {
    v7 = off_1004E5488;
  }
  id v8 = [objc_alloc(*v7) initWithSerialQueue:v4];
  id v9 = -[ADLocationService initWithDispatchQueue:locationManager:isSiriLocationServicesPromptingEnabled:]( self,  "initWithDispatchQueue:locationManager:isSiriLocationServicesPromptingEnabled:",  v4,  v8,  +[AFFeatureFlags isSiriLocationServicesPromptingEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriLocationServicesPromptingEnabled"));

  return v9;
}

- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  [v8 drainRequestsWithErrorCode:a3 clearLocationCache:v6 dismissDialog:v5];
}

- (void)dismissTCCDialogIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  [v2 dismissTCCDialogIfNeeded:0];
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  [v5 currentAuthorizationStyle:v4];
}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v10 requestAuthorizationWithStyle:a3 timeout:v8 completion:a4];
  }

  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v10 requestTemporaryAccuracyAuthorizationWithStyle:a3 timeout:v8 completion:a4];
  }

  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v6 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v8 updateAuthorizationStyleWithUserSelection:a3 completion:v6];
  }

  else
  {
    v7 = (void (*)(void))*((void *)a4 + 2);
    id v8 = a4;
    v7();
  }
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v10 updateAuthorizationStyleWithUserSelection:a3 timeout:v8 completion:a4];
  }

  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v8 updateTemporaryAuthorizationForAccurateLocation:v4 completion:v6];
  }

  else
  {
    v7 = (void (*)(void))*((void *)a4 + 2);
    id v8 = a4;
    v7();
  }
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    BOOL v6 = a3;
    id v8 = a5;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
    [v10 updateTemporaryAuthorizationForAccurateLocation:v6 timeout:v8 completion:a4];
  }

  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  [v9 currentLocationWithAccuracy:v8 timeout:a3 completion:a4];
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  [v8 currentLocationWithFetchRequest:v7 completion:v6];
}

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationService locationManager](self, "locationManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100214B7C;
  v7[3] = &unk_1004FC838;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissTCCDialogIfNeeded:v7];
}

- (void)locationManager:(id)a3 wantsToSetRequestOrigin:(id)a4
{
  id v8 = a4;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _currentRequest]);
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 currentRequestId]);
    [v8 setRefId:v7];
  }

  [v4 _sendCommandToServer:v8];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (ADLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (qword_100578198 != -1) {
    dispatch_once(&qword_100578198, &stru_1004F6B90);
  }
  return (id)qword_1005781A0;
}

@end