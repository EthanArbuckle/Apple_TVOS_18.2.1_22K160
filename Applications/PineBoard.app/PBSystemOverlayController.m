@interface PBSystemOverlayController
+ (id)keyPathsForValuesAffectingHasActivePresentation;
- (BOOL)activeSessionIsHidden;
- (BOOL)hasActivePresentation;
- (BOOL)isPaused;
- (NSMutableArray)allSessions;
- (NSMutableArray)dismissalCompletionHandlers;
- (NSMutableArray)pendingPresentationRequests;
- (NSMutableArray)presentationCompletionHandlers;
- (NSString)name;
- (PBSystemOverlayController)init;
- (PBSystemOverlayController)initWithName:(id)a3 layoutLevel:(int64_t)a4 presentationHandler:(id)a5 delegate:(id)a6;
- (PBSystemOverlayControllerDelegate)delegate;
- (PBSystemOverlaySession)activeSession;
- (PBSystemOverlaySession)dismissalCompletionHandlersActiveSession;
- (PBSystemOverlaySession)presentationCompletionHandlersActiveSession;
- (PBSystemUIPresenting)presentationHandler;
- (int64_t)layoutLevel;
- (void)_callPendingDismissalCompletionHandlersForSession:(id)a3 success:(BOOL)a4;
- (void)_callPendingPresentationCompletionHandlersForSession:(id)a3 success:(BOOL)a4;
- (void)_checkPendingRequests;
- (void)dismissWithRequest:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseWithOptions:(int64_t)a3;
- (void)presentWithRequest:(id)a3 completion:(id)a4;
- (void)resume;
- (void)systemOverlaySessionDidCancel:(id)a3 withContext:(id)a4;
- (void)systemOverlaySessionDidDismiss:(id)a3;
- (void)systemOverlaySessionDidInvalidate:(id)a3;
- (void)systemOverlaySessionDidPresent:(id)a3;
- (void)systemOverlaySessionWillDismiss:(id)a3 withContext:(id)a4;
- (void)systemOverlaySessionWillPresent:(id)a3;
@end

@implementation PBSystemOverlayController

- (PBSystemOverlayController)init
{
  return 0LL;
}

- (PBSystemOverlayController)initWithName:(id)a3 layoutLevel:(int64_t)a4 presentationHandler:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBSystemOverlayController;
  v13 = -[PBSystemOverlayController init](&v29, "init");
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    name = v13->_name;
    v13->_name = v14;

    v13->_layoutLevel = a4;
    objc_storeStrong((id *)&v13->_presentationHandler, a5);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    allSessions = v13->_allSessions;
    v13->_allSessions = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingPresentationRequests = v13->_pendingPresentationRequests;
    v13->_pendingPresentationRequests = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    presentationCompletionHandlers = v13->_presentationCompletionHandlers;
    v13->_presentationCompletionHandlers = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    dismissalCompletionHandlers = v13->_dismissalCompletionHandlers;
    v13->_dismissalCompletionHandlers = v22;

    objc_storeWeak((id *)&v13->_delegate, v12);
    *(_BYTE *)&v13->_delegateFlags = *(_BYTE *)&v13->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v12,  "overlayController:willPresentSession:") & 1;
    if ((objc_opt_respondsToSelector(v12, "overlayController:didPresentSession:") & 1) != 0) {
      char v24 = 2;
    }
    else {
      char v24 = 0;
    }
    *(_BYTE *)&v13->_delegateFlags = *(_BYTE *)&v13->_delegateFlags & 0xFD | v24;
    if ((objc_opt_respondsToSelector(v12, "overlayController:willDismissSession:withContext:") & 1) != 0) {
      char v25 = 4;
    }
    else {
      char v25 = 0;
    }
    *(_BYTE *)&v13->_delegateFlags = *(_BYTE *)&v13->_delegateFlags & 0xFB | v25;
    if ((objc_opt_respondsToSelector(v12, "overlayController:didDismissSession:") & 1) != 0) {
      char v26 = 8;
    }
    else {
      char v26 = 0;
    }
    *(_BYTE *)&v13->_delegateFlags = *(_BYTE *)&v13->_delegateFlags & 0xF7 | v26;
    if ((objc_opt_respondsToSelector(v12, "overlayController:didCancelSession:withContext:") & 1) != 0) {
      char v27 = 16;
    }
    else {
      char v27 = 0;
    }
    *(_BYTE *)&v13->_delegateFlags = *(_BYTE *)&v13->_delegateFlags & 0xEF | v27;
  }

  return v13;
}

