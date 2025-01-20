@interface TVSSFaceTimePlatterController
+ (id)callControlsStylingBlockWithSelectionColor:(id)a3;
+ (id)cameraContentFromBackingStore:(id)a3;
+ (id)faceTimeAndSharePlayActivityLayoutProvidersFromBackingStore:(id)a3;
+ (id)faceTimeOnlyLayoutProvidersFromBackingStore:(id)a3;
+ (id)layoutFromBackingStore:(id)a3;
+ (id)layoutProvidersFromBackingStore:(id)a3;
+ (id)micContentFromBackingStore:(id)a3;
+ (id)micIdentifierFromBackingStore:(id)a3;
+ (id)nearbyConversationLayoutProvidersFromBackingStore:(id)a3;
+ (id)renderersFromBackingStore:(id)a3;
+ (id)sharePlayActivityLayoutProvidersFromBackingStore:(id)a3;
+ (id)sharePlayContentFromBackingStore:(id)a3;
+ (id)sharePlayOnlyLayoutProvidersFromBackingStore:(id)a3;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (TVSSFaceTimePlatterController)initWithIdentifier:(id)a3;
- (id)contextMenuConfigurationForRenderer:(id)a3;
- (id)state;
- (void)faceTimePlatterBackingStoreDidChange:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setBackingStore:(id)a3;
@end

@implementation TVSSFaceTimePlatterController

+ (id)micContentFromBackingStore:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"mic.slash.fill");
  v5 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( TVSPContent,  "contentWithTitle:image:text1:isSelected:",  0,  v4,  0,  (unint64_t)[location[0] isUplinkMuted] & 1);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)cameraContentFromBackingStore:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"video.fill");
  v5 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( TVSPContent,  "contentWithTitle:image:text1:isSelected:",  0,  v4,  0,  (unint64_t)[location[0] isSendingVideo] & 1);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)sharePlayContentFromBackingStore:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(&OBJC_CLASS___TVSSharePlayButtonContent);
  v8 = -[TVSSharePlayButtonContent initWithBackingStore:](v3, "initWithBackingStore:", location[0]);
  v5 = v8;
  id v6 = [location[0] platterState];
  -[TVSSharePlayButtonContent setContentIsDisabled:]( v5,  "setContentIsDisabled:",  (unint64_t)[v6 isEqual:@"FaceTimeOnly"] & 1);

  v7 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

