@interface PBPIPControl
+ (id)cancelPictureInPicture;
+ (id)controlWithLocalizedTitleKey:(id)a3 image:(id)a4 accessibilityIdentifier:(id)a5 accessibilityLabelKey:(id)a6;
+ (id)controlWithLocalizedTitleKey:(id)a3 systemImageName:(id)a4 accessibilityIdentifier:(id)a5 accessibilityLabelKey:(id)a6;
+ (id)end;
+ (id)hidePictureInPicture;
+ (id)hideSplitView;
+ (id)layoutOptionFullScreenPictureInPicture;
+ (id)layoutOptionFullScreenSplitView;
+ (id)layoutOptionPictureInPicture;
+ (id)layoutOptionSplitView;
+ (id)movePictureInPictureWithCurrentQuadrant:(int64_t)a3;
+ (id)pictureInPictureLayout;
+ (id)splitViewLayout;
+ (id)stopPictureInPicture;
- (BOOL)isDestructive;
- (NSString)localizedTitle;
- (PBPIPControl)initWithLocalizedTitleKey:(id)a3 image:(id)a4;
- (UIImage)image;
- (id)createActionWithHandler:(id)a3;
- (id)createButton;
- (void)_updateAX:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)updateAction:(id)a3;
- (void)updateButton:(id)a3;
@end

@implementation PBPIPControl

- (PBPIPControl)initWithLocalizedTitleKey:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBPIPControl;
  v8 = -[PBPIPControl init](&v13, "init");
  if (v8)
  {
    id v9 = sub_1001C307C(v6, 0LL);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    localizedTitle = v8->_localizedTitle;
    v8->_localizedTitle = (NSString *)v10;

    objc_storeStrong((id *)&v8->_image, a4);
  }

  return v8;
}

+ (id)controlWithLocalizedTitleKey:(id)a3 image:(id)a4 accessibilityIdentifier:(id)a5 accessibilityLabelKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithLocalizedTitleKey:v13 image:v12];

  id v15 = sub_1001C307C(v10, 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  [v14 setAccessibilityLabel:v16];
  [v14 setAccessibilityIdentifier:v11];

  return v14;
}

+ (id)controlWithLocalizedTitleKey:(id)a3 systemImageName:(id)a4 accessibilityIdentifier:(id)a5 accessibilityLabelKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", a4));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:v12 image:v13 accessibilityIdentifier:v11 accessibilityLabelKey:v10]);

  return v14;
}

- (void)_updateAX:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl accessibilityIdentifier](self, "accessibilityIdentifier"));
  [v4 setAccessibilityIdentifier:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl accessibilityLabel](self, "accessibilityLabel"));
  [v4 setAccessibilityLabel:v6];
}

- (void)updateButton:(id)a3
{
  id v4 = a3;
  else {
    uint64_t v5 = 0LL;
  }
  [v4 setRole:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl image](self, "image"));
  [v4 setImage:v6];

  -[PBPIPControl _updateAX:](self, "_updateAX:", v4);
}

- (void)updateAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl localizedTitle](self, "localizedTitle"));
  [v4 setTitle:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl image](self, "image"));
  [v4 setImage:v6];

  -[PBPIPControl _updateAX:](self, "_updateAX:", v4);
}

- (id)createButton
{
  v3 = objc_alloc(&OBJC_CLASS___PBPIPControlButton);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl image](self, "image"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl localizedTitle](self, "localizedTitle"));
  id v6 = -[PBPIPControlButton initWithImage:title:](v3, "initWithImage:title:", v4, v5);

  -[PBPIPControl updateButton:](self, "updateButton:", v6);
  return v6;
}

- (id)createActionWithHandler:(id)a3
{
  id v4 = (Block_layout *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = &stru_1003DAB50;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl localizedTitle](self, "localizedTitle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControl image](self, "image"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  v7,  0LL,  v5));

  -[PBPIPControl _updateAX:](self, "_updateAX:", v8);
  return v8;
}

+ (id)hidePictureInPicture
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleStash" systemImageName:@"rectangle.slash" accessibilityIdentifier:0 access ibilityLabelKey:@"PIPToggleStashingAXTitle"]);
}

+ (id)movePictureInPictureWithCurrentQuadrant:(int64_t)a3
{
  uint64_t v4 = sub_1001356C8(a3);
  uint64_t v5 = PBSPIPMoveSystemImageNameForQuadrant(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleMove" systemImageName:v6 accessibilityIdentifier:0 accessibilityLabelKey:@"PIPMoveButtonAXTitle"]);

  return v7;
}

+ (id)stopPictureInPicture
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleExpand" systemImageName:@"pip.exit" accessibilityIdentifier:0 access ibilityLabelKey:@"PIPStopButtonAXTitle"]);
}

+ (id)cancelPictureInPicture
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleClose" systemImageName:@"xmark" accessibilityIdentifier:0 access ibilityLabelKey:@"PIPCancelButtonAXTitle"]);
}

+ (id)pictureInPictureLayout
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleLayout" systemImageName:@"pip.fill" accessibilityIdentifier:0 access ibilityLabelKey:@"PIPEditingAXTitleLayout"]);
}

+ (id)hideSplitView
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"SplitViewSidebarStashTitle" systemImageName:@"rectangle.portrait.slash" accessibilityIdentifier:@"PBSplitViewHide" access ibilityLabelKey:@"SplitViewHideAXTitle"]);
}

+ (id)splitViewLayout
{
  v3 = sub_100193800();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPEditingButtonTitleLayout" systemImageName:v4 accessibilityIdentifier:0 accessibilityLabelKey:@"PIPEditingAXTitleLayout"]);

  return v5;
}

+ (id)layoutOptionPictureInPicture
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPLayoutPictureInPictureTitle" systemImageName:@"pip.fill" accessibilityIdentifier:0 access ibilityLabelKey:@"SplitViewSidebarStartPiPTitle"]);
}

+ (id)layoutOptionSplitView
{
  v3 = sub_100193800();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPLayoutSplitViewTitle" systemImageName:v4 accessibilityIdentifier:0 accessibilityLabelKey:@"PIPEnterSplitViewAXTitle"]);

  return v5;
}

+ (id)layoutOptionFullScreenSplitView
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPLayoutExpandTitle" systemImageName:@"rectangle.inset.filled" accessibilityIdentifier:0 access ibilityLabelKey:@"SplitViewSidebarExpandAXTitle"]);
}

+ (id)layoutOptionFullScreenPictureInPicture
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:@"PIPLayoutExpandTitle" systemImageName:@"pip.exit" accessibilityIdentifier:0 access ibilityLabelKey:@"PIPStopButtonAXTitle"]);
}

+ (id)end
{
  if (+[TUCallCenter isCurrentJoinedConservationGroupFaceTime]( &OBJC_CLASS___TUCallCenter,  "isCurrentJoinedConservationGroupFaceTime"))
  {
    v3 = @"PIPEditingButtonTitleLeaveCall";
  }

  else
  {
    v3 = @"PIPEditingButtonTitleEndCall";
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [a1 controlWithLocalizedTitleKey:v3 systemImageName:@"xmark" accessibilityIdentifier:0 accessibilityLabelKey:@"PIPCancelButtonAXTitle"]);
  [v4 setDestructive:1];
  return v4;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void).cxx_destruct
{
}

@end