- (void)presentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v7 = self->_allSessions;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      unsigned __int8 v15 = [v13 isEqual:v14];

      if ((v15 & 1) != 0) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v16 = v12;

    if (v16) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  v17 = objc_alloc(&OBJC_CLASS___PBSystemOverlaySession);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  int64_t layoutLevel = self->_layoutLevel;
  id v20 = [v6 sceneDeactivationReasons];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController presentationHandler](self, "presentationHandler"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 signpostLog]);
  v16 = -[PBSystemOverlaySession initWithIdentifier:layoutLevel:sceneDeactivationReasons:presentationHandler:delegate:signpostLog:]( v17,  "initWithIdentifier:layoutLevel:sceneDeactivationReasons:presentationHandler:delegate:signpostLog:",  v18,  layoutLevel,  v20,  v21,  self,  v22);

  -[NSMutableArray addObject:](self->_allSessions, "addObject:", v16);
LABEL_12:
  if (v28)
  {
    v23 = objc_alloc_init(&OBJC_CLASS____PBSystemOverlayControllerCompletionInfo);
    -[_PBSystemOverlayControllerCompletionInfo setSession:](v23, "setSession:", v16);
    -[_PBSystemOverlayControllerCompletionInfo setCompletion:](v23, "setCompletion:", v28);
    -[NSMutableArray addObject:](self->_presentationCompletionHandlers, "addObject:", v23);
  }

  unsigned int v24 = [v6 _insertAtFrontOfQueue];
  pendingPresentationRequests = self->_pendingPresentationRequests;
  if (v24) {
    -[NSMutableArray insertObject:atIndex:](pendingPresentationRequests, "insertObject:atIndex:", v6, 0LL);
  }
  else {
    -[NSMutableArray addObject:](pendingPresentationRequests, "addObject:", v6);
  }
  id v26 = sub_100084158();
  char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10027F768(v6, (id *)&self->_pendingPresentationRequests, v27);
  }

  -[PBSystemOverlayController _checkPendingRequests](self, "_checkPendingRequests");
}

- (void)dismissWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v21 = self;
  id v8 = self->_allSessions;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      unsigned __int8 v16 = [v14 isEqual:v15];

      if ((v16 & 1) != 0) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v17 = v13;

    if (!v17) {
      goto LABEL_14;
    }
    if (v7)
    {
      v18 = objc_alloc_init(&OBJC_CLASS____PBSystemOverlayControllerCompletionInfo);
      -[_PBSystemOverlayControllerCompletionInfo setSession:](v18, "setSession:", v17);
      -[_PBSystemOverlayControllerCompletionInfo setCompletion:](v18, "setCompletion:", v7);
      -[NSMutableArray addObject:](v21->_dismissalCompletionHandlers, "addObject:", v18);
    }

    [v17 dismissWithRequest:v6];
  }

  else
  {
LABEL_9:

LABEL_14:
    id v19 = sub_100084158();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10027F830(v6, v20);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (BOOL)hasActivePresentation
{
  return self->_activeSession && !self->_activeSessionIsHidden;
}

- (void)pauseWithOptions:(int64_t)a3
{
  if (!self->_paused)
  {
    char v3 = a3;
    -[PBSystemOverlayController willChangeValueForKey:](self, "willChangeValueForKey:", @"paused");
    self->_paused = 1;
    if ((v3 & 1) != 0 && self->_activeSession)
    {
      self->_activeSessionIsHidden = 1;
      -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"paused");
      id v5 = sub_100084158();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session hide begin", v7, 2u);
      }

      -[PBSystemUIPresenting hideSystemUIAtLevel:animated:completion:]( self->_presentationHandler,  "hideSystemUIAtLevel:animated:completion:",  self->_layoutLevel,  1LL,  &stru_1003D6AF0);
    }

    else
    {
      -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"paused");
    }
  }

