@interface _PFCKInsertedMetadataLink
- (id)description;
- (void)dealloc;
@end

@implementation _PFCKInsertedMetadataLink

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFCKInsertedMetadataLink;
  -[_PFCKInsertedMetadataLink dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3 = (void *)-[NSCKRecordMetadata createRecordID](self->_recordMetadata);
  v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)[v4 stringWithFormat:@"<%@: %p> %@ -> %@", NSStringFromClass(v5), self, -[NSManagedObject objectID](self->_insertedObject, "objectID"), v3];

  return v6;
}

@end