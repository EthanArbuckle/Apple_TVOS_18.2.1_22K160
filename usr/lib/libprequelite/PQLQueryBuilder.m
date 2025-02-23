@interface PQLQueryBuilder
- (NSError)lastError;
- (PQLQueryBuilder)init;
- (id)bindBooleanParameter:(BOOL)a3;
- (id)bindCharParameter:(char)a3;
- (id)bindDoubleParameter:(double)a3;
- (id)bindIntegerParameter:(int)a3;
- (id)bindLongParameter:(int64_t)a3;
- (id)bindObjectParameter:(id)a3;
- (id)bindParameter:(id)a3 spec:(unsigned __int8)a4;
- (id)bindShortParameter:(signed __int16)a3;
- (id)bindStringParameter:(id)a3;
- (id)bindUnsignedCharParameter:(unsigned __int8)a3;
- (id)bindUnsignedIntegerParameter:(unsigned int)a3;
- (id)bindUnsignedLongParameter:(unint64_t)a3;
- (id)bindUnsignedShortParameter:(unsigned __int16)a3;
- (void)setLastError:(id)a3;
@end

@implementation PQLQueryBuilder

- (PQLQueryBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PQLQueryBuilder;
  v2 = -[PQLQueryBuilder init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    parameters = v2->_parameters;
    v2->_parameters = (NSMutableArray *)v3;
  }

  return v2;
}

- (id)bindParameter:(id)a3 spec:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = v6;
  -[NSMutableArray addObject:](self->_parameters, "addObject:", v6);
  uint64_t specLength = self->_specLength;
  self->_uint64_t specLength = specLength + 1;
  self->_spec[specLength] = a4;

  return @"?";
}

- (id)bindStringParameter:(id)a3
{
  return -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", a3, 4LL);
}

- (id)bindDoubleParameter:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 3LL);
  return v5;
}

- (id)bindBooleanParameter:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0LL);
  return v5;
}

- (id)bindCharParameter:(char)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0LL);
  return v5;
}

- (id)bindUnsignedCharParameter:(unsigned __int8)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1LL);
  return v5;
}

- (id)bindShortParameter:(signed __int16)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0LL);
  return v5;
}

- (id)bindUnsignedShortParameter:(unsigned __int16)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1LL);
  return v5;
}

- (id)bindIntegerParameter:(int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0LL);
  return v5;
}

- (id)bindUnsignedIntegerParameter:(unsigned int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1LL);
  return v5;
}

- (id)bindLongParameter:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 2LL);
  return v5;
}

- (id)bindUnsignedLongParameter:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 2LL);
  return v5;
}

- (id)bindObjectParameter:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = self;
      v7 = v5;
      uint64_t v8 = 9LL;
    }

    else
    {
      id v6 = self;
      v7 = v5;
      uint64_t v8 = 7LL;
    }
    v10 = -[PQLQueryBuilder bindParameter:spec:](v6, "bindParameter:spec:", v7, v8);
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v9, 7LL);
  }

  return v10;
}

- (NSError)lastError
{
  return self->lastError;
}

- (void)setLastError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end