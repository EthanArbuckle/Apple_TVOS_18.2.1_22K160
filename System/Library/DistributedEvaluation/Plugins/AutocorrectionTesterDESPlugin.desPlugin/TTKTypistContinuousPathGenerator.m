@interface TTKTypistContinuousPathGenerator
- (CGPoint)_pointOnCurve:(id)a3 atTime:(double)a4;
- (TTKTypistContinuousPathGenerator)initWithParams:(id)a3;
- (double)alpha;
- (id)_generateControlPoints:(id)a3 alpha:(double)a4;
- (id)_generateTouchPointsOnPath:(id)a3 withSegmentTiming:(id)a4;
- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8;
- (void)setAlpha:(double)a3;
@end

@implementation TTKTypistContinuousPathGenerator

- (id)_generateTouchPointsOnPath:(id)a3 withSegmentTiming:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___TIContinuousPath);
  if ([v6 count] != (char *)&dword_0 + 1)
  {
    v8 = 0LL;
    uint64_t v9 = 0LL;
    v20 = v6;
    do
    {
      else {
        v10 = (char *)((_BYTE *)[v6 count] - v8);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v8, v10));
      uint64_t v22 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v9]);
      if ([v12 count])
      {
        unint64_t v13 = 0LL;
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v13]);
          [v14 doubleValue];
          double v16 = v15;

          self->_currentTimestamp = v16 + self->_currentTimestamp;
          v17 = objc_alloc(&OBJC_CLASS___TIContinuousPathSample);
          -[TTKTypistContinuousPathGenerator _pointOnCurve:atTime:](self, "_pointOnCurve:atTime:", v11, v16);
          v18 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:]( v17,  "initWithPoint:timeStamp:force:radius:stage:pathIndex:",  7LL,  -1LL);
          -[TIContinuousPath addSample:](v7, "addSample:", v18);

          ++v13;
        }

        while (v13 < (unint64_t)[v12 count]);
      }

      uint64_t v9 = v22 + 1;

      v8 += 3;
      id v6 = v20;
    }

    while ((char *)[v20 count] - 1 > v8);
  }

  return v7;
}

- (CGPoint)_pointOnCurve:(id)a3 atTime:(double)a4
{
  id v5 = a3;
  id v6 = (char *)[v5 count];
  if (v6 == (_BYTE *)&dword_0 + 3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v12 CGPointValue];
    double v14 = v13;

    double v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
    [v15 CGPointValue];
    double v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
    [v18 CGPointValue];
    double v20 = v19;

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v21 CGPointValue];
    double v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
    [v24 CGPointValue];
    double v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
    [v27 CGPointValue];
    double v29 = v28;

    float v30 = 1.0 - a4;
    double v31 = (float)(v30 * v30);
    double v32 = (1.0 - a4 + 1.0 - a4) * a4;
    double v9 = v32 * v17 + v31 * v14 + a4 * a4 * v20;
    double v11 = v32 * v26 + v31 * v23 + a4 * a4 * v29;
    goto LABEL_9;
  }

  if (v6 == (_BYTE *)&dword_0 + 2)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v33 CGPointValue];
    double v35 = v34;
    double v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
    [v38 CGPointValue];
    double v40 = v39;
    double v42 = v41;

    double v43 = 1.0 - a4;
    double v9 = v40 * a4 + (1.0 - a4) * v35;
    double v44 = v42 * a4;
LABEL_8:
    double v11 = v44 + v43 * v37;
    goto LABEL_9;
  }

  if (v6 != (_BYTE *)&dword_0 + 1)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v45 CGPointValue];
    double v74 = v46;

    v47 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
    [v47 CGPointValue];
    double v73 = v48;

    v49 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
    [v49 CGPointValue];
    double v72 = v50;

    v51 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:3]);
    [v51 CGPointValue];
    double v71 = v52;

    v53 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v53 CGPointValue];
    double v70 = v54;

    v55 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
    [v55 CGPointValue];
    double v69 = v56;

    v57 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
    [v57 CGPointValue];
    double v59 = v58;

    v60 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:3]);
    [v60 CGPointValue];
    double v37 = v61;

    float v62 = 1.0 - a4;
    double v63 = powf(v62, 3.0);
    double v64 = a4 * 3.0 * (float)(v62 * v62);
    float v65 = a4;
    double v66 = (1.0 - a4) * (float)((float)(v65 * v65) * 3.0);
    double v43 = powf(v65, 3.0);
    double v9 = v64 * v73 + v63 * v74 + v66 * v72 + v43 * v71;
    double v44 = v64 * v69 + v63 * v70 + v66 * v59;
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  [v7 CGPointValue];
  double v9 = v8;
  double v11 = v10;

LABEL_9:
  double v67 = v9;
  double v68 = v11;
  result.y = v68;
  result.x = v67;
  return result;
}

