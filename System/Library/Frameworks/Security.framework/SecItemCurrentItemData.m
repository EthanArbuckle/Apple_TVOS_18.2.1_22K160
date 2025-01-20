@interface SecItemCurrentItemData
- (NSData)persistentRef;
- (NSDate)currentItemPointerModificationTime;
- (SecItemCurrentItemData)initWithPersistentRef:(id)a3;
- (void)setCurrentItemPointerModificationTime:(id)a3;
- (void)setPersistentRef:(id)a3;
@end

@implementation SecItemCurrentItemData

- (SecItemCurrentItemData)initWithPersistentRef:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecItemCurrentItemData;
  v5 = -[SecItemCurrentItemData init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SecItemCurrentItemData setPersistentRef:](v5, "setPersistentRef:", v4);
    v7 = v6;
  }

  return v6;
}

- (NSData)persistentRef
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPersistentRef:(id)a3
{
}

- (NSDate)currentItemPointerModificationTime
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentItemPointerModificationTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end