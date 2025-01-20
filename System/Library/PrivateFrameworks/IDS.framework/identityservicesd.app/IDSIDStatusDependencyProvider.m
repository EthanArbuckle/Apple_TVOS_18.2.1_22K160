@interface IDSIDStatusDependencyProvider
- (id)currentDate;
- (id)newRemoteCredential;
@end

@implementation IDSIDStatusDependencyProvider

- (id)newRemoteCredential
{
  return objc_alloc_init(&OBJC_CLASS___IDSRemoteCredential);
}

- (id)currentDate
{
  return objc_alloc_init(&OBJC_CLASS___NSDate);
}

@end