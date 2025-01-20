@interface SCATAppleTVRemoteButtonView
- (AXElementGroup)parentGroup;
- (BOOL)scatAssistiveTechFocused;
- (BOOL)scatBeginScanningFromSelfAfterActivation;
- (BOOL)scatCanShowAlternateKeys;
- (BOOL)scatHidesGroupCursorWhenFocused;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatIsAXElement;
- (BOOL)scatIsAuxiliaryElement;
- (BOOL)scatIsKeyboardKey;
- (BOOL)scatIsMemberOfGroup;
- (BOOL)scatIsOnScreen;
- (BOOL)scatIsValid;
- (BOOL)scatPathIsInSceneReferenceSpace;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatUpdatesMenu;
- (BOOL)updateFocusState:(int64_t)a3;
- (CGPath)scatPath;
- (CGPoint)scatCenterPoint;
- (CGPoint)scatScreenPointForOperations;
- (CGRect)frame;
- (CGRect)scatFrame;
- (CGRect)scatTextCursorFrame;
- (CGSize)intrinsicContentSize;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (SCATAppleTVRemoteButtonView)initWithGlyphName:(id)a3 shape:(int64_t)a4;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (UIImage)containingGroupFocusedBackgroundImage;
- (UIImage)focusedBackgroundImage;
- (UIImage)unfocusedBackgroundImage;
- (UIImageView)backgroundImageView;
- (UIImageView)glyphImageView;
- (id)activateActionHandler;
- (int)scatPid;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (unsigned)scatDisplayId;
- (void)_backgroundImagesForShape:(int64_t)a3 unfocusedImageRef:(id *)a4 containingGroupFocusedImageRef:(id *)a5 focusedImageRef:(id *)a6;
- (void)setActivateActionHandler:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setContainingGroupFocusedBackgroundImage:(id)a3;
- (void)setFocusedBackgroundImage:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setParentGroup:(id)a3;
- (void)setScatAssistiveTechFocused:(BOOL)a3;
- (void)setUnfocusedBackgroundImage:(id)a3;
@end

@implementation SCATAppleTVRemoteButtonView

- (SCATAppleTVRemoteButtonView)initWithGlyphName:(id)a3 shape:(int64_t)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteButtonView;
  v7 = -[SCATCustomFocusingView initWithFrame:]( &v40,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    -[SCATAppleTVRemoteButtonView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v38 = 0LL;
    id v39 = 0LL;
    id v37 = 0LL;
    -[SCATAppleTVRemoteButtonView _backgroundImagesForShape:unfocusedImageRef:containingGroupFocusedImageRef:focusedImageRef:]( v8,  "_backgroundImagesForShape:unfocusedImageRef:containingGroupFocusedImageRef:focusedImageRef:",  a4,  &v39,  &v38,  &v37);
    id v9 = v39;
    id v10 = v38;
    id v11 = v37;
    -[SCATAppleTVRemoteButtonView setUnfocusedBackgroundImage:](v8, "setUnfocusedBackgroundImage:", v9);
    -[SCATAppleTVRemoteButtonView setFocusedBackgroundImage:](v8, "setFocusedBackgroundImage:", v11);
    -[SCATAppleTVRemoteButtonView setContainingGroupFocusedBackgroundImage:]( v8,  "setContainingGroupFocusedBackgroundImage:",  v10);
    v12 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v9);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATAppleTVRemoteButtonView addSubview:](v8, "addSubview:", v12);
    -[SCATAppleTVRemoteButtonView setBackgroundImageView:](v8, "setBackgroundImageView:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](v8, "backgroundImageView"));
    [v13 setContentMode:4];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v12, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v8, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
    [v16 setActive:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v12, "rightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView rightAnchor](v8, "rightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
    [v19 setActive:1];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v12, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v8, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
    [v22 setActive:1];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v12, "leftAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView leftAnchor](v8, "leftAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
    [v25 setActive:1];

    if (v6)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v6));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 imageWithRenderingMode:2]);

      v28 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v27);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v28,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[SCATAppleTVRemoteButtonView addSubview:](v8, "addSubview:", v28);
      -[SCATAppleTVRemoteButtonView setGlyphImageView:](v8, "setGlyphImageView:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](v8, "glyphImageView"));
      [v29 setContentMode:4];

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v28, "centerXAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v12, "centerXAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v31]);
      [v32 setActive:1];

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v28, "centerYAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v12, "centerYAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v34]);
      [v35 setActive:1];
    }
  }

  return v8;
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_backgroundImagesForShape:(int64_t)a3 unfocusedImageRef:(id *)a4 containingGroupFocusedImageRef:(id *)a5 focusedImageRef:(id *)a6
{
  if ((unint64_t)a3 > 4)
  {
    id v15 = 0LL;
    v14 = 0LL;
    id v11 = 0LL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v9 = (uint64_t)*(&off_100124750 + a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", *(&off_100124728 + a3)));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 imageWithRenderingMode:2]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v9));
  id v15 = (id)objc_claimAutoreleasedReturnValue([v12 imageWithRenderingMode:2]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v9));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 imageWithRenderingMode:2]);

  if (a4) {
LABEL_5:
  }
    *a4 = v15;
