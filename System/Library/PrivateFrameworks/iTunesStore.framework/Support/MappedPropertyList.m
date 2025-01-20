@interface MappedPropertyList
+ (id)readKeyPath:(id)a3 fromURL:(id)a4 error:(id *)a5;
+ (id)readKeyPaths:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (MappedPropertyList)initWithURL:(id)a3;
- (id)readKeyPath:(id)a3 error:(id *)a4;
- (id)readKeyPaths:(id)a3 error:(id *)a4;
@end

@implementation MappedPropertyList

- (MappedPropertyList)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___MappedPropertyList;
    v6 = -[MappedPropertyList init](&v16, "init");
    if (v6)
    {
      v7 = (NSURL *)[v5 copy];
      URL = v6->_URL;
      v6->_URL = v7;
    }

    return v6;
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"-[MappedPropertyList initWithURL:]: nil URL argument",  0LL));
    objc_exception_throw(v10);
    return (MappedPropertyList *)+[MappedPropertyList readKeyPath:fromURL:error:](v11, v12, v13, v14, v15);
  }

+ (id)readKeyPath:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = -[MappedPropertyList initWithURL:](objc_alloc(&OBJC_CLASS___MappedPropertyList), "initWithURL:", v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MappedPropertyList readKeyPath:error:](v9, "readKeyPath:error:", v8, a5));
  return v10;
}

+ (id)readKeyPaths:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = -[MappedPropertyList initWithURL:](objc_alloc(&OBJC_CLASS___MappedPropertyList), "initWithURL:", v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MappedPropertyList readKeyPaths:error:](v9, "readKeyPaths:error:", v8, a5));
  return v10;
}

- (id)readKeyPath:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MappedPropertyList readKeyPaths:error:](self, "readKeyPaths:error:", v6, a4));

  return v7;
}

- (id)readKeyPaths:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_data)
  {
    id v7 = 0LL;
  }

  else
  {
    URL = self->_URL;
    id v16 = 0LL;
    v9 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  URL,  1LL,  &v16));
    id v7 = v16;
    data = self->_data;
    self->_data = v9;

    if (!self->_data)
    {
      id v11 = 0LL;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }

  id v14 = 0LL;
  v15 = 0LL;
  if (_CFPropertyListCreateFiltered(kCFAllocatorDefault))
  {
    id v11 = v15;
    if (!a4) {
      goto LABEL_12;
    }
  }

  else
  {
    SEL v12 = v14;

    id v11 = 0LL;
    id v7 = v12;
    if (!a4) {
      goto LABEL_12;
    }
  }

- (void).cxx_destruct
{
}

@end