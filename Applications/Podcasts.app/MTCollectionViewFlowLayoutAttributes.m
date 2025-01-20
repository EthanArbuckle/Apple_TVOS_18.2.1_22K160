@interface MTCollectionViewFlowLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (BOOL)isOpen;
- (BOOL)isPartiallyOffTheTop;
- (BOOL)showsSeperator;
- (CGRect)naturalRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setFloating:(BOOL)a3;
- (void)setNaturalRect:(CGRect)a3;
- (void)setOpen:(BOOL)a3;
- (void)setPartiallyOffTheTop:(BOOL)a3;
- (void)setShowsSeperator:(BOOL)a3;
@end

@implementation MTCollectionViewFlowLayoutAttributes

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes;
  unint64_t v3 = -[MTCollectionViewFlowLayoutAttributes hash](&v7, "hash");
  uint64_t v4 = self->_floating - v3 + 32 * v3;
  uint64_t v5 = self->_open - v4 + 32 * v4;
  return self->_showsSeperator - v5 + 32 * v5 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v24.receiver = self,
        v24.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes,
        -[MTCollectionViewFlowLayoutAttributes isEqual:](&v24, "isEqual:", v4))
    && (unsigned int v6 = [v4 isFloating],
        v6 == -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"))
    && (unsigned int v7 = [v4 isPartiallyOffTheTop],
        v7 == -[MTCollectionViewFlowLayoutAttributes isPartiallyOffTheTop](self, "isPartiallyOffTheTop"))
    && (unsigned int v8 = [v4 isOpen],
        v8 == -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"))
    && (unsigned int v9 = [v4 showsSeperator],
        v9 == -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator")))
  {
    [v4 naturalRect];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    -[MTCollectionViewFlowLayoutAttributes naturalRect](self, "naturalRect");
    v26.origin.x = v20;
    v26.origin.y = v21;
    v26.size.width = v22;
    v26.size.height = v23;
    v25.origin.x = v13;
    v25.origin.y = v15;
    v25.size.width = v17;
    v25.size.height = v19;
    BOOL v10 = CGRectEqualToRect(v25, v26);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes;
  id v4 = -[MTCollectionViewFlowLayoutAttributes copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setFloating:", -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"));
  objc_msgSend(v4, "setOpen:", -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"));
  objc_msgSend(v4, "setShowsSeperator:", -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator"));
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes;
  id v3 = -[MTCollectionViewFlowLayoutAttributes description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "stringByAppendingFormat:",  @" Floating %i, Open %i, Shows Seperator %i",  -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"),  -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"),  -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator")));

  return v5;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)isPartiallyOffTheTop
{
  return self->_partiallyOffTheTop;
}

- (void)setPartiallyOffTheTop:(BOOL)a3
{
  self->_partiallyOffTheTop = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)showsSeperator
{
  return self->_showsSeperator;
}

- (void)setShowsSeperator:(BOOL)a3
{
  self->_showsSeperator = a3;
}

- (CGRect)naturalRect
{
  double x = self->_naturalRect.origin.x;
  double y = self->_naturalRect.origin.y;
  double width = self->_naturalRect.size.width;
  double height = self->_naturalRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNaturalRect:(CGRect)a3
{
  self->_naturalRect = a3;
}

@end