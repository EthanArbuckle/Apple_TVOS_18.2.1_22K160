@interface BKDisplayCloneMirroringManager
- (BKDisplayCloneMirroringManager)initWithDisplayProvider:(id)a3;
- (id)_lock_cloneMirroringOptionsFromSourceDisplay:(id)a3 destinationDisplay:(id)a4 virtualMode:(id)a5 isStevenote:(BOOL *)a6;
- (id)_lock_cloneMirroringOptionsSteveNote:(BOOL)a3 contextIDs:(id)a4;
- (id)_lock_virtualDisplayModeFromClientParametersForDisplay:(id)a3 shouldHide:(BOOL *)a4 shouldDisable:(BOOL *)a5;
- (void)_lock_clearWindowServerDisplayTags:(id)a3;
- (void)_lock_evaluateAllDisplaysForReason:(id)a3;
- (void)_lock_evaluateConnectedDisplay:(id)a3 because:(id)a4;
- (void)_lock_evaluateContinuityDisplay:(id)a3 label:(id)a4;
- (void)_lock_evaluateDisplay:(id)a3 reason:(id)a4;
- (void)_lock_evaluateExistingClonesForReason:(id)a3;
- (void)_lock_recomputeTagsForDisplay:(id)a3 shouldHide:(BOOL)a4;
- (void)_lock_removeClone:(id)a3 fromWindowServerDisplay:(id)a4;
- (void)_lock_removeDisplayCloneDestination:(id)a3;
- (void)_lock_setupCloningToDestination:(id)a3 fromVirtualMode:(id)a4 hideByDefault:(BOOL)a5;
- (void)addModeRequest:(unint64_t)a3 forDisplay:(id)a4 clientPID:(int)a5;
- (void)cloneMirroringRequestsDidChange;
- (void)evaluateDisplay:(id)a3 reason:(id)a4;
- (void)removeDisplay:(id)a3;
- (void)removeModeRequestForDisplay:(id)a3 clientPID:(int)a4;
- (void)setCloneRotationDisabled:(BOOL)a3;
@end

@implementation BKDisplayCloneMirroringManager

- (BKDisplayCloneMirroringManager)initWithDisplayProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = [BKDisplayCloneMirroringManager class];
  BKDisplayCloneMirroringManager *v6 = [[BKDisplayCloneMirroringManager alloc] init];
  v7 = v6;
  if (v6)
  {
    [v6 setDisplayProvider:a3];
    BKDisplayCloneMirrorRequestCache *v8 = [[BKDisplayCloneMirrorRequestCache alloc] init];
    lock_cloneMirrorRequests = v7->_lock_cloneMirrorRequests;
    v7->_lock_cloneMirrorRequests = v8;

    v10 = v7->_lock_cloneMirrorRequests;
    if (v10) {
      v10.delegate = v7;
    }
    NSMutableDictionary *v11 = [[NSMutableDictionary alloc] init];
    lock_destinationDisplayIdentifierToCloneRecord = v7->_lock_destinationDisplayIdentifierToCloneRecord;
    v7->_lock_destinationDisplayIdentifierToCloneRecord = v11;
  }

  return v7;
}

- (void)_lock_evaluateContinuityDisplay:(id)a3 label:(id)a4
{
  id v4 = a4;
  uint64_t v5 = BKLogDisplay();
  v6 = (os_log_s *)[v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Display label %{public}@ unsupported on this platform",  (uint8_t *)&v7,  0xCu);
  }
}

