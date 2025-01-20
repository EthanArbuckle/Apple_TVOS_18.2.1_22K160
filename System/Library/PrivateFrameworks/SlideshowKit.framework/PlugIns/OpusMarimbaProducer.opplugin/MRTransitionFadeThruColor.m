@interface MRTransitionFadeThruColor
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionFadeThruColor

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v8 = &OBJC_IVAR___MRTransition_mTargetLayer;
  if (a3 < 0.5) {
    v8 = &OBJC_IVAR___MRTransition_mSourceLayer;
  }
  uint64_t v9 = *v8;
  v10 = *(Class *)((char *)&self->super.super.isa + v9);
  if (v10)
  {
    v12 = [*(id *)((char *)&self->super.super.isa + v9) renderingState];
    if (v12)
    {
      v13 = v12;
      v12[244] = 1;
      objc_msgSend(objc_msgSend(v10, "clock"), "externalTime");
      id v14 = objc_msgSend(v10, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
      v13[244] = 0;
      if (v14)
      {
        id v15 = v14;
        [v15 releaseByUser];
      }
    }
  }

  id v15 = objc_msgSend(a4, "retainedByUserBlackImage", a4, a5);
LABEL_9:
  mColor = self->mColor;
  float v17 = mColor[3];
  if (v17 < 1.0) {
    [a4 blend:3];
  }
  [a4 setShader:@"FadeToColor"];
  *(float *)&double v18 = *mColor;
  *(float *)&double v19 = mColor[1];
  *(float *)&double v20 = mColor[2];
  *(float *)&double v21 = mColor[3];
  [a4 setShaderUniformVec4:@"color" :v18 :v19 :v20 forKey:v21];
  double v22 = 1.0 - a3;
  if (a3 < 0.5) {
    double v22 = a3;
  }
  double v23 = v22 + v22;
  *(float *)&double v23 = v23;
  [a4 setShaderUniformFloat:@"level" forKey:v23];
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v15,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
  [a4 unsetShader];
  [v15 releaseByUser];
  if (v17 < 1.0) {
    [a4 blend:0];
  }
}

- (void)setAttributes:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRTransitionFadeThruColor;
  -[MRTransition setAttributes:](&v10, "setAttributes:", a3);
  id v4 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"fadeColor");
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = objc_msgSend( v4,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet characterSetWithCharactersInString:]( NSCharacterSet,  "characterSetWithCharactersInString:",  @"()[]{} "));
    for (uint64_t i = 0LL; i != 4; ++i)
    {
      objc_msgSend(objc_msgSend(v7, "objectAtIndex:", i + 1), "floatValue");
      self->mColor[i] = v9;
    }
  }

@end