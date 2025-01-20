@interface _ADRapportProximityObservationMutation
- (BOOL)isDirty;
- (_ADRapportProximityObservationMutation)initWithBase:(id)a3;
- (id)getDeviceIDPair;
- (id)getObservationDate;
- (int)getProximity;
- (void)setDeviceIDPair:(id)a3;
- (void)setObservationDate:(id)a3;
- (void)setProximity:(int)a3;
@end

@implementation _ADRapportProximityObservationMutation

- (_ADRapportProximityObservationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADRapportProximityObservationMutation;
  v6 = -[_ADRapportProximityObservationMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getDeviceIDPair
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_deviceIDPair;
  }
  else {
    v2 = (NSSet *)objc_claimAutoreleasedReturnValue(-[ADRapportProximityObservation deviceIDPair](self->_base, "deviceIDPair"));
  }
  return v2;
}

- (void)setDeviceIDPair:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int)getProximity
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    return self->_proximity;
  }
  else {
    return -[ADRapportProximityObservation proximity](self->_base, "proximity");
  }
}

- (void)setProximity:(int)a3
{
  self->_proximity = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getObservationDate
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_observationDate;
  }
  else {
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADRapportProximityObservation observationDate](self->_base, "observationDate"));
  }
  return v2;
}

- (void)setObservationDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
}

@end