@interface PBSceneLayoutViewController
+ (PBSceneLayoutViewController)sceneLayoutViewControllerForMainDisplay;
+ (id)_displayIdentityToSceneLayoutViewControllerMap;
+ (id)sceneLayoutViewControllerForDisplayIdentity:(id)a3;
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (NSArray)sceneLayoutElements;
- (NSMapTable)appearanceTransitionCompletionBlocks;
- (NSMutableDictionary)sceneIdentifierToSceneViewControllerDictionary;
- (NSMutableOrderedSet)mutableSceneLayoutElements;
- (PBSceneHandle)focusedSceneHandle;
- (PBSceneLayoutElement)focusedSceneLayoutElement;
- (PBSceneLayoutViewControllerDisplayPublisherDelegate)internalDisplayPublisherDelegate;
- (PBSceneLayoutViewControllerDisplaySceneHandleDelegate)internalSceneHandleDelegate;
- (id)_init;
- (id)debugDescription;
- (id)displayPublisherDelegate;
- (id)preferredFocusEnvironments;
- (id)sceneHandleDelegate;
- (id)sceneLayoutElementForSceneIdentifier:(id)a3;
- (id)sceneLayoutElementsOfClass:(Class)a3;
- (id)sceneLayoutElementsPassingTest:(id)a3;
- (void)_addSceneLayoutElement:(id)a3 aboveSceneLayoutElement:(id)a4 animated:(BOOL)a5;
- (void)_addSceneLayoutElement:(id)a3 animated:(BOOL)a4;
- (void)_addSceneLayoutElement:(id)a3 animated:(BOOL)a4 insertSceneLayoutElementBlock:(id)a5 insertSubviewBlock:(id)a6;
- (void)_addSceneLayoutElement:(id)a3 belowSceneLayoutElement:(id)a4 animated:(BOOL)a5;
- (void)_endAppearanceTransitionForSceneLayoutElement:(id)a3;
- (void)_finishAddingSceneLayoutElement:(id)a3;
- (void)_finishRemovingSceneLayoutElement:(id)a3;
- (void)_insertSceneLayoutElement:(id)a3;
- (void)_insertSceneLayoutElement:(id)a3 aboveSceneLayoutElement:(id)a4;
- (void)_insertSceneLayoutElement:(id)a3 belowSceneLayoutElement:(id)a4;
- (void)_removeSceneLayoutElement:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)enumerateSceneLayoutElementsUsingBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeApplicationLevelSceneLayoutElementForReason:(id)a3;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setDisplayPublisherDelegate:(id)a3;
- (void)setFocusedSceneLayoutElement:(id)a3;
- (void)setInternalDisplayPublisherDelegate:(id)a3;
- (void)setInternalSceneHandleDelegate:(id)a3;
- (void)setSceneHandleDelegate:(id)a3;
@end

@implementation PBSceneLayoutViewController

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBSceneLayoutViewController;
  v2 = -[PBSceneLayoutViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL, 0LL);
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sceneIdentifierToSceneViewControllerDictionary = v2->_sceneIdentifierToSceneViewControllerDictionary;
    v2->_sceneIdentifierToSceneViewControllerDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    mutableSceneLayoutElements = v2->_mutableSceneLayoutElements;
    v2->_mutableSceneLayoutElements = (NSMutableOrderedSet *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    appearanceTransitionCompletionBlocks = v2->_appearanceTransitionCompletionBlocks;
    v2->_appearanceTransitionCompletionBlocks = (NSMapTable *)v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSceneLayoutViewController;
  -[PBSceneLayoutViewController dealloc](&v3, "dealloc");
}

- (id)sceneHandleDelegate
{
  return objc_loadWeakRetained((id *)&self->_internalSceneHandleDelegate);
}

- (void)setSceneHandleDelegate:(id)a3
{
  id v4 = a3;
  p_internalSceneHandleDelegate = &self->_internalSceneHandleDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_internalSceneHandleDelegate);

  if (WeakRetained != v4) {
    objc_storeWeak((id *)p_internalSceneHandleDelegate, v4);
  }
}

- (id)displayPublisherDelegate
{
  return objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
}

- (void)setDisplayPublisherDelegate:(id)a3
{
  id v4 = a3;
  p_internalDisplayPublisherDelegate = &self->_internalDisplayPublisherDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_internalDisplayPublisherDelegate);

  if (WeakRetained != v4) {
    objc_storeWeak((id *)p_internalDisplayPublisherDelegate, v4);
  }
}

