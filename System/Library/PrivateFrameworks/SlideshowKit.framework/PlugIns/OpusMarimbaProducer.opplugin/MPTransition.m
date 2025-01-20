@interface MPTransition
+ (MPTransition)transitionWithTransitionID:(id)a3;
- (BOOL)isRandom;
- (MPTransition)init;
- (MPTransition)initWithTransitionID:(id)a3;
- (NSString)presetID;
- (NSString)transitionID;
- (double)duration;
- (double)findMaxDuration;
- (id)_transitionAttributes;
- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedAttributes;
- (id)fullDebugLog;
- (id)parent;
- (id)parentContainer;
- (id)parentDocument;
- (id)transitionAttributeForKey:(id)a3;
- (id)transitionAttributes;
- (id)transitionPresetID;
- (int64_t)randomSeed;
- (void)applyFormattedAttributes;
- (void)copyAttribures:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setDuration:(double)a3;
- (void)setIsRandom:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setTransitionAttribute:(id)a3 forKey:(id)a4;
- (void)setTransitionAttributes:(id)a3;
- (void)setTransitionID:(id)a3;
@end

@implementation MPTransition

+ (MPTransition)transitionWithTransitionID:(id)a3
{
  return (MPTransition *)[objc_alloc((Class)a1) initWithTransitionID:a3];
}

- (MPTransition)initWithTransitionID:(id)a3
{
  v4 = -[MPTransition init](self, "init");
  if (v4)
  {
    v4->_transitionID = (NSString *)[a3 copy];
    v4->_isRandom = [a3 isEqualToString:@"Random"];
    v4->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "transitionNeedsRandomSeedInformation:",  v4->_transitionID))
    {
      v4->_randomSeed = arc4random();
    }

    objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "defaultDurationForTransitionID:",  a3);
    v4->_duration = v5;
  }

  return v4;
}

- (MPTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTransition;
  result = -[MPTransition init](&v3, "init");
  if (result)
  {
    result->_attributes = 0LL;
    result->_duration = 0.0;
    result->_isRandom = 0;
    result->_randomSeed = -1LL;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copyAttribures:self->_attributes];
  return v4;
}

- (id)description
{
  objc_super v3 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"================================== Transition ==================================\n"),  "stringByAppendingFormat:",  @"\t                 Transition ID: %@\n",  -[MPTransition transitionID](self, "transitionID")),  "stringByAppendingFormat:",  @"\t                     Preset ID: %@\n",  -[MPTransition presetID](self, "presetID"));
  -[MPTransition duration](self, "duration");
  return -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t           Transition Duration: %f\n",  v4),  "stringByAppendingFormat:",  @"\t                    Attributes: %@\n",  -[MPTransition transitionAttributes](self, "transitionAttributes"));
}

- (void)dealloc
{
  self->_attributes = 0LL;
  self->_transitionID = 0LL;

  self->_presetID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTransition;
  -[MPTransition dealloc](&v3, "dealloc");
}

