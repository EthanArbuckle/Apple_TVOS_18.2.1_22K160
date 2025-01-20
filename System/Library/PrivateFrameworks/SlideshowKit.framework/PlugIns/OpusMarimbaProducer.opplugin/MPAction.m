@interface MPAction
+ (id)action;
- (MPAction)init;
- (NSObject)targetObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)key;
- (id)parent;
- (id)parentDocument;
- (void)configureTarget;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setParent:(id)a3;
- (void)setTargetObject:(id)a3;
@end

@implementation MPAction

+ (id)action
{
  return objc_alloc_init(&OBJC_CLASS___MPAction);
}

- (MPAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAction;
  result = -[MPAction init](&v3, "init");
  if (result)
  {
    result->_parentObject = 0LL;
    result->_action = 0LL;
  }

  return result;
}

- (NSObject)targetObject
{
  id v4 = -[MPAction parentDocument](self, "parentDocument");
  if (!v4)
  {
    targetObject = self->_targetObject;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v3);
    if ((objc_opt_isKindOfClass(targetObject, v6) & 1) != 0) {
      return 0LL;
    }
  }

  v7 = self->_targetObject;
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v3);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  v10 = self->_targetObject;
  if ((isKindOfClass & 1) != 0)
  {
    id v11 = [v4 actionableObjectForID:v10];
    if (v11)
    {
      v12 = v11;

      v10 = v12;
      self->_targetObject = v10;
      return v10;
    }

    return 0LL;
  }

  return v10;
}

- (void)setTargetObject:(id)a3
{
  targetObject = self->_targetObject;
  if (targetObject)
  {

    self->_targetObject = 0LL;
  }

  self->_targetObject = a3;
  -[MPAction configureTarget](self, "configureTarget");
}

- (void)dealloc
{
  self->_action = 0LL;
  self->_targetObject = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAction;
  -[MPAction dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 setTargetObject:self->_targetObject];
  return v4;
}

- (id)key
{
  return objc_msgSend( objc_msgSend(-[MPActionSupport actions](self->_parentObject, "actions"), "allKeysForObject:", self),  "lastObject");
}

- (id)parent
{
  return self->_parentObject;
}

- (id)parentDocument
{
  parentObject = self->_parentObject;
  if (parentObject)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, a2);
    char isKindOfClass = objc_opt_isKindOfClass(parentObject, v4);
    v7 = self->_parentObject;
    if ((isKindOfClass & 1) != 0) {
      return -[MPActionSupport parentDocument](v7, "parentDocument");
    }
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPNavigator, v6);
    char v9 = objc_opt_isKindOfClass(v7, v8);
    v7 = self->_parentObject;
    if ((v9 & 1) != 0) {
      return -[MPActionSupport parentDocument](v7, "parentDocument");
    }
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPLayer, v10);
    char v12 = objc_opt_isKindOfClass(v7, v11);
    v7 = self->_parentObject;
    if ((v12 & 1) != 0) {
      return -[MPActionSupport parentDocument](v7, "parentDocument");
    }
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPActionGroup, v13);
    char v15 = objc_opt_isKindOfClass(v7, v14);
    v7 = self->_parentObject;
    if ((v15 & 1) != 0) {
      return -[MPActionSupport parentDocument](v7, "parentDocument");
    }
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPConditionalAction, v16);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v7 = self->_parentObject;
      return -[MPActionSupport parentDocument](v7, "parentDocument");
    }
  }

  return 0LL;
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parentObject)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"An action may have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPAction configureTarget](v3, v4);
  }

  else
  {
    self->_parentObject = (MPActionSupport *)a3;
  }

- (void)configureTarget
{
  id v3 = -[MPAction parentDocument](self, "parentDocument");
  targetObject = self->_targetObject;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(targetObject, v6) & 1) != 0 && v3)
  {
    id v8 = [v3 actionableObjectForID:self->_targetObject];
    if (!v8) {
      return;
    }
    char v9 = v8;

    self->_targetObject = v9;
  }

  if (self->_action)
  {
    uint64_t v10 = self->_targetObject;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v7);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
      -[MCAction setTargetObjectID:]( self->_action,  "setTargetObjectID:",  -[NSObject objectID](self->_targetObject, "objectID"));
    }
  }

- (void)setAction:(id)a3
{
  action = self->_action;
  if (action)
  {

    self->_action = 0LL;
  }

  uint64_t v6 = (MCAction *)a3;
  self->_action = v6;
  if (v6) {
    -[MPAction configureTarget](self, "configureTarget");
  }
}

@end