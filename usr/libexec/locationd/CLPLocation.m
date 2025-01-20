@interface CLPLocation
- (CLPLocation)initWithDaemonLocation:(CLDaemonLocation *)a3 rawMotionActivity:(CLMotionActivity *)a4 motionActivity:(double)a5 dominantMotionActivity:(int)a6 vehicleConnected:(int)a7 vehicleConnectionStateChanged:(id)a8;
- (id)initWithDaemonLocation:(CLDaemonLocation *)a3;
@end

@implementation CLPLocation

- (id)initWithDaemonLocation:(CLDaemonLocation *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLPLocation;
  v4 = -[CLPLocation init](&v15, "init");
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (HIDWORD(a3->rawCourse) == 1)
  {
    -[CLPLocation setLatitude:](v4, "setLatitude:", *(double *)(&a3->suitability + 1));
    v6 = (double *)((char *)&a3->coordinate.latitude + 4);
LABEL_6:
    -[CLPLocation setLongitude:](v5, "setLongitude:", *v6);
    goto LABEL_7;
  }

  if (a3->floor == 1)
  {
    -[CLPLocation setLatitude:](v4, "setLatitude:", *(double *)((char *)&a3->lifespan + 4));
    v6 = (double *)(&a3->type + 1);
    goto LABEL_6;
  }

- (CLPLocation)initWithDaemonLocation:(CLDaemonLocation *)a3 rawMotionActivity:(CLMotionActivity *)a4 motionActivity:(double)a5 dominantMotionActivity:(int)a6 vehicleConnected:(int)a7 vehicleConnectionStateChanged:(id)a8
{
  uint64_t v13 = *(void *)&a9;
  uint64_t v14 = *(void *)&a8;
  uint64_t v15 = *(void *)&a7;
  uint64_t v16 = *(void *)&a6;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  v56[6] = *(_OWORD *)&a3->lifespan;
  v56[7] = rawCoordinate;
  v57[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v57 + 12) = *(_OWORD *)&a3->integrity;
  __int128 v19 = *(_OWORD *)&a3->speed;
  v56[2] = *(_OWORD *)&a3->altitude;
  v56[3] = v19;
  __int128 v20 = *(_OWORD *)&a3->timestamp;
  v56[4] = *(_OWORD *)&a3->course;
  v56[5] = v20;
  __int128 v21 = *(_OWORD *)&a3->coordinate.longitude;
  v56[0] = *(_OWORD *)&a3->suitability;
  v56[1] = v21;
  v22 = -[CLPLocation initWithDaemonLocation:](self, "initWithDaemonLocation:", v56);
  if (v22)
  {
    v23 = objc_alloc(&OBJC_CLASS___CLPMotionActivity);
    __int128 v24 = *(_OWORD *)&a4[1].isStanding;
    v54[6] = *(_OWORD *)&a4[1].mountedConfidence;
    v54[7] = v24;
    uint64_t v55 = *(void *)&a4[1].isVehicleConnected;
    __int128 v25 = *(_OWORD *)&a4->isVehicleConnected;
    v54[2] = *(_OWORD *)&a4->isStanding;
    v54[3] = v25;
    __int128 v26 = *(_OWORD *)&a4[1].type;
    v54[4] = *(_OWORD *)&a4->vehicleType;
    v54[5] = v26;
    __int128 v27 = *(_OWORD *)&a4->mountedConfidence;
    v54[0] = *(_OWORD *)&a4->type;
    v54[1] = v27;
    v28 = -[CLPMotionActivity initWithCLMotionActivity:](v23, "initWithCLMotionActivity:", v54);
    -[CLPLocation setRawMotionActivity:](v22, "setRawMotionActivity:", v28);

    v29 = objc_alloc(&OBJC_CLASS___CLPMotionActivity);
    __int128 v30 = *(_OWORD *)(v16 + 112);
    v52[6] = *(_OWORD *)(v16 + 96);
    v52[7] = v30;
    uint64_t v53 = *(void *)(v16 + 128);
    __int128 v31 = *(_OWORD *)(v16 + 48);
    v52[2] = *(_OWORD *)(v16 + 32);
    v52[3] = v31;
    __int128 v32 = *(_OWORD *)(v16 + 80);
    v52[4] = *(_OWORD *)(v16 + 64);
    v52[5] = v32;
    __int128 v33 = *(_OWORD *)(v16 + 16);
    v52[0] = *(_OWORD *)v16;
    v52[1] = v33;
    v34 = -[CLPMotionActivity initWithCLMotionActivity:](v29, "initWithCLMotionActivity:", v52);
    -[CLPLocation setMotionActivity:](v22, "setMotionActivity:", v34);

    v35 = objc_alloc(&OBJC_CLASS___CLPMotionActivity);
    __int128 v36 = *(_OWORD *)(v15 + 112);
    v50[6] = *(_OWORD *)(v15 + 96);
    v50[7] = v36;
    uint64_t v51 = *(void *)(v15 + 128);
    __int128 v37 = *(_OWORD *)(v15 + 48);
    v50[2] = *(_OWORD *)(v15 + 32);
    v50[3] = v37;
    __int128 v38 = *(_OWORD *)(v15 + 80);
    v50[4] = *(_OWORD *)(v15 + 64);
    v50[5] = v38;
    __int128 v39 = *(_OWORD *)(v15 + 16);
    v50[0] = *(_OWORD *)v15;
    v50[1] = v39;
    v40 = -[CLPMotionActivity initWithCLMotionActivity:](v35, "initWithCLMotionActivity:", v50);
    -[CLPLocation setDominantMotionActivity:](v22, "setDominantMotionActivity:", v40);

    -[CLPLocation setMotionVehicleConnected:](v22, "setMotionVehicleConnected:", v14);
    -[CLPLocation setMotionVehicleConnectedStateChanged:](v22, "setMotionVehicleConnectedStateChanged:", v13);
    v41 = objc_alloc(&OBJC_CLASS___CLPVehicleType);
    __int128 v42 = *(_OWORD *)(v16 + 112);
    v48[6] = *(_OWORD *)(v16 + 96);
    v48[7] = v42;
    uint64_t v49 = *(void *)(v16 + 128);
    __int128 v43 = *(_OWORD *)(v16 + 48);
    v48[2] = *(_OWORD *)(v16 + 32);
    v48[3] = v43;
    __int128 v44 = *(_OWORD *)(v16 + 80);
    v48[4] = *(_OWORD *)(v16 + 64);
    v48[5] = v44;
    __int128 v45 = *(_OWORD *)(v16 + 16);
    v48[0] = *(_OWORD *)v16;
    v48[1] = v45;
    v46 = -[CLPVehicleType initWithCLMotionActivity:](v41, "initWithCLMotionActivity:", v48);
    -[CLPLocation setVehicleType:](v22, "setVehicleType:", v46);
  }

  return v22;
}

@end