LABEL_6:
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = v11;
  }
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteButtonView;
  BOOL v5 = -[SCATCustomFocusingView updateFocusState:](&v44, "updateFocusState:");
  if (v5)
  {
    switch(a3)
    {
      case 0LL:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        objc_msgSend( v17,  "_setDrawsAsBackdropOverlayWithBlendMode:",  objc_msgSend(v18, "menuKnockoutBorderOverlayBlendMode"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        [v20 menuKnockoutBorderOpacity];
        objc_msgSend(v19, "setAlpha:");

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 menuKnockoutColor]);
        [v21 setTintColor:v23];

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        [v25 menuKnockoutBorderOpacity];
        objc_msgSend(v24, "setAlpha:");

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        objc_msgSend( v26,  "_setDrawsAsBackdropOverlayWithBlendMode:",  objc_msgSend(v27, "menuKnockoutBorderOverlayBlendMode"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView unfocusedBackgroundImage](self, "unfocusedBackgroundImage"));
        [v28 setImage:v29];

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 menuKnockoutColor]);
        [v30 setTintColor:v32];

LABEL_9:
        return v5;
      case 2LL:
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        [v33 _setDrawsAsBackdropOverlayWithBlendMode:0];

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        [v34 setAlpha:1.0];

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        *(void *)&double v37 = objc_opt_class(self, v36).n128_u64[0];
        id v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "focusedGroupStateContentsColor", v37));
        [v35 setTintColor:v39];

        objc_super v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        [v40 setAlpha:1.0];

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        [v41 _setDrawsAsBackdropOverlayWithBlendMode:0];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        uint64_t v16 = objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemoteButtonView containingGroupFocusedBackgroundImage]( self,  "containingGroupFocusedBackgroundImage"));
        goto LABEL_8;
      case 1LL:
        double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        [v6 _setDrawsAsBackdropOverlayWithBlendMode:0];

        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        [v7 setAlpha:1.0];

        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView glyphImageView](self, "glyphImageView"));
        *(void *)&double v10 = objc_opt_class(self, v9).n128_u64[0];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "focusedStateContentsColor", v10));
        [v8 setTintColor:v12];

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        [v13 setAlpha:1.0];

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        [v14 _setDrawsAsBackdropOverlayWithBlendMode:0];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView focusedBackgroundImage](self, "focusedBackgroundImage"));
LABEL_8:
        v42 = (void *)v16;
        [v15 setImage:v16];

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView backgroundImageView](self, "backgroundImageView"));
        [v30 setTintColor:0];
        goto LABEL_9;
    }
  }

  return v5;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (BOOL)scatBeginScanningFromSelfAfterActivation
{
  return 1;
}

- (BOOL)scatPerformAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView activateActionHandler](self, "activateActionHandler"));

  if (v5)
  {
    double v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView activateActionHandler](self, "activateActionHandler"));
    v6[2]();

    return 1;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteButtonView;
    return -[SCATAppleTVRemoteButtonView scatPerformAction:](&v8, "scatPerformAction:", v3);
  }

