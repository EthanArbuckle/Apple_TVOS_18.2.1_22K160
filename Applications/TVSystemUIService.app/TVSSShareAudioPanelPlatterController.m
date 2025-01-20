@interface TVSSShareAudioPanelPlatterController
+ (NSDirectionalEdgeInsets)_textContentInsets;
- (BTShareAudioSessionClient)sessionClient;
- (TVSSShareAudioPanelPlatterController)init;
- (TVSSShareAudioPanelPlatterControllerDelegate)shareAudioDelegate;
- (id)_assetsBundle;
- (id)_connectingStringForEvent:(int)a3;
- (id)_deviceNameForInfo:(id)a3;
- (id)_imageForPID:(unsigned int)a3;
- (id)_moviePathForPID:(unsigned int)a3;
- (id)_pairingInstructionsForInfo:(id)a3;
- (void)_handleProgressEvent:(int)a3 info:(id)a4;
- (void)_invalidateShareAudioSession;
- (void)_notifyShareAudioCompletedWithSuccess:(BOOL)a3;
- (void)_showConnectingWithEvent:(int)a3 info:(id)a4;
- (void)_showConnectionOptionsWithInfo:(id)a3;
- (void)_showErrorWithInfo:(id)a3;
- (void)_showPairingInstructionsWithInfo:(id)a3;
- (void)_startShareAudioSession;
- (void)dealloc;
- (void)platterControllerDidActivate;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setSessionClient:(id)a3;
- (void)setShareAudioDelegate:(id)a3;
@end

@implementation TVSSShareAudioPanelPlatterController

- (TVSSShareAudioPanelPlatterController)init
{
  v78 = self;
  v77[1] = (id)a2;
  id v57 = TVSSLocString(@"TVSSHeadphonesShareAudioPanelTitle");
  v56 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v55 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v84[0] = v55;
  v54 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v84[1] = v54;
  v53 =  +[TVSSShareAudioBringCloseRenderer rendererWithIdentifier:]( &OBJC_CLASS___TVSSShareAudioBringCloseRenderer,  "rendererWithIdentifier:");
  v84[2] = v53;
  id v52 = TVSSLocString(@"TVSSHeadphonesShareAudioBringCloseCaption");
  v51 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v50 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:");
  v84[3] = v50;
  v49 =  +[TVSSShareAudioHeadphoneMovieRenderer rendererWithIdentifier:]( &OBJC_CLASS___TVSSShareAudioHeadphoneMovieRenderer,  "rendererWithIdentifier:",  @"HeadphoneDetails");
  v84[4] = v49;
  id v48 = TVSSLocString(@"TVSSHeadphonesShareAudioTemporarilyButtonTitle");
  v47 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v46 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"TemporarilyShare");
  v84[5] = v46;
  id v45 = TVSSLocString(@"TVSSHeadphonesShareAudioPermanentButtonTitle");
  v44 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v43 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Connect",  15LL);
  v84[6] = v43;
  id v42 = TVSSLocString(@"TVSSHeadphonesShareAudioCancelButtonTitle");
  v41 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v40 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v84[7] = v40;
  v39 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", @"AirPods");
  id v38 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v37 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 4LL);
  id v82 = v37;
  v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v82);
  v35 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v38);
  v83 = v35;
  v34 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v83, 1LL);
  v33 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"HeadphoneName",  4LL,  v39);
  v84[8] = v33;
  id v32 = TVSSLocString(@"TVSSHeadphonesShareAudioGenericPairCaptionTitle");
  v31 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v30 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"PairingInstructions",  4LL);
  v84[9] = v30;
  id v29 = TVSSLocString(@"TVSSHeadphonesShareAudioConnectingCaption");
  v28 =  +[TVSSShareAudioConnectingRenderer rendererWithIdentifier:title:]( &OBJC_CLASS___TVSSShareAudioConnectingRenderer,  "rendererWithIdentifier:title:",  @"Connecting");
  v84[10] = v28;
  id v27 = TVSSLocString(@"TVSSHeadphonesShareAudioCouldNotConnectTitle");
  v26 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  id v25 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v24 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 4LL);
  id v80 = v24;
  v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v80, 1LL);
  v22 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v25);
  v81 = v22;
  v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL);
  v20 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"ErrorTitle",  4LL,  v26);
  v84[11] = v20;
  id v19 = TVSSLocString(@"TVSSHeadphonesShareAudioCouldNotConnectDescription");
  v18 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v17 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"ErrorDescription",  4LL);
  v84[12] = v17;
  id v16 = TVSSLocString(@"TVSSHeadphonesShareAudioOKButtonTitle");
  v15 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v14 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"OK",  15LL);
  v84[13] = v14;
  v77[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 14LL);

  v66 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  v79[0] = v66;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v65 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v79[1] = v65;
  id v64 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  v79[2] = v64;
  v63 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"BringClose",  223.0);
  v79[3] = v63;
  +[TVSPConstants tallRowHeight](&OBJC_CLASS___TVSPConstants, "tallRowHeight");
  double v58 = v2;
  +[TVSSShareAudioPanelPlatterController _textContentInsets]( &OBJC_CLASS___TVSSShareAudioPanelPlatterController,  "_textContentInsets");
  double v72 = v3;
  double v73 = v4;
  double v74 = v5;
  double v75 = v6;
  v62 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"BringCloseText",  v58,  v3,  v4,  v5,  v6);
  v79[4] = v62;
  id v61 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
  v79[5] = v61;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v60 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Cancel");
  v79[6] = v60;
  v59 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 7LL);
  id v76 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:");

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v70 = v7;
  *((double *)&v70 + 1) = v8;
  *(double *)&__int128 v71 = v9;
  *((double *)&v71 + 1) = v10;
  __int128 v68 = v70;
  __int128 v69 = v71;
  objc_msgSend(v76, "setContentInsets:", v7, v8, v9, v10);
  v11 = v78;
  v78 = 0LL;
  v67.receiver = v11;
  v67.super_class = (Class)&OBJC_CLASS___TVSSShareAudioPanelPlatterController;
  v78 = -[TVSSShareAudioPanelPlatterController initWithIdentifier:layout:renderers:]( &v67,  "initWithIdentifier:layout:renderers:",  @"com.apple.TVSystemUIService.shareaudio.item",  v76,  v77[0]);
  objc_storeStrong((id *)&v78, v78);
  v13 = v78;
  objc_storeStrong(&v76, 0LL);
  objc_storeStrong(v77, 0LL);
  objc_storeStrong((id *)&v78, 0LL);
  return v13;
}