+ (id)callControlsStylingBlockWithSelectionColor:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_10008125C;
  v9 = &unk_1001B8FB8;
  id v10 = location[0];
  id v4 = objc_retainBlock(&v5);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)renderersFromBackingStore:(id)a3
{
  id v72 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v70 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = objc_alloc(&OBJC_CLASS___TVSSFaceTimeCallSummaryContent);
  v69 = -[TVSSFaceTimeCallSummaryContent initWithBackingStore:](v3, "initWithBackingStore:", location[0]);
  int v7 = -[TVSPRenderer initWithIdentifier:format:content:overrideStylings:]( objc_alloc(&OBJC_CLASS___TVSPRenderer),  "initWithIdentifier:format:content:overrideStylings:",  @"call_summary");
  v80 = v7;
  int v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v80);
  -[NSMutableArray addObjectsFromArray:](v70, "addObjectsFromArray:");

  id v8 = [location[0] availableActivitySession];
  id v68 = [v8 activity];

  v67 = -[TVSSFaceTimeActivityContent initWithActivity:]( objc_alloc(&OBJC_CLASS___TVSSFaceTimeActivityContent),  "initWithActivity:",  v68);
  id v24 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v23 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
  id v22 = +[TVSPViewAttribute backgroundColor:](&OBJC_CLASS___TVSPViewAttribute, "backgroundColor:");
  v78[0] = v22;
  id v21 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v78[1] = v21;
  id v20 = +[TVSPViewAttribute cornerRadius:](&OBJC_CLASS___TVSPViewAttribute, "cornerRadius:", 10.0);
  v78[2] = v20;
  id v19 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:");
  v78[3] = v19;
  id v18 =  +[TVSPLayerAttribute minificationFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "minificationFilter:",  kCAFilterTrilinear);
  v78[4] = v18;
  v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 5LL);
  v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v24);
  v79[0] = v16;
  id v15 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  id v14 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v77[0] = v14;
  id v13 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:", 1LL);
  v77[1] = v13;
  id v12 =  +[TVSPLayerAttribute minificationFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "minificationFilter:",  kCAFilterTrilinear);
  v77[2] = v12;
  v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77);
  id v10 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v15);
  v79[1] = v10;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL);
  v66 =  +[TVSSArtworkInfoRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSSArtworkInfoRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"activity",  16LL,  v67);

  -[TVSSArtworkInfoRenderer setArtworkContentMode:](v66, "setArtworkContentMode:", 0LL);
  -[NSMutableArray addObject:](v70, "addObject:", v66);
  id v25 = [v72 micContentFromBackingStore:location[0]];
  v65 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:",  @"mute");

  id v26 = v72;
  v28 = +[UIColor redColor](&OBJC_CLASS___UIColor, "redColor");
  id v27 = objc_msgSend(v26, "callControlsStylingBlockWithSelectionColor:");
  -[TVSPStylingBlockRenderer setStylingBlock:](v65, "setStylingBlock:");

  id v29 = [v72 cameraContentFromBackingStore:location[0]];
  v64 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:",  @"video",  6LL);

  id v30 = v72;
  id v32 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
  id v31 = objc_msgSend(v30, "callControlsStylingBlockWithSelectionColor:");
  -[TVSPStylingBlockRenderer setStylingBlock:](v64, "setStylingBlock:");

  id v33 = [v72 sharePlayContentFromBackingStore:location[0]];
  v63 =  +[TVSSSharePlayButtonRenderer rendererWithIdentifier:format:content:backingStore:]( &OBJC_CLASS___TVSSSharePlayButtonRenderer,  "rendererWithIdentifier:format:content:backingStore:",  @"shareplay",  6LL);

  id v34 = v72;
  id v36 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
  id v35 = objc_msgSend(v34, "callControlsStylingBlockWithSelectionColor:");
  -[TVSSSharePlayButtonRenderer setStylingBlock:](v63, "setStylingBlock:");

  id v37 = [location[0] currentSessionDeviceHandle];
  if ([v37 deviceModel] == (id)2) {
    id v4 = @"ipad.and.arrow.forward";
  }
  else {
    id v4 = @"iphone.and.arrow.forward";
  }
  v62 = v4;

  v38 = v70;
  v76[0] = v65;
  v76[1] = v64;
  v76[2] = v63;
  id v54 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"xmark");
  v53 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  id v52 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v51 = +[UIColor redColor](&OBJC_CLASS___UIColor, "redColor");
  id v50 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
  id v74 = v50;
  v49 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL);
  v48 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v52);
  v75 = v48;
  v47 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL);
  v46 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"leave",  6LL,  v53);
  v76[3] = v46;
  id v45 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v62);
  v44 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  v43 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"leave_shareplay",  6LL);
  v76[4] = v43;
  id v42 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"mic.slash.fill");
  v41 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  v40 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"unmute_context_menu",  6LL);
  v76[5] = v40;
  v39 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 6LL);
  -[NSMutableArray addObjectsFromArray:](v38, "addObjectsFromArray:");

  v55 = v70;
  v60 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v73[0] = v60;
  id v59 = TVSSLagunaLocalizedString(@"ExpanseCCCurrentlyPlaying");
  v58 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v57 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"activityTitle",  3LL);
  v73[1] = v57;
  v56 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL);
  -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:");

  v61 = v70;
  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong((id *)&v66, 0LL);
  objc_storeStrong((id *)&v67, 0LL);
  objc_storeStrong(&v68, 0LL);
  objc_storeStrong((id *)&v69, 0LL);
  objc_storeStrong((id *)&v70, 0LL);
  objc_storeStrong(location, 0LL);
  return v61;
}

+ (id)micIdentifierFromBackingStore:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isUplinkMuted])
  {
    id v10 = [location[0] callCenter];
    id v9 = [v10 routeController];
    id v14 = [v9 pickedRoute];

    unsigned __int8 v11 = 0;
    unsigned __int8 v8 = 0;
    char v7 = 0;
    if (v14)
    {
      char v6 = 1;
      if ((v11 & 1) == 0) {
        char v6 = v8 & 1;
      }
      char v7 = v6;
    }

    if ((v7 & 1) != 0)
    {
      id v4 = [location[0] joinedActivitySession];
      char v12 = 0;
      BOOL v5 = 0;
      if (!v4)
      {
        id v13 = [location[0] currentCall];
        char v12 = 1;
        BOOL v5 = [v13 bluetoothAudioFormat] != (id)1;
      }

      if ((v12 & 1) != 0) {

      }
      if (v5) {
        v17 = @"mute";
      }
      else {
        v17 = @"unmute_context_menu";
      }
      int v15 = 1;
    }

    else
    {
      v17 = @"mute";
      int v15 = 1;
    }

    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    v17 = @"mute";
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v17;
}

