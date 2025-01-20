@interface MRShader
- (BOOL)caresAboutForeColor;
- (BOOL)caresAboutNormal;
- (BOOL)textureUnitsAreBound;
- (MRContext)useContext;
- (MRShader)initWithShaderID:(id)a3 shaderKey:(id)a4 description:(id)a5 vertexShader:(unsigned int)a6 andFragmentShader:(unsigned int)a7 inContext:(id)a8;
- (NSString)shaderID;
- (NSString)shaderKey;
- (int)_locationForUniform:(id)a3;
- (int)locationForAttribute:(id)a3;
- (unsigned)program;
- (void)dealloc;
- (void)setForeColor:(const float *)a3;
- (void)setModelViewProjectionMatrix:(float)a3[16];
- (void)setNormal:(float)a3 :(float)a4 :(float)a5;
- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4;
- (void)setTextureUnitsAreBound:(BOOL)a3;
- (void)setUniform:(id)a3 forKey:(id)a4;
- (void)setUniformFloat:(float)a3 forKey:(id)a4;
- (void)setUniformInt:(int)a3 forKey:(id)a4;
- (void)setUniformMat3:(float)a3[16] forKey:(id)a4;
- (void)setUniformMat4:(float)a3[16] forKey:(id)a4;
- (void)setUniformVec2:(float)a3 :(float)a4 forKey:(id)a5;
- (void)setUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6;
- (void)setUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7;
- (void)setUseContext:(id)a3;
@end

@implementation MRShader

- (MRShader)initWithShaderID:(id)a3 shaderKey:(id)a4 description:(id)a5 vertexShader:(unsigned int)a6 andFragmentShader:(unsigned int)a7 inContext:(id)a8
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRShader;
  v14 = -[MRShader init](&v20, "init");
  if (v14)
  {
    *((void *)v14 + 1) = a3;
    *((void *)v14 + 2) = a4;
    *((void *)v14 + 3) = a5;
    *((void *)v14 + 4) = a8;
    *((_DWORD *)v14 + 11) = a6;
    *((_DWORD *)v14 + 12) = a7;
    GLuint Program = glCreateProgram();
    *((_DWORD *)v14 + 10) = Program;
    GLuint v16 = *((_DWORD *)v14 + 11);
    if (v16)
    {
      glAttachShader(Program, v16);
      GLuint Program = *((_DWORD *)v14 + 10);
    }

    GLuint v17 = *((_DWORD *)v14 + 12);
    if (v17)
    {
      glAttachShader(Program, v17);
      GLuint Program = *((_DWORD *)v14 + 10);
    }

    glBindAttribLocation(Program, 0, "aVertex");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 1u, "aColor");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 2u, "aNormal");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 3u, "aTextureCoordinates0");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 4u, "aTextureCoordinates1");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 5u, "aTextureCoordinates2");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 6u, "aTextureCoordinates3");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 7u, "aInSpriteCoordinates");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 8u, "aAttributes");
    objc_msgSend( *((id *)v14 + 57),  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8),  @"aAttributes");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 9u, "aParameter");
    objc_msgSend( *((id *)v14 + 57),  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9),  @"aParameter");
    glLinkProgram(*((_DWORD *)v14 + 10));
    *((_DWORD *)v14 + 107) = -2;
    *((void *)v14 + 54) = 0x100000001LL;
    *(void *)&__int128 v18 = 0x100000001LL;
    *((void *)&v18 + 1) = 0x100000001LL;
    *(_OWORD *)(v14 + 412) = v18;
    *((void *)v14 + 55) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *((void *)v14 + 57) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *((void *)v14 + 56) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return (MRShader *)v14;
}

