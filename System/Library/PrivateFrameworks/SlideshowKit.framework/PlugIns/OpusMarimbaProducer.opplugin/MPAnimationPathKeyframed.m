@interface MPAnimationPathKeyframed
+ (id)animationPath;
- (MPAnimationPathKeyframed)init;
- (double)parentMainDuration;
- (double)parentPhaseInDuration;
- (double)parentPhaseOutDuration;
- (double)relativeTimeForKeyframe:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 forDuration:(double)a5;
- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 forDuration:(double)a6;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4;
- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4;
- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)description;
- (id)fullDebugLog;
- (id)keyframes;
- (id)orderedKeyframes;
- (id)parent;
- (void)addKeyframe:(id)a3;
- (void)addKeyframes:(id)a3;
- (void)cleanup;
- (void)copyKeyframes:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)removeAllKeyframes;
- (void)removeKeyframe:(id)a3;
- (void)removeKeyframes:(id)a3;
- (void)setAnimationPath:(id)a3;
@end

@implementation MPAnimationPathKeyframed

+ (id)animationPath
{
  return objc_alloc_init((Class)a1);
}

- (MPAnimationPathKeyframed)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationPathKeyframed;
  v2 = -[MPAnimationPath init](&v4, "init");
  if (v2) {
    v2->_keyframes = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationPathKeyframed;
  -[MPAnimationPath dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationPathKeyframed;
  id v4 = -[MPAnimationPath copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 copyKeyframes:self->_keyframes];
  return v4;
}

- (id)description
{
  objc_super v3 = -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"=========================== Animation Path Description =========================\n"),  "stringByAppendingFormat:",  @"\t                Keyframe Count: %d\n",  -[NSMutableSet count](self->_keyframes, "count"));
  if (self->super._animationPath) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t           Has MCAnimationPath: %@\n",  v4);
}

- (id)keyframes
{
  return self->_keyframes;
}

- (id)orderedKeyframes
{
  return objc_msgSend( objc_msgSend(-[MPAnimationPathKeyframed keyframes](self, "keyframes"), "allObjects"),  "sortedArrayUsingSelector:",  "relativeTimeCompare:");
}

- (void)addKeyframe:(id)a3
{
}

