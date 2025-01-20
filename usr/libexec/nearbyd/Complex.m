@interface Complex
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Complex)initWithCoder:(id)a3;
- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4;
- (NSNumber)imag;
- (NSNumber)real;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImag:(id)a3;
- (void)setReal:(id)a3;
@end

@implementation Complex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___Complex;
  v9 = -[Complex init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_real, a3);
    objc_storeStrong((id *)&v10->_imag, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Complex real](self, "real"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Complex imag](self, "imag"));
  id v7 = [v4 initWithRealPart:v5 imagPart:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_real forKey:@"realValue"];
  [v4 encodeObject:self->_imag forKey:@"imagValue"];
}

- (Complex)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), @"realValue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v8), @"imagValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___Complex;
  v11 = -[Complex init](&v14, "init");
  objc_super v12 = v11;
  if (v11)
  {
    -[Complex setReal:](v11, "setReal:", v7);
    -[Complex setImag:](v12, "setImag:", v10);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_12;
  }

  id v7 = v4;
  uint64_t v8 = v7;
  real = self->_real;
  if (real) {
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 real]);

  if (v10)
  {
    real = self->_real;
LABEL_5:
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue([v8 real]);
    BOOL v12 = real == v11;

    goto LABEL_6;
  }

  BOOL v12 = 1;
LABEL_6:
  imag = self->_imag;
  if (!imag)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v8 imag]);

    if (!v14)
    {
      BOOL v16 = 1;
      goto LABEL_10;
    }

    imag = self->_imag;
  }

  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue([v8 imag]);
  BOOL v16 = imag == v15;

LABEL_10:
  BOOL v17 = v12 && v16;

LABEL_12:
  return v17;
}

- (id)description
{
  uint64_t v4 = (int)v3;
  -[NSNumber doubleValue](self->_imag, "doubleValue");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RealVal=%d, ImagVal=%d",  v4,  (int)v5);
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSNumber hash](self->_real, "hash");
  return (unint64_t)-[NSNumber hash](self->_imag, "hash") ^ v3;
}

- (NSNumber)real
{
  return (NSNumber *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setReal:(id)a3
{
}

- (NSNumber)imag
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setImag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end