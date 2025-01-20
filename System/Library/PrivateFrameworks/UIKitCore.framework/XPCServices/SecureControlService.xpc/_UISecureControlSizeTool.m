@interface _UISecureControlSizeTool
- (_UISecureControlSizeTool)init;
- (id)_drawingPlanForSizeSpec:(id)a3;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (void)getIntrinsicContentSizeForSpec:(id)a3 reply:(id)a4;
@end

@implementation _UISecureControlSizeTool

- (_UISecureControlSizeTool)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____UISecureControlSizeTool;
  v2 = -[_UISecureControlSizeTool init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_sizeSpecDrawingPlansLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sizeSpecDrawingPlans = v3->_sizeSpecDrawingPlans;
    v3->_sizeSpecDrawingPlans = v4;

    v6 = -[UISLRUCache initWithLimit:](objc_alloc(&OBJC_CLASS___UISLRUCache), "initWithLimit:", 10LL);
    sizeSpecLRUCache = v3->_sizeSpecLRUCache;
    v3->_sizeSpecLRUCache = v6;
  }

  return v3;
}

- (id)_drawingPlanForSizeSpec:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_sizeSpecDrawingPlansLock);
  v5 = (_UISecureControlDrawingPlan *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sizeSpecDrawingPlans,  "objectForKeyedSubscript:",  v4));
  os_unfair_lock_unlock(&self->_sizeSpecDrawingPlansLock);
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
    v7 = objc_alloc(&OBJC_CLASS____UISecureControlDrawingPlan);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
    id v9 = [v4 arrangeVertically];
    id v10 = [v6 secureNameForDrawing];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 iconGlyph]);
    v5 = -[_UISecureControlDrawingPlan initWithSlotStyle:arrangeVertically:secureName:iconGlyph:]( v7,  "initWithSlotStyle:arrangeVertically:secureName:iconGlyph:",  v8,  v9,  v10,  v11);

    os_unfair_lock_lock(&self->_sizeSpecDrawingPlansLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sizeSpecDrawingPlans,  "setObject:forKeyedSubscript:",  v5,  v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[UISLRUCache evictedObjectForUsedObject:]( self->_sizeSpecLRUCache,  "evictedObjectForUsedObject:",  v4));
    if (v12) {
      -[NSMutableDictionary removeObjectForKey:](self->_sizeSpecDrawingPlans, "removeObjectForKey:", v12);
    }
    os_unfair_lock_unlock(&self->_sizeSpecDrawingPlansLock);
  }

  return v5;
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_UISSecureControlSizeSpec specWithStyle:tag:]( &OBJC_CLASS____UISSecureControlSizeSpec,  "specWithStyle:tag:",  v7,  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UISecureControlSizeTool _drawingPlanForSizeSpec:](self, "_drawingPlanForSizeSpec:", v9));

  [v8 size];
  double v12 = v11;
  double v14 = v13;
  [v10 minimumContentSize];
  if (v12 < v16 || v14 < v15)
  {
    v18 = 0LL;
  }

  else
  {
    v19 = (CGColor *)[v8 baseForegroundColor];
    ConstantColor = v19;
    if (!v19) {
      ConstantColor = CGColorGetConstantColor(kCGColorWhite);
    }
    v21 = (CGColor *)[v8 baseBackgroundColor];
    if (!v21) {
      v21 = (CGColor *)[v7 tintColor];
    }
    double v22 = UISColorLuminance(ConstantColor);
    double v23 = UISColorLuminance(v21);
    double v24 = v23;
    if (v22 < v23) {
      double v25 = v22;
    }
    else {
      double v25 = v23;
    }
    if (v22 >= v23) {
      double v23 = v22;
    }
    if ((v23 + 0.05) / (v25 + 0.05) >= 3.0)
    {
      CopyWithAlpha = CGColorCreateCopyWithAlpha(ConstantColor, 1.0);
      v28 = CGColorCreateCopyWithAlpha(v21, 1.0);
    }

    else
    {
      if (v22 < v24) {
        v26 = v21;
      }
      else {
        v26 = ConstantColor;
      }
      if (v22 >= v24) {
        ConstantColor = v21;
      }
      double v27 = 0.9 / (v25 * 3.0 - v23 + 1.0);
      v28 = (CGColor *)UISCreateColorWithLuminance(v26, v23 * v27 + 1.0 - v27, 1.0);
      uint64_t v29 = UISCreateColorWithLuminance(ConstantColor, v25 * v27, 1.0);
      if (v22 < v24) {
        CopyWithAlpha = (CGColor *)v29;
      }
      else {
        CopyWithAlpha = v28;
      }
      if (v22 >= v24) {
        v28 = (CGColor *)v29;
      }
    }

    v31 = objc_alloc(&OBJC_CLASS____UISecureControlDrawing);
    id v32 = [v8 cornerStyle];
    [v8 cornerRadius];
    v18 = -[_UISecureControlDrawing initWithDrawingPlan:cornerStyle:cornerRadius:foregroundColor:backgroundColor:imagePlacement:leftToRight:size:]( v31,  "initWithDrawingPlan:cornerStyle:cornerRadius:foregroundColor:backgroundColor:imagePlacement:leftToRight:size:",  v10,  v32,  CopyWithAlpha,  v28,  [v8 imagePlacement],  objc_msgSend(v7, "layoutDirection") == 0,  v33,  v12,  v14);
    CGColorRelease(CopyWithAlpha);
    CGColorRelease(v28);
  }

  return v18;
}

- (void)getIntrinsicContentSizeForSpec:(id)a3 reply:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 category]);
  unsigned __int8 v8 = [v7 isValid];

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UISecureControlSizeTool _drawingPlanForSizeSpec:](self, "_drawingPlanForSizeSpec:", v10));
    [v9 intrinsicContentSize];
    v6[2](v6);
  }

  else
  {
    ((void (*)(void (**)(void), CGFloat, CGFloat))v6[2])( v6,  CGSizeZero.width,  CGSizeZero.height);
  }
}

- (void).cxx_destruct
{
}

@end