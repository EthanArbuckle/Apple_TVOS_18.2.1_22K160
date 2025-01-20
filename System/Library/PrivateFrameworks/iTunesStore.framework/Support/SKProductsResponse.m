@interface SKProductsResponse
- (NSArray)invalidProductIdentifiers;
- (NSArray)products;
- (SKProductsResponse)init;
- (SKProductsResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)_setInvalidIdentifiers:(id)a3;
- (void)_setProducts:(id)a3;
@end

@implementation SKProductsResponse

- (SKProductsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKProductsResponse;
  v2 = -[SKProductsResponse init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SKProductsResponseInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }

  return v2;
}

- (NSArray)invalidProductIdentifiers
{
  return (NSArray *)*((id *)self->_internal + 1);
}

- (NSArray)products
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (SKProductsResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = -[SKProductsResponse init](self, "init");
    objc_super v6 = v8;
    if (!v8) {
      goto LABEL_5;
    }
    self = (SKProductsResponse *)v8->_internal;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    CFDictionaryRef v10 = sub_1000E358C(v5, "0", v9);
    id internal = self->_internal;
    self->_id internal = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpc_object_t value = xpc_dictionary_get_value(v5, "1");
    v15 = (void *)objc_claimAutoreleasedReturnValue(value);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_1000E24CC;
    v23 = &unk_10034BC18;
    v24 = v13;
    v25 = v12;
    v16 = v12;
    v17 = v13;
    xpc_array_apply(v15, &v20);
    v18 = (objc_class *)-[NSMutableArray copy](v16, "copy", v20, v21, v22, v23);
    Class isa = self[1].super.isa;
    self[1].super.Class isa = v18;
  }

  else
  {
    objc_super v6 = 0LL;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v4 = self->_internal;
  sub_1000E35D4(v3, "0", *((__CFString **)v4 + 1));
  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      CFDictionaryRef v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyXPCEncoding", (void)v13);
        if (v11) {
          xpc_array_append_value(v5, v11);
        }

        CFDictionaryRef v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  xpc_dictionary_set_value(v3, "1", v5);
  return v3;
}

- (void)_setInvalidIdentifiers:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[1];
    internal[1] = v5;
  }

- (void)_setProducts:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[2] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[2];
    internal[2] = v5;
  }

- (void).cxx_destruct
{
}

@end