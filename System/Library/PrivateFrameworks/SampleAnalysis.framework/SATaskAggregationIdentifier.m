@interface SATaskAggregationIdentifier
- (BOOL)isEqual:(id)a3;
- (id)initWithBinary:(void *)a3 sharedCache:(void *)a4 rcid:;
- (unint64_t)hash;
@end

@implementation SATaskAggregationIdentifier

- (id)initWithBinary:(void *)a3 sharedCache:(void *)a4 rcid:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___SATaskAggregationIdentifier;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v7 = v5;
    if (v5)
    {
      id v9 = (SABinary *)objc_getProperty(v5, v6, 8LL, 1);
      if (v9 != self->_binary)
      {
        BOOL v10 = 0;
LABEL_11:

        goto LABEL_12;
      }

      v11 = (SASharedCache *)objc_getProperty(v7, v8, 16LL, 1);
      if (v11 != self->_sharedCache) {
        goto LABEL_7;
      }
      sharedCache = (SASharedCache *)v7[3];
    }

    else
    {
      if (self->_binary)
      {
        BOOL v10 = 0;
        id v9 = 0LL;
        goto LABEL_11;
      }

      sharedCache = self->_sharedCache;
      if (sharedCache)
      {
        id v9 = 0LL;
        v11 = 0LL;
LABEL_7:
        BOOL v10 = 0;
LABEL_10:

        goto LABEL_11;
      }

      id v9 = 0LL;
      v11 = 0LL;
    }

    BOOL v10 = sharedCache == (SASharedCache *)self->_rcid;
    goto LABEL_10;
  }

  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  return self->_rcid | (unint64_t)self->_binary;
}

- (void).cxx_destruct
{
}

@end