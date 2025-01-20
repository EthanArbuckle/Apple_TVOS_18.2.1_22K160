@interface NSHTTPCookie2Key
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)initWithHTTPCookie2:(void *)a1;
@end

@implementation NSHTTPCookie2Key

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v6 = v4;
  name = self->_name;
  if (v4) {
    id Property = objc_getProperty(v4, v5, 8LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (-[NSString isEqualToString:](name, "isEqualToString:", Property))
  {
    path = self->_path;
    id v11 = v6 ? objc_getProperty(v6, v9, 24LL, 1) : 0LL;
    if (-[NSString isEqualToString:](path, "isEqualToString:", v11))
    {
      domain = self->_domain;
      id v14 = v6 ? objc_getProperty(v6, v12, 16LL, 1) : 0LL;
      if (-[NSString isEqualToString:](domain, "isEqualToString:", v14))
      {
        partition = self->_partition;
        if (v6)
        {
          v17 = (NSString *)objc_getProperty(v6, v15, 32LL, 1);
          if (partition == v17)
          {
            char v21 = 1;
            v19 = partition;
            goto LABEL_17;
          }

          v19 = v17;
          partition = self->_partition;
          id v20 = objc_getProperty(v6, v18, 32LL, 1);
        }

        else
        {
          v19 = 0LL;
          if (!partition)
          {
            char v21 = 1;
            goto LABEL_17;
          }

          id v20 = 0LL;
        }

        char v21 = -[NSString isEqualToString:](partition, "isEqualToString:", v20);
LABEL_17:

        goto LABEL_15;
      }
    }
  }

  char v21 = 0;
LABEL_15:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_name, "hash");
  NSUInteger v4 = -[NSString hash](self->_partition, "hash") - v3 + 32 * v3;
  NSUInteger v5 = -[NSString hash](self->_path, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_domain, "hash") - v5 + 32 * v5;
}

- (void).cxx_destruct
{
}

- (void)initWithHTTPCookie2:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___NSHTTPCookie2Key;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 name];
      NSUInteger v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [v3 partition];
      v7 = (void *)a1[4];
      a1[4] = v6;

      uint64_t v8 = [v3 path];
      v9 = (void *)a1[3];
      a1[3] = v8;

      uint64_t v10 = [v3 domain];
      id v11 = (void *)a1[2];
      a1[2] = v10;
    }
  }

  return a1;
}

@end