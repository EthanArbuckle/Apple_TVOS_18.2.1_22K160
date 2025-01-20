@interface MTIndexPathShifter
- (BOOL)isComplete;
- (NSIndexPath)initialIndexPath;
- (NSIndexPath)shiftedIndexPath;
- (void)_setIndexPath:(unint64_t)a3;
- (void)_shiftIndexPath:(unint64_t)a3;
- (void)processChangeAtIndexPath:(id)a3 forChangeType:(unint64_t)a4 newIndexPath:(id)a5;
- (void)setInitialIndexPath:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setShiftedIndexPath:(id)a3;
@end

@implementation MTIndexPathShifter

- (void)setInitialIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  objc_storeStrong((id *)&self->_initialIndexPath, a3);
  shiftedIndexPath = self->_shiftedIndexPath;
  self->_shiftedIndexPath = v5;

  -[MTIndexPathShifter setIsComplete:](self, "setIsComplete:", 0LL);
}

- (void)processChangeAtIndexPath:(id)a3 forChangeType:(unint64_t)a4 newIndexPath:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  id v10 = [v9 section];
  id v11 = [v20 section];

  if (v10 == v11 && !-[MTIndexPathShifter isComplete](self, "isComplete"))
  {
    switch(a4)
    {
      case 3uLL:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        unsigned int v17 = [v20 isEqual:v16];

        if (!v17)
        {
          -[MTIndexPathShifter processChangeAtIndexPath:forChangeType:newIndexPath:]( self,  "processChangeAtIndexPath:forChangeType:newIndexPath:",  v20,  2LL,  0LL);
          -[MTIndexPathShifter processChangeAtIndexPath:forChangeType:newIndexPath:]( self,  "processChangeAtIndexPath:forChangeType:newIndexPath:",  0LL,  1LL,  v8);
          goto LABEL_3;
        }

        -[MTIndexPathShifter setShiftedIndexPath:](self, "setShiftedIndexPath:", v8);
        break;
      case 2uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        id v19 = [v18 row];

        if ([v20 row] != v19)
        {
          if ([v20 row] >= v19) {
            goto LABEL_3;
          }
          v14 = self;
          uint64_t v15 = -1LL;
          goto LABEL_17;
        }

        -[MTIndexPathShifter _setIndexPath:](self, "_setIndexPath:", 0x7FFFFFFFFFFFFFFFLL);
        break;
      case 1uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        id v13 = [v12 row];

        if ([v8 row] > v13) {
          goto LABEL_3;
        }
        v14 = self;
        uint64_t v15 = 1LL;
LABEL_17:
        -[MTIndexPathShifter _shiftIndexPath:](v14, "_shiftIndexPath:", v15);
        goto LABEL_3;
      default:
        goto LABEL_3;
    }

    -[MTIndexPathShifter setIsComplete:](self, "setIsComplete:", 1LL);
  }

- (void)_shiftIndexPath:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  -[MTIndexPathShifter _setIndexPath:](self, "_setIndexPath:", (char *)[v5 row] + a3);
}

- (void)_setIndexPath:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  id v6 = [v5 row];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  a3,  [v8 section]));
    -[MTIndexPathShifter setShiftedIndexPath:](self, "setShiftedIndexPath:", v7);
  }

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (NSIndexPath)shiftedIndexPath
{
  return self->_shiftedIndexPath;
}

- (void)setShiftedIndexPath:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (void).cxx_destruct
{
}

@end