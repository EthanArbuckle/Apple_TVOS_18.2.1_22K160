@interface NSURL(NSURLPathUtilities)
+ (uint64_t)fileURLWithPathComponents:()NSURLPathUtilities;
- (CFURLRef)URLByAppendingPathComponent:()NSURLPathUtilities isDirectory:;
- (CFURLRef)URLByAppendingPathExtension:()NSURLPathUtilities;
- (CFURLRef)URLByDeletingLastPathComponent;
- (CFURLRef)URLByDeletingPathExtension;
- (id)URLByResolvingSymlinksInPath;
- (id)URLByStandardizingPath;
- (uint64_t)URLByAppendingPathComponent:()NSURLPathUtilities;
- (uint64_t)checkResourceIsReachableAndReturnError:()NSURLPathUtilities;
- (uint64_t)lastPathComponent;
- (uint64_t)pathComponents;
- (uint64_t)pathExtension;
@end

@implementation NSURL(NSURLPathUtilities)

+ (uint64_t)fileURLWithPathComponents:()NSURLPathUtilities
{
  if (a3)
  {
    v4 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:");
    else {
      return [MEMORY[0x189604030] fileURLWithPath:v4];
    }
  }

  else
  {
    v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
    return -[NSURL(NSURLPathUtilities) pathComponents]();
  }

- (uint64_t)pathComponents
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "pathComponents");
}

- (uint64_t)lastPathComponent
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "lastPathComponent");
}

- (uint64_t)pathExtension
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "pathExtension");
}

- (CFURLRef)URLByAppendingPathComponent:()NSURLPathUtilities isDirectory:
{
  if (a3) {
    return CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x189604DD0], url, a3, a4);
  }
  v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem((objc_class *)url, a2)), 0 reason userInfo];
  objc_exception_throw(v5);
  return (CFURLRef)-[NSURL(NSURLPathUtilities) URLByAppendingPathComponent:]();
}

- (uint64_t)URLByAppendingPathComponent:()NSURLPathUtilities
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  uint64_t v16 = 0LL;
  if (([a3 hasSuffix:@"/"] & 1) != 0 || !-[objc_class isFileURL](a1, "isFileURL"))
  {
    uint64_t v6 = -[objc_class URLByAppendingPathComponent:isDirectory:](a1, "URLByAppendingPathComponent:isDirectory:", a3, 0LL);
    v12[5] = v6;
  }

  else
  {
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x3052000000LL;
    v10[3] = __Block_byref_object_copy__16;
    v10[4] = __Block_byref_object_dispose__16;
    v10[5] = 0LL;
    uint64_t v5 = -[objc_class URLByAppendingPathComponent:isDirectory:](a1, "URLByAppendingPathComponent:isDirectory:", a3, 0LL);
    v12[5] = v5;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke;
    v9[3] = &unk_189CA1150;
    v9[6] = &v11;
    v9[7] = v10;
    v9[4] = a1;
    v9[5] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x189604030], (uint64_t)v9);
    _Block_object_dispose(v10, 8);
    uint64_t v6 = v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (CFURLRef)URLByDeletingLastPathComponent
{
  return CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x189604DD0], url);
}

- (CFURLRef)URLByAppendingPathExtension:()NSURLPathUtilities
{
  if (a3) {
    return CFURLCreateCopyAppendingPathExtension((CFAllocatorRef)*MEMORY[0x189604DD0], url, a3);
  }
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem((objc_class *)url, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  return (CFURLRef)-[NSURL(NSURLPathUtilities) URLByDeletingPathExtension](v5);
}

- (CFURLRef)URLByDeletingPathExtension
{
  return CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x189604DD0], url);
}

- (uint64_t)checkResourceIsReachableAndReturnError:()NSURLPathUtilities
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  CFURLRef v5 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v5 == (objc_class *)qword_18C496C40)
  {
    v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v5, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    __break(1u);
  }

  if (v5)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke;
    v9[3] = &unk_189CA1178;
    v9[4] = &v10;
    v9[5] = v5;
    v9[6] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x189604030], (uint64_t)v9);
    if (a3)
    {
      if (!*((_BYTE *)v11 + 24)) {
        *a3 = *a3;
      }
    }
  }

  uint64_t v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)URLByStandardizingPath
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "path"), "stringByStandardizingPath");
  if (!v3) {
    return a1;
  }
  uint64_t v4 = v3;
  else {
    return (id)[MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:CFURLHasDirectoryPath((CFURLRef)a1) != 0];
  }
}

- (id)URLByResolvingSymlinksInPath
{
  uint64_t v3 = (void *)[a1 path];
  if (!v3) {
    return a1;
  }
  uint64_t v4 = [v3 stringByResolvingSymlinksInPath];
  return (id)[MEMORY[0x189604030] fileURLWithPath:v4];
}

@end