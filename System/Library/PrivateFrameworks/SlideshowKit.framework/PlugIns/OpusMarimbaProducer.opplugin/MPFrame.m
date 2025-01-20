@interface MPFrame
+ (MPFrame)frameWithFrameID:(id)a3;
- (MPFrame)init;
- (MPFrame)initWithFrameID:(id)a3;
- (NSString)frameID;
- (NSString)presetID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)frameAttributeForKey:(id)a3;
- (id)frameAttributes;
- (id)fullDebugLog;
- (id)parentDocument;
- (id)parentSlide;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setFrameAttribute:(id)a3 forKey:(id)a4;
- (void)setFrameID:(id)a3;
- (void)setParentSlide:(id)a3;
- (void)setPresetID:(id)a3;
@end

@implementation MPFrame

+ (MPFrame)frameWithFrameID:(id)a3
{
  return (MPFrame *)[objc_alloc((Class)a1) initWithFrameID:a3];
}

- (MPFrame)initWithFrameID:(id)a3
{
  v4 = -[MPFrame init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[MPFrameInternal setFrameID:](v4->_internal, "setFrameID:", a3);
    -[MPFrameInternal setPresetID:](v5->_internal, "setPresetID:", @"Default");
  }

  return v5;
}

- (MPFrame)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPFrame;
  v2 = -[MPFrame init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MPFrameInternal);
    v2->_internal = v3;
    -[MPFrameInternal setFrameID:](v3, "setFrameID:", 0LL);
    -[MPFrameInternal setPresetID:](v2->_internal, "setPresetID:", 0LL);
    v2->_attributes = 0LL;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  return v4;
}

- (id)description
{
  return -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"===================================== Frame ====================================\n"),  "stringByAppendingFormat:",  @"\t                      Frame ID: %@\n",  -[MPFrame frameID](self, "frameID"));
}

- (void)dealloc
{
  self->_internal = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPFrame;
  -[MPFrame dealloc](&v3, "dealloc");
}

- (NSString)frameID
{
  return -[MPFrameInternal frameID](self->_internal, "frameID");
}

- (void)setFrameID:(id)a3
{
  parentSlide = self->_parentSlide;
  if (parentSlide)
  {
    if (-[MPSlide slide](parentSlide, "slide")) {
      objc_msgSend(-[MPSlide slide](self->_parentSlide, "slide"), "setFrameID:", a3);
    }
  }

- (NSString)presetID
{
  result = -[MPFrameInternal presetID](self->_internal, "presetID");
  if (!result) {
    return (NSString *)@"Default";
  }
  return result;
}

- (void)setPresetID:(id)a3
{
  parentSlide = self->_parentSlide;
  if (parentSlide)
  {
    if (-[MPSlide slide](parentSlide, "slide"))
    {
      objc_msgSend(-[MPSlide slide](self->_parentSlide, "slide"), "setFrameAttribute:forKey:", a3, @"PresetID");
      objc_msgSend( -[MPSlide slide](self->_parentSlide, "slide"),  "setFrameAttribute:forKey:",  +[NSDictionary dictionary](NSDictionary, "dictionary"),  @"specificAttributes");
    }
  }

- (id)frameAttributes
{
  id result = self->_attributes;
  if (!result) {
    return objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "attributesForFrameID:andPresetID:",  -[MPFrame frameID](self, "frameID"),  -[MPFrame presetID](self, "presetID"));
  }
  return result;
}

- (id)frameAttributeForKey:(id)a3
{
  return objc_msgSend(-[MPFrame frameAttributes](self, "frameAttributes"), "objectForKey:", a3);
}

- (void)setFrameAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (attributes)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", a3, a4);
      goto LABEL_6;
    }
  }

  else
  {
    attributes = (NSMutableDictionary *)objc_msgSend( objc_msgSend( +[MPFrameManager sharedManager]( MPFrameManager,  "sharedManager"),  "attributesForFrameID:andPresetID:",  -[MPFrame frameID](self, "frameID"),  -[MPFrame presetID](self, "presetID")),  "mutableCopy");
    self->_attributes = attributes;
    if (a3) {
      goto LABEL_3;
    }
  }

  -[NSMutableDictionary removeObjectForKey:](attributes, "removeObjectForKey:", a4);
LABEL_6:
  parentSlide = self->_parentSlide;
  if (parentSlide)
  {
    if (-[MPSlide slide](parentSlide, "slide")) {
      objc_msgSend( -[MPSlide slide](self->_parentSlide, "slide"),  "setFrameAttribute:forKey:",  self->_attributes,  @"specificAttributes");
    }
  }

- (id)parentSlide
{
  return self->_parentSlide;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPFrame description](self, "description"));
}

- (id)parentDocument
{
  return objc_msgSend(-[MPFrame parentSlide](self, "parentSlide"), "parentDocument");
}

- (void)copyStruct:(id)a3
{
}

- (void)setParentSlide:(id)a3
{
  parentSlide = self->_parentSlide;
  if (parentSlide)
  {
    self->_parentSlide = 0LL;
    -[MPSlide setFrame:](parentSlide, "setFrame:", 0LL);
  }

  self->_parentSlide = (MPSlide *)a3;
  if (a3 && [a3 slide])
  {
    objc_msgSend(-[MPSlide slide](self->_parentSlide, "slide"), "setFrameID:", -[MPFrame frameID](self, "frameID"));
    objc_msgSend( -[MPSlide slide](self->_parentSlide, "slide"),  "setFrameAttribute:forKey:",  -[MPFrame presetID](self, "presetID"),  @"PresetID");
    if (self->_attributes) {
      objc_msgSend( -[MPSlide slide](self->_parentSlide, "slide"),  "setFrameAttribute:forKey:",  self->_attributes,  @"specificAttributes");
    }
    -[MPFrame setFrameAttribute:forKey:]( self,  "setFrameAttribute:forKey:",  [a3 sizingMode],  @"sizingMode");
  }

@end