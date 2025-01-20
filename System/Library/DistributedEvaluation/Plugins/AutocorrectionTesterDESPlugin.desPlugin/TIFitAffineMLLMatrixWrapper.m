@interface TIFitAffineMLLMatrixWrapper
- (CGPoint)transformedPoint:(CGPoint)a3;
- (TIFitAffineMLLMatrixWrapper)init;
- (void)calcMatrix;
- (void)dealloc;
- (void)setMatrix:(void *)a3;
- (void)setRotation:(double)a3;
- (void)setSkewRotation:(double)a3;
- (void)setXScale:(double)a3 yScale:(double)a4;
- (void)setXTrans:(double)a3 yTrans:(double)a4;
@end

@implementation TIFitAffineMLLMatrixWrapper

- (TIFitAffineMLLMatrixWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIFitAffineMLLMatrixWrapper;
  v2 = -[TIFitAffineMLLMatrixWrapper init](&v6, "init");
  if (v2)
  {
    v3 = operator new(0x28uLL);
    TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)((char *)&dword_0 + 3), v4);
    v2->_pMatrix = v3;
  }

  return v2;
}

- (void)dealloc
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TIFitAffineMLLMatrixWrapper;
  -[TIFitAffineMLLMatrixWrapper dealloc](&v4, "dealloc");
}

- (void)setMatrix:(void *)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  objc_super v6 = (TIFitAffineMLLMatrix *)operator new(0x28uLL);
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v6, (const TIFitAffineMLLMatrix *)a3);
  p_pScaleMatrix = &self->_pScaleMatrix;
  pScaleMatrix = (void **)self->_pScaleMatrix;
  self->_pMatrix = v6;
  if (pScaleMatrix)
  {
    sub_519E4((uint64_t)(pScaleMatrix + 2), pScaleMatrix[3]);
    operator delete(pScaleMatrix);
  }

  pRotationMatrix = (void **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    sub_519E4((uint64_t)(pRotationMatrix + 2), pRotationMatrix[3]);
    operator delete(pRotationMatrix);
  }

  pSkewMatrix = (void **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    sub_519E4((uint64_t)(pSkewMatrix + 2), pSkewMatrix[3]);
    operator delete(pSkewMatrix);
  }

  pTransMatrix = (void **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    sub_519E4((uint64_t)(pTransMatrix + 2), pTransMatrix[3]);
    operator delete(pTransMatrix);
  }

  *(_OWORD *)p_pScaleMatrix = 0u;
  *((_OWORD *)p_pScaleMatrix + 1) = 0u;
}

- (void)setXScale:(double)a3 yScale:(double)a4
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  self->_pMatrix = 0LL;
  pScaleMatrix = (void **)self->_pScaleMatrix;
  if (pScaleMatrix)
  {
    sub_519E4((uint64_t)(pScaleMatrix + 2), pScaleMatrix[3]);
    operator delete(pScaleMatrix);
  }

  v9 = operator new(0x28uLL);
  *(double *)v10 = a3;
  v10[1] = 0LL;
  v10[2] = 0LL;
  *(double *)&v10[3] = a4;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v9, 2LL, 2LL, v10, 4LL);
  self->_pScaleMatrix = v9;
}

- (void)setRotation:(double)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  self->_pMatrix = 0LL;
  pRotationMatrix = (void **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    sub_519E4((uint64_t)(pRotationMatrix + 2), pRotationMatrix[3]);
    operator delete(pRotationMatrix);
  }

  __double2 v7 = __sincos_stret(a3);
  v8 = operator new(0x28uLL);
  v9[0] = *(void *)&v7.__cosval;
  *(double *)&v9[1] = -v7.__sinval;
  __double2 v10 = v7;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v8, 2LL, 2LL, v9, 4LL);
  self->_pRotationMatrix = v8;
}

- (void)setSkewRotation:(double)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  self->_pMatrix = 0LL;
  pSkewMatrix = (void **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    sub_519E4((uint64_t)(pSkewMatrix + 2), pSkewMatrix[3]);
    operator delete(pSkewMatrix);
  }

  __double2 v7 = operator new(0x28uLL);
  v8[0] = 0x3FF0000000000000LL;
  *(double *)&v8[1] = a3 / 0.785398163;
  __int128 v9 = xmmword_82180;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v7, 2LL, 2LL, v8, 4LL);
  self->_pSkewMatrix = v7;
}

