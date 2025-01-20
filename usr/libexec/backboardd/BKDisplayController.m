@interface BKDisplayController
+ (BKDisplayController)sharedInstance;
- ($0604B0E56C0812A82398F92EB32460F7)transformLayerPropertiesForDisplay:(SEL)a3 displayInterfaceOrientation:(id)a4;
- ($389B5B6F3FE3DF5DBC41CE07E4C9444E)geometryForDisplayUUID:(SEL)a3;
- (BKDisplayController)init;
- (BOOL)contextIDAtCAScreenLocation:(CGPoint)a3 displayUUID:(id)a4 options:(id)a5 securityAnalysis:(id *)a6 results:(id *)a7;
- (BOOL)displayIsBlanked:(id)a3;
- (CGPoint)convertCAScreenLocation:(CGPoint)a3 toContextID:(unsigned int)a4 displayUUID:(id)a5;
- (CGPoint)convertReferenceLocation:(CGPoint)a3 toCAScreenLocationForDisplayUUID:(id)a4;
- (id)addDisplayBlankingObserver:(id)a3;
- (int64_t)hitTestCategoryForContextID:(unsigned int)a3;
- (unsigned)hostContextIDForEmbeddedContextID:(unsigned int)a3 displayUUID:(id)a4;
- (unsigned)taskPortForContextID:(unsigned int)a3 displayUUID:(id)a4;
- (void)applySceneHostSettingsToHostingChain:(id)a3;
- (void)removeSceneHostSettingsForContextID:(unsigned int)a3;
- (void)setSceneHostSettings:(id)a3;
- (void)setSceneHostSettings:(id)a3 forContextID:(unsigned int)a4;
@end

@implementation BKDisplayController

- (BKDisplayController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKDisplayController;
  v2 = -[BKDisplayController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lock_sceneHostSettingsByContextID = v3->_lock_sceneHostSettingsByContextID;
    v3->_lock_sceneHostSettingsByContextID = v4;
  }

  return v3;
}

- (BOOL)displayIsBlanked:(id)a3
{
  id v3 = sub_1000193D4(a3, (uint64_t)"BKDisplayIsDisplayBlanked");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = [v4 isBlanked];

  return v5;
}

- (id)addDisplayBlankingObserver:(id)a3
{
  id v5 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    objc_super v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:",  @"backboardd.display-blanking"));
    v8 = self->_observerAssertion;
    self->_observerAssertion = v7;

    observerAssertion = self->_observerAssertion;
  }

  id v9 = objc_msgSend((id)objc_opt_class(v5, v4), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( observerAssertion,  "acquireForReason:withContext:",  v10,  v5));

  return v11;
}

