@interface NSCloudKitMirroringResetMetadataRequest
- (NSSet)objectIDsToReset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setObjectIDsToReset:(id)a3;
@end

@implementation NSCloudKitMirroringResetMetadataRequest

- (void)dealloc
{
  self->_objectIDsToReset = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResetMetadataRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResetMetadataRequest;
  v4 = -[NSCloudKitMirroringRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[10] = self->_objectIDsToReset;
  return v4;
}

- (NSSet)objectIDsToReset
{
  return self->_objectIDsToReset;
}

- (void)setObjectIDsToReset:(id)a3
{
}

@end