+ (id)nearbyConversationLayoutProvidersFromBackingStore:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = [location[0] nearbyConversationIDsToDeviceHandles];
  char v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_100082560;
  id v10 = &unk_1001B8FE0;
  unsigned __int8 v11 = v12;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:");

  BOOL v5 = v12;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)sharePlayOnlyLayoutProvidersFromBackingStore:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v6 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"call_summary");
  v8[0] = v6;
  id v4 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:", &off_1001C85D0);
  v8[1] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)sharePlayActivityLayoutProvidersFromBackingStore:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v12 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"call_summary");
  v14[0] = v12;
  unsigned __int8 v11 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:", &off_1001C85E8);
  v14[1] = v11;
  id v10 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
  v14[2] = v10;
  id v9 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  v14[3] = v9;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v8 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v14[4] = v8;
  int v7 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"activityTitle");
  v14[5] = v7;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v6 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v14[6] = v6;
  id v4 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"activity");
  v14[7] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 8LL);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)faceTimeOnlyLayoutProvidersFromBackingStore:(id)a3
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"call_summary");
  v12[0] = v8;
  id v7 = [v10 micIdentifierFromBackingStore:location[0]];
  v11[0] = v7;
  v11[1] = @"video";
  v11[2] = @"shareplay";
  v11[3] = @"leave";
  id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 4LL);
  id v4 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:");
  v12[1] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)faceTimeAndSharePlayActivityLayoutProvidersFromBackingStore:(id)a3
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"call_summary");
  v18[0] = v14;
  id v13 = [v16 micIdentifierFromBackingStore:location[0]];
  v17[0] = v13;
  v17[1] = @"video";
  v17[2] = @"shareplay";
  v17[3] = @"leave";
  char v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL);
  unsigned __int8 v11 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:");
  v18[1] = v11;
  id v10 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
  v18[2] = v10;
  id v9 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  v18[3] = v9;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v8 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v18[4] = v8;
  id v7 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"activityTitle");
  v18[5] = v7;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v6 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v18[6] = v6;
  id v4 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"activity");
  v18[7] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 8LL);

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)layoutProvidersFromBackingStore:(id)a3
{
  id v18 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = [location[0] platterState];
  if ([v15 isEqual:@"NoConversations"])
  {
    id v14 = FaceTimeControllerLog();
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      id v10 = (os_log_s *)v14;
      os_log_type_t v11 = v13;
      sub_100010524(v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  v11,  "trying to present the FaceTime platter with no local or nearby conversations ongoing",  v12,  2u);
    }

    objc_storeStrong(&v14, 0LL);
  }

  else if ([v15 isEqual:@"NearbyConversations"])
  {
    id v9 = [v18 nearbyConversationLayoutProvidersFromBackingStore:location[0]];
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:");
  }

  else if ([v15 isEqual:@"SharePlayOnly"])
  {
    id v8 = [v18 sharePlayOnlyLayoutProvidersFromBackingStore:location[0]];
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:");
  }

  else if ([v15 isEqual:@"SharePlayActivity"])
  {
    id v7 = [v18 sharePlayActivityLayoutProvidersFromBackingStore:location[0]];
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:");
  }

  else if ([v15 isEqual:@"FaceTimeOnly"])
  {
    id v6 = [v18 faceTimeOnlyLayoutProvidersFromBackingStore:location[0]];
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:");
  }

  else if ([v15 isEqual:@"FaceTimeAndSharePlayActivity"])
  {
    id v5 = [v18 faceTimeAndSharePlayActivityLayoutProvidersFromBackingStore:location[0]];
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:");
  }

  id v4 = v16;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)layoutFromBackingStore:(id)a3
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [v8 layoutProvidersFromBackingStore:location[0]];
  id v4 = [v8 renderersFromBackingStore:location[0]];
  id v6 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v5);

  objc_storeStrong(location, 0LL);
  return v6;
}

