@interface TTKDefaultContinuousPathGenerator
+ (TTKDefaultContinuousPathGenerator)pathGeneratorWithAttributes:(id)a3;
- (BOOL)canHandleDoubleLetter;
- (CGPoint)addPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
- (CGPoint)scalarMultiplyPoint:(CGPoint)a3 by:(double)a4;
- (CGPoint)subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4;
- (CGPoint)targetDeviatedNormallyFromPoint:(CGPoint)a3 withKeyWidth:(double)a4;
- (TTKDefaultContinuousPathGenerator)init;
- (TTKDefaultContinuousPathGenerator)initWithParams:(id)a3;
- (double)distanceBetween:(CGPoint)a3 andPoint:(CGPoint)a4;
- (double)dotProduct:(CGPoint)a3 andPoint:(CGPoint)a4;
- (double)force;
- (double)randomNumberFromBetaDistribution;
- (double)randomNumberFromNormalDistribution;
- (double)timeDelta;
- (double)velocity;
- (id)boxPoint:(CGPoint)a3;
- (id)generateAngularTiming:(id)a3;
- (id)generateEquidistantTiming:(id)a3;
- (id)generateInflections:(id)a3;
- (id)generateKeyCentersFromKeys:(id)a3 string:(id)a4 layout:(id)a5;
- (id)generateKeysFromString:(id)a3 layout:(id)a4;
- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8;
- (id)generatePathFromString:(id)a3 layout:(id)a4;
- (id)generatePathFromString:(id)a3 timestamp:(double)a4 duration:(double)a5 layout:(id)a6;
- (id)generatePathFromString:(id)a3 timestamp:(double)a4 layout:(id)a5;
- (id)generateTimingArray:(id)a3;
- (void)dealloc;
- (void)setForce:(double)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setTimeDelta:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation TTKDefaultContinuousPathGenerator

+ (TTKDefaultContinuousPathGenerator)pathGeneratorWithAttributes:(id)a3
{
  id v3 = a3;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &__NSDictionary0__struct;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CONTINUOUS_PATH_GENERATOR"]);
  unsigned int v6 = [v5 isEqualToString:@"TYPIST"];

  v7 = &off_883B0;
  if (!v6) {
    v7 = off_883A8;
  }
  id v8 = [objc_alloc(*v7) initWithParams:v4];

  return (TTKDefaultContinuousPathGenerator *)v8;
}

- (double)dotProduct:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return a3.y * a4.y + a3.x * a4.x;
}

- (CGPoint)subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4
{
  double v4 = a3.x - a4.x;
  double v5 = a3.y - a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)addPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)scalarMultiplyPoint:(CGPoint)a3 by:(double)a4
{
  double v4 = a3.x * a4;
  double v5 = a3.y * a4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)targetDeviatedNormallyFromPoint:(CGPoint)a3 withKeyWidth:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  -[TTKDefaultContinuousPathGenerator randomNumberFromNormalDistribution](self, "randomNumberFromNormalDistribution");
  double v9 = v8 * a4 * self->_normalKeyWidthMultiple;
  -[TTKDefaultContinuousPathGenerator randomNumberFromNormalDistribution](self, "randomNumberFromNormalDistribution");
  double v11 = v10 * a4 * self->_normalKeyWidthMultiple;
  double v12 = x + v9;
  double v13 = y + v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (double)distanceBetween:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return sqrt((a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y));
}

- (id)boxPoint:(CGPoint)a3
{
  CGPoint v4 = a3;
  return (id)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v4,  "{CGPoint=dd}"));
}

