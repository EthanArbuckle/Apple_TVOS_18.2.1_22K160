@interface TransparencyGPBUnknownField
- (BOOL)isEqual:(id)a3;
- (NSArray)groupList;
- (NSArray)lengthDelimitedList;
- (TransparencyGPBUInt32Array)fixed32List;
- (TransparencyGPBUInt64Array)fixed64List;
- (TransparencyGPBUInt64Array)varintList;
- (TransparencyGPBUnknownField)initWithNumber:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)number;
- (unint64_t)hash;
- (unint64_t)serializedSize;
- (unint64_t)serializedSizeAsMessageSetExtension;
- (void)addFixed32:(unsigned int)a3;
- (void)addFixed64:(unint64_t)a3;
- (void)addGroup:(id)a3;
- (void)addLengthDelimited:(id)a3;
- (void)addVarint:(unint64_t)a3;
- (void)dealloc;
- (void)mergeFromField:(id)a3;
- (void)writeAsMessageSetExtensionToOutput:(id)a3;
- (void)writeToOutput:(id)a3;
@end

@implementation TransparencyGPBUnknownField

- (TransparencyGPBUnknownField)initWithNumber:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TransparencyGPBUnknownField;
  result = -[TransparencyGPBUnknownField init](&v5, "init");
  if (result) {
    result->number_ = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUnknownField;
  -[TransparencyGPBUnknownField dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = -[TransparencyGPBUnknownField initWithNumber:]( +[TransparencyGPBUnknownField allocWithZone:](&OBJC_CLASS___TransparencyGPBUnknownField, "allocWithZone:"),  "initWithNumber:",  self->number_);
  v5->mutableFixed32List_ = (TransparencyGPBUInt32Array *)-[TransparencyGPBUInt32Array copyWithZone:]( self->mutableFixed32List_,  "copyWithZone:",  a3);
  v5->mutableFixed64List_ = (TransparencyGPBUInt64Array *)-[TransparencyGPBUInt64Array copyWithZone:]( self->mutableFixed64List_,  "copyWithZone:",  a3);
  v5->mutableLengthDelimitedList_ = (NSMutableArray *)-[NSMutableArray mutableCopyWithZone:]( self->mutableLengthDelimitedList_,  "mutableCopyWithZone:",  a3);
  v5->mutableVarintList_ = (TransparencyGPBUInt64Array *)-[TransparencyGPBUInt64Array copyWithZone:]( self->mutableVarintList_,  "copyWithZone:",  a3);
  if (-[NSMutableArray count](self->mutableGroupList_, "count"))
  {
    v5->mutableGroupList_ = -[NSMutableArray initWithCapacity:]( +[NSMutableArray allocWithZone:](&OBJC_CLASS___NSMutableArray, "allocWithZone:", a3),  "initWithCapacity:",  -[NSMutableArray count](self->mutableGroupList_, "count"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    mutableGroupList = self->mutableGroupList_;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(mutableGroupList);
          }
          id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
          -[NSMutableArray addObject:](v5->mutableGroupList_, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_20;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUnknownField, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0 || self->number_ != *((_DWORD *)a3 + 2))
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  if ((!-[TransparencyGPBUInt64Array count](self->mutableVarintList_, "count")
     && ![*((id *)a3 + 2) count]
     || (unsigned int v6 = -[TransparencyGPBUInt64Array isEqual:](self->mutableVarintList_, "isEqual:", *((void *)a3 + 2))) != 0)
    && (!-[TransparencyGPBUInt32Array count](self->mutableFixed32List_, "count")
     && ![*((id *)a3 + 3) count]
     || (unsigned int v6 = -[TransparencyGPBUInt32Array isEqual:](self->mutableFixed32List_, "isEqual:", *((void *)a3 + 3))) != 0)
    && (!-[TransparencyGPBUInt64Array count](self->mutableFixed64List_, "count")
     && ![*((id *)a3 + 4) count]
     || (unsigned int v6 = -[TransparencyGPBUInt64Array isEqual:](self->mutableFixed64List_, "isEqual:", *((void *)a3 + 4))) != 0)
    && (!-[NSMutableArray count](self->mutableLengthDelimitedList_, "count") && ![*((id *)a3 + 5) count]
     || (unsigned int v6 = -[NSMutableArray isEqual:]( self->mutableLengthDelimitedList_,  "isEqual:",  *((void *)a3 + 5))) != 0))
  {
    if (-[NSMutableArray count](self->mutableGroupList_, "count") || [*((id *)a3 + 6) count])
    {
      LOBYTE(v6) = -[NSMutableArray isEqual:](self->mutableGroupList_, "isEqual:", *((void *)a3 + 6));
      return v6;
    }

- (unint64_t)hash
{
  unint64_t v3 = -[TransparencyGPBUInt64Array hash](self->mutableVarintList_, "hash");
  v4 = (char *)-[TransparencyGPBUInt32Array hash](self->mutableFixed32List_, "hash") + 32 * v3 - v3;
  int64_t v5 = (_BYTE *)-[TransparencyGPBUInt64Array hash](self->mutableFixed64List_, "hash") - v4 + 32LL * (void)v4;
  int64_t v6 = (int64_t)-[NSMutableArray hash](self->mutableLengthDelimitedList_, "hash") + 32 * v5 - v5;
  return (unint64_t)-[NSMutableArray hash](self->mutableGroupList_, "hash") + 32 * v6 - v6 + 28629151;
}

- (void)writeToOutput:(id)a3
{
  if (-[TransparencyGPBUInt32Array count](self->mutableFixed32List_, "count")) {
    [a3 writeFixed32Array:self->number_ values:self->mutableFixed32List_ tag:0];
  }
  if (-[TransparencyGPBUInt64Array count](self->mutableFixed64List_, "count")) {
    [a3 writeFixed64Array:self->number_ values:self->mutableFixed64List_ tag:0];
  }
  if (-[NSMutableArray count](self->mutableLengthDelimitedList_, "count")) {
    [a3 writeBytesArray:self->number_ values:self->mutableLengthDelimitedList_];
  }
  if (-[NSMutableArray count](self->mutableGroupList_, "count")) {
    _[a3 writeUnknownGroupArray:self->number_ values:self->mutableGroupList_];
  }
}

- (unint64_t)serializedSize
{
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  int number = self->number_;
  mutableVarintList = self->mutableVarintList_;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001363AC;
  v31[3] = &unk_100283430;
  v31[4] = &v33;
  int v32 = number;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v31);
  mutableFixed32List = self->mutableFixed32List_;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1001363E4;
  v29[3] = &unk_100283458;
  v29[4] = &v33;
  int v30 = number;
  -[TransparencyGPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v29);
  mutableFixed64List = self->mutableFixed64List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10013641C;
  v27[3] = &unk_100283430;
  v27[4] = &v33;
  int v28 = number;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v27);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v23,  v38,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        id v11 = sub_10010FC9C(number, *(void **)(*((void *)&v23 + 1) + 8LL * (void)i));
        v34[3] += (uint64_t)v11;
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v23,  v38,  16LL);
    }

    while (v8);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  mutableGroupList = self->mutableGroupList_;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v19,  v37,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(mutableGroupList);
        }
        __int128 v16 = sub_10010FB98(number, *(void **)(*((void *)&v19 + 1) + 8LL * (void)j));
        v34[3] += (uint64_t)v16;
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v19,  v37,  16LL);
    }

    while (v13);
  }

  unint64_t v17 = v34[3];
  _Block_object_dispose(&v33, 8);
  return v17;
}