- (void)addKeyframes:(id)a3
{
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v97;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v97 != v7) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * (void)i) setParentPath:self];
      }

      id v6 = [a3 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }

    while (v6);
  }

  if (self->super._animationPath)
  {
    id v9 = -[MPAnimationPath animatedParent](self, "animatedParent");
    id v10 = [a3 lastObject];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe1D, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      id v13 = [a3 countByEnumeratingWithState:&v92 objects:v103 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v93;
        do
        {
          for (j = 0LL; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v93 != v15) {
              objc_enumerationMutation(a3);
            }
            v17 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)j);
            [v17 scalar];
            double v19 = v18;
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___MPFilter, v20);
            if ((objc_opt_isKindOfClass(v9, v21) & 1) != 0)
            {
              *(float *)&double v22 = v19;
              objc_msgSend( objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22),  -[MPAnimationPath key](self, "key")),  "floatValue");
              double v19 = v23;
            }

            animationPath = self->super._animationPath;
            [v17 time];
            double v27 = v26;
            id v28 = [v17 offsetType];
            float v25 = v19;
            *(float *)&double v29 = v25;
            objc_msgSend( v17,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithScalar:atTime:offsetKind:]( animationPath,  "createKeyframeWithScalar:atTime:offsetKind:",  v28,  v29,  v27));
          }

          id v14 = [a3 countByEnumeratingWithState:&v92 objects:v103 count:16];
        }

        while (v14);
      }
    }

    else
    {
      id v30 = [a3 lastObject];
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe2D, v31);
      if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0)
      {
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        id v33 = [a3 countByEnumeratingWithState:&v88 objects:v102 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v89;
          do
          {
            for (k = 0LL; k != v34; k = (char *)k + 1)
            {
              if (*(void *)v89 != v35) {
                objc_enumerationMutation(a3);
              }
              v37 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)k);
              [v37 point];
              double x = v38;
              double y = v40;
              uint64_t v43 = objc_opt_class(&OBJC_CLASS___MPFilter, v42);
              if ((objc_opt_isKindOfClass(v9, v43) & 1) != 0)
              {
                v105.double x = x;
                v105.double y = y;
                v44 = (NSString *)objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  NSStringFromCGPoint(v105),  -[MPAnimationPath key](self, "key"));
                CGPoint v45 = CGPointFromString(v44);
                double x = v45.x;
                double y = v45.y;
              }

              v46 = self->super._animationPath;
              [v37 time];
              objc_msgSend( v37,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithPoint:atTime:offsetKind:]( v46,  "createKeyframeWithPoint:atTime:offsetKind:",  objc_msgSend(v37, "offsetType"),  x,  y,  v47));
            }

            id v34 = [a3 countByEnumeratingWithState:&v88 objects:v102 count:16];
          }

          while (v34);
        }
      }

      else
      {
        id v48 = [a3 lastObject];
        uint64_t v50 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeVector, v49);
        if ((objc_opt_isKindOfClass(v48, v50) & 1) != 0)
        {
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          id v51 = [a3 countByEnumeratingWithState:&v84 objects:v101 count:16];
          if (v51)
          {
            id v52 = v51;
            uint64_t v53 = *(void *)v85;
            do
            {
              for (m = 0LL; m != v52; m = (char *)m + 1)
              {
                if (*(void *)v85 != v53) {
                  objc_enumerationMutation(a3);
                }
                v55 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)m);
                id v56 = [v55 vector];
                uint64_t v58 = objc_opt_class(&OBJC_CLASS___MPFilter, v57);
                if ((objc_opt_isKindOfClass(v9, v58) & 1) != 0) {
                  id v56 = +[MPVector vectorFromString:]( MPVector,  "vectorFromString:",  objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  objc_msgSend(v56, "string"),  -[MPAnimationPath key](self, "key")));
                }
                v59 = self->super._animationPath;
                if (v56)
                {
                  [v56 vector];
                }

                else
                {
                  v82[0] = 0LL;
                  v82[1] = 0LL;
                  int v83 = 0;
                }

                [v55 time];
                objc_msgSend( v55,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithVector:atTime:offsetKind:]( v59,  "createKeyframeWithVector:atTime:offsetKind:",  v82,  objc_msgSend(v55, "offsetType"),  v60));
              }

              id v52 = [a3 countByEnumeratingWithState:&v84 objects:v101 count:16];
            }

            while (v52);
          }
        }

        else
        {
          id v61 = [a3 lastObject];
          uint64_t v63 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeFunction, v62);
          if ((objc_opt_isKindOfClass(v61, v63) & 1) != 0)
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            id v64 = [a3 countByEnumeratingWithState:&v78 objects:v100 count:16];
            if (v64)
            {
              id v65 = v64;
              uint64_t v66 = *(void *)v79;
              do
              {
                for (n = 0LL; n != v65; n = (char *)n + 1)
                {
                  if (*(void *)v79 != v66) {
                    objc_enumerationMutation(a3);
                  }
                  v68 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)n);
                  v69 = self->super._animationPath;
                  id v70 = [v68 function];
                  [v68 time];
                  double v72 = v71;
                  id v73 = [v68 offsetType];
                  [v68 duration];
                  id v75 = -[MCAnimationPath createKeyframeWithFunction:atTime:offsetKind:forDuration:]( v69,  "createKeyframeWithFunction:atTime:offsetKind:forDuration:",  v70,  v73,  v72,  v74);
                  objc_msgSend(v75, "setFunctionParameters:", objc_msgSend(v68, "functionParameters"));
                  [v68 innerEaseInControl];
                  *(float *)&double v76 = v76;
                  [v75 setInnerEaseInControl:v76];
                  [v68 innerEaseOutControl];
                  *(float *)&double v77 = v77;
                  [v75 setInnerEaseOutControl:v77];
                  [v68 functionTimeFactor];
                  objc_msgSend(v75, "setFunctionTimeFactor:");
                  [v68 functionTimeOffset];
                  objc_msgSend(v75, "setFunctionTimeOffset:");
                  [v68 setKeyframe:v75];
                }

                id v65 = [a3 countByEnumeratingWithState:&v78 objects:v100 count:16];
              }

              while (v65);
            }
          }
        }
      }
    }
  }

