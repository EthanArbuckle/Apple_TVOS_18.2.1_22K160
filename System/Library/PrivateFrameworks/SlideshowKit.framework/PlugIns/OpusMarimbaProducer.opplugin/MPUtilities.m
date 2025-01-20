@interface MPUtilities
+ ($421962E1114BB55FD51FACB03C2AC210)scaledFilterPresetVectorValue:(SEL)a3 withKey:(id *)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (BOOL)pathIsRelative:(id)a3;
+ (CGColor)CGColorFromString:(id)a3;
+ (CGColor)CGColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (CGColor)blackCGColor;
+ (CGPoint)computePointValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(CGPoint)a5;
+ (CGPoint)scaledFilterPresetPointValue:(CGPoint)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (double)aspectRatioOfLayerable:(id)a3 relativeToAspectRatio:(double)a4;
+ (double)computeScalarValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(double)a5 context:(id)a6;
+ (double)displayTimeForText:(id)a3;
+ (double)scaledFilterPresetScalarValue:(double)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (double)transformTime:(double)a3 forAnimationPath:(id)a4;
+ (id)animationsPathsFromFilterID:(id)a3 andPresetID:(id)a4;
+ (id)attributesFormMPFilter:(id)a3 atTime:(double)a4;
+ (id)attributesFromAnimationPathsInFilter:(id)a3 atTime:(double)a4;
+ (id)computeVectorValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(id)a5;
+ (id)createMCAction:(id)a3 forPlug:(id)a4 withKey:(id)a5;
+ (id)createPlugInContainer:(id)a3 forLayer:(id)a4 key:(id)a5 inDocument:(id)a6;
+ (id)createPlugInSlide:(id)a3 forLayer:(id)a4 inDocument:(id)a5;
+ (id)createPlugPathToContainer:(id)a3 inDocument:(id)a4;
+ (id)createPlugPathToObject:(id)a3 inDocument:(id)a4;
+ (id)defaultAttributesForMPFilter:(id)a3;
+ (id)defaultAttributesForMPTransition:(id)a3;
+ (id)effectContainersForTime:(double)a3 inDocument:(id)a4;
+ (id)effectForMCContainerEffect:(id)a3 inDocument:(id)a4;
+ (id)effectForMCContainerWithObjectID:(id)a3 inDocument:(id)a4;
+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5;
+ (id)idOfCombinedID:(id)a3;
+ (id)layerForContainer:(id)a3 inDocument:(id)a4;
+ (id)parentsOfObject:(id)a3;
+ (id)placesPinLabelForSlideAssetPath:(id)a3 inDocument:(id)a4;
+ (id)presetIDOfCombinedID:(id)a3;
+ (id)slideForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5;
+ (id)slideForPath:(id)a3 inDocument:(id)a4;
+ (id)slideForSlide:(id)a3 inDocument:(id)a4;
+ (id)stringFromCGColor:(CGColor *)a3;
+ (id)stringWithNewUUID;
+ (id)textForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5;
+ (id)textForIndex:(int64_t)a3 inMCContainerWithObjectID:(id)a4 inDocument:(id)a5;
+ (id)textsDisplayedAtTime:(double)a3 inDocument:(id)a4;
+ (unint64_t)timeOffSetFromString:(id)a3;
+ (void)collectAllActionableLayers:(id)a3 inDictionary:(id)a4;
+ (void)syncAnimationPaths:(id)a3;
@end

@implementation MPUtilities

+ (unint64_t)timeOffSetFromString:(id)a3
{
  return 0LL;
}

