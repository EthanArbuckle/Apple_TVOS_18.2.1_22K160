@interface GTMTLTextureRenderEncoder
- (GTMTLTextureRenderEncoder)initWithDevice:(id)a3;
- (MTLDevice)device;
- (NSArray)commands;
- (void)drawOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5;
- (void)drawTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5;
- (void)reset;
- (void)resetCommand;
- (void)setAnchor:(CGPoint)a3;
- (void)setBounds:(CGRect)a3 contentsScale:(double)a4;
- (void)setTransform:(CATransform3D *)a3;
- (void)submitCommand;
@end

@implementation GTMTLTextureRenderEncoder

- (GTMTLTextureRenderEncoder)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTMTLTextureRenderEncoder;
  v6 = -[GTMTLTextureRenderEncoder init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    commands = v7->_commands;
    v7->_commands = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___GTMTLTextureRenderEncoderCommand);
    currentCommand = v7->_currentCommand;
    v7->_currentCommand = v10;
  }

  return v7;
}

- (void)submitCommand
{
}

- (void)resetCommand
{
  v3 = (GTMTLTextureRenderEncoderCommand *)-[GTMTLTextureRenderEncoderCommand copy](self->_currentCommand, "copy");
  currentCommand = self->_currentCommand;
  self->_currentCommand = v3;

  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", 0LL);
}

- (void)setBounds:(CGRect)a3 contentsScale:(double)a4
{
}

- (void)setAnchor:(CGPoint)a3
{
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  __int128 v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  __int128 v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  __int128 v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  -[GTMTLTextureRenderEncoderCommand setTransform:](self->_currentCommand, "setTransform:", v7);
}

- (void)drawTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", a3);
  -[GTMTLTextureRenderEncoderCommand setDepthStencil:](self->_currentCommand, "setDepthStencil:", v6);
  -[GTMTLTextureRenderEncoderCommand setOverlay:](self->_currentCommand, "setOverlay:", 0LL);
  -[GTMTLTextureRenderEncoderCommand setShrinkToFit:](self->_currentCommand, "setShrinkToFit:", v5);
  -[GTMTLTextureRenderEncoder submitCommand](self, "submitCommand");
}

- (void)drawOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", a3);
  -[GTMTLTextureRenderEncoderCommand setDepthStencil:](self->_currentCommand, "setDepthStencil:", 0LL);
  -[GTMTLTextureRenderEncoderCommand setOverlay:](self->_currentCommand, "setOverlay:", 1LL);
  -[GTMTLTextureRenderEncoderCommand setRgb:](self->_currentCommand, "setRgb:", v6);
  -[GTMTLTextureRenderEncoderCommand setShrinkToFit:](self->_currentCommand, "setShrinkToFit:", v5);
  -[GTMTLTextureRenderEncoder submitCommand](self, "submitCommand");
}

- (void)reset
{
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)commands
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end