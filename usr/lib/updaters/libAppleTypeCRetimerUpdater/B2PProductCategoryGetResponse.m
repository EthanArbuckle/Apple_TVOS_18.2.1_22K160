@interface B2PProductCategoryGetResponse
- (BOOL)parseResponse:(id)a3;
- (id)description;
- (int)category;
@end

@implementation B2PProductCategoryGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5) {
    self->_category = *(unsigned __int8 *)[v4 bytes];
  }

  return v5 != 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PProductCategoryGetResponse;
  -[B2PResponse description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status")) {
    objc_msgSend(v5, "appendFormat:", @"\tCategory: %s\n", stringForB2PProductCategory(self->_category));
  }
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)category
{
  return self->_category;
}

@end