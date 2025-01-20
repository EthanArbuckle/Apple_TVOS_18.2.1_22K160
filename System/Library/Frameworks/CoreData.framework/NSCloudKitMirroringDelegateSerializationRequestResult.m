@interface NSCloudKitMirroringDelegateSerializationRequestResult
- (NSCloudKitMirroringDelegateSerializationRequestResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 serializedObjects:(id)a5 error:(id)a6;
- (NSDictionary)serializedObjects;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegateSerializationRequestResult

- (NSCloudKitMirroringDelegateSerializationRequestResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 serializedObjects:(id)a5 error:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequestResult;
  v7 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( &v10,  sel_initWithRequest_storeIdentifier_success_madeChanges_error_,  a3,  a4,  a5 != 0LL,  0LL,  a6);
  if (v7)
  {
    if (a5) {
      v8 = (NSDictionary *)[a5 copy];
    }
    else {
      v8 = (NSDictionary *)(id)NSDictionary_EmptyDictionary;
    }
    v7->_serializedObjects = v8;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequestResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (NSDictionary)serializedObjects
{
  return self->_serializedObjects;
}

@end