- (void)resume
{
  if (self->_paused)
  {
    -[PBSystemOverlayController willChangeValueForKey:](self, "willChangeValueForKey:", @"paused");
    self->_paused = 0;
    if (self->_activeSessionIsHidden)
    {
      self->_activeSessionIsHidden = 0;
      -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"paused");
      id v3 = sub_100084158();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session un-hide begin", buf, 2u);
      }

      presentationHandler = self->_presentationHandler;
      int64_t layoutLevel = self->_layoutLevel;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000F0B9C;
      v7[3] = &unk_1003CFF08;
      v7[4] = self;
      -[PBSystemUIPresenting unhideSystemUIAtLevel:animated:completion:]( presentationHandler,  "unhideSystemUIAtLevel:animated:completion:",  layoutLevel,  1LL,  v7);
    }

    else
    {
      -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"paused");
      -[PBSystemOverlayController _checkPendingRequests](self, "_checkPendingRequests");
    }
  }

+ (id)keyPathsForValuesAffectingHasActivePresentation
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"activeSession",  @"paused",  0LL));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046B780 == a6)
  {
    -[PBSystemOverlayController _checkPendingRequests](self, "_checkPendingRequests", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBSystemOverlayController;
    -[PBSystemOverlayController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)systemOverlaySessionWillPresent:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained overlayController:self willPresentSession:v5];
  }

- (void)systemOverlaySessionDidPresent:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayController:self didPresentSession:v4];
  }

  -[PBSystemOverlayController _callPendingPresentationCompletionHandlersForSession:success:]( self,  "_callPendingPresentationCompletionHandlersForSession:success:",  v4,  1LL);
}

- (void)systemOverlaySessionWillDismiss:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v7 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayController:self willDismissSession:v6 withContext:v7];
  }

  -[PBSystemOverlayController _callPendingPresentationCompletionHandlersForSession:success:]( self,  "_callPendingPresentationCompletionHandlersForSession:success:",  v6,  0LL);
}

- (void)systemOverlaySessionDidDismiss:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayController:self didDismissSession:v4];
  }

  -[PBSystemOverlayController _callPendingDismissalCompletionHandlersForSession:success:]( self,  "_callPendingDismissalCompletionHandlersForSession:success:",  v4,  1LL);
}

- (void)systemOverlaySessionDidCancel:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    id v7 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayController:self didCancelSession:v6 withContext:v7];
  }

  -[PBSystemOverlayController _callPendingPresentationCompletionHandlersForSession:success:]( self,  "_callPendingPresentationCompletionHandlersForSession:success:",  v6,  0LL);
  -[PBSystemOverlayController _callPendingDismissalCompletionHandlersForSession:success:]( self,  "_callPendingDismissalCompletionHandlersForSession:success:",  v6,  1LL);
}

- (void)systemOverlaySessionDidInvalidate:(id)a3
{
  id v4 = a3;
  -[NSMutableArray removeObject:](self->_allSessions, "removeObject:", v4);
  id v5 = -[NSMutableArray copy](self->_pendingPresentationRequests, "copy");
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1000F0F8C;
  id v10 = &unk_1003D6B18;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  [v5 enumerateObjectsWithOptions:2 usingBlock:&v7];
  -[PBSystemOverlayController _callPendingPresentationCompletionHandlersForSession:success:]( self,  "_callPendingPresentationCompletionHandlersForSession:success:",  v6,  0LL,  v7,  v8,  v9,  v10);
  -[PBSystemOverlayController _callPendingDismissalCompletionHandlersForSession:success:]( self,  "_callPendingDismissalCompletionHandlersForSession:success:",  v6,  1LL);
  -[PBSystemOverlayController _checkPendingRequests](self, "_checkPendingRequests");
}

- (void)_callPendingPresentationCompletionHandlersForSession:(id)a3 success:(BOOL)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_presentationCompletionHandlersActiveSession, a3);
  id v8 = -[NSMutableArray copy](self->_presentationCompletionHandlers, "copy");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000F10C4;
  v11[3] = &unk_1003D6B40;
  BOOL v14 = a4;
  id v12 = v7;
  v13 = self;
  id v9 = v7;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];

  presentationCompletionHandlersActiveSession = self->_presentationCompletionHandlersActiveSession;
  self->_presentationCompletionHandlersActiveSession = 0LL;
}

