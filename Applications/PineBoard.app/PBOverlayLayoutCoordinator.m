@interface PBOverlayLayoutCoordinator
+ (id)defaultCoordinator;
- (BSInvalidatable)stateCaptureHandle;
- (CGRect)bounds;
- (NSHashTable)childLayoutCoordinators;
- (NSHashTable)controllers;
- (NSHashTable)occlusionAssertions;
- (PBOverlayLayoutCoordinator)initWithBounds:(CGRect)a3;
- (PBOverlayLayoutCoordinator)initWithParentLayoutCoordinator:(id)a3;
- (PBOverlayLayoutCoordinator)initWithWorkspaceGeometry:(id)a3;
- (PBOverlayLayoutCoordinator)parentLayoutCoordinator;
- (PBOverlayLayoutElementMap)elementMap;
- (id)_lock_publishChangeSet:(id)a3 originatingFrom:(id)a4 withTransitionContext:(id)a5;
- (id)_lock_updateElementFilterForLayoutLevelOcclusion;
- (id)beginElementOcclusionAtLayoutLevel:(int64_t)a3 reason:(id)a4 withTransitionContext:(id)a5;
- (id)performBatchUpdateForController:(id)a3 updating:(id)a4 andRemoving:(id)a5 withTransitionContext:(id)a6;
- (id)stateDumpBuilder;
- (os_unfair_lock_s)lock;
- (void)_addChildLayoutCoordinator:(id)a3;
- (void)_lock_propagateSnapshotToChildLayoutCoordinatorsWithTransitionContext:(id)a3;
- (void)_receiveMapSnapshot:(id)a3 from:(id)a4 withTransitionContext:(id)a5;
- (void)_removeChildLayoutCoordinator:(id)a3;
- (void)addController:(id)a3;
- (void)dealloc;
- (void)occlusionAssertion:(id)a3 didInvalidateWithTransitionContext:(id)a4;
- (void)removeController:(id)a3;
- (void)setStateCaptureHandle:(id)a3;
@end

@implementation PBOverlayLayoutCoordinator

+ (id)defaultCoordinator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B783C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004709D0 != -1) {
    dispatch_once(&qword_1004709D0, block);
  }
  return (id)qword_1004709C8;
}

- (PBOverlayLayoutCoordinator)initWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutCoordinator;
  v7 = -[PBOverlayLayoutCoordinator init](&v29, "init");
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 261LL));
    controllers = v8->_controllers;
    v8->_controllers = (NSHashTable *)v9;

    v11 = -[PBOverlayLayoutElementMap initWithBounds:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutElementMap),  "initWithBounds:",  x,  y,  width,  height);
    elementMap = v8->_elementMap;
    v8->_elementMap = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 261LL));
    childLayoutCoordinators = v8->_childLayoutCoordinators;
    v8->_childLayoutCoordinators = (NSHashTable *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 261LL));
    occlusionAssertions = v8->_occlusionAssertions;
    v8->_occlusionAssertions = (NSHashTable *)v15;

    objc_initWeak(&location, v8);
    v17 = (objc_class *)objc_opt_class(v8);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%p)", v19, v8));

    v21 = &_dispatch_main_q;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000B7AA8;
    v26[3] = &unk_1003D04B8;
    objc_copyWeak(&v27, &location);
    uint64_t v22 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v20, v26);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    stateCaptureHandle = v8->_stateCaptureHandle;
    v8->_stateCaptureHandle = (BSInvalidatable *)v23;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (PBOverlayLayoutCoordinator)initWithWorkspaceGeometry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    if (sub_1001C9E00())
    {
      [v5 fullDisplayBounds];
      double v7 = v14;
      double v9 = v15;
      double v11 = v16;
      double v13 = v17;
    }

    v18 = -[PBOverlayLayoutCoordinator initWithBounds:](self, "initWithBounds:", v7, v9, v11, v13);

    return v18;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"workspaceGeometry != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B238();
    }
    result = (PBOverlayLayoutCoordinator *)_bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBOverlayLayoutCoordinator)initWithParentLayoutCoordinator:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = v5;
    [v5 bounds];
    double v7 = -[PBOverlayLayoutCoordinator initWithBounds:](self, "initWithBounds:");
    double v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_parentLayoutCoordinator, a3);
      -[PBOverlayLayoutCoordinator _addChildLayoutCoordinator:]( v8->_parentLayoutCoordinator,  "_addChildLayoutCoordinator:",  v8);
    }

    return v8;
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"parentLayoutCoordinator != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B2E0();
    }
    result = (PBOverlayLayoutCoordinator *)_bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)dealloc
{
  stateCaptureHandle = self->_stateCaptureHandle;
  self->_stateCaptureHandle = 0LL;

  -[PBOverlayLayoutCoordinator _removeChildLayoutCoordinator:]( self->_parentLayoutCoordinator,  "_removeChildLayoutCoordinator:",  self);
  parentLayoutCoordinator = self->_parentLayoutCoordinator;
  self->_parentLayoutCoordinator = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutCoordinator;
  -[PBOverlayLayoutCoordinator dealloc](&v5, "dealloc");
}

