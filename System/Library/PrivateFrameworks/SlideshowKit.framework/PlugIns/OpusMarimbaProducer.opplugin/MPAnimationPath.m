@interface MPAnimationPath
+ (id)animationPath;
- (BOOL)isTriggered;
- (MPAnimationPath)init;
- (id)animatedKey;
- (id)animatedParent;
- (id)animationPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)key;
- (id)parent;
- (id)parentDocument;
- (void)dealloc;
- (void)setAnimationPath:(id)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setParent:(id)a3;
@end

@implementation MPAnimationPath

+ (id)animationPath
{
  return objc_alloc_init(&OBJC_CLASS___MPAnimationPathKeyframed);
}

- (MPAnimationPath)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationPath;
  result = -[MPAnimationPath init](&v3, "init");
  if (result)
  {
    result->_parentObject = 0LL;
    result->_animationPath = 0LL;
  }

  return result;
}

- (void)dealloc
{
  animationPath = self->_animationPath;
  if (animationPath)
  {

    self->_animationPath = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationPath;
  -[MPAnimationPath dealloc](&v4, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsTriggered:", -[MPAnimationPath isTriggered](self, "isTriggered"));
  return v4;
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"=========================== Animation Path Description =========================\n");
  if (self->_animationPath) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t           Has MCAnimationPath: %@\n",  v4);
}

- (id)key
{
  return objc_msgSend( objc_msgSend( -[MPAnimationSupport animationPaths](self->_parentObject, "animationPaths"),  "allKeysForObject:",  self),  "lastObject");
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (void)setIsTriggered:(BOOL)a3
{
  self->_isTriggered = a3;
  animationPath = self->_animationPath;
  if (animationPath) {
    -[MCAnimationPath setIsTriggered:](animationPath, "setIsTriggered:");
  }
}

- (id)parent
{
  return self->_parentObject;
}

- (id)animationPath
{
  return self->_animationPath;
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parentObject)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A animation path may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPAnimationPath animatedParent](v3, v4);
  }

  else
  {
    self->_parentObject = (MPAnimationSupport *)a3;
  }

- (id)animatedParent
{
  for (i = self->_parentObject; i; i = (MPAnimationSupport *)-[MPAnimationSupport parent](i, "parent"))
  {
    if ((-[MPAnimationSupport conformsToProtocol:]( i,  "conformsToProtocol:",  &OBJC_PROTOCOL___MPAnimationSupport) & 1) != 0) {
      break;
    }
  }

  return i;
}

- (id)animatedKey
{
  v2 = self;
  for (i = self->_parentObject; i; v2 = -[MPAnimationPath parent](v2, "parent"))
  {
    if ((-[MPAnimationSupport conformsToProtocol:]( i,  "conformsToProtocol:",  &OBJC_PROTOCOL___MPAnimationSupport) & 1) != 0) {
      break;
    }
    i = (MPAnimationSupport *)-[MPAnimationSupport parent](i, "parent");
  }

  return -[MPAnimationPath key](v2, "key");
}

- (id)parentDocument
{
  parentObject = self->_parentObject;
  if (parentObject)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPSlide, a2);
    char isKindOfClass = objc_opt_isKindOfClass(parentObject, v4);
    v7 = self->_parentObject;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = (MPAnimationSupport *)-[MPAnimationSupport parentEffect](self->_parentObject, "parentEffect");
LABEL_4:
      v9 = (MPAnimationSupport *)objc_msgSend( -[MPAnimationSupport parentContainer](v8, "parentContainer"),  "parentLayer");
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPLayer, v6);
    char v11 = objc_opt_isKindOfClass(v7, v10);
    v9 = self->_parentObject;
    if ((v11 & 1) != 0) {
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v12);
    char v14 = objc_opt_isKindOfClass(v9, v13);
    v9 = self->_parentObject;
    if ((v14 & 1) != 0) {
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPNavigator, v15);
    char v17 = objc_opt_isKindOfClass(v9, v16);
    v9 = self->_parentObject;
    if ((v17 & 1) != 0) {
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPEffect, v18);
    char v20 = objc_opt_isKindOfClass(v9, v19);
    v22 = self->_parentObject;
    if ((v20 & 1) != 0)
    {
      v8 = self->_parentObject;
      goto LABEL_4;
    }

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___MPFilter, v21);
    char v24 = objc_opt_isKindOfClass(v22, v23);
    v9 = self->_parentObject;
    if ((v24 & 1) != 0) {
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___MPAnimationPath, v25);
    if ((objc_opt_isKindOfClass(v9, v26) & 1) != 0)
    {
      v9 = self->_parentObject;
      return -[MPAnimationSupport parentDocument](v9, "parentDocument");
    }
  }

  return 0LL;
}

- (void)setAnimationPath:(id)a3
{
  animationPath = self->_animationPath;
  if (animationPath)
  {

    self->_animationPath = 0LL;
  }

  uint64_t v6 = (MCAnimationPath *)a3;
  self->_animationPath = v6;
  if (v6) {
    -[MCAnimationPath setIsTriggered:](v6, "setIsTriggered:", self->_isTriggered);
  }
}

@end