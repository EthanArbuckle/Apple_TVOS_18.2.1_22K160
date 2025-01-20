@interface HUDAnimator
+ (id)sharedAnimator;
- (HUDAnimator)init;
- (id)beginAnimationFromValue:(double)a3 toValue:(double)a4 duration:(double)a5 updateBlock:(id)a6 completionBlock:(id)a7;
- (void)displayLinkFired:(id)a3;
- (void)endAnimation:(id)a3;
- (void)updateAnimation:(id)a3 toValue:(double)a4 duration:(double)a5;
- (void)updateDisplayLink;
@end

@implementation HUDAnimator

- (HUDAnimator)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HUDAnimator;
  v2 = -[HUDAnimator init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    animations = v2->_animations;
    v2->_animations = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationQueue", 0LL);
    animationQueue = v2->_animationQueue;
    v2->_animationQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationDisplayLinkQueue", 0LL);
    displayLinkAccessQueue = v2->_displayLinkAccessQueue;
    v2->_displayLinkAccessQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedAnimator
{
  if (qword_100036498 != -1) {
    dispatch_once(&qword_100036498, &stru_100028728);
  }
  return (id)qword_100036490;
}

- (id)beginAnimationFromValue:(double)a3 toValue:(double)a4 duration:(double)a5 updateBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  displayLinkAccessQueue = (dispatch_queue_s *)self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001F98;
  block[3] = &unk_100028750;
  double v26 = a3;
  double v27 = a4;
  double v28 = a5;
  id v24 = v12;
  id v25 = v13;
  id v16 = v14;
  id v22 = v16;
  v23 = self;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(displayLinkAccessQueue, block);
  -[HUDAnimator updateDisplayLink](self, "updateDisplayLink");
  id v19 = v16;

  return v19;
}

- (void)updateAnimation:(id)a3 toValue:(double)a4 duration:(double)a5
{
  id v8 = a3;
  displayLinkAccessQueue = (dispatch_queue_s *)self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000020D4;
  block[3] = &unk_1000287A0;
  void block[4] = self;
  id v12 = v8;
  double v13 = a4;
  double v14 = a5;
  id v10 = v8;
  dispatch_sync(displayLinkAccessQueue, block);
  -[HUDAnimator updateDisplayLink](self, "updateDisplayLink");
}

- (void)endAnimation:(id)a3
{
  id v4 = a3;
  displayLinkAccessQueue = (dispatch_queue_s *)self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002304;
  block[3] = &unk_1000287C8;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(displayLinkAccessQueue, block);
}

- (void)updateDisplayLink
{
  displayLinkAccessQueue = (dispatch_queue_s *)self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002508;
  block[3] = &unk_1000286E0;
  void block[4] = self;
  dispatch_sync(displayLinkAccessQueue, block);
}

- (void)displayLinkFired:(id)a3
{
  id v4 = a3;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_100002838;
  v18[4] = sub_100002848;
  id v19 = 0LL;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = sub_100002838;
  v16[4] = sub_100002848;
  id v17 = 0LL;
  uint64_t v12 = 0LL;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  CFTimeInterval v5 = CACurrentMediaTime();
  displayLinkAccessQueue = (dispatch_queue_s *)self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002850;
  block[3] = &unk_100028850;
  void block[4] = self;
  void block[5] = v18;
  *(CFTimeInterval *)&block[8] = v5;
  block[6] = v16;
  block[7] = &v12;
  dispatch_sync(displayLinkAccessQueue, block);
  animationQueue = (dispatch_queue_s *)self->_animationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000029D8;
  v10[3] = &unk_100028878;
  *(CFTimeInterval *)&v10[6] = v5;
  v10[4] = v18;
  v10[5] = v16;
  dispatch_sync(animationQueue, v10);
  if (*((_BYTE *)v13 + 24))
  {
    id v8 = (dispatch_queue_s *)self->_displayLinkAccessQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100002BE0;
    v9[3] = &unk_1000286E0;
    v9[4] = self;
    dispatch_sync(v8, v9);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

- (void).cxx_destruct
{
}

@end