- (id)_lock_cloneMirroringOptionsFromSourceDisplay:(id)a3 destinationDisplay:(id)a4 virtualMode:(id)a5 isStevenote:(BOOL *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[v10 objectForKey:@"ContextIDs"];
  uint64_t v15 = [NSArray class];
  id v16 = v13;
  v17 = v16;
  if (v15)
  {
    if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0) {
      v18 = v17;
    }
    else {
      v18 = 0LL;
    }
  }

  else
  {
    v18 = 0LL;
  }

  id v19 = v18;

  id obj = a4;
  if (v19) {
    v20 = [NSSet setWithArray:v19];
  }
  else {
    v20 = 0LL;
  }
  v21 = [v10 objectForKey:@"DisplayLabel"];
  NSString *v23 = [NSString class];
  id v24 = v21;
  v25 = v24;
  if (v23)
  {
    if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0) {
      v26 = v25;
    }
    else {
      v26 = 0LL;
    }
  }

  else
  {
    v26 = 0LL;
  }

  id v27 = v26;

  id v28 = [v27 isEqual:@"Stevenote"];
  *a6 = (char)v28;
  v29 = [BKDisplayCloneMirroringManager _lock_cloneMirroringOptionsSteveNote:v28 contextIDs:v20];
  v30 = (void *)[v10 objectForKey:@"ClientPID"];
  unsigned int v31 = [v30 intValue];

  BKDisplayCloneRecord *v32 = [[BKDisplayCloneRecord alloc] init];
  id v33 = v12;
  id v34 = v11;
  id v35 = v29;
  if (v32)
  {
    v39.receiver = v32;
    v39.super_class = [BKDisplayCloneRecord class];
    BKDisplayCloneMirroringManager *v36 = [[BKDisplayCloneMirroringManager alloc] init];
    v32 = (BKDisplayCloneRecord *)v36;
    if (v36)
    {
      objc_storeStrong((id *)v36 + 2, a3);
      v32->_destinationDisplay = obj;
      v32->_clientPID = v31;
      v32->_options = v29;
    }
  }

  return v32;
}

- (void)_lock_setupCloningToDestination:(id)a3 fromVirtualMode:(id)a4 hideByDefault:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectForKey:@"MirroredDisplayID"];
  uint64_t v12 = [NSNumber class];
  id v13 = v10;
  uint64_t v14 = v13;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = v15;

  if (v16)
  {
    id v18 = [v16 integerValue];
    uint64_t v19 = BKLogDisplay(v18);
    os_log_s *v20 = v19;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v63 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "mirroring source display is %{public}@",  buf,  0xCu);
    }

    uint64_t v21 = [self->_displayProvider windowServerDisplayForDisplayIdentifier:v18];
    id v22 = (id)v21;
    if (v21) {
      goto LABEL_10;
    }
LABEL_18:
    uint64_t v30 = BKLogDisplay(v21);
    os_log_s *v24 = v30;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    unsigned int v31 = "specified source display does not exist";
    v32 = v24;
    uint32_t v33 = 2;
LABEL_22:
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    goto LABEL_44;
  }

  uint64_t v27 = BKLogDisplay(v17);
  os_log_s *v28 = v27;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v63 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "no mirroring source display specified for %{public}@; assuming main",
      buf,
      0xCu);
  }

  v29 = [BKDisplayCloneMirroringManagerInformationProvider windowServerDisplays];
  id v22 = [v29 firstObject];

  if (!v22) {
    goto LABEL_18;
  }
LABEL_10:
  if (v22 == v8)
  {
    uint64_t v34 = BKLogDisplay(v21);
    os_log_s *v24 = v34;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138543362;
    id v63 = v8;
    unsigned int v31 = "cannot clone display to itself: %{public}@";
    v32 = v24;
    uint32_t v33 = 12;
    goto LABEL_22;
  }

  uint64_t v23 = [v22 cloneMaster];
  if (!v23)
  {
    char v61 = 0;
    uint64_t v35 = [BKDisplayCloneMirroringManager _lock_cloneMirroringOptionsFromSourceDisplay:v22 destinationDisplay:v8 virtualMode:v9 isStevenote:&v61];
    unsigned int v36 = [v8 displayId];
    lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
    unsigned int v60 = v36;
    v38 = [NSNumber numberWithUnsignedInt:];
    NSMutableDictionary *v39 = [lock_destinationDisplayIdentifierToCloneRecord objectForKey:v38];

    if (v39)
    {
      uint64_t v40 = BSEqualObjects(v35, v39);
      char v41 = v40;
      uint64_t v42 = BKLogDisplay(v40);
      v43 = [os_log logWithName:v42];
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if ((v41 & 1) != 0)
      {
        if (v44)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "clone settings did not change; no-op",
            buf,
            2u);
        }

LABEL_43:
        id v24 = 0LL;
        goto LABEL_44;
      }

      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "clone settings changed; removing previous clone",
          buf,
          2u);
      }

      v50 = (void *)v39[2];
    }

    else
    {
      v45 = [v22 clones];
      unsigned int v46 = [v45 containsObject:v8];

      if (!v46)
      {
LABEL_36:
        uint64_t v51 = BKLogDisplay(v47);
        v52 = [os_log logWithName:@"com.apple.Bluetooth.Event.HID"];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v63 = v22;
          __int16 v64 = 2114;
          v65 = (os_log_s *)v8;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "cloning %{public}@ to %{public}@",  buf,  0x16u);
        }

        if (v35) {
          uint64_t v53 = *(void *)(v35 + 32);
        }
        else {
          uint64_t v53 = 0LL;
        }
        [v22 addClone:v8 options:v53];
        v54 = [v8 name];
        unsigned int v55 = [v54 isEqualToString:@"TVOut"];

        uint64_t v56 = ((v61 == 0) | ~v55) & v5;
        v57 = self->_lock_destinationDisplayIdentifierToCloneRecord;
        v58 = [NSNumber numberWithUnsignedInt:v60];
        [v57 setObject:v35 forKey:v58];

        if (v35) {
          uint64_t v59 = *(unsigned int *)(v35 + 8);
        }
        else {
          uint64_t v59 = 0LL;
        }
        [v8 setProcessId:v59];
        [self _lock_recomputeTagsForDisplay:v8 shouldHide:v56];
        goto LABEL_43;
      }

      uint64_t v48 = BKLogDisplay(v47);
      v49 = v48;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v63 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "no record, but source display is already cloned to %{public}@ -- will remove and reapply with current settings , which may result in flicker",  buf,  0xCu);
      }

      v50 = v22;
    }

    id v47 = [v50 removeClone:v8];
    goto LABEL_36;
  }

  id v24 = (os_log_s *)v23;
  uint64_t v25 = BKLogDisplay(v23);
  os_log_s *v26 = v25;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v63 = v22;
    __int16 v64 = 2114;
    v65 = v24;
    _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "source display:%{public}@ is a clone of display:%{public}@; cannot clone a clone",
      buf,
      0x16u);
  }