- (void)dealloc
{
  v3 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  v4 = v3;
  if (v3 != -[MRContext glContext](self->mContext, "glContext")) {
    +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mContext, "glContext"));
  }
  GLuint mVertexShader = self->mVertexShader;
  if (mVertexShader)
  {
    glDetachShader(self->mProgram, mVertexShader);
    self->GLuint mVertexShader = 0;
  }

  GLuint mFragmentShader = self->mFragmentShader;
  if (mFragmentShader)
  {
    glDetachShader(self->mProgram, mFragmentShader);
    self->GLuint mFragmentShader = 0;
  }

  glDeleteProgram(self->mProgram);
  self->mGLuint Program = 0;
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v3) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v3);
  }

  self->mShaderID = 0LL;
  self->mShaderKey = 0LL;

  self->mDescription = 0LL;
  self->mContext = 0LL;

  self->mUniformLocations = 0LL;
  self->mAttributeLocations = 0LL;

  self->mUniforms = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRShader;
  -[MRShader dealloc](&v7, "dealloc");
}

- (MRContext)useContext
{
  return self->mUseContext;
}

- (void)setUseContext:(id)a3
{
  if (self->mUseContext != a3)
  {
    self->mUseContext = (MRContext *)a3;
    self->mModelViewProjectionMatrix[0] = -1.0e37;
    self->mNormal[0] = -1.0e37;
    self->mTextureMatrix[3][0] = -1.0e37;
    self->mTextureMatrix[2][0] = -1.0e37;
    self->mTextureMatrix[1][0] = -1.0e37;
    self->mTextureMatrix[0][0] = -1.0e37;
    self->mForeColor[0] = -1.0e37;
  }

- (void)setModelViewProjectionMatrix:(float)a3[16]
{
  uint64_t v4 = 0LL;
  mModelViewProjectionMatrix = self->mModelViewProjectionMatrix;
  while (mModelViewProjectionMatrix[v4] == a3[v4])
  {
    if (++v4 == 16) {
      return;
    }
  }

  __int128 v6 = *(_OWORD *)a3;
  __int128 v7 = *((_OWORD *)a3 + 1);
  __int128 v8 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->mModelViewProjectionMatrix[8] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->mModelViewProjectionMatrix[12] = v8;
  *(_OWORD *)mModelViewProjectionMatrix = v6;
  *(_OWORD *)&self->mModelViewProjectionMatrix[4] = v7;
  int mModelViewProjectionMatrixLocation = self->mModelViewProjectionMatrixLocation;
  if (mModelViewProjectionMatrixLocation == -2)
  {
    int mModelViewProjectionMatrixLocation = glGetUniformLocation(self->mProgram, "uModelViewProjectionMatrix");
    self->int mModelViewProjectionMatrixLocation = mModelViewProjectionMatrixLocation;
  }

  glUniformMatrix4fv(mModelViewProjectionMatrixLocation, 1, 0, mModelViewProjectionMatrix);
}

- (BOOL)caresAboutNormal
{
  int mNormalLocation = self->mNormalLocation;
  if (mNormalLocation == -2)
  {
    int mNormalLocation = glGetUniformLocation(self->mProgram, "uNormal");
    self->int mNormalLocation = mNormalLocation;
  }

  return mNormalLocation >= 0;
}

- (void)setNormal:(float)a3 :(float)a4 :(float)a5
{
  mNormal = self->mNormal;
  if (self->mNormal[0] != a3 || self->mNormal[1] != a4 || self->mNormal[2] != a5)
  {
    self->mNormal[0] = a3;
    self->mNormal[1] = a4;
    self->mNormal[2] = a5;
    int mNormalLocation = self->mNormalLocation;
    if (mNormalLocation == -2)
    {
      int mNormalLocation = glGetUniformLocation(self->mProgram, "uNormal");
      self->int mNormalLocation = mNormalLocation;
    }

    if ((mNormalLocation & 0x80000000) == 0) {
      glUniform3fv(mNormalLocation, 1, mNormal);
    }
  }

- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4
{
  uint64_t v5 = 0LL;
  __int128 v6 = self->mTextureMatrix[a4];
  while (v6[v5] == a3[v5])
  {
    if (++v5 == 16) {
      return;
    }
  }

  __int128 v7 = *(_OWORD *)a3;
  __int128 v8 = *((_OWORD *)a3 + 1);
  __int128 v9 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->mTextureMatrix[a4][8] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->mTextureMatrix[a4][12] = v9;
  *(_OWORD *)__int128 v6 = v7;
  *(_OWORD *)&self->mTextureMatrix[a4][4] = v8;
  mTextureMatrixLocation = self->mTextureMatrixLocation;
  GLint UniformLocation = self->mTextureMatrixLocation[a4];
  if (UniformLocation == -2)
  {
    GLint UniformLocation = glGetUniformLocation(self->mProgram, off_24E408[a4]);
    mTextureMatrixLocation[a4] = UniformLocation;
  }

  if ((UniformLocation & 0x80000000) == 0) {
    glUniformMatrix4fv(UniformLocation, 1, 0, v6);
  }
}

- (BOOL)caresAboutForeColor
{
  int mForeColorLocation = self->mForeColorLocation;
  if (mForeColorLocation == -2)
  {
    int mForeColorLocation = glGetUniformLocation(self->mProgram, "uColor");
    self->int mForeColorLocation = mForeColorLocation;
  }

  return mForeColorLocation >= 0;
}

- (void)setForeColor:(const float *)a3
{
  uint64_t v4 = 0LL;
  mForeColor = self->mForeColor;
  while (mForeColor[v4] == a3[v4])
  {
    if (++v4 == 4) {
      return;
    }
  }

  *(_OWORD *)mForeColor = *(_OWORD *)a3;
  int mForeColorLocation = self->mForeColorLocation;
  if (mForeColorLocation == -2)
  {
    int mForeColorLocation = glGetUniformLocation(self->mProgram, "uColor");
    self->int mForeColorLocation = mForeColorLocation;
  }

  if ((mForeColorLocation & 0x80000000) == 0) {
    glUniform4fv(mForeColorLocation, 1, mForeColor);
  }
}

- (int)_locationForUniform:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mUniformLocations, "objectForKey:");
  if (v5) {
    return [v5 intValue];
  }
  uint64_t UniformLocation = glGetUniformLocation(self->mProgram, (const GLchar *)[a3 UTF8String]);
  int v8 = UniformLocation;
  -[NSMutableDictionary setObject:forKey:]( self->mUniformLocations,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", UniformLocation),  a3);
  return v8;
}

- (void)setUniformInt:(int)a3 forKey:(id)a4
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (__int128 v7 = -[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a4)) == 0LL
    || v7[10] != a3)
  {
    int v8 = -[MRUniform initWithI:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithI:", a3);
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v8, a4);

    GLint v9 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a4);
    if ((v9 & 0x80000000) == 0) {
      glUniform1i(v9, a3);
    }
  }

