@interface HUDDurationLayer
- (HUDDurationLayer)init;
- (OS_dispatch_queue)queue;
- (double)hangDuration;
- (double)updateInterval;
- (void)setHangDuration:(double)a3;
- (void)setHangDuration:(double)a3 animated:(BOOL)a4;
- (void)setQueue:(id)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation HUDDurationLayer

- (HUDDurationLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HUDDurationLayer;
  v2 = -[HUDDurationLayer init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    layer = v2->super.super._attr.layer;
    v2->super.super._attr.layer = 0LL;

    v3->_currentAnimation = 0x3FA999999999999ALL;
    v5 = v3;
  }

  return v3;
}

- (void)setHangDuration:(double)a3 animated:(BOOL)a4
{
  state = self->super._state;
  if (*(double *)&state == a3)
  {
    id v6 = sub_1000031C4();
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100015614(v7, a3, v8, v9);
    }
  }

  else if (a4)
  {
    if (!self->super.super._attr.layer)
    {
      id v11 = sub_1000017E0(*(double *)&state);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[HUDDurationLayer setString:](self, "setString:", v12);

      id v13 = sub_1000031C4();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1000156EC(self, v14, a3);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](&OBJC_CLASS___HUDAnimator, "sharedAnimator"));
      v16 = self->super._state;
      currentAnimation = self->_currentAnimation;
      v32[4] = self;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100001B6C;
      v33[3] = &unk_1000286B8;
      v33[4] = self;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100001C48;
      v32[3] = &unk_100028708;
      v18 = (void *)objc_claimAutoreleasedReturnValue( [v15 beginAnimationFromValue:v33 toValue:v32 duration:*(double *)&v16 updateBlock:a3 completionBlock:*(double *)&currentAnimation]);
      layer = self->super.super._attr.layer;
      self->super.super._attr.layer = v18;
    }

    *(double *)&self->super._state = a3;
    id v20 = sub_1000031C4();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100015680(v21, a3, v22, v23);
    }

    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](&OBJC_CLASS___HUDAnimator, "sharedAnimator"));
    -[os_log_s updateAnimation:toValue:duration:]( v7,  "updateAnimation:toValue:duration:",  self->super.super._attr.layer,  a3,  *(double *)&self->_currentAnimation);
  }

  else
  {
    *(double *)&self->super._state = a3;
    v24 = self->super.super._attr.layer;
    if (v24)
    {
      self->super.super._attr.layer = 0LL;
      id v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](&OBJC_CLASS___HUDAnimator, "sharedAnimator"));
      [v26 endAnimation:v25];

      id v27 = sub_1000031C4();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_100015798(v28, a3, v29, v30);
      }
    }

    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
    id v31 = sub_1000017E0(a3);
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    -[HUDDurationLayer setString:](self, "setString:", v7);
  }
}

- (double)hangDuration
{
  return *(double *)&self->super._state;
}

- (void)setHangDuration:(double)a3
{
  *(double *)&self->super._state = a3;
}

- (double)updateInterval
{
  return *(double *)&self->_currentAnimation;
}

- (void)setUpdateInterval:(double)a3
{
  *(double *)&self->_currentAnimation = a3;
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)&self->_hangDuration;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end