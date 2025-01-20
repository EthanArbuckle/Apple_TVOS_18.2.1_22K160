@interface SCATModernMenuItem
+ (CGSize)imageSize;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 activateHandler:(id)a8 updateHandler:(id)a9;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11;
+ (id)titleTextAttributes;
- (AXDispatchTimer)repeatItemWithDismissTimer;
- (AXNamedReplayableGesture)customGesture;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)didActivate;
- (BOOL)handleActivateWithElement:(id)a3;
- (BOOL)isAllowedWithAssistiveAccess;
- (BOOL)isAllowedWithGuidedAccess;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFlipForRTL;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)shouldUseActivityIndicator;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)menuItemGroupName;
- (NSString)title;
- (SCATElement)scatElement;
- (SCATModernMenuItem)init;
- (SCATModernMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11;
- (SCATModernMenuItemDelegate)delegate;
- (SCATSwitchTypingShortcut)customShortcut;
- (UIImage)image;
- (UIImage)resolvedImage;
- (double)iconImageAngle;
- (id)accessibilityLabel;
- (id)activateHandler;
- (id)description;
- (id)updateHandler;
- (unint64_t)activateBehavior;
- (unint64_t)style;
- (void)_updateVisuals;
- (void)activate;
- (void)flash;
- (void)resetActivation;
- (void)setActivateBehavior:(unint64_t)a3;
- (void)setActivateHandler:(id)a3;
- (void)setAllowsDwellScanningToAbortAfterTimeout:(BOOL)a3;
- (void)setCustomGesture:(id)a3;
- (void)setCustomShortcut:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIconImageAngle:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setMenuItemGroupName:(id)a3;
- (void)setRepeatItemWithDismissTimer:(id)a3;
- (void)setResolvedImage:(id)a3;
- (void)setScatElement:(id)a3;
- (void)setShouldFlipForRTL:(BOOL)a3;
- (void)setShouldSuppressAudioOutput:(BOOL)a3;
- (void)setShouldUseActivityIndicator:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)updateItem;
@end

@implementation SCATModernMenuItem

+ (id)titleTextAttributes
{
  if (qword_100157798 != -1) {
    dispatch_once(&qword_100157798, &stru_100124928);
  }
  return (id)qword_100157790;
}

+ (CGSize)imageSize
{
  double v2 = 120.0;
  double v3 = 120.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  *(void *)&double v17 = objc_opt_class(a1, v16).n128_u64[0];
  LOBYTE(v21) = 1;
  v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v18,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:",  v15,  v14,  v13,  v12,  a7,  1,  v17,  v21));

  return (SCATModernMenuItem *)v19;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  objc_opt_class(a1, v19);
  LOBYTE(v23) = a9;
  id v21 = [[v20 alloc] initWithIdentifier:v18 delegate:v17 title:v16 imageName:v15 activateBehavior:a7 allowedWithGuidedAccess:v9 allowedWithAssistiveAcces s:v23 activateHandler:0 updateHandler:0];

  return (SCATModernMenuItem *)v21;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11
{
  BOOL v11 = a8;
  id v18 = a11;
  id v19 = a10;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  objc_opt_class(a1, v24);
  LOBYTE(v28) = a9;
  id v26 = [[v25 alloc] initWithIdentifier:v23 delegate:v22 title:v21 imageName:v20 activateBehavior:a7 allowedWithGuidedAccess:v11 allowedWithAssistiveAcces s:v28 activateHandler:v19 updateHandler:v18];

  return (SCATModernMenuItem *)v26;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 activateHandler:(id)a8 updateHandler:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  *(void *)&double v23 = objc_opt_class(a1, v22).n128_u64[0];
  LOBYTE(v27) = 1;
  Class v25 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v24,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v21,  v20,  v19,  v18,  a7,  1,  v23,  v27,  v17,  v16));

  return (SCATModernMenuItem *)v25;
}

- (SCATModernMenuItem)init
{
  return 0LL;
}