- (void)setUniformFloat:(float)a3 forKey:(id)a4
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (__int128 v7 = (float *)-[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a4)) == 0LL
    || v7[4] != a3)
  {
    int v8 = -[MRUniform initWithFloat:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithFloat:", a3);
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v8, a4);

    GLint v9 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a4);
    if ((v9 & 0x80000000) == 0) {
      glUniform1f(v9, a3);
    }
  }

- (void)setUniformVec2:(float)a3 :(float)a4 forKey:(id)a5
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v9 = (float *)-[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a5)) == 0LL
    || v9[4] != a3
    || v9[5] != a4)
  {
    v10 = -[MRUniform initWithVec2::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec2::", a3, a4);
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v10, a5);

    GLint v11 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a5);
    if ((v11 & 0x80000000) == 0) {
      glUniform2f(v11, a3, a4);
    }
  }

- (void)setUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v11 = (float *)-[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a6)) == 0LL
    || v11[4] != a3
    || v11[5] != a4
    || v11[6] != a5)
  {
    v12 = -[MRUniform initWithVec3:::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec3:::", a3, a4, a5);
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v12, a6);

    GLint v13 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a6);
    if ((v13 & 0x80000000) == 0) {
      glUniform3f(v13, a3, a4, a5);
    }
  }

