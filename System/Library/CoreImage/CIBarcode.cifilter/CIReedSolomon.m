@interface CIReedSolomon
- ($B716781559FB179C01A6A83DB44EE660)addOrSubtractPoly:(id *)a3 with:(id *)a4;
- ($B716781559FB179C01A6A83DB44EE660)buildGenerator:(int)a3;
- ($B716781559FB179C01A6A83DB44EE660)copyPoly:(id *)a3;
- ($B716781559FB179C01A6A83DB44EE660)createMonomial:(int)a3 coefficient:(int)a4;
- ($B716781559FB179C01A6A83DB44EE660)divide:(id *)a3 by:(id *)a4;
- ($B716781559FB179C01A6A83DB44EE660)multiplyByMonomial:(id *)a3 degree:(int)a4 coefficient:(int)a5;
- ($B716781559FB179C01A6A83DB44EE660)multiplyPoly:(id *)a3 with:(id *)a4;
- (BOOL)encode:(int *)a3 length:(int)a4 bytes:(int)a5;
- (BOOL)fillPoly:(id *)a3 coefficients:(int *)a4 length:(int)a5;
- (BOOL)isZero:(id)a3;
- (id)initReedSolomon;
- (int)Degree:(id)a3;
- (int)Exp:(int)a3;
- (int)addOrSubtract:(int)a3 with:(int)a4;
- (int)coefficients:(id)a3;
- (int)inverse:(int)a3;
- (int)multiply:(int)a3 with:(int)a4;
- (int)polyCoefficient:(id *)a3 degree:(int)a4;
- (void)clearPoly:(id *)a3;
- (void)dealloc;
@end

@implementation CIReedSolomon

- (id)initReedSolomon
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CIReedSolomon;
  v2 = -[CIReedSolomon init](&v12, "init");
  v3 = v2;
  if (!v2) {
    goto LABEL_12;
  }
  int v4 = 1;
  for (uint64_t i = 8LL; i != 1032; i += 4LL)
  {
    *(_DWORD *)((char *)&v2->super.isa + i) = v4;
    int v6 = 2 * v4;
    int v4 = (2 * v4) ^ 0x11D;
    if (v6 <= 255) {
      int v4 = v6;
    }
  }

  for (uint64_t j = 0LL; j != 255; ++j)
    v2->_logTable[v2->_expTable[j]] = j;
  *(void *)&v2->_cachedGeneratorNum = 0xA00000001LL;
  v8 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(0xAuLL, 0x10uLL);
  v3->_cachedGenerators = v8;
  if (!v8) {
    goto LABEL_12;
  }
  v8->var1 = 1;
  v3->_cachedGenerators->var0 = (int *)calloc(1uLL, 4uLL);
  cachedGenerators = v3->_cachedGenerators;
  if (!cachedGenerators->var0)
  {
    free(cachedGenerators);
LABEL_12:
    v10 = 0LL;
    goto LABEL_13;
  }

  *cachedGenerators->var0 = 1;
  v10 = v3;
LABEL_13:

  return v10;
}

- (int)addOrSubtract:(int)a3 with:(int)a4
{
  return a4 ^ a3;
}

- (int)Exp:(int)a3
{
  return self->_expTable[a3];
}

- (int)inverse:(int)a3
{
  if (a3) {
    return self->_expTable[255LL - self->_logTable[a3]];
  }
  uint64_t v4 = sub_37A8();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10D38();
  }

  return 0x7FFFFFFF;
}

- (int)multiply:(int)a3 with:(int)a4
{
  int v4 = 0;
  if (a3 && a4)
  {
    if (a3 == 1)
    {
      return a4;
    }

    else if (a4 == 1)
    {
      return a3;
    }

    else
    {
      return self->_expTable[(self->_logTable[a4] + self->_logTable[a3]) % 255];
    }
  }

  return v4;
}