- (id)debugDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  [v3 appendObject:self->_focusedSceneLayoutElement withName:@"focusedSceneLayoutElement" skipIfNil:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutViewController sceneLayoutElements](self, "sceneLayoutElements"));
  [v3 appendArraySection:v5 withName:@"sceneLayoutElements" skipIfEmpty:1];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutViewController childViewControllers](self, "childViewControllers"));
  [v3 appendArraySection:v6 withName:@"childViewControllers" skipIfEmpty:1];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_appearanceTransitionCompletionBlocks, "keyEnumerator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  [v3 appendArraySection:v8 withName:@"appearanceTransitionCompletionBlocks" skipIfEmpty:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v9;
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  if (self->_focusedSceneLayoutElement)
  {
    focusedSceneLayoutElement = self->_focusedSceneLayoutElement;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &focusedSceneLayoutElement,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046E238 == a6)
  {
    -[PBSceneLayoutViewController setAcceptsEventFocus:]( self,  "setAcceptsEventFocus:",  -[PBSceneLayoutElement isReady](self->_focusedSceneLayoutElement, "isReady", a3, a4, a5));
    -[PBSceneLayoutViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PBSceneLayoutViewController;
    -[PBSceneLayoutViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (NSArray)sceneLayoutElements
{
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableOrderedSet array]( self->_mutableSceneLayoutElements,  "array"));
}

- (PBSceneHandle)focusedSceneHandle
{
  return (PBSceneHandle *)(id)objc_claimAutoreleasedReturnValue( -[PBSceneLayoutElement sceneHandle]( self->_focusedSceneLayoutElement,  "sceneHandle"));
}

- (id)sceneLayoutElementsPassingTest:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10020B678;
  v9[3] = &unk_1003DD188;
  id v11 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = v4;
  id v5 = v11;
  -[PBSceneLayoutViewController enumerateSceneLayoutElementsUsingBlock:]( self,  "enumerateSceneLayoutElementsUsingBlock:",  v9);
  v6 = v10;
  id v7 = v4;

  return v7;
}

- (void)enumerateSceneLayoutElementsUsingBlock:(id)a3
{
  id v4 = a3;
  mutableSceneLayoutElements = self->_mutableSceneLayoutElements;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10020B744;
  v7[3] = &unk_1003DD1B0;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](mutableSceneLayoutElements, "enumerateObjectsUsingBlock:", v7);
}

- (id)sceneLayoutElementsOfClass:(Class)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10020B7BC;
  v4[3] = &unk_1003DD1D0;
  v4[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue( -[PBSceneLayoutViewController sceneLayoutElementsPassingTest:]( self,  "sceneLayoutElementsPassingTest:",  v4));
}

- (id)sceneLayoutElementForSceneIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sceneIdentifierToSceneViewControllerDictionary,  "objectForKey:",  a3));
}

+ (id)sceneLayoutViewControllerForDisplayIdentity:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 rootIdentity]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _displayIdentityToSceneLayoutViewControllerMap]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v6 = -[PBSceneLayoutViewController _init](objc_alloc(&OBJC_CLASS___PBSceneLayoutViewController), "_init");
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _displayIdentityToSceneLayoutViewControllerMap]);
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

+ (PBSceneLayoutViewController)sceneLayoutViewControllerForMainDisplay
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainIdentity](&OBJC_CLASS___FBDisplayManager, "mainIdentity"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sceneLayoutViewControllerForDisplayIdentity:v3]);

  return (PBSceneLayoutViewController *)v4;
}

- (void)removeApplicationLevelSceneLayoutElementForReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083BB8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing application level scene layout element for reason: %{public}@",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10020B9E4;
  v7[3] = &unk_1003DD1F8;
  void v7[4] = self;
  -[PBSceneLayoutViewController enumerateSceneLayoutElementsUsingBlock:]( self,  "enumerateSceneLayoutElementsUsingBlock:",  v7);
}

