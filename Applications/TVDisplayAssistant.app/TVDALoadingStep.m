@interface TVDALoadingStep
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDisableIdleTimer;
- (BSInvalidatable)idleTimerAssertion;
- (NSArray)actions;
- (NSMutableArray)mutableActions;
- (NSString)title;
- (TVDALoadingStep)init;
- (TVDALoadingStep)initWithTitle:(id)a3 loadingDuration:(double)a4 actionHandler:(id)a5;
- (TVDAMeasurement)measurement;
- (double)loadingDuration;
- (id)actionHandler;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadingAction;
- (int64_t)menuBehavior;
- (unint64_t)hash;
- (void)_createIdleTimerAssertion;
- (void)_invalidateIdleTimerAssertion;
- (void)cancel;
- (void)restart;
- (void)setActionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)setLoadingDuration:(double)a3;
- (void)setMeasurement:(id)a3;
- (void)setMenuBehavior:(int64_t)a3;
- (void)setMutableActions:(id)a3;
- (void)setShouldDisableIdleTimer:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation TVDALoadingStep

- (TVDALoadingStep)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (TVDALoadingStep)initWithTitle:(id)a3 loadingDuration:(double)a4 actionHandler:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v16 = a4;
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  v5 = v18;
  v18 = 0LL;
  v14.receiver = v5;
  v14.super_class = (Class)&OBJC_CLASS___TVDALoadingStep;
  v18 = -[TVDALoadingStep init](&v14, "init");
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableActions = v18->_mutableActions;
    v18->_mutableActions = v6;

    objc_storeStrong((id *)&v18->_title, location[0]);
    v18->_loadingDuration = v16;
    id v8 = [v15 copy];
    id actionHandler = v18->_actionHandler;
    v18->_id actionHandler = v8;

    v18->_menuBehavior = 3LL;
    v18->_shouldDisableIdleTimer = 0;
  }

  v11 = v18;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v11;
}

- (void)startWithCompletionHandler:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = -[TVDALoadingStep loadingAction](v19, "loadingAction");
  if (v17) {
    -[TVDALoadingStep cancel](v19, "cancel");
  }
  -[TVDALoadingStep setCompletionHandler:](v19, "setCompletionHandler:", location[0]);
  if (v19->_shouldDisableIdleTimer) {
    -[TVDALoadingStep _createIdleTimerAssertion](v19, "_createIdleTimerAssertion");
  }
  objc_initWeak(&from, v19);
  v9 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v7 = -[TVDALoadingStep title](v19, "title");
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_100004598;
  objc_super v14 = &unk_100028460;
  objc_copyWeak(v15, &from);
  id v8 = -[TVDAStepAction initWithTitle:flow:handler:](v9, "initWithTitle:flow:handler:", v7, 0LL, &v10);
  id v3 = v17;
  id v17 = v8;

  id v6 = v17;
  -[TVDALoadingStep loadingDuration](v19, "loadingDuration");
  [v6 setIdleSecondsToTrigger:v4];
  [v17 startTimer];
  v5 = -[TVDALoadingStep mutableActions](v19, "mutableActions");
  -[NSMutableArray addObject:](v5, "addObject:", v17);

  objc_destroyWeak(v15);
  objc_destroyWeak(&from);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)restart
{
  id v3 = -[TVDALoadingStep completionHandler](self, "completionHandler");
  -[TVDALoadingStep startWithCompletionHandler:](self, "startWithCompletionHandler:");
}

- (void)cancel
{
  int v12 = self;
  SEL v11 = a2;
  -[TVDALoadingStep setCompletionHandler:](self, "setCompletionHandler:", 0LL);
  memset(__b, 0, sizeof(__b));
  obj = -[TVDALoadingStep mutableActions](v12, "mutableActions");
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v13,  16LL);
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
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v13,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }

  v2 = -[TVDALoadingStep mutableActions](v12, "mutableActions");
  -[NSMutableArray removeAllObjects](v2, "removeAllObjects");

  -[TVDALoadingStep _invalidateIdleTimerAssertion](v12, "_invalidateIdleTimerAssertion");
}

- (id)loadingAction
{
  uint64_t v3 = -[TVDALoadingStep actions](self, "actions");
  id v4 = -[NSArray lastObject](v3, "lastObject");

  return v4;
}