- (BOOL)contextIDAtCAScreenLocation:(CGPoint)a3 displayUUID:(id)a4 options:(id)a5 securityAnalysis:(id *)a6 results:(id *)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  *(_OWORD *)&a7->var0 = 0u;
  *(_OWORD *)&a7->var3 = 0u;
  *(_OWORD *)&a7->var5.m11 = 0u;
  *(_OWORD *)&a7->var5.m13 = 0u;
  *(_OWORD *)&a7->var5.m21 = 0u;
  *(_OWORD *)&a7->var5.m23 = 0u;
  *(_OWORD *)&a7->var5.m31 = 0u;
  *(_OWORD *)&a7->var5.m33 = 0u;
  *(_OWORD *)&a7->var5.m41 = 0u;
  *(_OWORD *)&a7->var5.m43 = 0u;
  *(_OWORD *)&a7->var6.m11 = 0u;
  *(_OWORD *)&a7->var6.m13 = 0u;
  *(_OWORD *)&a7->var6.m21 = 0u;
  *(_OWORD *)&a7->var6.m23 = 0u;
  *(_OWORD *)&a7->var6.m31 = 0u;
  *(_OWORD *)&a7->var6.m33 = 0u;
  *(_OWORD *)&a7->var6.m41 = 0u;
  *(_OWORD *)&a7->var6.m43 = 0u;
  *(_OWORD *)&a7->var7 = 0u;
  if (a6) {
    *a6 = 0LL;
  }
  id v14 = a5;
  id v15 = v13;
  if (self)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](&OBJC_CLASS___CAWindowServer, "serverIfRunning"));
    v17 = v16;
    if (v15)
    {
      v18 = (BKDisplayController *)objc_claimAutoreleasedReturnValue([v16 displayWithUniqueId:v15]);
    }

    else
    {
      id v19 = sub_1000195F8();
      v18 = (BKDisplayController *)objc_claimAutoreleasedReturnValue(v19);
    }

    self = v18;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayController hitTestAtPosition:options:](self, "hitTestAtPosition:options:", v14, x, y));
  if (!v20) {
    goto LABEL_71;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestContextId]);
  a7->var0 = [v21 unsignedIntValue];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestSlotId]);
  a7->var1 = [v22 unsignedIntValue];

  a7->var2 = sub_10001A890(a7->var0);
  if (a6)
  {
    id v102 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[BKSWindowServerHitTestSecurityAnalysis securityAnalysisFromCAHitTestDictionary:errorString:]( &OBJC_CLASS___BKSWindowServerHitTestSecurityAnalysis,  "securityAnalysisFromCAHitTestDictionary:errorString:",  v20,  &v102));
    id v24 = v102;
    *a6 = v23;
    if (v24)
    {
      uint64_t v25 = BKLogTouchEvents();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
    }
  }

  if (a7->var1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestDetectedOcclusion]);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber, v28);
    id v30 = v27;
    v31 = v30;
    if (v29)
    {
      if ((objc_opt_isKindOfClass(v30, v29) & 1) != 0) {
        v32 = v31;
      }
      else {
        v32 = 0LL;
      }
    }

    else
    {
      v32 = 0LL;
    }

    id v33 = v32;

    unsigned __int8 v34 = [v33 BOOLValue];
    a7->var7 = v34;
    a7->var3 = 0LL;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeOpacity]);
    uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSNumber, v36);
    id v38 = v35;
    v39 = v38;
    if (v37)
    {
      if ((objc_opt_isKindOfClass(v38, v37) & 1) != 0) {
        v40 = v39;
      }
      else {
        v40 = 0LL;
      }
    }

    else
    {
      v40 = 0LL;
    }

    id v41 = v40;

    if (v41)
    {
      [v41 floatValue];
      a7->var4 = v42;
      a7->var3 |= 2uLL;
    }

    v101 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeLayerTransform]);
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSValue, v44);
    id v46 = v43;
    v47 = v46;
    if (v45)
    {
      if ((objc_opt_isKindOfClass(v46, v45) & 1) != 0) {
        v48 = v47;
      }
      else {
        v48 = 0LL;
      }
    }

    else
    {
      v48 = 0LL;
    }

    id v49 = v48;

    if (v49)
    {
      [v49 CATransform3DValue];
      __int128 v50 = v108;
      *(_OWORD *)&a7->var5.m31 = v107;
      *(_OWORD *)&a7->var5.m33 = v50;
      __int128 v51 = v110;
      *(_OWORD *)&a7->var5.m41 = v109;
      *(_OWORD *)&a7->var5.m43 = v51;
      __int128 v52 = v104;
      *(_OWORD *)&a7->var5.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var5.m13 = v52;
      __int128 v53 = v106;
      *(_OWORD *)&a7->var5.m21 = v105;
      *(_OWORD *)&a7->var5.m23 = v53;
      a7->var3 |= 0x10uLL;
    }

    v100 = v49;
    v54 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestCumulativeContentsTransform]);
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSValue, v55);
    id v57 = v54;
    v58 = v57;
    if (v56)
    {
      if ((objc_opt_isKindOfClass(v57, v56) & 1) != 0) {
        v59 = v58;
      }
      else {
        v59 = 0LL;
      }
    }

    else
    {
      v59 = 0LL;
    }

    id v60 = v59;

    if (v60)
    {
      [v60 CATransform3DValue];
      __int128 v61 = v108;
      *(_OWORD *)&a7->var6.m31 = v107;
      *(_OWORD *)&a7->var6.m33 = v61;
      __int128 v62 = v110;
      *(_OWORD *)&a7->var6.m41 = v109;
      *(_OWORD *)&a7->var6.m43 = v62;
      __int128 v63 = v104;
      *(_OWORD *)&a7->var6.m11 = *(_OWORD *)buf;
      *(_OWORD *)&a7->var6.m13 = v63;
      __int128 v64 = v106;
      *(_OWORD *)&a7->var6.m21 = v105;
      *(_OWORD *)&a7->var6.m23 = v64;
      a7->var3 |= 0x20uLL;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", @"hitTestInsecureFiltered", v60));
    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSNumber, v66);
    id v68 = v65;
    v69 = v68;
    if (v67)
    {
      if ((objc_opt_isKindOfClass(v68, v67) & 1) != 0) {
        v70 = v69;
      }
      else {
        v70 = 0LL;
      }
    }

    else
    {
      v70 = 0LL;
    }

    id v71 = v70;

    if (v71)
    {
      a7->var8 = [v71 BOOLValue];
      a7->var3 |= 4uLL;
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kCAWindowServerHitTestLayerBackgroundAverage]);
    uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSNumber, v73);
    id v75 = v72;
    v76 = v75;
    if (v74)
    {
      if ((objc_opt_isKindOfClass(v75, v74) & 1) != 0) {
        v77 = v76;
      }
      else {
        v77 = 0LL;
      }
    }

    else
    {
      v77 = 0LL;
    }

    id v78 = v77;

    v79 = (void *)objc_claimAutoreleasedReturnValue( [v20 objectForKeyedSubscript:kCAWindowServerHitTestLayerBackgroundStandardDeviation]);
    uint64_t v81 = objc_opt_class(&OBJC_CLASS___NSNumber, v80);
    id v82 = v79;
    v83 = v82;
    v84 = self;
    if (v81)
    {
      if ((objc_opt_isKindOfClass(v82, v81) & 1) != 0) {
        v85 = v83;
      }
      else {
        v85 = 0LL;
      }
    }

    else
    {
      v85 = 0LL;
    }

    id v86 = v85;

    v87 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"hitTestBackgroundAverageContrastThreshold"]);
    uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSNumber, v88);
    id v90 = v87;
    v91 = v90;
    if (v89)
    {
      if ((objc_opt_isKindOfClass(v90, v89) & 1) != 0) {
        v92 = v91;
      }
      else {
        v92 = 0LL;
      }
    }

    else
    {
      v92 = 0LL;
    }

    id v93 = v92;

    if (v78 && v86 && v93)
    {
      [v78 floatValue];
      a7->var9 = v94;
      [v86 floatValue];
      a7->var10 = v95;
      [v93 floatValue];
      a7->var11 = v96;
      a7->var3 |= 8uLL;
    }

    self = v84;
  }

  if (a7->var0 && a7->var2 + 1 > 1)
  {
    BOOL v97 = 1;
  }

  else
  {
LABEL_71:
    BOOL v97 = 0;
    a7->var0 = 0;
  }

  return v97;
}