- (TTKDefaultContinuousPathGenerator)initWithParams:(id)a3
{
  id v4 = a3;
  if (v4) {
    double v5 = v4;
  }
  else {
    double v5 = &__NSDictionary0__struct;
  }
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___TTKDefaultContinuousPathGenerator;
  unsigned int v6 = -[TTKDefaultContinuousPathGenerator init](&v54, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"GENERATE_MIDDLE_POINT"]);
    double v8 = v7;
    if (!v7) {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    }
    v6->_genMidPoint = [v8 BOOLValue];
    if (!v7) {

    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"FINGER_KEY_WIDTH_MULTIPLE"]);
    double v11 = v9;
    if (!v9)
    {
      LODWORD(v10) = 0;
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
    }

    [v11 floatValue];
    v6->_fingerKeyWdithMultiple = v12;
    if (!v9) {

    }
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MID_POINT_KEY_WIDTH_MULTIPLE"]);
    v15 = v13;
    if (!v13)
    {
      LODWORD(v14) = 3.5;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14));
    }

    [v15 floatValue];
    v6->_midPointKeyWidthMultiple = v16;
    if (!v13) {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MID_POINT_DEV_KEY_HEIGHT_MULTIPLE"]);
    v19 = v17;
    if (!v17)
    {
      LODWORD(v18) = 3.5;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18));
    }

    [v19 floatValue];
    v6->_midPointDevKeyHeightMultiple = v20;
    if (!v17) {

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PATH_BETA_PARAMETER"]);
    v23 = v21;
    if (!v21)
    {
      LODWORD(v22) = 4.0;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v22));
    }

    [v23 floatValue];
    v6->_betaParam = v24;
    if (!v21) {

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PATH_NORMAL_KEY_WIDTH_MULTIPLE"]);
    v27 = v25;
    if (!v25)
    {
      LODWORD(v26) = 0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26));
    }

    [v27 floatValue];
    v6->_normalKeyWidthMultiple = v28;
    if (!v25) {

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CPPATHGEN_TIME_INTERVAL"]);
    v31 = v29;
    if (!v29)
    {
      LODWORD(v30) = 1034594987;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v30));
    }

    [v31 floatValue];
    v6->_timeDelta = v32;
    if (!v29) {

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CPPATHGEN_FORCE"]);
    v35 = v33;
    if (!v33)
    {
      LODWORD(v34) = 1.0;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v34));
    }

    [v35 floatValue];
    v6->_force = v36;
    if (!v33) {

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CPPATHGEN_VELOCITY"]);
    v39 = v37;
    if (!v37)
    {
      LODWORD(v38) = 1129840640;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v38));
    }

    [v39 floatValue];
    v6->_velocitdouble y = v40;
    if (!v37) {

    }
    uint64_t v41 = objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CPPATHGEN_TIMING_ALGORITHM"]);
    v42 = (void *)v41;
    if (v41) {
      v43 = (__CFString *)v41;
    }
    else {
      v43 = @"EQUIDISTANT";
    }
    objc_storeStrong((id *)&v6->_touchTimingAlgorithm, v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CPPATHGEN_ACCELERATION"]);
    v46 = v44;
    if (!v44)
    {
      LODWORD(v45) = 1070386381;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v45));
    }

    [v46 floatValue];
    v6->_acceleration = v47;
    if (!v44) {

    }
    v48 = operator new(0x9C8uLL);
    unsigned int v49 = 5489;
    _DWORD *v48 = 5489;
    for (uint64_t i = 1LL; i != 624; ++i)
    {
      unsigned int v49 = i + 1812433253 * (v49 ^ (v49 >> 30));
      v48[i] = v49;
    }

    *((void *)v48 + 312) = 0LL;
    v6->m_generator = v48;
    v51 = operator new(0x10uLL);
    void *v51 = *(void *)&v6->_betaParam;
    v51[1] = 0x3FF0000000000000LL;
    v6->m_gamma_distribution = v51;
    v52 = operator new(0x20uLL);
    *(_OWORD *)v52 = xmmword_82180;
    v52[24] = 0;
    v6->m_normal_distribution = v52;
  }

  return v6;
}

- (TTKDefaultContinuousPathGenerator)init
{
  return -[TTKDefaultContinuousPathGenerator initWithParams:](self, "initWithParams:", &__NSDictionary0__struct);
}