LABEL_44:
}

- (void)_lock_evaluateConnectedDisplay:(id)a3 because:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 virtualDisplayMode];
  id v9 = [v8 objectForKey:@"MirroringMode"];
  NSNumber *v11 = [NSNumber class];
  id v12 = v9;
  id v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  id v15 = v14;

  unsigned int v16 = [v15 intValue];
  uint64_t v17 = (void *)[v6 uniqueId];
  uint64_t v18 = BKLogDisplay(v17);
  uint64_t v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v36 = v7;
    __int16 v37 = 2114;
    v38 = v17;
    __int16 v39 = 2114;
    uint64_t v40 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "evaluateDisplay(%{public}@) incoming virtual display mode(%{public}@): %{public}@",  buf,  0x20u);
  }

  if (v16 - 1 >= 2)
  {
    if (v16 == 3)
    {
      [self _lock_removeDisplayCloneDestination:v6];
      [self _lock_clearWindowServerDisplayTags:v6];
      v20 = [v8 objectForKey:@"DisplayLabel"];
      NSString *v22 = [NSString class];
      id v23 = v20;
      id v24 = v23;
      if (v22)
      {
        if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0LL;
        }
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      id v26 = v25;

      if ([v26 isEqual:@"Continuity"])
      {
        [v6 setProcessId:0];
        -[BKDisplayCloneMirroringManager _lock_evaluateContinuityDisplay:label:]( self,  "_lock_evaluateContinuityDisplay:label:",  v6,  v26);
        goto LABEL_25;
      }

      if ([v26 hasPrefix:@"CarPlay"])
      {
        [v6 setProcessId:0];
        [self _lock_evaluateCarPlayDisplay:v6 label:v26];
        goto LABEL_25;
      }

      v29 = [v8 objectForKey:@"ClientPID"];
      id v30 = [v29 intValue];

      id v31 = [v6 processId];
      if ((_DWORD)v30 == (_DWORD)v31)
      {
LABEL_18:
        -[BKDisplayCloneMirroringManager _lock_recomputeTagsForDisplay:shouldHide:]( self,  "_lock_recomputeTagsForDisplay:shouldHide:",  v6,  0LL);
LABEL_25:

        goto LABEL_26;
      }

      uint64_t v32 = BKLogDisplay(v31);
      uint32_t v33 = [v32 autorelease];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v36 = v6;
        __int16 v37 = 1024;
        LODWORD(v38) = (_DWORD)v30;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "setting %{public}@ processID to %d",  buf,  0x12u);
      }

      uint64_t v27 = v6;
      id v28 = v30;
    }

    else
    {
      buf[0] = 0;
      char v34 = 0;
      id v26 = [BKDisplayCloneMirroringManager _lock_virtualDisplayModeFromClientParametersForDisplay:v6 shouldHide:buf shouldDisable:&v34];
      if (!v34)
      {
        [self _lock_setupCloningToDestination:v6 fromVirtualMode:v26 hideByDefault:buf[0]];
        goto LABEL_25;
      }

      [self _lock_removeDisplayCloneDestination:v6];
      uint64_t v27 = v6;
      id v28 = 0LL;
    }

    [v27 setProcessId:v28];
    goto LABEL_18;
  }

  [self _lock_setupCloningToDestination:v6 fromVirtualMode:v8 hideByDefault:YES];
