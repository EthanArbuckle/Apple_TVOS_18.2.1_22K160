@interface CSVSUISceneTransitionManager
- (CSVSUIScene)activeScene;
- (CSVSUISceneTransitionManager)initWithContainerViewController:(id)a3 containerView:(id)a4 scenes:(id)a5 transitions:(id)a6;
- (UIView)containerView;
- (UIViewController)containerViewController;
- (id)_defaultViewPropertyAnimator;
- (id)_nextScene;
- (id)_popSimultaneousTransitions:(id)a3 reversed:(BOOL)a4;
- (id)_sceneForIdentifier:(id)a3;
- (id)_sceneTransitionsMatchingPredicate:(id)a3;
- (id)_viewPropertyAnimatorForTransition:(id)a3;
- (id)propertyAnimatorProvider;
- (id)sceneForIdentifier:(id)a3;
- (void)__transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)_addSceneChildViewControllerForScene:(id)a3;
- (void)_constructSceneViewControllerIfNeeded:(id)a3;
- (void)_decrementAnimationRefCount;
- (void)_handleNextPendingTransition;
- (void)_incrementAnimationRefCount;
- (void)_notifyScene:(id)a3 ofTransitionToPhase:(int64_t)a4 transition:(id)a5 isAppearing:(BOOL)a6;
- (void)_performTransitions:(id)a3 animated:(BOOL)a4 reversed:(BOOL)a5 completion:(id)a6;
- (void)_removeSceneChildViewControllerForScene:(id)a3;
- (void)_transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setPropertyAnimatorProvider:(id)a3;
- (void)transitionToNextSceneAnimated:(BOOL)a3;
- (void)transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4;
@end

@implementation CSVSUISceneTransitionManager

- (CSVSUISceneTransitionManager)initWithContainerViewController:(id)a3 containerView:(id)a4 scenes:(id)a5 transitions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CSVSUISceneTransitionManager;
  v15 = -[CSVSUISceneTransitionManager init](&v37, "init");
  v16 = v15;
  if (v15)
  {
    id v30 = v14;
    id v31 = v12;
    id v32 = v11;
    objc_storeStrong((id *)&v15->_containerViewController, a3);
    objc_storeStrong((id *)&v16->_containerView, a4);
    objc_storeStrong((id *)&v16->_scenes, a5);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v18 = v13;
    id v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
          -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v23, v24);
        }

        id v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v20);
    }

    scenesDict = v16->_scenesDict;
    v16->_scenesDict = v17;
    v26 = v17;

    objc_storeStrong((id *)&v16->_transitions, a6);
    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingTransitionHandlers = v16->_pendingTransitionHandlers;
    v16->_pendingTransitionHandlers = v27;

    id v12 = v31;
    id v11 = v32;
    id v14 = v30;
  }

  return v16;
}

- (void)transitionToNextSceneAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager _nextScene](self, "_nextScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[CSVSUISceneTransitionManager transitionToSceneWithIdentifier:animated:]( self,  "transitionToSceneWithIdentifier:animated:",  v5,  v3);
}

- (void)transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4
{
}

- (id)sceneForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_scenesDict, "objectForKeyedSubscript:", a3);
}