- (void)setXTrans:(double)a3 yTrans:(double)a4
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_519E4((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete(pMatrix);
  }

  self->_pMatrix = 0LL;
  pTransMatrix = (void **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    sub_519E4((uint64_t)(pTransMatrix + 2), pTransMatrix[3]);
    operator delete(pTransMatrix);
  }

  __int128 v9 = operator new(0x28uLL);
  *(double *)__double2 v10 = a3;
  *(double *)&v10[1] = a4;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v9, 2LL, 1LL, v10, 2LL);
  self->_pTransMatrix = v9;
}

- (void)calcMatrix
{
  if (!self->_pMatrix)
  {
    pScaleMatrix = (const TIFitAffineMLLMatrix *)self->_pScaleMatrix;
    if (pScaleMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v19, pScaleMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v19, (TIFitAffineMLLMatrix *)((char *)&dword_0 + 2), 0LL);
    }
    pRotationMatrix = (const TIFitAffineMLLMatrix *)self->_pRotationMatrix;
    if (pRotationMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v17, pRotationMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v17, (TIFitAffineMLLMatrix *)((char *)&dword_0 + 2), 0LL);
    }
    pSkewMatrix = (const TIFitAffineMLLMatrix *)self->_pSkewMatrix;
    if (pSkewMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v15, pSkewMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v15, (TIFitAffineMLLMatrix *)((char *)&dword_0 + 2), 0LL);
    }
    pTransMatrix = (const TIFitAffineMLLMatrix *)self->_pTransMatrix;
    if (pTransMatrix)
    {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v13, pTransMatrix);
    }

    else
    {
      v22[0] = 0LL;
      v22[1] = 0LL;
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v13, 2LL, 1LL, v22, 2LL);
    }

    TIFitAffineMLLMatrix::operator*(v10, v19, v17);
    TIFitAffineMLLMatrix::operator*(v22, v10, v15);
    sub_519E4((uint64_t)&v11, v12);
    __double2 v7 = operator new(0x28uLL);
    TIFitAffineMLLMatrix::transform((TIFitAffineMLLMatrix *)v22);
    v21[0] = *(void *)TIFitAffineMLLMatrix::operator()(v13, 0LL, 0LL);
    v21[1] = *(void *)TIFitAffineMLLMatrix::operator()(v13, 1LL, 0LL);
    TIFitAffineMLLMatrix::addRow(v10, &v8, v21, 2LL);
    TIFitAffineMLLMatrix::transform((TIFitAffineMLLMatrix *)v10);
    self->_pMatrix = v7;
    sub_519E4((uint64_t)&v11, v12);
    sub_519E4((uint64_t)v9, v9[1]);
    sub_519E4((uint64_t)v23, v23[1]);
    sub_519E4((uint64_t)v14, v14[1]);
    sub_519E4((uint64_t)v16, v16[1]);
    sub_519E4((uint64_t)v18, v18[1]);
    sub_519E4((uint64_t)v20, v20[1]);
  }

- (CGPoint)transformedPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[TIFitAffineMLLMatrixWrapper calcMatrix](self, "calcMatrix");
  pMatriCGFloat x = self->_pMatrix;
  *(CGFloat *)v15 = x;
  *(CGFloat *)&v15[1] = y;
  void v15[2] = 0x3FF0000000000000LL;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v11, 3LL, 1LL, v15, 3LL);
  TIFitAffineMLLMatrix::operator*(v13, pMatrix, v11);
  sub_519E4((uint64_t)v12, v12[1]);
  double v7 = *(double *)TIFitAffineMLLMatrix::operator()(v13, 0LL, 0LL);
  double v8 = *(double *)TIFitAffineMLLMatrix::operator()(v13, 1LL, 0LL);
  sub_519E4((uint64_t)v14, v14[1]);
  double v9 = v7;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

@end