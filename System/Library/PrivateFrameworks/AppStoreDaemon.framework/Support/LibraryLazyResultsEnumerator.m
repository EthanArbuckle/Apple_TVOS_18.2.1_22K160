@interface LibraryLazyResultsEnumerator
- (int64_t)resultComplexity;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation LibraryLazyResultsEnumerator

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = self;
  if (self)
  {
    enumerator = self->_enumerator;
    if (!enumerator)
    {
      v10 = objc_autoreleasePoolPush();
      uint64_t v11 = (*((uint64_t (**)(void))v8->_block + 2))();
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v8->_enumerator;
      v8->_enumerator = (NSFastEnumeration *)v12;

      objc_autoreleasePoolPop(v10);
      enumerator = v8->_enumerator;
    }

    v8 = enumerator;
  }

  unint64_t v14 = -[LibraryLazyResultsEnumerator countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);

  return v14;
}

- (int64_t)resultComplexity
{
  return self->_resultComplexity;
}

- (void).cxx_destruct
{
}

@end