- (TVSSFaceTimePlatterController)initWithIdentifier:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimePlatterBackingStore);
  id v18 = [(id)objc_opt_class(v21) layoutFromBackingStore:v19];
  id v17 = [(id)objc_opt_class(v21) renderersFromBackingStore:v19];
  objc_initWeak(&v16, v21);
  id v5 = v21;
  id v6 = location[0];
  id v7 = v18;
  id v8 = v17;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  char v13 = sub_100083474;
  id v14 = &unk_1001B6940;
  objc_copyWeak(&v15, &v16);
  id v21 = 0LL;
  v9.receiver = v5;
  v9.super_class = (Class)&OBJC_CLASS___TVSSFaceTimePlatterController;
  id v21 = -[TVSSFaceTimePlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v9,  "initWithIdentifier:layout:renderers:rendererProvider:",  v6,  v7,  v8,  &v10);
  objc_storeStrong(&v21, v21);
  if (v21)
  {
    objc_storeStrong((id *)v21 + 1, v19);
    [*((id *)v21 + 1) setDelegate:v21];
  }

  id v4 = (TVSSFaceTimePlatterController *)v21;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v21, 0LL);
  return v4;
}

- (id)state
{
  return -[TVSSFaceTimePlatterBackingStore platterState](self->_backingStore, "platterState", a2, self);
}

