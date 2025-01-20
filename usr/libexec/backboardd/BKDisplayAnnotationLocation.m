@interface BKDisplayAnnotationLocation
+ (id)centerAtPoint:(CGPoint)a3;
+ (id)controlledBySupernode;
+ (id)relativeToBottomLeftOfSuper:(CGPoint)a3;
+ (id)relativeToBottomMiddleOfSuper:(CGPoint)a3;
+ (id)relativeToTopLeftOfSuper:(CGPoint)a3;
- (BOOL)definedInReferenceSpace;
- (BOOL)inhibitRotation;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAutoposition;
- (CGPoint)point;
- (CGPoint)superBias;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDefinedInReferenceSpace:(BOOL)a3;
- (void)setInhibitRotation:(BOOL)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setShouldAutoposition:(BOOL)a3;
- (void)setSuperBias:(CGPoint)a3;
@end

@implementation BKDisplayAnnotationLocation

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationLocation);
  *((_BYTE *)result + 8) = self->_inhibitRotation;
  *((_BYTE *)result + 9) = self->_shouldAutoposition;
  *((_OWORD *)result + 1) = self->_superBias;
  *((_OWORD *)result + 2) = self->_point;
  *((_BYTE *)result + 10) = self->_definedInReferenceSpace;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = objc_opt_class(self, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    goto LABEL_11;
  }
  int shouldAutoposition = self->_shouldAutoposition;
  int inhibitRotation = self->_inhibitRotation;
  [v5 superBias];
  BOOL v10 = 0;
  if (self->_superBias.x == v11 && self->_superBias.y == v9)
  {
    int definedInReferenceSpace = self->_definedInReferenceSpace;
    if (definedInReferenceSpace == [v5 definedInReferenceSpace])
    {
      [v5 point];
      BOOL v10 = self->_point.y == v14 && self->_point.x == v13;
      goto LABEL_12;
    }

- (BOOL)inhibitRotation
{
  return self->_inhibitRotation;
}

- (void)setInhibitRotation:(BOOL)a3
{
  self->_int inhibitRotation = a3;
}

- (BOOL)shouldAutoposition
{
  return self->_shouldAutoposition;
}

- (void)setShouldAutoposition:(BOOL)a3
{
  self->_int shouldAutoposition = a3;
}

- (CGPoint)superBias
{
  double x = self->_superBias.x;
  double y = self->_superBias.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSuperBias:(CGPoint)a3
{
  self->_superBias = a3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (BOOL)definedInReferenceSpace
{
  return self->_definedInReferenceSpace;
}

- (void)setDefinedInReferenceSpace:(BOOL)a3
{
  self->_int definedInReferenceSpace = a3;
}

+ (id)controlledBySupernode
{
  if (qword_1000DC258 != -1) {
    dispatch_once(&qword_1000DC258, &stru_1000B7F88);
  }
  return (id)qword_1000DC250;
}

+ (id)centerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 0.5);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToTopLeftOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1LL);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 0.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToBottomLeftOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1LL);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToBottomMiddleOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(&OBJC_CLASS___BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1LL);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

@end