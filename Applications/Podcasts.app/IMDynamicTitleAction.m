@interface IMDynamicTitleAction
- (id)title;
- (id)titleBlock;
- (void)setTitleBlock:(id)a3;
@end

@implementation IMDynamicTitleAction

- (id)title
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IMDynamicTitleAction;
  v3 = -[IMAction title](&v10, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  titleBlock = (uint64_t (**)(id, void *))self->_titleBlock;
  if (titleBlock)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
    uint64_t v7 = titleBlock[2](titleBlock, v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    v4 = (void *)v8;
  }

  return v4;
}

- (id)titleBlock
{
  return self->_titleBlock;
}

- (void)setTitleBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end