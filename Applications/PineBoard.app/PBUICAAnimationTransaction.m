@interface PBUICAAnimationTransaction
- (CAAnimation)animation;
- (CALayer)layer;
- (NSString)key;
- (PBUICAAnimationTransaction)initWithLayer:(id)a3 animation:(id)a4;
- (PBUICAAnimationTransaction)initWithLayer:(id)a3 animation:(id)a4 name:(id)a5;
- (void)_begin;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)invalidate;
@end

@implementation PBUICAAnimationTransaction

- (PBUICAAnimationTransaction)initWithLayer:(id)a3 animation:(id)a4
{
  return -[PBUICAAnimationTransaction initWithLayer:animation:name:](self, "initWithLayer:animation:name:", a3, a4, 0LL);
}

- (PBUICAAnimationTransaction)initWithLayer:(id)a3 animation:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBUICAAnimationTransaction;
  v12 = -[PBUICAAnimationTransaction init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layer, a3);
    v14 = (CAAnimation *)[v10 copy];
    animation = v13->_animation;
    v13->_animation = v14;

    id v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);

    if (v16) {
      v19 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v16,  v18));
    }
    else {
      v19 = v18;
    }
    v20 = v19;

    key = v13->_key;
    v13->_key = v20;
  }

  return v13;
}

- (void)_begin
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBUICAAnimationTransaction;
  -[PBUICAAnimationTransaction _begin](&v4, "_begin");
  -[PBUICAAnimationTransaction addMilestone:](self, "addMilestone:", @"Animation");
  id v3 = -[CAAnimation copy](self->_animation, "copy");
  [v3 setDelegate:self];
  -[CALayer addAnimation:forKey:](self->_layer, "addAnimation:forKey:", v3, self->_key);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (void)invalidate
{
}

- (CALayer)layer
{
  return self->_layer;
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end