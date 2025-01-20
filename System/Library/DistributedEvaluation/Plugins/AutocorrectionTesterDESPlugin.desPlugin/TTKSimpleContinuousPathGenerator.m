@interface TTKSimpleContinuousPathGenerator
- (BOOL)canHandleDoubleLetter;
- (TTKSimpleContinuousPathGenerator)initWithParams:(id)a3;
- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8;
@end

@implementation TTKSimpleContinuousPathGenerator

- (TTKSimpleContinuousPathGenerator)initWithParams:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TTKSimpleContinuousPathGenerator;
  return -[TTKDefaultContinuousPathGenerator initWithParams:](&v4, "initWithParams:", a3);
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return -[TTKSimpleContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:]( self,  "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:",  a3,  a4,  a5,  a6,  a7,  0.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  return -[TTKSimpleContinuousPathGenerator generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:]( self,  "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:",  a3,  a5,  a6,  a7,  a8,  a4,  -1.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9
{
  id v13 = a3;
  id v14 = a6;
  v15 = objc_alloc_init(&OBJC_CLASS___TIContinuousPath);
  self->_double currentTimestamp = a4;
  -[TTKDefaultContinuousPathGenerator timeDelta](self, "timeDelta");
  double v17 = v16;
  if (a5 != -1.0)
  {
    id v18 = [v13 count];
    double v19 = 0.0;
    if ((unint64_t)v18 >= 2)
    {
      uint64_t v20 = 0LL;
      unint64_t v21 = 1LL;
      do
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v21 - 1, v19));
        v20 += (uint64_t)[v22 count];

        ++v21;
      }

      while (v21 < (unint64_t)[v13 count]);
      double v19 = (double)v20;
    }

    double v17 = a5 / v19;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
  [v23 getValue:&v46];

  if ((unint64_t)[v13 count] >= 2)
  {
    unint64_t v24 = 1LL;
    do
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v24]);
      [v25 getValue:&v45];

      v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v24 - 1]);
      if ([v26 count])
      {
        unint64_t v27 = 0LL;
        do
        {
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v45, v46);
          double v29 = v28;
          double v31 = v30;
          v32 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndex:v27]);
          [v32 floatValue];
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v29, v31, v33);
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v46, v34, v35);
          double v37 = v36;
          double v39 = v38;

          v40 = objc_alloc(&OBJC_CLASS___TIContinuousPathSample);
          double currentTimestamp = self->_currentTimestamp;
          -[TTKDefaultContinuousPathGenerator force](self, "force");
          v43 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:]( v40,  "initWithPoint:timeStamp:force:radius:stage:pathIndex:",  7LL,  -1LL,  v37,  v39,  currentTimestamp,  v42,  0.0);
          -[TIContinuousPath addSample:](v15, "addSample:", v43);
          self->_double currentTimestamp = v17 + self->_currentTimestamp;

          ++v27;
        }

        while (v27 < (unint64_t)[v26 count]);
      }

      __int128 v46 = v45;

      ++v24;
    }

    while (v24 < (unint64_t)[v13 count]);
  }

  return v15;
}

- (BOOL)canHandleDoubleLetter
{
  return 0;
}

@end