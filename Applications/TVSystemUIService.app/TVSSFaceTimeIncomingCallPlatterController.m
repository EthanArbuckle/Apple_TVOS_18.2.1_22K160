@interface TVSSFaceTimeIncomingCallPlatterController
+ (id)_contentForIncomingCallInfo:(id)a3 withIncomingSnowglobeImage:(id)a4;
+ (id)_layoutFromCameraSession:(id)a3 renderers:(id)a4;
+ (id)_layoutProvidersFromCameraSession:(id)a3;
+ (id)_renderersWithCaptureView:(id)a3;
- (BOOL)canFocusRenderer:(id)a3;
- (TVSSCameraPreviewView)captureView;
- (TVSSFaceTimeIncomingCallInfo)incomingCallInfo;
- (TVSSFaceTimeIncomingCallPlatterController)init;
- (TVSSFaceTimePlatterBackingStore)faceTimePlatterBackingStore;
- (TVSSSimpleCameraSession)session;
- (UIImage)incomingSnowglobeImage;
- (id)preferredFocusRendererIdentifier;
- (void)_handleAccept;
- (void)_handleDecline;
- (void)_platterControllerWillDisappear:(BOOL)a3;
- (void)_refreshIncomingSnowglobeImage;
- (void)_updatePlatterIncomingCallInfo;
- (void)connectionFailed;
- (void)didReceiveFirstFrame;
- (void)faceTimePlatterBackingStoreDidChange:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setCaptureView:(id)a3;
- (void)setFaceTimePlatterBackingStore:(id)a3;
- (void)setIncomingCallInfo:(id)a3;
- (void)setIncomingSnowglobeImage:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation TVSSFaceTimeIncomingCallPlatterController

- (TVSSFaceTimeIncomingCallPlatterController)init
{
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimePlatterBackingStore);
  id v12 = [v20[0] incomingCallInfo];
  id v11 = [v12 conversation];
  BOOL v13 = [v11 avMode] == (id)2;

  BOOL v19 = v13;
  id v18 = 0LL;
  id v17 = 0LL;
  if (v13)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSSSimpleCameraSession);
    id v3 = v18;
    id v18 = v2;

    if (v18)
    {
      v4 = -[TVSSCameraPreviewView initWithSession:]( objc_alloc(&OBJC_CLASS___TVSSCameraPreviewView),  "initWithSession:",  v18);
      id v5 = v17;
      id v17 = v4;
    }
  }

  id v16 = [(id)objc_opt_class(v21) _renderersWithCaptureView:v17];
  id v15 = [(id)objc_opt_class(v21) _layoutFromCameraSession:v18 renderers:v16];
  v6 = v21;
  v21 = 0LL;
  v14.receiver = v6;
  v14.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeIncomingCallPlatterController;
  v21 = -[TVSSFaceTimeIncomingCallPlatterController initWithIdentifier:layout:renderers:]( &v14,  "initWithIdentifier:layout:renderers:",  @"com.apple.facetime.incoming.panel",  v15,  v16);
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    v7 = (TVSSFaceTimeIncomingCallInfo *)[v20[0] incomingCallInfo];
    incomingCallInfo = v21->_incomingCallInfo;
    v21->_incomingCallInfo = v7;

    objc_storeStrong((id *)&v21->_faceTimePlatterBackingStore, v20[0]);
    -[TVSSFaceTimePlatterBackingStore setDelegate:](v21->_faceTimePlatterBackingStore, "setDelegate:", v21);
    objc_storeStrong((id *)&v21->_session, v18);
    -[TVSSSimpleCameraSession setDelegate:](v21->_session, "setDelegate:", v21);
    objc_storeStrong((id *)&v21->_captureView, v17);
    -[TVSSFaceTimeIncomingCallPlatterController _updatePlatterIncomingCallInfo](v21, "_updatePlatterIncomingCallInfo");
    -[TVSSFaceTimeIncomingCallPlatterController _refreshIncomingSnowglobeImage](v21, "_refreshIncomingSnowglobeImage");
  }

  v10 = v21;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v10;
}

- (void)_platterControllerWillDisappear:(BOOL)a3
{
}