- (CGRect)bounds
{
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)addController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_1000831A4();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = -[PBOverlayLayoutElementMap count](self->_elementMap, "count");
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 resolvedName]);
      int v9 = 134218498;
      double v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = v7;
      __int16 v13 = 2114;
      double v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adding controller {coordinator=%p, elements.count=%lu, controller=%{public}@}",  (uint8_t *)&v9,  0x20u);
    }

    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    -[NSHashTable addObject:](self->_controllers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)removeController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/coordinator/removeController",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = sub_1000831A4();
    unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = -[PBOverlayLayoutElementMap count](self->_elementMap, "count");
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 resolvedName]);
      *(_DWORD *)buf = 134218498;
      v24 = self;
      __int16 v25 = 2048;
      unint64_t v26 = v8;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Removing controller {coordinator=%p, elements.count=%lu, controller=%{public}@}",  buf,  0x20u);
    }

    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    if (-[NSHashTable containsObject:](self->_controllers, "containsObject:", v4))
    {
      -[NSHashTable removeObject:](self->_controllers, "removeObject:", v4);
      elementMap = self->_elementMap;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000B81A4;
      v20[3] = &unk_1003D5568;
      __int16 v11 = (os_log_s *)v4;
      v21 = v11;
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap removeLayoutElementsPassingTest:]( elementMap,  "removeLayoutElementsPassingTest:",  v20));

      __int16 v13 = v21;
    }

    else
    {
      id v14 = sub_1000831A4();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 coordinator]);
        *(_DWORD *)buf = 134218498;
        v24 = self;
        __int16 v25 = 2048;
        unint64_t v26 = (unint64_t)v19;
        __int16 v27 = 2114;
        id v28 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Attempted to remove controller not found in coordinator {coordinator=%p, controller.coordinator=%p, controller=%{public}@}",  buf,  0x20u);
      }
    }

    os_unfair_lock_unlock(&self->_lock);
    id v15 = sub_1000831A4();
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = -[PBOverlayLayoutElementMap count](self->_elementMap, "count");
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 resolvedName]);
      *(_DWORD *)buf = 134218498;
      v24 = self;
      __int16 v25 = 2048;
      unint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removed controller {coordinator=%p, elements.count=%lu, controller=%{public}@}",  buf,  0x20u);
    }

    os_activity_scope_leave(&state);
  }
}

