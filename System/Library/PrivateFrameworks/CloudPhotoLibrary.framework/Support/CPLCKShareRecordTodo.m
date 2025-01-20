@interface CPLCKShareRecordTodo
- (id)description;
@end

@implementation CPLCKShareRecordTodo

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  scopedIdentifier = self->_scopedIdentifier;
  Class recordClass = self->_recordClass;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self->_privateRecordID, "recordName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self->_sharedRecordID, "recordName"));
  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@ %@ [%@->%@]>",  recordClass,  scopedIdentifier,  v6,  v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end