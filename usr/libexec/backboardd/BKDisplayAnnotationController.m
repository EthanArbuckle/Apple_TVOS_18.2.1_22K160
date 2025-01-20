@interface BKDisplayAnnotationController
+ (id)annotationControllerForDisplay:(id)a3;
+ (void)performBlockForEveryAnnotationController:(id)a3;
- (CAContext)context;
- (CADisplay)display;
- (CALayer)referenceSpaceLayer;
- (CALayer)rootLayer;
- (CALayer)transformLayer;
- (id)_lock_supernodeForRenderingAtKeyPath:(id)a3;
- (id)allAnnotationsForKeyPath:(id)a3;
- (id)annotationForKeyPath:(id)a3;
- (void)_configureReferenceSpaceLayerTransformWithScale:(double)a3;
- (void)_lock_CATransaction:(id)a3;
- (void)_lock_invalidate;
- (void)_lock_locationDidChanges;
- (void)_lock_removeAnnotation:(id)a3;
- (void)_lock_setupLayerTree;
- (void)_lock_tearDownLayerTree;
- (void)_lock_updateLayerTree;
- (void)invalidate;
- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
- (void)performSynchronized:(id)a3;
- (void)performSynchronizedWithCATransaction:(id)a3;
- (void)removeAnnotationsForKeyPath:(id)a3;
- (void)removeAnnotationsForKeyPath:(id)a3 afterDelay:(double)a4 queue:(id)a5;
- (void)setAnnotation:(id)a3 forKeyPath:(id)a4;
- (void)setContext:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setReferenceSpaceLayer:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setTransformLayer:(id)a3;
@end

@implementation BKDisplayAnnotationController

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKDisplayAnnotationController _lock_invalidate](self, "_lock_invalidate");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidate
{
  displayObserver = self->_displayObserver;
  if (displayObserver)
  {
    -[BSInvalidatable invalidate](displayObserver, "invalidate");
    v4 = self->_displayObserver;
    self->_displayObserver = 0LL;

    -[BSInvalidatable invalidate](self->_orientationObserver, "invalidate");
    orientationObserver = self->_orientationObserver;
    self->_orientationObserver = 0LL;

    -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
  }

- (id)annotationForKeyPath:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_10004A514;
  v14 = sub_10004A524;
  id v15 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004AE20;
  v6[3] = &unk_1000B80D0;
  v9 = &v10;
  v7 = self;
  id v3 = a3;
  id v8 = v3;
  -[BKDisplayAnnotationController performSynchronized:](v7, "performSynchronized:", v6);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allAnnotationsForKeyPath:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004AD54;
  v8[3] = &unk_1000B7158;
  v9 = self;
  id v10 = a3;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v3;
  id v4 = v10;
  -[BKDisplayAnnotationController performSynchronized:](v9, "performSynchronized:", v8);
  v5 = v11;
  id v6 = v3;

  return v6;
}

- (void)setAnnotation:(id)a3 forKeyPath:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004ABD4;
  v8[3] = &unk_1000B7158;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:]( self,  "performSynchronizedWithCATransaction:",  v8);
}

- (void)removeAnnotationsForKeyPath:(id)a3
{
}

- (void)removeAnnotationsForKeyPath:(id)a3 afterDelay:(double)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10003F198();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remove %{public}@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004A6FC;
  v14[3] = &unk_1000B8140;
  v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:]( self,  "performSynchronizedWithCATransaction:",  v14);
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004A61C;
  v6[3] = &unk_1000B8058;
  void v6[4] = self;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:]( self,  "performSynchronizedWithCATransaction:",  v6,  a4,  a5,  a6);
}

- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4
{
  id v7 = a4;
  unsigned int v6 = [v7 displayId];
  if (v6 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    -[BKDisplayAnnotationController _lock_updateLayerTree](self, "_lock_updateLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4
{
  id v7 = a4;
  unsigned int v6 = [v7 displayId];
  if (v6 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    -[BKDisplayAnnotationController _lock_setupLayerTree](self, "_lock_setupLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4
{
  unsigned int v5 = objc_msgSend(a4, "displayId", a3);
  if (v5 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }

- (void)_lock_updateLayerTree
{
  id v3 = sub_10003F198();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "updateLayerTree", v5, 2u);
  }

  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
  -[BKDisplayAnnotationController _lock_setupLayerTree](self, "_lock_setupLayerTree");
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)_lock_setupLayerTree
{
  if (!self->_rootLayer)
  {
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    id v3 = self->_display;
    *(double *)&uint64_t v46 = 1.0;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](v3, "uniqueId"));
    int v5 = sub_1000194E4(v4);

    if (v5)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100019A3C;
      double v50 = COERCE_DOUBLE(&unk_1000B5E90);
      __int128 v51 = 0uLL;
      v52 = &v46;
      uint64_t v53 = 0LL;
      uint64_t v54 = 0LL;
      uint64_t v55 = 0LL;
      sub_1000196F4(buf);
      double v6 = *(double *)&v46;
    }

    else
    {
      double v6 = _BKSGetExternalDisplayScale(v3);
    }

    -[CADisplay bounds](self->_display, "bounds");
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = sub_10003F198();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      id v18 = [v17 length];
      id v19 = (void *)BKSDisplayUUIDMainKey;
      if (v18) {
        id v19 = v17;
      }
      double v20 = COERCE_DOUBLE(v19);

      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      double v50 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%p     scale (%g)    %@", buf, 0x20u);
    }

    id v21 = sub_10003F198();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      id v24 = [v23 length];
      v25 = (void *)BKSDisplayUUIDMainKey;
      if (v24) {
        v25 = v23;
      }
      id v26 = v25;

      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2048;
      double v50 = v14;
      LOWORD(v51) = 2112;
      *(void *)((char *)&v51 + 2) = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%p      root (%g,%g) %@", buf, 0x2Au);
    }

    id v27 = sub_10003F198();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      id v30 = [v29 length];
      v31 = (void *)BKSDisplayUUIDMainKey;
      if (v30) {
        v31 = v29;
      }
      id v32 = v31;

      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v12 / v6;
      *(_WORD *)&buf[22] = 2048;
      double v50 = v14 / v6;
      LOWORD(v51) = 2112;
      *(void *)((char *)&v51 + 2) = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%p transform (%g,%g) %@", buf, 0x2Au);
    }

    v33 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    rootLayer = self->_rootLayer;
    self->_rootLayer = v33;

    -[CALayer setName:](self->_rootLayer, "setName:", @"Root");
    -[CALayer setRasterizationScale:](self->_rootLayer, "setRasterizationScale:", v6);
    v35 = self->_rootLayer;
    CGAffineTransformMakeScale(&v45, v6, v6);
    -[CALayer setAffineTransform:](v35, "setAffineTransform:", &v45);
    v36 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    transformLayer = self->_transformLayer;
    self->_transformLayer = v36;

    -[CALayer setName:](self->_transformLayer, "setName:", @"Transform");
    -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_transformLayer);
    v38 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = v38;

    -[CALayer setName:](self->_referenceSpaceLayer, "setName:", @"ReferenceSpace");
    -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_referenceSpaceLayer);
    -[CALayer setFrame:](self->_rootLayer, "setFrame:", v8, v10, v12, v14);
    -[CALayer setFrame:](self->_transformLayer, "setFrame:", 0.0, 0.0, v12 / v6, v14 / v6);
    -[BKDisplayAnnotationController _configureReferenceSpaceLayerTransformWithScale:]( self,  "_configureReferenceSpaceLayerTransformWithScale:",  v6);
    v48[0] = &__kCFBooleanTrue;
    v47[0] = kCAContextDisplayable;
    v47[1] = kCAContextDisplayName;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay name](self->_display, "name"));
    v48[1] = v40;
    v48[2] = &__kCFBooleanTrue;
    v47[2] = kCAContextIgnoresHitTest;
    v47[3] = kCAContextSecure;
    v47[4] = kCAContextAllowsOcclusionDetectionOverride;
    v48[3] = &__kCFBooleanTrue;
    v48[4] = &__kCFBooleanTrue;
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  5LL));

    v42 = (CAContext *)objc_claimAutoreleasedReturnValue( +[CAContext remoteContextWithOptions:]( &OBJC_CLASS___CAContext,  "remoteContextWithOptions:",  v41));
    context = self->_context;
    self->_context = v42;

    LODWORD(v44) = 1173555200;
    -[CAContext setLevel:](self->_context, "setLevel:", v44);
    -[CAContext setSecure:](self->_context, "setSecure:", 1LL);
    -[CAContext setLayer:](self->_context, "setLayer:", self->_rootLayer);
    -[CALayer setDisableUpdateMask:]( self->_rootLayer,  "setDisableUpdateMask:",  -[CALayer disableUpdateMask](self->_rootLayer, "disableUpdateMask") | 0x20);
    +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    -[BKNamespaceNode enumerateNodesWithOptions:usingBlock:]( self->_rootNode,  "enumerateNodesWithOptions:usingBlock:",  1LL,  &stru_1000B7198);
  }