- (SCATModernMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SCATModernMenuItem;
  double v23 = -[SCATModernMenuItem init](&v30, "init");
  id v24 = v23;
  if (v23)
  {
    -[SCATModernMenuItem setActivateHandler:](v23, "setActivateHandler:", v21);
    -[SCATModernMenuItem setUpdateHandler:](v24, "setUpdateHandler:", v22);
    -[SCATModernMenuItem setIdentifier:](v24, "setIdentifier:", v17);
    -[SCATModernMenuItem setDelegate:](v24, "setDelegate:", v18);
    -[SCATModernMenuItem setTitle:](v24, "setTitle:", v19);
    if (v20)
    {
      -[SCATModernMenuItem setImageName:](v24, "setImageName:", v20);
    }

    else
    {
      unint64_t v29 = a7;
      BOOL v25 = a8;
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATIcon_%@",  v17));
      -[SCATModernMenuItem setImageName:](v24, "setImageName:", v26);

      a8 = v25;
      a7 = v29;
    }

    -[SCATModernMenuItem setActivateBehavior:](v24, "setActivateBehavior:", a7);
    v24->_allowedWithGuidedAccess = a8;
    v24->_allowedWithAssistiveAccess = a9;
    -[SCATModernMenuItem setStyle:](v24, "setStyle:", 0LL);
    uint64_t v27 = -[SCATMenuItemElement initWithMenuItem:]( objc_alloc(&OBJC_CLASS___SCATMenuItemElement),  "initWithMenuItem:",  v24);
    -[SCATModernMenuItem setScatElement:](v24, "setScatElement:", v27);
  }

  return v24;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_didActivate));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. title:%@ didActivate:%@",  v5,  self,  v6,  v7));

  return v8;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[SCATModernMenuItem _updateVisuals](self, "_updateVisuals");
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[SCATModernMenuItem setStyle:](self, "setStyle:", a3);
  }

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[SCATModernMenuItem _updateVisuals](self, "_updateVisuals");
    v5 = v6;
  }
}

- (void)setIconImageAngle:(double)a3
{
  if (self->_iconImageAngle != a3)
  {
    self->_iconImageAngle = a3;
    -[SCATModernMenuItem _updateVisuals](self, "_updateVisuals");
  }

- (void)resetActivation
{
}

- (void)updateItem
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem updateHandler](self, "updateHandler"));
  if (v4)
  {
    double v2 = (unsigned int (**)(void, void))objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem updateHandler](self, "updateHandler"));
    if (((unsigned int (**)(void, SCATModernMenuItem *))v2)[2](v2, self))
    {

      goto LABEL_6;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
  unsigned int v6 = [v5 shouldUpdateMenuItem:self];

  if (v4)
  {

    if ((v6 & 1) == 0) {
      return;
    }
    goto LABEL_6;
  }

  if (v6) {
LABEL_6:
  }
    -[SCATModernMenuItem _updateVisuals](self, "_updateVisuals");
}

- (UIImage)resolvedImage
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem image](self, "image"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem image](self, "image"));
  }

  else
  {
    id v5 = sub_100093E24(self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return (UIImage *)v4;
}

- (BOOL)handleActivateWithElement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[SCATModernMenuItem activateBehavior](self, "activateBehavior");
  unsigned int v6 = -[SCATModernMenuItem didActivate](self, "didActivate");
  if (v6 && v5 - 5 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"This item already activated once and is not repeat scan. %@");
  }

  else
  {
    -[SCATModernMenuItem setDidActivate:](self, "setDidActivate:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    -[SCATModernMenuItem flash](self, "flash");
    switch(-[SCATModernMenuItem activateBehavior](self, "activateBehavior"))
    {
      case 1uLL:
        -[SCATModernMenuItem activate](self, "activate");
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 menu]);
        [v8 hideWithCompletion:0];

        goto LABEL_13;
      case 2uLL:
        -[SCATModernMenuItem activate](self, "activate");
        -[SCATModernMenuItem updateItem](self, "updateItem");
        goto LABEL_13;
      case 3uLL:
        -[SCATModernMenuItem activate](self, "activate");
        -[SCATModernMenuItem updateItem](self, "updateItem");
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 menu]);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  v9,  0LL,  0LL));
        [v7 beginScanningWithFocusContext:v10];

        goto LABEL_12;
      case 4uLL:
        -[SCATModernMenuItem activate](self, "activate");
        -[SCATModernMenuItem updateItem](self, "updateItem");
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v7 menu]);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  v11,  0LL,  0LL));

        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        [v12 beginScanningWithFocusContext:v9];

        -[AXDispatchTimer cancel](self->_repeatItemWithDismissTimer, "cancel");
        repeatItemWithDismissTimer = self->_repeatItemWithDismissTimer;
        if (!repeatItemWithDismissTimer)
        {
          id v14 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
          id v15 = self->_repeatItemWithDismissTimer;
          self->_repeatItemWithDismissTimer = v14;

          repeatItemWithDismissTimer = self->_repeatItemWithDismissTimer;
        }

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000942C4;
        v20[3] = &unk_100121D18;
        id v21 = v7;
        -[AXDispatchTimer afterDelay:processBlock:](repeatItemWithDismissTimer, "afterDelay:processBlock:", v20, 0.5);

        goto LABEL_12;
      default:
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 menu]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000942F8;
        v19[3] = &unk_100121D18;
        v19[4] = self;
        [v9 hideWithCompletion:v19];
