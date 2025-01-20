@interface PFCloudKitErrorLog
- (PFCloudKitErrorLog)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFCloudKitErrorLog

- (PFCloudKitErrorLog)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitErrorLog;
  v2 = -[PFCloudKitErrorLog init](&v4, sel_init);
  if (v2) {
    v2->_entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }
  return v2;
}

- (void)dealloc
{
  self->_entries = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitErrorLog;
  -[PFCloudKitErrorLog dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PFCloudKitErrorLog;
  objc_super v3 = (void *)objc_msgSend(-[PFCloudKitErrorLog description](&v7, sel_description), "mutableCopy");
  entries = self->_entries;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __33__PFCloudKitErrorLog_description__block_invoke;
  v6[3] = &unk_189EA9CB0;
  v6[4] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v6);
  return v3;
}

uint64_t __33__PFCloudKitErrorLog_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v3 = *(void *)(a2 + 16);
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  return [v2 appendFormat:@"\n%@: %@", v3, v4];
}

@end