@interface _NSBundleODRDataForExtensions
+ (_NSBundleODRDataForExtensions)dataForBundle:(int)a3 createIfRequired:;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)accessSandboxExtension:(id)a3;
- (void)dealloc;
- (void)hostApplicationAssetPacksBecameAvailable:(id)a3;
- (void)hostApplicationAssetPacksBecameUnavailable:(id)a3;
@end

@implementation _NSBundleODRDataForExtensions

+ (_NSBundleODRDataForExtensions)dataForBundle:(int)a3 createIfRequired:
{
  if (qword_18C497F50 != -1) {
    dispatch_once(&qword_18C497F50, &__block_literal_global_196);
  }
  [(id)qword_18C497F48 lock];
  v5 = (NSMapTable *)qword_18C497F40;
  if (!qword_18C497F40)
  {
    if (!a3)
    {
      v7 = 0LL;
      goto LABEL_10;
    }

    v5 = +[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable");
    qword_18C497F40 = (uint64_t)v5;
  }

  uint64_t v6 = -[NSMapTable objectForKey:](v5, "objectForKey:", a2);
  v7 = (_NSBundleODRDataForExtensions *)v6;
  if (a3 && !v6)
  {
    v7 = -[_NSBundleODRDataCommon initWithBundle:]( objc_alloc(&OBJC_CLASS____NSBundleODRDataForExtensions),  "initWithBundle:",  a2);
    [(id)qword_18C497F40 setObject:v7 forKey:a2];
    v8 = v7;
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForExtensions;
  -[_NSBundleODRDataCommon dealloc](&v3, sel_dealloc);
}

- (void)accessSandboxExtension:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a3 UTF8String];
  int64_t v4 = sandbox_extension_consume();
  self->super._sandboxToken = v4;
  if (v4 < 0)
  {
    int v5 = *__error();
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    uint64_t v6 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest encountered a sandboxing error (extensions): %d",  (uint8_t *)v7,  8u);
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  self->_connection = (NSXPCConnection *)a4;
  return 1;
}

- (void)hostApplicationAssetPacksBecameAvailable:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 0LL;
  if (!-[_NSBundleODRDataCommon assetPacksBecameAvailable:error:](self, "assetPacksBecameAvailable:error:", a3, &v4))
  {
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    objc_super v3 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_ERROR,  "Error in extension adding asset packs: %@",  buf,  0xCu);
    }
  }

- (void)hostApplicationAssetPacksBecameUnavailable:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!-[_NSBundleODRDataCommon assetPacksBecameUnavailable:error:]( self,  "assetPacksBecameUnavailable:error:",  a3,  0LL))
  {
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    objc_super v3 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      uint64_t v5 = 0LL;
      _os_log_error_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_ERROR,  "Error in extension removing asset packs: %@",  (uint8_t *)&v4,  0xCu);
    }
  }

@end