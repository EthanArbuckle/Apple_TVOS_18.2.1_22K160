@interface MRParallelPlugger
- (BOOL)applyAtTime:(double)a3 toSublayer:(id)a4 withArguments:(id)a5;
- (BOOL)needsUpdate;
- (MCPlugParallel)plug;
- (MRParallelPlugger)init;
- (unsigned)currentLayoutIndex;
- (void)dealloc;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setOpacityAnimationPath:(id)a3;
- (void)setPlug:(id)a3;
@end

@implementation MRParallelPlugger

- (MRParallelPlugger)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRParallelPlugger;
  result = -[MRParallelPlugger init](&v3, "init");
  if (result) {
    result->mNeedsUpdate = 1;
  }
  return result;
}

- (void)dealloc
{
  self->mAnimationContext = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRParallelPlugger;
  -[MRParallelPlugger dealloc](&v3, "dealloc");
}

- (void)setOpacityAnimationPath:(id)a3
{
  mAnimationPathOpacity = self->mAnimationPathOpacity;
  if (a3)
  {
    if (mAnimationPathOpacity)
    {

      self->mAnimationPathOpacity->animationPath = (MCAnimationPath *)a3;
    }

    else
    {
      v6 = objc_alloc(&OBJC_CLASS___MRAnimationPathScalar);
      -[MCPlugParallel opacity](self->mPlug, "opacity");
      self->mAnimationPathOpacity = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:]( v6,  "initWithMCAnimationPath:andValue:",  a3);
    }
  }

  else
  {

    self->mAnimationPathOpacity = 0LL;
  }

