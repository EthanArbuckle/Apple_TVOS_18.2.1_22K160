@interface MROrigamiAnimationPath
- (MROrigamiAnimationPath)initWithControlPoints:(double *)(a3 keyTimes:values:length:;
- (MROrigamiAnimationPath)initWithSwingType:(int)a3;
- (float)timeFirstAtRestValue;
- (float)valueAtTime:(float)a3;
- (void)dealloc;
@end

@implementation MROrigamiAnimationPath

- (MROrigamiAnimationPath)initWithSwingType:(int)a3
{
  switch(a3)
  {
    case 0:
      __int128 v15 = xmmword_1F8C20;
      __int128 v16 = unk_1F8C30;
      __int128 v17 = xmmword_1F8C40;
      __int128 v18 = unk_1F8C50;
      __int128 v13 = xmmword_1F8C00;
      __int128 v14 = unk_1F8C10;
      v3 = &xmmword_1F8BE0;
      goto LABEL_5;
    case 1:
      __int128 v15 = xmmword_1F8C20;
      __int128 v16 = unk_1F8C30;
      __int128 v17 = xmmword_1F8C40;
      __int128 v18 = unk_1F8C50;
      __int128 v13 = xmmword_1F8C00;
      __int128 v14 = unk_1F8C10;
      v3 = &xmmword_1F8C60;
LABEL_5:
      __int128 v5 = v3[1];
      __int128 v11 = *v3;
      __int128 v12 = v5;
      v6 = &xmmword_1F8C80;
      goto LABEL_9;
    case 2:
      __int128 v15 = xmmword_1F8CC0;
      __int128 v16 = unk_1F8CD0;
      __int128 v17 = xmmword_1F8CE0;
      __int128 v18 = unk_1F8CF0;
      __int128 v13 = xmmword_1F8CA0;
      __int128 v14 = unk_1F8CB0;
      __int128 v11 = xmmword_1F8D00;
      *(void *)&__int128 v12 = 0x3FF0000000000000LL;
      __int128 v9 = xmmword_1F8D18;
      *(void *)&__int128 v10 = 0x3FE921FB54442B65LL;
      uint64_t v7 = 3LL;
      goto LABEL_10;
    case 3:
      __int128 v13 = xmmword_1F8D30;
      __int128 v14 = unk_1F8D40;
      __int128 v11 = xmmword_1F8DF0;
      __int128 v9 = xmmword_1F8E00;
      uint64_t v7 = 2LL;
      goto LABEL_10;
    case 4:
      __int128 v15 = xmmword_1F8D70;
      __int128 v16 = unk_1F8D80;
      __int128 v17 = xmmword_1F8D90;
      __int128 v18 = unk_1F8DA0;
      __int128 v13 = xmmword_1F8D50;
      __int128 v14 = unk_1F8D60;
      __int128 v11 = xmmword_1F8DB0;
      __int128 v12 = unk_1F8DC0;
      v6 = &xmmword_1F8DD0;
LABEL_9:
      __int128 v8 = v6[1];
      __int128 v9 = *v6;
      __int128 v10 = v8;
      uint64_t v7 = 4LL;
LABEL_10:
      result = -[MROrigamiAnimationPath initWithControlPoints:keyTimes:values:length:]( self,  "initWithControlPoints:keyTimes:values:length:",  &v13,  &v11,  &v9,  v7,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18);
      break;
    default:
      result = 0LL;
      break;
  }

  return result;
}

- (MROrigamiAnimationPath)initWithControlPoints:(double *)(a3 keyTimes:values:length:
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MROrigamiAnimationPath;
  __int128 v10 = -[MROrigamiAnimationPath init](&v28, "init");
  __int128 v11 = v10;
  if (v10)
  {
    v10->_length = length;
    size_t v12 = 8 * length;
    v10->_curves = (id *)malloc(8 * length - 8);
    int64_t v13 = length - 1;
    if (length > 1)
    {
      int64_t v14 = 0LL;
      do
      {
        v11->_curves[v14++] = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  a3);
        length = v11->_length;
        int64_t v13 = length - 1;
        ++a3;
      }

      while (length - 1 > v14);
      size_t v12 = 8 * length;
    }

    __int128 v15 = (double *)malloc(v12);
    __int128 v16 = v15;
    v11->_keyTimes = v15;
    if (length < 1)
    {
      __int128 v17 = (double *)malloc(v12);
      v11->_values = v17;
    }

    else
    {
      memcpy(v15, a4, v12);
      __int128 v17 = (double *)malloc(v12);
      uint64_t v18 = 0LL;
      v11->_values = v17;
      double v19 = *a5;
      do
      {
        v17[v18] = a5[v18] - v19;
        ++v18;
      }

      while (length != v18);
      double v20 = v17[v13];
    }

    uint64_t v21 = 0LL;
    for (uint64_t i = v13 & ~(v13 >> 63); i; --i)
    {
      double v23 = v17[++v21];
      if (v23 > v20)
      {
        double v24 = v16[v21 - 1];
        double v25 = v16[v21];
        objc_msgSend(v11->_curves[v21 - 1], "evaluate_inverseAtTime:", (v20 - v17[v21 - 1]) / (v23 - v17[v21 - 1]));
        *(float *)&double v26 = v24 + v26 * (v25 - v24);
        v11->_timeFirstAtRestValue = *(float *)&v26;
        return v11;
      }
    }
  }

  return v11;
}

- (void)dealloc
{
  if (self->_length >= 2)
  {
    int64_t v3 = 0LL;
    do

    while (self->_length - 1 > v3);
  }

  free(self->_curves);
  free(self->_keyTimes);
  free(self->_values);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MROrigamiAnimationPath;
  -[MROrigamiAnimationPath dealloc](&v4, "dealloc");
}

- (float)valueAtTime:(float)a3
{
  if (a3 >= 1.0) {
    return self->_values[self->_length - 1];
  }
  else {
    ValueFromBezierPath(self->_curves, self->_keyTimes, 0.0, 1.0, a3, (uint64_t)self->_values, self->_length);
  }
  return v3;
}

- (float)timeFirstAtRestValue
{
  return self->_timeFirstAtRestValue;
}

@end