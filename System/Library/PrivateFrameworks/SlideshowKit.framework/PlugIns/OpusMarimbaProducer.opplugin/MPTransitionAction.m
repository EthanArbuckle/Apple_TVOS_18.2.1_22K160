@interface MPTransitionAction
+ (id)transitionAction;
- (MPActionableSupport)transitionDestination;
- (MPTransitionAction)init;
- (NSDictionary)transitionAttributes;
- (NSString)transitionID;
- (double)transitionDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)transitionAttributeForKey:(id)a3;
- (void)configureTarget;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setTransitionAttributes:(id)a3;
- (void)setTransitionDestination:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionID:(id)a3;
@end

@implementation MPTransitionAction

+ (id)transitionAction
{
  return objc_alloc_init(&OBJC_CLASS___MPTransitionAction);
}

- (MPTransitionAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTransitionAction;
  result = -[MPAction init](&v3, "init");
  if (result)
  {
    result->_transitionAttributes = 0LL;
    result->_transitionDuration = 0.0;
    result->_transitionID = 0LL;
    result->_transitionDestination = 0LL;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTransitionAction;
  -[MPAction dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPTransitionAction;
  id v4 = -[MPAction copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setTransitionAttributes:self->_transitionAttributes];
  [v4 setTransitionID:self->_transitionID];
  [v4 setTransitionDuration:self->_transitionDuration];
  [v4 setTransitionDestination:self->_transitionDestination];
  return v4;
}

- (id)transitionAttributeForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_transitionAttributes, "objectForKey:", a3);
}

- (void)setTransitionAttributes:(id)a3
{
  transitionAttributes = self->_transitionAttributes;
  if (transitionAttributes)
  {

    self->_transitionAttributes = 0LL;
  }

  objc_super v6 = (NSMutableDictionary *)[a3 mutableCopy];
  self->_transitionAttributes = v6;
  action = self->super._action;
  if (action) {
    -[MCAction setTransitionAttributes:](action, "setTransitionAttributes:", v6);
  }
}

- (void)setTransitionID:(id)a3
{
  transitionID = self->_transitionID;
  if (transitionID)
  {

    self->_transitionID = 0LL;
  }

  objc_super v6 = (NSString *)[a3 copy];
  self->_transitionID = v6;
  action = self->super._action;
  if (action) {
    -[MCAction setTransitionID:](action, "setTransitionID:", v6);
  }
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
  action = self->super._action;
  if (action) {
    -[MCAction setTransitionDuration:](action, "setTransitionDuration:");
  }
}

- (void)setTransitionDestination:(id)a3
{
  transitionDestination = self->_transitionDestination;
  if (transitionDestination)
  {

    self->_transitionDestination = 0LL;
  }

  objc_super v6 = (MPActionableSupport *)a3;
  self->_transitionDestination = v6;
  if (self->super._action) {
    -[MCAction setTransitionDestinationPlugID:]( self->super._action,  "setTransitionDestinationPlugID:",  -[MPActionableSupport plugID](v6, "plugID"));
  }
}

- (void)setAction:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MPTransitionAction;
  -[MPAction setAction:](&v15, "setAction:", a3);
  action = self->super._action;
  if (action)
  {
    -[MCAction setTransitionAttributes:](action, "setTransitionAttributes:", self->_transitionAttributes);
    -[MCAction setTransitionID:](self->super._action, "setTransitionID:", self->_transitionID);
    -[MCAction setTransitionDuration:](self->super._action, "setTransitionDuration:", self->_transitionDuration);
    id v5 = -[MPAction parentDocument](self, "parentDocument");
    transitionDestination = self->_transitionDestination;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
    char isKindOfClass = objc_opt_isKindOfClass(transitionDestination, v8);
    v11 = self->_transitionDestination;
    if ((isKindOfClass & 1) != 0)
    {
      if (v5)
      {
        id v12 = [v5 actionableObjectForID:self->_transitionDestination];
        v11 = self->_transitionDestination;
        if (v12)
        {
          v13 = v12;

          v11 = v13;
          self->_transitionDestination = v11;
        }
      }
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0) {
      -[MCAction setTransitionDestinationPlugID:]( self->super._action,  "setTransitionDestinationPlugID:",  -[MPActionableSupport plugID](self->_transitionDestination, "plugID"));
    }
  }

- (void)configureTarget
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MPTransitionAction;
  -[MPAction configureTarget](&v13, "configureTarget");
  id v3 = -[MPAction parentDocument](self, "parentDocument");
  transitionDestination = self->_transitionDestination;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  char isKindOfClass = objc_opt_isKindOfClass(transitionDestination, v6);
  v9 = self->_transitionDestination;
  if ((isKindOfClass & 1) != 0)
  {
    if (v3)
    {
      id v10 = [v3 actionableObjectForID:self->_transitionDestination];
      v9 = self->_transitionDestination;
      if (v10)
      {
        v11 = v10;

        v9 = v11;
        self->_transitionDestination = v9;
      }
    }
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0) {
    -[MCAction setTransitionDestinationPlugID:]( self->super._action,  "setTransitionDestinationPlugID:",  -[MPActionableSupport plugID](self->_transitionDestination, "plugID"));
  }
}

- (NSDictionary)transitionAttributes
{
  return &self->_transitionAttributes->super;
}

- (NSString)transitionID
{
  return self->_transitionID;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (MPActionableSupport)transitionDestination
{
  return self->_transitionDestination;
}

@end