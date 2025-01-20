@interface TBQualityScore
+ (BOOL)supportsSecureCoding;
+ (id)qualityScoreWithValue:(unint64_t)a3;
- (NSString)typeDescription;
- (TBQualityScore)initWithCoder:(id)a3;
- (TBQualityScore)initWithValue:(unint64_t)a3;
- (unint64_t)score;
- (void)encodeWithCoder:(id)a3;
- (void)setScore:(unint64_t)a3;
- (void)setTypeDescription:(id)a3;
@end

@implementation TBQualityScore

+ (id)qualityScoreWithValue:(unint64_t)a3
{
  return (id)[objc_alloc((Class)a1) initWithValue:a3];
}

- (TBQualityScore)initWithValue:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TBQualityScore;
  v4 = -[TBQualityScore init](&v7, sel_init);
  typeDescription = v4->_typeDescription;
  v4->_score = a3;
  v4->_typeDescription = (NSString *)@"quality";

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  typeDescription = self->_typeDescription;
  id v5 = a3;
  [v5 encodeObject:typeDescription forKey:@"_typeDescription"];
  [v5 encodeInteger:self->_score forKey:@"_score"];
}

- (TBQualityScore)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TBQualityScore;
  id v3 = a3;
  v4 = -[TBQualityScore init](&v9, sel_init);
  uint64_t v5 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"_typeDescription",  v9.receiver,  v9.super_class);
  typeDescription = v4->_typeDescription;
  v4->_typeDescription = (NSString *)v5;

  uint64_t v7 = [v3 decodeIntegerForKey:@"_score"];
  v4->_score = v7;
  return v4;
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end