LABEL_26:
}

- (id)_lock_cloneMirroringOptionsSteveNote:(BOOL)a3 contextIDs:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BKSDefaults *v7 = [BKSDefaults localDefaults];
  id v8 = [NSNumber numberWithBool:self->_lock_cloneRotationDisabled];
  NSMutableDictionary *v9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:v8, kCAWindowServerClone_DisableRotation, 0LL];

  id v10 = [v7 disableCAOverscan];
  id v11 = v10;
  if (v4 || (_DWORD)v10)
  {
    id v12 = [NSNumber numberWithBool:v11];
    [v9 setObject:v12 forKey:kCAWindowServerClone_DisableOverscan];
  }

  if (objc_msgSend(v7, "disableCAScaling", v11))
  {
    id v13 = [NSNumber numberWithBool:YES];
    [v9 setObject:v13 forKey:kCAWindowServerClone_DisableScaling];
  }

  unsigned int v14 = [v7 disableCAYUV];
  if (v4 || v14)
  {
    id v15 = [NSNumber numberWithBool:YES];
    [v9 setObject:v15 forKey:kCAWindowServerClone_DisableYUV];
  }

  if ([v6 count]) {
    [v9 setObject:v6 forKey:kCAWindowServerClone_ReplayContexts];
  }

  return v9;
}

- (id)_lock_virtualDisplayModeFromClientParametersForDisplay:(id)a3 shouldHide:(BOOL *)a4 shouldDisable:(BOOL *)a5
{
  id v9 = a3;
  if (!v9)
  {
    CAWindowServerDisplay *v32 = [CAWindowServerDisplay class];
    uint32_t v33 = NSStringFromClass(v32);
    char v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v35 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v34];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v36 = NSStringFromSelector(a2);
      BKDisplayCloneMirrorRequestCache *v37 = [v36 autorelease];
      __int16 v39 = (objc_class *)[self class];
      uint64_t v40 = NSStringFromClass(v39);
      char v41 = [v40 autorelease];
      *(_DWORD *)buf = 138544642;
      v58 = v37;
      __int16 v59 = 2114;
      unsigned int v60 = v41;
      __int16 v61 = 2048;
      v62 = self;
      __int16 v63 = 2114;
      __int16 v64 = @"BKDisplayCloneMirroringManager.m";
      __int16 v65 = 1024;
      int v66 = 330;
      __int16 v67 = 2114;
      v68 = v35;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v35 UTF8String]);
    __break(0);
    JUMPOUT(0x100047E38LL);
  }

  id v11 = v9;
  CAWindowServerDisplay *v12 = [CAWindowServerDisplay class];
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    uint64_t v42 = (objc_class *)[v11 classForCoder];
    if (!v42) {
      uint64_t v42 = (objc_class *)v11;
    }
    BOOL v44 = NSStringFromClass(v42);
    v45 = v44;
    CAWindowServerDisplay *v47 = [CAWindowServerDisplay class];
    uint64_t v48 = NSStringFromClass(v47);
    v49 = [v48 autorelease];
    v50 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@." display:v45 class:v49 expectedClass:v49];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = NSStringFromSelector(a2);
      v52 = [v51 autorelease];
      v54 = [self class];
      unsigned int v55 = NSStringFromClass(v54);
      uint64_t v56 = v55;
      *(_DWORD *)buf = 138544642;
      v58 = v52;
      __int16 v59 = 2114;
      unsigned int v60 = v56;
      __int16 v61 = 2048;
      v62 = self;
      __int16 v63 = 2114;
      __int16 v64 = @"BKDisplayCloneMirroringManager.m";
      __int16 v65 = 1024;
      int v66 = 330;
      __int16 v67 = 2114;
      v68 = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v50 UTF8String]);
    __break(0);
    JUMPOUT(0x100047F74LL);
  }

  NSMutableDictionary *v13 = [[NSMutableDictionary alloc] init];
  unsigned int v14 = (BKDisplayCloneMirrorRequestCache *)[v11 virtualDisplayMode];
  id v15 = v14;
  if (v14)
  {
    unsigned int v16 = [BKDisplayCloneMirrorRequestCache objectForKey:@"DisplayLabel"];
    if (v16)
    {
      [v13 setObject:v16 forKey:@"DisplayLabel"];
    }

    else
    {
      uint64_t v17 = BKLogDisplay(0LL);
      uint64_t v18 = v17;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v58 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "no label for mode: %{public}@",  buf,  0xCu);
      }
    }
  }

  uint64_t v19 = (void *)[v11 uniqueId];
  v20 = v19;
  lock_cloneMirrorRequests = self->_lock_cloneMirrorRequests;
  if (!lock_cloneMirrorRequests) {
    goto LABEL_34;
  }
  p_lock = &lock_cloneMirrorRequests->_lock;
  id v23 = v19;
  os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
  lock_cloneMirrorRequests = [lock_cloneMirrorRequests->_displayUUIDToModeRequest objectForKey:v23];

  if (!lock_cloneMirrorRequests)
  {
    BKDisplayCloneMirrorRequestClient *self;
    if (qword_1000DBFD0 != -1) {
      dispatch_once(&qword_1000DBFD0, &stru_1000B6348);
    }
    lock_cloneMirrorRequests = (BKDisplayCloneMirrorRequestCache *)(id)qword_1000DBFC8;
  }

  os_unfair_lock_unlock(p_lock);
  if (lock_cloneMirrorRequests) {
    displayUUIDToModeRequest = lock_cloneMirrorRequests->_displayUUIDToModeRequest;
  }
  else {
LABEL_34:
  }
    displayUUIDToModeRequest = 0LL;
  uint64_t v25 = BKLogDisplay(v19);
  id v26 = [v25 autorelease];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = lock_cloneMirrorRequests;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Prevailing clone mirror mode: %{public}@ ",  buf,  0xCu);
  }

  uint64_t v27 = [BKSDefaults localDefaults];
  unsigned __int8 v28 = [v27 disableCloneMirroring];
  if (displayUUIDToModeRequest == (NSMutableDictionary *)1) {
    unsigned __int8 v29 = 1;
  }
  else {
    unsigned __int8 v29 = [v27 forceCloneMirroring];
  }
  if (displayUUIDToModeRequest == (NSMutableDictionary *)2) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = v28;
  }
  *a4 = v29;
  *a5 = v30;

  return v13;
}