- (void)setTransitionID:(id)a3
{
  transitionID = self->_transitionID;
  if (transitionID)
  {

    self->_transitionID = 0LL;
  }

  self->_transitionID = (NSString *)[a3 copy];
  if (self->_randomSeed == -1
    && objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "transitionNeedsRandomSeedInformation:",  self->_transitionID))
  {
    self->_randomSeed = arc4random();
  }

  -[MPTransition setIsRandom:](self, "setIsRandom:", [a3 isEqualToString:@"Random"]);
  -[MPTransition setPresetID:](self, "setPresetID:", @"Default");
  id parent = self->_parent;
  if (parent)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v6);
    if ((objc_opt_isKindOfClass(parent, v8) & 1) != 0
      && [self->_parent plug]
      && [self->_parent isTransitionConnected])
    {
      objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionID:", a3);
    }

    else
    {
      id v10 = self->_parent;
      if (v10)
      {
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v9);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          if ([self->_parent container]) {
            objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionID:", a3);
          }
        }
      }
    }
  }

  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (void)setPresetID:(id)a3
{
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0LL;
  }

  self->_presetID = (NSString *)[a3 copy];
  attributes = self->_attributes;
  if (attributes) {
    -[NSMutableDictionary removeAllObjects](attributes, "removeAllObjects");
  }
  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (void)setDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    id v5 = objc_msgSend( objc_msgSend(-[MPTransition parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
    id parent = self->_parent;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v7);
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass(parent, v8);
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue") & 1) == 0 && (isKindOfClass)
    {
      -[MPTransition findMaxDuration](self, "findMaxDuration");
      if (v10 != -1.0 && v10 < v3) {
        double v3 = v10;
      }
    }

    -[MPTransition duration](self, "duration");
    double v13 = v12;
    self->_duration = v3;
    id v14 = self->_parent;
    if (((v14 != 0LL) & isKindOfClass) == 1)
    {
      -[MPTransition duration](self, "duration");
      objc_msgSend(v14, "adjustPhasesWithDuration:");
    }

    id v15 = self->_parent;
    if ((isKindOfClass & 1) != 0)
    {
      if ([v15 parentLayer])
      {
        id v16 = [self->_parent parentLayer];
        objc_msgSend(objc_msgSend(self->_parent, "parentLayer"), "duration");
        [v16 setDuration:v17 - (v3 - v13)];
      }

      id v18 = self->_parent;
      if (v18 && [v18 plug])
      {
      }
    }

    else if (v15 && [v15 container])
    {
      objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionDuration:", v3);
    }
  }

- (id)transitionAttributes
{
  id result = self->_attributes;
  if (!result) {
    return objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "attributesForTransitionID:andPresetID:",  -[MPTransition transitionID](self, "transitionID"),  -[MPTransition presetID](self, "presetID"));
  }
  return result;
}

- (void)setTransitionAttributes:(id)a3
{
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0LL;
  }

  self->_attributes = (NSMutableDictionary *)[a3 mutableCopy];
  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (id)transitionAttributeForKey:(id)a3
{
  attributes = self->_attributes;
  if (!attributes) {
    attributes = (NSMutableDictionary *)objc_msgSend( +[MPTransitionManager sharedManager]( MPTransitionManager,  "sharedManager"),  "attributesForTransitionID:andPresetID:",  -[MPTransition transitionID](self, "transitionID"),  -[MPTransition presetID](self, "presetID"));
  }
  id result = -[NSMutableDictionary objectForKey:](attributes, "objectForKey:", a3);
  if (!result)
  {
    id result = objc_msgSend( +[MPUtilities defaultAttributesForMPTransition:]( MPUtilities,  "defaultAttributesForMPTransition:",  self),  "objectForKey:",  a3);
    if (result) {
      return -[MPTransition convertMPAttributeToMCAttribute:withKey:]( self,  "convertMPAttributeToMCAttribute:withKey:",  result,  a3);
    }
  }

  return result;
}

- (void)setTransitionAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = (NSMutableDictionary *)objc_msgSend( objc_msgSend( +[MPTransitionManager sharedManager]( MPTransitionManager,  "sharedManager"),  "attributesForTransitionID:andPresetID:",  -[MPTransition transitionID](self, "transitionID"),  -[MPTransition presetID](self, "presetID")),  "mutableCopy");
    self->_attributes = attributes;
  }

  -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", a3, a4);
  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (id)parent
{
  return self->_parent;
}

- (id)parentContainer
{
  return self->_parent;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (NSString)transitionID
{
  return self->_transitionID;
}

- (NSString)presetID
{
  return self->_presetID;
}

- (double)duration
{
  return self->_duration;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPTransition description](self, "description"));
}

- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4
{
  return a3;
}

- (double)findMaxDuration
{
  id parent = self->_parent;
  if (!parent) {
    return -1.0;
  }
  id v4 = objc_msgSend(objc_msgSend(parent, "parentLayer"), "effectContainers");
  if ([self->_parent index]) {
    id v5 = objc_msgSend(v4, "objectAtIndex:", (char *)objc_msgSend(self->_parent, "index") - 1);
  }
  else {
    id v5 = 0LL;
  }
  uint64_t v7 = (char *)[self->_parent index] + 1;
  uint64_t v8 = (char *)[v4 count];
  id v9 = self->_parent;
  if (v7 == v8)
  {
    [v9 duration];
    double v6 = v10;
  }

  else
  {
    id v11 = objc_msgSend(v4, "objectAtIndex:", (char *)objc_msgSend(v9, "index") + 1);
    [self->_parent duration];
    double v6 = v12;
    if (v11)
    {
      [v11 duration];
      if (v6 >= v13) {
        double v6 = v13;
      }
      if ([v11 transition])
      {
        [v11 duration];
        double v15 = v14;
        objc_msgSend(objc_msgSend(v11, "transition"), "duration");
        double v17 = v15 - v16;
        if (v6 >= v17) {
          double v6 = v17;
        }
      }
    }
  }

  if (v5)
  {
    if ([v5 transition])
    {
      [self->_parent duration];
      double v19 = v18;
      objc_msgSend(objc_msgSend(v5, "transition"), "duration");
      double v21 = v19 - v20;
      if (v6 >= v21) {
        return v21;
      }
    }
  }

  return v6;
}

