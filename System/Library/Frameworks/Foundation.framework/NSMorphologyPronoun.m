@interface NSMorphologyPronoun
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMorphology)dependentMorphology;
- (NSMorphology)morphology;
- (NSMorphologyPronoun)initWithCoder:(id)a3;
- (NSMorphologyPronoun)initWithPronoun:(NSString *)pronoun morphology:(NSMorphology *)morphology dependentMorphology:(NSMorphology *)dependentMorphology;
- (NSString)pronoun;
- (id)_morphunConstraints;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMorphologyPronoun

- (id)_morphunConstraints
{
  return @objc NSMorphology.morphunConstraints()( self,  (uint64_t)a2,  (void (*)(void))NSMorphologyPronoun.morphunConstraints());
}

- (NSMorphologyPronoun)initWithPronoun:(NSString *)pronoun morphology:(NSMorphology *)morphology dependentMorphology:(NSMorphology *)dependentMorphology
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSMorphologyPronoun;
  v8 = -[NSMorphologyPronoun init](&v10, sel_init);
  if (v8)
  {
    v8->_pronoun = (NSString *)-[NSString copy](pronoun, "copy");
    v8->_morphology = (NSMorphology *)-[NSMorphology copy](morphology, "copy");
    v8->_dependentMorphology = (NSMorphology *)-[NSMorphology copy](dependentMorphology, "copy");
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMorphologyPronoun;
  -[NSMorphologyPronoun dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  NSUInteger v4 = -[NSString hash](-[NSMorphologyPronoun pronoun](self, "pronoun"), "hash") ^ v3;
  unint64_t v5 = -[NSMorphology hash](-[NSMorphologyPronoun morphology](self, "morphology"), "hash");
  return v4 ^ v5 ^ -[NSMorphology hash](-[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v5 = -[NSString isEqualToString:]( -[NSMorphologyPronoun pronoun](self, "pronoun"),  "isEqualToString:",  [a3 pronoun]);
    if (v5)
    {
      BOOL v5 = -[NSMorphology isEqual:]( -[NSMorphologyPronoun morphology](self, "morphology"),  "isEqual:",  [a3 morphology]);
      if (v5)
      {
        v6 = -[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology");
        LOBYTE(v5) = v6 == (NSMorphology *)[a3 dependentMorphology]
                  || -[NSMorphology isEqual:]( -[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology"),  "isEqual:",  [a3 dependentMorphology]);
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dependentMorphology = self->_dependentMorphology;
  if (dependentMorphology) {
    [a3 encodeObject:dependentMorphology forKey:@"dependentMorphology"];
  }
}

- (NSMorphologyPronoun)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMorphologyPronoun;
  NSUInteger v4 = -[NSMorphologyPronoun init](&v6, sel_init);
  if (v4)
  {
    v4->_pronoun = (NSString *)objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"pronoun"),  "copy");
    v4->_morphology = (NSMorphology *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"morphology"),  "copy");
    v4->_dependentMorphology = (NSMorphology *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"dependentMorphology"),  "copy");
  }

  return v4;
}

- (NSString)pronoun
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMorphology)dependentMorphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 24LL, 1);
}

@end