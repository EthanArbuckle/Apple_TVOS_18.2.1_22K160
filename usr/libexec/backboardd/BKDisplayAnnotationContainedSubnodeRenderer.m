@interface BKDisplayAnnotationContainedSubnodeRenderer
- (BOOL)shouldRenderWithSupernode;
- (CALayer)backgroundLayer;
- (CGSize)_getFrames:(CGRect *)a3 ofAnnotations:(id)a4 fixSuperlayer:(id)a5 scale:(double)a6;
- (NSArray)subannotations;
- (NSMutableDictionary)sectionTitleAnnotations;
- (void)layoutAnnotationStack:(id)a3;
- (void)regenerateLayerTree;
- (void)setBackgroundLayer:(id)a3;
- (void)setSectionTitleAnnotations:(id)a3;
- (void)setSubannotations:(id)a3;
- (void)styleSheetDidChange;
@end

@implementation BKDisplayAnnotationContainedSubnodeRenderer

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

- (void)styleSheetDidChange
{
  v20.receiver = self;
  v20.super_class = [BKDisplayAnnotationContainedSubnodeRenderer class];
  [v20 styleSheetDidChange];
  BKDisplayAnnotationRenderer *v3 = [v3 annotation];
  v4 = [v3 styleSheet];
  backgroundLayer = self->_backgroundLayer;
  v6 = [BKDisplayAnnotationStringContent contentWithString:stru_1000BB628];
  [v4 applyToLayer:backgroundLayer forContent:v6];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v7 = self->_subannotations;
  [v7 countByEnumeratingWithState:v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v13 = [v12 styleSheet];
        v14 = [v4 subnodeStyleModifier];
        [v13 setStyleModifier:v14];

        v15 = [v12 renderer];
        [v15 styleSheetDidChange];
      }

      [v7 countByEnumeratingWithState:v16 objects:v21 count:16];
    }

    while (v9);
  }
}

- (void)regenerateLayerTree
{
  v8.receiver = self;
  v8.super_class = [BKDisplayAnnotationContainedSubnodeRenderer class];
  [v8 regenerateLayerTree];
  v3 = [self annotation];
  v4 = [v3 namespaceNode];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004BFA0;
  v6[3] = &unk_1000B7208;
  id v5 = [NSMutableArray array];
  id v7 = v5;
  [v4 enumerateNodesWithOptions:1 usingBlock:v6];
  if ([v5 count]) {
    [self layoutAnnotationStack:v5];
  }
}

