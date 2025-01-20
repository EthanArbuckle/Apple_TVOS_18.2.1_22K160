void sub_3C5C(id a1)
{
  int v1;
  v1 = 0;
  dword_8190 = objc_msgSend((id)MGCopyAnswerWithError(@"BuildVersion", 0, &v1), "hash");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}
er v4;
  store = self->_store;
  if (store) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KeyboardUIMigrator;
  -[KeyboardUIMigrator dealloc](&v4, "dealloc");
}

- (CPBitmapStore)store
{
  result = self->_store;
  if (!result)
  {
    v4 = objc_alloc(&OBJC_CLASS___CPBitmapStore);
    v5 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  CPSharedResourcesDirectory(),  @"Library",  @"Caches",  @"com.apple.keyboards",  0LL));
    if (qword_8188 != -1) {
      dispatch_once(&qword_8188, &stru_4070);
    }
    result = -[CPBitmapStore initWithPath:version:](v4, "initWithPath:version:", v5, dword_8190);
    self->_store = result;
  }

  return result;
}

- (float)estimatedDuration
{
  unsigned int v3 = -[CPBitmapStore version](-[KeyboardUIMigrator store](self, "store"), "version");
  if (qword_8188 != -1) {
    dispatch_once(&qword_8188, &stru_4070);
  }
  if (v3 == dword_8190) {
    return 0.012;
  }
  return v5 + 0.012;
}

- (BOOL)performMigration
{
  unsigned int v3 = -[CPBitmapStore version](-[KeyboardUIMigrator store](self, "store"), "version");
  if (qword_8188 != -1) {
    dispatch_once(&qword_8188, &stru_4070);
  }
  if (v3 != dword_8190) {
    -[CPBitmapStore purge](-[KeyboardUIMigrator store](self, "store"), "purge");
  }
  return 1;
}

- (id)dataClassName
{
  return @"KeyboardUIMigrator";
}

@end