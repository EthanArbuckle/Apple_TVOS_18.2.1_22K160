@interface GCHapticMotor
+ (BOOL)supportsSecureCoding;
- (GCHapticMotor)init;
- (GCHapticMotor)initWithCoder:(id)a3;
- (GCHapticMotor)initWithIndex:(int)a3;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5;
- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5 frequency:(float)a6 amplitude:(float)a7;
- (NSMutableArray)queuedTransients;
- (NSString)name;
- (float)amplitude;
- (float)frequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (unint64_t)features;
- (void)applyValuesFrom:(id)a3;
- (void)drainQueuedTransients;
- (void)encodeWithCoder:(id)a3;
- (void)enqueueHapticTransientEvent:(id)a3;
- (void)setAmplitude:(float)a3;
- (void)setFrequency:(float)a3;
- (void)setQueuedTransients:(id)a3;
@end

@implementation GCHapticMotor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5 frequency:(float)a6 amplitude:(float)a7
{
  id v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GCHapticMotor;
  v14 = -[GCHapticMotor init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    v14->_index = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_features = a5;
    v15->_frequency = a6;
    v15->_amplitude = a7;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    queuedTransients = v15->_queuedTransients;
    v15->_queuedTransients = (NSMutableArray *)v16;
  }

  return v15;
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4 features:(unint64_t)a5
{
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  return -[GCHapticMotor initWithIndex:name:features:frequency:amplitude:]( self,  "initWithIndex:name:features:frequency:amplitude:",  *(void *)&a3,  a4,  a5,  v5,  v6);
}

- (GCHapticMotor)initWithIndex:(int)a3 name:(id)a4
{
  return -[GCHapticMotor initWithIndex:name:features:](self, "initWithIndex:name:features:", *(void *)&a3, a4, 0LL);
}

- (GCHapticMotor)initWithIndex:(int)a3
{
  return -[GCHapticMotor initWithIndex:name:features:](self, "initWithIndex:name:features:", *(void *)&a3, 0LL, 0LL);
}

- (GCHapticMotor)init
{
  return -[GCHapticMotor initWithIndex:](self, "initWithIndex:", 0LL);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t index = self->_index;
  id v7 = a3;
  [v7 encodeInteger:index forKey:@"_index"];
  [v7 encodeObject:self->_name forKey:@"_name"];
  [v7 encodeInteger:self->_features forKey:@"_features"];
  *(float *)&double v5 = self->_frequency;
  [v7 encodeFloat:@"_frequency" forKey:v5];
  *(float *)&double v6 = self->_amplitude;
  [v7 encodeFloat:@"_amplitude" forKey:v6];
}

- (GCHapticMotor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"_index"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_name"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v4 decodeIntegerForKey:@"_features"];
  [v4 decodeFloatForKey:@"_frequency"];
  int v10 = v9;
  [v4 decodeFloatForKey:@"_amplitude"];
  int v12 = v11;

  LODWORD(v13) = v10;
  LODWORD(v14) = v12;
  v15 = -[GCHapticMotor initWithIndex:name:features:frequency:amplitude:]( self,  "initWithIndex:name:features:frequency:amplitude:",  v5,  v7,  v8,  v13,  v14);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCHapticMotor name](self, "name"));
    id v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[3];
    v5[3] = v7;

    *((_DWORD *)v5 + 2) = -[GCHapticMotor index](self, "index");
    v5[4] = -[GCHapticMotor features](self, "features");
    -[GCHapticMotor frequency](self, "frequency");
    *((_DWORD *)v5 + 3) = v9;
    -[GCHapticMotor amplitude](self, "amplitude");
    *((_DWORD *)v5 + 4) = v10;
  }

  return v5;
}

- (void)applyValuesFrom:(id)a3
{
  id v4 = a3;
  [v4 frequency];
  -[GCHapticMotor setFrequency:](self, "setFrequency:");
  if ((-[GCHapticMotor features](self, "features") & 1) != 0)
  {
    [v4 amplitude];
    -[GCHapticMotor setAmplitude:](self, "setAmplitude:");
  }
}

- (void)enqueueHapticTransientEvent:(id)a3
{
  id v4 = a3;
  if ((-[GCHapticMotor features](self, "features") & 2) != 0
    && [v4 type] == (char *)&dword_0 + 1)
  {
    -[NSMutableArray addObject:](self->_queuedTransients, "addObject:", v4);
  }
}

- (void)drainQueuedTransients
{
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GCHapticMotor - %@(%d) f=%f a=%f",  self->_name,  self->_index,  self->_frequency,  self->_amplitude);
}

- (NSString)name
{
  return self->_name;
}

- (int)index
{
  return self->_index;
}

- (unint64_t)features
{
  return self->_features;
}

- (float)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(float)a3
{
  self->_frequency = a3;
}

- (float)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(float)a3
{
  self->_amplitude = a3;
}

- (NSMutableArray)queuedTransients
{
  return self->_queuedTransients;
}

- (void)setQueuedTransients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end