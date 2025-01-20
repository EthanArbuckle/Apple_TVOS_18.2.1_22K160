@interface NSCloudKitMirroringDelegateSetupRequestOptions
- (BOOL)fromNotification;
- (id)copy;
- (id)createDefaultOperationConfiguration;
- (void)setFromNotification:(BOOL)a3;
@end

@implementation NSCloudKitMirroringDelegateSetupRequestOptions

- (id)copy
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequestOptions;
  id v3 = -[NSCloudKitMirroringRequestOptions copy](&v5, sel_copy);
  objc_msgSend( v3,  "setFromNotification:",  -[NSCloudKitMirroringDelegateSetupRequestOptions fromNotification](self, "fromNotification"));
  return v3;
}

- (id)createDefaultOperationConfiguration
{
  return objc_alloc_init(getCloudKitCKOperationConfigurationClass());
}

- (BOOL)fromNotification
{
  return self->_fromNotification;
}

- (void)setFromNotification:(BOOL)a3
{
  self->_fromNotification = a3;
}

@end