- (void)dealloc
{
  m_generator = self->m_generator;
  if (m_generator) {
    operator delete(m_generator);
  }
  m_gamma_distribution = self->m_gamma_distribution;
  if (m_gamma_distribution) {
    operator delete(m_gamma_distribution);
  }
  m_normal_distribution = self->m_normal_distribution;
  if (m_normal_distribution) {
    operator delete(m_normal_distribution);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TTKDefaultContinuousPathGenerator;
  -[TTKDefaultContinuousPathGenerator dealloc](&v6, "dealloc");
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  m_generator = self->m_generator;
  _DWORD *m_generator = a3;
  for (uint64_t i = 1LL; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }

  *((void *)m_generator + 312) = 0LL;
  -[TTKDefaultContinuousPathGenerator reset](self, "reset");
}

- (double)randomNumberFromBetaDistribution
{
  double v3 = sub_428AC((uint64_t)self->m_gamma_distribution, (uint64_t)self->m_generator, (double *)self->m_gamma_distribution);
  return v3
       / (v3
        + sub_428AC( (uint64_t)self->m_gamma_distribution,  (uint64_t)self->m_generator,  (double *)self->m_gamma_distribution));
}

- (double)randomNumberFromNormalDistribution
{
  return sub_42B18( (uint64_t)self->m_normal_distribution,  (uint64_t)self->m_generator,  (double *)self->m_normal_distribution);
}

- (BOOL)canHandleDoubleLetter
{
  return 0;
}

- (id)generateKeysFromString:(id)a3 layout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 length];
  if (v7 == 1)
  {
    id v8 = 0LL;
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", (int)v7));
    if (v7)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = v7;
      do
      {
        unsigned __int16 v24 = (unsigned __int16)[v5 characterAtIndex:v10];
        float v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v24,  1LL));
        [v9 addObject:v12];

        ++v10;
      }

      while (v11 != v10);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v14 = v9;
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          if (!v18)
          {

            id v8 = 0LL;
            goto LABEL_16;
          }

          [v13 addObject:v18];
        }

        id v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v8 = v13;
LABEL_16:
  }

  return v8;
}

- (id)generateKeyCentersFromKeys:(id)a3 string:(id)a4 layout:(id)a5
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "center", (void)v14);
        float v12 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:"));
        [v7 addObject:v12];

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return v7;
}

- (id)generatePathFromString:(id)a3 layout:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generatePathFromString:timestamp:layout:]( self,  "generatePathFromString:timestamp:layout:",  a3,  a4,  0.0));
}

- (id)generatePathFromString:(id)a3 timestamp:(double)a4 layout:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generatePathFromString:timestamp:duration:layout:]( self,  "generatePathFromString:timestamp:duration:layout:",  a3,  a5,  a4,  -1.0));
}

- (id)generatePathFromString:(id)a3 timestamp:(double)a4 duration:(double)a5 layout:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  float v12 = (void *)objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generateKeysFromString:layout:]( self,  "generateKeysFromString:layout:",  v10,  v11));
  if (v12)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generateKeyCentersFromKeys:string:layout:]( self,  "generateKeyCentersFromKeys:string:layout:",  v12,  v10,  v11));
    if ([v13 count])
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator generateInflections:](self, "generateInflections:", v12));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator generateTimingArray:](self, "generateTimingArray:", v14));
      if (a5 == -1.0) {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:]( self,  "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:",  v14,  v15,  v12,  v10,  v11,  a4));
      }
      else {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:]( self,  "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:",  v14,  v15,  v12,  v10,  v11,  a4,  a5));
      }
      __int128 v17 = (void *)v16;
    }

    else
    {
      __int128 v17 = 0LL;
    }
  }

  else
  {
    __int128 v17 = 0LL;
  }

  return v17;
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return 0LL;
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  return 0LL;
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9
{
  return 0LL;
}

- (id)generateInflections:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  [v6 frame];
  double v64 = v7;
  [v6 frame];
  double v63 = v8;
  [v6 center];
  -[TTKDefaultContinuousPathGenerator targetDeviatedNormallyFromPoint:withKeyWidth:]( self,  "targetDeviatedNormallyFromPoint:withKeyWidth:");
  double v10 = v9;
  double v12 = v11;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:"));
  [v5 addObject:v13];

  __int128 v14 = (char *)[v4 count];
  __int128 v15 = v14;
  if ((uint64_t)v14 >= 2)
  {
    uint64_t v16 = v14 - 1;
    uint64_t v17 = 1LL;
    while (1)
    {
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v17]);
      [v18 center];
      double v20 = v19;
      double v22 = v21;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v17 - 1]);
      [v23 center];
      double v25 = v24;
      double v27 = v26;

      if (v20 != v25 || v22 != v27) {
        break;
      }
      if (-[TTKDefaultContinuousPathGenerator canHandleDoubleLetter](self, "canHandleDoubleLetter"))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
        [v5 addObject:v61];