- (void)_transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager activeScene](self, "activeScene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned __int8 v9 = [v8 isEqualToString:v6];

  if ((v9 & 1) == 0)
  {
    if (self->_animationRefCount)
    {
      objc_initWeak(&location, self);
      pendingTransitionHandlers = self->_pendingTransitionHandlers;
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472LL;
      id v14 = sub_100007850;
      v15 = &unk_1000246A0;
      objc_copyWeak(&v17, &location);
      id v16 = v6;
      BOOL v18 = v4;
      id v11 = objc_retainBlock(&v12);
      -[NSMutableArray addObject:](pendingTransitionHandlers, "addObject:", v11, v12, v13, v14, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }

    else
    {
      -[CSVSUISceneTransitionManager __transitionToSceneWithIdentifier:animated:]( self,  "__transitionToSceneWithIdentifier:animated:",  v6,  v4);
    }
  }
}

- (void)__transitionToSceneWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[CSVSUISceneTransitionManager _incrementAnimationRefCount](self, "_incrementAnimationRefCount");
  v7 = (CSVSUIScene *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager _sceneForIdentifier:](self, "_sceneForIdentifier:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager activeScene](self, "activeScene"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene identifier](v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[CSVSUISceneTransitionManager _constructSceneViewControllerIfNeeded:]( self,  "_constructSceneViewControllerIfNeeded:",  v7);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100007B48;
  v27[3] = &unk_1000246C8;
  id v11 = v9;
  id v28 = v11;
  id v12 = v10;
  id v29 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v27));
  id v14 = (id)objc_claimAutoreleasedReturnValue( -[CSVSUISceneTransitionManager _sceneTransitionsMatchingPredicate:]( self,  "_sceneTransitionsMatchingPredicate:",  v13));

  if ([v14 count])
  {
    uint64_t v15 = 0LL;
    if (v7)
    {
      if (v8)
      {
        int64_t v16 = -[NSArray indexOfObjectIdenticalTo:](self->_scenes, "indexOfObjectIdenticalTo:", v7);
        int64_t v17 = -[NSArray indexOfObjectIdenticalTo:](self->_scenes, "indexOfObjectIdenticalTo:", v8);
        uint64_t v15 = 0LL;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL && v17 != 0x7FFFFFFFFFFFFFFFLL && v16 < v17)
        {
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v14 reverseObjectEnumerator]);
          uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 allObjects]);

          uint64_t v15 = 1LL;
          id v14 = (id)v19;
        }
      }
    }

    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100007C30;
    v22[3] = &unk_1000246F0;
    objc_copyWeak(&v25, &location);
    id v23 = v8;
    id v14 = v14;
    id v24 = v14;
    -[CSVSUISceneTransitionManager _performTransitions:animated:reversed:completion:]( self,  "_performTransitions:animated:reversed:completion:",  v14,  v4,  v15,  v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  else
  {
    -[CSVSUISceneTransitionManager _addSceneChildViewControllerForScene:]( self,  "_addSceneChildViewControllerForScene:",  v7);
    -[CSVSUISceneTransitionManager _removeSceneChildViewControllerForScene:]( self,  "_removeSceneChildViewControllerForScene:",  v8);
    -[CSVSUISceneTransitionManager _decrementAnimationRefCount](self, "_decrementAnimationRefCount");
  }

  activeScene = self->_activeScene;
  self->_activeScene = v7;
  uint64_t v21 = v7;
}

- (void)_performTransitions:(id)a3 animated:(BOOL)a4 reversed:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  id v29 = v10;
  if ([v10 count])
  {
    id v28 = v11;
    id v12 = [v10 mutableCopy];
    BOOL v27 = v7;
    v26 = v12;
    if (v8)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue( -[CSVSUISceneTransitionManager _popSimultaneousTransitions:reversed:]( self,  "_popSimultaneousTransitions:reversed:",  v12,  v7));
    }

    else
    {
      id v13 = [v10 copy];
      [v12 removeAllObjects];
    }

    objc_initWeak(&location, self);
    group = dispatch_group_create();
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v13;
    id v14 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v14)
    {
      uint64_t v31 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(obj);
          }
          int64_t v16 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appearingScene", v26));
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v16 disappearingScene]);
          if (v17)
          {
            if (([v17 hasBeenAddedAsChildViewController] & 1) == 0) {
              -[CSVSUISceneTransitionManager _addSceneChildViewControllerForScene:]( self,  "_addSceneChildViewControllerForScene:",  v17);
            }
            -[CSVSUISceneTransitionManager _notifyScene:ofTransitionToPhase:transition:isAppearing:]( self,  "_notifyScene:ofTransitionToPhase:transition:isAppearing:",  v17,  0LL,  v16,  1LL);
          }

          if (v18) {
            -[CSVSUISceneTransitionManager _notifyScene:ofTransitionToPhase:transition:isAppearing:]( self,  "_notifyScene:ofTransitionToPhase:transition:isAppearing:",  v18,  0LL,  v16,  0LL);
          }
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_100008204;
          v43[3] = &unk_100024718;
          id v19 = v17;
          id v44 = v19;
          v45 = self;
          v46 = v16;
          id v20 = v18;
          id v47 = v20;
          uint64_t v21 = objc_retainBlock(v43);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_100008258;
          v41[3] = &unk_100024678;
          v22 = group;
          v42 = v22;
          id v23 = objc_retainBlock(v41);
          dispatch_group_enter(v22);
          if (v8)
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSUISceneTransitionManager _viewPropertyAnimatorForTransition:]( self,  "_viewPropertyAnimatorForTransition:",  v16));
            [v24 addAnimations:v21];
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472LL;
            v39[2] = sub_100008260;
            v39[3] = &unk_100024740;
            v40 = v23;
            [v24 addCompletion:v39];
            [v24 startAnimation];
          }

          else
          {
            ((void (*)(void *))v21[2])(v21);
            ((void (*)(void *))v23[2])(v23);
          }
        }

        id v14 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }

      while (v14);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000826C;
    block[3] = &unk_100024768;
    objc_copyWeak(&v36, &location);
    id v34 = v26;
    BOOL v37 = v8;
    BOOL v38 = v27;
    id v35 = v28;
    id v25 = v26;
    dispatch_group_notify(group, &_dispatch_main_q, block);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    id v11 = (void (**)(void))v28;
  }

  else
  {
    v11[2](v11);
  }
}

- (void)_incrementAnimationRefCount
{
}