- (void)dealloc
{
  double v5 = self;
  SEL v4 = a2;
  double v2 = -[TVSSShareAudioPanelPlatterController sessionClient](self, "sessionClient");
  -[BTShareAudioSessionClient invalidate](v2, "invalidate");

  -[TVSSShareAudioPanelPlatterController setSessionClient:](v5, "setSessionClient:", 0LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSShareAudioPanelPlatterController;
  -[TVSSShareAudioPanelPlatterController dealloc](&v3, "dealloc");
}

- (void)platterControllerDidActivate
{
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = [location[0] identifier];
  if ([v7 isEqualToString:@"TemporarilyShare"])
  {
    double v5 = -[TVSSShareAudioPanelPlatterController sessionClient](v10, "sessionClient");
    -[BTShareAudioSessionClient userConfirmed:](v5, "userConfirmed:", 0LL);
  }

  else if ([v7 isEqualToString:@"Connect"])
  {
    SEL v4 = -[TVSSShareAudioPanelPlatterController sessionClient](v10, "sessionClient");
    -[BTShareAudioSessionClient userConfirmed:](v4, "userConfirmed:", 1LL);
  }

  else if ([v7 isEqualToString:@"Cancel"])
  {
    -[TVSSShareAudioPanelPlatterController _invalidateShareAudioSession](v10, "_invalidateShareAudioSession");
    -[TVSSShareAudioPanelPlatterController _notifyShareAudioCompletedWithSuccess:]( v10,  "_notifyShareAudioCompletedWithSuccess:",  0LL);
  }

  else if ([v7 isEqualToString:@"OK"])
  {
    -[TVSSShareAudioPanelPlatterController _notifyShareAudioCompletedWithSuccess:]( v10,  "_notifyShareAudioCompletedWithSuccess:",  0LL);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_startShareAudioSession
{
  double v10 = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(&OBJC_CLASS___BTShareAudioSessionClient);
  [v9[0] setMode:2];
  objc_initWeak(&location, v10);
  double v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  double v5 = sub_10011FF04;
  double v6 = &unk_1001BB948;
  objc_copyWeak(&v7, &location);
  [v9[0] setProgressHandler:&v2];
  -[TVSSShareAudioPanelPlatterController setSessionClient:](v10, "setSessionClient:", v9[0]);
  [v9[0] activate];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  objc_storeStrong(v9, 0LL);
}

- (void)_invalidateShareAudioSession
{
  double v2 = -[TVSSShareAudioPanelPlatterController sessionClient](self, "sessionClient");
  -[BTShareAudioSessionClient invalidate](v2, "invalidate");

  -[TVSSShareAudioPanelPlatterController setSessionClient:](self, "setSessionClient:", 0LL);
}

- (void)_handleProgressEvent:(int)a3 info:(id)a4
{
  id v7 = self;
  SEL v6 = a2;
  unsigned int v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  switch(v5)
  {
    case 0x28u:
      -[TVSSShareAudioPanelPlatterController _invalidateShareAudioSession](v7, "_invalidateShareAudioSession");
      -[TVSSShareAudioPanelPlatterController _notifyShareAudioCompletedWithSuccess:]( v7,  "_notifyShareAudioCompletedWithSuccess:",  1LL);
      break;
    case 0x32u:
      -[TVSSShareAudioPanelPlatterController _invalidateShareAudioSession](v7, "_invalidateShareAudioSession");
      -[TVSSShareAudioPanelPlatterController _showErrorWithInfo:](v7, "_showErrorWithInfo:", location);
      break;
    case 0x64u:
      -[TVSSShareAudioPanelPlatterController _showConnectionOptionsWithInfo:]( v7,  "_showConnectionOptionsWithInfo:",  location);
      break;
    case 0x78u:
      -[TVSSShareAudioPanelPlatterController _showPairingInstructionsWithInfo:]( v7,  "_showPairingInstructionsWithInfo:",  location);
      break;
    case 0xC8u:
    case 0xD2u:
    case 0xDCu:
    case 0x12Cu:
    case 0x136u:
    case 0x140u:
      -[TVSSShareAudioPanelPlatterController _showConnectingWithEvent:info:]( v7,  "_showConnectingWithEvent:info:",  v5,  location);
      break;
  }

  objc_storeStrong(&location, 0LL);
}

- (void)_showConnectionOptionsWithInfo:(id)a3
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v5 = v32;
  v34 = @"HeadphoneName";
  id v8 = -[TVSSShareAudioPanelPlatterController _deviceNameForInfo:](v32, "_deviceNameForInfo:", location[0]);
  id v7 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v35 = v7;
  SEL v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL);
  -[TVSSShareAudioPanelPlatterController applyContent:](v5, "applyContent:");

  v21 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  v33[0] = v21;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v20 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v33[1] = v20;
  id v19 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  v33[2] = v19;
  v18 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", 318.0);
  v33[3] = v18;
  v17 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"HeadphoneName");
  v33[4] = v17;
  id v16 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
  v33[5] = v16;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v15 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"TemporarilyShare");
  v33[6] = v15;
  +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
  id v14 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v33[7] = v14;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v13 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Connect");
  v33[8] = v13;
  +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
  id v12 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v33[9] = v12;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v11 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Cancel");
  v33[10] = v11;
  double v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 11LL);
  id v9 = -[TVSSShareAudioPanelPlatterController renderers](v32, "renderers");
  id v30 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v10);

  [v30 setRowSpacing:0.0];
  id v29 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSShareAudioPanelPlatterController applyLayout:animator:](v32, "applyLayout:animator:", v30, v29);
  -[TVSSShareAudioPanelPlatterController reloadContent](v32, "reloadContent");
  -[TVSSShareAudioPanelPlatterController _updatePlatterSizeWithAnimator:](v32, "_updatePlatterSizeWithAnimator:", v29);
  id v28 =  -[TVSSShareAudioPanelPlatterController rendererForIdentifier:]( v32,  "rendererForIdentifier:",  @"HeadphoneDetails");
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(location[0], @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
  id v26 = -[TVSSShareAudioPanelPlatterController _moviePathForPID:](v32, "_moviePathForPID:", Int64Ranged);
  id v25 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-Loop", v26);
  id v22 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v32, "_assetsBundle");
  id v24 = [v22 pathForResource:v25 ofType:@"mov"];

  if (v24)
  {
    [v28 setMoviePath:v24];
  }

  else
  {
    id v23 = -[TVSSShareAudioPanelPlatterController _imageForPID:](v32, "_imageForPID:", Int64Ranged);
    if (v23)
    {
      [v28 setFallbackImage:v23];
    }

    else
    {
      id v4 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v32, "_assetsBundle");
      int v3 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"ShareAudioAirPods");
      objc_msgSend(v28, "setFallbackImage:");
    }

    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_showPairingInstructionsWithInfo:(id)a3
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = v36;
  id v38 = @"PairingInstructions";
  id v25 =  -[TVSSShareAudioPanelPlatterController _pairingInstructionsForInfo:]( v36,  "_pairingInstructionsForInfo:",  location[0]);
  id v24 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v39 = v24;
  id v23 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL);
  -[TVSSShareAudioPanelPlatterController applyContent:](v22, "applyContent:");

  id v34 =  -[TVSSShareAudioPanelPlatterController rendererForIdentifier:]( v36,  "rendererForIdentifier:",  @"HeadphoneDetails");
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(location[0], @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
  id v32 = -[TVSSShareAudioPanelPlatterController _moviePathForPID:](v36, "_moviePathForPID:", Int64Ranged);
  id v31 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-Hold", v32);
  id v26 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v36, "_assetsBundle");
  id v30 = [v26 pathForResource:v31 ofType:@"mov"];

  if (v30)
  {
    [v34 setWantsGradientMask:Int64Ranged == 8202];
    [v34 setMoviePath:v30];
  }

  else
  {
    id v29 = -[TVSSShareAudioPanelPlatterController _imageForPID:](v36, "_imageForPID:", Int64Ranged);
    if (v29)
    {
      [v34 setFallbackImage:v29];
    }

    else
    {
      id v21 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v36, "_assetsBundle");
      id v20 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"ShareAudioAirPods");
      objc_msgSend(v34, "setFallbackImage:");
    }

    objc_storeStrong(&v29, 0LL);
  }

  id v19 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  v37[0] = v19;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v18 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v37[1] = v18;
  id v17 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  v37[2] = v17;
  id v16 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"HeadphoneDetails",  318.0);
  v37[3] = v16;
  v15 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"HeadphoneName");
  v37[4] = v15;
  id v14 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 8.0);
  v37[5] = v14;
  +[TVSPConstants tallRowHeight](&OBJC_CLASS___TVSPConstants, "tallRowHeight");
  double v8 = v3;
  +[TVSSShareAudioPanelPlatterController _textContentInsets]( &OBJC_CLASS___TVSSShareAudioPanelPlatterController,  "_textContentInsets");
  v27[1] = v4;
  v27[2] = v5;
  v27[3] = v6;
  v27[4] = v7;
  v13 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"PairingInstructions",  v8,  *(double *)&v4,  *(double *)&v5,  *(double *)&v6,  *(double *)&v7);
  v37[6] = v13;
  id v12 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
  v37[7] = v12;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v11 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Cancel");
  v37[8] = v11;
  double v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 9LL);
  id v9 = -[TVSSShareAudioPanelPlatterController renderers](v36, "renderers");
  id v28 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v10);

  v27[0] = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSShareAudioPanelPlatterController applyLayout:animator:](v36, "applyLayout:animator:", v28, v27[0]);
  -[TVSSShareAudioPanelPlatterController reloadContent](v36, "reloadContent");
  -[TVSSShareAudioPanelPlatterController _updatePlatterSizeWithAnimator:]( v36,  "_updatePlatterSizeWithAnimator:",  v27[0]);
  objc_storeStrong(v27, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_showConnectingWithEvent:(int)a3 info:(id)a4
{
  v33 = self;
  SEL v32 = a2;
  unsigned int v31 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (location)
  {
    id v17 = v33;
    v35 = @"Connecting";
    id v20 = -[TVSSShareAudioPanelPlatterController _connectingStringForEvent:](v33, "_connectingStringForEvent:", v31);
    id v19 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
    v36 = v19;
    id v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL);
    -[TVSSShareAudioPanelPlatterController applyContent:](v17, "applyContent:");

    id v29 =  -[TVSSShareAudioPanelPlatterController rendererForIdentifier:]( v33,  "rendererForIdentifier:",  @"HeadphoneDetails");
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(location, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
    id v27 = -[TVSSShareAudioPanelPlatterController _moviePathForPID:](v33, "_moviePathForPID:", Int64Ranged);
    id v26 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-Loop", v27);
    id v21 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v33, "_assetsBundle");
    id v25 = [v21 pathForResource:v26 ofType:@"mov"];

    if (v25)
    {
      [v29 setWantsGradientMask:0];
      [v29 setMoviePath:v25];
    }

    else
    {
      id v24 = -[TVSSShareAudioPanelPlatterController _imageForPID:](v33, "_imageForPID:", Int64Ranged);
      if (v24)
      {
        [v29 setFallbackImage:v24];
      }

      else
      {
        id v16 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v33, "_assetsBundle");
        v15 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"ShareAudioAirPods");
        objc_msgSend(v29, "setFallbackImage:");
      }

      objc_storeStrong(&v24, 0LL);
    }

    id v14 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
    v34[0] = v14;
    +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
    id v13 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    v34[1] = v13;
    id v12 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
    v34[2] = v12;
    v11 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"HeadphoneDetails",  318.0);
    v34[3] = v11;
    double v10 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"HeadphoneName");
    v34[4] = v10;
    id v9 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    v34[5] = v9;
    double v8 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Connecting");
    v34[6] = v8;
    id v7 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
    v34[7] = v7;
    +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
    SEL v6 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Cancel");
    v34[8] = v6;
    unsigned int v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 9LL);
    id v4 = -[TVSSShareAudioPanelPlatterController renderers](v33, "renderers");
    id v23 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v5);

    id v22 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    -[TVSSShareAudioPanelPlatterController applyLayout:animator:](v33, "applyLayout:animator:", v23, v22);
    -[TVSSShareAudioPanelPlatterController reloadContent](v33, "reloadContent");
    -[TVSSShareAudioPanelPlatterController _updatePlatterSizeWithAnimator:](v33, "_updatePlatterSizeWithAnimator:", v22);
    objc_storeStrong(&v22, 0LL);
    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  objc_storeStrong(&location, 0LL);
}