+ (double)transformTime:(double)a3 forAnimationPath:(id)a4
{
  id v6 = [a4 orderedKeyframes];
  id v7 = [v6 count];
  double v8 = 0.0;
  double v8 = 1.0;
  if (a3 >= 1.0) {
    return v8;
  }
  unint64_t v10 = (unint64_t)v7;
  unsigned int v11 = 0;
  unint64_t v12 = 1LL;
  while (1)
  {
    objc_msgSend(a4, "relativeTimeForKeyframe:", objc_msgSend(v6, "objectAtIndex:", v12));
    if (v13 >= a3) {
      break;
    }
    unint64_t v12 = v11 + 2;
    ++v11;
    if (v10 <= v12) {
      return v8;
    }
  }

  id v15 = [v6 objectAtIndex:v11];
  id v16 = [v6 objectAtIndex:v12];
  [a4 relativeTimeForKeyframe:v15];
  double v18 = v17;
  [a4 relativeTimeForKeyframe:v16];
  double v20 = v19 - v18;
  double v21 = (a3 - v18) / (v19 - v18);
  [v15 postControl];
  double v23 = v22;
  [v16 preControl];
  return v18 + Spline1(v21, 0.0, v23, v24 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v20;
}

+ (double)computeScalarValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(double)a5 context:(id)a6
{
  id v10 = [a3 animationPath];
  id v11 = objc_msgSend(objc_msgSend(a3, "parent"), "plug");
  id v12 = [v10 orderedKeyframesWithPlugTiming:v11];
  double v13 = (char *)[v12 count];
  unsigned int v14 = [v10 isTriggered];
  if (v13)
  {
    unsigned int v15 = v14;
    char v16 = a4 <= 0.0 ? v14 : 0;
    if ((v16 & 1) == 0)
    {
      if (v13 == (_BYTE *)&dword_0 + 1) {
        char v17 = v14;
      }
      else {
        char v17 = 1;
      }
      if (a4 > 0.0 && (v17 & 1) != 0)
      {
        if (a4 < 1.0)
        {
          uint64_t v18 = v14 ^ 1;
          if ((unint64_t)v13 > v18)
          {
            unsigned int v19 = v18 + 1;
            while (1)
            {
              +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  [v12 objectAtIndex:v18],  v11);
              double v21 = v20;
              [v11 fullDuration];
              if (v21 / v22 >= a4) {
                break;
              }
              uint64_t v18 = v19;
            }

            if (v19 == 1) {
              id v25 = 0LL;
            }
            else {
              id v25 = [v12 objectAtIndex:v19 - 2];
            }
            id v26 = [v12 objectAtIndex:v18];
LABEL_19:
            if (v25)
            {
              +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v25,  v11);
              double v28 = v27;
              [v11 fullDuration];
              double v30 = v28 / v29;
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___MCAnimationKeyframeFunction, v31);
              if ((objc_opt_isKindOfClass(v25, v32) & 1) != 0)
              {
                [v25 timeOffset];
                [v25 duration];
                TimeForKeyframeAttributesInPlug([v25 timeOffsetKind], 0, v11);
                double v34 = v33;
                [v11 fullDuration];
                double v36 = v34 / v35;
                BOOL v37 = v34 / v35 <= a4 || v30 > a4;
                float v38 = a5;
                if ([v25 function])
                {
                  v39 = (NSMutableDictionary *)qword_2B06B8;
                  if (!qword_2B06B8)
                  {
                    v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    qword_2B06B8 = (uint64_t)v39;
                  }

                  v40 = (MUMathExpressionFloatBased *)-[NSMutableDictionary objectForKey:]( v39,  "objectForKey:",  [v25 function]);
                  if (v40)
                  {
                    v41 = v40;
                    -[MUMathExpressionFloatBased resetAllVariables](v40, "resetAllVariables");
                  }

                  else
                  {
                    v43 = -[MUMathExpressionFloatBased initWithString:error:]( [MUMathExpressionFloatBased alloc],  "initWithString:error:",  [v25 function],  0);
                    if (!v43) {
                      goto LABEL_43;
                    }
                    v41 = v43;
                    objc_msgSend((id)qword_2B06B8, "setObject:forKey:", v43, objc_msgSend(v25, "function"));
                  }

                  id v44 = [v25 functionParameters];
                  if (v44) {
                    -[MUMathExpressionFloatBased setVariableValues:](v41, "setVariableValues:", v44);
                  }
                  if (a6) {
                    -[MUMathExpressionFloatBased setVariableValues:](v41, "setVariableValues:", a6);
                  }
                  double v45 = 0.0;
                  if (v30 < a4)
                  {
                    double v45 = 1.0;
                    if (v36 > a4) {
                      double v45 = (a4 - v30) / (v36 - v30);
                    }
                  }

                  [v25 functionTimeFactor];
                  double v47 = v46;
                  [v25 functionTimeOffset];
                  double v49 = v48 + v45 * v47;
                  *(float *)&double v49 = v49;
                  -[MUMathExpressionFloatBased setValue:forVariable:](v41, "setValue:forVariable:", @"time", v49);
                  if (v15)
                  {
                    *(float *)&double v50 = a5;
                    -[MUMathExpressionFloatBased setValue:forVariable:]( v41,  "setValue:forVariable:",  @"startValue",  v50);
                  }

                  -[MUMathExpressionFloatBased evaluate](v41, "evaluate");
                  float v38 = v51;
                }
              }

              else
              {
                [v25 value];
                float v38 = v42;
                BOOL v37 = 1;
              }
            }

            else
            {
              float v38 = a5;
              BOOL v37 = 1;
              double v30 = 0.0;
            }

+ (CGPoint)computePointValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  objc_msgSend(a1, "transformTime:forAnimationPath:", a4);
  double v9 = v8;
  id v10 = [a3 orderedKeyframes];
  id v11 = (char *)[v10 count];
  if (!v11) {
    goto LABEL_17;
  }
  if (v11 == (_BYTE *)&dword_0 + 1 || v9 <= 0.0)
  {
    id v20 = [v10 objectAtIndex:0];
LABEL_16:
    [v20 point];
    double x = v21;
    double y = v22;
    goto LABEL_17;
  }

  if (v9 >= 1.0)
  {
    id v20 = [v10 lastObject];
    goto LABEL_16;
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    unsigned int v14 = 0LL;
    uint64_t v15 = *(void *)v46;
    while (2)
    {
      char v16 = 0LL;
      char v17 = v14;
      do
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v16);
        [a3 relativeTimeForKeyframe:v14];
        if (v18 > v9)
        {
          unsigned int v19 = v14;
          unsigned int v14 = v17;
          goto LABEL_19;
        }

        char v16 = (char *)v16 + 1;
        char v17 = v14;
      }

      while (v13 != v16);
      id v13 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    unsigned int v19 = 0LL;
LABEL_19:
    if (v14)
    {
      [a3 relativeTimeForKeyframe:v14];
      double v26 = v25;
      [a3 relativeTimeForKeyframe:v19];
      double v28 = v27;
      [v14 point];
      double v30 = v29;
      if (v19)
      {
        [v19 point];
        double v32 = v31;
        [v14 point];
        double v34 = v32 - v33;
        double v35 = v9 - v26;
        double v36 = v28 - v26;
        double v37 = (v9 - v26) * v34 / (v28 - v26);
        [v14 point];
        double v39 = v38;
        [v19 point];
        double v41 = v40;
        [v14 point];
        double v43 = v35 * (v41 - v42) / v36;
      }

      else
      {
        [v14 point];
        double v39 = v44;
        double v37 = 0.0;
        double v43 = 0.0;
      }

      double x = v30 + v37;
      double y = v39 + v43;
    }
  }

+ (id)computeVectorValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(id)a5
{
  double v8 = v7;
  id v9 = [a3 orderedKeyframes];
  id v10 = (char *)[v9 count];
  if (!v10) {
    return a5;
  }
  if (v10 == (_BYTE *)&dword_0 + 1 || v8 <= 0.0)
  {
    id v33 = [v9 objectAtIndex:0];
  }

  else
  {
    if (v8 < 1.0)
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v11)
      {
        id v12 = v11;
        id v13 = 0LL;
        uint64_t v14 = *(void *)v39;
LABEL_7:
        uint64_t v15 = 0LL;
        char v16 = v13;
        while (1)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v15);
          [a3 relativeTimeForKeyframe:v13];
          if (v17 > v8) {
            break;
          }
          uint64_t v15 = (char *)v15 + 1;
          char v16 = v13;
          if (v12 == v15)
          {
            id v12 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v12) {
              goto LABEL_7;
            }
            char v16 = v13;
            id v13 = 0LL;
            break;
          }
        }

        if (v16)
        {
          __int128 v36 = 0uLL;
          int v37 = 0;
          double v18 = (char *)[a5 count];
          LOBYTE(v36) = [a5 count];
          [a3 relativeTimeForKeyframe:v16];
          double v20 = v19;
          [a3 relativeTimeForKeyframe:v13];
          if (v18)
          {
            double v22 = 0LL;
            double v23 = v8 - v20;
            double v24 = v21 - v20;
            do
            {
              objc_msgSend(objc_msgSend(v16, "vector"), "valueAtIndex:", v22);
              double v26 = v25;
              if (v13)
              {
                objc_msgSend(objc_msgSend(v13, "vector"), "valueAtIndex:", v22);
                double v28 = v27;
                objc_msgSend(objc_msgSend(v16, "vector"), "valueAtIndex:", v22);
                double v30 = v23 * (v28 - v29) / v24;
              }

              else
              {
                double v30 = 0.0;
              }

              float v31 = v26 + v30;
              *((float *)&v36 + (void)v22++ + 1) = v31;
            }

            while (v18 != v22);
          }

          __int128 v34 = v36;
          int v35 = v37;
          return +[MPVector vectorFromMCVector:](&OBJC_CLASS___MPVector, "vectorFromMCVector:", &v34);
        }
      }

      return a5;
    }

    id v33 = [v9 lastObject];
  }

  return [v33 vector];
}

+ (double)scaledFilterPresetScalarValue:(double)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  if (!a6) {
    return a3;
  }
  id v7 = objc_msgSend( +[MPFilterManager sharedManager](MPFilterManager, "sharedManager", a4),  "animationsForFilterID:andPresetID:",  a5,  a6);
  unint64_t v8 = (unint64_t)[v7 objectForKey:@"boxMin"];
  unint64_t v9 = (unint64_t)[v7 objectForKey:@"boxMax"];
  if (!(v8 | v9)) {
    return a3;
  }
  id v10 = (void *)v9;
  if (!v8)
  {
    double v12 = 0.0;
    if (v9) {
      goto LABEL_5;
    }
LABEL_8:
    double v14 = 1.0;
    return v12 + (v14 - v12) * a3;
  }

  [(id)v8 floatValue];
  double v12 = v11;
  if (!v10) {
    goto LABEL_8;
  }