- (void)_lock_recomputeTagsForDisplay:(id)a3 shouldHide:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unint64_t v6 = (unint64_t)[v5 tag];
  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFALL | v4 | (4LL * ((v6 & 0xF8) == 0));
  id v8 = [v5 name];
  unsigned int v9 = [v8 isEqual:@"TVOut"];

  if (v9)
  {
    BKSDefaults *v11 = [BKSDefaults externalDefaults];
    uint64_t v12 = (void *)[v11 iapDefaults];

    id v13 = [v12 videoTVOutReservedForIPodOut];
    unsigned int v14 = (void *)[v12 videoTVOutReservedForRemoteUI];
    if ([v13 isEqualToString:@"Yes"])
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5LL | 0xA;
    }

    else if ([v14 isEqualToString:@"Yes"])
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5LL | 0x12;
    }

    else
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5LL | 2;
    }
  }

  uint64_t v15 = BKLogDisplay(v10);
  os_log_s *v16 = [v15 autorelease];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSStringFromBKSDisplayTags(v7);
    uint64_t v18 = [v17 autorelease];
    int v19 = 138543618;
    id v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "tagging %{public}@ with %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  [v5 setTag:v7];
}

- (void)_lock_removeDisplayCloneDestination:(id)a3
{
  id v5 = a3;
  BOOL v4 = [v5 cloneMaster];
  if (v4) {
    [self _lock_removeClone:v5 fromWindowServerDisplay:v4];
  }
}