- (CGPoint)convertReferenceLocation:(CGPoint)a3 toCAScreenLocationForDisplayUUID:(id)a4
{
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertCAScreenLocation:(CGPoint)a3 toContextID:(unsigned int)a4 displayUUID:(id)a5
{
  if (self)
  {
    double v5 = sub_10001A824(*(uint64_t *)&a4, a5, a3.x, a3.y);
  }

  else
  {
    double v6 = 0.0;
    double v5 = 0.0;
  }

  result.double y = v6;
  result.double x = v5;
  return result;
}

- (unsigned)hostContextIDForEmbeddedContextID:(unsigned int)a3 displayUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](&OBJC_CLASS___CAWindowServer, "serverIfRunning", *(void *)&a3, a4));
  LODWORD(v4) = [v5 contextIdHostingContextId:v4];

  return v4;
}

- (int64_t)hitTestCategoryForContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = sub_10002D41C();
  double v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(v5 + 4);
    objc_super v7 = *(void **)&v6[6]._os_unfair_lock_opaque;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
      id v10 = [v9 integerValue];
    }

    else
    {
      id v10 = 0LL;
    }

    os_unfair_lock_unlock(v6 + 4);
  }

  else
  {
    id v10 = 0LL;
  }

  return (int64_t)v10;
}

- (unsigned)taskPortForContextID:(unsigned int)a3 displayUUID:(id)a4
{
  return sub_10001A890(*(uint64_t *)&a3);
}

- (void)setSceneHostSettings:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = BKLogTouchEvents();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "setSceneHostSettings: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  objc_super v7 = (NSMutableDictionary *)[v4 mutableCopy];
  lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
  self->_lock_sceneHostSettingsByContextID = v7;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSceneHostSettings:(id)a3 forContextID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = BKLogTouchEvents();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "setSceneHostSettingsForContextID:%X %{public}@",  (uint8_t *)v10,  0x12u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lock_sceneHostSettingsByContextID,  "setObject:forKeyedSubscript:",  v6,  v9);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeSceneHostSettingsForContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = BKLogTouchEvents(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "removeSceneHostSettingsForContextID:%X",  (uint8_t *)v8,  8u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_lock_sceneHostSettingsByContextID, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)applySceneHostSettingsToHostingChain:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v19 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 reverseObjectEnumerator]);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v10);
        lock_sceneHostSettingsByContextID = self->_lock_sceneHostSettingsByContextID;
        if (v11) {
          uint64_t v13 = *(unsigned int *)(v11 + 8);
        }
        else {
          uint64_t v13 = 0LL;
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13, lock));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( lock_sceneHostSettingsByContextID,  "objectForKeyedSubscript:",  v14));

        if (v15)
        {
          id v16 = v15;

          v8 = v16;
        }

        if (v11) {
          objc_storeStrong((id *)(v11 + 16), v8);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v17 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v7 = v17;
    }

    while (v17);
  }

  else
  {
    v8 = 0LL;
  }

  os_unfair_lock_unlock(lock);
}

