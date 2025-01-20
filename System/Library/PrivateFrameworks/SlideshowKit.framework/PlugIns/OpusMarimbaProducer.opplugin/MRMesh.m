@interface MRMesh
- (MRMesh)initWithContext:(id)a3 andCountOfVertices:(unint64_t)a4;
- (void)_updateVBO:(unsigned int *)a3 andFeatures:(char *)a4 withPointer:(void *)a5 andFeatures:(char)a6;
- (void)bind;
- (void)cleanup;
- (void)dealloc;
- (void)draw;
- (void)makeGenericThenRectangularIndexedTriangleStripStartingAtIndex:(unint64_t)a3 withWidth:(unint64_t)a4 andHeight:(unint64_t)a5;
- (void)makeQuads;
- (void)makeRectangularIndexedTriangleStripWithWidth:(unint64_t)a3 andHeight:(unint64_t)a4;
- (void)makeTriangleStrip;
- (void)makeTriangles;
- (void)setDynamicVBOVertex2DColorPointer:(id *)a3;
- (void)setDynamicVBOVertex2DColorTexturePointer:(id *)a3;
- (void)setDynamicVBOVertex2DPointer:(id *)a3;
- (void)setDynamicVBOVertex2DTexturePointer:(id *)a3;
- (void)setDynamicVBOVertex3DColorTexturePointer:(id *)a3;
- (void)setDynamicVBOVertex3DNormalPointer:(id *)a3;
- (void)setDynamicVBOVertex3DNormalTexturePointer:(id *)a3;
- (void)setDynamicVBOVertex3DPointer:(id *)a3;
- (void)setDynamicVBOVertex3DTexturePointer:(id *)a3;
- (void)setDynamicVBOVertexNormalPointer:(id *)a3;
- (void)setDynamicVBOVertexNormalTexturePointer:(id *)a3;
- (void)setDynamicVBOVertexTexturePointer:(id *)a3;
- (void)setStaticVBOVertex2DColorPointer:(id *)a3;
- (void)setStaticVBOVertex2DColorTexturePointer:(id *)a3;
- (void)setStaticVBOVertex2DPointer:(id *)a3;
- (void)setStaticVBOVertex2DTexturePointer:(id *)a3;
- (void)setStaticVBOVertex3DColorTexturePointer:(id *)a3;
- (void)setStaticVBOVertex3DNormalPointer:(id *)a3;
- (void)setStaticVBOVertex3DNormalTexturePointer:(id *)a3;
- (void)setStaticVBOVertex3DPointer:(id *)a3;
- (void)setStaticVBOVertex3DTexturePointer:(id *)a3;
- (void)setStaticVBOVertexNormalPointer:(id *)a3;
- (void)setStaticVBOVertexNormalTexturePointer:(id *)a3;
- (void)setStaticVBOVertexTexturePointer:(id *)a3;
- (void)setStreamVBOVertex2DColorPointer:(id *)a3;
- (void)setStreamVBOVertex2DColorTexturePointer:(id *)a3;
- (void)setStreamVBOVertex2DPointer:(id *)a3;
- (void)setStreamVBOVertex2DTexturePointer:(id *)a3;
- (void)setStreamVBOVertex3DColorTexturePointer:(id *)a3;
- (void)setStreamVBOVertex3DNormalPointer:(id *)a3;
- (void)setStreamVBOVertex3DNormalTexture01Pointer:(id *)a3;
- (void)setStreamVBOVertex3DNormalTexturePointer:(id *)a3;
- (void)setStreamVBOVertex3DPointer:(id *)a3;
- (void)setStreamVBOVertex3DTexturePointer:(id *)a3;
- (void)setStreamVBOVertexNormalPointer:(id *)a3;
- (void)setStreamVBOVertexNormalTexturePointer:(id *)a3;
- (void)setStreamVBOVertexTexturePointer:(id *)a3;
- (void)unbind;
@end

@implementation MRMesh

- (MRMesh)initWithContext:(id)a3 andCountOfVertices:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRMesh;
  v6 = -[MRMesh init](&v8, "init");
  if (v6)
  {
    v6->_context = (MRContext *)a3;
    v6->_countOfVertices = a4;
  }

  return v6;
}