- (void)setIncomingCallInfo:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v5->_incomingCallInfo != location[0])
  {
    objc_storeStrong((id *)&v5->_incomingCallInfo, location[0]);
    if (v5->_incomingCallInfo)
    {
      -[TVSSFaceTimeIncomingCallPlatterController _updatePlatterIncomingCallInfo](v5, "_updatePlatterIncomingCallInfo");
      -[TVSSFaceTimeIncomingCallPlatterController _refreshIncomingSnowglobeImage](v5, "_refreshIncomingSnowglobeImage");
    }

    else
    {
      id v3 = -[TVSSFaceTimeIncomingCallPlatterController currentHostingContext](v5, "currentHostingContext");
      [v3 dismissSystemMenuWithSourceIdentifier:@"incoming-info"];
    }
  }

  objc_storeStrong(location, 0LL);
}

- (UIImage)incomingSnowglobeImage
{
  if (!self->_incomingSnowglobeImage)
  {
    v2 = (UIImage *)+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
    incomingSnowglobeImage = self->_incomingSnowglobeImage;
    self->_incomingSnowglobeImage = v2;
  }

  return self->_incomingSnowglobeImage;
}

- (void)setIncomingSnowglobeImage:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_incomingSnowglobeImage != location[0])
  {
    objc_storeStrong((id *)&v4->_incomingSnowglobeImage, location[0]);
    -[TVSSFaceTimeIncomingCallPlatterController _updatePlatterIncomingCallInfo](v4, "_updatePlatterIncomingCallInfo");
  }

  objc_storeStrong(location, 0LL);
}

+ (id)_renderersWithCaptureView:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (location[0])
  {
    id v3 = objc_alloc(&OBJC_CLASS___TVSSRawVideoPreviewRenderer);
    v37 = -[TVSSRawVideoPreviewRenderer initWithIdentifier:videoView:]( v3,  "initWithIdentifier:videoView:",  @"TVSSCameraPreviewViewDefaultIdentifier",  location[0]);
    -[NSMutableArray addObject:](v38, "addObject:", v37);
    objc_storeStrong((id *)&v37, 0LL);
  }

  id v5 = v38;
  id v35 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v34 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
  id v45 = v34;
  v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45);
  v32 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v35);
  v46[0] = v32;
  id v31 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v30 = +[TVSPLabelAttribute marqueeEnabled:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeEnabled:", 1LL);
  v44[0] = v30;
  id v29 = +[TVSPLabelAttribute marqueeRunning:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeRunning:", 1LL);
  v44[1] = v29;
  v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44);
  v27 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v31);
  v46[1] = v27;
  v26 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL);
  v25 =  +[TVSSIncomingInfoRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSSIncomingInfoRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"incoming-info",  16LL,  0LL);
  v47[0] = v25;
  id v24 = TVSSLagunaLocalizedString(@"FaceTimeDeclineCall");
  v23 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  id v22 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v21 = +[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor");
  id v20 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
  id v42 = v20;
  BOOL v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL);
  id v18 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v22);
  v43 = v18;
  id v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL);
  id v16 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"decline");
  v47[1] = v16;
  id v15 = TVSSLagunaLocalizedString(@"FaceTimeAcceptCall");
  objc_super v14 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  id v13 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v12 = +[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor");
  id v11 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
  id v40 = v11;
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL);
  v9 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v13);
  v41 = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL);
  v7 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"accept",  5LL,  v14);
  v47[2] = v7;
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL);
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:");

  v36 = v38;
  objc_storeStrong((id *)&v38, 0LL);
  objc_storeStrong(location, 0LL);
  return v36;
}

+ (id)_layoutProvidersFromCameraSession:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (location[0] && ([location[0] hasFailed] & 1) == 0)
  {
    +[TVSPConstants cameraPreviewHeight](&OBJC_CLASS___TVSPConstants, "cameraPreviewHeight");
    v9 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"TVSSCameraPreviewViewDefaultIdentifier");
    -[NSMutableArray addObject:](v11, "addObject:");

    id v10 = +[TVSPRow spacer](&OBJC_CLASS___TVSPRow, "spacer");
    -[NSMutableArray addObject:](v11, "addObject:");
  }

  v4 = v11;
  v7 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:", &off_1001C8528);
  v13[0] = v7;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v6 = +[TVSPRow rowWithIdentifiers:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:height:", &off_1001C8540);
  v13[1] = v6;
  id v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL);
  -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:");

  v8 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