LABEL_5:
  [v10 floatValue];
  double v14 = v13;
  return v12 + (v14 - v12) * a3;
}

+ (CGPoint)scaledFilterPresetPointValue:(CGPoint)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  CGFloat y = a3.y;
  double x = a3.x;
  if (a6)
  {
    id v9 = objc_msgSend( +[MPFilterManager sharedManager](MPFilterManager, "sharedManager"),  "animationsForFilterID:andPresetID:",  a5,  a6);
    id v10 = (NSString *)[v9 objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"boxMin %@", a4)];
    id v11 = [v9 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"boxMax %@", a4)];
    if ((unint64_t)v10 | (unint64_t)v11)
    {
      double v12 = (NSString *)v11;
      if (v10)
      {
        *(void *)&double v13 = *(_OWORD *)&CGPointFromString(v10);
        if (v12)
        {
LABEL_5:
          *(void *)&double v14 = *(_OWORD *)&CGPointFromString(v12);
LABEL_8:
          double x = v13 + (v14 - v13) * x;
          CGFloat y = x;
          goto LABEL_9;
        }
      }

      else
      {
        double v13 = 0.0;
        if (v11) {
          goto LABEL_5;
        }
      }

      double v14 = 1.0;
      goto LABEL_8;
    }
  }

+ ($421962E1114BB55FD51FACB03C2AC210)scaledFilterPresetVectorValue:(SEL)a3 withKey:(id *)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  if (a7)
  {
    id v10 = objc_msgSend( +[MPFilterManager sharedManager](MPFilterManager, "sharedManager"),  "animationsForFilterID:andPresetID:",  a6,  a7);
    unint64_t v11 = (unint64_t)[v10 objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"boxMin %@", a5)];
    CGPoint result = ($421962E1114BB55FD51FACB03C2AC210 *)[v10 objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"boxMax %@", a5)];
    if (v11 | (unint64_t)result)
    {
      double v12 = result;
      uint64_t var0 = a4->var0;
      double v14 = +[MPVector vectorFromString:](&OBJC_CLASS___MPVector, "vectorFromString:", @"0. 0. 0. 0.");
      CGPoint result = +[MPVector vectorFromString:](&OBJC_CLASS___MPVector, "vectorFromString:", @"0. 0. 0. 0.");
      double v15 = result;
      if (v11)
      {
        CGPoint result = +[MPVector vectorFromString:](&OBJC_CLASS___MPVector, "vectorFromString:", v11);
        double v14 = result;
      }

      if (v12)
      {
        CGPoint result = +[MPVector vectorFromString:](&OBJC_CLASS___MPVector, "vectorFromString:", v12);
        double v15 = result;
      }

      if ((_DWORD)var0)
      {
        uint64_t v16 = 0LL;
        var1 = a4->var1;
        do
        {
          -[$421962E1114BB55FD51FACB03C2AC210 valueAtIndex:](v15, "valueAtIndex:", v16);
          double v19 = v18;
          -[$421962E1114BB55FD51FACB03C2AC210 valueAtIndex:](v14, "valueAtIndex:", v16);
          double v21 = v19 - v20;
          double v22 = var1[v16];
          CGPoint result = ($421962E1114BB55FD51FACB03C2AC210 *)-[$421962E1114BB55FD51FACB03C2AC210 valueAtIndex:]( v14,  "valueAtIndex:",  v16);
          *(float *)&double v23 = v23 + v21 * v22;
          var1[v16++] = *(float *)&v23;
        }

        while (var0 != v16);
      }
    }
  }

  *(_OWORD *)&retstr->uint64_t var0 = *(_OWORD *)&a4->var0;
  retstr->var1[3] = a4->var1[3];
  return result;
}

+ (id)defaultAttributesForMPFilter:(id)a3
{
  return 0LL;
}

+ (id)defaultAttributesForMPTransition:(id)a3
{
  return 0LL;
}

+ (id)attributesFormMPFilter:(id)a3 atTime:(double)a4
{
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v6,  "addEntriesFromDictionary:",  objc_msgSend( +[MPFilterManager sharedManager](MPFilterManager, "sharedManager"),  "attributesForFilterID:andPresetID:",  objc_msgSend(a3, "filterID"),  objc_msgSend(a3, "presetID")));
  objc_msgSend( v6,  "addEntriesFromDictionary:",  +[MPUtilities attributesFromAnimationPathsInFilter:atTime:]( MPUtilities,  "attributesFromAnimationPathsInFilter:atTime:",  a3,  a4));
  return v6;
}

+ (id)attributesFromAnimationPathsInFilter:(id)a3 atTime:(double)a4
{
  id v6 = +[MPUtilities defaultAttributesForMPFilter:](&OBJC_CLASS___MPUtilities, "defaultAttributesForMPFilter:");
  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  unint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  +[MPUtilities animationsPathsFromFilterID:andPresetID:]( MPUtilities,  "animationsPathsFromFilterID:andPresetID:",  [a3 filterID],  objc_msgSend(a3, "presetID")));
  -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", [a3 animationPaths]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v14 = -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v13);
        if (v14)
        {
          id v15 = v14;
          id v16 = [v14 orderedKeyframes];
          id v17 = [v16 lastObject];
          if (objc_msgSend( v17,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframe1D, v18)))
          {
            objc_msgSend(objc_msgSend(v6, "objectForKey:", v13), "floatValue");
            +[MPUtilities computeScalarValueForAnimationPath:atTime:defaultsTo:context:]( &OBJC_CLASS___MPUtilities,  "computeScalarValueForAnimationPath:atTime:defaultsTo:context:",  v15,  0LL,  a4,  v19);
            *(float *)&double v20 = v20;
            double v21 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20);
          }

          else
          {
            id v22 = [v16 lastObject];
            if (objc_msgSend( v22,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframe2D, v23)))
            {
              CGPoint v24 = CGPointFromString((NSString *)[v6 objectForKey:v13]);
              +[MPUtilities computePointValueForAnimationPath:atTime:defaultsTo:]( &OBJC_CLASS___MPUtilities,  "computePointValueForAnimationPath:atTime:defaultsTo:",  v15,  a4,  v24.x,  v24.y);
              double v21 = (NSNumber *)NSStringFromCGPoint(v33);
            }

            else
            {
              id v25 = [v16 lastObject];
              if (!objc_msgSend( v25,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframeVector, v26))) {
                continue;
              }
              double v21 = (NSNumber *)objc_msgSend( +[MPUtilities computeVectorValueForAnimationPath:atTime:defaultsTo:]( MPUtilities,  "computeVectorValueForAnimationPath:atTime:defaultsTo:",  v15,  +[MPVector vectorFromString:]( MPVector,  "vectorFromString:",  objc_msgSend(v6, "objectForKey:", v13)),  a4),  "CIColorString");
            }
          }

          [v7 setValue:v21 forKey:v13];
        }
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    }

    while (v10);
  }

  return v7;
}

