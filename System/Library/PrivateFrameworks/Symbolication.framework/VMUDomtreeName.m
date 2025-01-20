@interface VMUDomtreeName
- (BOOL)isEqual:(id)a3;
- (VMUDomtreeName)initWithArray:(id)a3;
- (VMUDomtreeName)initWithDict:(id)a3;
- (id)asArray;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation VMUDomtreeName

- (VMUDomtreeName)initWithDict:(id)a3
{
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    [a3 objectForKeyedSubscript:name_keys[i]];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }

    else
    {
      [MEMORY[0x189603FE8] null];
      v8 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    }

    v9 = self->_elements[i];
    self->_elements[i] = v8;
  }

  return self;
}

- (VMUDomtreeName)initWithArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -6LL;
  uint64_t v6 = 1LL;
  while (v5 + 6 < [v4 count])
  {
    [v4 objectAtIndexedSubscript:v5 + 6];
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    Class v8 = (&self->super.isa)[v6];
    (&self->super.isa)[v6] = v7;

    ++v6;
    if (__CFADD__(v5++, 1LL)) {
      goto LABEL_8;
    }
  }

  if (v5 >= 0xFFFFFFFFFFFFFFFALL)
  {
    do
    {
      [MEMORY[0x189603FE8] null];
      v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
      Class v11 = (&self->super.isa)[v6];
      (&self->super.isa)[v6] = v10;

      ++v6;
    }

    while (v6 != 7);
  }

- (id)asArray
{
  uint64_t v2 = 6LL;
  do
  {
    uint64_t v3 = v2;
    if (!v2) {
      break;
    }
    --v2;
  }

  while (!(&self->super.isa)[v3]);
  return (id)[MEMORY[0x189603F18] arrayWithObjects:self->_elements count:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  [MEMORY[0x189603FE8] null];
  unint64_t v5 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = self->_elements[0];
  v7 = (NSCopying *)v4[1];
  if ((v6 != v5) == (v7 == v5))
  {
    BOOL v9 = 0;
  }

  else
  {
    unint64_t v8 = 0LL;
    BOOL v9 = 0;
    v10 = &self->_elements[1];
    while (-[NSCopying isEqual:](v6, "isEqual:", v7))
    {

      if (v8 == 5)
      {
        BOOL v9 = 1;
        goto LABEL_9;
      }

      BOOL v9 = v8 > 4;
      uint64_t v6 = v10[v8];
      v7 = (NSCopying *)v4[v8++ + 2];
      if ((v6 != v5) == (v7 == v5)) {
        break;
      }
    }
  }

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  Class v3 = (Class)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = 0LL;
  for (uint64_t i = 1LL; i != 7; ++i)
  {
    Class v6 = (&self->super.isa)[i];
    if (v6 != v3) {
      v4 += -[objc_class hash](v6, "hash");
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[VMUDomtreeName allocWithZone:](&OBJC_CLASS___VMUDomtreeName, "allocWithZone:", a3);
  for (uint64_t i = 1LL; i != 7; ++i)
    objc_storeStrong((id *)&(&v4->super.isa)[i], (&self->super.isa)[i]);
  return v4;
}

- (void).cxx_destruct
{
  uint64_t v3 = 6LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

@end