- (void)_addSceneLayoutElement:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_10020BC84;
  v25[4] = sub_10020BC94;
  id v26 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_10020BC84;
  v23[4] = sub_10020BC94;
  id v24 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10020BCAC;
  v19[3] = &unk_1003DD220;
  id v6 = a3;
  id v20 = v6;
  v21 = v25;
  v22 = v23;
  -[PBSceneLayoutViewController enumerateSceneLayoutElementsUsingBlock:]( self,  "enumerateSceneLayoutElementsUsingBlock:",  v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10020BD28;
  v15[3] = &unk_1003DD248;
  v17 = v25;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  v18 = v23;
  id v8 = objc_retainBlock(v15);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10020BD88;
  v11[3] = &unk_1003DD270;
  v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  v13 = v25;
  v14 = v23;
  id v10 = objc_retainBlock(v11);
  -[PBSceneLayoutViewController _addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:]( self,  "_addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:",  v9,  v4,  v8,  v10);
  -[PBSceneLayoutViewController setFocusedSceneLayoutElement:](self, "setFocusedSceneLayoutElement:", v9);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

- (void)_addSceneLayoutElement:(id)a3 aboveSceneLayoutElement:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10020BFCC;
  v23[3] = &unk_1003D09B8;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  id v11 = v9;
  id v25 = v11;
  id v12 = objc_retainBlock(v23);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10020BFEC;
  v19 = &unk_1003D09B8;
  id v20 = self;
  id v21 = v10;
  id v22 = v11;
  id v13 = v11;
  id v14 = v10;
  v15 = objc_retainBlock(&v16);
  -[PBSceneLayoutViewController _addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:]( self,  "_addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:",  v14,  v5,  v12,  v15,  v16,  v17,  v18,  v19,  v20);
  -[PBSceneLayoutViewController setFocusedSceneLayoutElement:](self, "setFocusedSceneLayoutElement:", v14);
}

- (void)_addSceneLayoutElement:(id)a3 belowSceneLayoutElement:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10020C1BC;
  v23[3] = &unk_1003D09B8;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  id v11 = v9;
  id v25 = v11;
  id v12 = objc_retainBlock(v23);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10020C1DC;
  v19 = &unk_1003D09B8;
  id v20 = self;
  id v21 = v10;
  id v22 = v11;
  id v13 = v11;
  id v14 = v10;
  v15 = objc_retainBlock(&v16);
  -[PBSceneLayoutViewController _addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:]( self,  "_addSceneLayoutElement:animated:insertSceneLayoutElementBlock:insertSubviewBlock:",  v14,  v5,  v12,  v15,  v16,  v17,  v18,  v19,  v20);
  -[PBSceneLayoutViewController setFocusedSceneLayoutElement:](self, "setFocusedSceneLayoutElement:", v14);
}

- (void)_removeSceneLayoutElement:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100083BB8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v10 = (objc_class *)objc_opt_class(v6);
    id v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138413058;
    v27 = v9;
    __int16 v28 = 2048;
    id v29 = v6;
    __int16 v30 = 2112;
    v31 = v12;
    __int16 v32 = 1024;
    BOOL v33 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Remove scene layout element. {sceneIdentifier=%@, sceneLayoutElement=%p, sceneLayoutElementClass=%@, animated=%{BOOL}d}",  buf,  0x26u);
  }

  [v6 willMoveToParentViewController:0];
  [v6 beginAppearanceTransition:0 animated:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
  [WeakRetained sceneLayoutViewController:self didStartTransitionForTransitionElement:v6 forReason:@"Removing Scene"];

  objc_initWeak((id *)buf, self);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_10020C4EC;
  v23 = &unk_1003D0418;
  objc_copyWeak(&v25, (id *)buf);
  id v14 = v6;
  id v24 = v14;
  v15 = objc_retainBlock(&v20);
  appearanceTransitionCompletionBlocks = self->_appearanceTransitionCompletionBlocks;
  uint64_t v17 = objc_retainBlock(v15);
  -[NSMapTable setObject:forKey:]( appearanceTransitionCompletionBlocks,  "setObject:forKey:",  v17,  v14,  v20,  v21,  v22,  v23);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement identifier](self->_focusedSceneLayoutElement, "identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  LODWORD(appearanceTransitionCompletionBlocks) = [v18 isEqualToString:v19];

  if ((_DWORD)appearanceTransitionCompletionBlocks) {
    -[PBSceneLayoutViewController setFocusedSceneLayoutElement:](self, "setFocusedSceneLayoutElement:", 0LL);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)_endAppearanceTransitionForSceneLayoutElement:(id)a3
{
  objc_super v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_appearanceTransitionCompletionBlocks, "objectForKey:", a3));
  v3[2]();
}

+ (id)_displayIdentityToSceneLayoutViewControllerMap
{
  if (qword_100471508 != -1) {
    dispatch_once(&qword_100471508, &stru_1003DD290);
  }
  return (id)qword_100471500;
}

- (void)_finishAddingSceneLayoutElement:(id)a3
{
  id v4 = a3;
  [v4 endAppearanceTransition];
  [v4 didMoveToParentViewController:self];
  -[NSMapTable removeObjectForKey:](self->_appearanceTransitionCompletionBlocks, "removeObjectForKey:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneHandle]);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
    char v7 = objc_opt_respondsToSelector(WeakRetained, "sceneLayoutViewController:didAddTransitionElement:");

    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
    [v8 sceneLayoutViewController:self didAddTransitionElement:v4];
  }

  else
  {
    id v9 = sub_100083BB8();
    id v8 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
      sub_100293924((os_log_s *)v8);
    }
  }