- (NSArray)actions
{
  uint64_t v3 = -[TVDALoadingStep mutableActions](self, "mutableActions");
  id v4 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24 = self;
  v23[2] = (id)a2;
  v23[1] = a3;
  id v15 = objc_alloc(&OBJC_CLASS___TVDALoadingStep);
  id v17 = -[TVDALoadingStep title](v24, "title");
  -[TVDALoadingStep loadingDuration](v24, "loadingDuration");
  double v14 = v3;
  id v16 = -[TVDALoadingStep actionHandler](v24, "actionHandler");
  v23[0] = -[TVDALoadingStep initWithTitle:loadingDuration:actionHandler:]( v15,  "initWithTitle:loadingDuration:actionHandler:",  v17,  v14);

  [v23[0] setMenuBehavior:v24->_menuBehavior];
  [v23[0] setMeasurement:v24->_measurement];
  [v23[0] setShouldDisableIdleTimer:v24->_shouldDisableIdleTimer];
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  obj = v24->_mutableActions;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
  if (v19)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0LL;
    id v13 = v19;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v12);
      id v8 = v22;
      id v9 = [v21 copy];
      -[NSMutableArray addObject:](v8, "addObject:");

      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
        if (!v13) {
          break;
        }
      }
    }
  }

  [v23[0] setMutableActions:v22];
  id v5 = v23[0];
  id v6 = [v24->_completionHandler copy];
  objc_msgSend(v5, "setCompletionHandler:");

  id v7 = v23[0];
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17 == location[0])
  {
    char v18 = 1;
    int v15 = 1;
  }

  else
  {
    id v9 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVDAUserStep);
    if ((objc_opt_isKindOfClass(v9, v3) & 1) != 0)
    {
      id v14 = location[0];
      title = v17->_title;
      id v6 = [v14 title];
      unsigned __int8 v7 = -[NSString isEqualToString:](title, "isEqualToString:");

      char v12 = 0;
      char v10 = 0;
      unsigned __int8 v8 = 0;
      if ((v7 & 1) != 0)
      {
        id v13 = -[TVDALoadingStep actions](v17, "actions");
        char v12 = 1;
        id v11 = [v14 actions];
        char v10 = 1;
        unsigned __int8 v8 = -[NSArray isEqualToArray:](v13, "isEqualToArray:");
      }

      if ((v10 & 1) != 0) {

      }
      if ((v12 & 1) != 0) {
      char v18 = v8 & 1;
      }
      int v15 = 1;
      objc_storeStrong(&v14, 0LL);
    }

    else
    {
      char v18 = 0;
      int v15 = 1;
    }
  }

  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

- (unint64_t)hash
{
  unsigned __int8 v7 = -[TVDALoadingStep title](self, "title");
  NSUInteger v3 = -[NSString hash](v7, "hash");
  -[TVDALoadingStep loadingDuration](self, "loadingDuration");
  id v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  unint64_t v4 = v3 ^ (unint64_t)-[NSNumber hash](v6, "hash");
  id v5 = -[TVDALoadingStep mutableActions](self, "mutableActions");
  unint64_t v8 = v4 ^ (unint64_t)-[NSMutableArray hash](v5, "hash");

  return v8;
}

- (void)_createIdleTimerAssertion
{
  unint64_t v4 = +[ITIdleTimerState sharedInstance](&OBJC_CLASS___ITIdleTimerState, "sharedInstance");
  v2 = (BSInvalidatable *)-[ITIdleTimerState newAssertionToDisableIdleTimerForReason:error:]( v4,  "newAssertionToDisableIdleTimerForReason:error:",  self->_title,  0LL);
  idleTimerAssertion = self->_idleTimerAssertion;
  self->_idleTimerAssertion = v2;
}

- (void)_invalidateIdleTimerAssertion
{
  if (self->_idleTimerAssertion)
  {
    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    objc_storeStrong((id *)&self->_idleTimerAssertion, 0LL);
  }

- (double)loadingDuration
{
  return self->_loadingDuration;
}

- (void)setLoadingDuration:(double)a3
{
  self->_loadingDuration = a3;
}

- (int64_t)menuBehavior
{
  return self->_menuBehavior;
}

- (void)setMenuBehavior:(int64_t)a3
{
  self->_menuBehavior = a3;
}

- (BOOL)shouldDisableIdleTimer
{
  return self->_shouldDisableIdleTimer;
}

- (void)setShouldDisableIdleTimer:(BOOL)a3
{
  self->_shouldDisableIdleTimer = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableArray)mutableActions
{
  return self->_mutableActions;
}

- (void)setMutableActions:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (TVDAMeasurement)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end