@interface TVDAStepAlertController
- (TVDAStepAlertController)initWithStep:(id)a3 actionFlowHandler:(id)a4;
- (TVDAStepAlertController)initWithTitle:(id)a3 text:(id)a4 footers:(id)a5;
- (TVDAUserStep)step;
- (UILabel)internalDescriptionLabel;
- (id)actionFlowHandler;
- (void)_handleActionTimerStatusChange:(double)a3;
- (void)_handleMenuPress:(id)a3;
- (void)_triggerActionHandlerWithAction:(id)a3;
- (void)setActionFlowHandler:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVDAStepAlertController

- (TVDAStepAlertController)initWithTitle:(id)a3 text:(id)a4 footers:(id)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v8 = 0LL;
  objc_storeStrong(&v8, a5);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v11, 0LL);
  return 0LL;
}

- (TVDAStepAlertController)initWithStep:(id)a3 actionFlowHandler:(id)a4
{
  id v64 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v62 = 0LL;
  objc_storeStrong(&v62, a4);
  id v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v60 = [location[0] footer];
  if (v60) {
    [v61 addObject:v60];
  }
  id v59 = [location[0] appleSupportFooter];
  if (v59) {
    [v61 addObject:v59];
  }
  id v30 = v64;
  id v29 = [location[0] title];
  id v28 = [location[0] subtitle];
  id v64 = 0LL;
  v58.receiver = v30;
  v58.super_class = (Class)&OBJC_CLASS___TVDAStepAlertController;
  id v64 = -[TVDAStepAlertController initWithTitle:text:footers:](&v58, "initWithTitle:text:footers:", v29);
  objc_storeStrong(&v64, v64);

  if (v64)
  {
    objc_storeStrong((id *)v64 + 3, location[0]);
    id v27 = [v62 copy];
    v4 = (void *)*((void *)v64 + 5);
    *((void *)v64 + 5) = v27;

    v26 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = (void *)*((void *)v64 + 4);
    *((void *)v64 + 4) = v26;

    [v64 setShouldDismissAutomatically:0];
    objc_initWeak(&from, v64);
    memset(__b, 0, sizeof(__b));
    id v24 = [location[0] actions];
    id v25 = [v24 countByEnumeratingWithState:__b objects:v65 count:16];
    if (v25)
    {
      uint64_t v21 = *(void *)__b[2];
      uint64_t v22 = 0LL;
      id v23 = v25;
      while (1)
      {
        uint64_t v20 = v22;
        if (*(void *)__b[2] != v21) {
          objc_enumerationMutation(v24);
        }
        id v56 = *(id *)(__b[1] + 8 * v22);
        id v19 = [v56 title];
        v47 = _NSConcreteStackBlock;
        int v48 = -1073741824;
        int v49 = 0;
        v50 = sub_10001D340;
        v51 = &unk_100029CA0;
        objc_copyWeak(&v53, &from);
        id v52 = v56;
        id v54 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v19,  0LL,  &v47);

        [v64 addButton:v54];
        [v56 idleSecondsToTrigger];
        if (v6 != 0.0)
        {
          id v17 = objc_msgSend(v56, "title", v6);
          id v18 = [v17 copy];
          v7 = (void *)*((void *)v64 + 2);
          *((void *)v64 + 2) = v18;

          objc_storeStrong((id *)v64 + 1, v54);
        }

        objc_initWeak(&v46, v56);
        id v16 = v56;
        v39 = _NSConcreteStackBlock;
        int v40 = -1073741824;
        int v41 = 0;
        v42 = sub_10001D390;
        v43 = &unk_100029CC8;
        objc_copyWeak(&v44, &from);
        objc_copyWeak(&v45, &v46);
        [v16 addHandler:&v39];
        id v15 = v56;
        v33 = _NSConcreteStackBlock;
        int v34 = -1073741824;
        int v35 = 0;
        v36 = sub_10001D41C;
        v37 = &unk_100029CF0;
        objc_copyWeak(&v38, &from);
        [v15 addSecondsToTriggerStatusHandler:&v33];
        id v14 = v56;
        id v12 = [location[0] preferredAction];
        unsigned __int8 v13 = objc_msgSend(v14, "isEqual:");

        if ((v13 & 1) != 0) {
          [v64 setPreferredButton:v54];
        }
        objc_destroyWeak(&v38);
        objc_destroyWeak(&v45);
        objc_destroyWeak(&v44);
        objc_destroyWeak(&v46);
        objc_storeStrong(&v54, 0LL);
        objc_storeStrong(&v52, 0LL);
        objc_destroyWeak(&v53);
        ++v22;
        if (v20 + 1 >= (unint64_t)v23)
        {
          uint64_t v22 = 0LL;
          id v23 = [v24 countByEnumeratingWithState:__b objects:v65 count:16];
          if (!v23) {
            break;
          }
        }
      }
    }

    id v11 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    id v32 = -[UITapGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v64, "_handleMenuPress:");
    [v32 setAllowedPressTypes:&off_10002B9D8];
    id v10 = [v64 view];
    [v10 addGestureRecognizer:v32];

    objc_storeStrong(&v32, 0LL);
    objc_destroyWeak(&from);
  }

  id v9 = (TVDAStepAlertController *)v64;
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v64, 0LL);
  return v9;
}