+ (id)_layoutFromCameraSession:(id)a3 renderers:(id)a4
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v6 = [v10 _layoutProvidersFromCameraSession:location[0]];
  v7 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (BOOL)canFocusRenderer:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqual:@"incoming-info"];

  if ((v5 & 1) != 0)
  {
    char v10 = 0;
  }

  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeIncomingCallPlatterController;
    char v10 = -[TVSSFaceTimeIncomingCallPlatterController canFocusRenderer:](&v6, "canFocusRenderer:", location[0]);
  }

  int v7 = 1;
  objc_storeStrong(location, 0LL);
  return v10 & 1;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v9 = [location[0] identifier];
  unsigned __int8 v10 = [v9 isEqual:@"decline"];

  if ((v10 & 1) != 0)
  {
    -[TVSSFaceTimeIncomingCallPlatterController _handleDecline](v13, "_handleDecline");
  }

  else
  {
    id v6 = [location[0] identifier];
    unsigned __int8 v7 = [v6 isEqual:@"accept"];

    if ((v7 & 1) != 0) {
      -[TVSSFaceTimeIncomingCallPlatterController _handleAccept](v13, "_handleAccept");
    }
  }

  id v4 = v11;
  id v5 = [location[0] identifier];
  objc_msgSend(v4, "dismissSystemMenuWithSourceIdentifier:");

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)preferredFocusRendererIdentifier
{
  return @"accept";
}

- (void)_handleDecline
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = -[TVSSFaceTimeIncomingCallPlatterController currentHostingContext](self, "currentHostingContext");
  v2 = -[TVSSFaceTimeIncomingCallPlatterController faceTimePlatterBackingStore](v13, "faceTimePlatterBackingStore");
  id v11 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v2, "incomingCallInfo");

  id v4 = -[TVSSFaceTimeIncomingCallPlatterController faceTimePlatterBackingStore](v13, "faceTimePlatterBackingStore");
  id v3 = v11;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10001044C;
  id v9 = &unk_1001B6270;
  id v10 = v12[0];
  -[TVSSFaceTimePlatterBackingStore declineIncomingCall:completion:](v4, "declineIncomingCall:completion:", v3);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(v12, 0LL);
}

- (void)_handleAccept
{
  BOOL v19 = self;
  v18[1] = (id)a2;
  v18[0] = -[TVSSFaceTimeIncomingCallPlatterController currentHostingContext](self, "currentHostingContext");
  v2 = -[TVSSFaceTimeIncomingCallPlatterController faceTimePlatterBackingStore](v19, "faceTimePlatterBackingStore");
  id v17 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v2, "incomingCallInfo");

  id v3 = -[TVSSFaceTimeIncomingCallPlatterController faceTimePlatterBackingStore](v19, "faceTimePlatterBackingStore");
  id v4 = v17;
  id v5 = -[TVSSFaceTimeIncomingCallPlatterController session](v19, "session");
  char v15 = 0;
  char v13 = 0;
  unsigned __int8 v6 = 1;
  if (v5)
  {
    id v16 = -[TVSSFaceTimeIncomingCallPlatterController session](v19, "session");
    char v15 = 1;
    unsigned __int8 v6 = 1;
    if (-[TVSSSimpleCameraSession hasReceivedFirstFrame](v16, "hasReceivedFirstFrame"))
    {
      objc_super v14 = -[TVSSFaceTimeIncomingCallPlatterController session](v19, "session");
      char v13 = 1;
      unsigned __int8 v6 = -[TVSSSimpleCameraSession hasFailed](v14, "hasFailed");
    }
  }

  int v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_100010780;
  id v11 = &unk_1001B6270;
  id v12 = v18[0];
  -[TVSSFaceTimePlatterBackingStore acceptIncomingCall:wantsStagingArea:completion:]( v3,  "acceptIncomingCall:wantsStagingArea:completion:",  v4,  v6 & 1,  &v7);
  if ((v13 & 1) != 0) {

  }
  if ((v15 & 1) != 0) {
  objc_storeStrong(&v12, 0LL);
  }
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(v18, 0LL);
}

