@interface _NSOwningMappingObservation
- (void)setObservation:(id)a3;
@end

@implementation _NSOwningMappingObservation

- (void)setObservation:(id)a3
{
  ownedObservation = self->_ownedObservation;
  if (ownedObservation != a3)
  {

    self->_ownedObservation = (NSObservation *)a3;
    -[NSObservable setObservation:](self->super._LHSobservable, "setObservation:", self);
  }

@end