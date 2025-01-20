@interface OKAutoLayoutGrid
- (BOOL)biggestEmptyRectFromPtX:(unint64_t)a3 Y:(unint64_t)a4 W:(unint64_t *)a5 H:(unint64_t *)a6;
- (BOOL)hasAnyEmptyTiles;
- (BOOL)nextEmptyTile:(unint64_t *)a3 :(unint64_t *)a4;
- (OKAutoLayoutGrid)initWithRows:(unint64_t)a3 columns:(unint64_t)a4;
- (id)description;
- (id)nextPossibleRects:(BOOL)a3;
- (unint64_t)columns;
- (unint64_t)rows;
- (void)dealloc;
- (void)mark:(unint64_t)a3 forAreaX:(unint64_t)a4 Y:(unint64_t)a5 W:(unint64_t)a6 H:(unint64_t)a7;
- (void)reset;
- (void)unmarkForAreaX:(unint64_t)a3 Y:(unint64_t)a4 W:(unint64_t)a5 H:(unint64_t)a6;
@end

@implementation OKAutoLayoutGrid

- (OKAutoLayoutGrid)initWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OKAutoLayoutGrid;
  v6 = -[OKAutoLayoutGrid init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_rows = a3;
    v6->_columns = a4;
    if ((a4 * a3) >> 61) {
      size_t v8 = -1LL;
    }
    else {
      size_t v8 = 8 * a4 * a3;
    }
    v7->_tiles = (int64_t *)operator new[](v8);
    -[OKAutoLayoutGrid reset](v7, "reset");
  }

  return v7;
}

- (void)dealloc
{
  tiles = self->_tiles;
  if (tiles) {
    operator delete[](tiles);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OKAutoLayoutGrid;
  -[OKAutoLayoutGrid dealloc](&v4, "dealloc");
}

- (id)description
{
  if (!(self->_rows * self->_columns)) {
    return @"{";
  }
  unint64_t v3 = 0LL;
  objc_super v4 = @"{";
  do
    objc_super v4 = (__CFString *)-[__CFString stringByAppendingString:]( v4,  "stringByAppendingString:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %ld,",  self->_tiles[v3++]));
  while (self->_rows * self->_columns > v3);
  return v4;
}

- (void)mark:(unint64_t)a3 forAreaX:(unint64_t)a4 Y:(unint64_t)a5 W:(unint64_t)a6 H:(unint64_t)a7
{
  if (a6)
  {
    for (uint64_t i = 0LL; i != a6; ++i)
    {
      if (a7)
      {
        tiles = self->_tiles;
        unint64_t v9 = a5;
        unint64_t v10 = a7;
        do
        {
          tiles[i + a4 + self->_columns * v9++] = a3;
          --v10;
        }

        while (v10);
      }
    }
  }

- (void)unmarkForAreaX:(unint64_t)a3 Y:(unint64_t)a4 W:(unint64_t)a5 H:(unint64_t)a6
{
}

- (BOOL)hasAnyEmptyTiles
{
  unint64_t columns = self->_columns;
  if (columns)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    BOOL v5 = 1;
    while (!self->_rows)
    {
LABEL_7:
      ++v4;
      ++v3;
      BOOL v5 = v4 < columns;
      if (v4 == columns) {
        return 0;
      }
    }

    v6 = &self->_tiles[v3];
    unint64_t rows = self->_rows;
    while (*v6 != -1)
    {
      v6 += columns;
      if (!--rows) {
        goto LABEL_7;
      }
    }
  }

  else
  {
    return 0;
  }

  return v5;
}

- (BOOL)nextEmptyTile:(unint64_t *)a3 :(unint64_t *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    unint64_t rows = self->_rows;
    if (rows)
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      unint64_t columns = self->_columns;
      char v9 = 1;
      while (!columns)
      {
LABEL_9:
        BOOL v4 = 0;
        ++v7;
        v6 += columns;
        char v9 = v7 < rows;
        if (v7 == rows) {
          return v4;
        }
      }

      unint64_t v10 = 0LL;
      while (self->_tiles[v6 + v10] != -1)
      {
        if (columns == ++v10) {
          goto LABEL_9;
        }
      }

      *a3 = v10;
      *a4 = v7;
      return v9;
    }

    else
    {
      return 0;
    }
  }

  return v4;
}

- (BOOL)biggestEmptyRectFromPtX:(unint64_t)a3 Y:(unint64_t)a4 W:(unint64_t *)a5 H:(unint64_t *)a6
{
  BOOL v6 = 0;
  if (a5 && a6)
  {
    unint64_t columns = self->_columns;
    unint64_t v8 = 0LL;
    unint64_t v9 = columns - a3;
    if (columns > a3)
    {
      unint64_t v10 = &self->_tiles[a3 + columns * a4];
      while (v10[v8] == -1)
      {
        if (v9 == ++v8)
        {
          unint64_t v8 = v9;
          break;
        }
      }
    }

    *a5 = v8;
    *a6 = self->_rows - a4;
    return v8 != 0;
  }

  return v6;
}

- (id)nextPossibleRects:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[OKAutoLayoutGrid nextEmptyTile::](self, "nextEmptyTile::", &v15, &v14)) {
    return 0LL;
  }
  -[OKAutoLayoutGrid biggestEmptyRectFromPtX:Y:W:H:](self, "biggestEmptyRectFromPtX:Y:W:H:", v15, v14, &v13, &v12);
  if (v3)
  {
    v16 = +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  (double)v15,  (double)v14,  (double)v13,  (double)v12);
    return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL);
  }

  else
  {
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    unint64_t v6 = v12;
    if (v12)
    {
      unint64_t v7 = v13;
      uint64_t v8 = 1LL;
      do
      {
        if (v7)
        {
          unint64_t v9 = 0LL;
          do
          {
            objc_msgSend( v5,  "addObject:",  +[NSValue valueWithCGRect:]( NSValue,  "valueWithCGRect:",  (double)v15,  (double)v14,  (double)(uint64_t)++v9,  (double)v8));
            unint64_t v7 = v13;
          }

          while (v9 < v13);
          unint64_t v6 = v12;
        }
      }

      while (v8++ < v6);
    }
  }

  return v5;
}

- (void)reset
{
}

- (unint64_t)rows
{
  return self->_rows;
}

- (unint64_t)columns
{
  return self->_columns;
}

@end