+ (id)animationsPathsFromFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = +[MPFilterManager sharedManager](&OBJC_CLASS___MPFilterManager, "sharedManager");
  id v45 = a3;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v6 animationsForFilterID:v7 andPresetID:a4];
  id v42 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v43 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v53;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void *)(*((void *)&v52 + 1) + 8 * v10);
        id v12 = +[MPAnimationPath animationPath](&OBJC_CLASS___MPAnimationPath, "animationPath", v41);
        [v42 setObject:v12 forKey:v11];
        id v13 = [v9 objectForKey:v11];
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
        uint64_t v44 = v10;
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
          id v13 = objc_msgSend( +[MPAnimationManager sharedManager](MPAnimationManager, "sharedManager"),  "animationDescriptionForAnimationID:",  v13);
        }
        id v16 = (char *)objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "count");
        id v17 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", 0);
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v18);
        char isKindOfClass = objc_opt_isKindOfClass(v17, v19);
        if ([v13 objectForKey:@"valueType"]
          && !objc_msgSend( objc_msgSend(v13, "objectForKey:", @"valueType"),  "isEqualToString:",  @"scalar"))
        {
          if (objc_msgSend( objc_msgSend(v13, "objectForKey:", @"valueType"),  "isEqualToString:",  @"2DPath"))
          {
            if ((uint64_t)v16 >= 1)
            {
              for (i = 0LL; i != v16; ++i)
              {
                objc_msgSend( objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", i),  "CGPointValue");
                +[MPUtilities scaledFilterPresetPointValue:withKey:forFilterID:andPresetID:]( &OBJC_CLASS___MPUtilities,  "scaledFilterPresetPointValue:withKey:forFilterID:andPresetID:",  v11,  v45,  v8);
                double v31 = v30;
                double v33 = v32;
                id v34 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", i);
                if ((isKindOfClass & 1) != 0) {
                  id v34 = [v34 objectForKey:@"timeOffset"];
                }
                [v34 doubleValue];
                objc_msgSend( v12,  "createKeyframeWithPoint:atTime:offsetType:",  +[MPUtilities timeOffSetFromString:]( MPUtilities,  "timeOffSetFromString:",  objc_msgSend(v13, "objectForKey:", @"timeOffsetKind")),  v31,  v33,  v35);
              }
            }
          }

          else if (objc_msgSend( objc_msgSend(v13, "objectForKey:", @"valueType"),  "isEqualToString:",  @"vector") {
                 && (uint64_t)v16 >= 1)
          }
          {
            for (j = 0LL; j != v16; ++j)
            {
              MCStringToVector( objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", j),  (uint64_t)&v50);
              __int128 v46 = v50;
              int v47 = v51;
              +[MPUtilities scaledFilterPresetVectorValue:withKey:forFilterID:andPresetID:]( &OBJC_CLASS___MPUtilities,  "scaledFilterPresetVectorValue:withKey:forFilterID:andPresetID:",  &v46,  v11,  v45,  v8);
              id v37 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", j);
              if ((isKindOfClass & 1) != 0) {
                id v37 = [v37 objectForKey:@"timeOffset"];
              }
              [v37 doubleValue];
              __int128 v46 = v48;
              int v47 = v49;
              objc_msgSend( v12,  "createKeyframeWithVector:atTime:offsetType:",  +[MPVector vectorFromMCVector:](MPVector, "vectorFromMCVector:", &v46),  +[MPUtilities timeOffSetFromString:]( MPUtilities,  "timeOffSetFromString:",  objc_msgSend(v13, "objectForKey:", @"timeOffsetKind")),  v38);
            }
          }
        }

        else if ((uint64_t)v16 >= 1)
        {
          double v21 = 0LL;
          id v22 = 0LL;
          do
          {
            objc_msgSend( objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", v21),  "floatValue");
            +[MPUtilities scaledFilterPresetScalarValue:withKey:forFilterID:andPresetID:]( &OBJC_CLASS___MPUtilities,  "scaledFilterPresetScalarValue:withKey:forFilterID:andPresetID:",  v11,  v45,  v8,  v23);
            double v25 = v24;
            id v26 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", v21);
            if ((isKindOfClass & 1) != 0)
            {
              id v22 = [v26 objectForKey:@"timeOffsetKind"];
              id v26 = objc_msgSend( objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", v21),  "objectForKey:",  @"timeOffset");
            }

            float v27 = v25;
            [v26 doubleValue];
            objc_msgSend( v12,  "createKeyframeWithScalar:atTime:offsetType:",  +[MPUtilities timeOffSetFromString:](MPUtilities, "timeOffSetFromString:", v22),  v27,  v28);
            ++v21;
          }

          while (v16 != v21);
        }

        uint64_t v10 = v44 + 1;
      }

      while ((id)(v44 + 1) != v43);
      id v39 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
      id v43 = v39;
    }

    while (v39);
  }

  return v42;
}

+ (void)syncAnimationPaths:(id)a3
{
  id v38 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id obj = a3;
  id v44 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v37 = [a3 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v60;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v60 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v4;
        v5 = *(void **)(*((void *)&v59 + 1) + 8 * v4);
        id v45 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v6 = v5;
        id v41 = [v5 keyframes];
        id v7 = [v41 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v56;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v56 != v9) {
                objc_enumerationMutation(v41);
              }
              uint64_t v11 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
              [v11 time];
              id v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
              [v6 relativeTimeForKeyframe:v11];
              id v13 = +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  @"origTime",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"relTime",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[v11 offsetType]),  @"offsetType",  0);
              [v45 addObject:v13];
              [v44 addObject:v13];
            }

            id v8 = [v41 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }

          while (v8);
        }

        [v38 addObject:v45];
        uint64_t v4 = v39 + 1;
      }

      while ((id)(v39 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }

    while (v37);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v42 = [v38 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v42)
  {
    uint64_t v14 = 0LL;
    uint64_t v40 = *(void *)v52;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v46 = v15;
        id v16 = +[NSMutableSet setWithArray:]( &OBJC_CLASS___NSMutableSet,  "setWithArray:",  *(void *)(*((void *)&v51 + 1) + 8 * v15));
        id v17 = +[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v44);
        -[NSMutableSet minusSet:](v17, "minusSet:", v16);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v47,  v63,  16LL);
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v48;
          do
          {
            for (j = 0LL; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v48 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
              objc_msgSend(objc_msgSend(v22, "objectForKey:", @"relTime"), "doubleValue");
              double v24 = v23;
              objc_msgSend(objc_msgSend(v22, "objectForKey:", @"relTime"), "doubleValue");
              double v26 = v25;
              uint64_t v27 = (int)objc_msgSend(objc_msgSend(v22, "objectForKey:", @"offsetType"), "intValue");
              id v28 = [obj objectAtIndex:v14];
              id v29 = objc_msgSend(objc_msgSend(v28, "orderedKeyframes"), "lastObject");
              if (objc_msgSend( v29,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframe1D, v30)))
              {
                [v29 scalar];
                +[MPUtilities computeScalarValueForAnimationPath:atTime:defaultsTo:context:]( &OBJC_CLASS___MPUtilities,  "computeScalarValueForAnimationPath:atTime:defaultsTo:context:",  v28,  0LL,  v24,  v32);
                objc_msgSend(v28, "createKeyframeWithScalar:atTime:offsetType:", v27);
              }

              else if (objc_msgSend( v29,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframe2D, v31)))
              {
                [v29 point];
                +[MPUtilities computePointValueForAnimationPath:atTime:defaultsTo:]( &OBJC_CLASS___MPUtilities,  "computePointValueForAnimationPath:atTime:defaultsTo:",  v28,  v24,  v34,  v35);
                objc_msgSend(v28, "createKeyframeWithPoint:atTime:offsetType:", v27);
              }

              else if (objc_msgSend( v29,  "isMemberOfClass:",  objc_opt_class(MPAnimationKeyframeVector, v33)))
              {
                objc_msgSend( v28,  "createKeyframeWithVector:atTime:offsetType:",  +[MPUtilities computeVectorValueForAnimationPath:atTime:defaultsTo:]( MPUtilities,  "computeVectorValueForAnimationPath:atTime:defaultsTo:",  v28,  objc_msgSend(v29, "vector"),  v24),  v27,  v26);
              }
            }

            id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v47,  v63,  16LL);
          }

          while (v19);
        }

        ++v14;
        uint64_t v15 = v46 + 1;
      }

      while ((id)(v46 + 1) != v42);
      id v42 = [v38 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }

    while (v42);
  }

