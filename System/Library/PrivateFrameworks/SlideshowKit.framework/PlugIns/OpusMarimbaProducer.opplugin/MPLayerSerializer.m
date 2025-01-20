@interface MPLayerSerializer
- (id)container;
- (id)description;
- (id)introTransition;
- (void)dealloc;
- (void)insertEffectContainers:(id)a3 atIndex:(int64_t)a4;
- (void)moveEffectContainersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeEffectContainersAtIndices:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setIntroTransition:(id)a3;
- (void)setLayerSerializer:(id)a3;
@end

@implementation MPLayerSerializer

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPLayerSerializer;
  id v3 = -[MPLayer description](&v6, "description");
  if (self->_layerSerializer) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  return [v3 stringByAppendingFormat:@"\t          Has Layer Serializer: %@\n", v4];
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPLayerSerializer;
  -[MPLayer cleanup](&v6, "cleanup");
  layerSerializer = self->_layerSerializer;
  if (layerSerializer) {

  }
  self->_layerSerializer = 0LL;
  introTransition = self->_introTransition;
  self->_introTransition = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPLayerSerializer;
  -[MPLayer dealloc](&v5, "dealloc");
}

- (id)introTransition
{
  return self->_introTransition;
}

- (void)setIntroTransition:(id)a3
{
  if (a3)
  {
    id v5 = -[MPLayer parentDocument](self, "parentDocument");
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
    {
      if (objc_msgSend(-[MPLayer effectContainers](self, "effectContainers"), "count"))
      {
        objc_msgSend( objc_msgSend(-[MPLayer effectContainers](self, "effectContainers"), "objectAtIndex:", 0),  "duration");
        double v7 = v6;
        [a3 duration];
        if (v8 > v7) {
          [a3 setDuration:v7];
        }
      }
    }
  }

  introTransition = self->_introTransition;
  if (introTransition)
  {
    -[MPTransition setParent:](introTransition, "setParent:", 0LL);
    v10 = self->_introTransition;
    if (v10)
    {

      self->_introTransition = 0LL;
    }
  }

  if (a3)
  {
    v11 = (MPTransition *)a3;
    self->_introTransition = v11;
    -[MPTransition setParent:](v11, "setParent:", self);
  }

  else
  {
    layerSerializer = self->_layerSerializer;
    if (layerSerializer)
    {
      -[MCContainerSerializer setInitialTransitionID:](layerSerializer, "setInitialTransitionID:", 0LL);
      -[MCContainerSerializer setInitialTransitionDuration:]( self->_layerSerializer,  "setInitialTransitionDuration:",  0.0);
      -[MCContainerSerializer setInitialTransitionAttributes:]( self->_layerSerializer,  "setInitialTransitionAttributes:",  0LL);
    }
  }

- (void)insertEffectContainers:(id)a3 atIndex:(int64_t)a4
{
  double v7 = objc_autoreleasePoolPush();
  if (-[MPLayer parentDocument](self, "parentDocument")) {
    objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "lock");
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = (int64_t)-[NSMutableArray count](self->super._effectContainers, "count");
  }
  double v8 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPLayerSerializer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v8,  @"effectContainers");
  -[MPLayer reconnectTransitionForEffectContainerAtIndex:](self, "reconnectTransitionForEffectContainerAtIndex:", a4);
  if (!self->super._effectContainers) {
    self->super._effectContainers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  -[NSLock lock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "lock");
  -[NSMutableArray insertObjects:atIndexes:](self->super._effectContainers, "insertObjects:atIndexes:", a3, v8);
  v33 = v8;
  if (-[MPLayer parent](self, "parent")
    && !objc_msgSend(-[MPLayer parent](self, "parent"), "autoAdjustDuration"))
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v18 = [a3 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * (void)i) setParentLayer:self];
        }

        id v19 = [a3 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }

      while (v19);
    }
  }

  else
  {
    -[MPLayer duration](self, "duration");
    double v10 = v9;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v11 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(a3);
          }
          v15 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
          [v15 setParentLayer:self];
          [v15 duration];
          double v10 = v10 + v16;
          if ([v15 transition])
          {
            objc_msgSend(objc_msgSend(v15, "transition"), "duration");
            double v10 = v10 - v17;
          }
        }

        id v12 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v12);
    }

    -[MPLayer setDuration:](self, "setDuration:", v10);
  }

  if (self->_layerSerializer)
  {
    v32 = v7;
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v23 = (char *)[a3 count];
    if ((uint64_t)v23 >= 1)
    {
      v24 = v23;
      do
      {
        -[NSMutableArray addObject:]( v22,  "addObject:",  -[MCMontage createParallelizerContainer](self->super._montage, "createParallelizerContainer"));
        --v24;
      }

      while (v24);
    }

    id v25 = -[MCContainerSerializer insertPlugsForContainers:atIndex:]( self->_layerSerializer,  "insertPlugsForContainers:atIndex:",  v22,  a4);
    -[MCContainerSerializer orderedPlugs](self->_layerSerializer, "orderedPlugs");
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = 0LL;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (k = 0LL; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(a3);
          }
          v31 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)k);
          objc_msgSend( v31,  "setContainerParallelizer:",  -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", (char *)k + v28));
          objc_msgSend(v31, "setContainerPlug:", objc_msgSend(v25, "objectAtIndex:", (char *)k + v28));
        }

        id v27 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
        v28 += (uint64_t)k;
      }

      while (v27);
    }

    double v7 = v32;
  }

  -[NSLock unlock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "unlock");
  -[MPLayerSerializer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v33,  @"effectContainers");
  if (-[MPLayer parentDocument](self, "parentDocument")) {
    objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "unlock");
  }

  objc_autoreleasePoolPop(v7);
}

