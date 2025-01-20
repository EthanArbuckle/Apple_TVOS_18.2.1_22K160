@interface MPConditionalAction
+ (id)conditionalAction;
- (MPAction)actionIfFalse;
- (MPAction)actionIfTrue;
- (MPConditionalAction)init;
- (NSString)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureActions;
- (void)configureTarget;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setAction:(id)a3 forCondition:(BOOL)a4;
- (void)setPredicate:(id)a3;
@end

@implementation MPConditionalAction

+ (id)conditionalAction
{
  return objc_alloc_init(&OBJC_CLASS___MPConditionalAction);
}

- (MPConditionalAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPConditionalAction;
  result = -[MPAction init](&v3, "init");
  if (result)
  {
    result->_predicate = 0LL;
    result->_actionIfTrue = 0LL;
    result->_actionIfFalse = 0LL;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPConditionalAction;
  -[MPAction dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MPConditionalAction;
  id v4 = -[MPAction copyWithZone:](&v8, "copyWithZone:", a3);
  [v4 setPredicate:self->_predicate];
  id v5 = -[MPAction copy](self->_actionIfTrue, "copy");
  [v4 setAction:v5 forCondition:1];

  id v6 = -[MPAction copy](self->_actionIfFalse, "copy");
  [v4 setAction:v6 forCondition:0];

  return v4;
}

- (void)setPredicate:(id)a3
{
  predicate = self->_predicate;
  if (predicate)
  {

    self->_predicate = 0LL;
  }

  id v6 = (NSString *)[a3 copy];
  self->_predicate = v6;
  action = self->super._action;
  if (action) {
    -[MCAction setPredicate:](action, "setPredicate:", v6);
  }
}

- (void)setAction:(id)a3 forCondition:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_msgSend(-[MPAction parentDocument](self, "parentDocument"), "undoManager");
  if (v7)
  {
    objc_super v8 = v7;
    if (v4) {
      v9 = -[MPConditionalAction actionIfTrue](self, "actionIfTrue");
    }
    else {
      v9 = -[MPConditionalAction actionIfFalse](self, "actionIfFalse");
    }
    objc_msgSend(objc_msgSend(v8, "prepareWithInvocationTarget:", self), "setAction:forCondition:", v9, v4);
  }

  if (v4) {
    uint64_t v10 = 5LL;
  }
  else {
    uint64_t v10 = 6LL;
  }
  Class v11 = (&self->super.super.isa)[v10];
  if (v11)
  {
    -[objc_class setParent:](v11, "setParent:", 0LL);

    (&self->super.super.isa)[v10] = 0LL;
  }

  v12 = (objc_class *)a3;
  (&self->super.super.isa)[v10] = v12;
  -[objc_class setParent:](v12, "setParent:", self);
  -[MPConditionalAction configureActions](self, "configureActions");
}

- (void)setAction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPConditionalAction;
  -[MPAction setAction:](&v5, "setAction:", a3);
  action = self->super._action;
  if (action) {
    -[MCAction setPredicate:](action, "setPredicate:", self->_predicate);
  }
  -[MPConditionalAction configureActions](self, "configureActions");
}

- (void)configureActions
{
  actionIfTrue = self->_actionIfTrue;
  do
  {
    if (!self->super._action)
    {
      v9 = 0LL;
      goto LABEL_18;
    }

    BOOL v4 = -[MPAction targetObject](actionIfTrue, "targetObject");
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPAnimationTrigger, v5);
    if ((objc_opt_isKindOfClass(actionIfTrue, v6) & 1) != 0)
    {
      objc_super v8 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:withAnimationKey:]( &OBJC_CLASS___MCAnimationTrigger,  "animationTriggerForTargetPlugObjectID:withAnimationKey:",  -[NSObject objectID](v4, "objectID"),  -[MPAction animationKey](actionIfTrue, "animationKey"));
LABEL_14:
      v9 = v8;
      goto LABEL_15;
    }

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPActionTrigger, v7);
    if ((objc_opt_isKindOfClass(actionIfTrue, v10) & 1) != 0)
    {
      objc_super v8 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:]( &OBJC_CLASS___MCActionTrigger,  "actionTriggerForTargetPlugObjectID:withActionKey:",  -[NSObject objectID](v4, "objectID"),  -[MPAction actionKey](actionIfTrue, "actionKey"));
      goto LABEL_14;
    }

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPConditionalAction, v11);
    if ((objc_opt_isKindOfClass(actionIfTrue, v12) & 1) != 0)
    {
      v9 = +[MCConditionalAction conditionalActionWithPredicate:]( &OBJC_CLASS___MCConditionalAction,  "conditionalActionWithPredicate:",  0LL);
      -[MCAction setTargetObjectID:](v9, "setTargetObjectID:", -[NSObject objectID](v4, "objectID"));
      goto LABEL_15;
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPActionGroup, v13);
    if ((objc_opt_isKindOfClass(actionIfTrue, v14) & 1) != 0)
    {
      objc_super v8 = +[MCActionGroup actionGroup](&OBJC_CLASS___MCActionGroup, "actionGroup");
      goto LABEL_14;
    }

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPGenericAction, v15);
    if ((objc_opt_isKindOfClass(actionIfTrue, v16) & 1) != 0)
    {
      objc_super v8 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:]( MCGenericAction,  "genericActionForTargetPlugObjectID:withAttributes:",  -[NSObject objectID](v4, "objectID"),  [0 attributes]);
      goto LABEL_14;
    }

    v9 = 0LL;
LABEL_15:
    action = self->super._action;
    if (actionIfTrue == self->_actionIfTrue) {
      -[MCAction setActionIfTrue:](action, "setActionIfTrue:", v9);
    }
    else {
      -[MCAction setActionIfFalse:](action, "setActionIfFalse:", v9);
    }
LABEL_18:
    -[MPAction setAction:](actionIfTrue, "setAction:", v9);
    if (actionIfTrue != self->_actionIfTrue) {
      break;
    }
    actionIfTrue = self->_actionIfFalse;
  }

  while (actionIfTrue);
}

- (void)configureTarget
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPConditionalAction;
  -[MPAction configureTarget](&v3, "configureTarget");
  -[MPAction configureTarget](self->_actionIfFalse, "configureTarget");
  -[MPAction configureTarget](self->_actionIfTrue, "configureTarget");
}

- (NSString)predicate
{
  return self->_predicate;
}

- (MPAction)actionIfTrue
{
  return self->_actionIfTrue;
}

- (MPAction)actionIfFalse
{
  return self->_actionIfFalse;
}

@end