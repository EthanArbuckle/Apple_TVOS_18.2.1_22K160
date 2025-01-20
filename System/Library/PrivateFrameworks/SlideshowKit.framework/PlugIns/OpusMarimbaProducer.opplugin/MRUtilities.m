@interface MRUtilities
+ (CGPoint)valueForPointAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(CGPoint)a6 previousKeyPoint:(CGPoint *)a7 nextKeyPoint:(CGPoint *)a8 animationIsOver:(BOOL *)a9;
+ (double)transformTime:(double)a3 forAnimationPath:(id)a4 withPlugTiming:(id)a5;
+ (double)valueForScalarAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(double)a6 previousKeyValue:(double *)a7 nextKeyValue:(double *)a8 animationIsOver:(BOOL *)a9;
+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5;
+ (int64_t)operatingSystemMajorVersion;
+ (int64_t)operatingSystemMinorVersion;
+ (int64_t)operationQueueConcurrentOperationCount;
+ (void)initialize;
@end

@implementation MRUtilities

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRUtilities;
  objc_msgSendSuper2(&v2, "initialize");
}

+ (double)valueForScalarAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(double)a6 previousKeyValue:(double *)a7 nextKeyValue:(double *)a8 animationIsOver:(BOOL *)a9
{
  double v16 = v15;
  if (a9) {
    *a9 = 1;
  }
  id v17 = [a3 orderedKeyframesWithPlugTiming:a4];
  v18 = (char *)[v17 count];
  if (!v18) {
    goto LABEL_15;
  }
  unint64_t v19 = (unint64_t)v18;
  if (v18 == (_BYTE *)&dword_0 + 1 || v16 <= 0.0)
  {
    if (a9) {
      *a9 = v18 == (_BYTE *)&dword_0 + 1;
    }
    id v24 = [v17 objectAtIndex:0];
    goto LABEL_14;
  }

  [a4 fullDuration];
  if (v16 >= v20)
  {
LABEL_10:
    id v24 = [v17 lastObject];
LABEL_14:
    [v24 value];
    a6 = v25;
LABEL_15:
    if (a8) {
      *a8 = a6;
    }
    if (a7) {
      *a7 = a6;
    }
    return a6;
  }

  unsigned int v21 = 0;
  unint64_t v22 = 1LL;
  while (1)
  {
    +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  [v17 objectAtIndex:v22],  a4);
    if (v16 <= v23) {
      break;
    }
    unint64_t v22 = v21 + 2;
    ++v21;
    if (v19 <= v22) {
      goto LABEL_10;
    }
  }

  if (a9) {
    *a9 = 0;
  }
  id v27 = [v17 objectAtIndex:v21];
  id v28 = [v17 objectAtIndex:v22];
  +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v27,  a4);
  double v30 = v29;
  +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v28,  a4);
  double v32 = (v16 - v30) / (v31 - v30);
  if (v16 - v30 > 0.0) {
    double v33 = v32;
  }
  else {
    double v33 = 0.0;
  }
  [v27 value];
  if (a7) {
    *a7 = v34;
  }
  [v28 value];
  if (a8) {
    *a8 = v35;
  }
  [v27 value];
  double v37 = v36;
  [v28 value];
  float v39 = v38;
  [v27 value];
  return v37 + (float)(v39 - v40) * v33;
}

