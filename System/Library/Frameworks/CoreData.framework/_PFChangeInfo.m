@interface _PFChangeInfo
- (BOOL)isEqual:(id)a3;
- (NSManagedObject)object;
- (_PFChangeInfo)initWithObject:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _PFChangeInfo

- (_PFChangeInfo)initWithObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PFChangeInfo;
  v4 = -[_PFChangeInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_object = (NSManagedObject *)a3;
    v4->_changeType = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)dealloc
{
  self->_startIndexPath = 0LL;
  self->_finalIndexPath = 0LL;

  self->_startSectionInfo = 0LL;
  self->_finalSectionInfo = 0LL;

  self->_object = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFChangeInfo;
  -[_PFChangeInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSManagedObjectID hash]( -[NSManagedObject objectID](-[_PFChangeInfo object](self, "object"), "objectID"),  "hash");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSManagedObjectID isEqual:]( -[NSManagedObject objectID](-[_PFChangeInfo object](self, "object"), "objectID"),  "isEqual:",  objc_msgSend((id)objc_msgSend(a3, "object"), "objectID"));
  }
  else {
    return 0;
  }
}

- (id)description
{
  unint64_t v3 = self->_changeType - 1;
  if (v3 > 3) {
    v4 = @"Unset";
  }
  else {
    v4 = *(&off_189EABDD8 + v3);
  }
  v5 = (void *)NSString;
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  object = self->_object;
  if (self->_startIndexPath) {
    v9 = (const __CFString *)[NSString stringWithFormat:@", startIndex: %@", self->_startIndexPath];
  }
  else {
    v9 = &stru_189EAC2E8;
  }
  if (self->_finalIndexPath) {
    v10 = (const __CFString *)[NSString stringWithFormat:@", finalIndex: %@", self->_finalIndexPath];
  }
  else {
    v10 = &stru_189EAC2E8;
  }
  return (id)[v5 stringWithFormat:@"<%@: %p> { object: %p, type: %@%@%@ }", v7, self, object, v4, v9, v10];
}

- (NSManagedObject)object
{
  return self->_object;
}

@end