- (void)_callPendingDismissalCompletionHandlersForSession:(id)a3 success:(BOOL)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_dismissalCompletionHandlersActiveSession, a3);
  id v8 = -[NSMutableArray copy](self->_dismissalCompletionHandlers, "copy");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000F1208;
  v11[3] = &unk_1003D6B40;
  BOOL v14 = a4;
  id v12 = v7;
  v13 = self;
  id v9 = v7;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];

  dismissalCompletionHandlersActiveSession = self->_dismissalCompletionHandlersActiveSession;
  self->_dismissalCompletionHandlersActiveSession = 0LL;
}

- (void)_checkPendingRequests
{
  if ((id)-[PBSystemOverlaySession state](self->_activeSession, "state") == (id)7)
  {
    -[PBSystemOverlaySession removeObserver:forKeyPath:context:]( self->_activeSession,  "removeObserver:forKeyPath:context:",  self,  @"state",  off_10046B780);
    -[PBSystemOverlayController willChangeValueForKey:](self, "willChangeValueForKey:", @"activeSession");
    activeSession = self->_activeSession;
    self->_activeSession = 0LL;

    -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"activeSession");
  }

  if (!self->_paused && !self->_activeSession && -[NSMutableArray count](self->_pendingPresentationRequests, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pendingPresentationRequests, "firstObject"));
    -[NSMutableArray removeObject:](self->_pendingPresentationRequests, "removeObject:", v4);
    id v5 = -[NSMutableArray copy](self->_pendingPresentationRequests, "copy");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000F1594;
    v26[3] = &unk_1003D6B18;
    id v6 = v4;
    id v27 = v6;
    id v28 = self;
    [v5 enumerateObjectsWithOptions:2 usingBlock:v26];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = self->_allSessions;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
    if (v8)
    {
      id v9 = v8;
      id v21 = v5;
      uint64_t v10 = *(void *)v23;
LABEL_8:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        unsigned __int8 v15 = [v13 isEqual:v14];

        if ((v15 & 1) != 0) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
          if (v9) {
            goto LABEL_8;
          }
          id v5 = v21;
          goto LABEL_19;
        }
      }

      unsigned __int8 v16 = v12;

      id v5 = v21;
      if (!v16) {
        goto LABEL_20;
      }
      id v17 = sub_100084158();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10027F8C4(v6, v18);
      }

      -[PBSystemOverlayController willChangeValueForKey:](self, "willChangeValueForKey:", @"activeSession");
      id v19 = self->_activeSession;
      self->_activeSession = v16;
      id v7 = v16;

      -[PBSystemOverlayController didChangeValueForKey:](self, "didChangeValueForKey:", @"activeSession");
      -[PBSystemOverlaySession addObserver:forKeyPath:options:context:]( self->_activeSession,  "addObserver:forKeyPath:options:context:",  self,  @"state",  0LL,  off_10046B780);
      -[PBSystemOverlaySession presentWithRequest:](self->_activeSession, "presentWithRequest:", v6);
      -[PBSystemOverlaySession makeActive](self->_activeSession, "makeActive");
    }

- (NSString)name
{
  return self->_name;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (PBSystemOverlaySession)activeSession
{
  return self->_activeSession;
}

- (PBSystemUIPresenting)presentationHandler
{
  return self->_presentationHandler;
}

- (PBSystemOverlayControllerDelegate)delegate
{
  return (PBSystemOverlayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableArray)allSessions
{
  return self->_allSessions;
}

- (NSMutableArray)pendingPresentationRequests
{
  return self->_pendingPresentationRequests;
}

- (NSMutableArray)presentationCompletionHandlers
{
  return self->_presentationCompletionHandlers;
}

- (NSMutableArray)dismissalCompletionHandlers
{
  return self->_dismissalCompletionHandlers;
}

- (PBSystemOverlaySession)presentationCompletionHandlersActiveSession
{
  return self->_presentationCompletionHandlersActiveSession;
}

- (PBSystemOverlaySession)dismissalCompletionHandlersActiveSession
{
  return self->_dismissalCompletionHandlersActiveSession;
}

- (BOOL)activeSessionIsHidden
{
  return self->_activeSessionIsHidden;
}

- (void).cxx_destruct
{
}

@end