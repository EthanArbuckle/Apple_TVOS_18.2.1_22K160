@interface DYGTMTLCommandQueueInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeCaptured;
- (BOOL)isInternalQueue;
- (BOOL)isOpenGLQueue;
- (DYGTMTLCommandQueueInfo)initWithCoder:(id)a3;
- (NSString)label;
- (id)description;
- (unint64_t)deviceAddress;
- (unint64_t)deviceStreamRef;
- (unint64_t)queueAddress;
- (unint64_t)streamRef;
- (unint64_t)toolsDeviceAddress;
- (unint64_t)toolsQueueAddress;
- (void)encodeWithCoder:(id)a3;
- (void)setCanBeCaptured:(BOOL)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setDeviceStreamRef:(unint64_t)a3;
- (void)setIsInternalQueue:(BOOL)a3;
- (void)setIsOpenGLQueue:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setQueueAddress:(unint64_t)a3;
- (void)setStreamRef:(unint64_t)a3;
- (void)setToolsDeviceAddress:(unint64_t)a3;
- (void)setToolsQueueAddress:(unint64_t)a3;
@end

@implementation DYGTMTLCommandQueueInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLCommandQueueInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DYGTMTLCommandQueueInfo;
  v5 = -[DYGTMTLCommandQueueInfo init](&v12, "init");
  if (v5)
  {
    v5->_streamRef = (unint64_t)[v4 decodeInt64ForKey:@"streamRef"];
    v5->_deviceStreamRef = (unint64_t)[v4 decodeInt64ForKey:@"deviceStreamRef"];
    v5->_deviceAddress = (unint64_t)[v4 decodeInt64ForKey:@"deviceAddress"];
    v5->_toolsDeviceAddress = (unint64_t)[v4 decodeInt64ForKey:@"toolsDeviceAddress"];
    v5->_queueAddress = (unint64_t)[v4 decodeInt64ForKey:@"queueAddress"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"label"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    label = v5->_label;
    v5->_label = (NSString *)v7;

    else {
      unsigned __int8 v9 = 1;
    }
    v5->_canBeCaptured = v9;
    v5->_isOpenGLQueue = [v4 decodeBoolForKey:@"isOpenGLQueue"];
    v5->_isInternalQueue = [v4 decodeBoolForKey:@"isInternalQueue"];
    v5->_toolsQueueAddress = (unint64_t)[v4 decodeInt64ForKey:@"toolsQueueAddress"];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef = self->_streamRef;
  id v5 = a3;
  [v5 encodeInt64:streamRef forKey:@"streamRef"];
  [v5 encodeInt64:self->_deviceAddress forKey:@"deviceAddress"];
  [v5 encodeInt64:self->_deviceStreamRef forKey:@"deviceStreamRef"];
  [v5 encodeInt64:self->_toolsDeviceAddress forKey:@"toolsDeviceAddress"];
  [v5 encodeInt64:self->_queueAddress forKey:@"queueAddress"];
  [v5 encodeInt64:self->_toolsQueueAddress forKey:@"toolsQueueAddress"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeBool:self->_canBeCaptured forKey:@"canBeCaptured"];
  [v5 encodeBool:self->_isOpenGLQueue forKey:@"isOpenGLQueue"];
  [v5 encodeBool:self->_isInternalQueue forKey:@"isInternalQueue"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%llx -> %@",  self->_queueAddress,  self->_label);
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (unint64_t)toolsDeviceAddress
{
  return self->_toolsDeviceAddress;
}

- (void)setToolsDeviceAddress:(unint64_t)a3
{
  self->_toolsDeviceAddress = a3;
}

- (unint64_t)queueAddress
{
  return self->_queueAddress;
}

- (void)setQueueAddress:(unint64_t)a3
{
  self->_queueAddress = a3;
}

- (unint64_t)toolsQueueAddress
{
  return self->_toolsQueueAddress;
}

- (void)setToolsQueueAddress:(unint64_t)a3
{
  self->_toolsQueueAddress = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)canBeCaptured
{
  return self->_canBeCaptured;
}

- (void)setCanBeCaptured:(BOOL)a3
{
  self->_canBeCaptured = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_isOpenGLQueue;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_isOpenGLQueue = a3;
}

- (BOOL)isInternalQueue
{
  return self->_isInternalQueue;
}

- (void)setIsInternalQueue:(BOOL)a3
{
  self->_isInternalQueue = a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_unint64_t streamRef = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (void).cxx_destruct
{
}

@end