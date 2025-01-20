@interface SKEraseVolume
+ (void)reProbeWithDisk:(id)a3 isEncrypted:(BOOL)a4;
- (BOOL)requiresEraseDiskForAPFS;
- (id)createStateMachineWithError:(id *)a3;
- (id)syncDiskFromDaemon:(id)a3 error:(id *)a4;
@end

@implementation SKEraseVolume

- (id)syncDiskFromDaemon:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allDisks]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000153BC;
  v15[3] = &unk_100045160;
  id v8 = v5;
  id v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v9]);

  if ([v10 count] == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  }

  else
  {
    id v17 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  300LL,  v12,  0LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v13, a4));
  }

  return v11;
}

- (BOOL)requiresEraseDiskForAPFS
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 wholeDiskForDisk:v4]);

  if ([v5 canPartitionDisk])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
    unsigned int v7 = [v6 isEqualToString:kSKDiskTypeGPTWholeDisk] ^ 1;
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (void)reProbeWithDisk:(id)a3 isEncrypted:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 container]);
    id v5 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 container]);
      unsigned int v10 = [v9 isLiveFSAPFSDisk];

      id v5 = v7;
      if (v10)
      {
        id v5 = (id)objc_claimAutoreleasedReturnValue([v7 container]);
      }
    }
  }

  if (([v5 isLiveFSAPFSDisk] & 1) != 0
    || (uint64_t v26 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk), (objc_opt_isKindOfClass(v5, v26) & 1) == 0)
    && (uint64_t v27 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk), (objc_opt_isKindOfClass(v5, v27) & 1) == 0))
  {
    if (![v5 isLiveFSAPFSDisk] || a4)
    {
      id v33 = 0LL;
      unsigned __int8 v28 = [v5 reProbeWithError:&v33];
      id v18 = v33;
      if ((v28 & 1) != 0) {
        goto LABEL_25;
      }
      id v29 = sub_10000E2BC();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
        __int16 v37 = 2112;
        id v38 = v5;
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Failed to reProbe %@, %@", buf, 0x20u);
      }
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 disksNotificationsWaiters]);

      v13 = objc_alloc(&OBJC_CLASS___SKDiskNotificationWaiter);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
      v15 = -[SKDiskNotificationWaiter initWithDiskIdentifier:](v13, "initWithDiskIdentifier:", v14);

      id v16 = v12;
      objc_sync_enter(v16);
      [v16 addObject:v15];
      objc_sync_exit(v16);

      id v34 = 0LL;
      unsigned int v17 = [v5 reProbeWithError:&v34];
      id v18 = v34;
      if (v17)
      {
        v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SKDiskNotificationWaiter semaphore](v15, "semaphore"));
        dispatch_time_t v20 = dispatch_time(0LL, 30000000000LL);
        BOOL v21 = dispatch_semaphore_wait(v19, v20) == 0;

        id v22 = sub_10000E2BC();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        v24 = v23;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
            *(_DWORD *)buf = 136315394;
            v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
            __int16 v37 = 2112;
            id v38 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Received disk notification for %@",  buf,  0x16u);
          }
        }

        else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
          *(_DWORD *)buf = 136315394;
          v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
          __int16 v37 = 2112;
          id v38 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Timeout waiting for notification about %@",  buf,  0x16u);
        }
      }

      else
      {
        id v31 = sub_10000E2BC();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v36 = "+[SKEraseVolume(Daemon) reProbeWithDisk:isEncrypted:]";
          __int16 v37 = 2112;
          id v38 = v5;
          __int16 v39 = 2112;
          id v40 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to reProbe %@ (LiveFS), %@",  buf,  0x20u);
        }
      }

      v30 = (os_log_s *)v16;
      objc_sync_enter(v30);
      -[os_log_s removeObject:](v30, "removeObject:", v15);
      objc_sync_exit(v30);
    }

    goto LABEL_25;
  }

  id v18 = 0LL;
LABEL_25:
}