- ($B716781559FB179C01A6A83DB44EE660)createMonomial:(int)a3 coefficient:(int)a4
{
  if (a3 < 0)
  {
    uint64_t v11 = sub_37A8();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10D64();
    }

    return 0LL;
  }

  if (a4)
  {
    size_t v6 = (a3 + 1);
    v7 = calloc(v6, 4uLL);
    if (!v7) {
      return 0LL;
    }
    v8 = v7;
    _DWORD *v7 = a4;
    v9 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
    if (!v9)
    {
      free(v8);
      return v9;
    }

    unsigned __int8 v10 = -[CIReedSolomon fillPoly:coefficients:length:](self, "fillPoly:coefficients:length:", v9, v8, v6);
    free(v8);
    if ((v10 & 1) == 0)
    {
      free(v9);
      return 0LL;
    }
  }

  else
  {
    v14 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
    v9 = v14;
    if (v14) {
      v14->var1 = 0;
    }
  }

  return v9;
}

- (int)Degree:(id)a3
{
  return a3.var1 - 1;
}

- (int)coefficients:(id)a3
{
  return a3.var0;
}

- (BOOL)isZero:(id)a3
{
  return a3.var1 == 0;
}

- (BOOL)fillPoly:(id *)a3 coefficients:(int *)a4 length:(int)a5
{
  if (!a3 || (v5 = a4) == 0LL || !a5)
  {
    uint64_t v10 = sub_37A8();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10D90();
    }

    LOBYTE(v8) = 0;
    return (char)v8;
  }

  if (a5 < 2 || *a4)
  {
    a3->int var1 = a5;
    if (a3->var0) {
      free(a3->var0);
    }
    v8 = (int *)calloc(a5, 4uLL);
    a3->var0 = v8;
    if (!v8) {
      return (char)v8;
    }
    size_t v9 = 4LL * a5;
    goto LABEL_10;
  }

  v5 = a4 + 1;
  uint64_t v12 = 1LL;
  while (!*v5)
  {
    ++v12;
    ++v5;
    if (a5 == v12) {
      goto LABEL_19;
    }
  }

  if (a5 == (_DWORD)v12)
  {
LABEL_19:
    -[CIReedSolomon clearPoly:](self, "clearPoly:", a3);
    goto LABEL_20;
  }

  int var1 = a5 - v12;
  a3->int var1 = a5 - v12;
  if (a3->var0)
  {
    free(a3->var0);
    int var1 = a3->var1;
  }

  v8 = (int *)calloc(var1, 4uLL);
  a3->var0 = v8;
  if (v8)
  {
    size_t v9 = 4LL * a3->var1;
LABEL_10:
    memcpy(v8, v5, v9);
LABEL_20:
    LOBYTE(v8) = 1;
  }

  return (char)v8;
}

- (void)clearPoly:(id *)a3
{
  if (a3)
  {
    free(a3->var0);
    a3->int var1 = 0;
  }

- (int)polyCoefficient:(id *)a3 degree:(int)a4
{
  if ((a4 & 0x80000000) == 0)
  {
    int var1 = a3->var1;
    if (var1 > a4) {
      return a3->var0[var1 + ~a4];
    }
  }

  uint64_t v6 = sub_37A8();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10DBC();
  }

  return 0;
}

- ($B716781559FB179C01A6A83DB44EE660)copyPoly:(id *)a3
{
  int v4 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
  if (v4)
  {
    size_t var1 = a3->var1;
    v4->size_t var1 = var1;
    uint64_t v6 = (int *)calloc(var1, 4uLL);
    v4->var0 = v6;
    if (v6)
    {
      if (a3->var1 >= 1)
      {
        uint64_t v7 = 0LL;
        var0 = a3->var0;
        do
        {
          v6[v7] = var0[v7];
          ++v7;
        }

        while (v7 < a3->var1);
      }
    }

    else
    {
      free(v4);
      return 0LL;
    }
  }

  return v4;
}

