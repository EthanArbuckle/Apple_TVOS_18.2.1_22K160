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
  id v34 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 location]);
  if ([v4 definedInReferenceSpace])
  {
    [v4 superBias];
    objc_msgSend(v34, "setAnchorPoint:");
    [v4 point];
    objc_msgSend(v34, "setPosition:");
  }

  else
  {
    if ([v4 shouldAutoposition])
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v34 superlayer]);
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
      objc_msgSend(v34, "setAnchorPoint:", v15, v17);
      objc_msgSend(v34, "setPosition:", v18, v19);
    }

    else
    {
      [v4 point];
      v5 = (void *)objc_claimAutoreleasedReturnValue([v3 annotationController]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v5 display]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueId]);

      v22 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
      id v23 = [v22 contextId];

      sub_10001A6E4(v21);
      double v26 = sub_10001A824((uint64_t)v23, v21, v24, v25);
      double v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v34 superlayer]);
      objc_msgSend(v29, "convertPoint:fromLayer:", 0, v26, v28);
      double v31 = v30;
      double v33 = v32;

      [v4 superBias];
      objc_msgSend(v34, "setAnchorPoint:");
      objc_msgSend(v34, "setPosition:", v31, v33);
    }
  }

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)didRemoveAnnotation
{
  layer = self->_layer;
  self->_layer = 0LL;

  self->_shouldReapplyStyles = 1;
}

- (void)styleSheetDidChange
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 styleSheet]);
  self->_shouldReapplyStyles = 1;
  if (self->_layer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 content]);
    [v3 applyToLayer:v4 forContent:v5];

    -[CALayer setNeedsDisplay](self->_layer, "setNeedsDisplay");
  }
}

- (CALayer)layer
{
  p_layer = &self->_layer;
  v4 = self->_layer;
  id WeakRetained = objc_loadWeakRetained((id *)p_layer - 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained annotationController]);
  CGFloat v7 = v6;
  if (v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0LL;
  }
  if (!v8)
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v6 rootLayer]);
    [v9 rasterizationScale];
    double v11 = v10;
    double v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained styleSheet]);
    CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained content]);
    v4 = (CALayer *)[v12 newLayerForContent:v13 scale:v11];

    objc_storeStrong((id *)p_layer, v4);
    self->_shouldReapplyStyles = 1;
  }

  if (v4 && self->_shouldReapplyStyles)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained styleSheet]);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained content]);
    [v14 applyToLayer:v4 forContent:v15];

    self->_shouldReapplyStyles = 0;
  }

  double v16 = *p_layer;

  return v16;
}

- (void)sizeLayerToFitAtScale:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained styleSheet]);
  [v6 sizeLayer:v7 toFitAtScale:a3];
}

- (void)regenerateLayerTree
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v17 location]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v17 annotationController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootLayer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transformLayer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 referenceSpaceLayer]);
  [v5 rasterizationScale];
  double v9 = v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  id v11 = v6;
  unsigned __int8 v12 = [v3 definedInReferenceSpace];
  CGFloat v13 = v7;
  if ((v12 & 1) != 0 || (v14 = [v3 inhibitRotation], CGFloat v13 = v5, v15 = v11, v14))
  {
    id v15 = v13;
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue([v10 superlayer]);

  if (v16 != v15)
  {
    [v10 removeFromSuperlayer];
    [v15 addSublayer:v10];
  }

  -[BKDisplayAnnotationRenderer sizeLayerToFitAtScale:](self, "sizeLayerToFitAtScale:", v9);
  -[BKDisplayAnnotationRenderer locationDidChange](self, "locationDidChange");
}

- (BKDisplayAnnotation)annotation
{
  return (BKDisplayAnnotation *)objc_loadWeakRetained((id *)&self->_annotation);
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