- (void)_showErrorWithInfo:(id)a3
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  v24[0] = v19;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v18 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v24[1] = v18;
  id v17 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  v24[2] = v17;
  id v16 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v24[3] = v16;
  v15 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"ErrorTitle");
  v24[4] = v15;
  id v14 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
  v24[5] = v14;
  +[TVSPConstants tallRowHeight](&OBJC_CLASS___TVSPConstants, "tallRowHeight");
  double v8 = v3;
  +[TVSSShareAudioPanelPlatterController _textContentInsets]( &OBJC_CLASS___TVSSShareAudioPanelPlatterController,  "_textContentInsets");
  v20[1] = v4;
  v20[2] = v5;
  v20[3] = v6;
  v20[4] = v7;
  id v13 =  +[TVSPRow rowWithIdentifier:height:contentInsets:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:contentInsets:",  @"ErrorDescription",  v8,  *(double *)&v4,  *(double *)&v5,  *(double *)&v6,  *(double *)&v7);
  v24[6] = v13;
  id v12 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 32.0);
  v24[7] = v12;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v11 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"OK");
  v24[8] = v11;
  double v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 9LL);
  id v9 = -[TVSSShareAudioPanelPlatterController renderers](v23, "renderers");
  id v21 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v10);

  v20[0] = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSShareAudioPanelPlatterController applyLayout:animator:](v23, "applyLayout:animator:", v21, v20[0]);
  -[TVSSShareAudioPanelPlatterController reloadContent](v23, "reloadContent");
  -[TVSSShareAudioPanelPlatterController _updatePlatterSizeWithAnimator:]( v23,  "_updatePlatterSizeWithAnimator:",  v20[0]);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_imageForPID:(unsigned int)a3
{
  id v12 = self;
  SEL v11 = a2;
  unsigned int v10 = a3;
  unsigned int v9 = 0;
  if (a3 == 8208)
  {
    unsigned int v9 = 1;
  }

  else
  {
    switch(v10)
    {
      case 0x200Cu:
        unsigned int v9 = 1;
        break;
      case 0x2009u:
        unsigned int v9 = 1;
        break;
      case 0x200Bu:
        unsigned int v9 = 1;
        break;
      case 0x2012u:
        unsigned int v9 = 1;
        break;
      case 0x10000u:
        unsigned int v10 = 8207;
        break;
    }
  }

  double v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"ShareAudioDetail-PID-%u-CL_%u",  v10,  v9);
  id v4 = v8;
  id v5 = -[TVSSShareAudioPanelPlatterController _assetsBundle](v12, "_assetsBundle");
  id v7 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v4);

  SEL v6 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v6;
}