- (void)_lock_removeClone:(id)a3 fromWindowServerDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6 && v7)
  {
    id v8 = [NSNumber numberWithUnsignedInt:v6.displayId];
    unsigned int v9 = [self->_lock_destinationDisplayIdentifierToCloneRecord objectForKey:v8];
    [self->_lock_destinationDisplayIdentifierToCloneRecord removeObjectForKey:v8];
    uint64_t v10 = (void *)[v7 clones];
    unsigned int v11 = [v10 containsObject:v6];

    if (v11)
    {
      uint64_t v13 = BKLogDisplay(v12);
      os_log_s *v14 = [v13 autorelease];
      uint64_t v15 = v14;
      if (v9)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543618;
          id v19 = v6;
          __int16 v20 = 2114;
          id v21 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removing clone %{public}@ from %{public}@",  (uint8_t *)&v18,  0x16u);
        }
      }

      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543618;
        id v19 = v6;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Display %{public}@ cloning from %{public}@, but we're missing a record of the clone",  (uint8_t *)&v18,  0x16u);
      }

      [v7 removeClone:v6];
    }

    else if (v9)
    {
      uint64_t v16 = BKLogDisplay(v12);
      uint64_t v17 = [v16 autorelease];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543618;
        id v19 = v6;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Clone missing: expected to see %{public}@ cloning from %{public}@",  (uint8_t *)&v18,  0x16u);
      }
    }
  }
}

- (void)_lock_clearWindowServerDisplayTags:(id)a3
{
  id v3 = a3;
  id v4 = [v3 tag];
  if (v4)
  {
    uint64_t v5 = BKLogDisplay(v4);
    os_log_s *v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Untagging %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [v3 setTag:0];
  }
}

- (void)_lock_evaluateDisplay:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[BKDisplayCloneMirroringManagerInformationProvider displayIsConnected:]( self->_displayProvider,  "displayIsConnected:",  v7))
  {
    [self _lock_evaluateConnectedDisplay:v7 because:v6];
  }

  else
  {
    [self _lock_removeDisplayCloneDestination:v7];
    [v7 setProcessId:0];
    [self _lock_clearWindowServerDisplayTags:v7];
  }
}

- (void)_lock_evaluateAllDisplaysForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [self->_displayProvider windowServerDisplays];
  id v6 = [v5 firstObject];
  if (v6)
  {
    unsigned int v14 = v6;
    uint64_t v15 = v5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:v16 objects:v20 count:16];
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
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (-[BKDisplayCloneMirroringManagerInformationProvider supportCloningToDisplay:]( self->_displayProvider,  "supportCloningToDisplay:",  v12))
          {
            NSString *v13 = [NSString stringWithFormat:@"updateClonedDisplaysForSettingsChange(%@)", v4];
            [self _lock_evaluateDisplay:v12 reason:v13];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:v16 objects:v20 count:16];
      }

      while (v9);
    }

    id v6 = v14;
    uint64_t v5 = v15;
  }
}

- (void)_lock_evaluateExistingClonesForReason:(id)a3
{
  id v4 = a3;
  lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004937C;
  v7[3] = &unk_1000B7130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [lock_destinationDisplayIdentifierToCloneRecord enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)cloneMirroringRequestsDidChange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self _lock_evaluateAllDisplaysForReason:@"cloneMirroringRequestsDidChange"];
  os_unfair_lock_unlock(p_lock);
}