- (CGSize)_getFrames:(CGRect *)a3 ofAnnotations:(id)a4 fixSuperlayer:(id)a5 scale:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v13 = [v9 countByEnumeratingWithState:v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v32;
    p_size = &a3->size;
    do
    {
      __int128 v17 = 0LL;
      p_double width = &p_size[2 * v15].width;
      do
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v9);
        }
        __int128 v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v17);
        objc_super v20 = [v19 renderer];
        v21 = [v20 layer];

        id v22 = [v21 superlayer];
        if (v22 != v10)
        {
          [v21 removeFromSuperlayer];
          [v10 addSublayer:v21];
        }

        v23 = [v19 renderer];
        [v23 sizeLayerToFitAtScale:a6];

        [v21 frame];
        *((void *)p_width - 2) = v26;
        *((void *)p_width - 1) = v27;
        *p_double width = v24;
        p_width[1] = v25;
        p_width += 4;
        if (v24 > width) {
          double width = v24;
        }
        double height = height + v25;

        __int128 v17 = (char *)v17 + 1;
      }

      while (v14 != v17);
      v15 += (uint64_t)v17;
      id v14 = [v9 countByEnumeratingWithState:v31 objects:v35 count:16];
    }

    while (v14);
  }

  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)layoutAnnotationStack:(id)a3
{
  id v4 = a3;
  id v104 = [self annotation];
  id v5 = [v104 annotationController];
  v6 = (void *)[v5 rootLayer];
  id v108 = v5;
  id v7 = [v5 transformLayer];
  id v103 = v6;
  [v6 rasterizationScale];
  id v9 = v8;
  id v102 = v7;
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v106 = v12;
  v100 = v13;
  CGFloat v15 = v14;
  v109 = self;
  id v105 = [self layer];
  [v105 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  NSMutableOrderedSet *v24 = [NSMutableOrderedSet orderedSetWithCapacity:[v4 count]];
  id v111 = [NSMutableDictionary dictionary];
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v25 = v4;
  id v26 = [v25 countByEnumeratingWithState:v120 objects:v126 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v121;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v121 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v120 + 1) + 8LL * (void)i);
        uint64_t v31 = [v30 section];
        if (v31) {
          __int128 v32 = (__CFString *)v31;
        }
        else {
          __int128 v32 = &stru_1000BB628;
        }
        [v24 addObject:v32];
        __int128 v33 = (void *)[v111 objectForKey:v32];
        if (!v33)
        {
          NSMutableArray *v33 = [NSMutableArray array];
          [v111 setObject:v33 forKey:v32];
        }

        [v33 addObject:v30];
      }

      id v27 = [v25 countByEnumeratingWithState:v120 objects:v126 count:16];
    }

    while (v27);
  }

  NSMutableArray *v34 = [NSMutableArray array];
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id v35 = v24;
  id v36 = [v35 countByEnumeratingWithState:v116 objects:v125 count:16];
  p_isa = (id *)&v109->super.super.isa;
  id v107 = v35;
  if (v36)
  {
    id v38 = v36;
    double v110 = *(double *)v117;
    do
    {
      for (j = 0LL; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v117 != *(void *)&v110) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)j);
        if ([v40 length])
        {
          v41 = [p_isa[5] objectForKey:v40];
          if (!v41)
          {
            id v42 = v25;
            v43 = v109;
            if (!v109->_sectionTitleAnnotations)
            {
              uint64_t v44 = [NSMutableDictionary dictionary];
              sectionTitleAnnotations = v109->_sectionTitleAnnotations;
              v109->_sectionTitleAnnotations = (NSMutableDictionary *)v44;
            }

            BKDisplayAnnotation *v41 = [BKDisplayAnnotation annotationWithString:v40];
            [v41 setAnnotationController:v108];
            BKDisplayAnnotationStyle *v46 = [BKDisplayAnnotationStyle emphasizedStyle];
            [v41 setStyleModifier:v46];

            [v43->_sectionTitleAnnotations setObject:v41 forKey:v40];
            id v25 = v42;
            id v35 = v107;
          }

          [v34 addObject:v41];

          p_isa = (id *)&v109->super.super.isa;
        }

        v47 = [v111 objectForKey:v40];
        [v34 addObjectsFromArray:v47];
      }

      id v38 = [v35 countByEnumeratingWithState:v116 objects:v125 count:16];
    }

    while (v38);
  }

  [v34 count];
  v101 = &v96;
  v48 = &v96 - 4 * __chkstk_darwin();
  id v99 = v9;
  [p_isa _getFrames:v48 ofAnnotations:v34 fixSuperlayer:v105 scale:v9];
  double v110 = v49;
  double v51 = v50;
  id v52 = v104;
  id v53 = [v104 subnodeScreenEdgeTreatment];
  if (v53 == (id)2)
  {
    v127.origin.x = v11;
    CGFloat v98 = v11;
    CGFloat v54 = v106;
    v127.origin.double y = v106;
    CGFloat v55 = v100;
    v127.size.double width = v100;
    v127.size.double height = v15;
    CGFloat MaxX = CGRectGetMaxX(v127);
    CGFloat v97 = v15;
    CGFloat v57 = v23;
    double v58 = MaxX;
    v128.origin.x = v17;
    v128.origin.double y = v19;
    v128.size.double width = v21;
    v128.size.double height = v57;
    double v59 = v58 - (v110 + CGRectGetMaxX(v128));
    if (v59 >= 0.0) {
      double v59 = -0.0;
    }
    double v60 = v21 + v59;
    v129.size.double height = v97;
    v129.origin.x = v98;
    v129.origin.double y = v54;
    v129.size.double width = v55;
    double MaxY = CGRectGetMaxY(v129);
    v130.origin.x = v17;
    v130.origin.double y = v19;
    v130.size.double width = v21;
    v130.size.double height = v57;
    double v62 = MaxY - (v51 + CGRectGetMinY(v130));
    double v63 = 0.0;
    if (v62 >= 0.0) {
      double v64 = 0.0;
    }
    else {
      double v64 = v62 + 0.0;
    }
  }

  else
  {
    id v65 = v53;
    v131.origin.x = v17;
    v131.origin.double y = v19;
    v131.size.double width = v21;
    v131.size.double height = v23;
    CGFloat v66 = CGRectGetMaxX(v131);
    v132.size.double height = v15;
    CGFloat v67 = v19;
    CGFloat v68 = v23;
    double v69 = v110;
    double v70 = v110 + v66;
    v132.origin.x = v11;
    v132.origin.double y = v106;
    v132.size.double width = v100;
    CGFloat v71 = CGRectGetMaxX(v132);
    CGFloat v72 = v17;
    double v73 = v71;
    v133.origin.x = v72;
    v133.origin.double y = v67;
    v133.size.double width = v21;
    v133.size.double height = v68;
    BOOL v74 = CGRectGetMinX(v133) - v69 >= 0.0;
    if (v65 != (id)1) {
      BOOL v74 = (BOOL)v65;
    }
    uint64_t v76 = v70 > v73 && v65 == 0LL || v74;
    double v64 = 0.0;
    if (v76 == 1) {
      double v63 = 1.0;
    }
    else {
      double v63 = 0.0;
    }
    if (v76 == 1) {
      double v60 = 0.0;
    }
    else {
      double v60 = v21;
    }
    [v52 setSubnodeScreenEdgeTreatment:];
  }

  v77 = p_isa + 4;
  id v78 = p_isa[4];
  BKDisplayAnnotationStyleSheet *v79 = [[BKDisplayAnnotationStyleSheet alloc] init];
  v80 = [BKDisplayAnnotationStyle rectangleStyle];
  [v79 setBaseStyle:v80];

  BKDisplayAnnotationStyle *v81 = [BKDisplayAnnotationStyle textBackgroundStyle];
  [v79 setStyleModifier:v81];

  BKDisplayAnnotationShapeContent *v82 = [BKDisplayAnnotationShapeContent contentWithSize:v110];
  if (!v78) {
    BKDisplayAnnotationStyleSheet *v78 = [[BKDisplayAnnotationStyleSheet alloc] newLayerForContent:v82 scale:v99];
  }
  id v99 = v82;
  v100 = v79;
  [v79 applyToLayer:v78 forContent:v82];
  double v83 = 0.0;
  [v78 setAnchorPoint:CGPointMake(v63, 0.0)];
  [v78 setPosition:CGPointMake(v60, v64)];
  [v105 insertSublayer:v78 atIndex:0];
  objc_storeStrong(v77, v78);
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  v84 = v34;
  [v84 countByEnumeratingWithState:v112 objects:v124 count:16];
  if (v85)
  {
    id v86 = v85;
    double v87 = 0.0;
    uint64_t v88 = *(void *)v113;
    double y = CGPointZero.y;
    CGFloat v106 = v48 + 2;
    do
    {
      v90 = 0LL;
      double v110 = v87;
      uint64_t v91 = v106 + 32LL * v87;
      do
      {
        if (*(void *)v113 != v88) {
          objc_enumerationMutation(v84);
        }
        v92 = (void *)[*(id *)(*((void *)&v112 + 1) + 8 * (void)v90) renderer];
        v93 = (void *)[v92 layer];

        [v78 addSublayer:v93];
        [v93 setAnchorPoint:CGPointMake(CGPointZero.x, y)];
        [v93 setPosition:CGPointMake(0.0, v83)];
        CGRect v134 = *(CGRect *)(v91 - 16);
        v91 += 32LL;
        double v83 = v83 + CGRectGetMaxY(v134);

        v90 = (char *)v90 + 1;
      }

      while (v86 != v90);
      *(void *)&double v87 = (char *)v90 + *(void *)&v110;
      [v84 countByEnumeratingWithState:v112 objects:v124 count:16];
    }

    while (v86);
  }

  subannotations = v109->_subannotations;
  v109->_subannotations = v84;
  v95 = v84;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (NSMutableDictionary)sectionTitleAnnotations
{
  return self->_sectionTitleAnnotations;
}

- (void)setSectionTitleAnnotations:(id)a3
{
}

- (NSArray)subannotations
{
  return self->_subannotations;
}

- (void)setSubannotations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end