- (void)writeAsMessageSetExtensionToOutput:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        [a3 writeRawMessageSetExtension:self->number_ value:*(void *)(*((void *)&v10 + 1) + 8 * (void)i)];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (unint64_t)serializedSizeAsMessageSetExtension
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  unint64_t v6 = 0LL;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mutableLengthDelimitedList);
      }
      v6 += (unint64_t)sub_10010FF54(self->number_, *(void **)(*((void *)&v10 + 1) + 8LL * (void)i));
    }

    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  }

  while (v5);
  return v6;
}

- (id)description
{
  unint64_t v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p>: Field: %d {\n",  objc_opt_class(self, a2),  self,  self->number_);
  mutableVarintList = self->mutableVarintList_;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1001368BC;
  v28[3] = &unk_1002828F0;
  v28[4] = v3;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v28);
  mutableFixed32List = self->mutableFixed32List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001368E8;
  v27[3] = &unk_100282A58;
  v27[4] = v3;
  -[TransparencyGPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v27);
  mutableFixed64List = self->mutableFixed64List_;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100136914;
  v26[3] = &unk_1002828F0;
  v26[4] = v3;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v26);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\t%@\n",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i));
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableLengthDelimitedList,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
    }

    while (v9);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  mutableGroupList = self->mutableGroupList_;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v18,  v29,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(mutableGroupList);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\t%@\n",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)j));
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableGroupList,  "countByEnumeratingWithState:objects:count:",  &v18,  v29,  16LL);
    }

    while (v14);
  }

  -[NSMutableString appendString:](v3, "appendString:", @"}");
  return v3;
}