- (id)transitionPresetID
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  -[MPTransition transitionID](self, "transitionID"),  -[MPTransition presetID](self, "presetID"));
}

- (void)copyVars:(id)a3
{
  self->_duration = *((double *)a3 + 5);
  transitionID = self->_transitionID;
  if (transitionID)
  {

    self->_transitionID = 0LL;
  }

  self->_transitionID = (NSString *)[*((id *)a3 + 3) copy];
  presetID = self->_presetID;
  if (presetID)
  {

    self->_transitionID = 0LL;
  }

  self->_presetID = (NSString *)[*((id *)a3 + 4) copy];
  self->_isRandom = *((_BYTE *)a3 + 48);
}

- (void)copyAttribures:(id)a3
{
  attributes = self->_attributes;
  if (attributes) {

  }
  self->_attributes = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  a3,  1LL);
}

- (id)parentDocument
{
  return objc_msgSend( objc_msgSend(-[MPTransition parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A transition may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPTransition isRandom](v11, v12);
  }

  else
  {
    self->_id parent = a3;
    if (a3)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, a2);
      if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0 && [self->_parent plug])
      {
        if ([self->_parent isTransitionConnected])
        {
          objc_msgSend( objc_msgSend(self->_parent, "plug"),  "setTransitionID:",  -[MPTransition transitionID](self, "transitionID"));
          -[MPTransition duration](self, "duration");
          objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionDuration:", v7);
        }

        goto LABEL_11;
      }

      id parent = self->_parent;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v6);
      if ((objc_opt_isKindOfClass(parent, v9) & 1) != 0 && [self->_parent container])
      {
        objc_msgSend( objc_msgSend(self->_parent, "container"),  "setInitialTransitionID:",  -[MPTransition transitionID](self, "transitionID"));
        -[MPTransition duration](self, "duration");
        objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionDuration:", v10);
LABEL_11:
        -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
      }
    }
  }

- (BOOL)isRandom
{
  return self->_isRandom;
}

- (void)setIsRandom:(BOOL)a3
{
  self->_isRandom = a3;
  -[MPTransition applyFormattedAttributes](self, "applyFormattedAttributes");
}

- (id)formattedAttributes
{
  unsigned __int8 v3 = -[MPTransition isRandom](self, "isRandom");
  if (self->_attributes) {
    goto LABEL_2;
  }
  if (-[MPTransition isRandom](self, "isRandom")) {
    return 0LL;
  }
  if (self->_attributes) {
LABEL_2:
  }
    id v4 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  self->_attributes);
  else {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v5 = v4;
  if ((v3 & 1) == 0) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  -[MPTransition presetID](self, "presetID"),  @"PresetID");
  }
  if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
  }
  return v5;
}

- (void)applyFormattedAttributes
{
  unsigned __int8 v3 = (NSMutableDictionary *)objc_msgSend( -[MPTransition _transitionAttributes](self, "_transitionAttributes"),  "mutableCopy");
  if (!v3) {
    unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  double v10 = v3;
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  -[MPTransition presetID](self, "presetID"),  @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
    -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
  }
  if (self->_isRandom) {
    -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"isRandom");
  }
  id parent = self->_parent;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPEffectContainer, v4);
  if ((objc_opt_isKindOfClass(parent, v6) & 1) != 0 && [self->_parent plug])
  {
    objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionAttributes:", v10);
  }

  else
  {
    id v8 = self->_parent;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && [self->_parent container]) {
      objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionAttributes:", v10);
    }
  }
}

- (id)_transitionAttributes
{
  return self->_attributes;
}

@end