LABEL_28:
      }
    }

    uint64_t v29 = v17 + 1;
    if (v17 + 1 < (uint64_t)v15)
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v17 + 1]);
      [v30 center];
      double v32 = v31;
      double v34 = v33;

      if (v22 == v27 && v22 == v34 && (v25 < v20 && v20 < v32 || v25 > v20 && v20 > v32))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v17 + 1]);

        [v35 center];
        double v18 = v35;
        uint64_t v17 = v29;
      }
    }

    [v18 center];
    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:]( self,  "distanceBetween:andPoint:",  v10,  v12,  v36,  v37);
    double v39 = v38;
    double v40 = v64 * self->_fingerKeyWdithMultiple;
    if (v40 > 0.0)
    {
      [v18 frame];
      double v38 = v39 + v40 + v41 * -0.5;
    }

    else {
      double v42 = v38;
    }
    objc_msgSend(v18, "center", v38);
    double v44 = v43;
    [v18 center];
    -[TTKDefaultContinuousPathGenerator targetDeviatedNormallyFromPoint:withKeyWidth:]( self,  "targetDeviatedNormallyFromPoint:withKeyWidth:",  v10 + v42 * (v44 - v10) / v39,  v12 + v42 * (v45 - v12) / v39,  v64);
    double v47 = v46;
    double v49 = v48;
    if (self->_genMidPoint && v42 > v64 * self->_midPointKeyWidthMultiple)
    {
      -[TTKDefaultContinuousPathGenerator randomNumberFromBetaDistribution](self, "randomNumberFromBetaDistribution");
      double v51 = v50;
      double midPointDevKeyHeightMultiple = self->_midPointDevKeyHeightMultiple;
      -[TTKDefaultContinuousPathGenerator randomNumberFromBetaDistribution](self, "randomNumberFromBetaDistribution");
      double v54 = sqrt((v47 - v10) * (v47 - v10) + (v49 - v12) * (v49 - v12));
      double v55 = (v47 - v10) / v54;
      double v56 = (v49 - v12) / v54;
      double v57 = v63 * (midPointDevKeyHeightMultiple + midPointDevKeyHeightMultiple);
      double v58 = (v49 * v56 + v55 * v47 - (v12 * v56 + v55 * v10)) * v51;
      double v59 = fabs(v58);
      if (v57 >= v59) {
        double v57 = v59;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue( -[TTKDefaultContinuousPathGenerator boxPoint:]( self,  "boxPoint:",  v10 + (v57 * -0.5 + v57 * v53) * -v56 + v55 * v58,  v12 + v55 * (v57 * -0.5 + v57 * v53) + v56 * v58));
      [v5 addObject:v60];
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:", v47, v49));
    [v5 addObject:v61];
    double v10 = v47;
    double v12 = v49;
    goto LABEL_28;
  }

- (id)generateTimingArray:(id)a3
{
  id v4 = a3;
  if (-[NSString isEqualToString:](self->_touchTimingAlgorithm, "isEqualToString:", @"ANGULAR")) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator generateAngularTiming:](self, "generateAngularTiming:", v4));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TTKDefaultContinuousPathGenerator generateEquidistantTiming:](self, "generateEquidistantTiming:", v4));
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)generateAngularTiming:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[TTKDefaultContinuousPathGenerator velocity](self, "velocity");
  double v50 = v6;
  double timeDelta = self->_timeDelta;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  [v8 getValue:v57];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v9 addObject:&off_8FF48];
  double v10 = ceil(2.0 / timeDelta);
  double v11 = (_BYTE *)(&dword_0 + 1);
  double v12 = 1.0;
  double v13 = v10;
  while (v11 < [v4 count])
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v11]);
    [v14 getValue:&v56];

    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:]( self,  "distanceBetween:andPoint:",  *(_OWORD *)v57,  v56);
    double v16 = v15;
    double v18 = v10;
    if (v11 < (char *)[v4 count] - 1)
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v11 + 1]);
      [v19 getValue:&v54];

      double v20 = *(double *)&v56 - v57[0];
      double v21 = *((double *)&v56 + 1) - v57[1];
      double v22 = v54 - *(double *)&v56;
      double v23 = v55 - *((double *)&v56 + 1);
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:]( self,  "dotProduct:andPoint:",  *(double *)&v56 - v57[0],  *((double *)&v56 + 1) - v57[1],  v54 - *(double *)&v56,  v55 - *((double *)&v56 + 1));
      double v25 = v24;
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v20, v21, v20, v21);
      double v27 = v26;
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v22, v23, v22, v23);
      double v29 = v25 / sqrt(v27 * v28);
      double v17 = v50 * v29;
      if (v50 * v29 <= v10 || v29 <= 0.0) {
        double v18 = v10;
      }
      else {
        double v18 = v50 * v29;
      }
      double v12 = 1.0;
    }

    BOOL v31 = 0;
    double acceleration = self->_acceleration;
    double v52 = v18 * 0.8;
    double v33 = 0.0;
    while (1)
    {
      double v33 = v33 + v13 * self->_timeDelta >= v16 ? v16 : v33 + v13 * self->_timeDelta;
      double v34 = v33 / v16;
      *(float *)&double v34 = v33 / v16;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v34, v17));
      [v9 addObject:v35];

      if (vabdd_f64(v33, v16) < v12) {
        break;
      }
      if (v31)
      {
        if (acceleration * v13 <= v10) {
          double v13 = v10;
        }
        else {
          double v13 = acceleration * v13;
        }
        BOOL v31 = 1;
      }

      else
      {
        double v36 = acceleration * v13;
        if (acceleration * v13 >= v50) {
          double v36 = v50;
        }
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        if (v13 < v50) {
          double v13 = v36;
        }
        v53[2] = sub_42508;
        v53[3] = &unk_898D0;
        v53[4] = self;
        double v37 = objc_retainBlock(v53);
        double v51 = v18;
        double v38 = pow(v18 / v13, 0.2);
        double v39 = self->_acceleration;
        if (v38 >= v39) {
          double v38 = self->_acceleration;
        }
        double v40 = v12 / v39;
        if (v38 <= v40) {
          double v41 = v40;
        }
        else {
          double v41 = v38;
        }
        double v42 = v13 * self->_timeDelta;
        double v43 = v42 * (1.0 - pow(v41, 6.0)) / (1.0 - v41);
        BOOL v31 = v43 >= v16 - v33;
        if (v43 >= v16 - v33)
        {
          double acceleration = ((double (*)(void *, double, double, double, double))v37[2])( v37,  v16 - v33,  v13,  5.0,  v41);
          if (v13 * pow(acceleration, 5.0) < v52)
          {
            double v44 = 5.0;
            do
            {
              double v45 = self->_acceleration;
              if (acceleration >= v45 || acceleration <= 1.0 / v45) {
                break;
              }
              double v44 = v44 + -1.0;
              double acceleration = ((double (*)(void *, double, double, double, double))v37[2])( v37,  v16 - v33,  v13,  v44,  v41);
              double v46 = v13 * pow(acceleration, v44);
            }

            while (v44 > 2.0 && v46 < v52);
          }
        }

        double v12 = 1.0;
        double v18 = v51;
      }
    }

    id v48 = [v9 copy];
    [v5 addObject:v48];

    [v9 removeAllObjects];
    *(_OWORD *)double v57 = v56;
    ++v11;
  }

  return v5;
}

