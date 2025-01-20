@interface TIRadialErrorGenerator
- (CGPoint)randomBiasForKeyString:(id)a3 rect:(CGRect)a4;
- (TIRadialErrorGenerator)initWithAttributes:(id)a3;
@end

@implementation TIRadialErrorGenerator

- (TIRadialErrorGenerator)initWithAttributes:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TIRadialErrorGenerator;
  v5 = -[TIErrorGenerator initWithAttributes:](&v19, "initWithAttributes:", v4);
  v6 = v5;
  if (v5)
  {
    v5->_letterErrorProbability = 0LL;
    v5->_defaultDistanceMax = 0LL;
    v5->_defaultDistanceMin = 0LL;
    v5->_letterDistanceMax = 0LL;
    v5->_letterDistanceMin = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"LETTER_ERROR_PROBABILITY"]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"LETTER_ERROR_PROBABILITY"]);
      [v8 doubleValue];
      v6->_letterErrorProbability = (unint64_t)v9;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"DEFAULT_ERROR_RADIAL_MIN_DISTANCE"]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DEFAULT_ERROR_RADIAL_MIN_DISTANCE"]);
      v6->_defaultDistanceMin = (int)[v11 intValue];
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"DEFAULT_ERROR_RADIAL_MAX_DISTANCE"]);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DEFAULT_ERROR_RADIAL_MAX_DISTANCE"]);
      v6->_defaultDistanceMax = (int)[v13 intValue];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"LETTER_ERROR_RADIAL_MIN_DISTANCE"]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"LETTER_ERROR_RADIAL_MIN_DISTANCE"]);
      v6->_letterDistanceMin = (int)[v15 intValue];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"LETTER_ERROR_RADIAL_MAX_DISTANCE"]);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"LETTER_ERROR_RADIAL_MAX_DISTANCE"]);
      v6->_letterDistanceMax = (int)[v17 intValue];
    }
  }

  return v6;
}

- (CGPoint)randomBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  double v6 = v5;
  unint64_t letterErrorProbability = self->_letterErrorProbability;
  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  double v9 = v8;
  v10 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMin;
  unint64_t v11 = *(unint64_t *)((char *)&self->super.super.isa + *v10);
  v12 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMax;
  unint64_t v13 = *(unint64_t *)((char *)&self->super.super.isa + *v12);
  uint32_t v14 = arc4random();
  float v15 = (v9 + v9) * 3.14159265;
  float v16 = (float)v11 + (double)v14 / 4294967300.0 * (float)((float)v13 - (float)v11);
  __float2 v17 = __sincosf_stret(v15);
  double v18 = (float)(v17.__sinval * v16);
  double v19 = (float)(v17.__cosval * v16);
  result.y = v18;
  result.x = v19;
  return result;
}

@end