- (id)performBatchUpdateForController:(id)a3 updating:(id)a4 andRemoving:(id)a5 withTransitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"controller != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B388();
    }
    _bs_set_crash_log_message([v30 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B84F0LL);
  }

  id v14 = v13;
  if ([v11 count] || objc_msgSend(v12, "count"))
  {
    id v15 = sub_1000831A4();
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10027B430((uint64_t)self, v10, v16);
    }

    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap removeLayoutElementsWithIdentifiers:addLayoutElements:]( self->_elementMap,  "removeLayoutElementsWithIdentifiers:addLayoutElements:",  v12,  v11));
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_publishChangeSet:originatingFrom:withTransitionContext:]( self,  "_lock_publishChangeSet:originatingFrom:withTransitionContext:",  v17,  v10,  v14));
    id v19 = sub_1000831A4();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v12;
      v21 = v18;
      uint64_t v22 = v14;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 resolvedName]);
      unint64_t v24 = -[PBOverlayLayoutElementMap count](self->_elementMap, "count");
      *(_DWORD *)buf = 134218754;
      v33 = self;
      __int16 v34 = 2114;
      v35 = v23;
      __int16 v36 = 2048;
      unint64_t v37 = v24;
      __int16 v38 = 2048;
      id v39 = [v17 count];
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Performed batch update {coordinator=%p, controller=%{public}@, totalElements.count=%lu, changeSet.count=%lu}",  buf,  0x2Au);

      id v14 = v22;
      v18 = v21;
      id v12 = v31;
    }

    os_unfair_lock_unlock(&self->_lock);
    if ([v17 count])
    {
      id v25 = sub_1000831A4();
      unint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 resolvedName]);
        id v28 = [v18 count];
        *(_DWORD *)buf = 134218498;
        v33 = self;
        __int16 v34 = 2114;
        v35 = v27;
        __int16 v36 = 2048;
        unint64_t v37 = (unint64_t)v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Returning updates for originating controller {coordinator=%p, controller=%{public}@, updates.count=%lu}",  buf,  0x20u);
      }
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v18;
}

- (id)beginElementOcclusionAtLayoutLevel:(int64_t)a3 reason:(id)a4 withTransitionContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 < 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"layoutLevel > PBSLayoutLevelNone"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B4E0();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B8718LL);
  }

  id v10 = v9;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/coordinator/beginOcclusion",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  id v12 = sub_1000831A4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = sub_1001A3184(a3);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 134218498;
    unint64_t v24 = self;
    __int16 v25 = 2114;
    unint64_t v26 = v15;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Begin element occlusion {coordinator=%p, level=%{public}@, reason=%{public}@}",  buf,  0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  unint64_t v17 = -[_PBOverlayLayoutLevelOcclusionAssertion initWithController:layoutLevel:reason:]( objc_alloc(&OBJC_CLASS____PBOverlayLayoutLevelOcclusionAssertion),  "initWithController:layoutLevel:reason:",  self,  a3,  v8);
  -[NSHashTable addObject:](self->_occlusionAssertions, "addObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_updateElementFilterForLayoutLevelOcclusion]( self,  "_lock_updateElementFilterForLayoutLevelOcclusion"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_publishChangeSet:originatingFrom:withTransitionContext:]( self,  "_lock_publishChangeSet:originatingFrom:withTransitionContext:",  v18,  0LL,  v10));
  os_unfair_lock_unlock(p_lock);

  os_activity_scope_leave(&state);
  return v17;
}

- (void)occlusionAssertion:(id)a3 didInvalidateWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/coordinator/endOcclusion",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v17);
  id v9 = sub_1000831A4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = sub_1001A3184((unint64_t)[v6 layoutLevel]);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
    *(_DWORD *)buf = 134218498;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "End element occlusion {coordinator=%p, level=%{public}@, reason=%{public}@}",  buf,  0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_occlusionAssertions, "removeObject:", v6);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_updateElementFilterForLayoutLevelOcclusion]( self,  "_lock_updateElementFilterForLayoutLevelOcclusion"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_publishChangeSet:originatingFrom:withTransitionContext:]( self,  "_lock_publishChangeSet:originatingFrom:withTransitionContext:",  v15,  0LL,  v7));
  os_unfair_lock_unlock(p_lock);

  os_activity_scope_leave(&v17);
}

- (id)_lock_publishChangeSet:(id)a3 originatingFrom:(id)a4 withTransitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PBOverlayLayoutCoordinator _lock_propagateSnapshotToChildLayoutCoordinatorsWithTransitionContext:]( self,  "_lock_propagateSnapshotToChildLayoutCoordinatorsWithTransitionContext:",  v10);
  if ([v8 isEmpty])
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  else
  {
    uint64_t v21 = 0LL;
    __int16 v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    unint64_t v24 = sub_1000B8AC0;
    __int16 v25 = sub_1000B8AD0;
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    id v12 = self->_controllers;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000B8AE8;
    v15[3] = &unk_1003D5590;
    id v16 = v9;
    __int16 v20 = &v21;
    id v13 = v12;
    os_activity_scope_state_s v17 = v13;
    v18 = self;
    id v19 = v10;
    [v8 enumerateUpdatesUsingBlock:v15];
    id v11 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }

  return v11;
}

