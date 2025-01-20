@interface _PFObjectCKRecordZoneLink
- (NSManagedObjectID)objectID;
- (NSString)recordName;
- (_PFObjectCKRecordZoneLink)initWithObjectID:(id)a3 recordName:(id)a4;
- (void)dealloc;
@end

@implementation _PFObjectCKRecordZoneLink

- (_PFObjectCKRecordZoneLink)initWithObjectID:(id)a3 recordName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____PFObjectCKRecordZoneLink;
  v6 = -[_PFObjectCKRecordZoneLink init](&v8, sel_init);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_recordName = (NSString *)a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFObjectCKRecordZoneLink;
  -[_PFObjectCKRecordZoneLink dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSString)recordName
{
  return self->_recordName;
}

@end