@interface BKDisplayAnnotationShapeContent
+ (id)contentWithSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)shapeSize;
- (NSString)description;
- (void)setShapeSize:(CGSize)a3;
@end

@implementation BKDisplayAnnotationShapeContent

+ (id)contentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setShapeSize:", width, height);
  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = objc_msgSend(v3, "appendSize:withName:", @"shapeSize", self->_shapeSize.width, self->_shapeSize.height);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    [v5 shapeSize];
    BOOL v9 = self->_shapeSize.height == v8 && self->_shapeSize.width == v7;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CGSize)shapeSize
{
  double width = self->_shapeSize.width;
  double height = self->_shapeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShapeSize:(CGSize)a3
{
  self->_shapeSize = a3;
}

@end