+ (id)effectContainersForTime:(double)a3 inDocument:(id)a4
{
  id v6 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = [a4 layers];
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        [v12 timeIn];
        double v14 = v13;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v15 = objc_msgSend(v12, "effectContainers", 0);
        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
              if (v14 <= a3)
              {
                [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) duration];
                if (v14 + v21 >= a3) {
                  [v6 addObject:v20];
                }
              }

              [v20 duration];
              double v23 = v22;
              [v20 outroTransitionDuration];
              double v14 = v14 + v23 - v24;
            }

            id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }

          while (v17);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v9);
  }

  return v6;
}

+ (id)textForIndex:(int64_t)a3 inMCContainerWithObjectID:(id)a4 inDocument:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a5, "montage"), "containerForObjectID:", a4);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCContainerEffect, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0
    && (id v10 = +[MPUtilities effectForMCContainerEffect:inDocument:]( MPUtilities,  "effectForMCContainerEffect:inDocument:",  v7,  a5),  (unint64_t)objc_msgSend(objc_msgSend(v10, "texts"), "count") > a3))
  {
    return objc_msgSend(objc_msgSend(v10, "texts"), "objectAtIndex:", a3);
  }

  else
  {
    return 0LL;
  }

+ (id)effectForMCContainerWithObjectID:(id)a3 inDocument:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "montage"), "containerForObjectID:", a3);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCContainerEffect, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    return +[MPUtilities effectForMCContainerEffect:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectForMCContainerEffect:inDocument:",  v5,  a4);
  }
  else {
    return 0LL;
  }
}

+ (id)effectForMCContainerEffect:(id)a3 inDocument:(id)a4
{
  id result = objc_msgSend(a1, "createPlugPathToContainer:inDocument:");
  if (!result) {
    return result;
  }
  id v7 = result;
  id result = [result count];
  if (!result) {
    return result;
  }
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id result = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!result) {
    return result;
  }
  id v8 = result;
  uint64_t v9 = *(void *)v51;
  id v40 = a3;
  id v41 = v7;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v51 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
      HasPrefidouble x = NSStringHasPrefix(v11, "SI_");
      if (!HasPrefix
        && (([a4 conformsToProtocol:&OBJC_PROTOCOL___MPManualLayerSupport] & 1) != 0
         || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPDocument, v14), (objc_opt_isKindOfClass(a4, v15) & 1) != 0)))
      {
        id v17 = objc_msgSend(a4, "layerForKey:", v11, v40);
        if (!v17)
        {
          if (([a4 conformsToProtocol:&OBJC_PROTOCOL___MPAutomaticLayerSupport] & 1) == 0
            && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPDocument, v18), (objc_opt_isKindOfClass(a4, v19) & 1) == 0)
            || (id v20 = [a4 layers],
                __int128 v46 = 0u,
                __int128 v47 = 0u,
                __int128 v48 = 0u,
                __int128 v49 = 0u,
                (id v21 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16]) == 0))
          {
            id v17 = 0LL;
            goto LABEL_44;
          }

          id v22 = v21;
          uint64_t v23 = *(void *)v47;
LABEL_16:
          uint64_t v24 = 0LL;
          while (1)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(v20);
            }
            id v17 = *(id *)(*((void *)&v46 + 1) + 8 * v24);
            if (objc_msgSend( objc_msgSend(objc_msgSend(v17, "plug"), "idInSupercontainer"),  "isEqualToString:",  v11)) {
              break;
            }
            if (v22 == (id)++v24)
            {
              id v22 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
              id v17 = 0LL;
              id v7 = v41;
              if (v22) {
                goto LABEL_16;
              }
              goto LABEL_44;
            }
          }

+ (id)slideForSlide:(id)a3 inDocument:(id)a4
{
  id v5 = +[MPUtilities effectForMCContainerEffect:inDocument:]( MPUtilities,  "effectForMCContainerEffect:inDocument:",  [a3 container],  a4);
  if (v5 && (uint64_t v6 = v5, v7 = objc_msgSend(objc_msgSend(v5, "slides"), "count"), v7 > objc_msgSend(a3, "index"))) {
    return objc_msgSend(objc_msgSend(v6, "slides"), "objectAtIndex:", objc_msgSend(a3, "index"));
  }
  else {
    return 0LL;
  }
}

+ (id)slideForPath:(id)a3 inDocument:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "montage"), "videoAssetForFileAtPath:", a3);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  id v7 = [v5 slides];
  if (![v7 count]) {
    return 0LL;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    return 0LL;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v19;
LABEL_5:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v19 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
    id v13 = +[MPUtilities effectForMCContainerEffect:inDocument:]( MPUtilities,  "effectForMCContainerEffect:inDocument:",  [v12 container],  a4);
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = [v12 index];
      if (v15 < objc_msgSend(objc_msgSend(v14, "slides"), "count"))
      {
        id v16 = objc_msgSend(objc_msgSend(v14, "slides"), "objectAtIndex:", objc_msgSend(v12, "index"));
      }
    }

    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v16 = 0LL;
      if (v9) {
        goto LABEL_5;
      }
      return v16;
    }
  }

+ (id)textsDisplayedAtTime:(double)a3 inDocument:(id)a4
{
  id v5 = +[MPUtilities effectContainersForTime:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectContainersForTime:inDocument:",  a4);
  id v6 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v5;
  id v32 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        id v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
        [v8 startTime];
        double v10 = v9;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v11 = [v8 effects];
        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v12)
        {
          id v13 = v12;
          double v14 = a3 - v10;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v11);
              }
              id v17 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              id v18 = [v17 texts];
              id v19 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v19)
              {
                id v20 = v19;
                uint64_t v21 = *(void *)v35;
                do
                {
                  for (j = 0LL; j != v20; j = (char *)j + 1)
                  {
                    if (*(void *)v35 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
                    [v23 displayStartTime];
                    double v25 = v24;
                    [v23 displayDuration];
                    double v27 = v25 + v26;
                    if (v14 >= v25 && v14 <= v27) {
                      [v6 addObject:v23];
                    }
                  }

                  id v20 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }

                while (v20);
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }

          while (v13);
        }

        uint64_t v7 = v33 + 1;
      }

      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v32);
  }

  return v6;
}

