@interface PBSystemUIServiceConduit
- (PBSystemUIServiceConduit)init;
- (PBSystemUIServiceSystemState)systemState;
- (void)setCurrentScheduledSleep:(id)a3;
- (void)setDictationDeviceIdentifier:(id)a3;
- (void)setPlaybackControlsState:(int64_t)a3;
- (void)setSiriPresentationVisibility:(int64_t)a3;
- (void)setSplitViewVisibility:(int64_t)a3;
- (void)updateSystemStateUsingBlock:(id)a3;
@end

@implementation PBSystemUIServiceConduit

- (PBSystemUIServiceConduit)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceConduit;
  v2 = -[PBSystemUIServiceConduit init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PBSystemUIServiceSystemState);
    systemState = v2->_systemState;
    v2->_systemState = v3;
  }

  return v2;
}

- (void)updateSystemStateUsingBlock:(id)a3
{
  v5 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  if (v5)
  {
    id v6 = -[PBSystemUIServiceSystemState mutableCopy](self->_systemState, "mutableCopy");
    v5[2](v5, v6);
    id v7 = [v6 copy];
    if ((BSEqualObjects(self->_systemState, v7) & 1) == 0)
    {
      -[PBSystemUIServiceConduit willChangeValueForKey:](self, "willChangeValueForKey:", @"systemState");
      objc_storeStrong((id *)&self->_systemState, v7);
      -[PBSystemUIServiceConduit didChangeValueForKey:](self, "didChangeValueForKey:", @"systemState");
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292684(a2, (uint64_t)self, (uint64_t)v8);
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)setPlaybackControlsState:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100200EEC;
  v3[3] = &unk_1003DCDB0;
  v3[4] = a3;
  -[PBSystemUIServiceConduit updateSystemStateUsingBlock:](self, "updateSystemStateUsingBlock:", v3);
}

- (void)setSplitViewVisibility:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100200F58;
  v3[3] = &unk_1003DCDB0;
  v3[4] = a3;
  -[PBSystemUIServiceConduit updateSystemStateUsingBlock:](self, "updateSystemStateUsingBlock:", v3);
}

- (void)setSiriPresentationVisibility:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100200FC4;
  v3[3] = &unk_1003DCDB0;
  v3[4] = a3;
  -[PBSystemUIServiceConduit updateSystemStateUsingBlock:](self, "updateSystemStateUsingBlock:", v3);
}

- (void)setDictationDeviceIdentifier:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100201058;
  v5[3] = &unk_1003DCDD8;
  id v6 = a3;
  id v4 = v6;
  -[PBSystemUIServiceConduit updateSystemStateUsingBlock:](self, "updateSystemStateUsingBlock:", v5);
}

- (void)setCurrentScheduledSleep:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002010EC;
  v5[3] = &unk_1003DCDD8;
  id v6 = a3;
  id v4 = v6;
  -[PBSystemUIServiceConduit updateSystemStateUsingBlock:](self, "updateSystemStateUsingBlock:", v5);
}

- (PBSystemUIServiceSystemState)systemState
{
  return self->_systemState;
}

- (void).cxx_destruct
{
}

@end