- (id)generateEquidistantTiming:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  [v6 getValue:&v21];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v7 addObject:&off_8FF48];
  for (unint64_t i = 1; i < (unint64_t)[v4 count]; ++i)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:i]);
    [v9 getValue:&v20];

    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:](self, "distanceBetween:andPoint:", v21, v20);
    double v11 = ceil(v10 / (self->_timeDelta * self->_velocity));
    if (v11 <= 4.0) {
      double v12 = 3.0;
    }
    else {
      double v12 = v11 + -1.0;
    }
    uint64_t v13 = (uint64_t)v12;
    if ((uint64_t)v12 >= 1)
    {
      uint64_t v14 = 1LL;
      double v15 = 1.0 / (double)(uint64_t)v12;
      do
      {
        double v16 = v15 * (double)(int)v14;
        *(float *)&double v16 = v16;
        double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v16));
        [v7 addObject:v17];

        ++v14;
      }

      while (v14 <= v13);
    }

    id v18 = [v7 copy];
    [v5 addObject:v18];

    [v7 removeAllObjects];
    __int128 v21 = v20;
  }

  return v5;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocitdouble y = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)timeDelta
{
  return self->_timeDelta;
}

- (void)setTimeDelta:(double)a3
{
  self->_double timeDelta = a3;
}

- (void).cxx_destruct
{
}

@end