- (void)mergeFromField:(id)a3
{
  id v5 = [a3 varintList];
  if ([v5 count])
  {
    mutableVarintList = self->mutableVarintList_;
    else {
      self->mutableVarintList_ = (TransparencyGPBUInt64Array *)[v5 copy];
    }
  }

  id v7 = [a3 fixed32List];
  if ([v7 count])
  {
    mutableFixed32List = self->mutableFixed32List_;
    if (mutableFixed32List) {
      -[TransparencyGPBUInt32Array addValuesFromArray:](mutableFixed32List, "addValuesFromArray:", v7);
    }
    else {
      self->mutableFixed32List_ = (TransparencyGPBUInt32Array *)[v7 copy];
    }
  }

  id v9 = [a3 fixed64List];
  if ([v9 count])
  {
    mutableFixed64List = self->mutableFixed64List_;
    if (mutableFixed64List) {
      -[TransparencyGPBUInt64Array addValuesFromArray:](mutableFixed64List, "addValuesFromArray:", v9);
    }
    else {
      self->mutableFixed64List_ = (TransparencyGPBUInt64Array *)[v9 copy];
    }
  }

  id v11 = [a3 lengthDelimitedList];
  if ([v11 count])
  {
    mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
    if (mutableLengthDelimitedList) {
      -[NSMutableArray addObjectsFromArray:](mutableLengthDelimitedList, "addObjectsFromArray:", v11);
    }
    else {
      self->mutableLengthDelimitedList_ = (NSMutableArray *)[v11 mutableCopy];
    }
  }

  id v13 = [a3 groupList];
  if ([v13 count])
  {
    if (!self->mutableGroupList_) {
      self->mutableGroupList_ = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v13 count]);
    }
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        unint64_t v17 = 0LL;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v17) copy];
          -[NSMutableArray addObject:](self->mutableGroupList_, "addObject:", v18);

          unint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v15);
    }
  }

- (void)addVarint:(unint64_t)a3
{
  unint64_t v5 = a3;
  mutableVarintList = self->mutableVarintList_;
  else {
    self->mutableVarintList_ = -[TransparencyGPBUInt64Array initWithValues:count:]( objc_alloc(&OBJC_CLASS___TransparencyGPBUInt64Array),  "initWithValues:count:",  &v5,  1LL);
  }
}

- (void)addFixed32:(unsigned int)a3
{
  unsigned int v5 = a3;
  mutableFixed32List = self->mutableFixed32List_;
  if (mutableFixed32List) {
    -[TransparencyGPBUInt32Array addValue:](mutableFixed32List, "addValue:");
  }
  else {
    self->mutableFixed32List_ = -[TransparencyGPBUInt32Array initWithValues:count:]( objc_alloc(&OBJC_CLASS___TransparencyGPBUInt32Array),  "initWithValues:count:",  &v5,  1LL);
  }
}

- (void)addFixed64:(unint64_t)a3
{
  unint64_t v5 = a3;
  mutableFixed64List = self->mutableFixed64List_;
  if (mutableFixed64List) {
    -[TransparencyGPBUInt64Array addValue:](mutableFixed64List, "addValue:");
  }
  else {
    self->mutableFixed64List_ = -[TransparencyGPBUInt64Array initWithValues:count:]( objc_alloc(&OBJC_CLASS___TransparencyGPBUInt64Array),  "initWithValues:count:",  &v5,  1LL);
  }
}

- (void)addLengthDelimited:(id)a3
{
  id v5 = a3;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  if (mutableLengthDelimitedList) {
    -[NSMutableArray addObject:](mutableLengthDelimitedList, "addObject:");
  }
  else {
    self->mutableLengthDelimitedList_ = -[NSMutableArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:count:",  &v5,  1LL);
  }
}

- (void)addGroup:(id)a3
{
  id v5 = a3;
  mutableGroupList = self->mutableGroupList_;
  if (mutableGroupList) {
    -[NSMutableArray addObject:](mutableGroupList, "addObject:");
  }
  else {
    self->mutableGroupList_ = -[NSMutableArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:count:",  &v5,  1LL);
  }
}

- (int)number
{
  return self->number_;
}

- (TransparencyGPBUInt64Array)varintList
{
  return self->mutableVarintList_;
}

- (TransparencyGPBUInt32Array)fixed32List
{
  return self->mutableFixed32List_;
}

- (TransparencyGPBUInt64Array)fixed64List
{
  return self->mutableFixed64List_;
}

- (NSArray)lengthDelimitedList
{
  return &self->mutableLengthDelimitedList_->super;
}

- (NSArray)groupList
{
  return &self->mutableGroupList_->super;
}

@end