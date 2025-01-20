@interface INPersonWrapper
- (BOOL)isEqual:(id)a3;
- (INPerson)inPerson;
- (INPersonWrapper)initWithINPerson:(id)a3;
- (TUHandle)tuHandle;
- (unint64_t)hash;
@end

@implementation INPersonWrapper

- (INPersonWrapper)initWithINPerson:(id)a3
{
  id v5 = a3;
  v6 = (TUHandle *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", v5));
  tuHandle = self->_tuHandle;
  self->_tuHandle = v6;

  return self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[INPerson displayName](self->_inPerson, "displayName"));
  v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_100034C18;
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self->_inPerson, "personHandle"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 label]);
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_100034C18;
  }
  v11 = v10;

  unint64_t v12 = (unint64_t)-[__CFString hash](v6, "hash");
  unint64_t v13 = (unint64_t)-[__CFString hash](v11, "hash");

  return v13 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4[1] displayName]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson displayName](self->_inPerson, "displayName"));
    if ([v5 isEqualToString:v6])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4[1] personHandle]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self->_inPerson, "personHandle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 label]);
      else {
        char v11 = 0;
      }
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (INPerson)inPerson
{
  return self->_inPerson;
}

- (TUHandle)tuHandle
{
  return self->_tuHandle;
}

- (void).cxx_destruct
{
}

@end