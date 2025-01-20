@interface MCConditionalAction
+ (id)conditionalActionWithPredicate:(id)a3;
+ (id)conditionalActionWithPredicate:(id)a3 actionIfTrue:(id)a4 actionIfFalse:(id)a5;
- (MCAction)actionIfFalse;
- (MCAction)actionIfTrue;
- (MCConditionalAction)initWithImprint:(id)a3;
- (NSString)predicate;
- (id)description;
- (id)imprint;
- (id)setActionGroupForCondition:(BOOL)a3;
- (id)setAnimationTriggerForTargetPlugObjectID:(id)a3 withAnimationKey:(id)a4 forCondition:(BOOL)a5;
- (id)setConditionalActionWithPredicate:(id)a3 forCondition:(BOOL)a4;
- (id)setGenericActionForTargetPlugObjectID:(id)a3 withAttributes:(id)a4 forCondition:(BOOL)a5;
- (id)setTransitionForTargetPlugObjectID:(id)a3 withTransitionID:(id)a4 forCondition:(BOOL)a5;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setActionIfFalse:(id)a3;
- (void)setActionIfTrue:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation MCConditionalAction

+ (id)conditionalActionWithPredicate:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___MCConditionalAction);
  -[MCConditionalAction setPredicate:](v4, "setPredicate:", a3);
  return v4;
}

+ (id)conditionalActionWithPredicate:(id)a3 actionIfTrue:(id)a4 actionIfFalse:(id)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___MCConditionalAction);
  -[MCConditionalAction setPredicate:](v8, "setPredicate:", a3);
  -[MCConditionalAction setActionIfTrue:](v8, "setActionIfTrue:", a4);
  -[MCConditionalAction setActionIfFalse:](v8, "setActionIfFalse:", a5);
  return v8;
}

- (MCConditionalAction)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCConditionalAction;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4)
  {
    v4->_predicate = (NSString *)[a3 objectForKey:@"predicate"];
    v4->_actionIfTrue = (MCAction *) +[MCObjectLight objectWithImprint:]( MCObjectLight,  "objectWithImprint:",  [a3 objectForKey:@"actionIfTrue"]);
    v4->_actionIfFalse = (MCAction *) +[MCObjectLight objectWithImprint:]( MCObjectLight,  "objectWithImprint:",  [a3 objectForKey:@"actionIfFalse"]);
  }

  return v4;
}

- (void)demolish
{
  self->_predicate = 0LL;
  self->_actionIfTrue = 0LL;

  self->_actionIfFalse = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCConditionalAction;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCConditionalAction;
  id v3 = -[MCAction imprint](&v9, "imprint");
  v4 = v3;
  predicate = self->_predicate;
  if (predicate) {
    [v3 setObject:predicate forKey:@"predicate"];
  }
  actionIfTrue = self->_actionIfTrue;
  if (actionIfTrue) {
    objc_msgSend(v4, "setObject:forKey:", -[MCAction imprint](actionIfTrue, "imprint"), @"actionIfTrue");
  }
  actionIfFalse = self->_actionIfFalse;
  if (actionIfFalse) {
    objc_msgSend(v4, "setObject:forKey:", -[MCAction imprint](actionIfFalse, "imprint"), @"actionIfFalse");
  }
  return v4;
}

- (id)setTransitionForTargetPlugObjectID:(id)a3 withTransitionID:(id)a4 forCondition:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___MCTransitionTrigger);
  -[MCAction setTargetObjectID:](v9, "setTargetObjectID:", a3);
  -[MCTransitionTrigger setTransitionID:](v9, "setTransitionID:", a4);
  v10 = &OBJC_IVAR___MCConditionalAction__actionIfFalse;
  if (v5) {
    v10 = &OBJC_IVAR___MCConditionalAction__actionIfTrue;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + *v10) = (Class)v9;
  return v9;
}

- (id)setAnimationTriggerForTargetPlugObjectID:(id)a3 withAnimationKey:(id)a4 forCondition:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___MCAnimationTrigger);
  -[MCAction setTargetObjectID:](v9, "setTargetObjectID:", a3);
  -[MCAnimationTrigger setAnimationKey:](v9, "setAnimationKey:", a4);
  v10 = &OBJC_IVAR___MCConditionalAction__actionIfFalse;
  if (v5) {
    v10 = &OBJC_IVAR___MCConditionalAction__actionIfTrue;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + *v10) = (Class)v9;
  return v9;
}

- (id)setGenericActionForTargetPlugObjectID:(id)a3 withAttributes:(id)a4 forCondition:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___MCGenericAction);
  -[MCAction setTargetObjectID:](v9, "setTargetObjectID:", a3);
  -[MCGenericAction setAttributes:](v9, "setAttributes:", a4);
  v10 = &OBJC_IVAR___MCConditionalAction__actionIfFalse;
  if (v5) {
    v10 = &OBJC_IVAR___MCConditionalAction__actionIfTrue;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + *v10) = (Class)v9;
  return v9;
}

- (id)setActionGroupForCondition:(BOOL)a3
{
  BOOL v3 = a3;
  id result = objc_alloc_init(&OBJC_CLASS___MCActionGroup);
  objc_super v6 = &OBJC_IVAR___MCConditionalAction__actionIfFalse;
  if (v3) {
    objc_super v6 = &OBJC_IVAR___MCConditionalAction__actionIfTrue;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + *v6) = (Class)result;
  return result;
}

- (id)setConditionalActionWithPredicate:(id)a3 forCondition:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___MCConditionalAction);
  -[MCConditionalAction setPredicate:](v7, "setPredicate:", a3);
  v8 = &OBJC_IVAR___MCConditionalAction__actionIfFalse;
  if (v4) {
    v8 = &OBJC_IVAR___MCConditionalAction__actionIfTrue;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + *v8) = (Class)v7;
  return v7;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCConditionalAction;
  -[MCAction _copySelfToSnapshot:](&v8, "_copySelfToSnapshot:");
  predicate = self->_predicate;
  if (predicate) {
    *((void *)a3 + 3) = -[NSString copy](predicate, "copy");
  }
  actionIfTrue = self->_actionIfTrue;
  if (actionIfTrue) {
    *((void *)a3 + 4) = -[MCAction snapshot](actionIfTrue, "snapshot");
  }
  actionIfFalse = self->_actionIfFalse;
  if (actionIfFalse) {
    *((void *)a3 + 5) = -[MCAction snapshot](actionIfFalse, "snapshot");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCConditionalAction;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @"\n\tpredicate='%@'\n\tactionIfTrue=%@\n\tactionIfFalse=%@",  self->_predicate,  self->_actionIfTrue,  self->_actionIfFalse);
}

- (NSString)predicate
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPredicate:(id)a3
{
}

- (MCAction)actionIfTrue
{
  return (MCAction *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setActionIfTrue:(id)a3
{
}

- (MCAction)actionIfFalse
{
  return (MCAction *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setActionIfFalse:(id)a3
{
}

@end