- (void)removeKeyframe:(id)a3
{
  if (-[NSMutableSet containsObject:](self->_keyframes, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_keyframes, "removeObject:", a3);
    [a3 setParentPath:0];
    if (self->super._animationPath)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe1D, v5);
      if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0
        || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe2D, v7), (objc_opt_isKindOfClass(a3, v8) & 1) != 0)
        || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeVector, v9), (objc_opt_isKindOfClass(a3, v10) & 1) != 0)
        || (uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeFunction, v11),
            (objc_opt_isKindOfClass(a3, v12) & 1) != 0))
      {
        -[MCAnimationPath removeKeyframe:](self->super._animationPath, "removeKeyframe:", [a3 keyframe]);
        [a3 setKeyframe:0];
      }
    }
  }

- (void)removeKeyframes:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[MPAnimationPathKeyframed removeKeyframe:]( self,  "removeKeyframe:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (void)removeAllKeyframes
{
  id v3 = -[NSMutableSet copy](self->_keyframes, "copy");
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPAnimationPathKeyframed removeKeyframe:]( self,  "removeKeyframe:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframe1D keyframe1DWithScalar:atTime:]( &OBJC_CLASS___MPAnimationKeyframe1D,  "keyframe1DWithScalar:atTime:",  a3,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v5);
  return v5;
}

- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframe1D keyframe1DWithScalar:atTime:offsetType:]( &OBJC_CLASS___MPAnimationKeyframe1D,  "keyframe1DWithScalar:atTime:offsetType:",  a5,  a3,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v6);
  return v6;
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframe2D keyframe2DWithPoint:atTime:]( &OBJC_CLASS___MPAnimationKeyframe2D,  "keyframe2DWithPoint:atTime:",  a3.x,  a3.y,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v5);
  return v5;
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframe2D keyframe2DWithPoint:atTime:offsetType:]( &OBJC_CLASS___MPAnimationKeyframe2D,  "keyframe2DWithPoint:atTime:offsetType:",  a5,  a3.x,  a3.y,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v6);
  return v6;
}

- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframeVector keyframeVectorWithVector:atTime:]( &OBJC_CLASS___MPAnimationKeyframeVector,  "keyframeVectorWithVector:atTime:",  a3,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v5);
  return v5;
}

- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframeVector keyframeVectorWithVector:atTime:offsetType:]( &OBJC_CLASS___MPAnimationKeyframeVector,  "keyframeVectorWithVector:atTime:offsetType:",  a3,  a5,  a4);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v6);
  return v6;
}

- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 forDuration:(double)a5
{
  uint64_t v6 = +[MPAnimationKeyframeFunction keyframeFunctionWithFunction:atTime:withDuration:]( &OBJC_CLASS___MPAnimationKeyframeFunction,  "keyframeFunctionWithFunction:atTime:withDuration:",  a3,  a4,  a5);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v6);
  return v6;
}

- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 forDuration:(double)a6
{
  uint64_t v7 = +[MPAnimationKeyframeFunction keyframeFunctionWithFunction:atTime:offsetType:withDuration:]( &OBJC_CLASS___MPAnimationKeyframeFunction,  "keyframeFunctionWithFunction:atTime:offsetType:withDuration:",  a3,  a5,  a4,  a6);
  -[MPAnimationPathKeyframed addKeyframe:](self, "addKeyframe:", v7);
  return v7;
}

- (id)parent
{
  return self->super._parentObject;
}

- (double)relativeTimeForKeyframe:(id)a3
{
  double v6 = v5;
  -[MPAnimationPathKeyframed parentPhaseInDuration](self, "parentPhaseInDuration");
  double v8 = v7;
  -[MPAnimationPathKeyframed parentPhaseOutDuration](self, "parentPhaseOutDuration");
  double v10 = v9;
  -[MPAnimationPathKeyframed parentMainDuration](self, "parentMainDuration");
  double v12 = v11;
  double v13 = v8 + v10 + v11;
  id v14 = (char *)[a3 offsetType];
  if ((uint64_t)v14 > 100)
  {
    if (v14 == (_BYTE *)&stru_20.flags + 1)
    {
      double v6 = v6 + v8;
    }

    else if (v14 == (_BYTE *)&stru_20.flags + 2)
    {
      double v6 = v6 + v8 + v12;
    }

    else if (v14 == (_BYTE *)&stru_20.flags + 3)
    {
      double v6 = v6 + v13;
    }
  }

  else
  {
    switch((unint64_t)v14)
    {
      case 0uLL:
        double v6 = v6 * v13;
        break;
      case 1uLL:
        double v6 = v6 * v8;
        break;
      case 2uLL:
        double v6 = (v6 + 1.0) * v8;
        break;
      case 3uLL:
        double v6 = v8 + v6 * v12;
        break;
      case 4uLL:
        double v6 = v8 + (v6 + 1.0) * v12;
        break;
      case 5uLL:
        double v6 = v8 + v12 + v6 * v10;
        break;
      case 6uLL:
        double v6 = v13 + v6 * v10;
        break;
      case 7uLL:
        double v6 = (v6 + 1.0) * v13;
        break;
      default:
        return v6 / v13;
    }
  }

  return v6 / v13;
}