- (void)dealloc
{
  self->_context = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMesh;
  -[MRMesh dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->_vao) {
    glDeleteVertexArraysOES(1LL, &self->_vao);
  }
  glDeleteBuffers(4, &self->_staticVBO);
  self->_countOfIndices = 0LL;
}

- (void)bind
{
  p_uint64_t vao = &self->_vao;
  uint64_t vao = self->_vao;
  if ((_DWORD)vao)
  {
    glBindVertexArrayOES(vao);
  }

  else
  {
    glGenVertexArraysOES(1LL, p_vao);
    glBindVertexArrayOES(*p_vao);
    glLabelObjectEXT(0x9154u, *p_vao, 0, "Marimba Mesh VAO");
  }

  -[MRContext bindMesh](self->_context, "bindMesh");
}

- (void)unbind
{
}

- (void)_updateVBO:(unsigned int *)a3 andFeatures:(char *)a4 withPointer:(void *)a5 andFeatures:(char)a6
{
  int v8 = a6;
  if (!a5 || !a6)
  {
    if (a5 || a6) {
      NSLog( @"Inconsistency: setting a non-NULL pointer on a VBO with no feature or a NULL pointer with features",  a2,  a3);
    }
    char v13 = *a4;
    if ((*a4 & 3) != 0)
    {
      glDisableVertexAttribArray(0);
      char v13 = *a4;
    }

    if ((v13 & 4) != 0)
    {
      glDisableVertexAttribArray(1u);
      char v13 = *a4;
      if ((*a4 & 8) == 0)
      {
LABEL_12:
        if ((v13 & 0x10) == 0) {
          goto LABEL_13;
        }
        goto LABEL_18;
      }
    }

    else if ((v13 & 8) == 0)
    {
      goto LABEL_12;
    }

    glDisableVertexAttribArray(2u);
    char v13 = *a4;
    if ((*a4 & 0x10) == 0)
    {
LABEL_13:
      if ((v13 & 0x20) == 0)
      {
LABEL_15:
        *a4 = 0;
        return;
      }

- (void)setStaticVBOVertex2DPointer:(id *)a3
{
}

- (void)setStaticVBOVertex2DTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertex2DColorPointer:(id *)a3
{
}

- (void)setStaticVBOVertex2DColorTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertex3DPointer:(id *)a3
{
}

- (void)setStaticVBOVertex3DTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertex3DColorTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertex3DNormalPointer:(id *)a3
{
}

- (void)setStaticVBOVertex3DNormalTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertexTexturePointer:(id *)a3
{
}

- (void)setStaticVBOVertexNormalPointer:(id *)a3
{
}

- (void)setStaticVBOVertexNormalTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertex2DPointer:(id *)a3
{
}

- (void)setDynamicVBOVertex2DTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertex2DColorPointer:(id *)a3
{
}

- (void)setDynamicVBOVertex2DColorTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertex3DPointer:(id *)a3
{
}

- (void)setDynamicVBOVertex3DTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertex3DColorTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertex3DNormalPointer:(id *)a3
{
}

- (void)setDynamicVBOVertex3DNormalTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertexTexturePointer:(id *)a3
{
}

- (void)setDynamicVBOVertexNormalPointer:(id *)a3
{
}

- (void)setDynamicVBOVertexNormalTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex2DPointer:(id *)a3
{
}

- (void)setStreamVBOVertex2DTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex2DColorPointer:(id *)a3
{
}

- (void)setStreamVBOVertex2DColorTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DPointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DColorTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DNormalPointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DNormalTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertex3DNormalTexture01Pointer:(id *)a3
{
}

- (void)setStreamVBOVertexTexturePointer:(id *)a3
{
}

- (void)setStreamVBOVertexNormalPointer:(id *)a3
{
}

- (void)setStreamVBOVertexNormalTexturePointer:(id *)a3
{
}

- (void)makeRectangularIndexedTriangleStripWithWidth:(unint64_t)a3 andHeight:(unint64_t)a4
{
}

- (void)makeGenericThenRectangularIndexedTriangleStripStartingAtIndex:(unint64_t)a3 withWidth:(unint64_t)a4 andHeight:(unint64_t)a5
{
  p_unsigned int indexBuffer = &self->_indexBuffer;
  unsigned int indexBuffer = self->_indexBuffer;
  self->_type = 1;
  if (!indexBuffer)
  {
    glGenBuffers(1, p_indexBuffer);
    glBindBuffer(0x8893u, *p_indexBuffer);
  }

  unint64_t v11 = (2 * a4 + 2) * (a5 - 1);
  if (a3)
  {
    self->_countOfIndices = v11 + a3;
    BOOL v12 = calloc(v11 + a3, 2uLL);
    uint64_t v13 = 0LL;
    uint64_t v14 = v12 + 2;
    do
    {
      *(v14 - 2) = v13++;
      ++v14;
    }

    while (a3 != v13);
    *(v14 - 2) = a3 - 1;
    *(v14 - 1) = a3;
    if (a5 == 1) {
      goto LABEL_17;
    }
  }

  else
  {
    self->_countOfIndices = v11 - 2;
    BOOL v12 = calloc(v11 - 2, 2uLL);
    uint64_t v14 = v12;
    if (a5 == 1) {
      goto LABEL_17;
    }
  }

  unint64_t v15 = 0LL;
  __int16 v16 = a3;
  do
  {
    if (a4)
    {
      uint64_t v17 = 0LL;
      do
      {
        *uint64_t v14 = v16 + v17;
        uint64_t v18 = v14 + 2;
        v14[1] = a4 + v16 + v17++;
        v14 += 2;
      }

      while (a4 != v17);
      uint64_t v14 = v18;
    }

    if (v15 < a5 - 2)
    {
      __int16 v19 = a3 + v15 * a4 + a4;
      *uint64_t v14 = v19 + a4 - 1;
      v14[1] = v19;
      v14 += 2;
    }

    ++v15;
    v16 += a4;
  }

  while (v15 != a5 - 1);
LABEL_17:
  glBufferData(0x8893u, 4 * LODWORD(self->_countOfIndices), v12, 0x88E4u);
  free(v12);
}

- (void)makeTriangles
{
  self->_type = 2;
}

- (void)makeTriangleStrip
{
  self->_type = 3;
}

- (void)makeQuads
{
  p_unsigned int indexBuffer = &self->_indexBuffer;
  unsigned int indexBuffer = self->_indexBuffer;
  self->_type = 4;
  if (!indexBuffer)
  {
    glGenBuffers(1, p_indexBuffer);
    glBindBuffer(0x8893u, *p_indexBuffer);
  }

  unint64_t v5 = ((3 * self->_countOfVertices) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
  self->_countOfIndices = v5;
  v6 = (char *)calloc(v5, 2uLL);
  v7 = v6;
  unint64_t countOfVertices = self->_countOfVertices;
  if (countOfVertices >= 4)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = countOfVertices >> 2;
    unint64_t v11 = v6;
    do
    {
      *(_WORD *)unint64_t v11 = v9;
      int16x4_t v12 = (int16x4_t)vorr_s8((int8x8_t)vdup_n_s32(v9), (int8x8_t)0x200000001LL);
      *(int16x4_t *)(v11 + 2) = vuzp1_s16(v12, v12);
      __int16 v13 = v9 | 3;
      v9 += 4LL;
      *((_WORD *)v11 + 5) = v13;
      v11 += 12;
      --v10;
    }

    while (v10);
  }

  glBufferData(0x8893u, 4 * LODWORD(self->_countOfIndices), v6, 0x88E4u);
  free(v7);
}

- (void)draw
{
  switch(self->_type)
  {
    case 1:
      -[MRContext drawIndexedTriangleStrip:count:]( self->_context,  "drawIndexedTriangleStrip:count:",  0LL,  self->_countOfIndices);
      break;
    case 2:
      context = self->_context;
      unint64_t countOfVertices = self->_countOfVertices;
      goto LABEL_7;
    case 3:
      -[MRContext drawTriangleStripFromOffset:count:]( self->_context,  "drawTriangleStripFromOffset:count:",  0LL,  self->_countOfVertices);
      break;
    case 4:
      context = self->_context;
      unint64_t countOfVertices = self->_countOfIndices;
LABEL_7:
      -[MRContext drawTrianglesFromOffset:count:](context, "drawTrianglesFromOffset:count:", 0LL, countOfVertices);
      break;
    default:
      NSLog(@"Unsupported mesh type", a2);
      break;
  }

@end