LABEL_7:
  id v10 = sub_100083BB8();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v13 = 138412546;
    id v14 = v12;
    __int16 v15 = 2048;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Did finish adding scene layout element. {sceneIdentifier=%@, sceneLayoutElement=%p}",  (uint8_t *)&v13,  0x16u);
  }
}

- (void)_finishRemovingSceneLayoutElement:(id)a3
{
  id v4 = a3;
  [v4 endAppearanceTransition];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewIfLoaded]);
  [v5 removeFromSuperview];

  [v4 removeFromParentViewController];
  sceneIdentifierToSceneViewControllerDictionary = self->_sceneIdentifierToSceneViewControllerDictionary;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[NSMutableDictionary removeObjectForKey:](sceneIdentifierToSceneViewControllerDictionary, "removeObjectForKey:", v7);

  -[NSMutableOrderedSet removeObject:](self->_mutableSceneLayoutElements, "removeObject:", v4);
  -[NSMapTable removeObjectForKey:](self->_appearanceTransitionCompletionBlocks, "removeObjectForKey:", v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
  char v9 = objc_opt_respondsToSelector(WeakRetained, "sceneLayoutViewController:didRemoveTransitionElement:");

  if ((v9 & 1) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
    [v10 sceneLayoutViewController:self didRemoveTransitionElement:v4];
  }

  id v11 = sub_100083BB8();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v14 = 138412546;
    __int16 v15 = v13;
    __int16 v16 = 2048;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Did finish removing scene layout element. {sceneIdentifier=%@, sceneLayoutElement=%p}",  (uint8_t *)&v14,  0x16u);
  }
}

- (void)_insertSceneLayoutElement:(id)a3 aboveSceneLayoutElement:(id)a4
{
  mutableSceneLayoutElements = self->_mutableSceneLayoutElements;
  id v7 = a4;
  id v8 = a3;
  -[NSMutableOrderedSet removeObject:](mutableSceneLayoutElements, "removeObject:", v8);
  char v9 = (char *)-[NSMutableOrderedSet indexOfObject:](self->_mutableSceneLayoutElements, "indexOfObject:", v7);

  id v10 = self->_mutableSceneLayoutElements;
  else {
    -[NSMutableOrderedSet insertObject:atIndex:](v10, "insertObject:atIndex:", v8, v9 + 1);
  }
}

- (void)_insertSceneLayoutElement:(id)a3 belowSceneLayoutElement:(id)a4
{
  id v6 = a3;
  mutableSceneLayoutElements = self->_mutableSceneLayoutElements;
  id v8 = a4;
  -[NSMutableOrderedSet removeObject:](mutableSceneLayoutElements, "removeObject:", v6);
  char v9 = (char *)-[NSMutableOrderedSet indexOfObject:](self->_mutableSceneLayoutElements, "indexOfObject:", v8);

  if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0LL)
  {
    id v12 = v6;
    id v11 = 0LL;
  }

  else
  {
    id v11 = v9 - 1;
    id v12 = v6;
  }

  -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableSceneLayoutElements, "insertObject:atIndex:", v12, v11);
}

- (void)_insertSceneLayoutElement:(id)a3
{
  mutableSceneLayoutElements = self->_mutableSceneLayoutElements;
  id v5 = a3;
  -[NSMutableOrderedSet removeObject:](mutableSceneLayoutElements, "removeObject:", v5);
  -[NSMutableOrderedSet addObject:](self->_mutableSceneLayoutElements, "addObject:", v5);
}

