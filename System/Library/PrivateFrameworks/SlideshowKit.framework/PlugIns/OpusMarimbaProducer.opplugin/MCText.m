@interface MCText
- (MCContainerEffect)container;
- (MCText)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)stringAttributes;
- (NSAttributedString)attributedString;
- (id)attributedStringWithCTAttributes;
- (id)imprint;
- (unint64_t)index;
- (void)demolish;
- (void)setAttributedString:(id)a3;
- (void)setContainer:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setStringAttributes:(id)a3;
@end

@implementation MCText

- (MCText)initWithImprint:(id)a3 andMontage:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCText;
  v5 = -[MCObject initWithImprint:andMontage:](&v8, "initWithImprint:andMontage:", a3, a4);
  if (v5)
  {
    v5->mIndex = (unint64_t)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"index"),  "unsignedIntegerValue");
    id v6 = [a3 objectForKey:@"attributedString"];
    if (v6) {
      v5->mStringAttributes = (NSArray *)v6;
    }
  }

  return v5;
}

- (void)demolish
{
  self->mStringAttributes = 0LL;
  self->mContainer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCText;
  -[MCObject demolish](&v3, "demolish");
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCText;
  id v3 = -[MCObject imprint](&v6, "imprint");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->mIndex),  @"index");
  mStringAttributes = self->mStringAttributes;
  if (mStringAttributes) {
    [v3 setObject:mStringAttributes forKey:@"attributedString"];
  }
  return v3;
}

- (id)attributedStringWithCTAttributes
{
  return +[MCTextConversion attributedStringWithCTAttributesFromStringAttributes:]( &OBJC_CLASS___MCTextConversion,  "attributedStringWithCTAttributesFromStringAttributes:",  -[MCText stringAttributes](self, "stringAttributes"));
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)-[MCText attributedStringWithCTAttributes](self, "attributedStringWithCTAttributes");
}

- (void)setAttributedString:(id)a3
{
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (MCContainerEffect)container
{
  return self->mContainer;
}

- (void)setContainer:(id)a3
{
  self->mContainer = (MCContainerEffect *)a3;
}

- (NSArray)stringAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setStringAttributes:(id)a3
{
}

@end