- (id)contextMenuConfigurationForRenderer:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqual:@"unmute_context_menu"];

  if ((v5 & 1) != 0)
  {
    int v12 = v14->_backingStore;
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    objc_super v9 = sub_100083A04;
    id v10 = &unk_1001B9058;
    int v11 = v12;
    id v15 =  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  &v6);
    objc_storeStrong((id *)&v11, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
  }

  else
  {
    id v15 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v15;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v38 = 0LL;
  objc_storeStrong(&v38, a4);
  v37.receiver = v40;
  v37.super_class = (Class)&OBJC_CLASS___TVSSFaceTimePlatterController;
  -[TVSSFaceTimePlatterController rendererWasSelected:context:](&v37, "rendererWasSelected:context:", location[0], v38);
  id v32 = [location[0] identifier];
  unsigned __int8 v33 = [v32 isEqual:@"shareplay"];

  if ((v33 & 1) != 0)
  {
    id v36 = -[TVSSFaceTimePlatterBackingStore joinedActivitySession](v40->_backingStore, "joinedActivitySession");
    if (v36) {
      -[TVSSFaceTimePlatterBackingStore presentDismissalAlertForCurrentActivitySession]( v40->_backingStore,  "presentDismissalAlertForCurrentActivitySession");
    }
    else {
      -[TVSSFaceTimePlatterBackingStore launchCurrentActivitySessionWithCompletion:]( v40->_backingStore,  "launchCurrentActivitySessionWithCompletion:",  &stru_1001B9098);
    }
    objc_storeStrong(&v36, 0LL);
  }

  else
  {
    id v29 = [location[0] identifier];
    unsigned __int8 v30 = [v29 isEqual:@"leave"];

    if ((v30 & 1) != 0)
    {
      -[TVSSFaceTimePlatterBackingStore leaveConversation](v40->_backingStore, "leaveConversation");
      id v27 = v38;
      id v28 = [location[0] identifier];
      objc_msgSend(v27, "dismissSystemMenuWithSourceIdentifier:");
    }

    else
    {
      id v25 = [location[0] identifier];
      unsigned __int8 v26 = [v25 isEqual:@"leave_shareplay"];

      if ((v26 & 1) != 0)
      {
        -[TVSSFaceTimePlatterBackingStore leaveConversation](v40->_backingStore, "leaveConversation");
        id v23 = v38;
        id v24 = [location[0] identifier];
        objc_msgSend(v23, "dismissSystemMenuWithSourceIdentifier:");
      }

      else
      {
        id v21 = [location[0] identifier];
        unsigned __int8 v22 = [v21 isEqual:@"mute"];

        if ((v22 & 1) != 0)
        {
          -[TVSSFaceTimePlatterBackingStore setUplinkMuted:]( v40->_backingStore,  "setUplinkMuted:",  !-[TVSSFaceTimePlatterBackingStore isUplinkMuted](v40->_backingStore, "isUplinkMuted"));
        }

        else
        {
          id v19 = [location[0] identifier];
          unsigned __int8 v20 = [v19 isEqual:@"video"];

          if ((v20 & 1) != 0)
          {
            -[TVSSFaceTimePlatterBackingStore setSendingVideo:]( v40->_backingStore,  "setSendingVideo:",  !-[TVSSFaceTimePlatterBackingStore isSendingVideo](v40->_backingStore, "isSendingVideo"));
          }

          else
          {
            id v17 = [location[0] identifier];
            unsigned __int8 v18 = [v17 isEqual:@"activity"];

            if ((v18 & 1) != 0)
            {
              -[TVSSFaceTimePlatterBackingStore launchCurrentActivitySessionWithCompletion:]( v40->_backingStore,  "launchCurrentActivitySessionWithCompletion:",  &stru_1001B90B8);
              id v15 = v38;
              id v16 = [location[0] identifier];
              objc_msgSend(v15, "dismissSystemMenuWithSourceIdentifier:");
            }

            else
            {
              id v13 = [location[0] identifier];
              unsigned __int8 v14 = [v13 isEqual:@"call_summary"];

              if ((v14 & 1) != 0)
              {
                id v35 =  +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
                -[FBSOpenApplicationService openApplication:withOptions:completion:]( v35,  "openApplication:withOptions:completion:",  @"com.apple.facetime",  0LL);
                id v11 = v38;
                id v12 = [location[0] identifier];
                objc_msgSend(v11, "dismissSystemMenuWithSourceIdentifier:");

                objc_storeStrong((id *)&v35, 0LL);
              }

              else
              {
                id v9 = [location[0] content];
                uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSSFaceTimeNearbyDeviceContent);
                char isKindOfClass = objc_opt_isKindOfClass(v9, v4);

                if ((isKindOfClass & 1) != 0)
                {
                  id v34 = [location[0] content];
                  backingStore = v40->_backingStore;
                  id v6 = [v34 conversationID];
                  -[TVSSFaceTimePlatterBackingStore joinNearbyConversationWithConversationID:]( backingStore,  "joinNearbyConversationWithConversationID:");

                  id v7 = v38;
                  id v8 = [location[0] identifier];
                  objc_msgSend(v7, "dismissSystemMenuWithSourceIdentifier:");

                  objc_storeStrong(&v34, 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)faceTimePlatterBackingStoreDidChange:(id)a3
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v23 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  id v10 = v25;
  v3 = (void *)objc_opt_class(v25);
  id v11 = [v3 layoutFromBackingStore:location[0]];
  -[TVSSFaceTimePlatterController applyLayout:animator:](v10, "applyLayout:animator:");

  id v12 = objc_alloc(&OBJC_CLASS___TVSSFaceTimeActivityContent);
  id v14 = [location[0] availableActivitySession];
  id v13 = [v14 activity];
  id v22 = -[TVSSFaceTimeActivityContent initWithActivity:](v12, "initWithActivity:");

  uint64_t v4 = objc_alloc(&OBJC_CLASS___TVSSFaceTimeCallSummaryContent);
  id v21 = -[TVSSFaceTimeCallSummaryContent initWithBackingStore:](v4, "initWithBackingStore:", location[0]);
  unsigned __int8 v5 = (void *)objc_opt_class(v25);
  id v20 = [v5 micContentFromBackingStore:location[0]];
  id v6 = (void *)objc_opt_class(v25);
  id v19 = [v6 cameraContentFromBackingStore:location[0]];
  id v7 = (void *)objc_opt_class(v25);
  id v18 = [v7 sharePlayContentFromBackingStore:location[0]];
  id v15 = v25;
  v26[0] = @"activity";
  v27[0] = v22;
  v26[1] = @"call_summary";
  v27[1] = v21;
  v26[2] = @"mute";
  v27[2] = v20;
  v26[3] = @"video";
  v27[3] = v19;
  v26[4] = @"shareplay";
  v27[4] = v18;
  id v16 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  5LL);
  -[TVSSFaceTimePlatterController applyContent:](v15, "applyContent:");

  -[TVSSFaceTimePlatterController _updatePlatterSizeWithAnimator:](v25, "_updatePlatterSizeWithAnimator:", v23);
  id v8 = [location[0] joinedConversation];
  BOOL v17 = v8 != 0LL;

  if (!v17)
  {
    id v9 = -[TVSSFaceTimePlatterController currentHostingContext](v25, "currentHostingContext");
    [v9 dismissSystemMenuWithSourceIdentifier:@"leave"];
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end