- (void)_lock_tearDownLayerTree
{
  rootLayer = self->_rootLayer;
  if (rootLayer)
  {
    self->_rootLayer = 0LL;

    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = 0LL;

    transformLayer = self->_transformLayer;
    self->_transformLayer = 0LL;

    -[CAContext invalidate](self->_context, "invalidate");
    context = self->_context;
    self->_context = 0LL;
  }

- (void)performSynchronized:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)performSynchronizedWithCATransaction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004A5B0;
  v6[3] = &unk_1000B71C0;
  id v7 = v4;
  id v5 = v4;
  -[BKDisplayAnnotationController _lock_CATransaction:](self, "_lock_CATransaction:", v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lock_supernodeForRenderingAtKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  double v13 = sub_10004A514;
  double v14 = sub_10004A524;
  id v15 = self->_rootNode;
  rootNode = self->_rootNode;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004A52C;
  v9[3] = &unk_1000B8280;
  v9[4] = &v10;
  id v6 =  -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:]( rootNode,  "enumerateKeyPathNodes:options:ifFound:ifMissing:",  v4,  1LL,  v9,  0LL);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_lock_CATransaction:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_assert_owner(p_lock);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  v4[2](v4);

  +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)_lock_removeAnnotation:(id)a3
{
  p_lock = &self->_lock;
  id v4 = a3;
  os_unfair_lock_assert_owner(p_lock);
  [v4 setAnnotationController:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 renderer]);

  [v5 didRemoveAnnotation];
}

- (void)_lock_locationDidChanges
{
}