+ (id)textForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5
{
  id v6 = +[MPUtilities effectForMCContainerEffect:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectForMCContainerEffect:inDocument:",  a4,  a5);
  id v7 = objc_msgSend( objc_msgSend( a3,  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet")),  "integerValue");
  if (v6
    && (unint64_t v8 = (unint64_t)v7, objc_msgSend(objc_msgSend(v6, "texts"), "count"))
    && v8 < (unint64_t)objc_msgSend(objc_msgSend(v6, "texts"), "count"))
  {
    return objc_msgSend(objc_msgSend(v6, "texts"), "objectAtIndex:", v8);
  }

  else
  {
    return 0LL;
  }

+ (id)slideForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5
{
  id v6 = +[MPUtilities effectForMCContainerEffect:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectForMCContainerEffect:inDocument:",  a4,  a5);
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = objc_msgSend( objc_msgSend( a3,  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet")),  "integerValue");
    if (objc_msgSend(objc_msgSend(v7, "slides"), "count") && v8 < objc_msgSend(objc_msgSend(v7, "slides"), "count"))
    {
      id v9 = [v7 slides];
      return [v9 objectAtIndex:v8];
    }

    if (objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
    {
      uint64_t v10 = (uint64_t)objc_msgSend(objc_msgSend(v7, "slides"), "count");
      if (objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
      {
        v8 -= v10;
        if (v8 < objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
        {
          id v9 = [v7 secondarySlides];
          return [v9 objectAtIndex:v8];
        }
      }
    }
  }

  return 0LL;
}

+ (id)layerForContainer:(id)a3 inDocument:(id)a4
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "layers", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(objc_msgSend(v10, "plug"), "container") == a3) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

+ (id)idOfCombinedID:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"/"];
  if ([v4 count]) {
    return [v4 objectAtIndex:0];
  }
  else {
    return a3;
  }
}

+ (id)presetIDOfCombinedID:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  else {
    return [v3 objectAtIndex:1];
  }
}

+ (id)placesPinLabelForSlideAssetPath:(id)a3 inDocument:(id)a4
{
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v5 = [a4 layers];
  id result = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v52;
    uint64_t v29 = *(void *)v52;
    id v30 = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v11 = objc_msgSend(v10, "effectContainers", v29, v30);
        id v12 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v48;
          uint64_t v31 = i;
          id v32 = v7;
          uint64_t v33 = *(void *)v48;
          id v34 = v11;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              id obj = [v16 effects];
              id v17 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v38 = *(void *)v44;
                id v35 = v13;
                do
                {
                  for (k = 0LL; k != v18; k = (char *)k + 1)
                  {
                    if (*(void *)v44 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    id v20 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)k);
                    if (objc_msgSend(objc_msgSend(v20, "effectID"), "isEqualToString:", @"PinMap"))
                    {
                      id v22 = objc_msgSend( objc_msgSend(v20, "effectAttributeForKey:", @"pinInformation"),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  NSRangeFromString((NSString *)objc_msgSend( v20,  "effectAttributeForKey:",  @"pinRange")).location,  v21));
                      __int128 v39 = 0u;
                      __int128 v40 = 0u;
                      __int128 v41 = 0u;
                      __int128 v42 = 0u;
                      uint64_t v23 = (char *)[v22 countByEnumeratingWithState:&v39 objects:v55 count:16];
                      if (v23)
                      {
                        double v24 = v23;
                        double v25 = 0LL;
                        uint64_t v26 = *(void *)v40;
                        while (2)
                        {
                          double v27 = 0LL;
                          __int128 v36 = &v24[(void)v25];
                          do
                          {
                            if (*(void *)v40 != v26) {
                              objc_enumerationMutation(v22);
                            }
                            id v28 = objc_msgSend( objc_msgSend( *(id *)(*((void *)&v39 + 1) + 8 * (void)v27),  "objectForKey:",  @"photos"),  "indexOfObject:",  a3);
                            if (v28 != (id)0x7FFFFFFFFFFFFFFFLL)
                            {
                              if (v28) {
                                return 0LL;
                              }
                              else {
                                return objc_msgSend(objc_msgSend(v20, "texts"), "objectAtIndex:", &v27[(void)v25 + 1]);
                              }
                            }

                            ++v27;
                          }

                          while (v24 != v27);
                          double v24 = (char *)[v22 countByEnumeratingWithState:&v39 objects:v55 count:16];
                          double v25 = v36;
                          if (v24) {
                            continue;
                          }
                          break;
                        }
                      }
                    }
                  }

                  id v18 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
                  uint64_t v14 = v33;
                  id v11 = v34;
                  id v13 = v35;
                }

                while (v18);
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
            uint64_t v8 = v29;
            id v5 = v30;
            i = v31;
            id v7 = v32;
          }

          while (v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
      id result = 0LL;
    }

    while (v7);
  }

  return result;
}

+ (double)aspectRatioOfLayerable:(id)a3 relativeToAspectRatio:(double)a4
{
  id v6 = objc_msgSend( +[MPUtilities parentsOfObject:](MPUtilities, "parentsOfObject:"),  "reverseObjectEnumerator");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPDocument, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
        {
          id v14 = [v12 parent];
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPNavigator, v15);
          if ((objc_opt_isKindOfClass(v14, v16) & 1) == 0)
          {
            [v12 size];
            a4 = a4 * (v17 / v18);
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }

  [a3 size];
  return a4 * (v19 / v20);
}

+ (double)displayTimeForText:(id)a3
{
  id v4 = [a3 parentEffect];
  if (!v4) {
    return 0.0;
  }
  id v5 = v4;
  id v6 = [v4 parentDocument];
  if (v5 == [v6 titleEffect])
  {
    id v10 = [v5 effectID];
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultPosterFrameTimeForEffectID:andPresetID:",  v10,  objc_msgSend(v5, "presetID"));
    double v8 = v11;
    if ((objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "posterTimeIsStaticForEffectID:andPresetID:",  v10,  objc_msgSend(v5, "presetID")) & 1) == 0)
    {
      id v12 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
      id v13 = [v5 formattedAttributes];
      id v14 = [v5 effectID];
      id v15 = [v5 slides];
      id v16 = [v5 texts];
      [v6 aspectRatio];
      id v17 = objc_msgSend( v12,  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  v14,  v13,  v15,  v16);
      if (v17)
      {
        double v18 = v17;
        [v5 fullDuration];
        double v20 = v19;
        [v18 mainDuration];
        double v22 = v21;
        [v18 phaseInDuration];
        double v24 = v22 + v23;
        [v18 phaseOutDuration];
        double v26 = v20 / (v24 + v25);
      }

      else
      {
        [v12 defaultMainDurationForEffectID:v10];
        double v57 = v56;
        [v12 defaultPhaseInDurationForEffectID:v10];
        double v59 = v58;
        [v12 defaultPhaseOutDurationForEffectID:v10];
        double v61 = v60;
        [v5 fullDuration];
        double v26 = v62 / (v57 + v59 + v61);
      }

      double v8 = v8 * v26;
    }

    goto LABEL_19;
  }

  [a3 displayTime];
  if (v7 != 0.0)
  {
    double v8 = v7;
LABEL_19:
    objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
    return v8 + v63;
  }

  id v27 = [v5 effectID];
  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultPosterFrameTimeForEffectID:andPresetID:",  v27,  objc_msgSend(v5, "presetID"));
  double v29 = v28;
  id v30 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
  id v31 = [v5 formattedAttributes];
  id v32 = [v5 effectID];
  id v33 = [v5 slides];
  id v34 = [v5 texts];
  [v6 aspectRatio];
  id v35 = objc_msgSend( v30,  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  v32,  v31,  v33,  v34);
  if (v35)
  {
    __int128 v36 = v35;
    [v5 fullDuration];
    double v38 = v37;
    [v36 mainDuration];
    double v40 = v39;
    [v36 phaseInDuration];
    double v42 = v40 + v41;
    [v36 phaseOutDuration];
    double v44 = v38 / (v42 + v43);
  }

  else
  {
    [v30 defaultMainDurationForEffectID:v27];
    double v46 = v45;
    [v30 defaultPhaseInDurationForEffectID:v27];
    double v48 = v47;
    [v30 defaultPhaseOutDurationForEffectID:v27];
    double v50 = v49;
    [v5 fullDuration];
    double v44 = v51 / (v46 + v48 + v50);
  }

  double v52 = v29 * v44;
  objc_msgSend(objc_msgSend(v5, "parentContainer"), "introTransitionDuration");
  if (v52 < v53) {
    double v52 = v53;
  }
  objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
  double v55 = v54 + v52;
  [v6 videoDuration];
  if (v55 < result) {
    return v55;
  }
  return result;
}

