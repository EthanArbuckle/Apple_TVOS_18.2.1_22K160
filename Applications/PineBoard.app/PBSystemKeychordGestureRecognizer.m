@interface PBSystemKeychordGestureRecognizer
- (NSArray)requiredPressTypes;
- (NSSet)requiredPressTypesSet;
- (OS_dispatch_source)longPressTimer;
- (PBSystemKeychordGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)minimumPressDuration;
- (void)_cancelTimer;
- (void)_startTimer;
- (void)dealloc;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setMinimumPressDuration:(double)a3;
- (void)setRequiredPressTypes:(id)a3;
@end

@implementation PBSystemKeychordGestureRecognizer

- (PBSystemKeychordGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBSystemKeychordGestureRecognizer;
  v4 = -[PBSystemKeychordGestureRecognizer initWithTarget:action:](&v8, "initWithTarget:action:", a3, a4);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    requiredPressTypes = v4->_requiredPressTypes;
    v4->_requiredPressTypes = (NSSet *)v5;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemKeychordGestureRecognizer;
  -[PBSystemKeychordGestureRecognizer dealloc](&v3, "dealloc");
}

- (NSArray)requiredPressTypes
{
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_requiredPressTypes, "allObjects"));
}

- (void)setRequiredPressTypes:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    requiredPressTypes = self->_requiredPressTypes;
    self->_requiredPressTypes = v7;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"requiredPressTypes != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027A37C(a2, (uint64_t)self, (uint64_t)v9);
    }
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
  }

- (NSSet)requiredPressTypesSet
{
  return self->_requiredPressTypes;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allPresses", a3));
  id v6 = [v5 count];
  if (v6 == (id)-[NSSet count](self->_requiredPressTypes, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_map:", &stru_1003D4C10));
    if ([v7 isEqualToSet:self->_requiredPressTypes])
    {
      -[PBSystemKeychordGestureRecognizer setState:](self, "setState:", 1LL);
      -[PBSystemKeychordGestureRecognizer _startTimer](self, "_startTimer");
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (-[PBSystemKeychordGestureRecognizer state](self, "state", a3, a4)) {
    -[PBSystemKeychordGestureRecognizer setState:](self, "setState:", 3LL);
  }
  -[PBSystemKeychordGestureRecognizer _cancelTimer](self, "_cancelTimer");
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)_startTimer
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  longPressTimer = self->_longPressTimer;
  self->_longPressTimer = v3;

  id v5 = self->_longPressTimer;
  dispatch_time_t v6 = dispatch_time(0LL, llround(self->_minimumPressDuration * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v7 = self->_longPressTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AB2D8;
  v8[3] = &unk_1003D0890;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
  dispatch_activate((dispatch_object_t)self->_longPressTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_cancelTimer
{
  longPressTimer = self->_longPressTimer;
  if (longPressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)longPressTimer);
    v4 = self->_longPressTimer;
    self->_longPressTimer = 0LL;
  }

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (OS_dispatch_source)longPressTimer
{
  return self->_longPressTimer;
}

- (void).cxx_destruct
{
}

@end