- (void)_configureReferenceSpaceLayerTransformWithScale:(double)a3
{
  double a = CGAffineTransformIdentity.a;
  double b = CGAffineTransformIdentity.b;
  double c = CGAffineTransformIdentity.c;
  double d = CGAffineTransformIdentity.d;
  double tx = CGAffineTransformIdentity.tx;
  double ty = CGAffineTransformIdentity.ty;
  double v24 = 0.0;
  double v25 = 0.0;
  char v23 = 0;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
  sub_100019B10(v11, &v25, &v24, 0LL, &v23, 0LL);

  if (v23 == 1)
  {
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.double tx = tx;
    t1.double ty = ty;
    p_CGAffineTransform t2 = &t2;
  }

  else
  {
    if (v23 != 3)
    {
      double v13 = v24;
      double v14 = v25;
      goto LABEL_7;
    }

    CGAffineTransformMakeRotation(&v19, 1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.double tx = tx;
    t1.double ty = ty;
    p_CGAffineTransform t2 = &v19;
  }

  CGAffineTransformConcat(&v22, &t1, p_t2);
  double a = v22.a;
  double b = v22.b;
  double c = v22.c;
  double d = v22.d;
  double tx = v22.tx;
  double ty = v22.ty;
  double v14 = v24;
  double v13 = v25;
  double v24 = v25;
  double v25 = v14;
LABEL_7:
  double v15 = v14 / a3;
  referenceSpaceLayer = self->_referenceSpaceLayer;
  v18[0] = round(a);
  v18[1] = round(b);
  v18[2] = round(c);
  v18[3] = round(d);
  v18[4] = round(tx);
  v18[5] = round(ty);
  double v17 = v13 / a3;
  -[CALayer setAffineTransform:](referenceSpaceLayer, "setAffineTransform:", v18);
  -[CALayer setFrame:](self->_referenceSpaceLayer, "setFrame:", 0.0, 0.0, v15, v17);
}

- (CADisplay)display
{
  return self->_display;
}

- (void)setDisplay:(id)a3
{
}

- (CAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CALayer)transformLayer
{
  return self->_transformLayer;
}

- (void)setTransformLayer:(id)a3
{
}

- (CALayer)referenceSpaceLayer
{
  return self->_referenceSpaceLayer;
}

- (void)setReferenceSpaceLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)annotationControllerForDisplay:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002D9C8();
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  id v7 = v4;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v6 + 8));
    if (!*(void *)(v6 + 16))
    {
      double v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      double v9 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = v8;
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue([v7 uniqueId]);
    id v11 = [v10 length];
    uint64_t v12 = (void *)BKSDisplayUUIDMainKey;
    if (v11) {
      double v13 = v10;
    }
    else {
      double v13 = (void *)BKSDisplayUUIDMainKey;
    }
    id v14 = v13;

    double v15 = (BKDisplayAnnotationController *)objc_claimAutoreleasedReturnValue([*(id *)(v6 + 16) objectForKey:v14]);
    if (!v15)
    {
      double v15 = objc_alloc(&OBJC_CLASS___BKDisplayAnnotationController);
      id v16 = v7;
      id v17 = (id)v6;
      if (v15)
      {
        v45.receiver = v15;
        v45.super_class = (Class)&OBJC_CLASS___BKDisplayAnnotationController;
        id v18 = objc_msgSendSuper2(&v45, "init");
        double v15 = v18;
        if (v18)
        {
          v18->_lock._os_unfair_lock_opaque = 0;
          p_display = (id *)&v18->_display;
          objc_storeStrong((id *)&v18->_display, a3);
          objc_storeStrong((id *)&v15->_displayController, (id)v6);
          id displayController = v15->_displayController;
          if (displayController) {
            id displayController = objc_getProperty(displayController, v19, 24LL, 1);
          }
          id v21 = displayController;
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 addObserver:v15]);
          displayObserver = v15->_displayObserver;
          v15->_displayObserver = (BSInvalidatable *)v22;

          double v24 = objc_alloc_init(&OBJC_CLASS___BKNamespaceNode);
          rootNode = v15->_rootNode;
          v15->_rootNode = v24;

          -[BKNamespaceNode setName:](v15->_rootNode, "setName:", @"<root>");
          Properdouble ty = v15->_displayController;
          id v42 = v16;
          id v43 = v17;
          if (Property) {
            Properdouble ty = objc_getProperty(Property, v26, 24LL, 1);
          }
          id v28 = Property;
          id v29 = (id)objc_claimAutoreleasedReturnValue([*p_display uniqueId]);
          if ([v29 length]) {
            id v30 = v29;
          }
          else {
            id v30 = v12;
          }
          id v31 = v30;

          unsigned int v32 = [v28 displayUUIDIsActive:v31];
          if (v32)
          {
            os_unfair_lock_lock(&v15->_lock);
            -[BKDisplayAnnotationController _lock_setupLayerTree](v15, "_lock_setupLayerTree");
            os_unfair_lock_unlock(&v15->_lock);
          }

          if ([*p_display isExternal])
          {
            id v16 = v42;
            id v17 = v43;
          }

          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([*p_display uniqueId]);
            int v34 = sub_1000194E4(v33);

            id v17 = v43;
            if (v34)
            {
              id v35 = sub_100065B98();
              v36 = (id *)objc_claimAutoreleasedReturnValue(v35);
              v37 = sub_100067104(v36, v15);
              uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
              orientationObserver = v15->_orientationObserver;
              v15->_orientationObserver = (BSInvalidatable *)v38;
            }

            id v16 = v42;
          }
        }
      }

      [*(id *)(v6 + 16) setObject:v15 forKey:v14];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
    v40 = -[_BKDisplayAnnotationControllerReference initWithController:]( objc_alloc(&OBJC_CLASS____BKDisplayAnnotationControllerReference),  "initWithController:",  v15);
  }

  else
  {
    v40 = 0LL;
  }

  return v40;
}

+ (void)performBlockForEveryAnnotationController:(id)a3
{
  id v3 = a3;
  id v4 = sub_10002D9C8();
  id v7 = (id)objc_claimAutoreleasedReturnValue(v4);
  id v5 = v3;
  if (v7)
  {
    os_unfair_lock_assert_not_owner((os_unfair_lock_t)v7 + 2);
    os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
    id v6 = [*((id *)v7 + 2) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002DA34;
    v8[3] = &unk_1000B64F0;
    id v9 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

@end