+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5
{
  if (!a3) {
    return 0LL;
  }
  id v7 = [a3 componentsSeparatedByString:@","];
  id v8 = objc_msgSend( objc_msgSend(v7, "objectAtIndex:", 0),  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v9 = objc_msgSend( objc_msgSend(v7, "objectAtIndex:", 1),  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v10 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v8,  0LL);
  double v11 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v9,  0LL);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(a5);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v17 = [a5 objectForKey:v16];
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
        {
          double v21 = (objc_class *)objc_opt_class(v17, v20);
          if (!-[NSString isEqualToString:](NSStringFromClass(v21), "isEqualToString:", @"NSCFBoolean")) {
            continue;
          }
        }

        [v17 doubleValue];
        *(float *)&double v22 = v22;
        -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v16, v22);
        [v17 doubleValue];
        *(float *)&double v23 = v23;
        -[MUMathExpressionFloatBased setValue:forVariable:](v11, "setValue:forVariable:", v16, v23);
      }

      id v13 = [a5 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v13);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v24 = [a4 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(a4);
        }
        uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)j);
        id v29 = [a4 objectForKey:v28];
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v30);
        if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0)
        {
          [v29 doubleValue];
          *(float *)&double v32 = v32;
          -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v28, v32);
          [v29 doubleValue];
          *(float *)&double v33 = v33;
          -[MUMathExpressionFloatBased setValue:forVariable:](v11, "setValue:forVariable:", v28, v33);
        }
      }

      id v25 = [a4 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v25);
  }

  -[MUMathExpressionFloatBased evaluate](v10, "evaluate");
  CGFloat v35 = v34;
  -[MUMathExpressionFloatBased evaluate](v11, "evaluate");
  CGFloat v37 = v36;

  v49.width = v35;
  v49.height = v37;
  return NSStringFromCGSize(v49);
}

+ (id)stringWithNewUUID
{
  v2 = CFUUIDCreate(0LL);
  CFStringRef v3 = CFUUIDCreateString(0LL, v2);
  id v4 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3);
  CFRelease(v3);
  CFRelease(v2);
  return v4;
}

+ (CGColor)CGColorFromString:(id)a3
{
  CGRect components = CGRectFromString((NSString *)a3);
  CFStringRef v3 = +[MPUtilities newColorSpaceForDevice](&OBJC_CLASS___MPUtilities, "newColorSpaceForDevice");
  id v4 = CGColorCreate(v3, &components.origin.x);
  CGColorSpaceRelease(v3);
  return v4;
}

+ (id)stringFromCGColor:(CGColor *)a3
{
  if (!a3) {
    return 0LL;
  }
  CGRect v4 = *(CGRect *)CGColorGetComponents(a3);
  return NSStringFromCGRect(v4);
}

+ (CGColor)CGColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  id v6 = +[MPUtilities newColorSpaceForDevice](&OBJC_CLASS___MPUtilities, "newColorSpaceForDevice");
  id v7 = CGColorCreate(v6, components);
  CGColorSpaceRelease(v6);
  return v7;
}

+ (CGColor)blackCGColor
{
  v2 = +[MPUtilities newColorSpaceForDevice]( &OBJC_CLASS___MPUtilities,  "newColorSpaceForDevice",  0LL,  0LL,  0LL,  unk_1FBCA0);
  CFStringRef v3 = CGColorCreate(v2, (const CGFloat *)&v5);
  CGColorSpaceRelease(v2);
  return v3;
}

+ (id)createPlugPathToContainer:(id)a3 inDocument:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = [a4 montage];
  id v8 = [a3 referencingPlug];
  if (!v8) {
    return 0LL;
  }
  for (id i = v8; i != [v7 rootPlug]; id i = objc_msgSend( objc_msgSend(i, "supercontainer"),  "referencingPlug"))
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v10);
    if ((objc_opt_isKindOfClass(i, v11) & 1) != 0)
    {
      id v13 = NSStringWithInteger("SI_", (unint64_t)[i index]);
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v12);
      if ((objc_opt_isKindOfClass(i, v14) & 1) == 0)
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___MCPlugHaven, v15);
        if ((objc_opt_isKindOfClass(i, v16) & 1) == 0) {
          return 0LL;
        }
      }

      id v13 = (NSString *)[i idInSupercontainer];
    }

    [v6 insertObject:v13 atIndex:0];
  }

  return v6;
}

+ (id)createPlugPathToObject:(id)a3 inDocument:(id)a4
{
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = [a4 montage];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v8);
  if ((objc_opt_isKindOfClass(a3, v9) & 1) == 0)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPLayer, v10);
    if ((objc_opt_isKindOfClass(a3, v11) & 1) == 0)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v12);
      if ((objc_opt_isKindOfClass(a3, v13) & 1) == 0)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPEffect, v14);
        if ((objc_opt_isKindOfClass(a3, v15) & 1) == 0) {
          return 0LL;
        }
        if (![a3 plug]) {
          a3 = [a3 parentContainer];
        }
      }
    }
  }

  id v16 = [a3 plug];
  if (!v16) {
    return 0LL;
  }
  id v17 = v16;
  while (v17 != [v7 rootPlug])
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      double v21 = NSStringWithInteger("SI_", (unint64_t)[v17 index]);
    }

    else
    {
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v20);
      if ((objc_opt_isKindOfClass(v17, v22) & 1) == 0)
      {
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___MCPlugHaven, v23);
        if ((objc_opt_isKindOfClass(v17, v24) & 1) == 0)
        {
          NSLog(@"Hmmmm what to do? Can't create a plug path.");
          continue;
        }
      }

      double v21 = (NSString *)[v17 idInSupercontainer];
    }

    [v6 insertObject:v21 atIndex:0];
    id v17 = objc_msgSend(objc_msgSend(v17, "supercontainer"), "referencingPlug");
  }

  return v6;
}

