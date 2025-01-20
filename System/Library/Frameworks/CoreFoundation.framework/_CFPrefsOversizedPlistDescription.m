@interface _CFPrefsOversizedPlistDescription
- (id)_descriptionOfDictionary:(__CFDictionary *)a3 withKeyRedaction:(BOOL)a4;
- (id)_descriptionWithKeyRedaction:(BOOL)a3;
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
- (void)initWithDict:(const void *)a3 setKeys:(const void *)a4 andValues:(CFIndex)a5 count:;
@end

@implementation _CFPrefsOversizedPlistDescription

- (void)initWithDict:(const void *)a3 setKeys:(const void *)a4 andValues:(CFIndex)a5 count:
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_CLASS____CFPrefsOversizedPlistDescription;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    if (a2) {
      CFTypeRef v10 = CFRetain(a2);
    }
    else {
      CFTypeRef v10 = 0LL;
    }
    v9[1] = v10;
    v9[2] = CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  a3,  a4,  a5,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }

  return v9;
}

- (id)_descriptionOfDictionary:(__CFDictionary *)a3 withKeyRedaction:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t Count = CFDictionaryGetCount(a3);
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, 0LL);
  v8 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeArrayCallBacks);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke;
  v15[3] = &unk_1899EEF08;
  v15[4] = &v17;
  v15[5] = Mutable;
  BOOL v16 = a4;
  v15[6] = v8;
  CFDictionaryApply(a3, (uint64_t)v15);
  CFRelease(Mutable);
  CFTypeRef v10 = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  if (CFArrayGetCount(v8) > 9) {
    CFIndex v11 = 10LL;
  }
  else {
    CFIndex v11 = CFArrayGetCount(v8);
  }
  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke_2;
  v14[3] = &__block_descriptor_40_e13_v24__0r_v8_16l;
  v14[4] = v10;
  CFArrayApply((uint64_t)v8, 0LL, v11, (uint64_t)v14);
  if (CFArrayGetCount(v8) >= 11) {
    CFStringAppendFormat( v10,  0LL,  @"...\nTotal keys: %ld - Average approximate value size: %ld bytes",  Count,  v18[3] / Count);
  }
  CFRelease(v8);
  CFTypeRef v12 = CFAutorelease(v10);
  _Block_object_dispose(&v17, 8);
  return (id)v12;
}

- (id)_descriptionWithKeyRedaction:(BOOL)a3
{
  BOOL v3 = a3;
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  if (CFDictionaryGetCount(self->newValues) >= 1) {
    CFStringAppendFormat( Mutable,  0LL,  @"Description of keys being set:\n%@\n",  -[_CFPrefsOversizedPlistDescription _descriptionOfDictionary:withKeyRedaction:]( self,  "_descriptionOfDictionary:withKeyRedaction:",  self->newValues,  v3));
  }
  existingValues = self->existingValues;
  if (existingValues && CFDictionaryGetCount(existingValues) >= 1) {
    CFStringAppendFormat( Mutable,  0LL,  @"Description of keys already present:\n%@\n",  -[_CFPrefsOversizedPlistDescription _descriptionOfDictionary:withKeyRedaction:]( self,  "_descriptionOfDictionary:withKeyRedaction:",  self->existingValues,  v3));
  }
  return (id)CFAutorelease(Mutable);
}

- (id)redactedDescription
{
  return -[_CFPrefsOversizedPlistDescription _descriptionWithKeyRedaction:](self, "_descriptionWithKeyRedaction:", 1LL);
}

- (id)description
{
  return -[_CFPrefsOversizedPlistDescription _descriptionWithKeyRedaction:](self, "_descriptionWithKeyRedaction:", 0LL);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  existingValues = self->existingValues;
  if (existingValues) {
    CFRelease(existingValues);
  }
  newValues = self->newValues;
  if (newValues) {
    CFRelease(newValues);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____CFPrefsOversizedPlistDescription;
  -[_CFPrefsOversizedPlistDescription dealloc](&v5, sel_dealloc);
}

@end