- ($389B5B6F3FE3DF5DBC41CE07E4C9444E)geometryForDisplayUUID:(SEL)a3
{
  id v5 = a4;
  retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var3.origin = 0u;
  retstr->var3.size = 0u;
  id v6 = v5;
  id v10 = v6;
  if (!v6
    || (unsigned int v7 = [v6 isEqualToString:BKSDisplayUUIDMainKey], v10, v8 = v10, v7))
  {
    v8 = 0LL;
  }

  sub_100019B10(v8, retstr, &retstr->var0.height, &retstr->var1, &retstr->var2, (uint64_t)&retstr->var3);

  return result;
}

- ($0604B0E56C0812A82398F92EB32460F7)transformLayerPropertiesForDisplay:(SEL)a3 displayInterfaceOrientation:(id)a4
{
  double a = CGAffineTransformIdentity.a;
  double b = CGAffineTransformIdentity.b;
  double c = CGAffineTransformIdentity.c;
  double d = CGAffineTransformIdentity.d;
  tdouble x = CGAffineTransformIdentity.tx;
  tdouble y = CGAffineTransformIdentity.ty;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a4 uniqueId]);
  -[BKDisplayController geometryForDisplayUUID:](self, "geometryForDisplayUUID:", v14);

  float64x2_t v16 = v31;
  uint64_t v23 = v32;
  if (v33 == 3)
  {
    float64x2_t v20 = v31;
    CGAffineTransformMakeRotation(&t2, 1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.tdouble x = tx;
    t1.tdouble y = ty;
    p_CGAffineTransform t2 = &t2;
  }

  else
  {
    if (v33 != 1) {
      goto LABEL_6;
    }
    float64x2_t v20 = v31;
    CGAffineTransformMakeRotation(&v29, -1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.tdouble x = tx;
    t1.tdouble y = ty;
    p_CGAffineTransform t2 = &v29;
  }

  CGPoint result = ($0604B0E56C0812A82398F92EB32460F7 *)CGAffineTransformConcat(&v30, &t1, p_t2);
  float64x2_t v16 = v20;
  double a = v30.a;
  double b = v30.b;
  double c = v30.c;
  double d = v30.d;
  tdouble x = v30.tx;
  tdouble y = v30.ty;
LABEL_6:
  int8x16_t v18 = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  switch(a5)
  {
    case 4LL:
      float64x2_t v22 = (float64x2_t)v18;
      CGAffineTransformMakeRotation(&v24, -1.57079633);
      t1.double a = a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      id v19 = &v24;
LABEL_12:
      CGPoint result = ($0604B0E56C0812A82398F92EB32460F7 *)CGAffineTransformConcat(&v30, &t1, v19);
      double a = v30.a;
      double b = v30.b;
      double c = v30.c;
      double d = v30.d;
      float64x2_t v16 = v22;
      goto LABEL_13;
    case 3LL:
      float64x2_t v22 = (float64x2_t)v18;
      CGAffineTransformMakeRotation(&v25, 1.57079633);
      t1.double a = a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      id v19 = &v25;
      goto LABEL_12;
    case 2LL:
      float64x2_t v21 = v16;
      CGAffineTransformMakeRotation(&v26, -3.14159265);
      t1.double a = a;
      t1.double b = b;
      t1.double c = c;
      t1.double d = d;
      t1.tdouble x = tx;
      t1.tdouble y = ty;
      CGPoint result = ($0604B0E56C0812A82398F92EB32460F7 *)CGAffineTransformConcat(&v30, &t1, &v26);
      float64x2_t v16 = v21;
      double a = v30.a;
      double b = v30.b;
      double c = v30.c;
      double d = v30.d;
LABEL_13:
      tdouble x = v30.tx;
      tdouble y = v30.ty;
      break;
  }

  retstr->var0.double a = round(a);
  retstr->var0.double b = round(b);
  retstr->var0.double c = round(c);
  retstr->var0.double d = round(d);
  retstr->var0.tdouble x = round(tx);
  retstr->var0.tdouble y = round(ty);
  retstr->var1.origin.double x = 0.0;
  retstr->var1.origin.double y = 0.0;
  retstr->var1.size = (CGSize)vdivq_f64(v16, (float64x2_t)vdupq_lane_s64(v23, 0));
  return result;
}

- (void).cxx_destruct
{
}

+ (BKDisplayController)sharedInstance
{
  if (qword_1000DBEE0 != -1) {
    dispatch_once(&qword_1000DBEE0, &stru_1000B55D0);
  }
  return (BKDisplayController *)(id)qword_1000DBEE8;
}

@end