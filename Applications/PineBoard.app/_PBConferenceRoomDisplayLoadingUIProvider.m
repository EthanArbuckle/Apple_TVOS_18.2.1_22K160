@interface _PBConferenceRoomDisplayLoadingUIProvider
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
@end

@implementation _PBConferenceRoomDisplayLoadingUIProvider

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001EA50C;
  v7[3] = &unk_1003D3048;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  @"TVCRDServiceLoadingViewController",  @"com.apple.TVCRDService",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

@end