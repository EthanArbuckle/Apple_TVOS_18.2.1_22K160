@interface PKFilesystemProvider
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 withData:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (PKNSBundleProxy)mainBundle;
- (id)bundleWithURL:(id)a3;
- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation PKFilesystemProvider

- (PKNSBundleProxy)mainBundle
{
  v2 = objc_alloc(&OBJC_CLASS___PKNSBundleProxy);
  objc_msgSend_mainBundle(MEMORY[0x1896077F8], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithNSBundle_(v2, v8, (uint64_t)v7, v9, v10);

  return (PKNSBundleProxy *)v11;
}

- (id)bundleWithURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___PKNSBundleProxy);
  id v5 = objc_alloc(MEMORY[0x1896077F8]);
  uint64_t v9 = (void *)objc_msgSend_initWithURL_(v5, v6, (uint64_t)v3, v7, v8);

  v13 = (void *)objc_msgSend_initWithNSBundle_(v4, v10, (uint64_t)v9, v11, v12);
  return v13;
}

- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x189603F48];
  id v8 = a3;
  id v9 = objc_alloc(v7);
  uint64_t v11 = (void *)objc_msgSend_initWithContentsOfURL_options_error_(v9, v10, (uint64_t)v8, a4, (uint64_t)a5);

  return v11;
}

- (BOOL)writeToURL:(id)a3 withData:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return MEMORY[0x189616718](a4, sel_writeToURL_options_error_, a3, a5, a6);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v9 = (void *)MEMORY[0x1896078A8];
  id v10 = a5;
  id v11 = a3;
  objc_msgSend_defaultManager(v9, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_( v16,  v17,  (uint64_t)v11,  v7,  (uint64_t)v10,  a6);

  return (char)a6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = (void *)MEMORY[0x1896078A8];
  id v10 = a4;
  id v11 = a3;
  objc_msgSend_defaultManager(v9, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_( v16,  v17,  (uint64_t)v11,  (uint64_t)v10,  a5,  a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end