- (void)setUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v13 = (float *)-[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a7)) == 0LL
    || v13[4] != a3
    || v13[5] != a4
    || v13[6] != a5
    || v13[7] != a6)
  {
    v14 = -[MRUniform initWithVec4::::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec4::::", a3, a4, a5, a6);
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v14, a7);

    GLint v15 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a7);
    if ((v15 & 0x80000000) == 0) {
      glUniform4f(v15, a3, a4, a5, a6);
    }
  }

- (void)setUniformMat3:(float)a3[16] forKey:(id)a4
{
  __int128 v6 = -[MRUniform initWithMat4ForMat3:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithMat4ForMat3:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v6, a4);

  GLint v7 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a4);
  if ((v7 & 0x80000000) == 0) {
    glUniformMatrix3fv(v7, 1, 0, v6->m);
  }
}

- (void)setUniformMat4:(float)a3[16] forKey:(id)a4
{
  __int128 v6 = -[MRUniform initWithMat4:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithMat4:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", v6, a4);

  GLint v7 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a4);
  if ((v7 & 0x80000000) == 0) {
    glUniformMatrix4fv(v7, 1, 0, v6->m);
  }
}

- (void)setUniform:(id)a3 forKey:(id)a4
{
  GLint v7 = (char *)-[NSMutableDictionary objectForKey:](self->mUniforms, "objectForKey:", a4);
  if (v7) {
    BOOL v8 = v7 == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v7 == a3) {
      return;
    }
    goto LABEL_13;
  }

  uint64_t v9 = *((void *)v7 + 11);
  if (v9 != *((void *)a3 + 11) || *((void *)v7 + 10) != *((void *)a3 + 10))
  {
LABEL_13:
    -[NSMutableDictionary setObject:forKey:](self->mUniforms, "setObject:forKey:", a3, a4);
    GLint v13 = -[MRShader _locationForUniform:](self, "_locationForUniform:", a4);
    if ((v13 & 0x80000000) == 0)
    {
      switch(*((void *)a3 + 11))
      {
        case 0LL:
          glUniform1i(v13, *((_DWORD *)a3 + 20));
          break;
        case 1LL:
          glUniform1f(v13, *((GLfloat *)a3 + 4));
          break;
        case 2LL:
          glUniform2fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 3LL:
          glUniform3fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 4LL:
          glUniform4fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 9LL:
          glUniformMatrix3fv(v13, 1, 0, (const GLfloat *)a3 + 4);
          break;
        case 0x10LL:
          glUniformMatrix4fv(v13, 1, 0, (const GLfloat *)a3 + 4);
          break;
        default:
          return;
      }
    }

    return;
  }

  v10 = (float *)a3;
  while (v9)
  {
    float v11 = *((float *)v7 + 4);
    float v12 = v10[4];
    --v9;
    ++v10;
    v7 += 4;
    if (v11 != v12) {
      goto LABEL_13;
    }
  }

- (int)locationForAttribute:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mAttributeLocations, "objectForKey:");
  if (v5) {
    return [v5 intValue];
  }
  uint64_t AttribLocation = glGetAttribLocation(self->mProgram, (const GLchar *)[a3 UTF8String]);
  int v8 = AttribLocation;
  -[NSMutableDictionary setObject:forKey:]( self->mAttributeLocations,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", AttribLocation),  a3);
  return v8;
}

- (NSString)shaderID
{
  return self->mShaderID;
}

- (NSString)shaderKey
{
  return self->mShaderKey;
}

- (unsigned)program
{
  return self->mProgram;
}

- (BOOL)textureUnitsAreBound
{
  return self->mTextureUnitsAreBound;
}

- (void)setTextureUnitsAreBound:(BOOL)a3
{
  self->mTextureUnitsAreBound = a3;
}

@end