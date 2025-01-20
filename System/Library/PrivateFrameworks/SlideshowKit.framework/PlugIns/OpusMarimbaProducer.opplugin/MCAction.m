@interface MCAction
- (BOOL)isSnapshot;
- (BOOL)tracksInParent;
- (MCAction)initWithImprint:(id)a3;
- (NSString)targetObjectID;
- (id)description;
- (id)imprint;
- (id)snapshot;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setTargetObjectID:(id)a3;
- (void)setTracksInParent:(BOOL)a3;
@end

@implementation MCAction

- (MCAction)initWithImprint:(id)a3
{
  v4 = -[MCAction init](self, "init");
  if (v4) {
    v4->_targetObjectID = (NSString *)[a3 objectForKey:@"targetObjectID"];
  }
  return v4;
}

- (void)demolish
{
  self->_targetObjectID = 0LL;
}

- (id)imprint
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCAction;
  id v3 = -[MCObjectLight imprint](&v5, "imprint");
  [v3 setObject:self->_targetObjectID forKey:@"targetObjectID"];
  return v3;
}

- (BOOL)tracksInParent
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (void)setTracksInParent:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFF7 | v3;
}

- (BOOL)isSnapshot
{
  return self->_flags & 1;
}

- (id)snapshot
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAction;
  id result = -[MCObjectBase snapshot](&v3, "snapshot");
  *((_DWORD *)result + 2) |= 1u;
  return result;
}

- (void)_copySelfToSnapshot:(id)a3
{
  targetObjectID = self->_targetObjectID;
  if (targetObjectID) {
    *((void *)a3 + 2) = -[NSString copy](targetObjectID, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAction;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @": targetObjectID='%@', isSnapshot=%d",  self->_targetObjectID,  -[MCAction isSnapshot](self, "isSnapshot"));
}

- (NSString)targetObjectID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTargetObjectID:(id)a3
{
}

@end