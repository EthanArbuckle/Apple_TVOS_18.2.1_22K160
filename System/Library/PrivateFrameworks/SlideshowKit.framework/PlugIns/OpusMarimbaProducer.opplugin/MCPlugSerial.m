@interface MCPlugSerial
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCContainerSerializer)supercontainer;
- (MCPlugSerial)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSDictionary)transitionAttributes;
- (NSString)transitionID;
- (double)transitionDuration;
- (id)imprint;
- (id)transitionAttributeForKey:(id)a3;
- (unint64_t)index;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addTransitionAttributes:(id)a3;
- (void)demolish;
- (void)setIndex:(unint64_t)a3;
- (void)setSupercontainer:(id)a3;
- (void)setTransitionAttribute:(id)a3 forKey:(id)a4;
- (void)setTransitionAttributes:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionID:(id)a3;
@end

@implementation MCPlugSerial

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"transition"]) {
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"transitionID",  @"transitionDuration",  @"transitionAttributes",  0LL);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCPlugSerial;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCPlugSerial)initWithImprint:(id)a3 andMontage:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCPlugSerial;
  v5 = -[MCPlug initWithImprint:andMontage:](&v10, "initWithImprint:andMontage:", a3, a4);
  if (v5)
  {
    id v6 = [a3 objectForKey:@"index"];
    if (v6) {
      id v6 = [v6 unsignedIntegerValue];
    }
    v5->mIndex = (unint64_t)v6;
    v5->mTransitionID = (NSString *)[a3 objectForKey:@"transitionID"];
    id v7 = [a3 objectForKey:@"transitionDuration"];
    if (v7) {
      [v7 doubleValue];
    }
    else {
      double v8 = 0.0;
    }
    v5->mTransitionDuration = v8;
    v5->mTransitionAttributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"transitionAttributes"]);
  }

  return v5;
}

- (void)demolish
{
  self->mTransitionID = 0LL;
  self->mTransitionAttributes = 0LL;
  self->mSupercontainer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCPlugSerial;
  -[MCPlug demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCPlugSerial;
  id v3 = -[MCPlug imprint](&v7, "imprint");
  if (self->mIndex) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"),  @"index");
  }
  mTransitionID = self->mTransitionID;
  if (mTransitionID) {
    [v3 setObject:mTransitionID forKey:@"transitionID"];
  }
  if (self->mTransitionDuration != 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"transitionDuration");
  }
  mTransitionAttributes = self->mTransitionAttributes;
  if (mTransitionAttributes) {
    [v3 setObject:mTransitionAttributes forKey:@"transitionAttributes"];
  }
  return v3;
}

- (void)setTransitionDuration:(double)a3
{
  self->mTransitionDuration = a3;
}

- (id)transitionAttributeForKey:(id)a3
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return -[NSMutableDictionary objectForKey:](self->mTransitionAttributes, "objectForKey:", a3);
  }
  objc_sync_enter(self);
  id v6 = -[NSMutableDictionary objectForKey:](self->mTransitionAttributes, "objectForKey:", a3);
  objc_sync_exit(self);
  return v6;
}

- (void)setTransitionAttribute:(id)a3 forKey:(id)a4
{
  mTransitionAttributes = self->mTransitionAttributes;
  if (a3)
  {
    if (mTransitionAttributes) {
      -[NSMutableDictionary setObject:forKey:](mTransitionAttributes, "setObject:forKey:", a3, a4);
    }
    else {
      self->mTransitionAttributes = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a4,  0LL);
    }
  }

  else if (mTransitionAttributes)
  {
    -[NSMutableDictionary removeObjectForKey:](mTransitionAttributes, "removeObjectForKey:", a4);
  }

  objc_sync_exit(self);
  -[MCPlugSerial didChangeValueForKey:](self, "didChangeValueForKey:", @"transitionAttributes");
}

- (void)addTransitionAttributes:(id)a3
{
  if (a3 && [a3 count])
  {
    -[MCPlugSerial willChangeValueForKey:](self, "willChangeValueForKey:", @"transitionAttributes");
    objc_sync_enter(self);
    mTransitionAttributes = self->mTransitionAttributes;
    if (mTransitionAttributes) {
      -[NSMutableDictionary addEntriesFromDictionary:](mTransitionAttributes, "addEntriesFromDictionary:", a3);
    }
    else {
      self->mTransitionAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    }
    objc_sync_exit(self);
    -[MCPlugSerial didChangeValueForKey:](self, "didChangeValueForKey:", @"transitionAttributes");
  }

- (NSDictionary)transitionAttributes
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return &self->mTransitionAttributes->super;
  }
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->mTransitionAttributes);
  objc_sync_exit(self);
  return v3;
}

- (void)setTransitionAttributes:(id)a3
{
  if (self->mTransitionAttributes != a3)
  {
    objc_sync_enter(self);

    self->mTransitionAttributes = 0LL;
    if (a3) {
      self->mTransitionAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    }
    objc_sync_exit(self);
  }

- (void)_copySelfToSnapshot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCPlugSerial;
  -[MCPlug _copySelfToSnapshot:](&v7, "_copySelfToSnapshot:", a3);
  *((void *)a3 + 12) = self->mIndex;
  mTransitionID = self->mTransitionID;
  if (mTransitionID) {
    *((void *)a3 + 13) = -[NSString copy](mTransitionID, "copy");
  }
  *((void *)a3 + 14) = *(void *)&self->mTransitionDuration;
  mTransitionAttributes = self->mTransitionAttributes;
  if (mTransitionAttributes) {
    *((void *)a3 + 11) = -[NSMutableDictionary copy](mTransitionAttributes, "copy");
  }
  objc_sync_exit(self);
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (NSString)transitionID
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTransitionID:(id)a3
{
}

- (double)transitionDuration
{
  return self->mTransitionDuration;
}

- (MCContainerSerializer)supercontainer
{
  return self->mSupercontainer;
}

- (void)setSupercontainer:(id)a3
{
  self->mSupercontainer = (MCContainerSerializer *)a3;
}

@end