- (void)setCloneRotationDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_cloneRotationDisabled != v3)
  {
    self->_lock_cloneRotationDisabled = v3;
    id v6 = [NSString stringWithFormat:@"setCloneRotationDisabled:%d" v3];
    [self _lock_evaluateExistingClonesForReason:v6];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)evaluateDisplay:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v36 = v7;
  if (!v36)
  {
    unsigned int v11 = [CAWindowServerDisplay class];
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    NSString *v14 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v13];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      __int128 v16 = v15;
      __int128 v18 = (objc_class *)[self class];
      __int128 v19 = NSStringFromClass(v18);
      __int16 v20 = v19;
      *(_DWORD *)buf = 138544642;
      uint64_t v38 = v16;
      __int16 v39 = 2114;
      uint64_t v40 = v20;
      __int16 v41 = 2048;
      uint64_t v42 = self;
      __int16 v43 = 2114;
      BOOL v44 = @"BKDisplayCloneMirroringManager.m";
      __int16 v45 = 1024;
      int v46 = 495;
      __int16 v47 = 2114;
      uint64_t v48 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x1000489BCLL);
  }

  uint64_t v10 = [CAWindowServerDisplay class];
  if ((objc_opt_isKindOfClass(v36, v10) & 1) == 0)
  {
    id v21 = (objc_class *)[v36 classForCoder];
    if (!v21) {
      id v21 = [v36 class];
    }
    id v23 = NSStringFromClass(v21);
    id v24 = v23;
    CAWindowServerDisplay *v26 = [CAWindowServerDisplay class];
    uint64_t v27 = NSStringFromClass(v26);
    unsigned __int8 v28 = [v27 autorelease];
    NSString *v29 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v24, v28];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      BOOL v30 = NSStringFromSelector(a2);
      id v31 = v30;
      uint32_t v33 = [self class];
      char v34 = NSStringFromClass(v33);
      uint64_t v35 = [v34 autorelease];
      *(_DWORD *)buf = 138544642;
      uint64_t v38 = v31;
      __int16 v39 = 2114;
      uint64_t v40 = v35;
      __int16 v41 = 2048;
      uint64_t v42 = self;
      __int16 v43 = 2114;
      BOOL v44 = @"BKDisplayCloneMirroringManager.m";
      __int16 v45 = 1024;
      int v46 = 495;
      __int16 v47 = 2114;
      uint64_t v48 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x100048AF8LL);
  }

  os_unfair_lock_lock(&self->_lock);
  [self _lock_evaluateDisplay:v36 reason:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeDisplay:(id)a3
{
  id v32 = a3;
  if (!v32)
  {
    CAWindowServerDisplay *v7 = [CAWindowServerDisplay class];
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = [v8 autorelease];
    uint64_t v10 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v9];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = NSStringFromSelector(a2);
      uint64_t v12 = [v11 autorelease];
      unsigned int v14 = [self class];
      uint64_t v15 = NSStringFromClass(v14);
      __int128 v16 = [v15 autorelease];
      *(_DWORD *)buf = 138544642;
      char v34 = v12;
      __int16 v35 = 2114;
      id v36 = v16;
      __int16 v37 = 2048;
      uint64_t v38 = self;
      __int16 v39 = 2114;
      uint64_t v40 = @"BKDisplayCloneMirroringManager.m";
      __int16 v41 = 1024;
      int v42 = 503;
      __int16 v43 = 2114;
      BOOL v44 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x100048CD8LL);
  }

  CAWindowServerDisplay *v6 = [CAWindowServerDisplay class];
  if ((objc_opt_isKindOfClass(v32, v6) & 1) == 0)
  {
    uint64_t v17 = (objc_class *)[v32 classForCoder];
    if (!v17) {
      uint64_t v17 = (objc_class *)v32;
    }
    __int128 v19 = NSStringFromClass(v17);
    __int16 v20 = [v19 autorelease];
    uint64_t v22 = (objc_class *)[CAWindowServerDisplay class];
    id v23 = NSStringFromClass(v22);
    id v24 = v23;
    uint64_t v25 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.",  @"display",  v20,  v24];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v26 = NSStringFromSelector(a2);
      uint64_t v27 = [v26 autorelease];
      unsigned __int8 v29 = [self class];
      BOOL v30 = NSStringFromClass(v29);
      id v31 = v30;
      *(_DWORD *)buf = 138544642;
      char v34 = v27;
      __int16 v35 = 2114;
      id v36 = v31;
      __int16 v37 = 2048;
      uint64_t v38 = self;
      __int16 v39 = 2114;
      uint64_t v40 = @"BKDisplayCloneMirroringManager.m";
      __int16 v41 = 1024;
      int v42 = 503;
      __int16 v43 = 2114;
      BOOL v44 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v25 UTF8String]);
    __break(0);
    JUMPOUT(0x100048E14LL);
  }

  os_unfair_lock_lock(&self->_lock);
  [self _lock_removeDisplayCloneDestination:v32];
  [self _lock_clearWindowServerDisplayTags:v32];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addModeRequest:(unint64_t)a3 forDisplay:(id)a4 clientPID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = self;
  p_lock = &self->_lock;
  id v10 = a4;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = v8->_lock_cloneMirrorRequests;
  id v12 = v10;
  uint64_t v13 = v12;
  if (lock_cloneMirrorRequests)
  {
    uint64_t v14 = BKLogDisplay(v12);
    uint64_t v15 = [v14 autorelease];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = NSStringFromBKSDisplayServicesCloneMirroringMode(a3);
      uint64_t v17 = v8;
      uint64_t v18 = [v16 autorelease];
      uint64_t v19 = BSProcessDescriptionForPID(v5);
      __int16 v20 = [v19 autorelease];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v45 = 2114;
      int v46 = v13;
      __int16 v47 = 2114;
      uint64_t v48 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "clone mirror mode request:%{public}@ destinationDisplay:%{public}@ from process:%{public}@",  buf,  0x20u);

      id v8 = v17;
    }

    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    BKDisplayCloneMirrorRequestClient *v21 = [[BKDisplayCloneMirrorRequestClient alloc] init];
    uint64_t v22 = v21;
    if (v21)
    {
      v21->_pid = v5;
      v21->_displayUUID = a4;
      v22->_mode = a3;
    }

    if (!lock_cloneMirrorRequests->_displayUUIDToModeRequest)
    {
      NSMutableDictionary *v23 = [[NSMutableDictionary alloc] init];
      displayUUIDToModeRequest = lock_cloneMirrorRequests->_displayUUIDToModeRequest;
      lock_cloneMirrorRequests->_displayUUIDToModeRequest = v23;

      NSMutableDictionary *v25 = [[NSMutableDictionary alloc] init];
      pidToRequests = lock_cloneMirrorRequests->_pidToRequests;
      lock_cloneMirrorRequests->_pidToRequests = v25;

      NSMutableOrderedSet *v27 = [[NSMutableOrderedSet alloc] init];
      modeRequestsInOrder = lock_cloneMirrorRequests->_modeRequestsInOrder;
      lock_cloneMirrorRequests->_modeRequestsInOrder = v27;
    }

    unsigned __int8 v29 = [NSNumber numberWithInt:v5];
    BOOL v30 = [lock_cloneMirrorRequests->_pidToRequests objectForKey:v29];
    id v31 = v30;
    if (v30)
    {
      id v32 = [v30 objectForKey:v13];
      [lock_cloneMirrorRequests->_modeRequestsInOrder removeObject:v32];
      [v31 setObject:v22 forKey:v13];
    }

    else
    {
      __int16 v41 = lock_cloneMirrorRequests->_pidToRequests;
      NSMutableDictionary *v33 = [[NSMutableDictionary alloc] init];
      *(void *)buf = v22;
      int v42 = v8;
      char v34 = p_lock;
      NSArray *v35 = [NSArray arrayWithObjects:buf count:1];
      __int16 v43 = v13;
      id v36 = [NSArray arrayWithObjects:v43, 1LL];
      NSMutableDictionary *v37 = [[NSMutableDictionary alloc] initWithObjects:v35 forKeys:v36];
      [v41 setObject:v37 forKey:v29];

      p_lock = v34;
      id v8 = v42;
      [lock_cloneMirrorRequests _lock_addDeathWatcherForPid:v5];
    }

    [lock_cloneMirrorRequests->_modeRequestsInOrder addObject:v22];
    uint64_t v38 = [lock_cloneMirrorRequests->_displayUUIDToModeRequest objectForKey:v13];
    __int16 v39 = (void *)v38;
    if (!v38 || *(_DWORD *)(v38 + 8) == (_DWORD)v5)
    {
      uint64_t v40 = v22;

      [lock_cloneMirrorRequests->_displayUUIDToModeRequest setObject:v40 forKey:v13];
      __int16 v39 = v40;
    }

    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);
  }

  [v8 _lock_evaluateAllDisplaysForReason:@"addModeRequest"];
  os_unfair_lock_unlock(p_lock);
}