- (void)viewDidLoad
{
  unsigned __int8 v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVDAStepAlertController;
  -[TVDAStepAlertController viewDidLoad](&v11, "viewDidLoad");
  memset(__b, 0, sizeof(__b));
  obj = -[TVDAUserStep actions](v13->_step, "actions");
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "startTimer", v6);
      ++v5;
      id v6 = (id)v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }

  sub_100007458(v13);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVDAStepAlertController;
  -[TVDAStepAlertController viewWillDisappear:](&v11, "viewWillDisappear:", a3);
  memset(__b, 0, sizeof(__b));
  obj = -[TVDAUserStep actions](v14->_step, "actions");
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 stopTimer];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }

  -[TVDAStepAlertController _handleActionTimerStatusChange:](v14, "_handleActionTimerStatusChange:", 0.0);
}

- (void)_handleMenuPress:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v3 = -[TVDAUserStep menuBehavior](v8->_step, "menuBehavior");
  if (v3 <= 3) {
    __asm { BR              X8 }
  }

  uint64_t v4 = -[TVDAStepAction initWithTitle:flow:handler:]( objc_alloc(&OBJC_CLASS___TVDAStepAction),  "initWithTitle:flow:handler:",  @"MENU press",  v6);
  -[TVDAStepAlertController _triggerActionHandlerWithAction:](v8, "_triggerActionHandlerWithAction:", v4);
  objc_storeStrong((id *)&v4, 0LL);
  int v5 = 0;
  objc_storeStrong(location, 0LL);
}

- (void)_triggerActionHandlerWithAction:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVDAStepAlertController actionFlowHandler](v5, "actionFlowHandler");
  if (v3) {
    (*((void (**)(id, id))v3 + 2))(v3, location[0]);
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_handleActionTimerStatusChange:(double)a3
{
  if (a3 > 0.0)
  {
    timerButton = self->_timerButton;
    uint64_t v6 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    id v5 = sub_10001B768(@"CancelTimerButtonTitleFormat", v6, 1, 0, @"Localizable");
    uint64_t v4 =  +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  self->_initialTimerButtonTitle,  llround(a3));
    -[TVSUITextAlertButton setTitle:animated:](timerButton, "setTitle:animated:");
  }

  else
  {
    -[TVSUITextAlertButton setTitle:](self->_timerButton, "setTitle:", self->_initialTimerButtonTitle);
  }

- (TVDAUserStep)step
{
  return self->_step;
}

- (UILabel)internalDescriptionLabel
{
  return self->_internalDescriptionLabel;
}

- (id)actionFlowHandler
{
  return self->_actionFlowHandler;
}

- (void)setActionFlowHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end