+ (CGPoint)valueForPointAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(CGPoint)a6 previousKeyPoint:(CGPoint *)a7 nextKeyPoint:(CGPoint *)a8 animationIsOver:(BOOL *)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  objc_msgSend(a1, "transformTime:forAnimationPath:withPlugTiming:", a5);
  double v17 = v16;
  if (a7) {
    v18 = a7;
  }
  else {
    v18 = (CGPoint *)v57;
  }
  if (a8) {
    unint64_t v19 = a8;
  }
  else {
    unint64_t v19 = (CGPoint *)v57;
  }
  if (a9) {
    double v20 = a9;
  }
  else {
    double v20 = v57;
  }
  *double v20 = 1;
  id v21 = [a3 orderedKeyframesWithPlugTiming:a4];
  unint64_t v22 = (char *)[v21 count];
  if (!v22)
  {
    v19->CGFloat x = x;
    if (a8) {
      double v33 = a8;
    }
    else {
      double v33 = (CGPoint *)v57;
    }
    v33->CGFloat y = y;
    CGPoint *v18 = *v19;
    double v32 = v18->x;
    if (a7) {
      double v30 = a7;
    }
    else {
      double v30 = (CGPoint *)v57;
    }
LABEL_35:
    double v38 = v30->y;
    goto LABEL_42;
  }

  unint64_t v23 = (unint64_t)v22;
  if (v22 == (_BYTE *)&dword_0 + 1 || v17 <= 0.0)
  {
    *double v20 = v22 == (_BYTE *)&dword_0 + 1;
    id v34 = [v21 objectAtIndex:0];
    goto LABEL_29;
  }

  [a4 fullDuration];
  if (v17 >= v24)
  {
    id v34 = [v21 lastObject];
LABEL_29:
    [v34 point];
    v19->CGFloat x = v36;
    double v30 = (CGPoint *)v57;
    if (a8) {
      double v37 = a8;
    }
    else {
      double v37 = (CGPoint *)v57;
    }
    v37->CGFloat y = v35;
    CGPoint *v18 = *v19;
    double v32 = v18->x;
LABEL_33:
    if (a7) {
      double v30 = a7;
    }
    goto LABEL_35;
  }

  v56 = v19;
  unsigned int v25 = 0;
  unint64_t v26 = 1LL;
  while (1)
  {
    +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  objc_msgSend(v21, "objectAtIndex:", v26, v56),  a4);
    if (v17 <= v27) {
      break;
    }
    unint64_t v26 = v25 + 2;
    ++v25;
    if (v23 <= v26)
    {
      objc_msgSend(objc_msgSend(v21, "lastObject"), "point");
      v56->CGFloat x = v29;
      double v30 = (CGPoint *)v57;
      if (a8) {
        double v31 = a8;
      }
      else {
        double v31 = (CGPoint *)v57;
      }
      v31->CGFloat y = v28;
      CGPoint *v18 = *v56;
      double v32 = v18->x;
      goto LABEL_33;
    }
  }

  *double v20 = 0;
  id v39 = [v21 objectAtIndex:v25];
  id v40 = [v21 objectAtIndex:v26];
  [v39 point];
  double v42 = v41;
  double v44 = v43;
  [v40 point];
  double v46 = v45;
  double v48 = v47;
  +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v39,  a4);
  double v50 = v49;
  double v51 = v17 - v49;
  +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v40,  a4);
  double v53 = v51 / (v52 - v50);
  v18->CGFloat x = v42;
  v54 = (CGPoint *)v57;
  if (a7) {
    v55 = a7;
  }
  else {
    v55 = (CGPoint *)v57;
  }
  v55->CGFloat y = v44;
  v56->CGFloat x = v46;
  if (a8) {
    v54 = a8;
  }
  v54->CGFloat y = v48;
  double v32 = v42 + (v46 - v42) * v53;
  double v38 = v44 + (v48 - v44) * v53;
LABEL_42:
  result.CGFloat y = v38;
  result.CGFloat x = v32;
  return result;
}