- (void)removeModeRequestForDisplay:(id)a3 clientPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = self->_lock_cloneMirrorRequests;
  id v9 = v7;
  id v10 = v9;
  if (lock_cloneMirrorRequests)
  {
    uint64_t v11 = BKLogDisplay(v9);
    id v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = BSProcessDescriptionForPID(v4);
      uint64_t v14 = v13;
      int v19 = 138543618;
      __int16 v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "clone mirror mode remove for destinationDisplay:%{public}@ from process:%{public}@",  (uint8_t *)&v19,  0x16u);
    }

    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    uint64_t v15 = [NSNumber numberWithInt:v4];
    uint64_t v16 = (void *)[lock_cloneMirrorRequests->_pidToRequests objectForKey:v15];
    uint64_t v17 = (void *)[v16 objectForKey:v10];
    if (v17)
    {
      [lock_cloneMirrorRequests->_modeRequestsInOrder removeObject:v17];
      [v16 removeObjectForKey:v10];
    }

    if (![v16 count])
    {
      [lock_cloneMirrorRequests->_pidToRequests removeObjectForKey:v15];
      uint64_t v18 = [lock_cloneMirrorRequests->_pidToDeathWatcher objectForKey:v15];
      [v18 invalidate];

      [lock_cloneMirrorRequests->_pidToDeathWatcher removeObjectForKey:v15];
    }

    [_lock_rebuildModeCache];
    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);
  }

  [self _lock_evaluateAllDisplaysForReason:@"removeModeRequest"];
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end