- (double)parentPhaseInDuration
{
  id v2 = -[MPAnimationPath animatedParent](self, "animatedParent");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPFilter, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v2 = [v2 parent];
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPSlide, v5);
  if ((objc_opt_isKindOfClass(v2, v6) & 1) != 0)
  {
    id v2 = [v2 parentEffect];
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPEffect, v7);
    if ((objc_opt_isKindOfClass(v2, v8) & 1) == 0)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v9);
      if ((objc_opt_isKindOfClass(v2, v10) & 1) != 0) {
        return 0.0;
      }
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLayer, v11);
      if ((objc_opt_isKindOfClass(v2, v13) & 1) == 0)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v14);
        if ((objc_opt_isKindOfClass(v2, v15) & 1) == 0)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPNavigator, v16);
          if ((objc_opt_isKindOfClass(v2, v17) & 1) == 0) {
            return 0.0;
          }
        }
      }
    }
  }

  [v2 phaseInDuration];
  return result;
}

- (double)parentPhaseOutDuration
{
  id v2 = -[MPAnimationPath animatedParent](self, "animatedParent");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPFilter, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v2 = [v2 parent];
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPSlide, v5);
  if ((objc_opt_isKindOfClass(v2, v6) & 1) != 0)
  {
    id v2 = [v2 parentEffect];
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPEffect, v7);
    if ((objc_opt_isKindOfClass(v2, v8) & 1) == 0)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v9);
      if ((objc_opt_isKindOfClass(v2, v10) & 1) != 0) {
        return 0.0;
      }
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLayer, v11);
      if ((objc_opt_isKindOfClass(v2, v13) & 1) == 0)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v14);
        if ((objc_opt_isKindOfClass(v2, v15) & 1) == 0)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPNavigator, v16);
          if ((objc_opt_isKindOfClass(v2, v17) & 1) == 0) {
            return 0.0;
          }
        }
      }
    }
  }

  [v2 phaseOutDuration];
  return result;
}

- (double)parentMainDuration
{
  id v2 = -[MPAnimationPath animatedParent](self, "animatedParent");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPFilter, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v2 = [v2 parent];
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPSlide, v5);
  if ((objc_opt_isKindOfClass(v2, v6) & 1) != 0)
  {
    id v8 = [v2 parentEffect];
LABEL_7:
    [v8 mainDuration];
    return result;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPEffect, v7);
  if ((objc_opt_isKindOfClass(v2, v9) & 1) != 0)
  {
    id v8 = v2;
    goto LABEL_7;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v10);
  if ((objc_opt_isKindOfClass(v2, v12) & 1) != 0)
  {
    [v2 duration];
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPLayer, v13);
    if ((objc_opt_isKindOfClass(v2, v14) & 1) != 0
      || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v15), (objc_opt_isKindOfClass(v2, v16) & 1) != 0)
      || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___MPNavigator, v17),
          char isKindOfClass = objc_opt_isKindOfClass(v2, v18),
          double result = 0.0,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v2, "duration", result);
      double v21 = v20;
      [v2 phaseOutDuration];
      double v23 = v21 - v22;
      [v2 phaseInDuration];
      return v23 - v24;
    }
  }

  return result;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  uint64_t v3 = -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPAnimationPathKeyframed description](self, "description")),  "stringByAppendingFormat:",  @"======================= Animation Path Keyframes =======================\n");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  keyframes = self->_keyframes;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keyframes,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(keyframes);
        }
        uint64_t v3 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) fullDebugLog]);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keyframes,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)copyKeyframes:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        [v5 addObject:v10];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[MPAnimationPathKeyframed addKeyframes:](self, "addKeyframes:", v5);
}