- (id)_moviePathForPID:(unsigned int)a3
{
  id v13 = self;
  SEL v12 = a2;
  unsigned int v11 = a3;
  unsigned int v10 = 0;
  if (a3 == 8208)
  {
    unsigned int v10 = 1;
  }

  else
  {
    switch(v11)
    {
      case 0x200Cu:
        unsigned int v10 = 1;
        break;
      case 0x2009u:
        unsigned int v10 = 1;
        break;
      case 0x200Bu:
        unsigned int v10 = 1;
        break;
      case 0x2017u:
        unsigned int v10 = 1;
        break;
      case 0x2026u:
        unsigned int v10 = 1;
        break;
      case 0x2012u:
        unsigned int v10 = 1;
        break;
      case 0x201Du:
        unsigned int v10 = 1;
        break;
      case 0x201Fu:
        unsigned int v10 = 19;
        break;
      case 0x2016u:
        unsigned int v10 = 1;
        break;
      case 0x10000u:
        unsigned int v11 = 8207;
        break;
      case 0x2019u:
      case 0x201Bu:
      case 0x201Eu:
      case 0x2020u:
        unsigned int v11 = 8217;
        break;
    }
  }

  id v5 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  -[UIScreen scale](v5, "scale");
  unsigned int v6 = v3;

  char v9 = v6;
  double v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"ShareAudioDetail-PID-%u-CL_%u-%ux",  v11,  v10,  v6);
  id v7 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v7;
}