- (unsigned)scatDisplayId
{
  return 1;
}

- (unint64_t)scatScanningBehaviorTraits
{
  return self->scatScanningBehaviorTraits;
}

- (CGPath)scatPath
{
  return self->scatPath;
}

- (BOOL)scatIsAXElement
{
  return self->scatIsAXElement;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return self->scatHidesGroupCursorWhenFocused;
}

- (unint64_t)scatTraits
{
  return self->scatTraits;
}

- (CGRect)scatFrame
{
  double x = self->scatFrame.origin.x;
  double y = self->scatFrame.origin.y;
  double width = self->scatFrame.size.width;
  double height = self->scatFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)scatAlternateKeys
{
  return self->scatAlternateKeys;
}

- (NSNumber)scatOverrideCursorTheme
{
  return self->scatOverrideCursorTheme;
}

- (CGRect)scatTextCursorFrame
{
  double x = self->scatTextCursorFrame.origin.x;
  double y = self->scatTextCursorFrame.origin.y;
  double width = self->scatTextCursorFrame.size.width;
  double height = self->scatTextCursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)scatActivateBehavior
{
  return self->scatActivateBehavior;
}

- (BOOL)scatIsKeyboardKey
{
  return self->scatIsKeyboardKey;
}

- (NSArray)scatCustomActions
{
  return self->scatCustomActions;
}

- (NSArray)scatCustomHardwareActions
{
  return self->scatCustomHardwareActions;
}

- (BOOL)scatIsValid
{
  return self->scatIsValid;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return self->scatPathIsInSceneReferenceSpace;
}

- (BOOL)scatCanShowAlternateKeys
{
  return self->scatCanShowAlternateKeys;
}

- (BOOL)scatAssistiveTechFocused
{
  return self->scatAssistiveTechFocused;
}

- (void)setScatAssistiveTechFocused:(BOOL)a3
{
  self->scatAssistiveTechFocused = a3;
}

- (BOOL)scatIsAuxiliaryElement
{
  return self->scatIsAuxiliaryElement;
}

- (AXElementGroup)parentGroup
{
  return self->parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->parentGroup = (AXElementGroup *)a3;
}

- (CGRect)frame
{
  double x = self->frame.origin.x;
  double y = self->frame.origin.y;
  double width = self->frame.size.width;
  double height = self->frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)scatCenterPoint
{
  double x = self->scatCenterPoint.x;
  double y = self->scatCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return self->scatShouldAllowDeferFocusToNativeFocusedElement;
}

- (BOOL)scatIsMemberOfGroup
{
  return self->scatIsMemberOfGroup;
}

- (NSArray)scatDrags
{
  return self->scatDrags;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return self->scatAuxiliaryElementManager;
}

- (BOOL)scatIsOnScreen
{
  return self->scatIsOnScreen;
}

- (int)scatPid
{
  return self->scatPid;
}

- (NSArray)scatDrops
{
  return self->scatDrops;
}

- (BOOL)scatUpdatesMenu
{
  return self->scatUpdatesMenu;
}

- (CGPoint)scatScreenPointForOperations
{
  double x = self->scatScreenPointForOperations.x;
  double y = self->scatScreenPointForOperations.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return self->scatShouldSuppressAudioOutput;
}

- (id)activateActionHandler
{
  return self->_activateActionHandler;
}

- (void)setActivateActionHandler:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
}

- (UIImage)focusedBackgroundImage
{
  return self->_focusedBackgroundImage;
}

- (void)setFocusedBackgroundImage:(id)a3
{
}

- (UIImage)containingGroupFocusedBackgroundImage
{
  return self->_containingGroupFocusedBackgroundImage;
}

- (void)setContainingGroupFocusedBackgroundImage:(id)a3
{
}

- (UIImage)unfocusedBackgroundImage
{
  return self->_unfocusedBackgroundImage;
}

- (void)setUnfocusedBackgroundImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end