stk.v.9.0
WrittenBy    STK_v9.2.2

BEGIN Chain

Name  GroundStnAccess
BEGIN Definition

   Type        Chain
   Operator    Or
   Order       1
   Recompute   Yes
   IntervalType    0
   ComputeIntervalStart    0.000000
   ComputeIntervalStop     86400.000000
   UseSaveIntervalFile    No
   UseMinAngle     No
   UseMaxAngle     No
   UseMinLinkTime     No
   LTDelayCriterion    2.000000
   TimeConvergence     0.005000
   AbsValueConvergence 1.000000e-014
   RelValueConvergence 1.000000e-008
   MaxTimeStep         360.000000
   MinTimeStep         1.000000e-002
   UseLightTimeDelay   Yes
    DetectEventsUsingSamplesOnly No
    Object  Satellite/RepeatSat/Sensor/ToStations
    Object  Constellation/GroundNetwork
   SaveMode    1
BEGIN StrandAccesses

  Strand    Satellite/RepeatSat/Sensor/ToStations To Facility/Holt
  Strand    Satellite/RepeatSat/Sensor/ToStations To Facility/Nome
    Start    28841.999999999618
    Stop     29724
    Start    34754.999999999614
    Stop     35645
    Start    40647
    Stop     41511
    Start    46800
    Stop     47372
    Start    52373
    Stop     52683
    Start    58277
    Stop     59168
    Start    136959
    Stop     137834
    Start    142841
    Stop     143737
    Start    203895
    Stop     204787
    Start    209804
    Stop     210687
    Start    215688
    Stop     216000
    Start    221548
    Stop     222413
    Start    227415
    Stop     227729
    Start    233342
    Stop     234000
  Strand    Satellite/RepeatSat/Sensor/ToStations To Facility/Scranton
    Start    34007
    Stop     34716.000000000386
    Start    39770
    Stop     40604
    Start    118683
    Stop     119259
    Start    124368
    Stop     125225
    Start    203394
    Stop     203787
    Start    208992
    Stop     209783
    Start    214820
    Stop     215656
    Start    220927
    Stop     221496
END StrandAccesses

   UseLoadIntervalFile    No

END Definition

BEGIN Extensions
    
    BEGIN Graphics

BEGIN Attributes

StaticColor					#0000ff
AnimationColor					#ffff00
AnimationLineWidth					2.000000
StaticLineWidth					3.000000

END Attributes

BEGIN Graphics

    ShowStatic		Off
    ShowAnimationHighlight		On
    ShowAnimationLine		Off
    ShowLinkDirection		Off

END Graphics
    END Graphics
    
    BEGIN ADFFileData
    END ADFFileData
    
    BEGIN Desc
    END Desc
    
    BEGIN VO
    END VO

END Extensions

END Chain

