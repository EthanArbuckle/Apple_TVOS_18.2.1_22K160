@interface _NSUndoBeginMark
- (BOOL)isBeginMark;
- (BOOL)isDiscardable;
- (id)description;
- (id)groupIdentifier;
- (id)userInfo;
- (void)dealloc;
- (void)setDiscardable:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _NSUndoBeginMark

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSUndoBeginMark;
  -[_NSUndoBeginMark dealloc](&v3, sel_dealloc);
}

- (void)setGroupIdentifier:(id)a3
{
  id groupIdentifier = self->_groupIdentifier;
  self->_id groupIdentifier = (id)objc_msgSend(a3, "copyWithZone:", -[_NSUndoBeginMark zone](self, "zone"));
}

- (id)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setUserInfo:(id)a3
{
  userInfo = self->_userInfo;
  self->_userInfo = (NSMutableDictionary *)objc_msgSend( a3,  "mutableCopyWithZone:",  -[_NSUndoBeginMark zone](self, "zone"));
}

- (id)userInfo
{
  return self->_userInfo;
}

- (BOOL)isDiscardable
{
  return self->_isDiscardable;
}

- (void)setDiscardable:(BOOL)a3
{
  self->_isDiscardable = a3;
}

- (BOOL)isBeginMark
{
  return 1;
}

- (id)description
{
  id groupIdentifier = (const __CFString *)self->_groupIdentifier;
  BOOL isDiscardable = self->_isDiscardable;
  userInfo = self->_userInfo;
  if (userInfo) {
    v5 = (const __CFString *)-[NSMutableDictionary description](userInfo, "description");
  }
  else {
    v5 = &stru_189CA6A28;
  }
  if (groupIdentifier) {
    v6 = groupIdentifier;
  }
  else {
    v6 = &stru_189CA6A28;
  }
  v7 = "(discardable)";
  if (!isDiscardable) {
    v7 = "";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"beginUndoGrouping %@ %s %@",  v6,  v7,  v5);
}

@end