+ (BOOL)pathIsRelative:(id)a3
{
  return [a3 characterAtIndex:0] != 47;
}

+ (id)createMCAction:(id)a3 forPlug:(id)a4 withKey:(id)a5
{
  id v8 = [a3 targetObject];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPTransitionAction, v9);
  if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0)
  {
    uint64_t v12 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  [v8 objectID],  objc_msgSend(a3, "transitionID"));
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPAnimationTrigger, v11);
    if ((objc_opt_isKindOfClass(a3, v13) & 1) != 0)
    {
      uint64_t v12 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:withAnimationKey:]( MCAnimationTrigger,  "animationTriggerForTargetPlugObjectID:withAnimationKey:",  [v8 objectID],  objc_msgSend(a3, "animationKey"));
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPActionTrigger, v14);
      if ((objc_opt_isKindOfClass(a3, v15) & 1) != 0)
      {
        uint64_t v12 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:]( MCActionTrigger,  "actionTriggerForTargetPlugObjectID:withActionKey:",  [v8 objectID],  objc_msgSend(a3, "actionKey"));
      }

      else
      {
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPStateOperation, v16);
        if ((objc_opt_isKindOfClass(a3, v17) & 1) != 0)
        {
          uint64_t v12 = +[MCStateOperationExpression stateOperationForTargetPlugObjectID:withStateKey:andExpression:]( MCStateOperationExpression,  "stateOperationForTargetPlugObjectID:withStateKey:andExpression:",  [v8 objectID],  objc_msgSend(a3, "stateKey"),  objc_msgSend(a3, "operation"));
        }

        else
        {
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPConditionalAction, v18);
          if ((objc_opt_isKindOfClass(a3, v19) & 1) != 0)
          {
            uint64_t v12 = +[MCConditionalAction conditionalActionWithPredicate:]( &OBJC_CLASS___MCConditionalAction,  "conditionalActionWithPredicate:",  0LL);
          }

          else
          {
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___MPActionGroup, v20);
            if ((objc_opt_isKindOfClass(a3, v21) & 1) != 0)
            {
              uint64_t v12 = +[MCActionGroup actionGroup](&OBJC_CLASS___MCActionGroup, "actionGroup");
            }

            else
            {
              uint64_t v23 = objc_opt_class(&OBJC_CLASS___MPGenericAction, v22);
              if ((objc_opt_isKindOfClass(a3, v23) & 1) == 0)
              {
                uint64_t v24 = 0LL;
                goto LABEL_16;
              }

              uint64_t v12 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:]( MCGenericAction,  "genericActionForTargetPlugObjectID:withAttributes:",  [v8 objectID],  objc_msgSend(a3, "attributes"));
            }
          }
        }
      }
    }
  }

  uint64_t v24 = v12;
LABEL_16:
  [a4 setAction:v24 forKey:a5];
  return v24;
}

+ (void)collectAllActionableLayers:(id)a3 inDictionary:(id)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          objc_msgSend(a4, "setObject:forKey:", v11, objc_msgSend(v11, "uuid"));
          id v14 = [v11 keyedLayers];
        }

        else
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPNavigator, v13);
          char isKindOfClass = objc_opt_isKindOfClass(v11, v15);
          objc_msgSend(a4, "setObject:forKey:", v11, objc_msgSend(v11, "uuid"));
          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          id v14 = [v11 layers];
        }

        +[MPUtilities collectAllActionableLayers:inDictionary:]( MPUtilities,  "collectAllActionableLayers:inDictionary:",  [v14 allValues],  a4);
      }

      id v8 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

+ (id)createPlugInContainer:(id)a3 forLayer:(id)a4 key:(id)a5 inDocument:(id)a6
{
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, a2);
  if ((objc_opt_isKindOfClass(a4, v10) & 1) != 0)
  {
    id v12 = objc_msgSend(objc_msgSend(a6, "montage"), "createSerializerContainer");
    id v13 = [a3 setPlugForContainer:v12 forID:a5];
    objc_msgSend(a4, "setMontage:", objc_msgSend(a6, "montage"));
    [a4 setPlug:v13];
    [a4 setLayerSerializer:v12];
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v11);
    if ((objc_opt_isKindOfClass(a4, v14) & 1) != 0)
    {
      id v16 = objc_msgSend(objc_msgSend(a6, "montage"), "createEffectContainer");
      id v13 = [a3 setPlugForContainer:v16 forID:a5];
      objc_msgSend(a4, "setMontage:", objc_msgSend(a6, "montage"));
      [a4 setPlug:v13];
      [a4 setLayerEffect:v16];
    }

    else
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v15);
      if ((objc_opt_isKindOfClass(a4, v17) & 1) != 0)
      {
        id v19 = objc_msgSend(objc_msgSend(a6, "montage"), "createParallelizerContainer");
      }

      else
      {
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___MPNavigator, v18);
        if ((objc_opt_isKindOfClass(a4, v20) & 1) == 0) {
          return 0LL;
        }
        id v19 = objc_msgSend(objc_msgSend(a6, "montage"), "createNavigatorContainer");
      }

      id v21 = v19;
      id v13 = [a3 setPlugForContainer:v19 forID:a5];
      [a4 setContainer:v21];
      [a4 setPlug:v13];
    }
  }

  return v13;
}

+ (id)createPlugInSlide:(id)a3 forLayer:(id)a4 inDocument:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a5, "montage", a3), "createParallelizerContainer");
  id v8 = -[MCObject initFromScratchWithMontage:]( [MCPlugSlide alloc],  "initFromScratchWithMontage:",  [a5 montage]);
  [v8 setContainer:v7];
  [a4 setContainer:v7];
  [a4 setPlug:v8];
  return v8;
}

+ (id)parentsOfObject:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  while (a3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPDocument, v4);
    if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0) {
      return v5;
    }
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPEffect, v7);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0) {
      a3 = [a3 parentContainer];
    }
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v9);
    if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0)
    {
      id v12 = [a3 parentLayer];
    }

    else
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLayer, v11);
      if ((objc_opt_isKindOfClass(a3, v13) & 1) == 0)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v14);
        if ((objc_opt_isKindOfClass(a3, v15) & 1) == 0)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPNavigator, v16);
          if ((objc_opt_isKindOfClass(a3, v17) & 1) == 0) {
            goto LABEL_12;
          }
        }
      }

      id v12 = [a3 parent];
    }

    a3 = v12;
LABEL_12:
    [v5 addObject:a3];
  }

  return v5;
}

@end