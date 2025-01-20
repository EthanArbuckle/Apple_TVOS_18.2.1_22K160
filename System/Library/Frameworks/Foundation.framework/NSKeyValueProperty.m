@interface NSKeyValueProperty
- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3;
- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7;
- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 propertiesBeingInitialized:(__CFSet *)a5;
- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3;
- (id)keyPath;
- (id)restOfKeyPathIfContainedByValueForKeyPath:(id)a3;
- (void)dealloc;
@end

@implementation NSKeyValueProperty

- (id)keyPath
{
  return self->_keyPath;
}

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSKeyValueProperty;
  v8 = -[NSKeyValueProperty init](&v10, sel_init);
  if (v8)
  {
    v8->_containerClass = (NSKeyValueContainerClass *)a3;
    v8->_keyPath = (NSString *)[a4 copy];
    CFSetAddValue(a5, v8);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  a7->var0 = 0LL;
  a7->var1 = 0LL;
  return 1;
}

- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3
{
  return 0LL;
}

- (id)restOfKeyPathIfContainedByValueForKeyPath:(id)a3
{
  keyPath = self->_keyPath;
  if (keyPath == a3 || CFEqual(a3, keyPath)) {
    return &stru_189CA6A28;
  }
  unint64_t v7 = [a3 length];
  if (-[NSString hasPrefix:](self->_keyPath, "hasPrefix:", a3)
    && -[NSString length](self->_keyPath, "length") > v7
    && -[NSString characterAtIndex:](self->_keyPath, "characterAtIndex:", v7) == 46)
  {
    return -[NSString substringFromIndex:](self->_keyPath, "substringFromIndex:", v7 + 1);
  }

  else
  {
    return 0LL;
  }

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  return 0;
}

@end