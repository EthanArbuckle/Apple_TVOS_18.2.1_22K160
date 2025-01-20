@interface TVSSPropertyAnimatorTransaction
- (BOOL)_canBeInterrupted;
- (TVSSPropertyAnimatorTransaction)initWithSpringTimingParameters:(id)a3;
- (TVSSPropertyAnimatorTransaction)initWithSpringTimingParameters:(id)a3 delay:(double)a4;
- (TVSSPropertyAnimatorTransaction)initWithTimingParameters:(id)a3 duration:(double)a4;
- (TVSSPropertyAnimatorTransaction)initWithTimingParameters:(id)a3 duration:(double)a4 delay:(double)a5;
- (UITimingCurveProvider)timingParameters;
- (UIViewPropertyAnimator)animator;
- (double)delay;
- (double)duration;
- (id)animations;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)addAnimations:(id)a3;
@end

@implementation TVSSPropertyAnimatorTransaction

- (TVSSPropertyAnimatorTransaction)initWithSpringTimingParameters:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0LL;
  v7 = -[TVSSPropertyAnimatorTransaction initWithSpringTimingParameters:delay:]( v3,  "initWithSpringTimingParameters:delay:",  location[0],  0.0);
  v5 = v7;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  return v5;
}

- (TVSSPropertyAnimatorTransaction)initWithSpringTimingParameters:(id)a3 delay:(double)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = v9;
  id v6 = location[0];
  [location[0] settlingDuration];
  v9 = 0LL;
  v9 = -[TVSSPropertyAnimatorTransaction initWithTimingParameters:duration:delay:]( v5,  "initWithTimingParameters:duration:delay:",  v6);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSPropertyAnimatorTransaction)initWithTimingParameters:(id)a3 duration:(double)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  v9 = 0LL;
  v9 = -[TVSSPropertyAnimatorTransaction initWithTimingParameters:duration:delay:]( v4,  "initWithTimingParameters:duration:delay:",  location[0],  a4,  0.0);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSPropertyAnimatorTransaction)initWithTimingParameters:(id)a3 duration:(double)a4 delay:(double)a5
{
  v29 = self;
  SEL v28 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  double v26 = a4;
  double v25 = a5;
  if (!location)
  {
    v24 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"timingParameters != nil");
    id v23 = &_os_log_default;
    char v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v23;
      os_log_type_t type = v22;
      v16 = NSStringFromSelector(v28);
      v12 = v16;
      v21 = v12;
      v5 = (objc_class *)objc_opt_class(v29);
      v15 = NSStringFromClass(v5);
      v20 = v15;
      sub_10000583C( (uint64_t)v30,  (uint64_t)v12,  (uint64_t)v20,  (uint64_t)v29,  (uint64_t)@"TVSSPropertyAnimatorTransaction.m",  50,  (uint64_t)v24);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v30,  0x3Au);

      objc_storeStrong((id *)&v20, 0LL);
      objc_storeStrong((id *)&v21, 0LL);
    }

    objc_storeStrong(&v23, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v24, "UTF8String"));
    __break(0);
    JUMPOUT(0x10012FC9CLL);
  }

  id v6 = v29;
  v29 = 0LL;
  v19.receiver = v6;
  v19.super_class = (Class)&OBJC_CLASS___TVSSPropertyAnimatorTransaction;
  v29 = -[TVSSPropertyAnimatorTransaction init](&v19, "init");
  objc_storeStrong((id *)&v29, v29);
  if (v29)
  {
    objc_storeStrong((id *)&v29->_timingParameters, location);
    v29->_duration = v26;
    v29->_delay = v25;
    v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v7,  "initWithDuration:timingParameters:",  v29->_timingParameters,  v29->_duration);
    animator = v29->_animator;
    v29->_animator = v8;
  }

  v11 = v29;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  return v11;
}

- (void)addAnimations:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"animation != ((void *)0)");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      v8 = NSStringFromSelector(v15);
      v4 = v8;
      v10 = v4;
      v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSPropertyAnimatorTransaction.m",  66,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10012FFF8LL);
  }

  -[UIViewPropertyAnimator addAnimations:](v16->_animator, "addAnimations:", location);
  objc_storeStrong(&location, 0LL);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  id v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSSPropertyAnimatorTransaction;
  -[TVSSPropertyAnimatorTransaction _begin](&v10, "_begin");
  -[TVSSPropertyAnimatorTransaction addMilestone:](v12, "addMilestone:", off_100221298);
  objc_initWeak(&location, v12);
  animator = v12->_animator;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100130244;
  v7 = &unk_1001B5A88;
  objc_copyWeak(&v8, &location);
  if ((BSFloatIsZero(-[UIViewPropertyAnimator addCompletion:](animator, "addCompletion:", &v3)) & 1) != 0) {
    -[UIViewPropertyAnimator startAnimation](v12->_animator, "startAnimation");
  }
  else {
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v12->_animator, "startAnimationAfterDelay:", v12->_delay);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_willInterruptWithReason:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPropertyAnimatorTransaction;
  -[TVSSPropertyAnimatorTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  -[UIViewPropertyAnimator stopAnimation:](v5->_animator, "stopAnimation:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPropertyAnimatorTransaction;
  -[TVSSPropertyAnimatorTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  -[UIViewPropertyAnimator stopAnimation:](v5->_animator, "stopAnimation:", 0LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_animator, "finishAnimationAtPosition:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (UITimingCurveProvider)timingParameters
{
  return self->_timingParameters;
}

- (double)duration
{
  return self->_duration;
}

- (double)delay
{
  return self->_delay;
}

- (id)animations
{
  return self->_animations;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void).cxx_destruct
{
}

@end