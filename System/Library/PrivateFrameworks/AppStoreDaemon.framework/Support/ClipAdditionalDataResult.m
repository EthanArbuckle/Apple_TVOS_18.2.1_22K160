@interface ClipAdditionalDataResult
- (ClipAdditionalDataResult)initWithResult:(id)a3;
- (id)description;
@end

@implementation ClipAdditionalDataResult

- (ClipAdditionalDataResult)initWithResult:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ClipAdditionalDataResult;
  v5 = -[ClipAdditionalDataResult initWithResult:](&v12, "initWithResult:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      v9 = (ClipAdditionalData *)sub_1001B7228(objc_alloc(&OBJC_CLASS___ClipAdditionalData), v6);
      additionalData = v5->_additionalData;
      v5->_additionalData = v9;
    }
  }

  return v5;
}

- (id)description
{
  return -[ClipAdditionalData description](self->_additionalData, "description");
}

- (void).cxx_destruct
{
}

@end