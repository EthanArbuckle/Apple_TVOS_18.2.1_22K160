@interface WiFi3BarsResponse
+ (BOOL)supportsSecureCoding;
- (NSDictionary)results;
- (WiFi3BarsResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation WiFi3BarsResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFi3BarsResponse)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WiFi3BarsResponse;
  id v3 = a3;
  v4 = -[WiFi3BarsResponse init](&v12, sel_init);
  v5 = (void *)MEMORY[0x189604010];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v3 decodeObjectOfClasses:v8 forKey:@"results"];

  results = v4->_results;
  v4->_results = (NSDictionary *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end