+ (double)transformTime:(double)a3 forAnimationPath:(id)a4 withPlugTiming:(id)a5
{
  double v9 = v8;
  id v10 = [a4 orderedKeyframesWithPlugTiming:a5];
  id v11 = [v10 count];
  double result = 0.0;
  if (a3 > 0.0 && (unint64_t)v11 >= 2)
  {
    if (v9 <= a3)
    {
      return v9;
    }

    else
    {
      unint64_t v14 = (unint64_t)v11;
      unsigned int v15 = 0;
      unint64_t v16 = 1LL;
      while (1)
      {
        +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  objc_msgSend(v10, "objectAtIndex:", v16, result),  a5);
        if (result >= a3) {
          break;
        }
        unint64_t v16 = v15 + 2;
        ++v15;
        if (v14 <= v16) {
          return v9;
        }
      }

      id v17 = [v10 objectAtIndex:v15];
      id v18 = [v10 objectAtIndex:v16];
      +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v17,  a5);
      double v20 = v19;
      +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v18,  a5);
      double v22 = v21 - v20;
      double v23 = (a3 - v20) / (v21 - v20);
      [v17 postControl];
      double v25 = v24;
      [v18 preControl];
      return v20 + Spline1(v23, 0.0, v25, v26 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v22;
    }
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
  id v11 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v9,  0LL);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(a5);
        }
        uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
        id v17 = [a5 objectForKey:v16];
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
        {
          double v21 = (objc_class *)objc_opt_class(v17, v20);
          if (!-[NSString isEqualToString:](NSStringFromClass(v21), "isEqualToString:", @"NSCFBoolean")) {
            continue;
          }
        }

        [v17 floatValue];
        int v23 = v22;
        -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v16);
        LODWORD(v24) = v23;
        -[MUMathExpressionFloatBased setValue:forVariable:](v11, "setValue:forVariable:", v16, v24);
      }

      id v13 = [a5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v13);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v25 = [a4 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(a4);
        }
        uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)j);
        id v30 = [a4 objectForKey:v29];
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber, v31);
        if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0)
        {
          [v30 floatValue];
          -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v29);
          [v30 floatValue];
          -[MUMathExpressionFloatBased setValue:forVariable:](v11, "setValue:forVariable:", v29);
        }
      }

      id v26 = [a4 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v26);
  }

  -[MUMathExpressionFloatBased evaluate](v10, "evaluate");
  CGFloat v34 = v33;
  -[MUMathExpressionFloatBased evaluate](v11, "evaluate");
  CGFloat v36 = v35;

  v48.width = v34;
  v48.height = v36;
  return NSStringFromCGSize(v48);
}

+ (int64_t)operationQueueConcurrentOperationCount
{
  int64_t result = qword_2AD548;
  if (qword_2AD548 == -1)
  {
    int64_t result = -[NSProcessInfo processorCount]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "processorCount");
    qword_2AD548 = result;
  }

  return result;
}

+ (int64_t)operatingSystemMinorVersion
{
  *(void *)v6 = 0x200000001LL;
  sysctl(v6, 2u, 0LL, &__size, 0LL, 0LL);
  objc_super v2 = malloc(__size);
  sysctl(v6, 2u, v2, &__size, 0LL, 0LL);
  id v3 = objc_msgSend( -[NSArray objectAtIndex:]( -[NSString componentsSeparatedByString:]( +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2),  "componentsSeparatedByString:",  @"."),  "objectAtIndex:",  1),  "integerValue");
  free(v2);
  return (int64_t)v3;
}

+ (int64_t)operatingSystemMajorVersion
{
  *(void *)double v21 = 0x200000001LL;
  sysctl(v21, 2u, 0LL, &__size, 0LL, 0LL);
  objc_super v2 = malloc(__size);
  sysctl(v21, 2u, v2, &__size, 0LL, 0LL);
  id v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2);
  uint64_t v4 = 0LL;
  char v5 = 1;
  int64_t v6 = 6LL;
  while (1)
  {
    char v7 = v5;
    char v5 = 0;
    uint64_t v4 = 1LL;
    if ((v7 & 1) == 0) {
      goto LABEL_19;
    }
  }

  uint64_t v8 = 0LL;
  char v9 = 1;
  int64_t v6 = 7LL;
  while (1)
  {
    char v10 = v9;
    char v9 = 0;
    uint64_t v8 = 1LL;
    if ((v10 & 1) == 0) {
      goto LABEL_19;
    }
  }

  uint64_t v11 = 0LL;
  char v12 = 1;
  int64_t v6 = 8LL;
  while (1)
  {
    char v13 = v12;
    char v12 = 0;
    uint64_t v11 = 1LL;
    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
  }

  char v14 = 0;
  uint64_t v15 = 0LL;
  do
  {
    char v16 = v14;
    unsigned int v17 = -[NSString characterAtIndex:](v3, "characterAtIndex:", v15);
    int v18 = a13[v15];
    if (v17 != v18) {
      break;
    }
    char v14 = 1;
    uint64_t v15 = 1LL;
  }

  while ((v16 & 1) == 0);
  if (v17 == v18) {
    int64_t v6 = 9LL;
  }
  else {
    int64_t v6 = 0LL;
  }
LABEL_19:
  free(v2);
  return v6;
}

@end