- ($B716781559FB179C01A6A83DB44EE660)addOrSubtractPoly:(id *)a3 with:(id *)a4
{
  var0 = 0LL;
  if (a3 && a4)
  {
    if (-[CIReedSolomon isZero:](self, "isZero:", a3->var0, *(void *)&a3->var1))
    {
      v8 = self;
      size_t v9 = a4;
      return -[CIReedSolomon copyPoly:](v8, "copyPoly:", v9);
    }

    if (-[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
    {
      v8 = self;
      size_t v9 = a3;
      return -[CIReedSolomon copyPoly:](v8, "copyPoly:", v9);
    }

    int var1 = a3->var1;
    int v12 = a4->var1;
    if (var1 <= v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = var1;
    }
    if (var1 <= v12) {
      v14 = a3;
    }
    else {
      v14 = a4;
    }
    if (var1 <= v12) {
      v15 = a4;
    }
    else {
      v15 = a3;
    }
    var0 = ($B716781559FB179C01A6A83DB44EE660 *)v15->var0;
    if (v15->var0)
    {
      v16 = v14->var0;
      if (var1 >= v12) {
        int v17 = a4->var1;
      }
      else {
        int v17 = a3->var1;
      }
      v18 = calloc((int)v13, 4uLL);
      if (v18)
      {
        v19 = v18;
        if ((int)v13 - v17 >= 1)
        {
          uint64_t v20 = (v13 - v17);
          v21 = var0;
          v22 = v18;
          do
          {
            int v23 = (int)v21->var0;
            v21 = ($B716781559FB179C01A6A83DB44EE660 *)((char *)v21 + 4);
            *v22++ = v23;
            --v20;
          }

          while (v20);
        }

        if (v17 >= 1)
        {
          uint64_t v24 = (int)v13 - v17;
          do
          {
            unsigned int v25 = *v16++;
            v19[v24] = -[CIReedSolomon addOrSubtract:with:]( self,  "addOrSubtract:with:",  v25,  *((unsigned int *)&var0->var0 + v24));
            ++v24;
          }

          while (v24 < (int)v13);
        }

        var0 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
        if (var0) {
          -[CIReedSolomon fillPoly:coefficients:length:](self, "fillPoly:coefficients:length:", var0, v19, v13);
        }
        free(v19);
      }

      else
      {
        return 0LL;
      }
    }
  }

  return var0;
}

- ($B716781559FB179C01A6A83DB44EE660)multiplyPoly:(id *)a3 with:(id *)a4
{
  result = 0LL;
  if (a3 && a4)
  {
    if (-[CIReedSolomon isZero:](self, "isZero:", a3->var0, *(void *)&a3->var1)
      || -[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
    {
      result = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
      if (result) {
        result->uint64_t var1 = 0;
      }
    }

    else
    {
      uint64_t var1 = a3->var1;
      var0 = a4->var0;
      uint64_t v20 = a3->var0;
      uint64_t v9 = a4->var1;
      result = ($B716781559FB179C01A6A83DB44EE660 *)calloc((int)var1 + (int)v9 - 1, 4uLL);
      v18 = (int *)result;
      if (result)
      {
        uint64_t v17 = (var1 + v9 - 1);
        if ((int)var1 >= 1)
        {
          uint64_t v10 = 0LL;
          uint64_t v11 = result;
          do
          {
            if ((int)v9 >= 1)
            {
              int v12 = var0;
              uint64_t v13 = v20[v10];
              uint64_t v14 = v9;
              v15 = (unsigned int *)v11;
              do
              {
                unsigned int v16 = *v12++;
                unsigned int *v15 = -[CIReedSolomon addOrSubtract:with:]( self,  "addOrSubtract:with:",  *v15,  -[CIReedSolomon multiply:with:](self, "multiply:with:", v13, v16, v17));
                ++v15;
                --v14;
              }

              while (v14);
            }

            ++v10;
            uint64_t v11 = ($B716781559FB179C01A6A83DB44EE660 *)((char *)v11 + 4);
          }

          while (v10 != var1);
        }

        result = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
        if (result)
        {
          result->var0 = v18;
          result->uint64_t var1 = v17;
        }

        else
        {
          free(v18);
          return 0LL;
        }
      }
    }
  }

  return result;
}

- ($B716781559FB179C01A6A83DB44EE660)multiplyByMonomial:(id *)a3 degree:(int)a4 coefficient:(int)a5
{
  if (!a3 || a4 < 0)
  {
    uint64_t v14 = sub_37A8();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10DE8();
    }

    return 0LL;
  }

  uint64_t v5 = *(void *)&a5;
  if (a5)
  {
    uint64_t var1 = a3->var1;
    int v9 = var1 + a4;
    result = ($B716781559FB179C01A6A83DB44EE660 *)calloc((int)var1 + a4, 4uLL);
    if (!result) {
      return result;
    }
    uint64_t v11 = (int *)result;
    if ((int)var1 >= 1)
    {
      unint64_t v12 = 0LL;
      uint64_t v13 = 4 * var1;
      do
      {
        v11[v12 / 4] = -[CIReedSolomon multiply:with:](self, "multiply:with:", a3->var0[v12 / 4], v5);
        v12 += 4LL;
      }

      while (v13 != v12);
    }

    result = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
    if (result)
    {
      result->var0 = v11;
      result->uint64_t var1 = v9;
      return result;
    }

    free(v11);
    return 0LL;
  }

  result = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
  if (result) {
    result->uint64_t var1 = 0;
  }
  return result;
}

- ($B716781559FB179C01A6A83DB44EE660)divide:(id *)a3 by:(id *)a4
{
  if (a3 && a4 && !-[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
  {
    uint64_t v10 = -[CIReedSolomon copyPoly:](self, "copyPoly:", a3);
    uint64_t v11 = -[CIReedSolomon inverse:]( self,  "inverse:",  -[CIReedSolomon polyCoefficient:degree:]( self,  "polyCoefficient:degree:",  a4,  -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1)));
    while (1)
    {
      int v12 = -[CIReedSolomon Degree:](self, "Degree:", v10->var0, *(void *)&v10->var1);
      if (v12 < -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1)) {
        break;
      }
      uint64_t v13 = -[CIReedSolomon multiplyByMonomial:degree:coefficient:]( self,  "multiplyByMonomial:degree:coefficient:",  a4,  -[CIReedSolomon Degree:](self, "Degree:", v10->var0, *(void *)&v10->var1)
            - -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1),
              -[CIReedSolomon multiply:with:]( self,  "multiply:with:",  -[CIReedSolomon polyCoefficient:degree:]( self,  "polyCoefficient:degree:",  v10,  -[CIReedSolomon Degree:](self, "Degree:", v10->var0, *(void *)&v10->var1)),  v11));
      uint64_t v14 = -[CIReedSolomon addOrSubtractPoly:with:](self, "addOrSubtractPoly:with:", v10, v13);
      -[CIReedSolomon clearPoly:](self, "clearPoly:", v13);
      free(v13);
      -[CIReedSolomon clearPoly:](self, "clearPoly:", v10);
      free(v10);
      uint64_t v10 = v14;
    }

    v15 = ($B716781559FB179C01A6A83DB44EE660 *)calloc(1uLL, 0x10uLL);
    int v9 = v15;
    if (v15)
    {
      v15->uint64_t var1 = v10->var1;
      v15->var0 = v10->var0;
    }

    else
    {
      -[CIReedSolomon clearPoly:](self, "clearPoly:", v10);
    }

    free(v10);
  }

  else
  {
    uint64_t v7 = sub_37A8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10E14();
    }

    return 0LL;
  }

  return v9;
}

- ($B716781559FB179C01A6A83DB44EE660)buildGenerator:(int)a3
{
  uint64_t cachedGeneratorNum = self->_cachedGeneratorNum;
  cachedGenerators = self->_cachedGenerators;
  uint64_t v8 = cachedGeneratorNum;
  uint64_t v9 = (uint64_t)&cachedGenerators[cachedGeneratorNum - 1];
  int v10 = a3 + 1;
  uint64_t v11 = (cachedGeneratorNum - 1);
  while (1)
  {
    int v20 = 2;
    int v12 = calloc(2uLL, 4uLL);
    v19 = v12;
    if (!v12) {
      break;
    }
    *int v12 = 1;
    unsigned int v13 = -[CIReedSolomon Exp:](self, "Exp:", v11);
    v19[1] = v13;
    uint64_t v14 = -[CIReedSolomon multiplyPoly:with:](self, "multiplyPoly:with:", v9, &v19);
    -[CIReedSolomon clearPoly:](self, "clearPoly:", &v19);
    uint64_t memoryCapacity = self->_memoryCapacity;
    unsigned int v16 = self->_cachedGenerators;
    if (cachedGeneratorNum >= memoryCapacity)
    {
      self->_uint64_t memoryCapacity = 2 * memoryCapacity;
      unsigned int v16 = ($B716781559FB179C01A6A83DB44EE660 *)realloc(v16, 32 * memoryCapacity);
      self->_cachedGenerators = v16;
      if (!v16)
      {
        free(v14);
        return 0LL;
      }
    }

    uint64_t v17 = &v16[v8];
    v17->uint64_t var1 = v14->var1;
    v17->var0 = v14->var0;
    free(v14);
    v18 = self->_cachedGenerators;
    uint64_t v9 = (uint64_t)&v18[v8];
    ++cachedGeneratorNum;
    uint64_t v11 = (v11 + 1);
    ++v8;
    if (a3 == (_DWORD)v11)
    {
      self->_uint64_t cachedGeneratorNum = v10;
      return &v18[v8 - 1];
    }
  }

  return 0LL;
}

- (BOOL)encode:(int *)a3 length:(int)a4 bytes:(int)a5
{
  if (!a5)
  {
    uint64_t v25 = sub_37A8();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10E40();
    }
    goto LABEL_20;
  }

  uint64_t v5 = *(void *)&a5;
  size_t v6 = (a4 - a5);
  if (a4 <= a5)
  {
    uint64_t v27 = sub_37A8();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10E6C();
    }
LABEL_20:

LABEL_24:
    LOBYTE(v10) = 0;
    return (char)v10;
  }

  uint64_t v9 = -[CIReedSolomon buildGenerator:](self, "buildGenerator:", *(void *)&a5);
  int v10 = (char *)calloc(v6, 4uLL);
  if (!v10) {
    return (char)v10;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0LL;
  do
  {
    *(_DWORD *)&v10[v12 * 4] = a3[v12];
    ++v12;
  }

  while (v6 != v12);
  unsigned int v13 = calloc(1uLL, 0x10uLL);
  if (!v13)
  {
    v28 = v11;
LABEL_23:
    free(v28);
    goto LABEL_24;
  }

  uint64_t v14 = v13;
  unsigned __int8 v15 = -[CIReedSolomon fillPoly:coefficients:length:](self, "fillPoly:coefficients:length:", v13, v11, v6);
  free(v11);
  if ((v15 & 1) == 0)
  {
    v28 = v14;
    goto LABEL_23;
  }

  unsigned int v16 = -[CIReedSolomon multiplyByMonomial:degree:coefficient:]( self,  "multiplyByMonomial:degree:coefficient:",  v14,  v5,  1LL);
  -[CIReedSolomon clearPoly:](self, "clearPoly:", v14);
  free(v14);
  uint64_t v17 = -[CIReedSolomon divide:by:](self, "divide:by:", v16, v9);
  -[CIReedSolomon clearPoly:](self, "clearPoly:", v16);
  free(v16);
  var0 = v17->var0;
  int var1 = v17->var1;
  int v20 = v5 - var1;
  if ((int)v5 - var1 >= 1)
  {
    uint64_t v21 = (v5 - var1);
    int v22 = v6;
    do
    {
      a3[v22++] = 0;
      --v21;
    }

    while (v21);
    int var1 = v17->var1;
  }

  if (var1 >= 1)
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = &a3[v20 + (int)v6];
    do
    {
      v24[v23] = var0[v23];
      ++v23;
    }

    while (v23 < v17->var1);
  }

  -[CIReedSolomon clearPoly:](self, "clearPoly:", v17);
  free(v17);
  LOBYTE(v10) = 1;
  return (char)v10;
}

- (void)dealloc
{
  cachedGenerators = self->_cachedGenerators;
  if (cachedGenerators)
  {
    int cachedGeneratorNum = self->_cachedGeneratorNum;
    if (cachedGeneratorNum >= 1)
    {
      uint64_t v5 = 0LL;
      for (uint64_t i = 0LL; i < cachedGeneratorNum; ++i)
      {
        var0 = self->_cachedGenerators[v5].var0;
        if (var0)
        {
          free(var0);
          int cachedGeneratorNum = self->_cachedGeneratorNum;
        }

        ++v5;
      }

      cachedGenerators = self->_cachedGenerators;
    }

    free(cachedGenerators);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CIReedSolomon;
  -[CIReedSolomon dealloc](&v8, "dealloc");
}

@end