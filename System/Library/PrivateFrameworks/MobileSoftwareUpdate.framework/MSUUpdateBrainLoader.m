@interface MSUUpdateBrainLoader
- (BOOL)cancel:(id *)a3;
- (MSUUpdateBrainLoader)initWithDictionary:(id)a3;
- (NSDictionary)attributesDict;
- (int64_t)requiredDiskSpace:(id *)a3;
- (void)adjustOptions:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4;
- (void)setAttributesDict:(id)a3;
@end

@implementation MSUUpdateBrainLoader

- (MSUUpdateBrainLoader)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSUUpdateBrainLoader;
  v4 = -[MSUUpdateBrainLoader init](&v6, sel_init);
  if (v4) {
    v4->_attributesDict = (NSDictionary *)a3;
  }
  return v4;
}

- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke;
  block[3] = &unk_18A0EB290;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(global_queue, block);
}

uint64_t __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v8 = 0LL;
  v2 = (void *)[MEMORY[0x189603FC8] dictionary];
  if ([*(id *)(a1 + 32) attributesDict]) {
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(*(id *)(a1 + 32), "attributesDict"), @"AssetProperties");
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v2 setObject:v3 forKey:@"ClientOptions"];
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_2;
  v7[3] = &unk_18A0EB268;
  v7[4] = *(void *)(a1 + 48);
  int v4 = perform_command_with_progress("LoadBrain", v2, 0LL, 0LL, (const __CFString **)&v8, (uint64_t)v7);
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, id))(v5 + 16))(v5, 0LL, v8);
  }
  v9 = @"MSUAssetOperation";
  v10[0] = @"MSUAssetOperationCompleted";
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v5 + 16))( v5,  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1],  0);
}

uint64_t __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_2(uint64_t a1)
{
  return 0LL;
}

- (BOOL)cancel:(id *)a3
{
  return 1;
}

- (void)adjustOptions:(id)a3 completion:(id)a4
{
  if (a3) {
    (*((void (**)(id, id))a4 + 2))(a4, 0LL);
  }
}

- (int64_t)requiredDiskSpace:(id *)a3
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUUpdateBrainLoader;
  -[MSUUpdateBrainLoader dealloc](&v3, sel_dealloc);
}

- (NSDictionary)attributesDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAttributesDict:(id)a3
{
}

@end