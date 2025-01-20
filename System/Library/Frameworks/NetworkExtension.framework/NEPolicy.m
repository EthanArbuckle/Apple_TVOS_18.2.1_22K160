@interface NEPolicy
- (NEPolicy)init;
- (NEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEPolicy

- (NEPolicy)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1876B1000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicy is not valid", v5, 2u);
  }

  return 0LL;
}

- (NEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEPolicy;
  v11 = -[NEPolicy init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_order = a3;
    objc_storeStrong((id *)&v11->_result, a4);
    objc_storeStrong((id *)&v12->_conditions, a5);
    v13 = v12;
  }

  else
  {
    ne_log_obj();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, "Failed to init NEPolicy", v16, 2u);
    }
  }

  return v12;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v7 appendPrettyInt:(int)self->_order withName:@"order" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_result withName:@"result" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_conditions withName:@"conditions" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEPolicy descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (void).cxx_destruct
{
}

@end