- (void)_addSceneLayoutElement:(id)a3 animated:(BOOL)a4 insertSceneLayoutElementBlock:(id)a5 insertSubviewBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = (PBSceneLayoutElement *)a3;
  id v11 = (void (**)(void))a5;
  id v12 = (void (**)(void))a6;
  id v13 = sub_100083BB8();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement identifier](v10, "identifier"));
    __int16 v16 = (objc_class *)objc_opt_class(v10);
    id v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138413058;
    v36 = v15;
    __int16 v37 = 2048;
    v38 = v10;
    __int16 v39 = 2112;
    v40 = v18;
    __int16 v41 = 1024;
    BOOL v42 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Add scene layout element. {sceneIdentifier=%@, sceneLayoutElement=%p, sceneLayoutElementClass=%@, animated=%{BOOL}d}",  buf,  0x26u);
  }

  sceneIdentifierToSceneViewControllerDictionary = self->_sceneIdentifierToSceneViewControllerDictionary;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement identifier](v10, "identifier"));
  -[NSMutableDictionary setObject:forKey:]( sceneIdentifierToSceneViewControllerDictionary,  "setObject:forKey:",  v10,  v20);

  v11[2](v11);
  if (self->_focusedSceneLayoutElement != v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
    char v22 = objc_opt_respondsToSelector( WeakRetained,  "sceneLayoutViewControllerWillUpdateFocus:toTransitionElement:fromTransitionElement:forReason:");

    if ((v22 & 1) != 0)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
      [v23 sceneLayoutViewControllerWillUpdateFocus:self toTransitionElement:v10 fromTransitionElement:self->_focusedSceneLayoutElement forReason:@"Adding Scene"];
    }
  }

  -[PBSceneLayoutViewController addChildViewController:](self, "addChildViewController:", v10);
  -[PBSceneLayoutElement beginAppearanceTransition:animated:](v10, "beginAppearanceTransition:animated:", 1LL, v8);
  v12[2](v12);
  id v24 = objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
  [v24 sceneLayoutViewController:self didStartTransitionForTransitionElement:v10 forReason:@"Adding Scene"];

  objc_initWeak((id *)buf, self);
  id v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  v31 = sub_10020CDC8;
  __int16 v32 = &unk_1003D0418;
  objc_copyWeak(&v34, (id *)buf);
  id v25 = v10;
  BOOL v33 = v25;
  id v26 = objc_retainBlock(&v29);
  appearanceTransitionCompletionBlocks = self->_appearanceTransitionCompletionBlocks;
  __int16 v28 = objc_retainBlock(v26);
  -[NSMapTable setObject:forKey:]( appearanceTransitionCompletionBlocks,  "setObject:forKey:",  v28,  v25,  v29,  v30,  v31,  v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

- (void)setFocusedSceneLayoutElement:(id)a3
{
  id v5 = (PBSceneLayoutElement *)a3;
  p_focusedSceneLayoutElement = &self->_focusedSceneLayoutElement;
  focusedSceneLayoutElement = self->_focusedSceneLayoutElement;
  if (focusedSceneLayoutElement != v5)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement sceneHandle](focusedSceneLayoutElement, "sceneHandle"));
    -[PBSceneLayoutElement removeObserver:forKeyPath:context:]( *p_focusedSceneLayoutElement,  "removeObserver:forKeyPath:context:",  self,  @"ready",  off_10046E238);
    objc_storeStrong((id *)&self->_focusedSceneLayoutElement, a3);
    -[PBSceneLayoutViewController setAcceptsEventFocus:]( self,  "setAcceptsEventFocus:",  -[PBSceneLayoutElement isReady](v5, "isReady"));
    -[PBSceneLayoutViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[PBSceneLayoutElement addObserver:forKeyPath:options:context:]( *p_focusedSceneLayoutElement,  "addObserver:forKeyPath:options:context:",  self,  @"ready",  0LL,  off_10046E238);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_internalSceneHandleDelegate);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement sceneHandle](v5, "sceneHandle"));
    [WeakRetained sceneLayoutViewController:self didChangeOldFocusedSceneHandle:v8 toSceneHandle:v10];
  }
}

- (NSMutableDictionary)sceneIdentifierToSceneViewControllerDictionary
{
  return self->_sceneIdentifierToSceneViewControllerDictionary;
}

- (NSMutableOrderedSet)mutableSceneLayoutElements
{
  return self->_mutableSceneLayoutElements;
}

- (NSMapTable)appearanceTransitionCompletionBlocks
{
  return self->_appearanceTransitionCompletionBlocks;
}

- (PBSceneLayoutElement)focusedSceneLayoutElement
{
  return self->_focusedSceneLayoutElement;
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (PBSceneLayoutViewControllerDisplaySceneHandleDelegate)internalSceneHandleDelegate
{
  return (PBSceneLayoutViewControllerDisplaySceneHandleDelegate *)objc_loadWeakRetained((id *)&self->_internalSceneHandleDelegate);
}

- (void)setInternalSceneHandleDelegate:(id)a3
{
}

- (PBSceneLayoutViewControllerDisplayPublisherDelegate)internalDisplayPublisherDelegate
{
  return (PBSceneLayoutViewControllerDisplayPublisherDelegate *)objc_loadWeakRetained((id *)&self->_internalDisplayPublisherDelegate);
}

- (void)setInternalDisplayPublisherDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end