- (id)_generateControlPoints:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 count];
    if ((uint64_t)v8 >= 4)
    {
      uint64_t v10 = (uint64_t)v8;
      v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
      double v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v11 = 0LL;
      float v12 = a4 + a4;
      float v13 = a4;
      float v107 = v13;
      float v108 = v12;
      while (1)
      {
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v11]);
        [v14 CGPointValue];
        double v16 = v15;
        double v18 = v17;

        double v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v11 + 1]);
        [v19 CGPointValue];
        double v21 = v20;
        double v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:(v11 + 2) % v10]);
        [v24 CGPointValue];
        double v26 = v25;
        double v28 = v27;

        double v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:((v11 + 2) % v10 + 1) % v10]);
        [v29 CGPointValue];
        double v31 = v30;
        double v33 = v32;

        double v110 = v18;
        double v111 = v16;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v21, v23, v16, v18);
        double v35 = v34;
        double v37 = v36;
        double v118 = v23;
        double v119 = v21;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v26, v28, v21, v23);
        double v39 = v38;
        double v41 = v40;
        double v114 = v33;
        double v115 = v31;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v31, v33, v26, v28);
        double v43 = v42;
        double v45 = v44;
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v35, v37, v35, v37);
        *(float *)&double v46 = v46;
        float v47 = sqrtf(*(float *)&v46);
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v39, v41, v39, v41);
        *(float *)&double v48 = v48;
        float v49 = sqrtf(*(float *)&v48);
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v43, v45, v43, v45);
        double v51 = v50;
        double v116 = v28;
        double v117 = v26;
        float v113 = v49;
        if (fabsf(v47) >= 0.00000011921)
        {
          double v106 = v50;
          float v56 = powf(v47, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v26, v28, v56);
          double v58 = v57;
          double v60 = v59;
          float v61 = powf(v49, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v111, v110, v61);
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:]( self,  "subtractPoint:byPoint:",  v58,  v60,  v62,  v63);
          double v65 = v64;
          double v67 = v66;
          float v68 = powf(v47, v107) * 3.0;
          double v69 = (float)(v61 + (float)((float)(v68 * powf(v49, v107)) + (float)(v56 * 2.0)));
          double v52 = v118;
          double v53 = v119;
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v119, v118, v69);
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v65, v67, v70, v71);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
          double v51 = v106;
          double v54 = v72;
          double v55 = v73;
        }

        else
        {
          double v52 = v118;
          double v53 = v119;
          double v54 = v119;
          double v55 = v118;
        }

        float v74 = v51;
        float v75 = sqrtf(v74);
        if (fabsf(v75) >= 0.00000011921)
        {
          float v80 = powf(v75, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v53, v52, v80);
          double v82 = v81;
          double v112 = v55;
          double v84 = v83;
          float v85 = powf(v113, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v115, v114, v85);
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:]( self,  "subtractPoint:byPoint:",  v82,  v84,  v86,  v87);
          double v89 = v88;
          double v91 = v90;
          float v92 = powf(v75, v107) * 3.0;
          double v93 = (float)(v85 + (float)((float)(powf(v113, v107) * v92) + (float)(v80 * 2.0)));
          double v76 = v116;
          double v77 = v117;
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v117, v116, v93);
          double v95 = v94;
          double v96 = v91;
          double v55 = v112;
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v89, v96, v97, v95);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
          double v78 = v98;
          double v79 = v99;
          if (!v11)
          {
LABEL_12:
            objc_msgSend(v109, "moveToPoint:", v119, v118, *(void *)&v106);
            v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v119, v118));
            -[NSMutableArray addObject:](v9, "addObject:", v100);
          }
        }

        else
        {
          double v76 = v116;
          double v77 = v117;
          double v78 = v117;
          double v79 = v116;
          if (!v11) {
            goto LABEL_12;
          }
        }

        objc_msgSend( v109,  "addCurveToPoint:controlPoint1:controlPoint2:",  v77,  v76,  v54,  v55,  v78,  v79,  *(void *)&v106);
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v54, v55));
        v120[0] = v101;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v78, v79));
        v120[1] = v102;
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v77, v76));
        v120[2] = v103;
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v120, 3LL));
        -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v104);

        if (v10 - 3 == ++v11)
        {

          goto LABEL_15;
        }
      }
    }
  }

  double v9 = 0LL;
LABEL_15:

  return v9;
}

- (TTKTypistContinuousPathGenerator)initWithParams:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TTKTypistContinuousPathGenerator;
  id v5 = -[TTKDefaultContinuousPathGenerator initWithParams:](&v14, "initWithParams:", v4);
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ALPHA"]);
      if (v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ALPHA"]);
        [v8 floatValue];
        double v10 = v9;
        if (v9 > 1.0) {
          double v10 = 1.0;
        }
        BOOL v11 = v9 < 0.0;
        double v12 = 0.0;
        if (!v11) {
          double v12 = v10;
        }
        -[TTKTypistContinuousPathGenerator setAlpha:](v6, "setAlpha:", v12);
      }

      else
      {
        -[TTKTypistContinuousPathGenerator setAlpha:](v6, "setAlpha:", 0.5);
      }
    }

    else
    {
      -[TTKTypistContinuousPathGenerator setAlpha:](v5, "setAlpha:", 0.5);
    }
  }

  return v6;
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return -[TTKTypistContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:]( self,  "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:",  a3,  a4,  a5,  a6,  a7,  0.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  id v10 = a3;
  id v11 = a5;
  double v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  -[NSMutableArray addObject:](v12, "addObject:", v13);

  -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v10);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (char *)objc_msgSend(v10, "count") - 1));
  -[NSMutableArray addObject:](v12, "addObject:", v14);

  if (!v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___TTKTypistContinuousPathGenerator;
    id v15 = -[TTKDefaultContinuousPathGenerator generateTimingArray:](&v19, "generateTimingArray:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v15);
  }

  -[TTKTypistContinuousPathGenerator alpha](self, "alpha");
  double v16 = (void *)objc_claimAutoreleasedReturnValue( -[TTKTypistContinuousPathGenerator _generateControlPoints:alpha:]( self,  "_generateControlPoints:alpha:",  v12));
  double v17 = (void *)objc_claimAutoreleasedReturnValue( -[TTKTypistContinuousPathGenerator _generateTouchPointsOnPath:withSegmentTiming:]( self,  "_generateTouchPointsOnPath:withSegmentTiming:",  v16,  v11));

  return v17;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end