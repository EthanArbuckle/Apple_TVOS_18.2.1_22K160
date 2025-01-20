@interface HMDValueTransformerAdapater
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (Class)valueClass;
- (BOOL)isKindOfTransformer:(Class)a3;
- (HMDValueTransformerAdapater)initWithTransformer:(id)a3;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDValueTransformerAdapater

- (HMDValueTransformerAdapater)initWithTransformer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HMDValueTransformerAdapater;
  v6 = -[HMDValueTransformer init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transformer, a3);
  }

  return v7;
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HMDValueTransformerAdapater;
  if (-[HMDValueTransformer isKindOfTransformer:](&v7, "isKindOfTransformer:")) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass(self->_transformer, a3);
  }
  return isKindOfClass & 1;
}

- (id)transformedValue:(id)a3
{
  return -[NSValueTransformer transformedValue:](self->_transformer, "transformedValue:", a3);
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDValueTransformerAdapater transformedValue:](self, "transformedValue:", v5));

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  return -[NSValueTransformer reverseTransformedValue:](self->_transformer, "reverseTransformedValue:", a3);
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDValueTransformerAdapater reverseTransformedValue:](self, "reverseTransformedValue:", v5));

  return v6;
}

- (void).cxx_destruct
{
}

+ (Class)valueClass
{
  id v2 = sub_10000B9FC();
  return +[HMDValueTransformerAdapater transformedValueClass](v2, v3);
}

+ (Class)transformedValueClass
{
  id v2 = sub_10000B9FC();
  return (Class)+[HMDValueTransformerAdapater allowsReverseTransformation](v2, v3);
}

+ (BOOL)allowsReverseTransformation
{
  return sub_10000B9FC();
}

@end