- (id)createStateMachineWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));

  if (v5) {
    goto LABEL_3;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume diskRepresentation](self, "diskRepresentation"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 knownDiskForDictionary:v7]);
  -[SKEraseVolume setDisk:](self, "setDisk:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
  if (v9)
  {
LABEL_3:
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume validateWithError:](self, "validateWithError:", a3));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 filesystem]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      unsigned int v15 = [v12 isValidName:v14 error:a3];

      if (v15)
      {
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472LL;
        v114[2] = sub_100016378;
        v114[3] = &unk_100044C40;
        v114[4] = self;
        v115 = @"probeFinishedEvent";
        id v16 = objc_retainBlock(v114);
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472LL;
        v112[2] = sub_1000164F4;
        v112[3] = &unk_100044C40;
        v112[4] = self;
        v113 = @"umountFinishedEvent";
        v102 = objc_retainBlock(v112);
        v110[0] = _NSConcreteStackBlock;
        v110[1] = 3221225472LL;
        v110[2] = sub_10001668C;
        v110[3] = &unk_100044C40;
        v110[4] = self;
        v111 = @"volumeDeletedEvent";
        v101 = objc_retainBlock(v110);
        v108[0] = _NSConcreteStackBlock;
        v108[1] = 3221225472LL;
        v108[2] = sub_100016914;
        v108[3] = &unk_100044C40;
        v108[4] = self;
        v109 = @"newfsFinishedEvent";
        unsigned int v17 = objc_retainBlock(v108);
        v106[0] = _NSConcreteStackBlock;
        v106[1] = 3221225472LL;
        v106[2] = sub_100016A60;
        v106[3] = &unk_100044C40;
        v106[4] = self;
        v107 = @"rePartitionedEvent";
        v100 = objc_retainBlock(v106);
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472LL;
        v103[2] = sub_100016C6C;
        v103[3] = &unk_100045188;
        v103[4] = self;
        v99 = v17;
        v104 = @"volumeCreatedEvent";
        id v105 = v99;
        v98 = objc_retainBlock(v103);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 filesystem]);
        dispatch_time_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 majorType]);
        if ([v20 isEqualToString:@"apfs"])
        {
          unsigned int v21 = -[SKEraseVolume requiresEraseDiskForAPFS](self, "requiresEraseDiskForAPFS");

          if (v21)
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
            v24 = (void *)objc_claimAutoreleasedReturnValue([v22 wholeDiskForDisk:v23]);

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[SKPartitionDescriptor descriptorWithVolume:]( &OBJC_CLASS___SKPartitionDescriptor,  "descriptorWithVolume:",  v25));
            v119 = v26;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v119,  1LL));
            unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue( +[SKEraseDisk eraseDiskWithRootDisk:descriptors:error:]( &OBJC_CLASS___SKEraseDisk,  "eraseDiskWithRootDisk:descriptors:error:",  v24,  v27,  a3));

            if (v28)
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v24 children]);
              v30 = v29;
              if (v29 && (unint64_t)[v29 count] >= 2)
              {
                id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:0]);
                -[SKEraseVolume setDisk:](self, "setDisk:", v31);
              }

              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume progress](self, "progress"));
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v28 progress]);
              id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume progress](self, "progress"));
              objc_msgSend(v32, "chainChildProgress:withPendingUnitCount:", v33, objc_msgSend(v34, "totalUnitCount"));

              v35 = (void *)objc_claimAutoreleasedReturnValue([v28 createStateMachineWithError:a3]);
            }

            else
            {
              id v85 = sub_10000E2BC();
              v30 = (void *)objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v118 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]";
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_LOG_TYPE_ERROR,  "%s: Failed to create eraser for unsupported partition scheme change",  buf,  0xCu);
              }

              v35 = 0LL;
            }

            goto LABEL_34;
          }
        }

        else
        {
        }

        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 filesystem]);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 majorType]);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 filesystem]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 majorType]);
        unsigned __int8 v44 = [v40 isEqualToString:v43];

        if ((v44 & 1) != 0) {
          goto LABEL_16;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 filesystem]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 majorType]);
        if ([v48 isEqualToString:@"apfs"])
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
          uint64_t v50 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
          char isKindOfClass = objc_opt_isKindOfClass(v49, v50);

          if ((isKindOfClass & 1) != 0)
          {
LABEL_16:
            v45 = @"eraseToSameFSEvent";
            goto LABEL_24;
          }
        }

        else
        {
        }

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume descriptor](self, "descriptor"));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 filesystem]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 majorType]);
        unsigned int v55 = [v54 isEqualToString:@"apfs"];

        if (v55) {
          v45 = @"eraseToAPFSEvent";
        }
        else {
          v45 = @"eraseTodifferentFSEvent";
        }