- (void)removeEffectContainersAtIndices:(id)a3
{
  if (-[NSMutableArray count](self->super._effectContainers, "count"))
  {
    double v6 = objc_autoreleasePoolPush();
    if (-[MPLayer parentDocument](self, "parentDocument")) {
      objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "lock");
    }
    -[MPLayerSerializer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"effectContainers");
    layerSerializer = self->_layerSerializer;
    if (layerSerializer) {
      -[MCContainerSerializer removePlugsAtIndices:](layerSerializer, "removePlugsAtIndices:", a3);
    }
    -[NSLock lock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "lock");
    if (-[MPLayerInternal cleaningUp](self->super._internal, "cleaningUp")
      || -[MPLayer parent](self, "parent")
      && !objc_msgSend(-[MPLayer parent](self, "parent"), "autoAdjustDuration"))
    {
      int v9 = 0;
    }

    else
    {
      -[MPLayer duration](self, "duration");
      double v3 = v8;
      int v9 = 1;
    }

    id v10 = [a3 lastIndex];
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v10; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v12 = -[NSMutableArray objectAtIndex:](self->super._effectContainers, "objectAtIndex:", i);
        if (v9)
        {
          -[MPLayer reconnectTransitionForEffectContainerAtIndex:]( self,  "reconnectTransitionForEffectContainerAtIndex:",  i);
          [v12 duration];
          double v3 = v3 - v13;
          if ([v12 transition])
          {
            objc_msgSend(objc_msgSend(v12, "transition"), "duration");
            double v3 = v3 + v14;
          }
        }

        [v12 setParentLayer:0];
        [v12 setContainerParallelizer:0];
        [v12 setContainerPlug:0];
      }
    }

    -[NSMutableArray removeObjectsAtIndexes:](self->super._effectContainers, "removeObjectsAtIndexes:", a3);
    -[NSLock unlock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "unlock");
    if (v9)
    {
      double v15 = 0.0;
      if (v3 >= 0.0) {
        double v15 = v3;
      }
      -[MPLayer setDuration:](self, "setDuration:", v15);
    }

    -[MPLayerSerializer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"effectContainers");
    if (-[MPLayer parentDocument](self, "parentDocument")) {
      objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "unlock");
    }
    objc_autoreleasePoolPop(v6);
  }

