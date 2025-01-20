@interface VariantDescriptor
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation VariantDescriptor

- (id)description
{
  v3 = sub_1001D36AC((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<VariantDescriptor %p>: {%@}",  self,  v4));

  return v5;
}

- (unint64_t)hash
{
  return self->_version ^ (unint64_t)-[NSArray hash](self->_components, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v5 = (VariantDescriptor *)a3;
  if (self == v5)
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      char v7 = sub_1001D3D68((uint64_t)self, v5);
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end