- (void)_updatePlatterIncomingCallInfo
{
  int v8 = self;
  v7[1] = (id)a2;
  v2 = (void *)objc_opt_class(self);
  id v4 = -[TVSSFaceTimeIncomingCallPlatterController incomingCallInfo](v8, "incomingCallInfo");
  id v3 = -[TVSSFaceTimeIncomingCallPlatterController incomingSnowglobeImage](v8, "incomingSnowglobeImage");
  v7[0] = objc_msgSend(v2, "_contentForIncomingCallInfo:withIncomingSnowglobeImage:", v4);

  id v5 = v8;
  int v9 = @"incoming-info";
  id v10 = v7[0];
  unsigned __int8 v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL);
  -[TVSSFaceTimeIncomingCallPlatterController applyContent:](v5, "applyContent:");

  objc_storeStrong(v7, 0LL);
}

- (void)_refreshIncomingSnowglobeImage
{
  id v16 = self;
  v15[1] = (id)a2;
  v2 = -[TVSSFaceTimeIncomingCallPlatterController incomingCallInfo](self, "incomingCallInfo");
  v15[0] = -[TVSSFaceTimeIncomingCallInfo conversation](v2, "conversation");

  id v14 = [v15[0] remoteMemberContactIdentifiers];
  id v13 = [v15[0] remoteMemberCount];
  objc_initWeak(&location, v16);
  id v3 = v14;
  id v4 = v13;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_100010B1C;
  int v9 = &unk_1001B62C0;
  objc_copyWeak(&v11, &location);
  id v10 = v14;
  +[TVSSSnowglobeUtilities imageFor:remoteMemberCount:completionHandler:]( &OBJC_CLASS___TVSSSnowglobeUtilities,  "imageFor:remoteMemberCount:completionHandler:",  v3,  v4,  &v5);
  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
}

+ (id)_contentForIncomingCallInfo:(id)a3 withIncomingSnowglobeImage:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = &stru_1001BDAC8;
  id v15 = [location[0] conversation];
  BOOL v16 = [v15 avMode] != (id)1;

  if (v16)
  {
    id v12 = [location[0] conversation];
    BOOL v13 = [v12 avMode] != (id)2;

    if (!v13)
    {
      int v6 = (__CFString *)TVSSLagunaLocalizedString(@"FaceTimeIncomingVideoCall");
      int v7 = v17;
      id v17 = v6;
    }
  }

  else
  {
    id v4 = (__CFString *)TVSSLagunaLocalizedString(@"FaceTimeIncomingAudioCall");
    id v5 = v17;
    id v17 = v4;
  }

  id v10 = [location[0] call];
  id v9 = [v10 displayName];
  id v11 = +[TVSPContent contentWithTitle:image:text1:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:text1:");

  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (void)faceTimePlatterBackingStoreDidChange:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSFaceTimeIncomingCallPlatterController faceTimePlatterBackingStore](v6, "faceTimePlatterBackingStore");
  id v4 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v3, "incomingCallInfo");

  -[TVSSFaceTimeIncomingCallPlatterController setIncomingCallInfo:](v6, "setIncomingCallInfo:", v4);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)connectionFailed
{
  int v7 = self;
  v6[1] = (id)a2;
  v2 = (void *)objc_opt_class(self);
  id v4 = -[TVSSFaceTimeIncomingCallPlatterController session](v7, "session");
  id v3 = -[TVSSFaceTimeIncomingCallPlatterController renderers](v7, "renderers");
  v6[0] = objc_msgSend(v2, "_layoutFromCameraSession:renderers:", v4);

  id v5 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  -[TVSSFaceTimeIncomingCallPlatterController applyLayout:animator:](v7, "applyLayout:animator:", v6[0], v5);
  -[TVSSFaceTimeIncomingCallPlatterController _updatePlatterSizeWithAnimator:]( v7,  "_updatePlatterSizeWithAnimator:",  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(v6, 0LL);
}

- (void)didReceiveFirstFrame
{
}

- (TVSSFaceTimePlatterBackingStore)faceTimePlatterBackingStore
{
  return self->_faceTimePlatterBackingStore;
}

- (void)setFaceTimePlatterBackingStore:(id)a3
{
}

- (TVSSFaceTimeIncomingCallInfo)incomingCallInfo
{
  return self->_incomingCallInfo;
}

- (TVSSCameraPreviewView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
}

- (TVSSSimpleCameraSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end