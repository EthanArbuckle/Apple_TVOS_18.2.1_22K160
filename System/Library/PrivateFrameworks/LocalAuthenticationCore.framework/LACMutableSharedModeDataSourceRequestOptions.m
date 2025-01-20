@interface LACMutableSharedModeDataSourceRequestOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreflight;
- (NSString)description;
- (void)setIsPreflight:(BOOL)a3;
@end

@implementation LACMutableSharedModeDataSourceRequestOptions

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C798670])
  {
    id v5 = v4;
    BOOL v6 = -[LACMutableSharedModeDataSourceRequestOptions isPreflight](self, "isPreflight");
    char v7 = [v5 isPreflight];

    char v8 = v6 ^ v7 ^ 1;
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v11[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v10 = @"isPreflight";
  BOOL v5 = -[LACMutableSharedModeDataSourceRequestOptions isPreflight](self, "isPreflight");
  BOOL v6 = @"NO";
  if (v5) {
    BOOL v6 = @"YES";
  }
  v11[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v7];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isPreflight
{
  return self->_isPreflight;
}

- (void)setIsPreflight:(BOOL)a3
{
  self->_isPreflight = a3;
}

@end