- (id)_deviceNameForInfo:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = location[0];
  CFTypeID TypeID = CFStringGetTypeID();
  id v7 = (id)CFDictionaryGetTypedValue(v5, @"deviceName", TypeID, 0LL);
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(location[0], @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
  if (v7)
  {
    id v9 = v7;
  }

  else if (Int64Ranged)
  {
    id v9 = (id)SFLocalizedNameForBluetoothProductID(Int64Ranged);
  }

  else
  {
    id v9 = TVSSLocString(@"TVSSHeadphonesShareAudioStepTitle");
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (id)_pairingInstructionsForInfo:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int Int64Ranged = CFDictionaryGetInt64Ranged(location[0], @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
  id v5 = 0LL;
  if (Int64Ranged == 8203)
  {
    objc_storeStrong(&v5, @"TVSSHeadphonesShareAudioInsidePairCaptionTitle");
  }

  else if (Int64Ranged == 8202)
  {
    objc_storeStrong(&v5, @"TVSSHeadphonesShareAudioNoisePairCaptionTitle");
  }

  else if ((sub_100121FCC(Int64Ranged) & 1) != 0)
  {
    objc_storeStrong(&v5, @"TVSSHeadphonesShareAudioBackPairCaptionTitle");
  }

  else
  {
    objc_storeStrong(&v5, @"TVSSHeadphonesShareAudioGenericPairCaptionTitle");
  }

  id v4 = TVSSLocString(v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)_connectingStringForEvent:(int)a3
{
  if (a3 == 220) {
    return TVSSLocString(@"TVSSHeadphonesShareAudioWaitingForAcceptCaption");
  }
  else {
    return TVSSLocString(@"TVSSHeadphonesShareAudioConnectingCaption");
  }
}

- (void)_notifyShareAudioCompletedWithSuccess:(BOOL)a3
{
  BOOL v6 = a3;
  double v3 = -[TVSSShareAudioPanelPlatterController shareAudioDelegate](self, "shareAudioDelegate");
  -[TVSSShareAudioPanelPlatterControllerDelegate shareAudioDidComplete:](v3, "shareAudioDidComplete:", v6);

  id v5 = -[TVSSShareAudioPanelPlatterController currentHostingContext](self, "currentHostingContext");
  id v4 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  objc_msgSend(v5, "popPlatterControllerWithAnimator:");
}

- (id)_assetsBundle
{
  id v4 = (dispatch_once_t *)&unk_100221E20;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BB968);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221E18;
}

+ (NSDirectionalEdgeInsets)_textContentInsets
{
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

  ;
}

- (TVSSShareAudioPanelPlatterControllerDelegate)shareAudioDelegate
{
  return (TVSSShareAudioPanelPlatterControllerDelegate *)objc_loadWeakRetained((id *)&self->_shareAudioDelegate);
}

- (void)setShareAudioDelegate:(id)a3
{
}

- (BTShareAudioSessionClient)sessionClient
{
  return self->_sessionClient;
}

- (void)setSessionClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end