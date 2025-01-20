@interface TransparencyGPBExtensionRegistry
- (TransparencyGPBExtensionRegistry)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4;
- (void)addExtension:(id)a3;
- (void)addExtensions:(id)a3;
- (void)dealloc;
@end

@implementation TransparencyGPBExtensionRegistry

- (TransparencyGPBExtensionRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyGPBExtensionRegistry;
  v2 = -[TransparencyGPBExtensionRegistry init](&v4, "init");
  if (v2) {
    v2->mutableClassMap_ = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBExtensionRegistry;
  -[TransparencyGPBExtensionRegistry dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 addExtensions:self];
  return v4;
}

- (void)addExtension:(id)a3
{
  if (a3)
  {
    id v5 = [a3 containingMessageClass];
    Value = (void *)CFDictionaryGetValue(self->mutableClassMap_, v5);
    if (!Value)
    {
      Value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(self->mutableClassMap_, v5, Value);
      CFRelease(Value);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)Value, (const void *)[a3 fieldNumber], a3);
  }

- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4
{
  id result = (id)CFDictionaryGetValue(self->mutableClassMap_, [a3 messageClass]);
  if (result) {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a4);
  }
  return result;
}

- (void)addExtensions:(id)a3
{
  if (a3) {
    CFDictionaryApplyFunction( *((CFDictionaryRef *)a3 + 1),  (CFDictionaryApplierFunction)sub_10012DCBC,  self->mutableClassMap_);
  }
}

@end