- (void)_decrementAnimationRefCount
{
  int64_t animationRefCount = self->_animationRefCount;
  if (animationRefCount) {
    self->_int64_t animationRefCount = animationRefCount - 1;
  }
}

- (void)_handleNextPendingTransition
{
  if (-[NSMutableArray count](self->_pendingTransitionHandlers, "count"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pendingTransitionHandlers, "firstObject"));
    if (v3)
    {
      dispatch_block_t block = v3;
      -[NSMutableArray removeObjectAtIndex:](self->_pendingTransitionHandlers, "removeObjectAtIndex:", 0LL);
      dispatch_async(&_dispatch_main_q, block);
      BOOL v3 = block;
    }
  }

- (void)_constructSceneViewControllerIfNeeded:(id)a3
{
  id v9 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v9 viewController]);
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)[v9 viewControllerClass]);
    [v9 _setViewController:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v9 containerView]);

    if (!v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager containerView](self, "containerView"));
      [v9 _setContainerView:v6];
    }

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v9 setupHandler]);

    if (v7)
    {
      BOOL v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v9 setupHandler]);
      ((void (**)(void, id))v8)[2](v8, v9);
    }
  }
}

- (void)_notifyScene:(id)a3 ofTransitionToPhase:(int64_t)a4 transition:(id)a5 isAppearing:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 handler]);

  if (v10)
  {
    id v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v9 handler]);
    ((void (**)(void, id, int64_t, BOOL))v11)[2](v11, v15, a4, v6);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 viewController]);
  unsigned int v13 = [v12 conformsToProtocol:&OBJC_PROTOCOL___CSVSUISceneTransitioning];

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 viewController]);
    [v14 scene:v15 isTransitioningWithPhase:a4 isAppearing:v6];
  }
}

- (void)_addSceneChildViewControllerForScene:(id)a3
{
  id v4 = a3;
  id v19 = (id)objc_claimAutoreleasedReturnValue([v4 viewController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager containerViewController](self, "containerViewController"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  [v7 setOpaque:0];

  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  [v6 addSubview:v17];

  [v5 addChildViewController:v19];
  [v19 didMoveToParentViewController:v5];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v18 bringSubviewToFront:v6];

  [v6 layoutIfNeeded];
}

- (void)_removeSceneChildViewControllerForScene:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 viewController]);
  if (v6)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager containerViewController](self, "containerViewController"));
    [v6 willMoveToParentViewController:0];
    [v6 removeFromParentViewController];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v5 removeFromSuperview];
  }
}

- (id)_sceneForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_scenesDict, "objectForKeyedSubscript:", a3);
}

- (id)_sceneTransitionsMatchingPredicate:(id)a3
{
  return -[NSArray filteredArrayUsingPredicate:](self->_transitions, "filteredArrayUsingPredicate:", a3);
}

- (id)_popSimultaneousTransitions:(id)a3 reversed:(BOOL)a4
{
  id v5 = a3;
  uint64_t v10 = 0LL;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  double v13 = sub_1000087C4;
  double v14 = sub_1000087D4;
  double v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000087DC;
  v8[3] = &unk_100024790;
  v8[4] = &v10;
  BOOL v9 = a4;
  [v5 enumerateObjectsUsingBlock:v8];
  [v5 removeObjectsInArray:v11[5]];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_nextScene
{
  activeScene = self->_activeScene;
  scenes = self->_scenes;
  if (!activeScene)
  {
LABEL_5:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](scenes, "firstObject"));
    return v6;
  }

  id v5 = -[NSArray indexOfObject:](scenes, "indexOfObject:");
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = v5 + 1;
    NSUInteger v8 = -[NSArray count](self->_scenes, "count");
    scenes = self->_scenes;
    if (v7 != (char *)v8)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](scenes, "objectAtIndexedSubscript:", v7));
      return v6;
    }

    goto LABEL_5;
  }

  id v6 = 0LL;
  return v6;
}

- (id)_defaultViewPropertyAnimator
{
  return  -[UIViewPropertyAnimator initWithDuration:curve:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:curve:animations:",  0LL,  &stru_1000247B0,  0.5);
}

- (id)_viewPropertyAnimatorForTransition:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager propertyAnimatorProvider](self, "propertyAnimatorProvider"));

  if (!v5
    || (id v6 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSVSUISceneTransitionManager propertyAnimatorProvider]( self,  "propertyAnimatorProvider")),  v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4),  v8 = (void *)objc_claimAutoreleasedReturnValue(v7),  v6,  !v8))
  {
    NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager _defaultViewPropertyAnimator](self, "_defaultViewPropertyAnimator"));
  }

  return v8;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (CSVSUIScene)activeScene
{
  return self->_activeScene;
}

- (id)propertyAnimatorProvider
{
  return self->_propertyAnimatorProvider;
}

- (void)setPropertyAnimatorProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end