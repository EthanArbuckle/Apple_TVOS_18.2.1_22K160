@interface __NSSingleObjectEnumerator
- (__NSSingleObjectEnumerator)init;
- (__NSSingleObjectEnumerator)initWithObject:(id)a3 collection:(id)a4;
- (id)description;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSSingleObjectEnumerator

- (__NSSingleObjectEnumerator)initWithObject:(id)a3 collection:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return -[__NSSingleObjectEnumerator init](self, "init");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSSingleObjectEnumerator;
  v6 = -[__NSSingleObjectEnumerator init](&v8, sel_init);
  if (v6)
  {
    v6->_theObjectToReturn = a3;
    v6->_theCollection = a4;
  }

  return v6;
}

- (__NSSingleObjectEnumerator)init
{
  qword_18C539A70 = (uint64_t)"Attempt to create a single-object enumerator with no object/collection";
  __break(1u);
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSSingleObjectEnumerator;
  -[__NSSingleObjectEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  id v3 = self->_theObjectToReturn;
  self->_theObjectToReturn = 0LL;
  id theCollection = self->_theCollection;
  self->_id theCollection = 0LL;

  return v3;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  Mutable = CFStringCreateMutable(0LL, 0LL);
  if (self->_theObjectToReturn)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS_____NSSingleObjectEnumerator;
    id v5 = -[NSObject description](&v8, sel_description);
    CFStringAppendFormat(Mutable, 0LL, @"%@ that will yield %@", v5, self->_theObjectToReturn);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS_____NSSingleObjectEnumerator;
    id v6 = -[NSObject description](&v7, sel_description);
    CFStringAppendFormat(Mutable, 0LL, @"%@ that yielded its object", v6);
  }

  return (id)CFAutorelease(Mutable);
}

@end