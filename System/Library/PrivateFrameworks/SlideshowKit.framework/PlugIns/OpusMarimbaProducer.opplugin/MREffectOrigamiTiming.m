@interface MREffectOrigamiTiming
- (MREffectOrigamiTiming)initWithEffectID:(id)a3;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)mainDuration;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
@end

@implementation MREffectOrigamiTiming

- (MREffectOrigamiTiming)initWithEffectID:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectOrigamiTiming;
  v4 = -[MREffectOrigamiTiming init](&v10, "init");
  if (v4)
  {
    v4->_effectID = (NSString *)[a3 copy];
    v4->_description = (NSArray *)[(id)qword_2B0668 objectForKey:a3];
    id v5 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    [v5 defaultPhaseInDurationForEffectID:a3];
    v4->_defaultPhaseInDuration = v6;
    [v5 defaultMainDurationForEffectID:a3];
    v4->_defaultMainDuration = v7;
    [v5 defaultPhaseOutDurationForEffectID:a3];
    v4->_defaultPhaseOutDuration = v8;
  }

  return v4;
}

- (void)dealloc
{
  self->_effectID = 0LL;
  self->_description = 0LL;

  self->_animationTimeBounds = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectOrigamiTiming;
  -[MREffectOrigamiTiming dealloc](&v3, "dealloc");
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  self->_phaseInDuration = a3;
  self->_mainDuration = a4;
  self->_phaseOutDuration = a5;
  double v29 = 0.0;
  self->_animationTimeBounds = (NSArray *)ComputeAnimationTimeBounds(self->_description, &v29);
  self->_durationStretchFactor = (self->_phaseInDuration + self->_mainDuration + self->_phaseOutDuration - v29)
                               / (self->_defaultPhaseInDuration
                                + self->_defaultMainDuration
                                + self->_defaultPhaseOutDuration
                                - v29);
  id v9 = objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "imageInputInfosForEffectID:",  self->_effectID);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v9;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v26;
    slideTimings = self->_slideTimings;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = +[MRUtilities executeScript:withHeader:andAttributes:]( MRUtilities,  "executeScript:withHeader:andAttributes:",  [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) objectForKey:@"showTimeScript"],  0,  0);
        if (v16)
        {
          CGSize v17 = CGSizeFromString(v16);
          double width = v17.width;
          double height = v17.height;
        }

        else
        {
          double width = 0.0;
          double height = -1.0;
        }

        StretchTime(self->_animationTimeBounds, width, self->_durationStretchFactor);
        v21 = slideTimings[v12 + (int)i];
        double *v21 = v20;
        if (height >= 0.0)
        {
          StretchTime(self->_animationTimeBounds, height + width, self->_durationStretchFactor);
          double v22 = v23 - *v21;
        }

        else
        {
          double v22 = self->_phaseInDuration + self->_mainDuration + self->_phaseOutDuration - v20;
        }

        slideTimings[v12 + (int)i][1] = v22;
      }

      id v11 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      v12 += (int)i;
    }

    while (v11);
  }

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  return self->_slideTimings[a3][0];
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  return self->_slideTimings[a3][1];
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  return self->_slideTimings[a3][0] + 1.35;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lowestDisplayTime
{
  return 1.35;
}

- (double)phaseInDuration
{
  return self->_phaseInDuration;
}

- (double)mainDuration
{
  return self->_mainDuration;
}

- (double)phaseOutDuration
{
  return self->_phaseOutDuration;
}

@end