LABEL_12:

LABEL_13:
        break;
    }
  }

  char v16 = v6 ^ 1;
  if (v5 == 3) {
    char v16 = 1;
  }
  if (v5 == 4) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v16;
  }

  return v17;
}

- (void)activate
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem activateHandler](self, "activateHandler"));

  if (v3)
  {
    unsigned int v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem activateHandler](self, "activateHandler"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 menu]);
    v6[2](v6, v5);
  }

  else
  {
    unsigned int v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
    [v6 menuItemWasActivated:self];
  }
}

- (void)flash
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
  Class v3 = (void *)objc_claimAutoreleasedReturnValue([v5 menu]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 menuVisualProvider]);
  [v4 flashModernMenuItem:self];
}

- (id)accessibilityLabel
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel"));
  if (!v3) {
    Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem title](self, "title"));
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATModernMenuItem;
  if (-[SCATModernMenuItem isEqual:](&v12, "isEqual:", v4))
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    if ([v7 isEqualToString:v8])
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem title](self, "title"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      unsigned __int8 v5 = [v9 isEqualToString:v10];
    }

    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (void)_updateVisuals
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
  Class v3 = (void *)objc_claimAutoreleasedReturnValue([v5 menu]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 menuVisualProvider]);
  [v4 updateModernMenuItem:self];
}

- (SCATModernMenuItemDelegate)delegate
{
  return (SCATModernMenuItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldUseActivityIndicator
{
  return self->_shouldUseActivityIndicator;
}

- (void)setShouldUseActivityIndicator:(BOOL)a3
{
  self->_shouldUseActivityIndicator = a3;
}

- (BOOL)shouldSuppressAudioOutput
{
  return self->_shouldSuppressAudioOutput;
}

- (void)setShouldSuppressAudioOutput:(BOOL)a3
{
  self->_shouldSuppressAudioOutput = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)activateBehavior
{
  return self->_activateBehavior;
}

- (void)setActivateBehavior:(unint64_t)a3
{
  self->_activateBehavior = a3;
}

- (BOOL)isAllowedWithGuidedAccess
{
  return self->_allowedWithGuidedAccess;
}

- (BOOL)isAllowedWithAssistiveAccess
{
  return self->_allowedWithAssistiveAccess;
}

- (BOOL)shouldFlipForRTL
{
  return self->_shouldFlipForRTL;
}

- (void)setShouldFlipForRTL:(BOOL)a3
{
  self->_shouldFlipForRTL = a3;
}

- (void)setResolvedImage:(id)a3
{
}

- (double)iconImageAngle
{
  return self->_iconImageAngle;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (SCATElement)scatElement
{
  return self->_scatElement;
}

- (void)setScatElement:(id)a3
{
}

- (AXNamedReplayableGesture)customGesture
{
  return self->_customGesture;
}

- (void)setCustomGesture:(id)a3
{
}

- (SCATSwitchTypingShortcut)customShortcut
{
  return self->_customShortcut;
}

- (void)setCustomShortcut:(id)a3
{
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return self->_allowsDwellScanningToAbortAfterTimeout;
}

- (void)setAllowsDwellScanningToAbortAfterTimeout:(BOOL)a3
{
  self->_allowsDwellScanningToAbortAfterTimeout = a3;
}

- (NSString)menuItemGroupName
{
  return self->_menuItemGroupName;
}

- (void)setMenuItemGroupName:(id)a3
{
}

- (AXDispatchTimer)repeatItemWithDismissTimer
{
  return self->_repeatItemWithDismissTimer;
}

- (void)setRepeatItemWithDismissTimer:(id)a3
{
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (id)activateHandler
{
  return self->_activateHandler;
}

- (void)setActivateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end