@interface PBOverlayLayoutController
- (NSString)description;
- (NSString)name;
- (NSString)resolvedName;
- (PBOverlayLayoutController)init;
- (PBOverlayLayoutController)initWithLayoutCoordinator:(id)a3 name:(id)a4;
- (PBOverlayLayoutController)initWithName:(id)a3;
- (PBOverlayLayoutControllerDelegate)delegate;
- (PBOverlayLayoutCoordinator)coordinator;
- (id)addLayoutElement:(id)a3 withTransitionContext:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)performBatchUpdate:(id)a3 withTransitionContext:(id)a4;
- (id)removeLayoutElementWithIdentifier:(id)a3 andTransitionContext:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_invalidateWithReason:(id)a3;
- (void)coordinator:(id)a3 didUpdateElements:(id)a4 withTransitionContext:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation PBOverlayLayoutController

- (PBOverlayLayoutController)initWithLayoutCoordinator:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutController;
  v9 = -[PBOverlayLayoutController init](&v13, "init");
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    name = v9->_name;
    v9->_name = v10;

    objc_storeStrong((id *)&v9->_coordinator, a3);
    -[PBOverlayLayoutCoordinator addController:](v9->_coordinator, "addController:", v9);
  }

  return v9;
}

- (PBOverlayLayoutController)initWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutCoordinator defaultCoordinator]( &OBJC_CLASS___PBOverlayLayoutCoordinator,  "defaultCoordinator"));
  v6 = -[PBOverlayLayoutController initWithLayoutCoordinator:name:](self, "initWithLayoutCoordinator:name:", v5, v4);

  return v6;
}

- (PBOverlayLayoutController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutCoordinator defaultCoordinator]( &OBJC_CLASS___PBOverlayLayoutCoordinator,  "defaultCoordinator"));
  id v4 = -[PBOverlayLayoutController initWithLayoutCoordinator:name:](self, "initWithLayoutCoordinator:name:", v3, 0LL);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutController;
  -[PBOverlayLayoutController dealloc](&v3, "dealloc");
}

- (id)performBatchUpdate:(id)a3 withTransitionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_coordinator)
  {
    v9 = v8;
    v10 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/controller/performBatchUpdate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    os_activity_scope_enter(v10, &state);
    if ([v7 count] && self->_coordinator)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedElements]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000916BC;
      v18[3] = &unk_1003D4360;
      v18[4] = self;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", v18));

      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v7 removedElementIdentifiers]);
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutCoordinator performBatchUpdateForController:updating:andRemoving:withTransitionContext:]( self->_coordinator,  "performBatchUpdateForController:updating:andRemoving:withTransitionContext:",  self,  v12,  v13,  v9));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bs_mapNoNulls:", &stru_1003D43A0));
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }

    os_activity_scope_leave(&state);

    return v15;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing coordinator - controller might have been invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002793F4(a2, (uint64_t)self, (uint64_t)v17);
    }
    id result = (id) _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
  }

  return result;
}

- (NSString)resolvedName
{
  name = self->_name;
  if (name) {
    objc_super v3 = name;
  }
  else {
    objc_super v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutController description](self, "description"));
  }
  return v3;
}

- (void)coordinator:(id)a3 didUpdateElements:(id)a4 withTransitionContext:(id)a5
{
  if (self->_coordinator == a3)
  {
    id v7 = a5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bs_mapNoNulls:", &stru_1003D43C0));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained layoutController:self didUpdateHints:v8 withTransitionContext:v7];
  }

- (void)_invalidateWithReason:(id)a3
{
  id v4 = a3;
  if (self->_coordinator)
  {
    v5 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/controller/invalidate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &v9);
    id v6 = sub_100083294();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Invalidating controller {controller=%p, reason=%{public}@}",  buf,  0x16u);
    }

    -[PBOverlayLayoutCoordinator removeController:](self->_coordinator, "removeController:", self);
    coordinator = self->_coordinator;
    self->_coordinator = 0LL;

    os_activity_scope_leave(&v9);
  }
}

- (void)invalidate
{
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutController succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_name withName:0 skipIfEmpty:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder",  a3));
}

- (NSString)name
{
  return self->_name;
}

- (PBOverlayLayoutControllerDelegate)delegate
{
  return (PBOverlayLayoutControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBOverlayLayoutCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
}

- (id)addLayoutElement:(id)a3 withTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/controller/updateElement",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v12);
    os_activity_scope_state_s v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutBatchUpdate batchUpdateWithUpdatedElement:]( &OBJC_CLASS___PBSOverlayLayoutBatchUpdate,  "batchUpdateWithUpdatedElement:",  v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController performBatchUpdate:withTransitionContext:]( self,  "performBatchUpdate:withTransitionContext:",  v9,  v7));

    os_activity_scope_leave(&v12);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v10;
}

- (id)removeLayoutElementWithIdentifier:(id)a3 andTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "layoutAvoidance/controller/removeElement",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v12);
    os_activity_scope_state_s v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutBatchUpdate batchUpdateWithRemovedElementIdentifier:]( &OBJC_CLASS___PBSOverlayLayoutBatchUpdate,  "batchUpdateWithRemovedElementIdentifier:",  v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController performBatchUpdate:withTransitionContext:]( self,  "performBatchUpdate:withTransitionContext:",  v9,  v7));

    os_activity_scope_leave(&v12);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v10;
}

@end