@interface PBSystemGestureKeychordAssistant
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NSMutableSet)gestureRecognizers;
- (PBSystemGestureKeychordAssistant)initWithSystemGestureRecognizerManager:(id)a3 systemGestureManager:(id)a4;
- (PBSystemGestureManager)systemGestureManager;
- (PBSystemGestureRecognizerManager)systemGestureRecognizerManager;
- (void)_systemKeychordRecognized:(id)a3;
- (void)addKeychordGestureWithPressTypes:(id)a3 minimumPressDuration:(double)a4 target:(id)a5 action:(SEL)a6;
- (void)dealloc;
@end

@implementation PBSystemGestureKeychordAssistant

- (PBSystemGestureKeychordAssistant)initWithSystemGestureRecognizerManager:(id)a3 systemGestureManager:(id)a4
{
  id v7 = a3;
  objc_initWeak(&location, a4);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBSystemGestureKeychordAssistant;
  v8 = -[PBSystemGestureKeychordAssistant init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_systemGestureRecognizerManager, a3);
    id v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v9->_systemGestureManager, v10);

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    gestureRecognizers = v9->_gestureRecognizers;
    v9->_gestureRecognizers = v11;
  }

  objc_destroyWeak(&location);

  return v9;
}

- (void)dealloc
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_gestureRecognizers;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[PBSystemGestureRecognizerManager removeGestureRecognizer:]( self->_systemGestureRecognizerManager,  "removeGestureRecognizer:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBSystemGestureKeychordAssistant;
  -[PBSystemGestureKeychordAssistant dealloc](&v8, "dealloc");
}

- (void)addKeychordGestureWithPressTypes:(id)a3 minimumPressDuration:(double)a4 target:(id)a5 action:(SEL)a6
{
  id v10 = a5;
  id v11 = a3;
  __int128 v12 = -[PBSystemKeychordGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___PBSystemKeychordGestureRecognizer),  "initWithTarget:action:",  v10,  a6);

  -[PBSystemKeychordGestureRecognizer setMinimumPressDuration:](v12, "setMinimumPressDuration:", a4);
  -[PBSystemKeychordGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", v11);
  -[PBSystemKeychordGestureRecognizer setRequiredPressTypes:](v12, "setRequiredPressTypes:", v11);

  -[PBSystemKeychordGestureRecognizer setDelegate:](v12, "setDelegate:", self);
  -[PBSystemKeychordGestureRecognizer addTarget:action:](v12, "addTarget:action:", self, "_systemKeychordRecognized:");
  -[NSMutableSet addObject:](self->_gestureRecognizers, "addObject:", v12);
  -[PBSystemGestureRecognizerManager addGestureRecognizer:]( self->_systemGestureRecognizerManager,  "addGestureRecognizer:",  v12);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_systemKeychordRecognized:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10012B550;
    v6[3] = &unk_1003D7770;
    id v7 = v4;
    objc_super v8 = self;
    id v5 = objc_retainBlock(v6);
    ((void (*)(void *, uint64_t))v5[2])(v5, 102LL);
    ((void (*)(void *, uint64_t))v5[2])(v5, 103LL);
  }
}

- (PBSystemGestureRecognizerManager)systemGestureRecognizerManager
{
  return self->_systemGestureRecognizerManager;
}

- (PBSystemGestureManager)systemGestureManager
{
  return (PBSystemGestureManager *)objc_loadWeakRetained((id *)&self->_systemGestureManager);
}

- (NSMutableSet)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void).cxx_destruct
{
}

@end