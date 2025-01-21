@interface BKDisplayAnnotationRenderer
- (BKDisplayAnnotation)annotation;
- (BOOL)shouldRenderWithSupernode;
- (CALayer)layer;
- (void)didRemoveAnnotation;
- (void)locationDidChange;
- (void)regenerateLayerTree;
- (void)setAnnotation:(id)a3;
- (void)setLayer:(id)a3;
- (void)sizeLayerToFitAtScale:(double)a3;
- (void)styleSheetDidChange;
@end

@implementation BKDisplayAnnotationRenderer

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

- (void)locationDidChange
{
  id v34 = [self layer];
  [CATransaction begin];
  [CATransaction setDisableActions:YES];
  v3 = [BKDisplayAnnotationRenderer annotation];
  v4 = [v3 location];
  if ([v4 definedInReferenceSpace])
  {
    [v4 superBias];
    [v34 setAnchorPoint:CGPointMake(v15, v17)];
    [v4 point];
    [v34 setPosition:];
  }

  else
  {
    if ([v4 shouldAutoposition])
    {
      v5 = [v34 superlayer];
      [v5 bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [v4 superBias];
      double v15 = v14;
      double v17 = v16;
      v35.origin.x = v7;
      v35.origin.y = v9;
      v35.size.width = v11;
      v35.size.height = v13;
      CGFloat v18 = CGRectGetMaxX(v35) * v15;
      v36.origin.x = v7;
      v36.origin.y = v9;
      v36.size.width = v11;
      v36.size.height = v13;
      double v19 = v17 * CGRectGetMaxY(v36);
      [v34 setAnchorPoint:CGPointMake(v15, v17)];
      [v34 setPosition:CGPointMake(v18, v19)];
    }

    else
    {
      [v4 point];
      v5 = [v3 annotationController];
      v20 = [v5 display];
      v21 = [v20 uniqueId];

      v22 = [v5 context];
      id v23 = [v22 contextId];

      sub_10001A6E4(v21);
      double v26 = sub_10001A824((uint64_t)v23, v21, v24, v25);
      double v28 = v27;
      v29 = [v34 superlayer];
      [v29 convertPoint:CGPointMake(0, v26) fromLayer:v28];
      double v31 = v30;
      double v33 = v32;

      [v4 superBias];
      [v34 setAnchorPoint:];
      [v34 setPosition:CGPointMake(v31, v33)];
    }
  }

  [CATransaction commit];
}

- (void)didRemoveAnnotation
{
  layer = self->_layer;
  self->_layer = 0LL;

  self->_shouldReapplyStyles = 1;
}

- (void)styleSheetDidChange
{
  id v6 = [self annotation];
  v3 = [v6 styleSheet];
  self->_shouldReapplyStyles = 1;
  if (self->_layer)
  {
    v4 = [BKDisplayAnnotationRenderer layer];
    v5 = [v6 content];
    [v3 applyToLayer:v4 forContent:v5];

    [self->_layer setNeedsDisplay];
  }
}

- (CALayer)layer
{
  p_layer = &self->_layer;
  v4 = self->_layer;
  id WeakRetained = objc_loadWeakRetained((id *)p_layer - 1);
  id v6 = [annotationController autorelease];
  CGFloat v7 = v6;
  if (v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0LL;
  }
  if (!v8)
  {
    CGFloat v9 = [v6 rootLayer];
    [v9 rasterizationScale];
    double v11 = v10;
    double v12 = (void *)[WeakRetained styleSheet];
    CGFloat v13 = [WeakRetained content];
    v4 = (CALayer *)[v12 newLayerForContent:v13 scale:v11];

    objc_storeStrong((id *)p_layer, v4);
    self->_shouldReapplyStyles = 1;
  }

  if (v4 && self->_shouldReapplyStyles)
  {
    double v14 = (void *)[WeakRetained styleSheet];
    double v15 = [WeakRetained content];
    [v14 applyToLayer:v4 forContent:v15];

    self->_shouldReapplyStyles = 0;
  }

  double v16 = *p_layer;

  return v16;
}

- (void)sizeLayerToFitAtScale:(double)a3
{
  id v7 = [self layer];
  id WeakRetained = self->_annotation;
  id v6 = [WeakRetained styleSheet];
  [v6 sizeLayer:v7 toFitAtScale:a3];
}

- (void)regenerateLayerTree
{
  id v17 = [self annotation];
  v3 = [v17 location];
  v4 = [v17 annotationController];
  v5 = [v4 rootLayer];
  id v6 = [v4 transformLayer];
  id v7 = [v4 referenceSpaceLayer];
  [v5 rasterizationScale];
  double v9 = v8;
  double v10 = [self layer];
  id v11 = v6;
  unsigned __int8 v12 = [v3 definedInReferenceSpace];
  CGFloat v13 = v7;
  if ((v12 & 1) != 0 || (v14 = [v3 inhibitRotation], CGFloat v13 = v5, v15 = v11, v14))
  {
    id v15 = v13;
  }

  id v16 = [v10 superlayer];

  if (v16 != v15)
  {
    [v10 removeFromSuperlayer];
    [v15 addSublayer:v10];
  }

  [self sizeLayerToFitAtScale:v9];
  [self locationDidChange];
}

- (BKDisplayAnnotation)annotation
{
  return (BKDisplayAnnotation *)self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (void)setLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end