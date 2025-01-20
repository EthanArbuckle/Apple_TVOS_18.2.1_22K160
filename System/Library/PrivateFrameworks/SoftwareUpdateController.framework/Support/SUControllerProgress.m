@interface SUControllerProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isDone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7;
- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7 isStalled:(BOOL)a8;
- (NSString)actionText;
- (NSString)phase;
- (SUControllerProgress)init;
- (SUControllerProgress)initWithCoder:(id)a3;
- (SUControllerProgress)initWithPhase:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6;
- (double)estimatedTimeRemaining;
- (float)portionComplete;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionText:(id)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setPhase:(id)a3;
- (void)setPortionComplete:(float)a3;
@end

@implementation SUControllerProgress

- (SUControllerProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUControllerProgress;
  v2 = -[SUControllerProgress init](&v7, "init");
  if (v2)
  {
    v3 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@", @"None");
    phase = v2->_phase;
    v2->_phase = v3;

    v2->_portionComplete = -1.0;
    v2->_isDone = 0;
    actionText = v2->_actionText;
    v2->_estimatedTimeRemaining = -1.0;
    v2->_actionText = 0LL;

    v2->_isStalled = 0;
  }

  return v2;
}

- (SUControllerProgress)initWithPhase:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SUControllerProgress;
  v11 = -[SUControllerProgress init](&v15, "init");
  if (v11)
  {
    v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@", v10);
    phase = v11->_phase;
    v11->_phase = v12;

    v11->_portionComplete = a4;
    v11->_estimatedTimeRemaining = a5;
    v11->_isDone = a6;
  }

  return v11;
}

- (SUControllerProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SUControllerProgress;
  v5 = -[SUControllerProgress init](&v15, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"phase"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    phase = v5->_phase;
    v5->_phase = (NSString *)v7;

    [v4 decodeFloatForKey:@"portionComplete"];
    v5->_portionComplete = v9;
    [v4 decodeFloatForKey:@"estimatedTimeRemaining"];
    v5->_estimatedTimeRemaining = v10;
    v5->_isDone = [v4 decodeBoolForKey:@"isDone"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"actionText"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    actionText = v5->_actionText;
    v5->_actionText = (NSString *)v12;

    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
  [v7 encodeObject:v4 forKey:@"phase"];

  -[SUControllerProgress portionComplete](self, "portionComplete");
  objc_msgSend(v7, "encodeFloat:forKey:", @"portionComplete");
  -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  *(float *)&double v5 = v5;
  [v7 encodeFloat:@"estimatedTimeRemaining" forKey:v5];
  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isDone](self, "isDone"), @"isDone");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress actionText](self, "actionText"));
  [v7 encodeObject:v6 forKey:@"actionText"];

  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isStalled](self, "isStalled"), @"isStalled");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
  unsigned int v12 = [v10 isEqualToString:v11];

  if (v12
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v13 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v14 == a5))
  {
    unsigned int v15 = -[SUControllerProgress isDone](self, "isDone") ^ v6 ^ 1;
  }

  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a3;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v16 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v17 == a5)
    && -[SUControllerProgress isDone](self, "isDone") == v7)
  {
    unsigned __int8 v18 = [v12 isEqualToString:v12];
  }

  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7 isStalled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = a3;
  float v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
  unsigned int v17 = [v15 isEqualToString:v16];

  if (v17
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v18 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v19 == a5)
    && -[SUControllerProgress isDone](self, "isDone") == v9
    && -[SUControllerProgress isStalled](self, "isStalled") == v8)
  {
    unsigned __int8 v20 = [v14 isEqualToString:v14];
  }

  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SUControllerProgress),  v2,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUControllerProgress *)a3;
  if (v4 == self)
  {
    unsigned __int8 v17 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SUControllerProgress);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      BOOL v6 = v4;
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](v6, "phase"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
      -[SUControllerProgress portionComplete](v6, "portionComplete");
      float v10 = v9;
      -[SUControllerProgress portionComplete](self, "portionComplete");
      if (v10 != v11) {
        goto LABEL_8;
      }
      -[SUControllerProgress estimatedTimeRemaining](v6, "estimatedTimeRemaining");
      double v13 = v12;
      -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
      if (v13 == v14
        && (unsigned int v15 = -[SUControllerProgress isDone](v6, "isDone"), v15 == -[SUControllerProgress isDone](self, "isDone"))
        && (unsigned int v16 = -[SUControllerProgress isStalled](v6, "isStalled"),
            v16 == -[SUControllerProgress isStalled](self, "isStalled")))
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress actionText](v6, "actionText"));
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress actionText](self, "actionText"));
        unsigned __int8 v17 = [v19 isEqualToString:v20];
      }

      else
      {
LABEL_8:
        unsigned __int8 v17 = 0;
      }
    }

    else
    {
      unsigned __int8 v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress actionText](self, "actionText"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress phase](self, "phase"));
  -[SUControllerProgress portionComplete](self, "portionComplete");
  double v6 = v5;
  -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  uint64_t v8 = v7;
  float v9 = @"NO";
  if (-[SUControllerProgress isDone](self, "isDone")) {
    float v10 = @"YES";
  }
  else {
    float v10 = @"NO";
  }
  if (-[SUControllerProgress isStalled](self, "isStalled")) {
    float v9 = @"YES";
  }
  if (v3)
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerProgress actionText](self, "actionText"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@\nActionText: %@",  v4,  *(void *)&v6,  v8,  v10,  v9,  v11));
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@",  v4,  *(void *)&v6,  v8,  v10,  v9));
  }

  return v12;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (void).cxx_destruct
{
}

@end