- (void)moveEffectContainersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  layerSerializer = self->_layerSerializer;
  if (layerSerializer) {
    -[MCContainerSerializer movePlugsAtIndices:toIndex:](layerSerializer, "movePlugsAtIndices:toIndex:", a3, a4);
  }
  id v8 = [a3 firstIndex];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexGreaterThanIndex:i])
      -[MPLayer reconnectTransitionForEffectContainerAtIndex:](self, "reconnectTransitionForEffectContainerAtIndex:", i);
  }

  id v10 = -[NSMutableArray objectsAtIndexes:](self->super._effectContainers, "objectsAtIndexes:", a3);
  -[NSLock lock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "lock");
  -[NSMutableArray removeObjectsAtIndexes:](self->super._effectContainers, "removeObjectsAtIndexes:", a3);
  -[NSMutableArray insertObjects:atIndexes:]( self->super._effectContainers,  "insertObjects:atIndexes:",  v10,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v10 count]));
  -[NSLock unlock](-[MPLayerInternal containerLock](self->super._internal, "containerLock"), "unlock");
  -[MPLayer resetStartTimes](self, "resetStartTimes");
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->super._audioPlaylist;
  if (audioPlaylist)
  {
    -[MPAudioPlaylist setParentObject:](audioPlaylist, "setParentObject:", 0LL);
    -[MPAudioPlaylist setMontage:](self->super._audioPlaylist, "setMontage:", 0LL);
    -[MPAudioPlaylist setAudioPlaylist:](self->super._audioPlaylist, "setAudioPlaylist:", 0LL);

    self->super._audioPlaylist = 0LL;
  }

  if (a3)
  {
    double v6 = (MPAudioPlaylist *)a3;
    self->super._audioPlaylist = v6;
    -[MPAudioPlaylist setParentObject:](v6, "setParentObject:", self);
    if (self->_layerSerializer)
    {
      -[MPAudioPlaylist setMontage:](self->super._audioPlaylist, "setMontage:", self->super._montage);
      -[MPAudioPlaylist setAudioPlaylist:]( self->super._audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_layerSerializer, "audioPlaylistCreateIfNeeded"));
    }
  }

- (id)container
{
  return self->_layerSerializer;
}

- (void)setLayerSerializer:(id)a3
{
  id v5 = (MCContainerSerializer *)a3;
  self->_layerSerializer = v5;
  if (v5)
  {
    double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (-[NSMutableArray count](self->super._effectContainers, "count"))
    {
      unint64_t v7 = 0LL;
      do
      {
        -[NSMutableArray addObject:]( v6,  "addObject:",  -[MCMontage createParallelizerContainer](self->super._montage, "createParallelizerContainer"));
        ++v7;
      }

      while (v7 < (unint64_t)-[NSMutableArray count](self->super._effectContainers, "count"));
    }

    id v8 = -[MCContainerSerializer addPlugsForContainers:](self->_layerSerializer, "addPlugsForContainers:", v6);
    -[MCContainerSerializer orderedPlugs](self->_layerSerializer, "orderedPlugs");
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    effectContainers = self->super._effectContainers;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (id i = 0LL; i != v11; id i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(effectContainers);
          }
          double v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          objc_msgSend( v15,  "setContainerParallelizer:",  -[NSMutableArray objectAtIndex:](v6, "objectAtIndex:", (char *)i + v12));
          objc_msgSend(v15, "setContainerPlug:", objc_msgSend(v8, "objectAtIndex:", (char *)i + v12));
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
        v12 += (uint64_t)i;
      }

      while (v11);
    }

    audioPlaylist = self->super._audioPlaylist;
    if (audioPlaylist)
    {
      -[MPAudioPlaylist setMontage:](audioPlaylist, "setMontage:", self->super._montage);
      -[MPAudioPlaylist setAudioPlaylist:]( self->super._audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_layerSerializer, "audioPlaylistCreateIfNeeded"));
    }

    introTransition = self->_introTransition;
    if (introTransition)
    {
      -[MCContainerSerializer setInitialTransitionID:]( self->_layerSerializer,  "setInitialTransitionID:",  -[MPTransition transitionID](introTransition, "transitionID"));
      -[MPTransition duration](self->_introTransition, "duration");
      -[MCContainerSerializer setInitialTransitionDuration:](self->_layerSerializer, "setInitialTransitionDuration:");
      -[MPTransition applyFormattedAttributes](self->_introTransition, "applyFormattedAttributes");
    }
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v18 = self->super._effectContainers;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
          [v23 setContainerParallelizer:0];
          [v23 setContainerPlug:0];
        }

        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
      }

      while (v20);
    }

    v24 = self->super._audioPlaylist;
    if (v24)
    {
      -[MPAudioPlaylist setMontage:](v24, "setMontage:", 0LL);
      -[MPAudioPlaylist setAudioPlaylist:](self->super._audioPlaylist, "setAudioPlaylist:", 0LL);
    }
  }

@end