- (void)cleanup
{
}

- (void)setAnimationPath:(id)a3
{
  v117.receiver = self;
  v117.super_class = (Class)&OBJC_CLASS___MPAnimationPathKeyframed;
  -[MPAnimationPath setAnimationPath:](&v117, "setAnimationPath:", a3);
  if (self->super._animationPath)
  {
    if (-[NSMutableSet count](self->_keyframes, "count"))
    {
      id v4 = -[MPAnimationPath animatedParent](self, "animatedParent");
      id v5 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe1D, v6);
      if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      {
        __int128 v115 = 0u;
        __int128 v116 = 0u;
        __int128 v113 = 0u;
        __int128 v114 = 0u;
        keyframes = self->_keyframes;
        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keyframes,  "countByEnumeratingWithState:objects:count:",  &v113,  v122,  16LL);
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v114;
          do
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v114 != v11) {
                objc_enumerationMutation(keyframes);
              }
              __int128 v13 = *(void **)(*((void *)&v113 + 1) + 8LL * (void)i);
              [v13 scalar];
              double v15 = v14;
              uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPFilter, v16);
              if ((objc_opt_isKindOfClass(v4, v17) & 1) != 0)
              {
                *(float *)&double v18 = v15;
                objc_msgSend( objc_msgSend( v4,  "convertMPAttributeToMCAttribute:withKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18),  -[MPAnimationPath key](self, "key")),  "floatValue");
                double v15 = v19;
              }

              animationPath = self->super._animationPath;
              [v13 time];
              double v23 = v22;
              id v24 = [v13 offsetType];
              float v21 = v15;
              *(float *)&double v25 = v21;
              objc_msgSend( v13,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithScalar:atTime:offsetKind:]( animationPath,  "createKeyframeWithScalar:atTime:offsetKind:",  v24,  v25,  v23));
            }

            id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keyframes,  "countByEnumeratingWithState:objects:count:",  &v113,  v122,  16LL);
          }

          while (v10);
        }
      }

      else
      {
        id v44 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
        uint64_t v46 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe2D, v45);
        if ((objc_opt_isKindOfClass(v44, v46) & 1) != 0)
        {
          __int128 v111 = 0u;
          __int128 v112 = 0u;
          __int128 v109 = 0u;
          __int128 v110 = 0u;
          double v47 = self->_keyframes;
          id v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
          if (v48)
          {
            id v49 = v48;
            uint64_t v50 = *(void *)v110;
            do
            {
              for (j = 0LL; j != v49; j = (char *)j + 1)
              {
                if (*(void *)v110 != v50) {
                  objc_enumerationMutation(v47);
                }
                id v52 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)j);
                [v52 point];
                double x = v53;
                double y = v55;
                uint64_t v58 = objc_opt_class(&OBJC_CLASS___MPFilter, v57);
                if ((objc_opt_isKindOfClass(v4, v58) & 1) != 0)
                {
                  v123.double x = x;
                  v123.double y = y;
                  v59 = (NSString *)objc_msgSend( v4,  "convertMPAttributeToMCAttribute:withKey:",  NSStringFromCGPoint(v123),  -[MPAnimationPath key](self, "key"));
                  CGPoint v60 = CGPointFromString(v59);
                  double x = v60.x;
                  double y = v60.y;
                }

                id v61 = self->super._animationPath;
                [v52 time];
                objc_msgSend( v52,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithPoint:atTime:offsetKind:]( v61,  "createKeyframeWithPoint:atTime:offsetKind:",  objc_msgSend(v52, "offsetType"),  x,  y,  v62));
              }

              id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
            }

            while (v49);
          }
        }

        else
        {
          id v63 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
          uint64_t v65 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeVector, v64);
          if ((objc_opt_isKindOfClass(v63, v65) & 1) != 0)
          {
            __int128 v107 = 0u;
            __int128 v108 = 0u;
            __int128 v105 = 0u;
            __int128 v106 = 0u;
            uint64_t v66 = self->_keyframes;
            id v67 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v105,  v120,  16LL);
            if (v67)
            {
              id v68 = v67;
              uint64_t v69 = *(void *)v106;
              do
              {
                for (k = 0LL; k != v68; k = (char *)k + 1)
                {
                  if (*(void *)v106 != v69) {
                    objc_enumerationMutation(v66);
                  }
                  double v71 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)k);
                  id v72 = [v71 vector];
                  uint64_t v74 = objc_opt_class(&OBJC_CLASS___MPFilter, v73);
                  if ((objc_opt_isKindOfClass(v4, v74) & 1) != 0) {
                    id v72 = +[MPVector vectorFromString:]( MPVector,  "vectorFromString:",  objc_msgSend( v4,  "convertMPAttributeToMCAttribute:withKey:",  objc_msgSend(v72, "string"),  -[MPAnimationPath key](self, "key")));
                  }
                  id v75 = self->super._animationPath;
                  if (v72)
                  {
                    [v72 vector];
                  }

                  else
                  {
                    v103[0] = 0LL;
                    v103[1] = 0LL;
                    int v104 = 0;
                  }

                  [v71 time];
                  objc_msgSend( v71,  "setKeyframe:",  -[MCAnimationPath createKeyframeWithVector:atTime:offsetKind:]( v75,  "createKeyframeWithVector:atTime:offsetKind:",  v103,  objc_msgSend(v71, "offsetType"),  v76));
                }

                id v68 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v105,  v120,  16LL);
              }

              while (v68);
            }
          }

          else
          {
            id v77 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
            uint64_t v79 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeFunction, v78);
            if ((objc_opt_isKindOfClass(v77, v79) & 1) != 0)
            {
              __int128 v101 = 0u;
              __int128 v102 = 0u;
              __int128 v99 = 0u;
              __int128 v100 = 0u;
              __int128 v80 = self->_keyframes;
              id v81 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v99,  v119,  16LL);
              if (v81)
              {
                id v82 = v81;
                uint64_t v83 = *(void *)v100;
                do
                {
                  for (m = 0LL; m != v82; m = (char *)m + 1)
                  {
                    if (*(void *)v100 != v83) {
                      objc_enumerationMutation(v80);
                    }
                    __int128 v85 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)m);
                    __int128 v86 = self->super._animationPath;
                    id v87 = [v85 function];
                    [v85 time];
                    double v89 = v88;
                    id v90 = [v85 offsetType];
                    [v85 duration];
                    id v92 = -[MCAnimationPath createKeyframeWithFunction:atTime:offsetKind:forDuration:]( v86,  "createKeyframeWithFunction:atTime:offsetKind:forDuration:",  v87,  v90,  v89,  v91);
                    objc_msgSend(v92, "setFunctionParameters:", objc_msgSend(v85, "functionParameters"));
                    [v85 innerEaseInControl];
                    *(float *)&double v93 = v93;
                    [v92 setInnerEaseInControl:v93];
                    [v85 innerEaseOutControl];
                    *(float *)&double v94 = v94;
                    [v92 setInnerEaseOutControl:v94];
                    [v85 functionTimeFactor];
                    objc_msgSend(v92, "setFunctionTimeFactor:");
                    [v85 functionTimeOffset];
                    objc_msgSend(v92, "setFunctionTimeOffset:");
                    [v85 setKeyframe:v92];
                  }

                  id v82 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v99,  v119,  16LL);
                }

                while (v82);
              }
            }
          }
        }
      }
    }
  }

  else
  {
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    double v26 = self->_keyframes;
    id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v95,  v118,  16LL);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v96;
      do
      {
        for (n = 0LL; n != v28; n = (char *)n + 1)
        {
          if (*(void *)v96 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)n);
          id v32 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
          uint64_t v34 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe1D, v33);
          if ((objc_opt_isKindOfClass(v32, v34) & 1) == 0)
          {
            id v35 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
            uint64_t v37 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframe2D, v36);
            if ((objc_opt_isKindOfClass(v35, v37) & 1) == 0)
            {
              id v38 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
              uint64_t v40 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeVector, v39);
              if ((objc_opt_isKindOfClass(v38, v40) & 1) == 0)
              {
                id v41 = -[NSMutableSet anyObject](self->_keyframes, "anyObject");
                uint64_t v43 = objc_opt_class(&OBJC_CLASS___MPAnimationKeyframeFunction, v42);
                if ((objc_opt_isKindOfClass(v41, v43) & 1) == 0) {
                  continue;
                }
              }
            }
          }

          [v31 setKeyframe:0];
        }

        id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v95,  v118,  16LL);
      }

      while (v28);
    }
  }

@end