- (id)_lock_updateElementFilterForLayoutLevelOcclusion
{
  double v3 = self->_occlusionAssertions;
  if (-[NSHashTable count](v3, "count"))
  {
    id v4 = v3;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      uint64_t v8 = -1LL;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) layoutLevel];
        }

        id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v6);
    }

    else
    {
      uint64_t v8 = -1LL;
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000B9854;
    v19[3] = &unk_1003D55B0;
    v19[4] = v8;
    id v12 = objc_retainBlock(v19);
  }

  else
  {
    id v12 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap setElementFilter:](self->_elementMap, "setElementFilter:", v12));
  return v13;
}

- (void)_lock_propagateSnapshotToChildLayoutCoordinatorsWithTransitionContext:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap currentStateSnapshot](self->_elementMap, "currentStateSnapshot"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = self->_childLayoutCoordinators;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v10),  "_receiveMapSnapshot:from:withTransitionContext:",  v5,  self,  v4,  (void)v11);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (void)_addChildLayoutCoordinator:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"childLayoutCoordinator != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B58C();
    }
LABEL_9:
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B90E8LL);
  }

  id v5 = v4;
  id v6 = (PBOverlayLayoutCoordinator *)objc_claimAutoreleasedReturnValue([v4 parentLayoutCoordinator]);

  if (v6 != self)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Child layout coordinator should have parent property set already"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B634();
    }
    goto LABEL_9;
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_childLayoutCoordinators, "addObject:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap currentStateSnapshot](self->_elementMap, "currentStateSnapshot"));
  [v5 _receiveMapSnapshot:v7 from:self withTransitionContext:0];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeChildLayoutCoordinator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    -[NSHashTable removeObject:](self->_childLayoutCoordinators, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"childLayoutCoordinator != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B6DC();
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

- (void)_receiveMapSnapshot:(id)a3 from:(id)a4 withTransitionContext:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (PBOverlayLayoutCoordinator *)a4;
  id v10 = a5;
  if (self->_parentLayoutCoordinator == v9)
  {
    __int128 v11 = v10;
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap setBaseSnapshot:](self->_elementMap, "setBaseSnapshot:", v8));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator _lock_publishChangeSet:originatingFrom:withTransitionContext:]( self,  "_lock_publishChangeSet:originatingFrom:withTransitionContext:",  v13,  0LL,  v11));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"parentLayoutCoordinator == _parentLayoutCoordinator"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B784();
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
  }

- (id)stateDumpBuilder
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  os_unfair_lock_lock(p_lock);
  id v5 =  objc_msgSend( v4,  "appendUnsignedInteger:withKey:",  -[NSHashTable count](self->_controllers, "count"),  @"controllers.count");
  id v6 =  objc_msgSend( v4,  "appendUnsignedInteger:withKey:",  -[NSHashTable count](self->_childLayoutCoordinators, "count"),  @"childLayoutCoordinators.count");
  id v7 = [v4 appendObject:self->_elementMap withKey:@"elementMap"];
  id v8 =  [v4 appendCollection:self->_occlusionAssertions withKey:@"occlusionAssertions" skipIfEmpty:1];
  id v9 = [v4 appendPointer:self->_parentLayoutCoordinator withKey:@"parentLayoutCoordinator"];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PBOverlayLayoutCoordinator)parentLayoutCoordinator
{
  return self->_parentLayoutCoordinator;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSHashTable)controllers
{
  return self->_controllers;
}

- (PBOverlayLayoutElementMap)elementMap
{
  return self->_elementMap;
}

- (NSHashTable)childLayoutCoordinators
{
  return self->_childLayoutCoordinators;
}

- (NSHashTable)occlusionAssertions
{
  return self->_occlusionAssertions;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end