@interface PDBucket
- (BOOL)hasInclusiveUpperBound;
- (NSString)label;
- (PDBucket)initWithDictionary:(id)a3 error:(id *)a4;
- (double)lowerInclusiveBound;
- (double)upperBound;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setHasInclusiveUpperBound:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLowerInclusiveBound:(double)a3;
- (void)setUpperBound:(double)a3;
@end

@implementation PDBucket

- (PDBucket)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDBucket;
  v7 = -[PDBucket init](&v19, sel_init);
  if (v7)
  {
    [v6 objectForKeyedSubscript:@">="];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a4, @"bucket >=");
      v16 = (PDBucket *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }

    [v6 objectForKeyedSubscript:@"count"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v8 doubleValue];
      -[PDBucket setLowerInclusiveBound:](v7, "setLowerInclusiveBound:");
      -[PDBucket setCount:](v7, "setCount:", [v9 unsignedIntegerValue]);
      [v6 objectForKeyedSubscript:@"label"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDBucket setLabel:](v7, "setLabel:", v10);

      uint64_t v11 = -[PDBucket label](v7, "label");
      if (!v11
        || (v12 = (void *)v11,
            -[PDBucket label](v7, "label"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v13,
            v12,
            (isKindOfClass & 1) != 0))
      {
        v15 = v7;
LABEL_13:
        v16 = v15;

        goto LABEL_14;
      }

      v17 = @"bucket label";
    }

    else
    {
      v17 = @"bucket count";
    }

    handle_malformed_data(a4, v17);
    v15 = (PDBucket *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  v16 = 0LL;
LABEL_15:

  return v16;
}

- (double)lowerInclusiveBound
{
  return self->_lowerInclusiveBound;
}

- (void)setLowerInclusiveBound:(double)a3
{
  self->_lowerInclusiveBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (BOOL)hasInclusiveUpperBound
{
  return self->_hasInclusiveUpperBound;
}

- (void)setHasInclusiveUpperBound:(BOOL)a3
{
  self->_hasInclusiveUpperBound = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end