- (BOOL)applyAtTime:(double)a3 toSublayer:(id)a4 withArguments:(id)a5
{
  BOOL mPlugWasSetSinceLastRendering = self->mPlugWasSetSinceLastRendering;
  self->BOOL mPlugWasSetSinceLastRendering = 0;
  objc_msgSend(objc_msgSend(a4, "clock"), "setExternalTime:", a3);
  unsigned int v9 = [a5 skipsAnimations];
  v10 = [a4 renderingState];
  v10[240] = 1;
  objc_msgSend(objc_msgSend(a4, "superlayer"), "pixelSize");
  -[MCPlugParallel sizeForParentAspectRatio:](self->mPlug, "sizeForParentAspectRatio:", v11 / v12);
  *(float *)&double v13 = v13;
  *(float *)&double v14 = v14;
  *(_DWORD *)v10 = LODWORD(v13);
  *((_DWORD *)v10 + 1) = LODWORD(v14);
  v15 = (NSDictionary *)[a4 persistentState];
  id v16 = [a4 animationTriggers];
  id v17 = [a4 motions];
  double v179 = 0.0;
  double v180 = 0.0;
  if (-[MCPlug countOfAnimationPaths](self->mPlug, "countOfAnimationPaths") || self->mAnimationPathOpacity)
  {
    mAnimationContext = self->mAnimationContext;
    if (!mAnimationContext)
    {
      mAnimationContext = objc_alloc_init(&OBJC_CLASS___MRAnimationContext);
      self->mAnimationContext = mAnimationContext;
    }

    mAnimationContext->state = v15;
    mAnimationPathParam1 = self->mAnimationPathParam1;
    if (mAnimationPathParam1)
    {
      double v18 = ValueForScalarAnimationPath(mAnimationPathParam1, self->mPlug, self->mAnimationContext, v16, a3, 0.0);
      double v180 = v18;
      v21 = &v180;
    }

    else
    {
      v21 = 0LL;
    }

    self->mAnimationContext->param1 = v21;
    mAnimationPathParam2 = self->mAnimationPathParam2;
    if (mAnimationPathParam2)
    {
      double v18 = ValueForScalarAnimationPath(mAnimationPathParam2, self->mPlug, self->mAnimationContext, v16, a3, 0.0);
      double v179 = v18;
      v23 = &v179;
    }

    else
    {
      v23 = 0LL;
    }

    self->mAnimationContext->param2 = v23;
  }

  mAnimationPathXY = self->mAnimationPathXY;
  id v176 = a4;
  v177 = v16;
  if (mAnimationPathXY)
  {
    id v25 = [a4 clock];
    -[MCPlugParallel position](self->mPlug, "position");
    +[MRUtilities valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:]( &OBJC_CLASS___MRUtilities,  "valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:",  mAnimationPathXY,  v25,  0LL,  0LL,  0LL,  a3,  v26,  v27);
    *(float *)&double v18 = v18;
    float v29 = v28;
    BOOL v30 = *((float *)v10 + 2) != *(float *)&v18 || *((float *)v10 + 3) != v29;
    BOOL v34 = mPlugWasSetSinceLastRendering || v30;
    *((_DWORD *)v10 + 2) = LODWORD(v18);
    *((float *)v10 + 3) = v29;
    id v16 = v177;
    goto LABEL_62;
  }

  if (v17 && (id v31 = [v17 objectForKey:@"positionX"]) != 0)
  {
    v32 = v31;
    [v31 startTime];
    if (v33 < 0.0)
    {
      [v32 setStartTime:a3];
      [v32 setStartValue:*((float *)v10 + 2)];
      goto LABEL_39;
    }

    [v32 valueAtTime:a3];
    double v40 = v54;
    [v32 startTime];
    double v56 = a3 - v55;
    [v32 duration];
    if (v56 >= v57) {
      [v17 removeObjectForKey:@"positionX"];
    }
  }

  else
  {
    mAnimationPathX = self->mAnimationPathX;
    if (mAnimationPathX
      && (!-[MCAnimationPath isTriggered](mAnimationPathX->animationPath, "isTriggered")
       || [v16 objectForKey:@"positionX"]))
    {
      if (v9)
      {
        self->mAnimationPathX->speed = 0.0;
        self->mAnimationPathX->double time = -1.0e10;
      }

      self->mAnimationContext->animationPath = self->mAnimationPathX;
      animationPath = self->mAnimationPathX->animationPath;
      id v37 = [a4 clock];
      -[MCPlugParallel position](self->mPlug, "position");
      double v39 = ValueForScalarAnimationPath(animationPath, v37, self->mAnimationContext, v16, a3, v38);
    }

    else
    {
      if (!mPlugWasSetSinceLastRendering)
      {
LABEL_39:
        BOOL v34 = mPlugWasSetSinceLastRendering;
        if (v17) {
          goto LABEL_40;
        }
LABEL_43:
        mAnimationPathY = self->mAnimationPathY;
        if (mAnimationPathY
          && (!-[MCAnimationPath isTriggered](mAnimationPathY->animationPath, "isTriggered")
           || [v16 objectForKey:@"positionY"]))
        {
          if (v9)
          {
            self->mAnimationPathY->speed = 0.0;
            self->mAnimationPathY->double time = -1.0e10;
          }

          self->mAnimationContext->animationPath = self->mAnimationPathY;
          v48 = self->mAnimationPathY->animationPath;
          id v49 = [a4 clock];
          -[MCPlugParallel position](self->mPlug, "position");
          v50 = v49;
          id v16 = v177;
          double v52 = ValueForScalarAnimationPath(v48, v50, self->mAnimationContext, v177, a3, v51);
        }

        else
        {
          if (!mPlugWasSetSinceLastRendering) {
            goto LABEL_62;
          }
          -[MCPlugParallel position](self->mPlug, "position");
          double v52 = v53;
        }

        goto LABEL_55;
      }

      -[MCPlugParallel position](self->mPlug, "position");
    }

    double v40 = v39;
  }

  BOOL v34 = mPlugWasSetSinceLastRendering;
  v41 = self->mAnimationPathX;
  if (v41)
  {
    double v42 = 0.0;
    if ((v9 & 1) == 0)
    {
      double time = v41->time;
      if (time < a3) {
        double v42 = (v40 - v41->value) / (a3 - time);
      }
    }

    v41->speed = v42;
    self->mAnimationPathX->value = v40;
    self->mAnimationPathX->double time = a3;
  }

  double v18 = *((float *)v10 + 2);
  if (v40 != v18)
  {
    *(float *)&double v18 = v40;
    *((_DWORD *)v10 + 2) = LODWORD(v18);
    BOOL v34 = 1;
  }

  if (!v17) {
    goto LABEL_43;
  }
LABEL_40:
  id v44 = [v17 objectForKey:@"positionY"];
  if (!v44) {
    goto LABEL_43;
  }
  v45 = v44;
  [v44 startTime];
  if (v46 < 0.0)
  {
    [v45 setStartTime:a3];
    [v45 setStartValue:*((float *)v10 + 3)];
    goto LABEL_63;
  }

  [v45 valueAtTime:a3];
  double v52 = v58;
  [v45 startTime];
  double v60 = a3 - v59;
  [v45 duration];
  if (v60 >= v61) {
    [v17 removeObjectForKey:@"positionY"];
  }
LABEL_55:
  v62 = self->mAnimationPathY;
  if (v62)
  {
    double v63 = 0.0;
    if ((v9 & 1) == 0)
    {
      double v64 = v62->time;
      if (v64 < a3) {
        double v63 = (v52 - v62->value) / (a3 - v64);
      }
    }

    v62->speed = v63;
    self->mAnimationPathY->value = v52;
    self->mAnimationPathY->double time = a3;
  }

  double v18 = *((float *)v10 + 3);
  if (v52 != v18)
  {
    *(float *)&double v18 = v52;
    *((_DWORD *)v10 + 3) = LODWORD(v18);
    BOOL v34 = 1;
  }

- (void)setPlug:(id)a3
{
  self->mNeedsUpdate = 0;
  if ([a3 container])
  {

    self->mAnimationPathParam1 = 0LL;
    self->mAnimationPathParam2 = 0LL;

    self->mAnimationPathXY = 0LL;
    self->mAnimationPathX = 0LL;

    self->mAnimationPathY = 0LL;
    self->mAnimationPathZ = 0LL;

    self->mAnimationPathScale = 0LL;
    self->mAnimationPathRX = 0LL;

    self->mAnimationPathRY = 0LL;
    self->mAnimationPathRZ = 0LL;

    self->mAnimationPathOpacity = 0LL;
  }

  self->mPlug = 0LL;
  if (a3)
  {
    self->mPlug = (MCPlugParallel *)[a3 snapshot];
    -[MRParallelPlugger setCurrentLayoutIndex:](self, "setCurrentLayoutIndex:", [a3 currentLayoutIndex]);
  }

  self->BOOL mPlugWasSetSinceLastRendering = 1;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  self->mCurrentLayoutIndex = a3;
  -[MCPlugParallel setCurrentLayoutIndex:](self->mPlug, "setCurrentLayoutIndex:");
  self->BOOL mPlugWasSetSinceLastRendering = 1;
  if (!-[MCPlug countOfAnimationPaths](self->mPlug, "countOfAnimationPaths")) {
    return;
  }
  if (!(_DWORD)v3)
  {
    self->mAnimationPathParam1 = (MCAnimationPath *) -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  @"param1");
    self->mAnimationPathParam2 = (MCAnimationPath *) -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  @"param2");
    self->mAnimationPathXY = (MCAnimationPath *) -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  @"position");
    goto LABEL_12;
  }

  id v5 = -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  objc_msgSend(@"param1", "stringByAppendingFormat:", @":%d", v3));
  if (!v5) {
    id v5 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", @"param1");
  }
  self->mAnimationPathParam1 = (MCAnimationPath *)v5;
  id v6 = -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  objc_msgSend(@"param2", "stringByAppendingFormat:", @":%d", v3));
  if (!v6) {
    id v6 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", @"param2");
  }
  self->mAnimationPathParam2 = (MCAnimationPath *)v6;
  id v7 = -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  objc_msgSend(@"position", "stringByAppendingFormat:", @":%d", v3));
  if (!v7) {
    id v7 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", @"position");
  }
  self->mAnimationPathXY = (MCAnimationPath *)v7;
  id v8 = -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  objc_msgSend(@"positionX", "stringByAppendingFormat:", @":%d", v3));
  if (!v8)
  {
LABEL_12:
    id v8 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", @"positionX");
    if (!v8) {
      goto LABEL_17;
    }
  }

  if (([v8 isTriggered] & 1) == 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCAnimationPathPhysics, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      double v11 =  -[MRAnimationPathPhysics initWithMCAnimationPath:]( objc_alloc(&OBJC_CLASS___MRAnimationPathPhysics),  "initWithMCAnimationPath:",  v8);
      -[MCPlugParallel position](self->mPlug, "position");
      *(float *)&double v12 = v12;
      -[MRAnimationPathPhysics setBaseValue:](v11, "setBaseValue:", v12);
    }

    else
    {
      double v13 = objc_alloc(&OBJC_CLASS___MRAnimationPathScalar);
      -[MCPlugParallel position](self->mPlug, "position");
      self->mAnimationPathX = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:]( v13,  "initWithMCAnimationPath:andValue:",  v8);
    }
  }

- (MCPlugParallel)plug
{
  return self->mPlug;
}

- (unsigned)currentLayoutIndex
{
  return self->mCurrentLayoutIndex;
}

- (BOOL)needsUpdate
{
  return self->mNeedsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->mNeedsUpdate = a3;
}

@end