LABEL_24:
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        unsigned int v57 = [v56 canPartitionDisk];

        if (v57) {
          v58 = @"rePartitionedEvent";
        }
        else {
          v58 = v45;
        }
        v90 = v58;
        v59 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"eraseToSameFSEvent",  (uint64_t)v99,  (uint64_t)@"nonAPFSDiskState");
        uint64_t v96 = objc_claimAutoreleasedReturnValue(v59);
        v116[0] = v96;
        v60 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"newfsFinishedEvent",  (uint64_t)v16,  (uint64_t)@"nonAPFSDiskState");
        uint64_t v95 = objc_claimAutoreleasedReturnValue(v60);
        v116[1] = v95;
        v61 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"probeFinishedEvent",  (uint64_t)v102,  (uint64_t)@"nonAPFSDiskState");
        uint64_t v94 = objc_claimAutoreleasedReturnValue(v61);
        v116[2] = v94;
        v62 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"eraseTodifferentFSEvent",  (uint64_t)v100,  (uint64_t)@"nonAPFSDiskState");
        v93 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v116[3] = v93;
        v63 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"rePartitionedEvent",  (uint64_t)v99,  (uint64_t)@"nonAPFSDiskState");
        v92 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v116[4] = v92;
        id v64 = sub_10000CA3C((uint64_t)@"nonAPFSDiskState", (uint64_t)@"umountFinishedEvent");
        v91 = (void *)objc_claimAutoreleasedReturnValue(v64);
        v116[5] = v91;
        v65 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"eraseToAPFSEvent",  (uint64_t)v100,  (uint64_t)@"APFSDiskState");
        v89 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v116[6] = v89;
        v66 = sub_10000C9EC( (uint64_t)@"APFSDiskState",  (uint64_t)@"eraseTodifferentFSEvent",  (uint64_t)v101,  (uint64_t)@"nonAPFSDiskState");
        v88 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v116[7] = v88;
        v67 = sub_10000C9EC( (uint64_t)@"nonAPFSDiskState",  (uint64_t)@"volumeDeletedEvent",  (uint64_t)v100,  (uint64_t)@"nonAPFSDiskState");
        v87 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v116[8] = v87;
        v68 = sub_10000C9EC( (uint64_t)@"APFSDiskState",  (uint64_t)@"eraseToSameFSEvent",  (uint64_t)v98,  (uint64_t)@"APFSDiskState");
        v86 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v116[9] = v86;
        v69 = sub_10000C9EC( (uint64_t)@"APFSDiskState",  (uint64_t)@"rePartitionedEvent",  (uint64_t)v99,  (uint64_t)@"APFSDiskState");
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v116[10] = v70;
        v97 = v16;
        v71 = sub_10000C9EC( (uint64_t)@"APFSDiskState",  (uint64_t)@"newfsFinishedEvent",  (uint64_t)v16,  (uint64_t)@"APFSDiskState");
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        v116[11] = v72;
        id v73 = sub_10000CA3C((uint64_t)@"APFSDiskState", (uint64_t)@"volumeCreatedEvent");
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v116[12] = v74;
        id v75 = sub_10000CA3C((uint64_t)@"APFSDiskState", (uint64_t)@"probeFinishedEvent");
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        v116[13] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v116, 14LL));
        v78 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateTransitionTable tableWithTransitionEntries:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:",  v77));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
        uint64_t v80 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
        if ((objc_opt_isKindOfClass(v79, v80) & 1) != 0)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v78,  @"APFSDiskState",  v90));
        }

        else
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume disk](self, "disk"));
          uint64_t v82 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0) {
            v83 = @"APFSDiskState";
          }
          else {
            v83 = @"nonAPFSDiskState";
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v78,  v83,  v90,  &OBJC_CLASS___SKStateTransitionTable,  v86,  v87,  v88,  v89));
        }

        v24 = (void *)v96;
        id v16 = v97;
        v30 = (void *)v94;
        unsigned __int8 v28 = (void *)v95;
LABEL_34:

        return v35;
      }
    }

    v35 = 0LL;
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseVolume diskRepresentation](self, "diskRepresentation"));
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 117LL, v36));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v37, a3));
  }

  return v35;
}

@end