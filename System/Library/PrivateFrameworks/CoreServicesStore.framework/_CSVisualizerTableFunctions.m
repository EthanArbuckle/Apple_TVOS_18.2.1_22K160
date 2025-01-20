@interface _CSVisualizerTableFunctions
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDescription;
- (id)getSummary;
- (void)setGetDescription:(id)a3;
- (void)setGetSummary:(id)a3;
@end

@implementation _CSVisualizerTableFunctions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = MEMORY[0x186E27CB8](self->_getSummary);
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = MEMORY[0x186E27CB8](self->_getDescription);
    v8 = (void *)v4[2];
    v4[2] = v7;
  }

  return v4;
}

- (id)getSummary
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setGetSummary:(id)a3
{
}

- (id)getDescription
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setGetDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end