@interface PFStaticCloudKitContainerProvider
- (CKContainer)container;
- (PFStaticCloudKitContainerProvider)initWithContainer:(id)a3;
- (id)containerWithIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation PFStaticCloudKitContainerProvider

- (PFStaticCloudKitContainerProvider)initWithContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFStaticCloudKitContainerProvider;
  v4 = -[PFStaticCloudKitContainerProvider init](&v6, sel_init);
  if (v4) {
    v4->_container = (CKContainer *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFStaticCloudKitContainerProvider;
  -[PFStaticCloudKitContainerProvider dealloc](&v3, sel_dealloc);
}

- (id)containerWithIdentifier:(id)a3
{
  if (-[NSString isEqualToString:]( -[CKContainer containerIdentifier](self->_container, "containerIdentifier"),  "isEqualToString:",  a3))
  {
    return self->_container;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Invalid for a container '%@'. This object was configured to only respond to container requests for '%@'", a3, -[CKContainer containerIdentifier](self->_container, "containerIdentifier")), 0 reason userInfo]);
  return -[PFStaticCloudKitContainerProvider containerWithIdentifier:options:](v6, v7, v8, v9);
}

- (CKContainer)container
{
  return self->_container;
}

@end