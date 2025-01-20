@interface IDSOffGridEncryptionProperties
- (NSData)__im_encryptionKeyID;
@end

@implementation IDSOffGridEncryptionProperties

- (NSData)__im_encryptionKeyID
{
  v2 = (NSData *)-[IDSOffGridEncryptionProperties encryptionKeyID](self, "encryptionKeyID");
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    return v2;
  }
  else {
    return 0LL;
  }
}

@end